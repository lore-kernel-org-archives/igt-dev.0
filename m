Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F3510F268
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Apr 2022 13:59:14 +0000 (UTC)
Date: Thu, 28 Apr 2022 15:59:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmqdrqMwggtbxu5C@kamilkon-DESK1>
References: <20220324102750.21771-1-priyanka.dandamudi@intel.com>
 <20220324102750.21771-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324102750.21771-2-priyanka.dandamudi@intel.com>
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

On 2022-03-24 at 15:57:49 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the test and subtests.
> 
> v2: Small modifications.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> ---

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

>  tests/drm_import_export.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/drm_import_export.c b/tests/drm_import_export.c
> index 65cac60d..06245e8b 100644
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
> +		     " is consistent for flink or not.");
>  	igt_subtest("import-close-race-flink") {
>  		use_flink = true;
>  		test_import_close_race();
>  	}
>  
> +	igt_describe("Verify whether the behaviour of libdrm"
> +		     " is consistent for prime or not.");
>  	igt_subtest("import-close-race-prime") {
>  		use_flink = false;
>  		test_import_close_race();
>  	}
>  
> +	igt_describe("Multithreaded test to validate the (lack of) locking in"
> +		     " the flink code in libdrm.");
>  	igt_subtest("flink") {
>  		use_flink = true;
>  
> @@ -274,6 +281,8 @@ igt_main {
>  		pthread_join(test_thread_id4, NULL);
>  	}
>  
> +	igt_describe("Multithreaded test to validate the (lack of) locking in"
> +		     " the prime code in libdrm.");
>  	igt_subtest("prime") {
>  		use_flink = false;
>  
> -- 
> 2.25.1
> 
