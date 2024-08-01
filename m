Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009CDC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A364D10E925;
	Thu,  1 Aug 2024 11:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMb90AQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059B310E925
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722512770; x=1754048770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kVeHQcm06B2vH/zA0KbJWX9QnS22OysgyC4MLvd1lJc=;
 b=aMb90AQ5eYJPlms83GkvKQPK7YlU1aDzPtExHmRPLGaNi/XkPSxTfw2+
 MqUh/WgpNdUzI6Iqsq8yJr/mQcmvkcG9e7RKGCpqROxsA3Fr68SGTW/JU
 g8DJQ20mX6OpM9WazB9bEPKIniboZe5zqg2w79mbsb3ePsnKB/qlr94fE
 4kEtjTDCf8qdaJNqYKmMuchfq3L0hb6SljGVpCuOyIChnbyMz8sIPAJex
 Nc+g3tGdsdxxgMgOT2SRCXS8h5y7XQKcxGp2782mqT9odlUF6U+1i4VqN
 5M2J1lZIMii8Ecuen8pMVOQiDMa7+TFcJucc2ANyeTVjQGrDhYez7+Xx/ A==;
X-CSE-ConnectionGUID: X+PGMYAwQsqt9iQ//ynxag==
X-CSE-MsgGUID: wyQaRcxOTGKqTdthzzyiVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20275687"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20275687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:46:10 -0700
X-CSE-ConnectionGUID: tFqJ+ZUjTgKzM31mF5J7WA==
X-CSE-MsgGUID: QRyeXOsfSCi0DhSG4+ZM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55093157"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 04:46:08 -0700
Date: Thu, 1 Aug 2024 13:45:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without
 display
Message-ID: <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
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
On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:

small nit about subject, you wrote:

[PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display

imho this should be:

[PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display

More nits below.

> Add tests to validate basic execution suspend/resume cycle
> without display module to rule out display related issues
> from the suspend/resume stack.
> 
> v2: Add normal reload cycle after running test (Anshuman)
> 
> v3: Rebase
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 8b115e2f6..03f742265 100644
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

I see you copy-pasted it but imho both Description and
Functionality documentation fields should be static, here and
in other places.
+cc Katarzyna Piecielska <katarzyna.piecielska@intel.com>

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

Why 'return' here?! Imho this should be checked in fixture
or be a skip. Or other way around - what about a headless board
or one without any connected display?

Regards,
Kamil

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
