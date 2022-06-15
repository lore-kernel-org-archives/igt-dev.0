Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD42F1122E9
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 15:35:41 +0000 (UTC)
Date: Wed, 15 Jun 2022 17:35:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yqn8Sb0d8rPQennB@kamilkon-desk1>
References: <20220615055147.1175944-1-priyanka.dandamudi@intel.com>
 <20220615055147.1175944-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615055147.1175944-2-priyanka.dandamudi@intel.com>
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

On 2022-06-15 at 11:21:46 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added description for subtests.
> 
> v2: Added global description and modified others.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_close_race.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 93ae07ed6..271e88f9a 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -53,6 +53,8 @@
>  #define BLT_WRITE_ALPHA		(1<<21)
>  #define BLT_WRITE_RGB		(1<<20)
>  
> +IGT_TEST_DESCRIPTION("Test try to race gem_close against workload submission.");
> +
>  static uint32_t devid;
>  static bool has_64bit_relocations;
>  static bool has_softpin;
> @@ -289,6 +291,7 @@ igt_main
>  		close(fd);
>  	}
>  
> +	igt_describe("Basic workload submission.");
>  	igt_subtest("basic-process") {
>  		int fd = drm_open_driver(DRIVER_INTEL);
>  
> @@ -300,9 +303,13 @@ igt_main
>  		close(fd);
>  	}
>  
> +	igt_describe("Share buffer handle across different drm fd's and trying to race "
> +		     " gem_close against continuous workload with minimum timeout.");
>  	igt_subtest("basic-threads")
>  		threads(1, 0);
>  
> +	igt_describe("Test try to race gem close against submission of continuous"
----------------------------------------- ^
s/gem close/gem_close/

With that fixed,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +		     " workload.");
>  	igt_subtest("process-exit") {
>  		int fd = drm_open_driver(DRIVER_INTEL);
>  
> @@ -314,9 +321,13 @@ igt_main
>  		close(fd);
>  	}
>  
> +	igt_describe("Share buffer handle across different drm fd's and trying to race"
> +		     " gem_close against continuous workload in other contexts.");
>  	igt_subtest("contexts")
>  		threads(30, CONTEXTS);
>  
> +	igt_describe("Share buffer handle across different drm fd's and trying to race of"
> +		     " gem_close against continuous workload.");
>  	igt_subtest("gem-close-race")
>  		threads(150, 0);
>  
> -- 
> 2.25.1
> 
