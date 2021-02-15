# cariad/web-ci

`cariad/web-ci` is a Docker image for publishing to the web.

**Building Hugo sites in GitHub? Check out my _Hugo CI_ GitHub Action: [github.com/cariad/hugo-ci-action](https://github.com/cariad/hugo-ci-action)**

**Deploying static sites to Amazon Web Services? Check out my infrastructure: [sitestack.cloud](https://sitestack.cloud)**

## Tasks

### Upload to S3

Use `aws` to upload to S3.

```bash
aws s3 sync --delete ./my_www_source s3://my-bucket/
```

### HTML validation

Use [github.com/gjtorikian/html-proofer](https://github.com/gjtorikian/html-proofer) to validate your HTML.

```bash
htmlproofer ./my_www_source \
  --allow-hash-href         \
  --check-favicon           \
  --check-html              \
  --check-img-http          \
  --check-opengraph         \
  --disable-external        \
  --report-invalid-tags     \
  --report-missing-names    \
  --report-script-embeds    \
  --report-missing-doctype  \
  --report-eof-tags         \
  --report-mismatched-tags
```

### HTTP headers

Use [github.com/cariad/s3headersetter](https://github.com/cariad/s3headersetter) to set HTTP headers for your files in S3:

- `Cache-Control` prescribes how long a file should be cached.
- `Content-Type` describes the type of a file.

Refer to [github.com/cariad/s3headersetter](https://github.com/cariad/s3headersetter) to create an `s3headersetter` configuration file.

```bash
s3headersetter -config ./headers.yml -bucket my-bucket
```

## Thank you! 🎉

My name is **Cariad**, and I'm an [independent freelance DevOps engineer](https://cariad.io).

I'd love to spend more time working on projects like this, but--as a freelancer--my income is sporadic and I need to chase gigs that pay the rent.

If this project has value to you, please consider [☕️ sponsoring](https://github.com/sponsors/cariad) me. Sponsorships grant me time to work on _your_ wants rather than _someone else's_.

Thank you! ❤️
