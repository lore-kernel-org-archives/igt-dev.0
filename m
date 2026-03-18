Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C6D10854DF
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC5510E032;
	Wed, 18 Mar 2026 09:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKsLxkr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4E110E032
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773827718; x=1805363718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IJ5eNL6D7aIAza+/cF9l3YnCoN2Pm4tSdbIB6hBXJhM=;
 b=PKsLxkr0l2vI5Jti+6uxlAiHx3I4oBZi/2xTQgkgG48cvje9r9WRQDC6
 1myWmRgd1ajrs8DsjsPpP5PNSr755JrsoTU8Z5SC/9sV1cKWbFjH7wLd9
 dIguoS6ZFbLKaUPH9RWme7LvOCcvst/UxIf5PnvFGSS7Rhobxn0ABYt0p
 TNrilHKJFt9e+23XvI2eQmQWa4+KVooiQLMCw68Rq0kvxhe4dHlc75ZA1
 c9zcZsAUqGkKDAWc6qKFXaQEbXJHbkdUQi2RIXqNU1UUUjk8kPKSCbP2b
 8rwoOEtmsWh1TORLF5XgpytM28Z6EUJqzTONE3mmxirfnzPQv31J2EqAN g==;
X-CSE-ConnectionGUID: H5Vt9a4JRuqWLEMpaE/Shg==
X-CSE-MsgGUID: +X2LazLPQkWCoGnjLfksEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74851969"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74851969"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:55:17 -0700
X-CSE-ConnectionGUID: FD6k+CSHRemlhPvaA4yOgw==
X-CSE-MsgGUID: eVfa+Y6oSDKnUz6tva7eIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="227042393"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:55:15 -0700
Date: Wed, 18 Mar 2026 10:55:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, wayne.lin@amd.com,
 Mark.Broadworth@amd.com, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH 3/3] lib/igt_hdr: Fix EOTF bit flag checking
Message-ID: <20260318095512.frocf3mcnhtgsox3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 wayne.lin@amd.com, Mark.Broadworth@amd.com,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
 <20260317175136.3754576-3-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317175136.3754576-3-alex.hung@amd.com>
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

Hi Alex,
On 2026-03-17 at 11:51:32 -0600, Alex Hung wrote:
> EOTF values are bit positions, not masks. Use (1 << value) to create
> proper bit masks when checking HDR support in CTA-861 EDID blocks.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  lib/igt_hdr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> index 6368ae78b..e1bd69087 100644
> --- a/lib/igt_hdr.c
> +++ b/lib/igt_hdr.c
> @@ -151,8 +151,8 @@ bool igt_hdr_cta_block_has_hdr(const char *edid_ext)
>  {
>  	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
>  	     (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
> -	    ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
> -	     (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
> +	    ((edid_ext[2] & (1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR)) ||
> +	     (edid_ext[2] & (1 << HDMI_EOTF_SMPTE_ST2084))))
>  			return true;

This could be sent separatly after Swati patches are merged.
+cc Swati
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

>  
>  	return false;
> -- 
> 2.43.0
> 
