Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265D6897FF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2019 10:13:29 +0000 (UTC)
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Date: Wed, 28 Aug 2019 10:13:25 +0000
Message-ID: <7f270e2e5fdd483ebdfc6c6db638917bd31abfd1.camel@intel.com>
References: <20190827140202.3347-1-oleg.vasilev@intel.com>
 <20190827140202.3347-6-oleg.vasilev@intel.com>
 <20190828060352.2l2l6lvm5iq2hicr@ahiler-desk1.fi.intel.com>
In-Reply-To: <20190828060352.2l2l6lvm5iq2hicr@ahiler-desk1.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 6/6] gitlab-ci: introduce containers with
 IGT inside
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0932101160=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0932101160==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-o2gxk2Qo0RuZssfZgPWW"

--=-o2gxk2Qo0RuZssfZgPWW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-28 at 09:03 +0300, Arkadiusz Hiler wrote:
> On Tue, Aug 27, 2019 at 05:02:02PM +0300, Oleg Vasilev wrote:
> > Currently, the containers are used only to build IGT. We also want
> > to
> > have an option to run IGT inside a container. For this, new build
> > stage
> > is added.
> >=20
> > Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
> > ---
> >  .gitlab-ci.yml            | 25 +++++++++++++++++++++++-
> >  .gitlab-ci/docker-help.sh | 41
> > +++++++++++++++++++++++++++++++++++++++
> >  Dockerfile                | 14 +++++++++++++
> >  3 files changed, 79 insertions(+), 1 deletion(-)
> >  create mode 100755 .gitlab-ci/docker-help.sh
> >  create mode 100644 Dockerfile
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 0ac12318..76862514 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -16,6 +16,7 @@ stages:
> >    - build
> >    - test
> >    - deploy
> > +  - containers
>=20
> I am not sure it is the right call to make that a stage after deploy.
>=20
> deploy:pages is buggy and fails often:
> https://gitlab.freedesktop.org/freedesktop/freedesktop/issues/46
>=20
> For pre-merge it should be ok, if it proves to be troublesome we can
> shuffle it around then.

Can I just swap deploy and containers?=20

>=20
> >  ################# BUILD CONTAINERS #######################
> > =20
> > @@ -85,12 +86,15 @@ build-containers:build-fedora:
> >  build:tests-fedora:
> >    stage: build
> >    script:
> > -    - meson $MESON_OPTIONS build
> > +    - meson --prefix=3D`pwd`/opt-igt $MESON_OPTIONS build
> >      - ninja -C build
> > +    - ninja -C build install
> >      - ninja -C build igt-gpu-tools-doc
> > +    - ls opt-igt
>=20
> Leftover ls?
>=20
> >    artifacts:
> >      paths:
> >        - build
> > +      - opt-igt
> > =20
> >  build:tests-fedora-no-libunwind:
> >    stage: build
> > @@ -273,3 +277,22 @@ pages:
> >    only:
> >      - master
> > =20
> > +############## CONTAINERS ####################
> > +
> > +
> > +containers:igt:
> > +  stage: containers
> > +  image: docker:stable
> > +  services:
> > +    - docker:dind
> > +  dependencies:
> > +    - build:tests-fedora
> > +  variables:
> > +    DOCKER_HOST: tcp://docker:2375
> > +    DOCKER_DRIVER: overlay2
> > +    FORCE_REBUILD: 1
> > +  script:
> > +    - docker login -u gitlab-ci-token -p $CI_JOB_TOKEN
> > $CI_REGISTRY
> > +    - docker pull $CI_REGISTRY/$CI_PROJECT_PATH/build-
> > fedora:$CI_COMMIT_REF_NAME
> > +    - docker tag $CI_REGISTRY/$CI_PROJECT_PATH/build-
> > fedora:$CI_COMMIT_REF_NAME build-fedora
>=20
> You forgot to change those to use commit-$CI_COMMIT_SHA:
> https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/540405

Right, I'll retest the series over a clear registry to make sure
everything builds correctly.=20

>=20
> > +    - .gitlab-ci/pull-or-rebuild.sh Dockerfile igt
> > diff --git a/.gitlab-ci/docker-help.sh b/.gitlab-ci/docker-help.sh
> > new file mode 100755
> > index 00000000..6e3f8021
> > --- /dev/null
> > +++ b/.gitlab-ci/docker-help.sh
> > @@ -0,0 +1,41 @@
> > +#!/bin/sh
> > +#
> > +# Copyright =C2=A9 2019 Intel Corporation
> > +#
> > +# Permission is hereby granted, free of charge, to any person
> > obtaining a
> > +# copy of this software and associated documentation files (the
> > "Software"),
> > +# to deal in the Software without restriction, including without
> > limitation
> > +# the rights to use, copy, modify, merge, publish, distribute,
> > sublicense,
> > +# and/or sell copies of the Software, and to permit persons to
> > whom the
> > +# Software is furnished to do so, subject to the following
> > conditions:
> > +#
> > +# The above copyright notice and this permission notice (including
> > the next
> > +# paragraph) shall be included in all copies or substantial
> > portions of the
> > +# Software.
> > +#
> > +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > EXPRESS OR
> > +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY,
> > +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> > EVENT SHALL
> > +# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR OTHER
> > +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING
> > +# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > OTHER DEALINGS
> > +# IN THE SOFTWARE.
> > +
> > +TEST_LIST=3D$(find /opt/igt/libexec/igt-gpu-tools -type f -printf
> > "%f ")
> > +cat << END
> > +This is a docker container, packaged with the igt-gpu-tools.
> > + - igt_runner is in the \$PATH. In order for the results to be
> > available on the
> > +   host system, the directory has to be made available inside,
> > e.g.
> > +     docker run -v results:/tmp/results igt-final igt_runner
> > /tmp/results
> > + - The test lists are in /opt/igt/share/igt-gpu-tools
> > + - The test binaries are in \$IGT_TEST_ROOT=3D$IGT_TEST_ROOT
> > +
> > +In order for the graphic devices to be available inside the docker
> > container,
> > +those either need to be mapped with --device or the container
> > needs to be run
> > +in --privileged mode.
> > +
> > +Contents of /opt/igt/libexec/igt-gpu-tools: $TEST_LIST
> > +PATH: $PATH
> > +LD_LIBRARY_PATH: $LD_LIBRARY_PATH
> > +IGT_TEST_ROOT: $IGT_TEST_ROOT
> > +END
> > diff --git a/Dockerfile b/Dockerfile
> > new file mode 100644
> > index 00000000..b601aecd
> > --- /dev/null
> > +++ b/Dockerfile
> > @@ -0,0 +1,14 @@
> > +# Version number to bump for force image rebuild: 0
> > +FROM build-fedora
> > +
> > +RUN dnf install -y findutils && \
> > +        dnf clean all
>=20
> I think we should move those to the base image - `dnf install` seems
> to
> be the most failure-prone part of this whole endeavor. It's the most
> common reason that igt-ci-tags for pre-merge fails (after the other
> issues were addressed).

Well, using build image as a base for igt container should be only
temporarily. Once better base image is ready, it should then be moved there=
.

>=20
> With the things above fixed, the whole series is:
> Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
>=20

--=-o2gxk2Qo0RuZssfZgPWW
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA4MjgxMDEzMjRaMCMGCSqGSIb3DQEJBDEWBBTtQOcC
PgQ0ebUEb4O9AuOx+Xyo6DANBgkqhkiG9w0BAQEFAASCAQBYOQw9PY74UNtAkxdq97eiHt0pS5DG
iNl/zvcGThBGiGombi6tFNPgN/D1zEK8OM6d1ooujLc0kUJkhqz7vS7VkUXhnzCIDWODQ0N2iy6z
roec+JZVclPgY/GsShwe15aq/QenjrmIpWspugYtn/VwQLjVVOdoziDwImrYO5tFLXL3NaTheXOq
Ts1AFePoHSce4LVsAdxVfL2POCukI/VAHDb3fGPZoK1OSWhqvRvFl2n5g7ED+FXt/MpPLVzysYgf
zvASFJnycgcKlMPOy2czW3R4UH2Bbn0LQBhyLnZwybsKzm5xr4H4wiMR+OeVKH/u97IchIavn2Bp
FLd3tLnIAAAAAAAA


--=-o2gxk2Qo0RuZssfZgPWW--

--===============0932101160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0932101160==--
