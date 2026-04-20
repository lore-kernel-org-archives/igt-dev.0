Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889D2F5A8A6
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 18:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3AE10E72A;
	Mon, 20 Apr 2026 18:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgaDMt3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E64E10E72A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 18:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776709015; x=1808245015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xoot+ImdZQslo/0EYdB1W1xybSbOqOxp6Laqt0BQl0k=;
 b=DgaDMt3+lFqBRy1p/DZSr9Zoi+I/I2COjKPHeZFB5aCl7RaD0PnxZunv
 YDzCAGUVeHrJ2zJc10Qdwo0JS93VA4Chfl1opmVrRT6XUkniqagkHvo+E
 4+bzpGwpUGrNVPaidP480J9ACUfnzvs2Ili29K6RjhHxS9kC42CefMrcG
 W1cUIRE8psXYJnMbzsyg5n7G3uilrGPyKLxwtNnkQX3PRIhPeZDVfGDio
 vWcohmyCRv7hyfFXlYFvI/LBsJVlOLVwAj9FRYrmu8evptRBlXR3C7KQx
 gyXDCs5a4kG5idLbP4MmDdSgxv2ZZKAeIG6Uyp0adpxtCz00DP3Zt6yOi A==;
X-CSE-ConnectionGUID: urqBFkIgRxe777RBBYL3Wg==
X-CSE-MsgGUID: wj+SZLd0SQCSkMPG0V/rBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65168865"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="65168865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 11:16:55 -0700
X-CSE-ConnectionGUID: pQsMFt18QB+KqJkATM/PHw==
X-CSE-MsgGUID: BX1PCsntRaCcwjLbjIVwcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="236788085"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 11:16:53 -0700
Date: Mon, 20 Apr 2026 20:16:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>
Cc: igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms: correct index validation logic
Message-ID: <20260420181651.ox3divkbdpmuvj2t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>,
 igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260420074925.1710024-1-jingpingjan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420074925.1710024-1-jingpingjan@google.com>
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

Hi Jing-Ping,
On 2026-04-20 at 15:49:25 +0800, Jing-Ping Jan wrote:
> Based on the original implementation and the comment above the function,
> it appears the expected behavior is for the plane indices to remain
> consistent with those in crtc->planes. Therefore, after swapping the old
> and new primary planes, we must update the index in igt_plane_t to
> ensure it matches the corresponding index in crtc->planes.
> 
> Therefore, we should expect the indices of the old and new primary
> planes to remain unchanged after swapping them.
> 
> Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> ---
>  lib/igt_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bec96f267..405a04640 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display)
>  				igt_swap(*old_primary, *new_primary);
>  				igt_swap(old_primary->index, new_primary->index);
>  
> -				igt_assert_neq(old_primary->index, 0);
> -				igt_assert_eq(new_primary->index, 0);
> +				igt_assert_eq(old_primary->index, 0);
> +				igt_assert_neq(new_primary->index, 0);

Do you have an error report for this? This code is lib
and should also trigger in Intel CI, unless it is a dead
code.

+cc Karthik, Swati, and J-P

Regards,
Kamil

>  			} else {
>  				igt_assert(old_primary == new_primary);
>  
> -- 
> 2.54.0.rc1.513.gad8abe7a5a-goog
> 
