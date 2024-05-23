Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4671C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 10:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413AD10E379;
	Thu, 23 May 2024 10:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLrMGiwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BD810E379
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716459873; x=1747995873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yG1SL0c4qOIbOwzryqdbWhZ1ehoKSVVVybO4lg0++jo=;
 b=CLrMGiwrDmiW11FcU07z3Roy29JnCC71qh3HcD0ujTQC/3DjG8C/LK9K
 sCCYHEBJujQuolHzxQ0EEld3GTcJXAHj5MVSMqd96Nk8DuIAMeCS9KW0D
 4p/zBlFvS9TaEt2UlplApUoI02TNjyeaOg8i86SOJWSdtIqHemNm2HzBy
 5AUULe21lE9UDQ33OOnbKkXiLk5Cpbsz/J7t01AnagXE/sxHfkgRY8SOH
 /7zs8lmyOZc9j5dE4yVw/uideLcs6vTlT80mRdqVaRNRQUnJGw4kpAIEX
 cxzK1mq39RIrveTs26qs0qDrdbqCGpqaT+uTwuIr828HKNxMD30fzPEQq g==;
X-CSE-ConnectionGUID: WlVI3sMgRSOq9/em5Ab3yg==
X-CSE-MsgGUID: wLeQjoWST2KMrBAUlbFrdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16592859"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16592859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:24:33 -0700
X-CSE-ConnectionGUID: zeix3kuCTHihKSWJuEJlrA==
X-CSE-MsgGUID: PPXwg/zuSpa78oUOrMfzhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="33603100"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:24:31 -0700
Date: Thu, 23 May 2024 12:24:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel: check drmModeGetConnector()
 return value in i915_pm_rpm
Message-ID: <20240523102429.wbwantolqbanskcv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-3-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523084426.284894-3-luciano.coelho@intel.com>
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

Hi Luca,
On 2024-05-23 at 11:44:26 +0300, Luca Coelho wrote:
> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in init_mode_set_data(), so fix that.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  tests/intel/i915_pm_rpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 52e00489da70..10a545f173de 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
>  			data->connectors[i] =
>  				drmModeGetConnector(drm_fd,
>  						    data->res->connectors[i]);
> +			if (!data->connectors[i]) {
> +				igt_warn("Could not read connector %u\n",
--------------------^^^^
Why warn? imho igt_debug would be better.

Regards,
Kamil

> +					 data->res->connectors[i]);
> +				continue;
> +			}
> +
>  			data->edids[i] = get_connector_edid(data->connectors[i], i);
>  		}
>  
> -- 
> 2.39.2
> 
