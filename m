Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C1CD2CDFD
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B5D10E208;
	Tue, 22 Oct 2024 16:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0f8g5K1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CC210E208
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729615292; x=1761151292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UIGTau97j0SaFIs8HXJyRVGyQlNZwATQgpHQbov83kM=;
 b=h0f8g5K1nhjQ5WH5f2mrEtmhMz8heYZFuZgU6qTb5d1Zpgk1mqN/O5MH
 Fp8/Zdk/djidBUoFmOPXR3K7tS662fmgIc4ey6e9Zu2D5iTsCq0wW+7gW
 8Dszt/vW+4iC9Ay3mV9AR5E98RXpBQlBi1+yaXof7U+RNCdbOuceRriYf
 m5TzRIgvEZ7PY8AA98xPlr0xrRwm9IxCt3IIMc4VfWmAuxxAVXJY78s9k
 cVLXnCEb8cM6tAKQif7jeoXetXjzWLjOe92OQU6M8zkNdY0LU5KINWtMp
 hBP4P0BVaOotE3ZifuBiB1ye9X8wyIvvxb4Kd+r6NDVQGtnIEKBHepe4O Q==;
X-CSE-ConnectionGUID: riWNbIyGQWWbHuS6p0P8wg==
X-CSE-MsgGUID: HRylBryzSjGGoVh94RSwDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28618360"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="28618360"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 09:41:31 -0700
X-CSE-ConnectionGUID: J6ZEBBaqR4WiF9msutbsqA==
X-CSE-MsgGUID: h3NEDQ+rRqWxoYg10eJStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="117386686"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 09:41:27 -0700
Date: Tue, 22 Oct 2024 18:41:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v6 01/12] benchmarks/kms_fb_stress: Set
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS before igt_require()
Message-ID: <20241022164124.znqskt5vbrmxszwf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
 <20240912-kms_fb_stress-dev-v6-1-71e9a65397e9@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240912-kms_fb_stress-dev-v6-1-71e9a65397e9@riseup.net>
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

Hi Arthur,
On 2024-09-12 at 21:39:25 -0300, Arthur Grillo wrote:
> After commit dc2d7fb4f978 ("lib/igt_kms: move setting
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback") igt_require() no
> longer sets DRM_CLIENT_CAP_WRITEBACK_CONNECTORS. So set it before
> calling igt_require().
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/kms_fb_stress.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 00eaa0a4931a..804bb81a4cf7 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -145,6 +145,7 @@ igt_simple_main
>  	enum pipe pipe = PIPE_NONE;
>  	struct timespec then, now;
>  	double elapsed;
> +	int ret;
>  
>  	data.kms = default_kms;
>  
> @@ -152,6 +153,10 @@ igt_simple_main
>  
>  	kmstest_set_vt_graphics_mode();
>  
> +	ret = drmSetClientCap(data.display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> +
> +	igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> +
>  	igt_display_require(&data.display, data.fd);
>  	igt_require(data.display.is_atomic);
>  
> 
> -- 
> 2.46.0
> 
