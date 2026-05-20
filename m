Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575C2CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A59C10E05A;
	Wed, 20 May 2026 09:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPCjlov3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BD010E05A
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779270524; x=1810806524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O7fm7cqdPY42fUAU4q1dgtf95zx9evHfvUs9dpOma5A=;
 b=ZPCjlov35QpsX+SDuQHXrnSTS5aRUbglpTc3DnX1r5YHJFRlmy/iLw5P
 6/e/tNa+Jm8RgUtT57Mr/faFCSrbyixMo4Iz6omPLh8zlT2Dp9Vin+jXz
 iyAR+TuNAlfcpOjZKf2NS0EKpGQsc516VE4WdhlWCUFziA7cBcrTTvSfa
 4eBg9dZSmfIIX5j1LwxCtzwMJzPcOqH7VASnuDN1cxWuN3NzexD7GudnX
 fnf/FrHMFyfUZ/1hFlRK7vCdsJukzi6coccWdk2YNkZItZIzlLIm8Ebdi
 9RXqfflcsDEytzSbfOxh5wYorVrbo6Fl+65gV1sakuaVXI/lVSuAtDXBn A==;
X-CSE-ConnectionGUID: jLk7aJGLQSaCUKo1IpvBWA==
X-CSE-MsgGUID: U6P+93CPTxumaTKLcYL66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102840936"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="102840936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:48:43 -0700
X-CSE-ConnectionGUID: zAAvEeeNSnKKgXrKiHOAzA==
X-CSE-MsgGUID: 8fxZSf09Qte4Bdzs07/UEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="244406264"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:48:41 -0700
Date: Wed, 20 May 2026 11:48:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add igt_disable_cpu_deep_sleep()
 to control CPU C-states
Message-ID: <20260520094837.g3d333dbkd5wntqc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520064651.3266598-2-jason-jh.lin@mediatek.com>
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
On 2026-05-20 at 14:46:25 +0800, Jason-JH Lin wrote:
> Add API to disable/enable deep CPU idle states via sysfs to prevent
> CPU wakeup latency that affects vblank timestamp acquisition on
> MediaTek devices.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 67 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99fc9fa05c96..f77b7af44e39 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6776,6 +6776,72 @@ bool igt_check_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>  	return (current == bpc);
>  }
>  
> +/**
> + * igt_disable_cpu_deep_sleep:
> + * @fd: DRM device file descriptor
> + * @disable: true to disable deep sleep states, false to restore them
> + *
> + * Controls deep CPU idle states (C-states) to prevent IRQ latency spikes
> + * during vblank events. This is a system-wide operation that affects all CPUs.
> + *
> + * This is a general API that vendors can extend. Currently:
> + * - MediaTek: Disables/enables state1 and deeper states on all CPUs
> + *
> + * When @disable is true, disables deep sleep to ensure stable vblank timing.
> + * When @disable is false, restores power-saving idle states.
> + *
> + * Returns: true on success, false on failure
> + */
> +bool igt_disable_cpu_deep_sleep(int fd, bool disable)
> +{
> +	char cpu_path[256];
> +	char state_path[512];
> +	int cpu, state;
> +	int count = 0;
> +	FILE *fp;
> +	const char *value = disable ? "1" : "0";
> +	const char *action = disable ? "Disabled" : "Restored";
> +
> +	/* Only MediaTek needs this currently - other vendors can extend here */
> +	if (!is_mtk_device(fd))
> +		return false;

Do not do this, make it a general function for every user.
Also, imho this should be in another lib, not in igt_kms.

Regards,
Kamil

> +
> +	/* Control state1 and deeper for all CPUs */
> +	for (cpu = 0; cpu < 256; cpu++) {
> +		snprintf(cpu_path, sizeof(cpu_path),
> +			 "/sys/devices/system/cpu/cpu%d", cpu);
> +
> +		/* Check if CPU exists */
> +		if (access(cpu_path, F_OK) != 0)
> +			break;
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
> +
> +	return count > 0;
> +}
> +
>  /**
>   * igt_max_bpc_constraint:
>   * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a58cb5cd3430..c524d2ffea16 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1244,6 +1244,7 @@ void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>  				 unsigned int bpc);
>  bool igt_check_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>  				unsigned int bpc);
> +bool igt_disable_cpu_deep_sleep(int fd, bool disable);
>  
>  int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
>  int sort_drm_modes_by_clk_asc(const void *a, const void *b);
> -- 
> 2.43.0
> 
