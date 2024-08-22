Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE19C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 16:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151FC10EB74;
	Thu, 22 Aug 2024 16:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0qZ793B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA0810EB74
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724345569; x=1755881569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UaPTpX1cQGvUC9XU1W8Ugn1jtf3YwUjD/CL+XGR1xf4=;
 b=l0qZ793BY4lF7cvOobT70Vm+BUQoOdYgtV7N9PqsYEGkAxWnSPAv3P6M
 rs84qOr08m5tOwd/VeZ6XN8NWSN6+nRj60jeOdhtfpBlg2pcRwT5mMdGP
 74jvM6iI/Ob8h5lJhWOleTl+uB2T+GJWB2/ONh9+Ur8mSAwA19ih6Oopp
 ex01DmMunDvUUpyjNzO5d7bTNIavdfWeG1z3c8FCJLEjGqXhvpnHRiwHK
 4PJXcJ8DuHMEqz4PQqffuGX7yAf4gGD3bz11E5h+aLk+RdVPa/QAux2EF
 8wK0oIzizHcAx4B4x4WS+6O/d0HL0exGfCpo3GgOfxg+ugggMyykwT1No Q==;
X-CSE-ConnectionGUID: 5DilWOa0T0eMNF0z7Uhe9w==
X-CSE-MsgGUID: cGhDX4AWQOSt9uvltdm2Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22589871"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22589871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:52:48 -0700
X-CSE-ConnectionGUID: RjGzoB05RaShwOU/UFhiNw==
X-CSE-MsgGUID: Z/zySXlyRky87acFamdHVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61489862"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 09:52:47 -0700
Date: Thu, 22 Aug 2024 18:52:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 katarzyna.piecielska@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
Message-ID: <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 katarzyna.piecielska@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
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

Hi Sujaritha,
On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
> Add tests to validate basic execution suspend/resume cycle
> without display module to rule out display related issues
> from the suspend/resume stack.
> 
> v2: Add normal reload cycle after running test (Anshuman)
> 
> v3: Rebase
> 
> v4: Change commit name/header (Kamil)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Acked-by: Katarzyna Piecielska Katarzyna.piecielska@intel.com<Katarzyna.piecielska@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index eee89428c..1623a56c7 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -17,6 +17,7 @@
>  
>  #include "igt.h"
>  #include "lib/igt_device.h"
> +#include "lib/igt_kmod.h"
>  #include "lib/igt_pm.h"
>  #include "lib/igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>   * Description: suspend/autoresume on %arg[1] state and exec after RPM
>   * Functionality: pm - %arg[1]
>   *
> + * SUBTEST: %s-without-display
> + * Description: suspend/autoresume on %arg[1] state without display
> + * Functionality: pm - %arg[1]
> + *
>   * arg[1]:
>   *
>   * @s2idle:	s2idle
> @@ -681,6 +686,7 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	device_t device;
>  	uint32_t d3cold_allowed;
> +	const char *opts;
>  	int sysfs_fd;
>  
>  	const struct s_state {
> @@ -757,6 +763,34 @@ igt_main
>  					  NO_RPM, 0);
>  		}
>  
> +		igt_subtest_f("%s-without-display", s->name) {
> +
> +			if (!drmModeGetResources(device.fd_xe))
> +				return;

This should be skip or save it (as global?) and run test on headless.

> +
> +			xe_for_each_engine(device.fd_xe, hwe) {
> +
> +				igt_debug("Reload w/o display\n");
> +
> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> +				igt_assert_eq(igt_xe_driver_unload(), 0);
> +
> +				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
> +				igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);

This param was renamed to probe_display, see
https://patchwork.freedesktop.org/series/137096/
tests/intel/xe_module_load: Rename enable_display module param
Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.

+Cc Lucas

Regards,
Kamil

> +
> +				test_exec(device, hwe, 1, 2, s->state,
> +					  NO_RPM, 0);
> +
> +				igt_debug("Reload as normal\n");
> +
> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> +				igt_assert_eq(igt_xe_driver_unload(), 0);
> +
> +				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
> +				igt_assert_eq(igt_xe_driver_load(opts), 0);
> +			}
> +		}
> +
>  		for (const struct vm_op *op = vm_op; op->name; op++) {
>  			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>  				xe_for_each_engine(device.fd_xe, hwe)
> -- 
> 2.34.1
> 
