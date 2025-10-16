Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF653CCD195
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 14:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9318010E9F7;
	Thu, 16 Oct 2025 14:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6Z4rTCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370A10E9F7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760625462; x=1792161462;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DOoujPRt3/0FxVL+G/b+dmS14etXuTn4PCyEfxXRCDI=;
 b=T6Z4rTCjdx/gzk+rv1tVwMEdTUr6qSIHuWqyPgvjwxSjUN3PEVvFFSqp
 Ay/yjhmCIBwcBDF0vS0S9CQvQoW2ywmacsSQc7MtdFzmChddtPN5XmBoC
 IxDbDJQaet2TrecmGobS4Vc3d9ZYeJNc6+N6p2v28DvBf1jYjpmLJkA6U
 VbUr+zGTg6YJMPPxM1SAbrPh+/aRi0sm39EumVncIuRiVRDs2MjM+Estr
 CjMVQCGDz5QKGYnpqJ97Srarp6TNPAoZYZagWYrgny91scZkWvfdhZhHc
 OnnHvIlSTGUO9VtZzhi1mV7276Wspo87mcRObCCbkPneCTg/QBeJxDVSr A==;
X-CSE-ConnectionGUID: pEkW12cqQe6vJJwvaQRKzg==
X-CSE-MsgGUID: +kwbxLmATmKOUCvkTHgKRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62747609"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62747609"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:37:41 -0700
X-CSE-ConnectionGUID: VTiVyvcdTfaUizUH1Tqf9w==
X-CSE-MsgGUID: dWSleT13TOWycluc/47Kvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186485264"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 07:37:40 -0700
Date: Thu, 16 Oct 2025 16:37:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 3/6] tests/kms_pipe_crc_basic: Use
 SUSPEND_TEST_DEVICES for MediaTek devices
Message-ID: <20251016143737.fw7cflwqqeh2h5b5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-4-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251012171459.3773990-4-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2025-10-13 at 01:13:13 +0800, Jason-JH Lin wrote:
> Update suspend test logic to use SUSPEND_TEST_DEVICES instead of
> SUSPEND_TEST_NONE if running on MediaTek devices. This change
> avoids use of RTC suspend commands that are not supported by MediaTek
> platforms, improving test compatibility on MediaTek hardware.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_pipe_crc_basic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index f1760d577d4e..9750d014cbb1 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -428,10 +428,16 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  
>  				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>  					if (tests[i].flags & TEST_SUSPEND) {
> +						enum igt_suspend_test test = SUSPEND_TEST_NONE;
> +
>  						test_read_crc(&data, pipe, output, 0);
>  
> +						/* rtcwake cmd is not supported on MTK devices */
> +						if (is_mtk_device(data.drm_fd))
> +							test = SUSPEND_TEST_DEVICES;
> +
>  						igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -									      SUSPEND_TEST_NONE);
> +									      test);
>  
>  						test_read_crc(&data, pipe, output, 0);
>  					} else if (tests[i].flags & TEST_HANG) {
> -- 
> 2.43.0
> 
