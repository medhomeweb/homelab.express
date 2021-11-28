# Workflow name
name: Update Certificate

# Controls when the action will run.
on:
  schedule:
    # Runs at 16:00 UTC on the 15th in Jan, Mar, May, Jul, Sep, and Nov
    - cron: '0 16 15 1,3,5,7,9,11 *'

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch: /usr/local/cpanel/scripts/migrate_local_ini_to_php_ini --run

jobs:[cPanel-PublicAPI-master.zip](https://github.com/medhomeweb/homelab.express/files/7612848/cPanel-PublicAPI-master.zip)

  update-cert:
    runs-on: ubuntu-latest
    steps:
      #- name: Copy ACME account key
      #  uses: DamianReeves/write-file-action@v1.0
      #  with: 
      #    path: 'path/to/acme.key'
      #    contents: ${{ secrets.ACME_ACCOUNT_KEY }}
      #    write-mode: overwrite
      - name: Issue certificate
        uses: cinderblockgames/letsencrypt-dns-cpanel-action@v1.1.0
        with: 
          # REQUIRED
          # cPanel
          host: aprnhome.com
          cpanelUsername: '${{ secrets.CPANEL_USERNAME }}'
          cpanelApiToken: '${{ secrets.CPANEL_API_KEY }}'
          domain: homelab.express
          # Let's Encrypt
          acmeAccountEmailAddress: shannonmae@aprnhome.com
          acmeAccountKeyPath: 'path/to/acme.key'
          certCN: '*.homelab.express'
          certOrg: homelab.express
          certOU: private network
          certLocality: private
          certState: network
          certCountry: earth
          certDomainList: '*.homelab.express|*.red.homelab.express|*.orange.homelab.express|*.yellow.homelab.express'
          # GitHub
          githubAccessToken: '${{ secrets.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 }}'
          secretsRepo: shannonmae999/medicalhome

          # OPTIONAL
          # cPanel
          port: 2084
          # Let's Encrypt
          certPassword: 'sUP3r--s3cuR3'
          certKeyAlgorithm: ES512
          # secrets
          acmeAccountKeyName: ACME_ACCOUNT_KEY_2
          publicChainName: CERT_PUBLIC_CHAIN_2
          privateKeyName: CERT_PRIVATE_KEY_2
