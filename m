Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01590C79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 08:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64DC10E6C6;
	Mon,  7 Sep 2026 08:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Whpb1iI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CD610E6B6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788768698; x=1820304698;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3CmLG7gBlDSzEOJFxqbv2HTp+GRH5yBlRhk9G3qvJ+8=;
 b=Whpb1iI7TqFBvPIFyPRQxJ/7kcHO/PlLVzcA7rkZCMBRknMRFORRcwLz
 MPvg+6zXLC2P8oG5+XoSStBJTrH84AJ4lfdfMaGeE5Ef1SK92G/pUBbAJ
 /9n4c6Ha7SCC6EzDxr0f7/McTHQc5SwlKyJ9DTuqbCzjFODW95AeDRPzv
 gvWkVbA0zRnsp6sEwCJ7X4NuqY87MtXDU1CyKWPOW1i5Qu+JUgdhz3bhe
 +DbgrcSq851l2iE/rPmTn7kubN7xYRk1vwCSczS5zTS/yOajdzm73qhED
 F3/l5Y72aeR2YwA73ikFy9Ij7lg4M+4vjmbzAFD6+XnRkFgnz1iZs2RoQ w==;
X-CSE-ConnectionGUID: 4QOs2uepQ0CXkTCy6rE4gA==
X-CSE-MsgGUID: ea4d7rVoTm240nvOjcx4Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89187718"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89187718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:11:38 -0700
X-CSE-ConnectionGUID: cXU5RGC4SHyR7LggajNN/Q==
X-CSE-MsgGUID: 3BhHIFG0RlCtf1UmXGEIEg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 01:11:36 -0700
Date: Mon, 7 Sep 2026 10:11:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v2] tests/kms_atomic_transition: Skip blocking
 transitions on MTK
Message-ID: <20260907081117.akwajbnkcfbw27ib@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260904015911.19651-1-xiandong.wang@mediatek.com>
 <20260904015911.19651-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904015911.19651-2-xiandong.wang@mediatek.com>
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
On 2026-09-04 at 09:58:54 +0800, Xiandong Wang wrote:
> MTK blocking atomic transition commits do not satisfy the
> immediate page-flip event or out-fence completion check used by
> this test.
> 
> Keep nonblocking transition variants enabled and skip only the
> blocking transition variants on MTK. The separate modeset
> transition tests remain enabled.
> 
> This is a temporary test limitation until blocking atomic
> transition completion is supported by the MTK DRM driver.

You s-o-b is missing here, please add it here, for example read
https://patchwork.freedesktop.org/patch/750905/?series=173370&rev=1
and look into line just before '---'
or read CONTRIBUTING.md

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
