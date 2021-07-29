Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D1E6EDB2
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 14:44:07 +0000 (UTC)
Date: Thu, 29 Jul 2021 17:46:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YQK/SeM3HliYlOna@platvala-desk.ger.corp.intel.com>
References: <20210729143755.349932-1-daniels@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729143755.349932-1-daniels@collabora.com>
Subject: Re: [igt-dev] [PATCH] ci: Use FDO_CI_CONCURRENT to limit build/test
 concurrency
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 03:37:55PM +0100, Daniel Stone wrote:
> ${FDO_CI_CONCURRENT} is set to an appropriate concurrency on our shared
> runners. Using all available CPUs will just DoS the world and would
> explain a lot about the timeouts.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> ---
>  .gitlab-ci.yml | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3b0e98ae..b5edfee8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -64,9 +64,9 @@ build:tests-fedora:
>    stage: build
>    script:
>      - meson --prefix=/opt/igt $MESON_OPTIONS build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>      - DESTDIR="$PWD/installdir" ninja -C build install
> -    - ninja -C build igt-gpu-tools-doc
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
>    artifacts:
>      paths:
>        - build
> @@ -77,7 +77,7 @@ build:tests-fedora-no-libunwind:
>    script:
>      - dnf remove -y libunwind-devel
>      - meson -Dlibunwind=disabled build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>  
>  # documentation building is different with meson<0.47
>  build:tests-fedora-oldest-meson:
> @@ -86,15 +86,15 @@ build:tests-fedora-oldest-meson:
>      - dnf remove -y meson
>      - pip install /usr/src/meson-*.tar.gz
>      - meson $MESON_OPTIONS build
> -    - ninja -C build || ninja -C build -j 1
> -    - ninja -C build igt-gpu-tools-doc
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
>  
>  # ensure igt_nouveau stubs build when nouveau support for libdrm is disabled
>  build:tests-fedora-no-libdrm-nouveau:
>    stage: build
>    script:
>      - meson -Dlibdrm_drivers= build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>  
>  build:tests-fedora-clang:
>    stage: build
> @@ -102,7 +102,7 @@ build:tests-fedora-clang:
>      CC: clang
>    script:
>      - meson $MESON_OPTIONS build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
>        - build
> @@ -112,7 +112,7 @@ build:tests-debian-meson:
>    stage: build
>    script:
>      - meson $MESON_OPTIONS build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>      - cp build/tests/test-list.txt meson-test-list.txt
>    artifacts:
>      paths:
> @@ -123,7 +123,7 @@ build:tests-debian-minimal:
>    stage: build
>    script:
>      - meson -Dtests=disabled -Dlibdrm_drivers="" build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
>        - build
> @@ -134,7 +134,7 @@ build:tests-debian-meson-armhf:
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
>      - meson --cross-file meson-cross-armhf.txt build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
>        - build
> @@ -145,7 +145,7 @@ build:tests-debian-meson-arm64:
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
>      - meson --cross-file meson-cross-arm64.txt build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
>        - build
> @@ -156,7 +156,7 @@ build:tests-debian-meson-mips:
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
>      - meson --cross-file meson-cross-mips.txt build
> -    - ninja -C build || ninja -C build -j 1
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>    artifacts:
>      paths:
>        - build
> @@ -168,7 +168,7 @@ test:ninja-test:
>    dependencies:
>      - build:tests-fedora
>    stage: test
> -  script: ninja -C build test
> +  script: meson -C build test --num-processes ${FDO_CI_CONCURRENT:-4}

usage: meson [-h] {setup,configure,dist,install,introspect,init,test,wrap,subprojects,help,rewrite,compile} ...
meson: error: unrecognized arguments: -C --num-processes 4


Doesn't ninja -C build -j $... test   work for this?


-- 
Petri Latvala


>  
>  test:ninja-test-clang:
>    retry: 2
> @@ -177,7 +177,7 @@ test:ninja-test-clang:
>    variables:
>      CC: clang
>    stage: test
> -  script: ninja -C build test
> +  script: meson -C build test --num-processes ${FDO_CI_CONCURRENT:-4}
>  
>  test:ninja-test-minimal:
>    retry: 2
> @@ -185,7 +185,7 @@ test:ninja-test-minimal:
>    dependencies:
>      - build:tests-debian-minimal
>    stage: test
> -  script: ninja -C build test
> +  script: meson -C build test --num-processes ${FDO_CI_CONCURRENT:-4}
>  
>  test:ninja-test-arm64:
>    retry: 2
> @@ -196,7 +196,7 @@ test:ninja-test-arm64:
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
>      - env > build/envdump.txt
> -    - ninja -C build test
> +    - meson -C build test --num-processes ${FDO_CI_CONCURRENT:-4}
>    artifacts:
>      paths:
>        - build
> @@ -211,7 +211,7 @@ test:ninja-test-armhf:
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
>      - env > build/envdump.txt
> -    - ninja -C build test
> +    - meson -C build test --num-processes ${FDO_CI_CONCURRENT:-4}
>    artifacts:
>      paths:
>        - build
> @@ -226,7 +226,7 @@ test:ninja-test-mips:
>    script:
>      - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
>      - env > build/envdump.txt
> -    - ninja -C build test
> +    - meson -C build test --num-processes ${FDO_CI_CONCURRENT:-4}
>    artifacts:
>      paths:
>        - build
> @@ -255,7 +255,7 @@ pages:
>      - build:tests-fedora
>    stage: deploy
>    script:
> -    - ninja -C build igt-gpu-tools-doc
> +    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
>      - cp -r build/docs/reference/igt-gpu-tools/html public
>    artifacts:
>      paths:
> -- 
> 2.31.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
