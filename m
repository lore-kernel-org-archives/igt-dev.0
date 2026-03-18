Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A501077609
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 19:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE62310E72E;
	Wed, 18 Mar 2026 19:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TD9MrY9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F4A10E72E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 19:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773860766; x=1805396766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xXOsX0972oZKq7xRnjnE2K0CSUqkCJwRlrH2gsgWyTM=;
 b=TD9MrY9rahv6/iUWdwNQ5SpVPt23ifxEGoKE0uUMql4UsMti1F56iXOB
 aMg2j96Es6N0l66Mpze2cy3ZpsVkIpMSeTyPNYNO/FSubbFLE+BF8hEyz
 7/kQR4f1EwFwhpWZfRfVdNVVzfkHPEB6AFisbldizzENVeBFRsEpg8Aqa
 r4ZKE8z7IiY9TJqw0dkOM3+DOWIfc3SY6AM1jhkVcwHjiUJd95eyeHFc2
 CZpwK5clevzq665aavFyfKgDSetDxx4lD2q5ZFL8i8Na6PxWIcrJ4VFbA
 F+euj8I+SOXAMTVmOU8HZXjSllOpKZpIVjPjW14VL91bPlkU6FrE0kGSo w==;
X-CSE-ConnectionGUID: 4bKpayuiT5G02kfHy/43qA==
X-CSE-MsgGUID: H757qAHhQhiu3cPUPjejQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74814944"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74814944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:06:05 -0700
X-CSE-ConnectionGUID: rcWixN0RSYSjaXTqYzJzCg==
X-CSE-MsgGUID: 2G/KTnCRREyFG9GZjTfegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218257754"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.36])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:06:03 -0700
Date: Wed, 18 Mar 2026 21:06:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sumit kishore <sumit.kishore@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v2] tests/kms_properties: Add skip on headless
 machines
Message-ID: <abr3mcfHCmNGsnR2@intel.com>
References: <20260318140120.283593-1-sumit.kishore@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318140120.283593-1-sumit.kishore@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Mar 18, 2026 at 07:31:20PM +0530, sumit kishore wrote:
> Print debug messages for sub-tests which are expected to
> skip on headless display systems.
> 
> v2: Use existing library function, instead of
>     defining new (karthik)
> 
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>
> ---
>  tests/kms_properties.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index f735839da..9f5649c90 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -377,6 +377,8 @@ static void plane_properties(igt_display_t *display, bool atomic)
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>  
> +	igt_display_require_output(display);
> +
>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>  
> @@ -400,6 +402,8 @@ static void crtc_properties(igt_display_t *display, bool atomic)
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  
> +	igt_display_require_output(display);
> +

I'm thinking these tests shouldn't even need an output. It should be
possible to set (at least most) plane/crtc properties regardless of
whether they're active or not.

>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
