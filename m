Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218A210775F9
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 18:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD75910E44F;
	Wed, 18 Mar 2026 18:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYK8Dg+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E602810E44F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773857039; x=1805393039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1BQmyERBSA+0ivxjx+HBgDTE/QyoMMEKxbOH1I5mPx8=;
 b=TYK8Dg+wG8BluhFs71oi8qekaa4Sd+kZ3AZl9XoxnjdFRbVXRCHhwGOu
 4Pm10j3yjGP6ljrb51c3yT/vscv1/EQnJ48qa5WgSls7f5lYGpGcCrZOS
 ri5eGURFY3rqjVhci/lEqumptZfZvh4UjzSH/9gpTM4ywbvMgLDvtTz/Q
 y/EtAABwC/oW/iH9G/2JAfwo2J0UL3i8f14Lp32fsv6aEbPW8Jl9dz7tX
 ZPNtbxfDIc6gyC0Pw98c1QTbuJ3NdIZakbjWnbY2/yEWCaklYBdCcBWDd
 +uJQaY26z5C8e6W0DAqBdvW6chsCzb1sFpcX8THc+0DeYoShbq26Ni9G4 A==;
X-CSE-ConnectionGUID: Gx4tHQQGQDGpMO7BSZ1xEQ==
X-CSE-MsgGUID: 2Goay6FKT72hQJkz73kAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="77528843"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="77528843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:03:58 -0700
X-CSE-ConnectionGUID: emN1Swq8TQGotoB5qvJuAg==
X-CSE-MsgGUID: jyhPO5SfQWK76byBDKHuNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218701100"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 11:03:57 -0700
Date: Wed, 18 Mar 2026 19:03:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t 02/12] tests/amdgpu/amd_multidisplay_modeset:
 Prepare for returning NULL from igt_crtc_for_pipe()
Message-ID: <20260318180355.y2ozu3vb5d7u53dk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
 <3b9a58fa7b3865f1e57049a9c0bf68caa89f8684.1773659680.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b9a58fa7b3865f1e57049a9c0bf68caa89f8684.1773659680.git.jani.nikula@intel.com>
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

Hi Jani,
On 2026-03-16 at 13:19:04 +0200, Jani Nikula wrote:
> AMD should always have enough CRTCs for the test. Assert this is the
> case by checking the CRTC is valid.
> 
> This prepares for returning NULL for invalid pipes from
> igt_crtc_for_pipe() by ensuring the test logic is sound.
> 
+cc AMD devs
Cc: Alex Hung <alex.hung@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/amdgpu/amd_multidisplay_modeset.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
> index 40d1e5d7f42b..ebcfea8ee35f 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -327,6 +327,8 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
>  
>  			crtc = igt_crtc_for_pipe(display, j);
>  
> +			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
> +
>  			igt_create_pattern_fb(data->fd, kmode->hdisplay,
>  					kmode->vdisplay, DRM_FORMAT_XRGB8888,
>  					0, (buf + j));
> -- 
> 2.47.3
> 
