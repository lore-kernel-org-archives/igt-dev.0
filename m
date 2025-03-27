Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E94EC3600E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 07:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A6010E860;
	Thu, 27 Mar 2025 07:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaEX83wF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AB810E85D
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743061449; x=1774597449;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WZgOrUCx/tI6+vc8ASxIt99G2s4nlzncBmSpQbkPRd0=;
 b=OaEX83wFOK4QrXXs2I22wavqRLer1CE6REigPGJyXZC3TLQUT5TbENjS
 yRzjlzDfzA5S1eEUYAPiFAV6EjoQoALI0kUVpGJPtRIefJFgr1OVNSAx4
 pKATphU/8SAOMOz6aKWUKRWsp/Ir2rZesludlLRQZ0NNxPzK2lvYHNYZp
 5gh6VSXTH1uI41Dn6EahuAnbjueJjIPAnfxDJQiO9WHuDQGJKeGEAv/r/
 a1z13ZEBr2OgxF7fXiaBcdk3+l2OwwAsaIS+g77FXEo4s1q8Cw0km/zcm
 YzPLpRwXpmwoDTsjOmXw3f/BrENC8OkUlpUydo0BJnhwgq3MJdrNj6YsH Q==;
X-CSE-ConnectionGUID: r2afnFRNSNu2aF88hsrIFg==
X-CSE-MsgGUID: B3b+QKrAQ1yLucXM2nriNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44100922"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44100922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:44:09 -0700
X-CSE-ConnectionGUID: ucbLqmFlS46PoRDtoUnbBg==
X-CSE-MsgGUID: 7BBLgRRjSD64Vw2yZEojNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="124861789"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:44:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: Re: [PATCH i-g-t] lib/dsc: use intel_display_caps instead of
 i915_display_capabilities
In-Reply-To: <11948989-bead-4a14-8659-a86ccf0dd139@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250325130842.1821042-1-jani.nikula@intel.com>
 <48a20710-a884-45f1-8485-ed1f17450741@intel.com>
 <878qos87nx.fsf@intel.com>
 <11948989-bead-4a14-8659-a86ccf0dd139@intel.com>
Date: Thu, 27 Mar 2025 09:44:04 +0200
Message-ID: <87cye27waj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 26 Mar 2025, "Sharma, Swati2" <swati2.sharma@intel.com> wrote:
> Hi Jani,
>
> Thanks for the reply.
>
> Patch LGTM.
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Thanks for the reviews, pushed.

BR,
Jani.


-- 
Jani Nikula, Intel
