Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657D71125841
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 15:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC12610E205;
	Wed, 11 Mar 2026 15:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M01RnxFV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B4F10E205
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773241558; x=1804777558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eeQCIWHnTcr6CqqgyKa+gvP+ukYUgsaydR35FRQFCKM=;
 b=M01RnxFVgK1uBZWluVcjg/0+1ecWB6YDjuWglcRXKd4sJxDMzlBnq80e
 mG+idt9j9bmtrNa4BEGs1HUonVqNgawO/pQJN6GF2GRQsms7RyTe2shDl
 f7F42A0oUXXlwn8Q818Oqf8QrUayGdruWLDPvaNN3i+8CIq2regUsD2Bs
 khG1g4r9ga8Z7tdtz9LEPDwJMLSW8vDsas9j3ucWzWN84xneW+A2GOUcn
 86oXMb0PhWzjefJypx67Z0It7Tckdmq6bX05BexB8HZjMhCmYMAxuyTU5
 rPqwzEZemTMeIuonyyljc5mD45Omi9JWpKOg1HHZkABYeQOGytPYrGQTx A==;
X-CSE-ConnectionGUID: LlHWHm/gRYCCjiWpyz3Slw==
X-CSE-MsgGUID: 9R5hNSpDQNW/FwD4dHpyQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85401708"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85401708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:05:56 -0700
X-CSE-ConnectionGUID: PHdHWrGNRKGKXbl4JY4ZnQ==
X-CSE-MsgGUID: uPlgvT3MTyKn2Q+TSeS/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217151690"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 08:05:53 -0700
Date: Wed, 11 Mar 2026 16:05:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Wang@mediatek.corp-partner.google.com"
 <Wang@mediatek.corp-partner.google.com>, 
 Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>
Subject: Re: [PATCH i-g-t v2 1/1] Skip kms_flip for mtk
Message-ID: <20260311150550.bowsl5ywresnli25@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Wang@mediatek.corp-partner.google.com"
 <Wang@mediatek.corp-partner.google.com>, 
 Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>
References: <20260309085017.20019-1-xiandong.wang@mediatek.com>
 <20260309085017.20019-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309085017.20019-2-xiandong.wang@mediatek.com>
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
On 2026-03-09 at 16:50:09 +0800, Xiandong Wang wrote:
> From: "Wang@mediatek.corp-partner.google.com" <Wang@mediatek.corp-partner.google.com>

Using 'From:' here should follow one from s-o-b below, so it should be:
[spaces removed]From: Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>

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

Same note here, are you skipping all tests? Or only selected ones,
so please write which should still be tested.
If skipping all, you could add skip directly in first igt_fixture.

> 
> Change-Id: I80b23c8c26254a29721ccdc02e69fa5643067c24

Remove this change-id. This could be done at merge time, so
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>
> ---
>  tests/kms_flip.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 49a5f4ed1..69e74e96a 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1824,6 +1824,9 @@ static void run_test(int duration, int flags)
>  	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>  		return;
>  
> +	if (is_mtk_device(drm_fd))
> +		return;
> +
>  	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
>  		return;
>  
> @@ -1901,6 +1904,9 @@ static void run_pair(int duration, int flags)
>  	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>  		return;
>  
> +	if (is_mtk_device(drm_fd))
> +		return;
> +
>  	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
>  		return;
>  
> -- 
> 2.46.0
> 
