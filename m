Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84635C79F82
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 09:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EBE10E84D;
	Tue,  8 Sep 2026 09:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dyFWiReU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361E210E71D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788861511; x=1820397511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DzqqXJMvx5DYim3wgoCPwR6/seAuouWznGbW+8k4DsQ=;
 b=dyFWiReUgSWiohGeHcOYCBBgF8eVBF3qjzK1Y30tQzkrHwEBp2miWoeO
 VUDh1CAYlJ/Se7JG+2Bt/V+crlqH2hAUiQJTqsjTH58h0in1UffQExWjw
 E9+4yqKS5G5/WRb9ExxnnuDxjNj2LgIImdTfG5ERDJjv3KfYDq1WlHcg2
 0tPt+oXPToMXvr7CgktGDdKBWwnXHywtNqjMY2Ap7EDHWCKo9qBE+ZFTY
 U8uUJ3/ovnaqJ9ggg92w+Xct9W1YLIHzzodAWg8SZYJrveVvax3+hVDgr
 5YULaC4D0EcH+uuHGSz+I0NdosAFYFd5AzwomXSFaVQNdDYfwqH8qMeao g==;
X-CSE-ConnectionGUID: JRkhqhYKTIm1/Vomj/vKVw==
X-CSE-MsgGUID: OQJsCu4JTLuBDT7WkLBBlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106774129"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106774129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 02:58:31 -0700
X-CSE-ConnectionGUID: zfq7EQDNQQKMK0PKBsKA5Q==
X-CSE-MsgGUID: E9J89kmfQWS8KatDucu4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274745160"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:58:29 -0700
Date: Tue, 8 Sep 2026 11:58:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3] tests/kms_atomic_transition: Skip blocking
 transitions on MTK
Message-ID: <20260908095811.uiogsa34t7tjrhtl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260908074849.29238-1-xiandong.wang@mediatek.com>
 <20260908074849.29238-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908074849.29238-2-xiandong.wang@mediatek.com>
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
On 2026-09-08 at 15:48:39 +0800, Xiandong Wang wrote:
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
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I will merge it soon, thank you for your contribution.

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
