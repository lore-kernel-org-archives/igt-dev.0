Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C396D10775F9
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 18:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BC710E4F2;
	Wed, 18 Mar 2026 18:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbdqvE5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB7210E4F2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773856901; x=1805392901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GY2jy/jAmPGiTCSmURbOCQGyIThQ1Q1vIXbxFaK7pKU=;
 b=JbdqvE5VQCfxTQk9HeG79lDYG5afvxOXAnoEHbx6zujwex4dHmTk5n55
 qU3QkqeWyz89BZFKK0xC1IcwnaZuNGxlGNtaIJobgq9MYsK4XrhaNleWS
 uOrUs3SwSON1SsTq+CL6oNTBay0U9JWtiDNskb3fPle6R42E6f2AC13Os
 iUiXkIioLULL3oATeN6q1Se71cwmy3SyqGSGw+/uFwNp7GIKjT5rjMY1f
 JpEIeozOwfzQWuML14sRp8FpmtRc/9UJipztLJ2Rww4guCjvnjjunggAn
 egI6r3/eZKwQAoXMAfTm1KFwpnbJDNGMn0+l4jTPqb7JDQvfOGEP5CL1O A==;
X-CSE-ConnectionGUID: dLUn3G+rTMKFnnwuIOBjwA==
X-CSE-MsgGUID: wf4CgNx8QHC8yBDHb1GaIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74810997"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74810997"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:01:26 -0700
X-CSE-ConnectionGUID: M9tCVdkiT6CaMxTGjutVHA==
X-CSE-MsgGUID: qvMTqRuJRburZ/pwKjaytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221786531"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 11:01:24 -0700
Date: Wed, 18 Mar 2026 19:01:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t 01/12] tests/amdgpu/amd_mode_switch: Prepare for
 returning NULL from igt_crtc_for_pipe()
Message-ID: <20260318180108.vnqsmithuivxe3lw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
 <9fb29dd8fcfa356cfe1a40e63977870779f277bd.1773659680.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9fb29dd8fcfa356cfe1a40e63977870779f277bd.1773659680.git.jani.nikula@intel.com>
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
On 2026-03-16 at 13:19:03 +0200, Jani Nikula wrote:
> After checking there are enough pipes, AMD should always have the
> CRTCs. Assert that the CRTC is valid.
> 
> This prepares for returning NULL for invalid pipes from
> igt_crtc_for_pipe() by ensuring the test logic is sound.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

+cc AMD devs
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

> ---
>  tests/amdgpu/amd_mode_switch.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
> index 4da07c412996..ffa2952bb5c2 100644
> --- a/tests/amdgpu/amd_mode_switch.c
> +++ b/tests/amdgpu/amd_mode_switch.c
> @@ -98,6 +98,8 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  	for (j = 0; j < num_pipes; j++) {
>  		igt_crtc_t *crtc = igt_crtc_for_pipe(display, j);
>  
> +		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
> +
>  		output = data->output[j];
>  		if (!igt_output_is_connected(output))
>  			continue;
> -- 
> 2.47.3
> 
