Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFABBCAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 13:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7037510E7DC;
	Thu,  2 Oct 2025 13:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7OHty2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D5610E7DC
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759411269; x=1790947269;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5DE5LDeIwhyCx6YVXzZHDggCRBcr0Ke9zUscnlcuPP4=;
 b=A7OHty2AsvN3EXtzTCIeihFnvb/rq6ViuRHh3A0b8yLMoVnP0ShaUXqY
 s5zqN3Sfjzfk1VFQ6jQ0KqfVw2VI7Zuxpdi6/P01p2qqudL4Y8mFW+g68
 QcEbsRHhfUQLVsydcYw9oMCNiP7Z0hArh3lzSb8G4SfbV5CDrFkTWPpxe
 EVSISULRzDlphft/SK3h/RLrObRPpvykaopv58UYKSYTA6Qfzfpuf1IkI
 qCsstZlwe5NdXOHAPqHVew+aziG1WUoHh24yPe5w/2iw8YxCo4ZpeRy5P
 y7x9vwRFWPKycax6RmBLOs75M+z00LrVwQ3Xl9Il8v8UEbdxnquaJx56x A==;
X-CSE-ConnectionGUID: NWCSa2JgTlaipSK8XIot1g==
X-CSE-MsgGUID: TAaxDT/MR6WQXOQwUATg1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61582136"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61582136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:21:09 -0700
X-CSE-ConnectionGUID: UssgbqDqSH6tqIupWmzLIQ==
X-CSE-MsgGUID: 99m+ZjXnSuWm2XY0+j+Dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="179061282"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 06:21:08 -0700
Date: Thu, 2 Oct 2025 15:21:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Check for HDCP
 before setting displays.
Message-ID: <20251002132105.r2jvf5as72pdywdd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20251001183958.3383532-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251001183958.3383532-1-markyacoub@google.com>
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

Hi Mark,
On 2025-10-01 at 14:39:58 -0400, Mark Yacoub wrote:

remove dot from subject, so it will be:

[PATCH i-g-t] tests/kms_content_protection: Check for HDCP before setting displays

> [Why]
> Drivers such as VKMS do not support HDCP, so the test fails on

Please decipher VKMS here for more clear description, like

Drivers such as VKMS (Virtual KMS) do not support HDCP, ...rest follows...

> `modeset_with_fb`:
> Test assertion failure function do_display_commit, file external/igt-gpu-tools/lib/igt_kms.c:4632
> errno: 34, Math result not representable
> 
> [How]
> Move the HDCP check before any modesets.
> 
> Test: kms_content_protection on AVD with VKMS

Please make it a sentence and add newline before any cc: or s-o-b,
like:

Tested on AVD (please write here what ADV means) with VKMS.

+cc
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  tests/kms_content_protection.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 51fc1d3be..effeb66dc 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -638,22 +638,20 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>  
>  	for_each_connected_output(display, output) {
>  		for_each_pipe(display, pipe) {
> -			igt_display_reset(display);
> -
> -			igt_output_set_pipe(output, pipe);
> -			if (!intel_pipe_output_combo_valid(display))
> -				continue;
> -
> -			modeset_with_fb(pipe, output, commit_style);
> -
>  			if (!output_hdcp_capable(output, content_type))
>  				continue;
> -
>  			if (is_output_hdcp_test_exempt(output)) {
>  				igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
>  					  output->name);
>  				continue;
>  			}
> +			
> +			igt_display_reset(display);
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
> +
> +			modeset_with_fb(pipe, output, commit_style);

I am not sure if this is correct so I added Karthik and J-P to cc.
Karthik or J-P: could you look into CI fails? At least in Xe I see
fails in this test.

Regards,
Kamil

>  
>  			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output, pipe, commit_style, content_type);
> -- 
> 2.51.0.618.g983fd99d29-goog
> 
