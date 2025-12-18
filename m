Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3729D6ACE4
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 10:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A692B10EE13;
	Thu, 18 Dec 2025 10:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQSKYo7n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C144510EE13
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766054796; x=1797590796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e6npKBIB24euUId8NkVrMS5xThO8Ay+VKVcx8THvnUE=;
 b=OQSKYo7nFjKwvD7LTwc0TPNw+TDQefOo/thTdG5AnfWQqYpmZ2wfLkrJ
 FMxA1h40zuqr0zs6KpN6PVCu0DxtrBL8eyaNx4/gO7+17MJ/sRf0/T+fG
 MjFXwRvs+rGQdwsx4O5qaEmQzFO2yNiqqgZXbuhEOD4TjNyQTlJFRRwD3
 mEHxO3tvdrXs++fRyRbotKXtqFr+HPHahtwkx3qJg5+/TllX/vbO/s44K
 pYrbH2rGpAkkNb/5rH/VjUV6hxZI1oAbb2XSK+SaSKaT1M28rcff+S7BT
 Zt3Ke0DNH/yG5M0owO53wWqkx9b1RmGGXrZO10nZ1MKHSDGrlTWqyQoUc w==;
X-CSE-ConnectionGUID: nz5M3BJnScuW2oePAUUIpA==
X-CSE-MsgGUID: tU68IGdbR8WSBTJ7U4OLmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="93479676"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="93479676"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:46:35 -0800
X-CSE-ConnectionGUID: 8lGD1tbwSjugvSOtw/Yx5g==
X-CSE-MsgGUID: ySdhv+FGTtS9PoHskl50gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="202734105"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:46:34 -0800
Date: Thu, 18 Dec 2025 11:46:32 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lig/igt_fb: fix x-tiled framebuffers on intel xe
 driver
Message-ID: <iykhllmt5sydhnqdqvvxztffdp7zv2qdsfxhzg42uurguj3pmm@7jvcz6ua3fl2>
References: <20251218091326.341270-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218091326.341270-1-juhapekka.heikkila@gmail.com>
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

On Thu, Dec 18, 2025 at 11:13:26AM +0200, Juha-Pekka Heikkila wrote:
> On igfx x-tile was not utilizing blitter on Intel Xe driver
> causing crc mismatches. Here fixed that.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 0a8299d26..28b1db921 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2643,7 +2643,7 @@ static bool use_blitter(const struct igt_fb *fb)
>  	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>  	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>  	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
> -	       (is_xe_device(fb->fd) && xe_has_vram(fb->fd));
> +	       is_xe_device(fb->fd);

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
>  
>  static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
> -- 
> 2.43.0
> 
