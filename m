Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F63D2CDF7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0BA10E053;
	Tue, 22 Oct 2024 15:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ki2X8yTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C017510E053
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612528; x=1761148528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AVBT/rGrhAg3iiS3/ytp44aUgw0oYc71mEuQW7GVJKE=;
 b=Ki2X8yTdRUfpcIZJ9ygjlsDFcuZm5O7h+PlVTXvt7sLzTRQs6/mQq5CD
 fHrFFrN3ub3+FguQRs5/ErozJOKa/tZOsAWIaIdFeLtTJpoRRBW13sg0b
 4ad7hyf+XLpzq4ZH391b5xM7zO67JRsq8uxPbcioYm+vJa4N5eTPIw02I
 ebKbxOOFa1PexHw4J+15WREG7sX0fGrk0+yZQLwParSDt8HKge5p23shM
 uzVHJycVB5MUj2Y7r/G1EPwXoqSVHezQ5Yf7bZFb2AFBpAx2QM3jOs1hb
 s0ofmFYxRYvqOGpaJxUahLMfcCuOCEqhalt0jcPurTqpU0uwHUiH5ZcUu A==;
X-CSE-ConnectionGUID: UTnc8j1JQBivVaDLS83uCQ==
X-CSE-MsgGUID: FlUgq5JARm6k0SyOEdnfNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32852644"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32852644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:55:28 -0700
X-CSE-ConnectionGUID: qdFCRJ7hSy2Ti6ZSrA5vww==
X-CSE-MsgGUID: U3qlUnT2RkaryOMXiosqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84523932"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:55:26 -0700
Date: Tue, 22 Oct 2024 17:55:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 03/14] lib/igt_draw: Support 64bpp int the
 mmap/pwrite paths
Message-ID: <20241022155524.725xyqvpoj2t6qr5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004104121.32750-4-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-10-04 at 13:41:10 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Handle 64bpp pixels formats correcly in the mmap/pwrite
> methods.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_draw.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 917cc37a2175..54c46fe6360c 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -371,6 +371,9 @@ static void set_pixel(void *_ptr, int index, uint64_t color, int bpp)
>  	} else if (bpp == 32) {
>  		uint32_t *ptr = _ptr;
>  		ptr[index] = color;
> +	} else if (bpp == 64) {
> +		uint64_t *ptr = _ptr;
> +		ptr[index] = color;
>  	} else {
>  		igt_assert_f(false, "bpp: %d\n", bpp);
>  	}
> -- 
> 2.45.2
> 
