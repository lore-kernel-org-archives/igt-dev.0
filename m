Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B51C44539
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 10:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068AE10E429;
	Wed, 22 Jul 2026 10:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haM1l6gE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE98910E429
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784717496; x=1816253496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yIhrrI+uc41H8rb/toqJkBLN8Mjb8qOrhhBeZ9mWbdM=;
 b=haM1l6gEljLa/8Xk7tYPB8X3rw6Gi5t4vsAyIMC0TeNS8597etGynGBW
 ySj/Pwgb1NP8n79XCYuUGVSoQXnjO4na0YteUt4P/9qDD48njLtz5dH6Y
 XqW7jgz1x4E8uRB7MKTVU8jCMhds6Ry/VpK/wNa8sVCqKrAO+pV4glG39
 WYeUCMpqF4sQSSd/lUFpzuiaDTtQepil8pTliA91Bns1IcZvNET3vkVZC
 sAIT+IRqnlaKQAmz69tYL+13KgV1L7gdgP4h3zoIHgdKpXAlrRiBiQb5Y
 RVb6bb3eCcjZWeitUBWn8EpYxNb/HGQO5l10TXxKWJXZKpI3VMDvE4sN7 Q==;
X-CSE-ConnectionGUID: DlcJslnkQOml0Mdjjy5lJQ==
X-CSE-MsgGUID: hmRUK6yLQHuSKCZc5Vd8nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="89241856"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="89241856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:51:36 -0700
X-CSE-ConnectionGUID: KMr6OuUyQ7ivJN+7XlTt4Q==
X-CSE-MsgGUID: dF9HZqXjTC+6huPH+HFyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254147303"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 03:51:34 -0700
Date: Wed, 22 Jul 2026 12:51:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com
Subject: Re: [PATCH] lib/xe/xe_query: Add xe_for_each_gt_with_type iterator
Message-ID: <20260722105132.qlgk4ixfu2tmqrbh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com
References: <20260602160149.971895-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602160149.971895-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2026-06-02 at 18:01:49 +0200, Lukasz Laguna wrote:
> Add xe_for_each_gt_with_type() to iterate only over GTs of selected
> type.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  lib/xe/xe_query.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 8815c6c66..a11dd623d 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -103,6 +103,9 @@ struct xe_device {
>  	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
>  	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>  	     igt_unique(__mask) &= ~(1ull << __gt))
> +#define xe_for_each_gt_with_type(__fd, __gt, __typemask) \
> +	xe_for_each_gt(__fd, __gt) \
> +		for_if((__typemask) & BIT(xe_gt_type(__fd, __gt)))

Please add newlines before and after this new define.
With this fixed
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  #define xe_for_each_tile(__fd, __tile) \
>  	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
>  	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
> -- 
> 2.43.0
> 
