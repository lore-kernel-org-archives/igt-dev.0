Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799FDC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 14:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DBB10FF97;
	Wed,  8 May 2024 14:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaPU8Kvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6291710FF97
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715178825; x=1746714825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+beNBY0Yj9Lx7OW337KTBP3My3zNoHoxTsUz3G2cIOk=;
 b=eaPU8Kvy4212JLxxgEcNcU5DgzhFhvDHXIju3eLk3YYQBUjmNDadz8wy
 1Jq/hA5eSI+H91+0Huh0dJQqD+KGXWwudcc22rfClj9cUigfeQj2qnouT
 2nICr1ynDr8dfG7imYwTOnXNAT4Hl1BgCeY2qU3vAIY0VOVDLTv3zaJ8y
 6eiW02u1ZEPPYZvML5vyLgIyujkm56IIxB9ysbnVO4Rckz2P3TN9u/SRl
 tI/5GINVKQGlLZWzS/Pn6Wv3kZC2CsZKB7f+a77ljuXCIqfdcyeObXiy1
 rnYmoAj5F2h2MgcujueZVo7jca+X8iQnuKHDEan7es3XZ9ASGBMn6bofO g==;
X-CSE-ConnectionGUID: 6mcXSMD8SEyRC1NBwpFRpQ==
X-CSE-MsgGUID: seTTO7bRTbif7iKpWg0slQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10879337"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10879337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 07:33:45 -0700
X-CSE-ConnectionGUID: KCn5Vw7sQWaAyFtaACh7GQ==
X-CSE-MsgGUID: qSTThgSpRZqkLCagmwxCyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28837935"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 07:33:43 -0700
Date: Wed, 8 May 2024 16:33:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
	jonathan.cavitt@intel.com
Subject: Re: [PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
Message-ID: <20240508143341.nmbqzf2ziwcroqmq@kamilkon-DESK.igk.intel.com>
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

Few more things, first is about subject:

[PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
----------------------------^^

Drop s/xe_spin.c:/xe_spin:/

Also if you will reword description, better would be:

[PATCH i-g-t] lib/xe/xe_spin: Improve comments and fix typos

Second one is about failures from CI, please reply to all
and clarify that they are not replated (as you didn't touched
any code).

Regards,
Kamil

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
>   * the exec_queue and bo.
>   *
>   */
> -- 
> 2.25.1
> 
