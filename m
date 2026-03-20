Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3AF108B906
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB4F10E226;
	Fri, 20 Mar 2026 11:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUClm7QH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68510E226
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774007864; x=1805543864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eP4QRyWKFbh+j8/ziOGgJogCXud8YzSuNkIzLMTrtek=;
 b=SUClm7QHD19j9aOOOgchXXo+crrxpB2L859SBxeaqsPpHVXbAt9Ui3N+
 DqGmjQ/96kuIT9J4LojYR9VUeH96QngcD00qA4w4HznuA16ixepL0iXdN
 qahjCpKkGMIPhFxusbHZ3g88MGv+5IR0Fno10KeP3ELIAZPtL4KREZWHg
 CJLXhA0GLDjOrPF38RyveT8KA7NE/wSrkTBt20l32bHO74v2fK2lm9KFw
 biJ87Emy70ZDManGxNx4nhSj2Y4N4PV3oppubDGz5JorIUuc1mje+dxj7
 8Ir+4GBR6qf09FHgNjT5Qn68UvjnNMsDzkXbhtbBilO0YbkHsOYt4jpsN Q==;
X-CSE-ConnectionGUID: NMWIDnsCSJOrg32zG8gx8w==
X-CSE-MsgGUID: fqMu6p0hSxeHkmL3npRXKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74999874"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74999874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:57:43 -0700
X-CSE-ConnectionGUID: sMBJVe0HQvq014DRBNgS8A==
X-CSE-MsgGUID: nQ4fcuzIRf2MpWaXHOVDjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223485961"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.32])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:57:41 -0700
Date: Fri, 20 Mar 2026 13:57:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/kms: fix igt_crtc_connector_valid()
 validity check
Message-ID: <ab02MzmZP5c0UQWl@intel.com>
References: <20260320113143.2882422-1-jani.nikula@intel.com>
 <20260320113143.2882422-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320113143.2882422-2-jani.nikula@intel.com>
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

On Fri, Mar 20, 2026 at 01:31:43PM +0200, Jani Nikula wrote:
> output->config.valid_crtc_index_mask is a bit mask of CRTC indexes, not
> pipes. Check the validity using crtc->crtc_index instead of crtc->pipe.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  lib/igt_kms.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 71ed4604e7e0..318ff8ba9732 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -687,7 +687,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>  static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *output)
>  {
>  	return igt_output_is_connected(output) &&
> -		output->config.valid_crtc_index_mask & (1 << crtc->pipe);
> +		output->config.valid_crtc_index_mask & (1 << crtc->crtc_index);
>  }
>  
>  #define for_each_if(condition) if (!(condition)) {} else
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
