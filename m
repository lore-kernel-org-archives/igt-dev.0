Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BE1C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 09:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32AB10E14F;
	Wed, 15 Jul 2026 09:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWKe2gxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D50E10E14F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784106425; x=1815642425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6YClIjhgs42vX7PeYcVGSGwxDBaJfHt0Vycq4Tdxna8=;
 b=FWKe2gxb3AaaFcsw5ySHMPb048LiGNcNh2PyiXjttsqpv0RmonFsqbbH
 o3WnzDH2PZCcZZoDKnBj20k7r/AV9WaPw9xdQQ62trhHskLRYChoxVWvm
 1jhHASGS4x+zB6DLH6Tork0qt6xx8Tf0H2WdeCc3WuqytghcPwUfg32RY
 8+oDXbHvejwgG30tEF1xbuAa/WkAkqDCTeWjO7+aLOyce0A0ddM0CPDSv
 lKZDxNXbkc5TxDWNX5vzgowcQBkj+LAlcPL641TdyYXShu8/2ah++5F4y
 LtxYYUFNDhPQT6D6K6feeTWvkkfktx2cEx7UMLRc4MIk5bvZQlSaPWHUN Q==;
X-CSE-ConnectionGUID: AbFB6v2wQ/ejhLn7XFoE5w==
X-CSE-MsgGUID: E/2o5k4QQJyFD8rIpgpXGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="72268310"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="72268310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 02:07:04 -0700
X-CSE-ConnectionGUID: 8anuwq9aRmeUUObYC6Qlxg==
X-CSE-MsgGUID: 1RUkGoaDS7+JrU+eu67n/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="279410122"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:07:01 -0700
Date: Wed, 15 Jul 2026 11:06:59 +0200
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
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_pm: Add CPU idle state control
Message-ID: <20260715090659.52d4v3sldvhdbw57@kamilkon-DESK.igk.intel.com>
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
References: <20260715030534.1209206-1-jason-jh.lin@mediatek.com>
 <20260715030534.1209206-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715030534.1209206-2-jason-jh.lin@mediatek.com>
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
On 2026-07-15 at 11:04:28 +0800, Jason-JH Lin wrote:
> Add igt_pm_disable_cpu_deep_sleep() and igt_pm_enable_cpu_deep_sleep()
> APIs to control deep CPU idle states (C-states) via sysfs.
> 
> Exiting a deep C-state incurs a wakeup latency that can interfere with
> latency-sensitive measurements. These helpers disable state1 and deeper
> states (keeping state0/WFI unchanged) and re-enable them afterwards, so
> tests that need stable timing can eliminate that interference.
> 
> The functions return the number of idle states they acted on, allowing
> callers to skip when the platform exposes no controllable idle states.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_pm.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |  2 ++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 64b15dd08302..7905deb8d43d 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1713,3 +1713,80 @@ unsigned int igt_read_pkgc_counter(int debugfs_root_fd)
>  
>  	return igt_get_dc_counter(str);
>  }
> +
> +static int igt_pm_cpu_deep_sleep_control(const char *val)
> +{
> +	const char *cpu_root = "/sys/devices/system/cpu";
> +	char state_path[512];
> +	int count = 0;
> +	struct dirent *de;
> +	DIR *dir;
> +
> +	dir = opendir(cpu_root);
> +	if (!dir)
> +		return 0;
> +
> +	while ((de = readdir(dir))) {
> +		int cpu, state = 1;
> +
> +		/* Match cpu topology entries named "cpu<N>" */
> +		if (sscanf(de->d_name, "cpu%d", &cpu) != 1)
> +			continue;
> +
> +		/*
> +		 * Control state1 and deeper (keep state0 WFI unchanged),
> +		 * walking consecutive states until one is missing.
> +		 */
> +		while (1) {
> +			FILE *fp;
> +
> +			snprintf(state_path, sizeof(state_path),
> +				 "%s/%s/cpuidle/state%d/disable",
> +				 cpu_root, de->d_name, state++);
> +
> +			if (access(state_path, W_OK) != 0)
> +				break;
> +
> +			/* Write '1' to disable, '0' to enable */
> +			fp = fopen(state_path, "w");
> +			if (fp) {
> +				fprintf(fp, "%s", val);
> +				fclose(fp);
> +				count++;
> +			}
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	return count;
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
> + * Returns: the number of CPU idle states that were disabled (0 if none).
> + */
> +int igt_pm_disable_cpu_deep_sleep(void)
> +{
> +	return igt_pm_cpu_deep_sleep_control("1");
> +}
> +
> +/**
> + * igt_pm_enable_cpu_deep_sleep:
> + *
> + * Re-enables deep CPU idle states (C-states) that were previously disabled
> + * by igt_pm_disable_cpu_deep_sleep(). This restores power-saving idle states.
> + *
> + * Returns: the number of CPU idle states that were enabled (0 if none).
> + */
> +int igt_pm_enable_cpu_deep_sleep(void)
> +{
> +	return igt_pm_cpu_deep_sleep_control("0");
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 6a33c6db22fb..cd9dceb1e4e5 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -114,5 +114,7 @@ bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
>  const char *igt_dc_state_name(int dc_flag);
>  void igt_require_dc_counter(int debugfs_fd, int dc_flag);
>  unsigned int igt_read_pkgc_counter(int debugfs_root_fd);
> +int igt_pm_disable_cpu_deep_sleep(void);
> +int igt_pm_enable_cpu_deep_sleep(void);
>  
>  #endif /* IGT_PM_H */
> -- 
> 2.43.0
> 
