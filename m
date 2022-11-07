Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA5610E2EB
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 11:44:58 +0000 (UTC)
Date: Mon, 7 Nov 2022 12:44:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2jvtXOQ13pcjwN0@kamilkon-desk1>
References: <20221102130925.2282216-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221102130925.2282216-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] gitlab-CI: Temporarily disable mips
 selfchecks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-11-02 at 15:09:25 +0200, Petri Latvala wrote:
> Like with arm, gitlab runners have sporadic trouble executing the mips
> binaries through binfmt_misc + qemu.
> 
> Compilation for mips is kept so that at least doesn't regress.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  .gitlab-ci.yml | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 55559303..0263dab3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -228,22 +228,23 @@ test:ninja-test-minimal:
>  #       - build
>  #     when: on_failure
>  
> -test:ninja-test-mips:
> -  tags:
> -    - gstreamer
> -  retry: 2
> -  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
> -  dependencies:
> -    - build:tests-debian-meson-mips
> -  stage: test
> -  script:
> -    - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
> -    - env > build/envdump.txt
> -    - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> -  artifacts:
> -    paths:
> -      - build
> -    when: on_failure
> +# mips testing temporarily disabled
> +# test:ninja-test-mips:
> +#   tags:
> +#     - gstreamer
> +#   retry: 2
> +#   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
> +#   dependencies:
> +#     - build:tests-debian-meson-mips
> +#   stage: test
> +#   script:
> +#     - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
> +#     - env > build/envdump.txt
> +#     - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> +#   artifacts:
> +#     paths:
> +#       - build
> +#     when: on_failure
>  
>  test:list-undocumented-tests:
>    dependencies:
> -- 
> 2.30.2
> 
