Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBC0C61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 14:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EC910F23C;
	Wed,  2 Sep 2026 14:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRKj1Sdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C599510E00E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788359673; x=1819895673;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jdtDnDGMsK43T91wEr0rlFyzxVf6niY+mistPIRItQw=;
 b=dRKj1SdbnptF823guKWx3AtbZAwe/nYw2MQXrSJnV19nCr1wIq1QtUOz
 xTYL2RXyTfnNQ9ghKC4XyJtwJzJZdzR6TIWw3Z5ruRokcBYFjZ0Ajoqab
 FiTmBiM0xluI2pAhwm9gPXBvgrrfRvmpEZDAsJ5lnDmvSBlXl74RKqyra
 oIQ/qNR/32+RGmhOrkC8u6P+ztK1h1PlMO+IbFTas4OXLWec5s+SW/XbB
 Hb7Ri0TMvNMNAwKDumFlgFMpPNd47hIJr2q1Q29XNS4z0GsUPlSDwG/yT
 ZZsEUObGg1aLjcIQzqWG/QYMTNTrASrwbD4qvsjBU6AT19RkauV4pYZto w==;
X-CSE-ConnectionGUID: Ro7u2uYHS8q91M8uLwWXAA==
X-CSE-MsgGUID: 3KVQO38DRgWJsg5u3VEA5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87959974"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="87959974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:34:32 -0700
X-CSE-ConnectionGUID: m7aJ+xUuRJyolgofdVEA9Q==
X-CSE-MsgGUID: ePi3vg4gTN2cZVJfxadOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273180950"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 07:34:32 -0700
Date: Wed, 2 Sep 2026 16:34:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 1/4] tests/kms_chamelium_color_pipeline: prefer
 igt_crtc_name() over kmstest_pipe_name()
Message-ID: <20260902143415.zgtnwjl5fg37co7u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1788252273.git.jani.nikula@intel.com>
 <939f7c55bbae51a09e8f0e5001682abf4e7c5450.1788252273.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <939f7c55bbae51a09e8f0e5001682abf4e7c5450.1788252273.git.jani.nikula@intel.com>
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

Hi Jani,
On 2026-09-01 at 11:46:37 +0300, Jani Nikula wrote:
> Reduce the direct pipe usage.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/chamelium/kms_chamelium_color_pipeline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> index db6107221d51..ee096f711a88 100644
> --- a/tests/chamelium/kms_chamelium_color_pipeline.c
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -188,7 +188,7 @@ test_plane_colorops(data_t *data, igt_crtc_t *crtc,
>  		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
>  			continue;
>  
> -		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> +		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
>  			_test_plane_colorops(data, plane, fb_colors,
>  					     exp_colors, colorops,
>  					     data->ports[port_idx]);
> -- 
> 2.47.3
> 
