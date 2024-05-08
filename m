Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92973C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 14:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1015E10EA47;
	Wed,  8 May 2024 14:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2TQMDBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF36112319
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715178195; x=1746714195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=itg0SpFzHAXKCy5MPWKOePr3yuw7qkDhO6H/QH0e4uM=;
 b=f2TQMDBfJOnVYBqJrD2MLzGcroHjWrliD4Np2n99tOKwKzfVXIQpCtii
 70Glcv+YixYvkCPIKmr5O6kb5aOeydXwPvROnIXJxXEzZsBMcAlGGjTOQ
 0Np1mvy8jL/7Goa6w0OAk5STYxnR3LLVQIcoVJPiI7AWm0Z2pPlC23Tv7
 JauqU0xiwEPN5639S7Wb2J1d0uxHylXdzHRcKvh+8v7CWNPfjuEduVXzC
 wNXTy3wFezrMdtVaZUCIuKumAxJNDnaSFzJYS2QBWi7UKf2NZMivrFjnY
 BnS0T1Wuz0GWpsYDYBGGT6if8H3fn9dg9mFj74Ql1n2ljJX4A/5SzxL/z w==;
X-CSE-ConnectionGUID: 5ukDEJLRQLyezeejhQRLDQ==
X-CSE-MsgGUID: bTaV1ls1SW6GNPvrJMhqOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10883246"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10883246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 07:23:15 -0700
X-CSE-ConnectionGUID: MGP6c/8UQaSJMg8D06oBXQ==
X-CSE-MsgGUID: dwocr2CxSXSMuDMkEAX/2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28863594"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 07:23:14 -0700
Date: Wed, 8 May 2024 16:22:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
	jonathan.cavitt@intel.com
Subject: Re: [PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
Message-ID: <20240508142255.jo6pmyrpbzvbqtdh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 jonathan.cavitt@intel.com
References: <509c80865fe3460ba32ac25b49bb6ed1c40a6b33.1715109028.git.jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <509c80865fe3460ba32ac25b49bb6ed1c40a6b33.1715109028.git.jagmeet.randhawa@intel.com>
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

Hi Jagmeet,
On 2024-05-07 at 12:23:12 -0700, Jagmeet Randhawa wrote:
> Fix typos to follow proper format.

While at it could you also rephrase it somewhat?
See below, no need for sending new version, just
reply in this thread.

After agreement I could merge it with ack from Jonathan.

> 
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  lib/xe/xe_spin.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 381e5e950..2dbd51199 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -162,7 +162,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>   * xe_spin_started:
>   * @spin: pointer to spinner mapped bo
>   *
> - * Returns: true if spinner is running, othwerwise false.
> + * Returns: true if spinner is running, otherwise false.
>   */
>  bool xe_spin_started(struct xe_spin *spin)
>  {
> @@ -262,8 +262,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>   * xe_spin_free:
>   * @spin: spin state from igt_spin_new()
>   *
> - * Wrapper to free spinner whhich is triggered by xe_spin_create.
> - * which distroys vm, exec_queue and unbinds the vm which is binded to
> + * Wrapper to free spinner which is triggered by xe_spin_create.
> + * which destroys vm, exec_queue and unbinds the vm which is binded to

imho better would be:

 * Wrapper to free spinner created by xe_spin_create. It will
 * destroy vm, exec_queue and unbind the vm which was binded to

What you think? Jonathan? Btw 'triggered by' could stay, no strong
opinion for 'created by'.

Regards,
Kamil

>   * the exec_queue and bo.
>   *
>   */
> -- 
> 2.25.1
> 
