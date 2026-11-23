Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F60606A31E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eoB3WT8L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B79910ED07;
	Mon, 23 Nov 2026 11:16:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A53910ED07
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795432517; x=1826968517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3YsYbjOaaztSLnSCdB2XcvcjYal5YZI5OIk14VVNOEE=;
 b=eoB3WT8L/DgcLgHRvJPuMc2AzDSBjYfCto+g6Otm2xlatZq54+fPph4k
 UwBX04FAlDeHZoyQ2OkBfvWGFX7HnbfOlGT9amUdsFnUy7UvXL5WWedhs
 2EfRRXAIGZKE5yZTwBtVp5POYDf64uDTzOFdB3tcC1NTjSIZoIwwhZ+uz
 oQUroq1d3JR8VIG4s+o/MeAaz7YBsFleRrrqRIkEjsdMnwQaMHAP6R6C8
 xo6gXm+Ix2iDLsq6H97BxkvpC/jlpPSU1vDcXsHqz1dk0qT5uyIUtJbUY
 9skYauv2q8Cj/U6bMHO2tgPd5IfWm+q5QmIQDljKDtovb4zAHx2jQOdG+ w==;
X-CSE-ConnectionGUID: izBaeHhoTQ+M1sm5+8C3Zw==
X-CSE-MsgGUID: HYNbFp3jRjWoxdAFE+dnvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4128979"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4128979"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:15:17 -0800
X-CSE-ConnectionGUID: tC5NrloUT4Sbol/5u3NTTg==
X-CSE-MsgGUID: uPO8YVt2Rcugrnv3JG8TXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11371219"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:15:16 -0800
Date: Mon, 23 Nov 2026 12:15:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Avandhica S R <avandhica.s.r@intel.com>
Cc: igt-dev@lists.freedesktop.org, sowmiya.s@intel.com
Subject: Re: [PATCH i-g-t v2 2/2] Add pixel format support
Message-ID: <bxhzbym3nk7jrm7plnqgxyi72mxsh6zhh3soboj5v2pdfuxpvu@iq5z2ptylrop>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Avandhica S R <avandhica.s.r@intel.com>, igt-dev@lists.freedesktop.org,
 sowmiya.s@intel.com
References: <20261123101055.583218-1-avandhica.s.r@intel.com>
 <20261123101055.583218-3-avandhica.s.r@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123101055.583218-3-avandhica.s.r@intel.com>
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

Hi Avandhica,
On 2026-11-23 at 15:40:55 +0530, Avandhica S R wrote:

same here, use prefix in subject to indicate which test
you are changing.


Regards,
Kamil

> Extend kms_plane_multiple to test multiple pixel formats
> and modifiers, including XYUV8888, XRGB16161616F, YUYV,
> XRGB2101010, and XRGB8888. Add support for testing these
> format and modifier combinations on both single-display
> and dual-display configurations.
> 
> Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
> ---
>  tests/kms_plane_multiple.c | 282 ++++++++++++++++++++++---------------
>  1 file changed, 169 insertions(+), 113 deletions(-)
> 
[cut]
