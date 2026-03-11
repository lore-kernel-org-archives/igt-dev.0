Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4856112583D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 15:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EAA10E3E7;
	Wed, 11 Mar 2026 15:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0I4iD4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7659F10E3E7
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773241290; x=1804777290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pw+wTphDcU79EI1dvMgP/dnSPsl8ZSj1F3/kWRv5OB8=;
 b=K0I4iD4sG8tbRYJ9mXshIst4Y1jg/l8gxcAJ0CCpJr6nTII4O34yz90D
 BYisFyuKLn/DAI7SggTICWzlBZYOCWo+GPfwuEyB7B32kDLWkQHDdj7AX
 RXLV/9y7Eccy7eN/pBIngfjjpaAolrVewECSjFbtsCgw/0Y2xp9D/+Hd6
 Y8FF55anVDxQcKeIyuUkIJXY5CI07sLBwLgWrEypCti/fE+i1BsP7Yg6X
 s3iJ7wzKKWY9WGlhR/DO8HCO3bAWqrtpiTleEpU6M2jwTUlzGJgpnorW3
 K1nyAXgl+2sV/cfwdy1jPrWbSoePVmdRNX1n/fSP7zhOwF/XtmLKWFTzR A==;
X-CSE-ConnectionGUID: h3ZGzWe8QXyPknAj+fnEOA==
X-CSE-MsgGUID: viwg2FhER2SqPjROwjuO7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85789844"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85789844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:01:23 -0700
X-CSE-ConnectionGUID: Bglz+x/6Tfmk4X34Z0jZcg==
X-CSE-MsgGUID: Q+AR5Rf8QuqNBRRvh0bNOA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 08:01:20 -0700
Date: Wed, 11 Mar 2026 16:01:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>,
 Fei Shao <fshao@chromium.org>
Subject: Re: [PATCH i-g-t v1] Skip kms_flip for mtk
Message-ID: <20260311150118.w5igtysxekeoys2e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>,
 Fei Shao <fshao@chromium.org>
References: <20260309081406.19524-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309081406.19524-1-xiandong.wang@mediatek.com>
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
On 2026-03-09 at 16:13:59 +0800, Xiandong Wang wrote:
> From: Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>
> 
> The MTK DRM driver supports only async‑mode page flips, but the current
> kms_flip path still follows the non‑async flow. It sends an ioctl to the
> driver and then immediately issues the next ioctl without waiting for the
> MTK page flip — that is, without waiting for the CMDQ callback.
> This can lead to random failures because the kms_flip flow proceeds
> without checking whether the MTK DRM driver has completed the previous frame.
> As a result, the next ioctl may arrive before the previous frame is finished,
> causing a device‑busy condition. Based on this analysis, the current kms_flip
> test flow is not compatible with the MTK driver and therefore needs to be skipped.
> 

Which tests are you skipping? Which should still run?
It could help if you will write on which hardware you
tested this.

Add here few Cc, for example:

Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Nancy Lin <nancy.lin@mediatek.com>
Cc: Singo Chang <singo.chang@mediatek.com>
Cc: Gil Dekel <gildekel@google.com>
Cc: Yacoub <markyacoub@chromium.org>
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>

> ---
>  tests/kms_flip.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 49a5f4ed1..4669f49fc 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1824,6 +1824,9 @@ static void run_test(int duration, int flags)
>  	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>  		return;
>  
> +  if (is_mtk_device(drm_fd))
> +               return;
> +

You should use tabs here, not spaces.

>  	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
>  		return;
>  
> @@ -1901,6 +1904,9 @@ static void run_pair(int duration, int flags)
>  	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>  		return;
>  
> +   if (is_mtk_device(drm_fd))
> +               return;
> +

Same here. This could be corrected by checkpatch.pl so no need
for resend, unless you add more info in commit message.

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 


>  	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
>  		return;
>  
> -- 
> 2.46.0
> 
