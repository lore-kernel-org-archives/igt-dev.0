Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500A31061B18
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 22:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD4D10E7BB;
	Mon, 30 Mar 2026 22:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRvJ9qcM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD6610E7BB
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 22:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774911436; x=1806447436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CQmx8My42ei5IkGT9rC110EXIhZXpwx03faHQoy9d3Q=;
 b=NRvJ9qcMITs5mdG1JVg/H2KM84unR2cUsF5DdLWqlk3a7bjDSM58Wp1o
 0WUWnmPDjXebmzvxEjXmgH2bkqgpAGfkIGOipZIXZ6jSIhW6D7/ofsluk
 cSuD1BYmyI5ZOh73ABKYSN7QJrB5QB9bjDtcCm7t+pPl5L3j5NDakXNHp
 vZPmO7WkEMApOF7ihI4wePZ9A3Ie0/LP6P7xYaIX4hiP0/WRhRWYrBg1K
 UC09CuIbti5PcBP15xoLDo5mYwroS39YuOLNc4//Pch6PVbekaj/ItA1+
 VNEahpaMdFPPvp7RSmlKwuJhDevEM+PbigjeppfTWUvyn9NuH6QxNVPmm A==;
X-CSE-ConnectionGUID: SSp2WLveQsiGxnehQyLBGg==
X-CSE-MsgGUID: okiDvqcZQ1uCpCb+Misfgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79816703"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="79816703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 15:57:16 -0700
X-CSE-ConnectionGUID: 6OrzQpJlRjqAyPHV/5jtpA==
X-CSE-MsgGUID: IsWry7G3T7eDTkBQ+tOt/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="222873804"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 15:57:15 -0700
Date: Tue, 31 Mar 2026 01:57:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/3] lib/kms: only keep valid igt_crtc_t around
Message-ID: <acr_yGTKiF9n2jVH@intel.com>
References: <cover.1774856079.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1774856079.git.jani.nikula@intel.com>
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

On Mon, Mar 30, 2026 at 10:36:27AM +0300, Jani Nikula wrote:
> Only keep valid igt_crtc_t in display->crtcs[] and make
> igt_display_n_crtcs() return the actual number of CRTCs on the device.
> 
> Jani Nikula (3):
>   lib/kms: start returning NULL for invalid pipes from
>     igt_crtc_for_pipe()
>   lib/kms: use a for_each_crtc() loop in igt_crtc_for_pipe()
>   lib/kms: only keep valid CRTCs in display->crtcs[]

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  lib/igt_kms.c                           | 51 +++++++++++++------------
>  lib/igt_kms.h                           | 14 +------
>  tests/amdgpu/amd_multidisplay_modeset.c |  2 +-
>  tests/intel/kms_joiner.c                | 14 +++----
>  tests/intel/kms_joiner_helper.c         |  4 +-
>  tests/intel/kms_pipe_b_c_ivb.c          |  4 +-
>  tests/intel/kms_pipe_stress.c           |  6 +--
>  7 files changed, 44 insertions(+), 51 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
