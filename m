Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A06C98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 15:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7191B10E938;
	Wed, 23 Sep 2026 15:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ag8WIXHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598FF10E934
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790178660; x=1821714660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A2ohk1BH0cQk4rKOBdLXnmc3f3B9Mi8o8/t5sIybdvI=;
 b=Ag8WIXHjI82kM1WA1E+EdCRd4aMbIxH5tRec4AQ/Lb77wsTNw63zglMd
 zcHhSOWRa94oQsJgx7QGM3oHjpRQep5CN4duif1oMCEf8k0C04zd0yC4D
 1j8sLGo6Rj0QdTLz6DOXbXIoeKtibY5hpnuUwmgRFewRAy1R7/Y7gP3Fr
 qUBt3Q8fEO+VeGsNGwl85DS+yb2KCgrFJLDdMYCY5GdzYiIAZL2iyNvLD
 OKr7e9D+v2EtermY6+sn9vcHqcMhNwAjcRQU2UNxbTRJYRcvsqqG6Tfwa
 7bKAJbedORaijtoJ9fLy9ufX5KD+CDYmLZKAtXj2VsVx/nTH0nN6RIjBw g==;
X-CSE-ConnectionGUID: gpCMvPrgR0WLdf2MT1ES9Q==
X-CSE-MsgGUID: 2Mq0B5QkSqe5OvBaF8XTBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90913465"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90913465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:51:00 -0700
X-CSE-ConnectionGUID: kg6reI4MSrm59DIKECwv2g==
X-CSE-MsgGUID: u034y403RP63IyY7eKwQ6w==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:50:59 -0700
Date: Wed, 23 Sep 2026 17:50:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com,
 Alex.Hung@amd.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH] tests/kms_atomic: skip missing CRTC props in state
 snapshot
Message-ID: <20260923155056.2xe4lrrnr4ksa3ka@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com,
 Alex.Hung@amd.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
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

Hi Aurabindo,
On 2026-09-23 at 11:21:13 -0400, Aurabindo Pillai wrote:
> crtc_get_current_state() always calls igt_crtc_get_prop() for
> BACKGROUND_COLOR after 10fc80949. Drivers that do not advertise that
> property (amdgpu) fail igt_crtc_has_prop during atomic_setup, so the
> entire kms_atomic suite dies on the first connected CRTC.
> 
> Only snapshot properties the CRTC actually has; igt_crtc_reset() already
> guards the BACKGROUND_COLOR default the same way.
> 

+cc Karthik B S <karthik.b.s@intel.com>
and Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>  tests/kms_atomic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 09b7915af..20bb80182 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -230,7 +230,7 @@ static void crtc_get_current_state(igt_crtc_t *crtc, uint64_t *values)
>  	int i;
>  
>  	for (i = 0; i < IGT_NUM_CRTC_PROPS; i++) {
> -		if (crtc_filter(i)) {
> +		if (crtc_filter(i) || !igt_crtc_has_prop(crtc, i)) {
>  			values[i] = 0;
>  			continue;
>  		}
> -- 
> 2.55.0
> 
