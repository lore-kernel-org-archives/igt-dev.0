Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26118E7E0CD
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0EA10E434;
	Mon,  9 Feb 2026 16:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLKzkxAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182210E434
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770654950; x=1802190950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y5qRW+DqHc6euNKjPcmgya5WMWDerzqe1R4tdpDPlPs=;
 b=eLKzkxAyT11ETFGoU/l0CMUAXvu2glqmFYhKuVQqqEz8C+map4KNux19
 y6sgAJQWqx2uqeRgYNJEUHWFsDfdIWB+5Oj+I/QXzCX/C1eiOzWVMeeiJ
 IzyVluItKoZLIXQRtXg/Fyc34O1dEzifzNN4Yq4HvrGZABPXAhBH4K/3U
 KtPQNBP5cXolCqHOkWCf1iO/Gx5dbw6EU2D4//TMima3Zbt5+xHWVYR03
 BMWVFFzrzOl4Ser+XC+cbqcW59v7vCI/WyR8EXLzL1GqfxpYDh6lYG4b5
 g+IywcLYvslGcVL/Pl7piV74QVtIl5gj2esATYIGYQ/glJrXloqxMBCa/ Q==;
X-CSE-ConnectionGUID: IusxU4p3QL2008b0fZJDXg==
X-CSE-MsgGUID: GCW8+6XEQHalTmkUeow8Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70785057"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="70785057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:35:50 -0800
X-CSE-ConnectionGUID: AFcKj//nQLuuM/iDY/LGuw==
X-CSE-MsgGUID: m0kd879iSOqIRg0FDQ24KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="215819831"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 08:35:47 -0800
Date: Mon, 9 Feb 2026 17:35:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "xiandong.wang" <xiandong.wang@mediatek.corp-partner.google.com>
Subject: Re: [PATCH i-g-t 1/1] Skip kms_flip for mtk
Message-ID: <20260209163529.35pn4gkccl4sq23l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "xiandong.wang" <xiandong.wang@mediatek.corp-partner.google.com>
References: <20260209020357.32744-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209020357.32744-1-xiandong.wang@mediatek.com>
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

Hi Xiandong,
On 2026-02-09 at 10:03:52 +0800, Xiandong Wang wrote:
> From: "xiandong.wang" <xiandong.wang@mediatek.corp-partner.google.com>

Hmm, this seems strange, do you mean:
Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>

If yes, please update your git global config so next submissions
will look like above.

As for a subject, when it is only one test change, it should
have a prefix with that test name, like:

[PATCH i-g-t 1/1] tests/kms_flip: Skip test on MTK platforms
> 

Please add description here.

> Change-Id: I80b23c8c26254a29721ccdc02e69fa5643067c24

This change-id is useless, it should be removed. You can add
it after '---' below, so it will not get merged.

+cc Karthik and Swati

> Signed-off-by: xiandong.wang <xiandong.wang@mediatek.corp-partner.google.com>

Same here, imho this should be:
Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>
or
Signed-off-by: Wang Xiandong <xiandong.wang@mediatek.corp-partner.google.com>

Which one do you prefer? This is up to you, please choose one of those
and use consitently in future.

All of above could be done at merge time, so please just reply
to this message with proposed description and I could merge it.

With above fixed this is
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil
> ---
>  tests/kms_flip.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index a74e69c6f..9524a9d4e 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1826,6 +1826,9 @@ static void run_test(int duration, int flags)
>  	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>  		return;
>  
> +       if (is_mtk_device(drm_fd))
> +               return;
> +
>  	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
>  		return;
>  
> @@ -1903,6 +1906,9 @@ static void run_pair(int duration, int flags)
>  	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>  		return;
>  
> +       if (is_mtk_device(drm_fd))
> +               return;
> +
>  	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
>  		return;
>  
> -- 
> 2.46.0
> 
