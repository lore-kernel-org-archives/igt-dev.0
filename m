Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D28D6ECD7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2020 12:34:08 +0000 (UTC)
Date: Thu, 16 Jan 2020 14:34:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200116123404.GS25209@platvala-desk.ger.corp.intel.com>
References: <20200116122759.1032392-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116122759.1032392-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] .gitlab-ci: Retry `ninja test` 2 times
 in case of failures
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 02:27:59PM +0200, Arkadiusz Hiler wrote:
> Freedesktop CI/CD runners are shared machines with a lot of cores and
> they accept many parallel jobs coming from multiple projects. There
> are no resources guarantees, which leads to the sporadic slowness.
> 
> This makes our `ninja test` fail in extreme cases.
> 
> We have already tried to bump the timoeut limit for the slower tests in
                                    ^^^^^^^
				            timeout



> e941638ce652 ("runner/tests: Increase the timeout by 10x") which helped
> a bit, but we still fail from time to time.
> 
> As an extra mitigation let's make the CI do 2 retries (= total of 3
> attempts) before finally failing the whole pipeline.
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Issue: https://gitlab.freedesktop.org/freedesktop/freedesktop/issues/197
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
> 
> This emails is sent with a header that makes Patchwork ignore it as there is no
> use in running this change on a real hardware. You can see gitlab's pipeline
> results for this patch here:
> 
> https://gitlab.freedesktop.org/ivyl/igt/pipelines/98032
> 
>  .gitlab-ci.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9a4dcb71..c5a6bd9e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -168,12 +168,14 @@ build:tests-debian-autotools:
>  #################### TEST ##########################
>  
>  test:ninja-test:
> +  retry: 2
>    dependencies:
>      - build:tests-fedora
>    stage: test
>    script: ninja -C build test
>  
>  test:ninja-test-clang:
> +  retry: 2
>    dependencies:
>      - build:tests-fedora-clang
>    variables:
> @@ -182,6 +184,7 @@ test:ninja-test-clang:
>    script: ninja -C build test
>  
>  test:ninja-test-minimal:
> +  retry: 2
>    image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
>    dependencies:
>      - build:tests-debian-minimal
> @@ -189,6 +192,7 @@ test:ninja-test-minimal:
>    script: ninja -C build test
>  
>  test:ninja-test-arm64:
> +  retry: 2
>    image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
>    dependencies:
>      - build:tests-debian-meson-arm64
> @@ -203,6 +207,7 @@ test:ninja-test-arm64:
>      when: on_failure
>  
>  test:ninja-test-armhf:
> +  retry: 2
>    image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
>    dependencies:
>      - build:tests-debian-meson-armhf
> @@ -217,6 +222,7 @@ test:ninja-test-armhf:
>      when: on_failure
>  
>  test:ninja-test-mips:
> +  retry: 2
>    image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
>    dependencies:
>      - build:tests-debian-meson-mips
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
