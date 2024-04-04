Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE03CD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 11:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D40511B425;
	Thu,  4 Apr 2024 11:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CL++waoz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C570E11B425
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712229899; x=1743765899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Zkd15t6HH7s4u6X7/zOnPhdLif4KMHtPd8gLyiVu2K4=;
 b=CL++waozIgX237iLRdieJENZHq73o/8E94A8AlWwv69HOq9dSBLxtade
 oYYEv9yZ16GQMuCH11PC/2kLndAenbGS2VCDGlDuP11OBkiCmI9p6AjPg
 UnCMelN//+Tlb6j+O0xoA6lPvjv77K8RUJv9hoE1EkdUn0Zym7psftuHZ
 GQvyfbBxYc3TTwEb+RJzDg+EWeTjsEYRASGwdOBaKYltYqUSTQLOlCGJW
 bViuoPytVoJSNrr41YSKMOqBOMsYfn3nOYz0dyXwdasuRHSvajnfqYPnY
 dmEAeuLfqKh55+HSxPVGHNNPMp/r1agl6boMvQEI2GJa+yfDwjH024KpQ A==;
X-CSE-ConnectionGUID: DA0srqnrSZSFX2G3bVPM6w==
X-CSE-MsgGUID: LyL7DTLcTHuliPpvobWGOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18118985"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18118985"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 04:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="827790389"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="827790389"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 04:24:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 14:24:54 +0300
Date: Thu, 4 Apr 2024 14:24:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: adapt to boolean debugfs for
 i915_bigjoiner_force_enable
Message-ID: <Zg6OBkziHZNLlN9u@intel.com>
References: <20240402054231.1499492-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402054231.1499492-1-kunal1.joshi@intel.com>
X-Patchwork-Hint: comment
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

On Tue, Apr 02, 2024 at 11:12:31AM +0530, Kunal Joshi wrote:
> adapt to boolean debugfs for i915_bigjoiner_force_enable
> 
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c38021dd7..2a518eb8d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6218,8 +6218,8 @@ bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool
>  	close(debugfs_fd);
>  	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
>  
> -	return enable ? strstr(buf, "Bigjoiner enable: 1") :
> -		    strstr(buf, "Bigjoiner enable: 0");
> +	return enable ? strstr(buf, "Y") :
> +			strstr(buf, "N");
>  }

It looks like IGT is forgetting to reset this after running the
bigjoiner tests. Random tests are failing due to the bigjoiner
being left on. Some are just modesets failing due to not getting 
the slave pipe, cursor tests are failing due to missing legacy
cursor fastpath with bigjoiner, and some PSR tests are failing
because the PSR code apparently doesn't work with bigjoiner.

-- 
Ville Syrjälä
Intel
