Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A47CCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 12:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371B710E408;
	Thu, 23 Oct 2025 12:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCwmX0D2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19EA10E408
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761224226; x=1792760226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=egerHcJVp+Mw9szxJKZdaklVNh8TdsyE3Z4d2WWxwjQ=;
 b=YCwmX0D2DAZt/5/LtmUQQj68OsHePXkslPKNTBAhWs9uSUN0EFeFebw7
 HDnVO8hl3kZ0xMcJj+X3dQHz3f+KenSqdd8Wh36DE89hqTkwEDSTX1v7+
 6dvUFp+SlEcrQovuqRxYErcGUldpxsN8QtinselLR9wgyG6qDtfHL6bgr
 w4PgANwydSoFSG3mtvrOgoj3XZP4fGDG1vp8K38DM39HOqD2TtMprI75O
 pdnlL+Dw2m6arllIGUkwXbxm+dlJc/ve5m4cZjj2EhPNhQo2nVXUU8br7
 H6/8bSDDCbxhTUIkN47rZ8t+NLRwHs5RugPqxAKO8/Ak+GJ6q5d3agOoa g==;
X-CSE-ConnectionGUID: Assd3LMeSCyqAuo/3WjLsg==
X-CSE-MsgGUID: FsnaIxAtQQaO4jWDCjWtng==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73681856"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="73681856"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 05:57:06 -0700
X-CSE-ConnectionGUID: iTji962YRI+WOv3QDyq3eg==
X-CSE-MsgGUID: Hu4oYSnCQxWcWPPOtwAKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184079731"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:57:03 -0700
Date: Thu, 23 Oct 2025 14:57:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v2 1/5] tests/kms_hdr: Use original 512x512 fb size
 on devices without scaler
Message-ID: <20251023125701.pdsa35geubuambmh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021173912.4050926-2-jason-jh.lin@mediatek.com>
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
On 2025-10-22 at 01:37:49 +0800, Jason-JH Lin wrote:
> Ensure devices without scaler retain the original 512x512 framebuffer
> size during plane setup. Previously, all outputs were set to display
> resolution size, which may not be supported on devices lacking scaler.
> For such hardware, always use 512x512, matching the initial framebuffer
> creation, to improve test reliability.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>

I merged patches 1...4.

Regards,
Kamil

> ---
>  tests/kms_hdr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index efa5964cf695..40187275bf61 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -257,7 +257,11 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
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
