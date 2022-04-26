Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2089.outbound.protection.outlook.com [40.107.101.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAF210E2FD
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 13:26:24 +0000 (UTC)
Message-ID: <a1d52d01-2453-df4d-375d-a248398a9c76@amd.com>
Date: Tue, 26 Apr 2022 09:26:20 -0400
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20220422113553.19181-1-petri.latvala@intel.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220422113553.19181-1-petri.latvala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] gitlab-CI: Temporarily disable armhf
 and arm64 selfchecks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-04-22 07:35, Petri Latvala wrote:
> gitlab runners have sporadic trouble executing the arm binaries. The
> arm testing needs to be converted to be run on native arm hardware
> instead of through qemu.
> 
> Compilation for armhf and arm64 are kept so they don't regress.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> ---
>   .gitlab-ci.yml | 67 +++++++++++++++++++++++++-------------------------
>   1 file changed, 34 insertions(+), 33 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index fd0ca7cb..55559303 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -193,39 +193,40 @@ test:ninja-test-minimal:
>     stage: test
>     script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
>   
> -test:ninja-test-arm64:
> -  tags:
> -    - gstreamer
> -  retry: 2
> -  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
> -  dependencies:
> -    - build:tests-debian-meson-arm64
> -  stage: test
> -  script:
> -    - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
> -    - env > build/envdump.txt
> -    - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> -  artifacts:
> -    paths:
> -      - build
> -    when: on_failure
> -
> -test:ninja-test-armhf:
> -  tags:
> -    - gstreamer
> -  retry: 2
> -  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
> -  dependencies:
> -    - build:tests-debian-meson-armhf
> -  stage: test
> -  script:
> -    - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
> -    - env > build/envdump.txt
> -    - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> -  artifacts:
> -    paths:
> -      - build
> -    when: on_failure
> +# arm testing temporarily disabled until converted to run on native arm HW
> +# test:ninja-test-arm64:
> +#   tags:
> +#     - gstreamer
> +#   retry: 2
> +#   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
> +#   dependencies:
> +#     - build:tests-debian-meson-arm64
> +#   stage: test
> +#   script:
> +#     - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
> +#     - env > build/envdump.txt
> +#     - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> +#   artifacts:
> +#     paths:
> +#       - build
> +#     when: on_failure
> +#
> +# test:ninja-test-armhf:
> +#   tags:
> +#     - gstreamer
> +#   retry: 2
> +#   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
> +#   dependencies:
> +#     - build:tests-debian-meson-armhf
> +#   stage: test
> +#   script:
> +#     - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
> +#     - env > build/envdump.txt
> +#     - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> +#   artifacts:
> +#     paths:
> +#       - build
> +#     when: on_failure
>   
>   test:ninja-test-mips:
>     tags:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
