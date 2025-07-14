Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BA8C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 11:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1210E480;
	Mon, 14 Jul 2025 11:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICnKzeoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1F710E47D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752493889; x=1784029889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8LfHviMaJfQp2IjbVEV4ZD+aaesFFp2NKI6O5FWSg8c=;
 b=ICnKzeoUJ0ijBQYJn00nRfHLFTrfHxIaA3ICiqlVRPe9XIGCUGCZajrf
 SLZvaPZXtnXAk0xLrP8Vlh7Hhc0DZsNP9L8YkMz1QuBWwLBukI5QjdMHb
 VpdaS6A++vMBPtXCbADgUWjaaEkRgkgsD0AWZ9f99EJpDXtTSVWxLXpw9
 RLfdl1zMiHRVqJXu4wjUOihOwaA5iNuvgMETTh2AfKPliKwUoWQ68P4y7
 QAARFl22cxIRt/uEdctACtg047yi5lcKW7QyKuVfnBxavs5EWyJ2eyRUf
 fIbWhfuvCwmoo88wte5+wdjKE55qKDoWFMq3/nVt3D4PMGcmoFzrPhpnN A==;
X-CSE-ConnectionGUID: 7xLskEpiTyqnW9AHZJcvCw==
X-CSE-MsgGUID: ZEJR15GoRMmHzmjg3OeBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53794603"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="53794603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 04:51:29 -0700
X-CSE-ConnectionGUID: iTG+A1E/RlCpzchjZMw/Sg==
X-CSE-MsgGUID: kWo5g2fDRMCT+VGVvsy12Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="157639960"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 04:51:28 -0700
Date: Mon, 14 Jul 2025 13:51:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Message-ID: <20250714115125.lofwrdpjzxc3r6sw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250613054848.3279961-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613054848.3279961-1-jeevan.b@intel.com>
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

Hi Jeevan,
On 2025-06-13 at 11:18:48 +0530, Jeevan B wrote:
> This change finds a common mode for eDP before falling back to default mode.
> It avoids unnecessary failures by not selecting an unsupported mode for eDP.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..6e7e5942a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -252,6 +252,21 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  			goto found;
>  	}
>  
> +	/*
> +	 * If eDP is present, try its modes to find a compatible one.
> +	 */
> +	for (int c = 0; c < crtc->connector_count; c++) {
> +		drmModeConnector *conn = crtc->cconfs[c].connector;

Add newline here.

> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			for (i = 0; i < conn->count_modes; i++) {
> +				mode = &conn->modes[i];
> +				if (crtc_supports_mode(crtc, mode))
> +					goto found;

This looks ok, adding Swati and Karthik to cc.

Regards,
Kamil

> +			}
> +		break;
> +		}
> +	}
> +
>  	/*
>  	 * If none is found then just pick the default mode from all connectors
>  	 * with the smallest clock, hope the other connectors can support it by
> -- 
> 2.25.1
> 
