Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922ED10E45D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 17:34:54 +0000 (UTC)
Date: Mon, 30 May 2022 19:34:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YpUAOj3UBcoUTBll@kamilkon-desk1>
References: <20220526152551.773547-1-priyanka.dandamudi@intel.com>
 <20220526152551.773547-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220526152551.773547-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_close_race: added
 description for test case
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

Hi Priyanka,

On 2022-05-26 at 20:55:50 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added description for subtests.
> 

Please see few comments below, also please add global
description. imho one of the commit messages tells about the
purpose ot this test, you can reuse it. You can check it with

git log tests/i915/gem_close_race.c

or

git log 741bf7064c467d -- tests/gem_close_race.c

> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_close_race.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 93ae07ed..ec520510 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -289,6 +289,7 @@ igt_main
>  		close(fd);
>  	}
>  
> +	igt_describe("Basic check to verify race of gem close against workload submission.");

imho this test do not hit close, you can just call it
"Basic workload submission."

>  	igt_subtest("basic-process") {
>  		int fd = drm_open_driver(DRIVER_INTEL);
>  
> @@ -300,9 +301,13 @@ igt_main
>  		close(fd);
>  	}
>  
> +	igt_describe("Share buffer handle across different drmfd's and verify race of"
> +		     " gem close against continuous workload(selfcopy) with minimum timeout.");

s/drmfd's/drm fd's/
s/(selfcopy)//

Well, imho the purpose isn't verifing race by itself, test is
intentionally trying to race between workload and closing fd.
Please rewrite this and other descriptions below.

>  	igt_subtest("basic-threads")
>  		threads(1, 0);
>  
> +	igt_describe("Verify race of gem close against submission of continuous"
> +		     " workload(selfcopying).");
>  	igt_subtest("process-exit") {
>  		int fd = drm_open_driver(DRIVER_INTEL);
>  
> @@ -314,9 +319,13 @@ igt_main
>  		close(fd);
>  	}
>  
> +	igt_describe("Share buffer handle across different drmfd's and verify race of"
> +		     " gem close against continuous workload(selfcopy) in other contexts.");
>  	igt_subtest("contexts")
>  		threads(30, CONTEXTS);
>  
> +	igt_describe("Share buffer handle across different drmfd's and verify race of"
> +		     " gem close against continuous workload(selfcopy) with timeout of 150ms.");

There are two ways for test end, one is hitting break condition
in loop which later checks time, second is a timer. While that
break condition is in miliseconds, the other is in seconds. On
my test runs it takes over 150s, so I suggest to drop time from
descriptions.

--
Kamil

>  	igt_subtest("gem-close-race")
>  		threads(150, 0);
>  
> -- 
> 2.25.1
> 
