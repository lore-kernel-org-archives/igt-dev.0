Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C189CD2CDF6
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4710E15D;
	Tue, 22 Oct 2024 15:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3RY6iRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E1310E15D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612481; x=1761148481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Na6aoehyyDV02D8hymnJxbQVZRpAj67YrqJ5l4B3PnM=;
 b=f3RY6iRdq+DwfecRhV+MmMqAvA8bhGL4+znP+D+0cF1bBn1+NHknCmbn
 cJ5Ix3hgRneUyW7tOxaFFAvVHc8ms4NnAAeAavXTq9SbMBXAYpJBIktpL
 lXo4Tt4E5pky1loVQ6czlArfeFGXSFjf5eWmz9eGqdtAgKjJlwB/qnrdc
 os0J9pstCl1+whuUV6f932mDFoptIm1lXmsV6fqFzIHgkwc6gJlHKC1WX
 HWbLMZr1vmpxM2bTduKeYdcKpE47xIgG83IbTSxh9kCi7UxPT7vzArfZb
 G9s8Qum9e9e6/dqpKWirJkdufkuIWrFrmQESoxmB9Q4wDi7mYEz+SGko5 A==;
X-CSE-ConnectionGUID: 7mJL3VfcRAiEeLeMZ1vqug==
X-CSE-MsgGUID: 5x0HFtNLTey2R1js+8B8jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40553277"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="40553277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:54:41 -0700
X-CSE-ConnectionGUID: fIBlS2mVTHWyH15pMYp/GQ==
X-CSE-MsgGUID: p3rUudA2TSak2flmeAcpFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="110692059"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:54:39 -0700
Date: Tue, 22 Oct 2024 17:54:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 04/14] lib/igt_draw: Support 8bpp int the
 mmap/pwrite paths
Message-ID: <20241022155437.tkz4rqwipzi4b5xb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004104121.32750-5-ville.syrjala@linux.intel.com>
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
On 2024-10-04 at 13:41:11 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Handle 8bpp pixels formats correcly in the mmap/pwrite
> methods.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_draw.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 54c46fe6360c..b39a33dcf2cb 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -365,7 +365,10 @@ static void tile4_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
>  
>  static void set_pixel(void *_ptr, int index, uint64_t color, int bpp)
>  {
> -	if (bpp == 16) {
> +	if (bpp == 8) {
> +		uint8_t *ptr = _ptr;
> +		ptr[index] = color;
> +	} else if (bpp == 16) {
>  		uint16_t *ptr = _ptr;
>  		ptr[index] = color;
>  	} else if (bpp == 32) {
> -- 
> 2.45.2
> 
