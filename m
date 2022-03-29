Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBBB10E80D
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Mar 2022 09:33:47 +0000 (UTC)
Date: Tue, 29 Mar 2022 11:33:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkLSd4DyhjXhRZ3T@kamilkon-DESK1>
References: <20220321142155.273109-1-priyanka.dandamudi@intel.com>
 <20220321142155.273109-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321142155.273109-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/i915_module_load: Add
 descriptions for test
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

one small nit, see below.

Dnia 2022-03-21 at 19:51:54 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add test description for subtests.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/i915_module_load.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index a86dd86c..a1b8604f 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -37,6 +37,8 @@
>  #include "igt_sysfs.h"
>  #include "igt_core.h"
>  
> +IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
> +
>  static void store_all(int i915)
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
> @@ -236,6 +238,7 @@ hda_dynamic_debug(bool enable)
>  
>  igt_main
>  {
> +	igt_describe("Verify the basic functionality of i915 driver after it's reloaded.");
>  	igt_subtest("reload") {
>  		int load_error;
>  
> @@ -252,6 +255,7 @@ igt_main
>  		/* only default modparams, can leave module loaded */
>  	}
>  
> +	igt_describe("Verify that i915 driver can be successfully loaded with disabled display.");
>  	igt_subtest("reload-no-display") {
>  		igt_i915_driver_unload();
>  
> @@ -260,6 +264,8 @@ igt_main
>  		igt_i915_driver_unload();
>  	}
>  
> +	igt_describe("Verify that i915 driver can be successfully reloaded atleast once"

s/atleast/at least/

With that fixed you can add my r-b.

Regards,
Kamil
> +		     " with fault injection.");
>  	igt_subtest("reload-with-fault-injection") {
>  		const char *param;
>  		int i = 0;
> -- 
> 2.25.1
> 
