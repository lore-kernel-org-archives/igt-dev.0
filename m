Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D6C44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CF010E94B;
	Mon, 13 Jul 2026 12:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxL4Og8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1871710E94A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783944514; x=1815480514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+oUivkXl5KsN6s0qFUOIWz5I86F9RbmhQUaeuL4OmdU=;
 b=MxL4Og8pXxZuDh2ULYgWaHmJh97cXqDiVsyNGvorzQDvWACprR1dyy75
 jBe8RwUgZxFBcERmg5VtL1I4miP6jKDqXmPraIhmFbW4dVV04xkktJtAr
 JmFKIe/IsrQSdOle4qRYZIr/qZ4/aV3v9WpP/6trwruvZz7KxIEk2UBOo
 Ffy/8ZpZzdA0VaguTDluaaAToz/1Qq3r7XLzM6WSIFEQnl4bwIYEO2ef6
 wqFF/ljtDeS3/JeSd2a7n8PadS94ilb1rPsletNadn/9ivCDBZUhKLrml
 k79s4jOEtNtCXS4mBSGfCnwNvbKwvsYi+K03K+Do9ECLPZ1Kxs3nQtmTv Q==;
X-CSE-ConnectionGUID: 8cKYGRf1Spihf4muSlyzjA==
X-CSE-MsgGUID: K829WfIUTpWB845ROMpThg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84667324"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84667324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 05:08:34 -0700
X-CSE-ConnectionGUID: aHxi3X+VQ1aQnCo3YQ1E1g==
X-CSE-MsgGUID: J/WZPdwHSkiT7sXaiAJO9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256172436"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 05:08:31 -0700
Date: Mon, 13 Jul 2026 14:08:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_pm: Add CPU idle state control for
 vblank timing stability
Message-ID: <20260713120828.afnxibf3ct4hteea@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260710095358.2518446-1-jason-jh.lin@mediatek.com>
 <20260710095358.2518446-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710095358.2518446-2-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2026-07-10 at 17:52:47 +0800, Jason-JH Lin wrote:
> Add igt_pm_disable_cpu_deep_sleep() and igt_pm_enable_cpu_deep_sleep()
> APIs to control deep CPU idle states (C-states) via sysfs. This prevents
> IRQ latency spikes that affect vblank timestamp acquisition.
> 
> The functions control state1 and deeper states on all CPUs while keeping
> state0 (WFI) unchanged, providing a balance between timing accuracy and
> power efficiency.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  lib/igt_pm.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |  2 ++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 64b15dd08302..7a8ad8ae3dea 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1713,3 +1713,78 @@ unsigned int igt_read_pkgc_counter(int debugfs_root_fd)
>  
>  	return igt_get_dc_counter(str);
>  }
> +
> +static bool igt_pm_cpu_deep_sleep_control(bool disable)

Please do not use bool params. See below.

> +{
> +	char cpu_path[256];
> +	char state_path[512];
> +	int cpu, state;
> +	int count = 0;
> +	FILE *fp;
> +	const char *value = disable ? "1" : "0";

Pass it as param.

> +	const char *action = disable ? "Disabled" : "Restored";

Same here:

static bool igt_pm_cpu_deep_sleep_control(char *val, char *msg)

> +
> +	/* Control state1 and deeper for all CPUs */
> +	for (cpu = 0; cpu < 256; cpu++) {

Should you read this '256' dynamically? Or make it a define or
const int. Another idea below.

> +		snprintf(cpu_path, sizeof(cpu_path),
> +			 "/sys/devices/system/cpu/cpu%d", cpu);
> +
> +		/* Check if CPU exists */
> +		if (access(cpu_path, F_OK) != 0)
> +			break;

Why not just readdir and match files starting with "cpu%d"?

> +
> +		/* Control state1 and deeper (keep state0 WFI unchanged) */
> +		for (state = 1; state < 10; state++) {
> +			snprintf(state_path, sizeof(state_path),
> +				 "%s/cpuidle/state%d/disable", cpu_path, state);
> +
> +			if (access(state_path, W_OK) != 0)
> +				break;
> +
> +			/* Write '1' to disable, '0' to enable */
> +			fp = fopen(state_path, "w");
> +			if (fp) {
> +				fprintf(fp, "%s", value);
> +				fclose(fp);
> +				count++;
> +			}
> +		}
> +	}
> +
> +	if (count > 0)
> +		igt_info("%s deep CPU idle states for %d CPU/state combinations\n",
> +			 action, count);
> +	else
> +		igt_warn("No CPU idle states found to control\n");

Why warning here? What if by default idle states are turned off?
Btw when you run this in exit proc, any warn is unexpected and
useless.

> +
> +	return count > 0;
> +}
> +
> +/**
> + * igt_pm_disable_cpu_deep_sleep:
> + *
> + * Disables deep CPU idle states (C-states) to prevent IRQ latency spikes
> + * during vblank events. This is a system-wide operation that affects all CPUs.
> + *
> + * Disables state1 and deeper states while keeping state0 (WFI) unchanged
> + * to ensure stable vblank timing.
> + *
> + * Returns: true on success, false on failure
> + */
> +bool igt_pm_disable_cpu_deep_sleep(void)
> +{
> +	return igt_pm_cpu_deep_sleep_control(true);

igt_pm_cpu_deep_sleep_control("1", "Disabled")

> +}
> +
> +/**
> + * igt_pm_enable_cpu_deep_sleep:
> + *
> + * Re-enables deep CPU idle states (C-states) that were previously disabled
> + * by igt_pm_disable_cpu_deep_sleep(). This restores power-saving idle states.
> + *
> + * Returns: true on success, false on failure
> + */
> +bool igt_pm_enable_cpu_deep_sleep(void)
> +{
> +	return igt_pm_cpu_deep_sleep_control(false);

igt_pm_cpu_deep_sleep_control("0", "Enabled")

Regards,
Kamil

> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 6a33c6db22fb..c0e35dbe721e 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -114,5 +114,7 @@ bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
>  const char *igt_dc_state_name(int dc_flag);
>  void igt_require_dc_counter(int debugfs_fd, int dc_flag);
>  unsigned int igt_read_pkgc_counter(int debugfs_root_fd);
> +bool igt_pm_disable_cpu_deep_sleep(void);
> +bool igt_pm_enable_cpu_deep_sleep(void);
>  
>  #endif /* IGT_PM_H */
> -- 
> 2.43.0
> 
