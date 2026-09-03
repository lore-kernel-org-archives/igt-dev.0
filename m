Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A37C61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 11:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FAA10E0E8;
	Thu,  3 Sep 2026 11:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4Xv6XYb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C31B10F540
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 11:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788436054; x=1819972054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/rxVDMwuvq7hckNo8ZtccaKj2/HQi3Ta2rycI2Z7ts4=;
 b=H4Xv6XYbmVYAZMIPW5kPUy17asrKsRCK7owqzIJ0JmmLAqkVyIegau5f
 Zlxa8n/dHoVoid3bPnLVbmMMaGrhphXKlg5aBlyETWxQW92ZbhVr+MmIm
 1sNYiKWOeNFQ6e6LSeTLkh3XnsujQUSjzCFof0sPO0fPxBdIB2bMBCKOe
 gZi3KWOUJkjUPUfGKwfORtbWeomxeqReWf6WbjxnwcCes0Fs/xNBSANa7
 fhQBa2Gn5ABYBhBxrfu66L0lyzp0mEq7rKio8XWIXQDHQhfLmKs6JhTXu
 XIQws33yrm8Rc8C4rxZE4bQ3gYcW8ITuNcUXnv4tx1ytvZiivgQGP9jsv Q==;
X-CSE-ConnectionGUID: hl3OqDhFS5i3Q6a/ETzt1Q==
X-CSE-MsgGUID: EWhpvuA2RKm2E9T65edqgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88763228"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88763228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 04:47:34 -0700
X-CSE-ConnectionGUID: WXzupWZRT+mQYj4eIDK8xw==
X-CSE-MsgGUID: /0Zy1OIHRJuxupnFCTeRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="266000210"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:47:32 -0700
Date: Thu, 3 Sep 2026 13:47:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>
Subject: Re: [PATCH i-g-t v1] tests/kms_atomic_transition: Skip blocking
 transitions on MTK
Message-ID: <20260903114729.l2y6ud5b6qrc5zuh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>
References: <20260903073900.7877-1-xiandong.wang@mediatek.com>
 <20260903073900.7877-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903073900.7877-2-xiandong.wang@mediatek.com>
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
On 2026-09-03 at 15:38:30 +0800, Xiandong Wang wrote:
> From: Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>

This should use your mediatek e-mail: Xiandong Wang <xiandong.wang@mediatek.com>
please configure your git to use it.

> 
> MTK blocking atomic transition commits do not satisfy the immediate page-flip event or out-fence completion check used by this test.

Please fold this line at 65 column.

> 
> Keep the nonblocking transition variants enabled and skip only the blocking transition variants on MTK. The separate modeset transition tests remain enabled.

Same here, fold.

> 
> This is a temporary test limitation until blocking atomic transition completion is supported by the MTK DRM driver.

Same here, fold.

> 

Your Signed-off-by: is missing:

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>


Regards,
Kamil

> ---
>  tests/kms_atomic_transition.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 37dc77c28..a05a98575 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1288,6 +1288,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  		igt_describe(transition_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
> +			igt_skip_on_f(is_mtk_device(data.drm_fd) &&
> +				      !transition_tests[i].nonblocking,
> +				      "MTK blocking atomic transition is currently unsupported\n");
> +
>  			pipe_count = 0;
>  
>  			for_each_crtc_with_valid_output(&data.display, crtc,
> -- 
> 2.45.2
> 
