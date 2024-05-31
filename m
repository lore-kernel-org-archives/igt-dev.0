Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E23AC25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 07:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D1B11BF1B;
	Fri, 31 May 2024 07:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ON06MWSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C87211BF1B
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 07:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717139147; x=1748675147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J+LUGPaC0NOJC6eyHVXFYylshb2VGDNf3YnSd8MfXoU=;
 b=ON06MWSQZkeeZ477d0q6SubcS/2RCh2jMwJcrt/z4Eu6HGTfvwlS+L6e
 vwzArrkeHL4YL9XgmAGkyfRE4F1alOmbzCqA2YyCOaLgDeQYqFo0lETjY
 i3etS+9Y54vZ3879JxLjo2dHbhwgu++Qo0ZXKRgqbEd3Nc6e78NCOG9W+
 LUNhlyGvfb459dxR8/4cHK3WUc/Prnal160y+JFYuF6kYiFJB5Lk7y/6U
 eiFyCWvMZ0yzi4UoxWkGwio95+fS51t3ILaq9QtOlf3ywoR7G7lAuhNYn
 I2YsK5C0SpOY0777DcVd785qu8i2AqFW/HVE5nxfFohfuCHEb9iFaDHLp Q==;
X-CSE-ConnectionGUID: Leb84xqJRQ+yUOVQ8KoZUg==
X-CSE-MsgGUID: yu0d/cbHSTCUqULBSjaogQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13515127"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13515127"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 00:05:47 -0700
X-CSE-ConnectionGUID: 2t/CAyfuSp2UMKUyRxQt2g==
X-CSE-MsgGUID: ACaFJ1cLQ8K0oi6XBZ2WSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36069011"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 00:05:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 10:05:35 +0300
Date: Fri, 31 May 2024 10:05:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/5] tools/intel_vbt_decode: vbt defs update
Message-ID: <Zll2vyok_bzcjvhK@intel.com>
References: <cover.1717082630.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1717082630.git.jani.nikula@intel.com>
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

On Thu, May 30, 2024 at 06:26:03PM +0300, Jani Nikula wrote:
> Sync vbt defs from kernel. Split up by changes that require
> intel_vbt_decode.c updates, and the rest squashed as much as
> possible. Only minimal changes to reflect the vbt defs changes here.
> 
> BR,
> Jani.
> 
> Jani Nikula (5):
>   tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
>     d9981f36e4f3
>   tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
>     7234f948b58b
>   tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
>     6ac67ccf4c89
>   tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
>     8e26690851f9
>   tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
>     cd6891f8e371

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  tools/intel_vbt_decode.c | 136 ++++----
>  tools/intel_vbt_defs.h   | 715 ++++++++++++++++++++++++++++++++++-----
>  2 files changed, 691 insertions(+), 160 deletions(-)
> 
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
