Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027AF89E38
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 13:26:09 +0000 (UTC)
Date: Wed, 23 Mar 2022 14:26:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yjsf7dyABW47Ga50@kamilkon-DESK1>
References: <20220321140950.268112-1-priyanka.dandamudi@intel.com>
 <20220321140950.268112-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321140950.268112-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/drm_import_export: Added test
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

Dnia 2022-03-21 at 19:39:49 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the test and subtests.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/drm_import_export.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/drm_import_export.c b/tests/drm_import_export.c
> index 65cac60d..e21ac8ae 100644
> --- a/tests/drm_import_export.c
> +++ b/tests/drm_import_export.c
> @@ -43,6 +43,7 @@
>  #include "i915/gem.h"
>  
>  #define DURATION 10
> +IGT_TEST_DESCRIPTION("Basic check to verify the behaviour of libdrm bo for prime/flink");
>  
>  int fd;
>  drm_intel_bufmgr *bufmgr;
> @@ -250,16 +251,22 @@ igt_main {
>  		drm_intel_bufmgr_gem_enable_reuse(bufmgr);
>  	}
>  
> +	igt_describe("Verify whether the behaviour of libdrm"
> +                     " is consistent for flink or not.");
-- ^^
Please use tabs then few spaces before string.

>  	igt_subtest("import-close-race-flink") {
>  		use_flink = true;
>  		test_import_close_race();
>  	}
>  
> + 	igt_describe("Verify whether the behaviour of libdrm"
-- ^
Remove space before tab.

> +                     " is consistent for prime or not.");

Same as above, change to tabs then few spaces.

>  	igt_subtest("import-close-race-prime") {
>  		use_flink = false;
>  		test_import_close_race();
>  	}
>  
> +	igt_describe("Multithreaded test to validate the (lack of) locking in the flink"
----------------------------------------------------------------------------- ^
You already splitted this string, so split it here to keep under
80 columns.

> +    		     "code in libdrm-intel.");
-- ^
Remove spaces before tabs.
You already used "libdrm" above, so s/libdrm-intel/libdrm/
Please also put space between words, here it get "flinkcode"

>  	igt_subtest("flink") {
>  		use_flink = true;
>  
> @@ -274,6 +281,8 @@ igt_main {
>  		pthread_join(test_thread_id4, NULL);
>  	}
>  
> +	igt_describe("Multithreaded test to validate the (lack of) locking in the prime"

Split string to keep it under 80 columns.

> +                     "code in libdrm-intel.");
-- ^
Change spaces to tabs, then few spaces.
s/libdrm-intel/libdrm/

Please use --describe to see for missed spaces between words.

>  	igt_subtest("prime") {
>  		use_flink = false;
>  
> -- 
> 2.25.1
> 
Regards,
Kamil
