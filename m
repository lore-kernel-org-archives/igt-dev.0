Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D247410E34E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Sep 2023 07:14:33 +0000 (UTC)
Date: Tue, 19 Sep 2023 09:14:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230919091428.0ced7743@maurocar-mobl2>
In-Reply-To: <20230831170245.38089-1-kamil.konieczny@linux.intel.com>
References: <20230831170245.38089-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/example-debug-error: added
 script for debugging compilation errors on gitlab
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 31 Aug 2023 19:02:45 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Added example script to help quick start debugging compilation
> errors seen on GitLab fdo when building new patch or patchset.
>=20
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  scripts/example-debug-error.sh | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100755 scripts/example-debug-error.sh
>=20
> diff --git a/scripts/example-debug-error.sh b/scripts/example-debug-error=
.sh
> new file mode 100755
> index 000000000..755c90a25
> --- /dev/null
> +++ b/scripts/example-debug-error.sh
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright =C2=A9 2023 Intel Corporation
> +#
> +# When you see compilation error in fdo GitLab follow link with
> +# error to find out used registry, it should be at top of log,
> +# for example:
> +# Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-c=
i-tags/build-debian-arm64:commit-1af4386ff3086df670e10af3a2bfd89993af3b0a
> +#
> +# Take registry and put it into POD_IGT var below (default will use debi=
an build for amd64/x64):
> +#
> +POD_IGT=3Dregistry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commi=
t-1af4386ff3086df670e10af3a2bfd89993af3b0a
> +
> +mkdir -p /tmp/igt-build
> +cp -R * /tmp/igt-build/
> +sudo podman run -i -t -v /tmp/igt-build/:/opt/builds --privileged ${POD_=
IGT}
> +
> +# you can debug now with:
> +#
> +# cd /opt/builds
> +# meson build
> +# ninja -C build
> +#
> +# or for cross-compilation for arm64 (for other arch remember to change =
registry):
> +#
> +# export PKG_CONFIG_PATH=3D/usr/lib/aarch64-linux-gnu/pkgconfig/
> +# meson --cross-file meson-cross-arm64.txt build
> +# ninja -C build

There are steps missing here, as the downloaded image doesn't contain the
cross-compiler toolchain to install the packages listed at
Dockerfile.build-debian-arm64.

On my tests, those steps are needed:

	dpkg --add-architecture arm64
	apt-get update --allow-releaseinfo-change
	apt-get install -y gcc-aarch64-linux-gnu libatomic1:arm64 libpciaccess-dev=
:arm64 libkmod-dev:arm64 libprocps-dev:arm64 libunwind-dev:arm64 libdw-dev:=
arm64 zlib1g-dev:arm64 liblzma-dev:arm64 libcairo-dev:arm64 libpixman-1-dev=
:arm64 libudev-dev:arm64 libgsl-dev:arm64 libasound2-dev:arm64 libjson-c-de=
v:arm64 libcurl4-openssl-dev:arm64 libxrandr-dev:arm64 libxv-dev:arm64 libd=
rm-dev:arm64 qemu-user qemu-user-static

Note: --allow-releaseinfo-change is needed due to the downloaded
from registry.freedesktop.org is already EOL.

Still, something else is missing, as ld is failing with:

/usr/lib/gcc-cross/aarch64-linux-gnu/8/../../../../aarch64-linux-gnu/bin/ld=
: skipping incompatible /usr/lib/x86_64-linux-gnu/libm.a when searching for=
 -lm
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

Please fix the instructions.

Regards,
Mauro
