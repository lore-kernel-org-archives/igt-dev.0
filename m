Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88E6C47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846E010ED90;
	Thu,  1 Feb 2024 13:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9U8yMxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43FF10ED90
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706792715; x=1738328715;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+PDLH7QXSsFPoeFRdbnrD1PKiYsioL8vZOjRa2lxPFM=;
 b=b9U8yMxxe8uQewX7yoqJ7Jxf06S0q/cZb/N7zJ2PJjnoxIK7Ymr0BUuL
 yg5KfIeRWdUOU2x3mhBVCTtP/h2R3f5ggbowkR8lVJPo/vzUZhdBZ1pLh
 0GtTw0YqpTj488SKMHlflNrD0UkpWIMAqoV+MLMzq12nemNnFfymUk6um
 fY8Nx+MzLd/IUqRRUKdaxU5Cr0TV2C8GCLNSqAqLB1VCurorgFyWVE6uu
 vi0R/WlKB36minRkyCnFrkYf+MDMqmBrmCb7FM1Gvfve9CD3CgzgRBIkU
 N0CJ5eHKrGV89tsCDoPeu8HHAmSyebtH4rWSOpX8l2Qze2HEZujfbJn18 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17418512"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="17418512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="23100285"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:05:13 -0800
Date: Thu, 1 Feb 2024 14:05:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/igt_kmod: stop using KMOD_REMOVE_FORCE
Message-ID: <20240201130510.gxxpk6olc6a75bpi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
 <20240201005115.352192-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201005115.352192-2-lucas.demarchi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Lucas,
On 2024-01-31 at 16:50:28 -0800, Lucas De Marchi wrote:

Missing commit description - please add one.

Do we really need this remove?

Regards,
Kamil

+cc Janusz Krzysztofik

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c                 | 42 ++++++++++++++++------------------
>  lib/igt_kmod.h                 |  2 +-
>  tests/intel/i915_module_load.c |  4 ++--
>  tests/kms_content_protection.c |  2 +-
>  tests/vgem_basic.c             |  2 +-
>  5 files changed, 25 insertions(+), 27 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 5709138c0..2fed6ed54 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -258,7 +258,7 @@ out:
>  	return err < 0 ? err : 0;
>  }
>  
> -static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
> +static int igt_kmod_unload_r(struct kmod_module *kmod)
>  {
>  #define MAX_TRIES	20
>  #define SLEEP_DURATION	500000
> @@ -272,7 +272,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  	holders = kmod_module_get_holders(kmod);
>  	kmod_list_foreach(pos, holders) {
>  		struct kmod_module *it = kmod_module_get_module(pos);
> -		err = igt_kmod_unload_r(it, flags);
> +		err = igt_kmod_unload_r(it);
>  		kmod_module_unref(it);
>  		if (err < 0)
>  			break;
> @@ -292,7 +292,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  	}
>  
>  	for (tries = 0; tries < MAX_TRIES; tries++) {
> -		err = kmod_module_remove_module(kmod, flags);
> +		err = kmod_module_remove_module(kmod, 0);
>  
>  		/* Only loop in the following cases */
>  		if (err != -EBUSY && err != -EAGAIN)
> @@ -326,8 +326,6 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  /**
>   * igt_kmod_unload:
>   * @mod_name: Module name.
> - * @flags: flags are passed directly to libkmod and can be:
> - * KMOD_REMOVE_FORCE or KMOD_REMOVE_NOWAIT.
>   *
>   * Returns: 0 in case of success or -errno otherwise.
>   *
> @@ -335,7 +333,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>   *
>   */
>  int
> -igt_kmod_unload(const char *mod_name, unsigned int flags)
> +igt_kmod_unload(const char *mod_name)
>  {
>  	struct kmod_ctx *ctx = kmod_ctx();
>  	struct kmod_module *kmod;
> @@ -348,7 +346,7 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
>  		goto out;
>  	}
>  
> -	err = igt_kmod_unload_r(kmod, flags);
> +	err = igt_kmod_unload_r(kmod);
>  	if (err < 0) {
>  		igt_debug("Could not remove module %s (%s)\n", mod_name,
>  			  strerror(-err));
> @@ -525,7 +523,7 @@ static int igt_always_unload_audio_driver(char **who)
>  			if (ret)
>  				igt_warn("Failed to notify pipewire_pulse\n");
>  			kick_snd_hda_intel();
> -			ret = igt_kmod_unload(*m, 0);
> +			ret = igt_kmod_unload(*m);
>  			pipewire_pulse_stop_reserve();
>  			if (ret) {
>  				igt_warn("Could not unload audio driver %s\n", *m);
> @@ -583,7 +581,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>  		if (!igt_kmod_is_loaded(*m))
>  			continue;
>  
> -		ret = igt_kmod_unload(*m, 0);
> +		ret = igt_kmod_unload(*m);
>  		if (ret) {
>  			if (who)
>  				*who = strdup_realloc(*who, *m);
> @@ -593,7 +591,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>  	}
>  
>  	if (igt_kmod_is_loaded(driver)) {
> -		ret = igt_kmod_unload(driver, 0);
> +		ret = igt_kmod_unload(driver);
>  		if (ret) {
>  			if (who)
>  				*who = strdup_realloc(*who, driver);
> @@ -629,10 +627,10 @@ igt_intel_driver_unload(const char *driver)
>  	free(who);
>  
>  	if (igt_kmod_is_loaded("intel-gtt"))
> -		igt_kmod_unload("intel-gtt", 0);
> +		igt_kmod_unload("intel-gtt");
>  
> -	igt_kmod_unload("drm_kms_helper", 0);
> -	igt_kmod_unload("drm", 0);
> +	igt_kmod_unload("drm_kms_helper");
> +	igt_kmod_unload("drm");
>  
>  	if (igt_kmod_is_loaded("driver")) {
>  		igt_warn("%s.ko still loaded!\n", driver);
> @@ -682,7 +680,7 @@ igt_amdgpu_driver_unload(void)
>  	bind_fbcon(false);
>  
>  	if (igt_kmod_is_loaded("amdgpu")) {
> -		if (igt_kmod_unload("amdgpu", 0)) {
> +		if (igt_kmod_unload("amdgpu")) {
>  			igt_warn("Could not unload amdgpu\n");
>  			igt_kmod_list_loaded();
>  			igt_lsof("/dev/dri");
> @@ -690,8 +688,8 @@ igt_amdgpu_driver_unload(void)
>  		}
>  	}
>  
> -	igt_kmod_unload("drm_kms_helper", 0);
> -	igt_kmod_unload("drm", 0);
> +	igt_kmod_unload("drm_kms_helper");
> +	igt_kmod_unload("drm");
>  
>  	if (igt_kmod_is_loaded("amdgpu")) {
>  		igt_warn("amdgpu.ko still loaded!\n");
> @@ -1158,8 +1156,8 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  		free(case_name);
>  	}
>  
> -	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> -	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> +	igt_skip_on(kmod_module_remove_module(tst->kmod, 0));
> +	igt_skip_on(igt_kmod_unload("kunit"));
>  
>  	igt_skip_on_f(err,
>  		      "KTAP parser failed while getting a list of test cases\n");
> @@ -1362,7 +1360,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  		 * unload may fail if kunit base module is not loaded,
>  		 * ignore any failures, we'll fail later if still loaded.
>  		 */
> -		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> +		igt_ignore_warn(igt_kmod_unload("kunit"));
>  
>  		igt_assert(igt_list_empty(&tests));
>  	}
> @@ -1395,7 +1393,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  		kunit_results_free(&tests, &suite_name, &case_name);
>  
>  		igt_ktest_end(&tst);
> -		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> +		igt_debug_on(igt_kmod_unload("kunit"));
>  	}
>  
>  	igt_ktest_fini(&tst);
> @@ -1438,7 +1436,7 @@ int igt_ktest_begin(struct igt_ktest *tst)
>  	if (strcmp(tst->module_name, "i915") == 0)
>  		igt_i915_driver_unload();
>  
> -	err = kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
> +	err = kmod_module_remove_module(tst->kmod, 0);
>  	igt_require(err == 0 || err == -ENOENT);
>  
>  	tst->kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
> @@ -1486,7 +1484,7 @@ int igt_kselftest_execute(struct igt_ktest *tst,
>  
>  void igt_ktest_end(struct igt_ktest *tst)
>  {
> -	kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
> +	kmod_module_remove_module(tst->kmod, 0);
>  	close(tst->kmsg);
>  }
>  
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index 990e5309d..efb46da12 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -34,7 +34,7 @@ void igt_kmod_list_loaded(void);
>  bool igt_kmod_has_param(const char *mod_name, const char *param);
>  
>  int igt_kmod_load(const char *mod_name, const char *opts);
> -int igt_kmod_unload(const char *mod_name, unsigned int flags);
> +int igt_kmod_unload(const char *mod_name);
>  
>  int igt_audio_driver_unload(char **whom);
>  
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index 9fffe93d9..b72f3252a 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -216,7 +216,7 @@ static void unload_or_die(const char *module_name)
>  
>  	/* should be unloaded, so expect a no-op */
>  	for (loop = 0;; loop++) {
> -		err = igt_kmod_unload(module_name, 0);
> +		err = igt_kmod_unload(module_name);
>  		if (err == -ENOENT) /* -ENOENT == unloaded already */
>  			err = 0;
>  		if (!err || loop >= 10)
> @@ -259,7 +259,7 @@ inject_fault(const char *module_name, const char *opt, int fault)
>  	igt_debug("Loaded '%s %s', result=%d\n", module_name, buf, fault);
>  
>  	if (strcmp(module_name, "i915")) /* XXX better ideas! */
> -		igt_kmod_unload(module_name, 0);
> +		igt_kmod_unload(module_name);
>  	else
>  		igt_i915_driver_unload();
>  
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 3fc575634..6858b22e2 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -396,7 +396,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>  	}
>  
>  	if (data.cp_tests & CP_MEI_RELOAD) {
> -		igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
> +		igt_assert_f(!igt_kmod_unload("mei_hdcp"),
>  			     "mei_hdcp unload failed");
>  
>  		/* Expected to fail */
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 63c5c0971..cfda908bc 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -438,7 +438,7 @@ static void test_debugfs_read(int fd)
>  
>  static int module_unload(void)
>  {
> -	return igt_kmod_unload("vgem", 0);
> +	return igt_kmod_unload("vgem");
>  }
>  
>  static void test_unload(void)
> -- 
> 2.43.0
> 
