Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D36C2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 19:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E1A10E74F;
	Wed, 21 May 2025 19:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9kzwQ5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12EC10E74F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 19:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747854669; x=1779390669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HE2JEFMJBLQzmjBZC62ojBV+TA/dGq0thN9c7ZJOaBU=;
 b=g9kzwQ5yVS4rUq54G3CtS/ojnYCYmWxe9dcIbEU1UyukUvPFpxOhISgR
 FSJbSNXRQMXIxSyEnDh3Iv9hazAqDqHR14L+Jr+lwRXosVzPqf4UPhoOu
 Aq3Bu4UbBV/EXl36LN6N/AvhgYlSCmEnFEYA0lICAkIwNKeHxyKjPUN9e
 o3PuOJwwj0O4AMg1fHM0fugh+xIcCWI4JKJtzmKkODtCkcnB+Rh2q6fkR
 bG9jdqP7PwbnIJqQsavdbKVJ0dF/pJ29XGM2soq8TbiXMYy52sZQ8lKZ1
 mM5YNLf/idcdM7w8e3k/r0jSqoKnTHCOcIRIH0luTBv8ZpEqf+F+wLCuL w==;
X-CSE-ConnectionGUID: HZlsHh3gQOi1JCVypKne/g==
X-CSE-MsgGUID: OVapBtejQFulUt6VyoYAEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72371678"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="72371678"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 12:11:08 -0700
X-CSE-ConnectionGUID: N4GDDuSnTXeJH6FjELoh9w==
X-CSE-MsgGUID: cktzbnaoQzK2IT/AtgwOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="144179476"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.201])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 12:11:06 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t] tests/core_hotunplug: Add
 exec-no-cleanup-hotunbind-rebind subtest
Date: Wed, 21 May 2025 21:11:03 +0200
Message-ID: <2035143.PYKUYFuaPT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250508095104.712844-1-marcin.bernatowicz@linux.intel.com>
References: <20250508095104.712844-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Marcin,

On Thursday, 8 May 2025 11:51:04 CEST Marcin Bernatowicz wrote:
> Add a new subtest to verify driver behavior when unbinding an open
> device with active user handles and no explicit exec cleanup. The test
> opens a DRM device, submits a basic workload (currently Xe driver only),
> and unbinds the device while handles are still open. After cleanup, the
> device is rebound and checked for health.
> 
> This validates robustness of the driver across unbind/rebind cycles
> under realistic open-handle conditions.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/core_hotunplug.c | 70 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 18e9dfc34..5d25602a4 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -39,6 +39,10 @@
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_spin.h"
> +
>  /**
>   * TEST: core hotunplug
>   * Description: Examine behavior of a driver on device hot unplug
> @@ -69,6 +73,10 @@
>   * Description: Check if the driver can be cleanly unbound from an open device,
>   *		then released and rebound
>   *
> + * SUBTEST: exec-no-cleanup-hotunbind-rebind
> + * Description: Check if the driver can be cleanly unbound from an open device
> + *		with open handles, then released and rebound
> + *
>   * SUBTEST: hotunplug-rescan
>   * Description: Check if an open device can be cleanly unplugged, then released
>   *		and restored
> @@ -596,6 +604,56 @@ static void hotunbind_rebind(struct hotunplug *priv)
>  	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
>  }
>  
> +#define FLAG_SKIP_EXEC_CLEANUP 1
> +
> +static void
> +simple_xe_exec(int fd, struct drm_xe_engine_class_instance *eci, unsigned int test_flags)
> +{
> +	uint32_t vm;
> +	struct xe_cork *cork;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
> +	xe_cork_sync_start(fd, cork);
> +	usleep(1000);
> +	xe_cork_sync_end(fd, cork);
> +
> +	if (test_flags & FLAG_SKIP_EXEC_CLEANUP)
> +		return;
> +
> +	if (cork)
> +		xe_cork_destroy(fd, cork);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +static void simple_exec(struct hotunplug *priv, unsigned int test_flags)
> +{
> +	if (priv->chipset != DRIVER_XE)
> +		return;

If not providing i915 variant from the beginning then I would at least use a 
construct that is more easy to extend with other platforms, and also skip on 
not supported platforms, not just return if not Xe.

> +
> +	igt_assert_fd(priv->fd.drm);

That's not needed, already verified in local_drm_open_driver().

> +	simple_xe_exec(priv->fd.drm, &xe_engine(priv->fd.drm, 0)->instance, test_flags);
> +}
> +
> +static void exec_hotunbind_rebind(struct hotunplug *priv, unsigned int test_flags)
> +{
> +	pre_check(priv);
> +
> +	priv->fd.drm = local_drm_open_driver(false, "", " for exec and hot unbind");
> +
> +	simple_exec(priv, test_flags);
> +
> +	driver_unbind(priv, "hot ", 0);
> +
> +	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
> +	igt_assert_eq(priv->fd.drm, -1);
> +
> +	driver_bind(priv, 0);
> +
> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);

Why there are still no Xe specific health checks implemented?  Isn't your 
intended value added by the new subtest degraded somehow when there is no 
single health check for Xe available?

> +}
> +
>  static void hotunplug_rescan(struct hotunplug *priv)
>  {
>  	pre_check(priv);
> @@ -748,6 +806,18 @@ igt_main
>  			recover(&priv);
>  	}
>  
> +	igt_fixture
> +		post_healthcheck(&priv);
> +
> +	igt_subtest_group {
> +		igt_describe("Check if the driver can be cleanly unbound from an open device with open handles, then released and rebound");
> +		igt_subtest("exec-no-cleanup-hotunbind-rebind")
> +			exec_hotunbind_rebind(&priv, FLAG_SKIP_EXEC_CLEANUP);

Since you provide only one variant, the flag seems not needed for now.

Thanks,
Janusz

> +
> +		igt_fixture
> +			recover(&priv);
> +	}
> +
>  	igt_fixture
>  		post_healthcheck(&priv);
>  
> 




