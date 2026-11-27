Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9E606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ftEaOFLW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888E910E9F2;
	Fri, 27 Nov 2026 12:55:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E03D10E501
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795784084; x=1827320084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dE78uLYBGaTwhEACMKRJtS4PyG3/g/HcdMIk/qdU8wc=;
 b=ftEaOFLWNId3FA5cc/wo7X1TmyIdbmsjwJouPOQryxI7o6BSG3t/PFLh
 pDwnWpQqWBbWEQOjPMKf+c0zoo9gO2ew9CIoQY1UATCF2GKjrwlFOgP3x
 hljv+Wz5trYElC35+6E62sfqDKM5kaK/iO8cpE5uXJLk/DpE8rSVgIQtr
 tIesFXVPgdCYfg7Zbql/RcrcSOtN1DhGGjeSG7O9sdWzl3mfgsTNWU2uV
 NKPAJR+brBqLtI17OZEP/2Sk6w5EkzbhNeSGnbWh2WF2YlSsDwaGZL0uB
 qo9tEWTq9TCHWvvuY7PdMaymeyG4s5AWfT0NvKTQHarOTElODmWLY7xwF A==;
X-CSE-ConnectionGUID: 6m5pd7hkSyWyOA5KMXa0zQ==
X-CSE-MsgGUID: fAMpLJuGQGKafOWrJvN/yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4604869"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4604869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:54:44 -0800
X-CSE-ConnectionGUID: VLbOZsJLQ1aExlooiGnoJA==
X-CSE-MsgGUID: yWEyXdHBRqOAsX52APo4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12653088"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:54:42 -0800
Date: Fri, 27 Nov 2026 13:54:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Roy <rongh7426@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_bw: Skip when pipe CRCs aren't
 supported
Message-ID: <24cpuk75t2x75i2fjd6n5rcoveo5cjgunmyal3mb7bsddjegq4@6rx5tejdygpb>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Roy <rongh7426@gmail.com>, igt-dev@lists.freedesktop.org, 
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
References: <20261126162433.665660-1-rongh7426@gmail.com>
 <20261126162433.665660-2-rongh7426@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261126162433.665660-2-rongh7426@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Roy,
On 2026-11-27 at 00:24:33 +0800, Roy wrote:
> Every subtest collects pipe CRCs, but the test never checks that the
> driver supports them. On a driver without CRC support each subtest that
> gets past the mode checks fails in pipe_crc_new() instead of skipping.
> On a Raspberry Pi 5 (vc4) that is 32 failures:
> 
>   (kms_bw) igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->ctl_fd != -1
>   (kms_bw) igt_pipe_crc-CRITICAL: Last errno: 2, No such file or directory
>   Subtest linear-tiling-1-displays-target-1920x1080p: FAIL
> 
> Add igt_require_pipe_crc() to the fixture, as other CRC-based tests do.
> 
> Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39): 32 fail and
> 96 skip before, all 128 subtests skip after with "crtc-0/crc/control"
> missing.
> 
> This change and its description were written with the help of an AI
> coding assistant (Claude); the test runs above were done on real
> hardware.

Move after '---'

> 
> Signed-off-by: Roy <rongh7426@gmail.com>

Will you change into full name?

> ---
>  tests/kms_bw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 10bb520..a56b4ee 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -336,6 +336,7 @@ int igt_main()
>  		igt_display_require(&data.display, data.fd);
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
> +		igt_require_pipe_crc(data.fd);

Nice catch, LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

+cc Swati and Karthik

Regards,
Kamil

>  
>  	}
>  
> -- 
> 2.51.1.windows.1
> 
