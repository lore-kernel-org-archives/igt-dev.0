Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C14ACCD195
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 14:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AC910E9F7;
	Thu, 16 Oct 2025 14:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfZO3Wg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E0210E9F7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760625335; x=1792161335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vSbdDoAmDJNLafU10bLNyYCwHtEvs5c9QfgW17UAzPM=;
 b=YfZO3Wg+vaArZMvYxbZSqwFCMax7v8k1LUK+dxeTWJhGCI5/0y2nQ67z
 BgNOLSY7eo8XNPKXa4to5w8hy8JHAdAzmh8QpCcQvkmM3f2H/CZYaAfSb
 FkIB2xISIpxzMmDq3LEj+wpykt5U0b+WKEgfF0K/WOf+H70sGX4wjtKQg
 /DV2UFMsclTDvZ+5QVCHh+Nt2i5xH/W2woyZ+J3m3iu9HvJA/5KPZJSjM
 EvmfudOrQoqz4BV767YjFghzWbnqkwxCNAgRplVJWV/501tdGhoe303Lj
 GD4DcGgBb3pPGDGc4fWRyfLGoFgjL26tVt6WYQYD7zGJho1Dbg1zFzsrB g==;
X-CSE-ConnectionGUID: 7nqDGg2/TsC1aRj43tQl6A==
X-CSE-MsgGUID: rhl8Ho47T5GLucVZVF/xLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62720440"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62720440"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:35:35 -0700
X-CSE-ConnectionGUID: oLFUnASlTXa0RdQ85G6l7g==
X-CSE-MsgGUID: BJUFsSH/QvOtHbR0dkiz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187557316"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 07:35:32 -0700
Date: Thu, 16 Oct 2025 16:35:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 1/6] tests/kms_hdr: Use original 512x512 fb size on
 devices without scaler
Message-ID: <20251016143506.vg3ly5raelx5xssl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251012171459.3773990-2-jason-jh.lin@mediatek.com>
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
On 2025-10-13 at 01:13:11 +0800, Jason-JH Lin wrote:
> Ensure devices without scaler retain the original 512x512 framebuffer
> size during plane setup. Previously, all outputs were set to display
> resolution size, which may not be supported on devices lacking scaler.
> For such hardware, always use 512x512, matching the initial framebuffer
> creation, to improve test reliability.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

+cc Khartik and Swati

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> ---
>  tests/kms_hdr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 33b6c42a65fb..9c2a91f01e71 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -203,7 +203,11 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
>  	 * smaller plane size in following tests.
>  	 */
>  	igt_plane_set_fb(data->primary, &afb);
> -	igt_plane_set_size(data->primary, data->w, data->h);
> +	if (get_num_scalers(display, pipe) >= 1)
> +		igt_plane_set_size(data->primary, data->w, data->h);
> +	else
> +		igt_plane_set_size(data->primary, 512, 512);
> +
>  	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>  	if (!ret) {
>  		data->w = afb.width;
> -- 
> 2.43.0
> 
