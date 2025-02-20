Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6B9C021AD
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 08:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296E910E181;
	Thu, 20 Feb 2025 08:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGAVLuh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9249E10E181
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740038882; x=1771574882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=H6kcg/iDQfSO8OA7pntCEkSWSz5sYOXMZz4qDL6TsQI=;
 b=JGAVLuh2RUkl/0jIi/HpPWuZiVZ/Of/wE6P7DGIa+oIXHAqBSoamoFJ9
 uSmtGr2qqfWN0wJ1+FK55klGr2KlE4fD69fW/vvctLXzgjd2FtxCyBJbE
 pj6iep7hfMmhlGSr+WCeTjLEo/BkxnkV0jJvmvJWMxGaov9zIdwDhXyxC
 rOD27Cg7ZSFLFyF66fxwkD5ZGRyfCoKs2WkkjKaUbSa3sxzbE1hJBO7i/
 m05uCmO8wHGNpjuE/IJiUE27G13vdgVl7fgqP6k6RWXFgssdSW7HYNTqy
 tL59iwrFzpI6wneEfVuKBwEgA2iAZoNqE1NgwL+wJfVxoJvLeaZbBHmKV Q==;
X-CSE-ConnectionGUID: asl0lYdlTz2OuqOYP3d8yA==
X-CSE-MsgGUID: 3b72/Jg0TNidp5RBYFXpiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40943365"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40943365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:08:01 -0800
X-CSE-ConnectionGUID: c51QK+fwR/eT94c1wCkJqw==
X-CSE-MsgGUID: KtZpmiz7Sb2Vfn4Y8Sqb5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152162157"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:07:59 -0800
Date: Thu, 20 Feb 2025 09:07:56 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_compute_preempt.c: Reduced
 child count for PTL
Message-ID: <20250220080756.wrplw54a7gutwvai@zkempczy-mobl2>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
 <20250217081854.3219791-6-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217081854.3219791-6-priyanka.dandamudi@intel.com>
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

On Mon, Feb 17, 2025 at 08:18:54AM +0000, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Preemption is not happening for long kernel when child count is beyond
> 50 in PTL for compute-preempt-many test and its failing user fence.
> So, reduced child count for PTL.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_compute_preempt.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 5319dee7b..d4c243c16 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -64,8 +64,16 @@ igt_main
>  				continue;
>  
>  			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
> +				uint16_t dev_id = intel_get_drm_devid(xe);
> +				int child_count;
> +
> +				if (IS_PANTHERLAKE(dev_id))
> +					child_count = 50;
> +				else
> +					child_count = 100;
> +
>  				test_compute_preempt(xe, hwe, false);
> -				igt_fork(child, 100)
> +				igt_fork(child, child_count)
>  					test_compute_preempt(xe, hwe, false);
>  				igt_waitchildren();
>  			}
> -- 
> 2.34.1
> 
