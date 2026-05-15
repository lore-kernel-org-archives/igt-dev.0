Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12941CD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 10:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B534910E0DC;
	Fri, 15 May 2026 10:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bs8ySczU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC7010E0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778842140; x=1810378140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rXkh4ghHqw3kanX85Gt9ahnAC0tMPQ8k0GOK33QFP1M=;
 b=bs8ySczUUmRaXcjUCyf/jNhkPXLbUI1GnYhbfStXSLWQwc8ph9a4679K
 MmnJhFUJap+7TCXDzo36j0x8Es7KB7GueR79rumyO7+YgQH8/HrTJGo5x
 3M4K670Pxm8vVJHOTQGs4C+a04819VutHYmuhnF0OoKa642gFjmL/JpsB
 rcTKaDJULV3DwuxARAX0/vCo1Ovc05+CNTbQOC8gvWVz0RDoPEbp92q0w
 b68YHQsfnZV0xGMDhdwTwMSwyGxbVwouEC795h8+wFBeX2zV+ZLe7fqnM
 YzonBOqPJRoCJF4ri31buSveFxfpIDlYECdKLopj26agOAYBntq/v7Ogx w==;
X-CSE-ConnectionGUID: /B7Qj7mHTGOuXFShZ/j8Lg==
X-CSE-MsgGUID: JNVdfH/PQhu99AO/uImN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91179876"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="91179876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 03:48:59 -0700
X-CSE-ConnectionGUID: iRLmYEulSh2qeiJ1FTGf7Q==
X-CSE-MsgGUID: 5bO+vTuTTGigxKWcAMbCPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="236024116"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:48:56 -0700
Date: Fri, 15 May 2026 12:48:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 1/2] tests/kms_cursor_crc: Add extra vblank to
 support MediaTek platform
Message-ID: <20260515104854.4cmbvbj5myt6syci@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <20260515072934.495031-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515072934.495031-2-jason-jh.lin@mediatek.com>
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
On 2026-05-15 at 15:28:39 +0800, Jason-JH Lin wrote:
> Add MediaTek to vblank_wait_count=2 devices (like AMD/MSM) to ensure
> cursor updates are fully synchronized before CRC capture.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/kms_cursor_crc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 1e062c38b668..1249171dec56 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -345,9 +345,9 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>  		igt_display_commit(display);
>  
>  		/* Wait for two more vblanks since cursor updates may not
> -		 * synchronized to the same frame on AMD HW
> +		 * be synchronized to the same frame on AMD and MediaTek HW
>  		 */
> -		if (is_amdgpu_device(data->drm_fd))
> +		if (is_amdgpu_device(data->drm_fd) || is_mtk_device(data->drm_fd))
>  			igt_wait_for_vblank_count(data->crtc,
>  						  data->vblank_wait_count);
>  
> @@ -1300,10 +1300,12 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		igt_require_pipe_crc(data.drm_fd);
>  
>  		/* Wait for two more vblanks since cursor updates may not
> -		 * synchronized to the same frame on AMD HW
> +		 * be synchronized to the same frame on AMD and MediaTek HW
>  		 */
>  		data.vblank_wait_count =
> -			(is_msm_device(data.drm_fd) || is_amdgpu_device(data.drm_fd)) ? 2 : 1;
> +			(is_msm_device(data.drm_fd) ||
> +			 is_amdgpu_device(data.drm_fd) ||
> +			 is_mtk_device(data.drm_fd)) ? 2 : 1;
>  	}
>  
>  	data.cursor_max_w = cursor_width;
> -- 
> 2.43.0
> 
