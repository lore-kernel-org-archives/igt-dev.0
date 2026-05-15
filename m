Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D525CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 10:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60F110E150;
	Fri, 15 May 2026 10:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSEsJm8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48A110E126
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778842180; x=1810378180;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bfX9ExiqEFvbr1sdDQRlCRS0adlqbJWc6XwZk3SElgo=;
 b=nSEsJm8r7Nu3EoHT75i/JjLytywJ/nRZshUkgb62yFWklbtvVrOgYLwf
 657rspoOuX4RWX80jsCr80/3PuD5k6o6EFVMeQzlZ4JPMTCYm89P3ugeB
 4BXaHcqR5Wr1J2GAxElaHGGjxCC0aB+p0p1d8QlDOgrqJdt1V1PgR+Kls
 M33PUAdItxEdF7yeOnzPr3Qz9ZRR9AWtrXQvyt8G6GxqmE6XB5Q4O9yvY
 2Qq42Xmm8qQZNAe8GvLbG7Y0KuFIZVCgDmzIh83+ykFAmlKlcqYzdvj2m
 hKIPAo6IecL2qi7Lcj/rI4o6otbGlBioD0/JUYUinf2/AHeCWSP8AAxiF g==;
X-CSE-ConnectionGUID: gU4yuyg2RHikWeL1Uffk6Q==
X-CSE-MsgGUID: dKV5+s/pQWuEV/Kf+XpM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83666435"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="83666435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 03:49:40 -0700
X-CSE-ConnectionGUID: AxPqKzwdSvW4P1DhIF3VVA==
X-CSE-MsgGUID: v3ti6f8TQEmFR6zw2r0o5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="237675267"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:49:36 -0700
Date: Fri, 15 May 2026 12:49:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 2/2] tests/kms_cursor_crc: Use SUSPEND_TEST_DEVICES
 for MediaTek devices
Message-ID: <20260515104933.ym4jqrtdtb3ice4s@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <20260515072934.495031-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515072934.495031-3-jason-jh.lin@mediatek.com>
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
On 2026-05-15 at 15:28:40 +0800, Jason-JH Lin wrote:
> Use SUSPEND_TEST_DEVICES instead of SUSPEND_TEST_NONE for MediaTek
> devices since rtcwake is not supported.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/kms_cursor_crc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 1249171dec56..5a6cc7717425 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -322,9 +322,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>  							DRM_MODE_DPMS_ON);
>  			}
>  
> -			if (data->flags & TEST_SUSPEND)
> -				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -							      SUSPEND_TEST_NONE);
> +			if (data->flags & TEST_SUSPEND) {
> +				enum igt_suspend_test test = SUSPEND_TEST_NONE;
> +
> +				/* rtcwake cmd is not supported on MTK devices */
> +				if (is_mtk_device(data->drm_fd))
> +					test = SUSPEND_TEST_DEVICES;
> +
> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, test);
> +			}
>  
>  			igt_pipe_crc_start(pipe_crc);
>  			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
> -- 
> 2.43.0
> 
