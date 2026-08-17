Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D799C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 12:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D2610E7C8;
	Mon, 17 Aug 2026 12:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TG+BGkjU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAA510E7BD
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786971536; x=1818507536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w0Gq/Yz+Y/9BCccDK3TRXLer/IdoMTa0EpLPQRvFt5s=;
 b=TG+BGkjU1YTM1b9beIcddO87W5wzK0flF8M9SZu8+TxWBggjzgQrs3D8
 DoPV5M+As+kfH7JV58RE5x5MpCnY6MxvBHosa0hq5tkxCK/ykNIHqajnK
 ykEfwItW+Aio1T3R0as3cevzdDg+xA1FC1lltaKtzENS8FfaH/tpMBBSu
 anvwhs8KUg9YpToOtTSEi8DAKs8xSQCoyQ48cr0VLnYJjoeuvxm8vzPdf
 gagQe6+gUMfM1lNEZ6bgAj0b8IL2lkkuFkSGrTyPeirT9hmyrBk3pmIQY
 m/xnAcRjWZ29ZLnVskqc0/Ib1P7afxI6viYY7+61s4AjhSpsKAOJ00fUp A==;
X-CSE-ConnectionGUID: kltY3B+nR6Kbi9HkEQzJjg==
X-CSE-MsgGUID: QblJU2mWRma23FJg+SjTCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98961530"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="98961530"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:58:55 -0700
X-CSE-ConnectionGUID: JtQ+iWTyQquc8C58+AcmfQ==
X-CSE-MsgGUID: ikQNGGPhTk2C+zKQ2ryjGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268749060"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:58:52 -0700
Date: Mon, 17 Aug 2026 14:58:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3] tests/kms_plane: Skip CRC frame sequence check
 on MediaTek
Message-ID: <20260817125850.7lhhiheqzjbps3ao@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260814172940.3190510-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814172940.3190510-1-jason-jh.lin@mediatek.com>
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
On 2026-08-15 at 01:28:36 +0800, Jason-JH Lin wrote:
> MediaTek's DRM driver uses an internal per-commit CRC queue that
> reports CRC entries with a frame number offset due to pipeline delay
> (3 vblanks after commit). This causes crc->frame > expected_vblank,
> which fails the exact-match validation in capture_crc().
> 
> Since igt_pipe_crc_get_for_frame() already guarantees crc->frame >=
> vblank via its internal loop, the exact-match check is overly strict
> for queued CRC drivers. Skip it on MediaTek while preserving the
> validation for other platforms.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Applied, thank you all!



Regards,
Kamil

> ---
>  tests/kms_plane.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 12dfbfe1d82b..14d2d810f1a0 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -766,6 +766,15 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
>  {
>  	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
>  
> +	/*
> +	 * Platforms with an internal CRC queue (e.g. MediaTek) report CRC
> +	 * entries with a frame number greater than the requested vblank due
> +	 * to pipeline delay. Since igt_pipe_crc_get_for_frame() already
> +	 * guarantees crc->frame >= vblank, skip the exact-match check.
> +	 */
> +	if (is_mtk_device(data->drm_fd))
> +		return;
> +
>  	igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
>  		      crc->has_valid_frame && crc->frame != vblank,
>  		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",
> -- 
> 2.43.0
> 
