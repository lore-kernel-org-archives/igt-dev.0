Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E377CAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572F110E485;
	Mon, 29 Sep 2025 19:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fpc5AbVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710F910E485
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173626; x=1790709626;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=zIuWcBS8AgL7foEhU3Z8sokMM3hkCatlL2cMi+w3NiQ=;
 b=Fpc5AbVKQJTSAvP/TAyJuK5eS9ElOpJmtlPZpRMTXGxlvbBfKpc2sPAI
 vxeFMMbqSiIpfUJGYRTqR/k48z10cnk0XMWhQirnFFeKjUSKsK+7jz8CE
 tdWua7wUaY4OftXmJNkmZIpCfZ2ICRHaWY2XFcqYG+GBjQqEZIU+P0uJJ
 wcBNNed+brbFTDhmjqNVfKi/Drc501iFr65/zkR/cFjUasOYVNlZMRMb2
 4fB6K3O9Sw6ucOWX/uy8lpwI1pHMUiIN7+TwCQX4gmHQBJI7fTZQtdvV6
 cAkeraK+p5hAdf5wOnwbxGCfDOwMMC1pmh2hhD4Mcs48kzoBCb4PrMzPh g==;
X-CSE-ConnectionGUID: 17XPtXxwRbKx0Q0zh8ABtg==
X-CSE-MsgGUID: 91RvdtmNS02vgsIUHPtg6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589748"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61589748"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:20:23 -0700
X-CSE-ConnectionGUID: m0WjC0YNQsuCMNDGq4CtFQ==
X-CSE-MsgGUID: 44/PbTXaSxyUdmAsGUWsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178249850"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:20:22 -0700
Date: Mon, 29 Sep 2025 22:20:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/6] tools/intel_vbt_decode: Improve decoding to
 strings
Message-ID: <aNrb3WxoneGD6RIW@intel.com>
References: <20250929190721.29997-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929190721.29997-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Sep 29, 2025 at 10:07:15PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Make it easier/safer to decode VBT values into a string representation.
> 
> Also decode a couple of new (or rather old) things.

Please ignore. Incomplete series because gnome-keyring barfed yet again
in the middle of the series :/ I'll try to cook up some kind of a retry
kludge to make it more realiable...

> 
> Ville Syrjälä (6):
>   tools/intel_vbt_decode: Introduce to_str()
>   tools/intel_vbt_decode: Use to_str() more
>   tools/intel_vbt_decode: Convert eDP deocding to use to_str()
>   tools/intel_vbt_decode: Use panel_bits()
>   tools/intel_vbt_decode: Decode display refclk mode
>   tools/intel_vbt_decode: Decode the backlight control method type
> 
>  tools/intel_vbt_decode.c | 264 ++++++++++++++++++---------------------
>  1 file changed, 123 insertions(+), 141 deletions(-)
> 
> -- 
> 2.49.1

-- 
Ville Syrjälä
Intel
