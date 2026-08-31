Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1C7C61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 09:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5856910E777;
	Mon, 31 Aug 2026 09:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtBYFK37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D3F10E777
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788166976; x=1819702976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Mws5JapNRkC9kzNPhqm09rmsexQvx3DkHArqiFzzFiM=;
 b=DtBYFK37yAuZ6/l1ZQYZFOlblFMbbi0bOCT2xsS161U6XLGnaU875vj9
 6UTYeH2jeh5/xpdFed3zQbxPw94CY6GHtyOvafE7biGL3Fus6g5kRfa1p
 ZoHnOn+w4pAFmm4aE6D5vXJG1CP5TtsTlwLCLcBs+I8TNf2YnXDIP5GLW
 21VCtsHny+FjVvYEcdQ4hcTIzxUMnCNqxJvKQRgZVa5K2ix0YqyFmUDYu
 lzAn2l0yvvj4TLM9/7B2jrLu0fVOn9IZU6Kc1eok6ZLzlK7pIFWtGLTND
 4fEgj8WDEFe0XPM1j/BRuRvB/F5+vb/dpH5COpi3Uh5/+gpECNbCAnSPt A==;
X-CSE-ConnectionGUID: 5IqmOGxXTc6e0j1FvpfsMw==
X-CSE-MsgGUID: Xb5ReqnuQQKDlnnMS3Xupg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="87516754"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="87516754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:02:56 -0700
X-CSE-ConnectionGUID: yMmEQQefQyurR+dVol/RIA==
X-CSE-MsgGUID: BybqbOOQQX+JNJ5bwAqi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="266163258"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:02:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v5 1/3] lib/igt_kms: Add helper to return vblank
 timestamp and sequence
In-Reply-To: <20260825183359.2791891-2-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
 <20260825183359.2791891-2-ramanaidu.naladala@intel.com>
Date: Mon, 31 Aug 2026 12:02:52 +0300
Message-ID: <4b7ffd3627c420e0c214ed429c19f78d544fa28a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 26 Aug 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
> Add a utility that waits for the next vertical blanking interval on a
> specified CRTC and returns the timestamp and sequence number reported
> by the kernel for that event.
>
> Several tests need access not only to vblank synchronization but also
> to the exact timing information associated with the completed vblank.
> Having a common helper avoids repeating the same wait and timestamp
> extraction.
>
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  lib/igt_kms.c | 25 +++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 26 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 42cc7c3bd..cd4783db9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5876,6 +5876,31 @@ void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
>  	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index, count) == 0);
>  }
>  
> +/**
> + * igt_wait_for_vblank_ts_seq:
> + * @crtc: the CRTC.
> + * @ts_ns: returns the vblank timestamp in nanoseconds.
> + * @seq: returns the vblank sequence number.
> + *
> + * Waits for the next vertical blank interval on @crtc and hands back the
> + * timestamp and the sequence number.
> + */
> +void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq)
> +{
> +	drmVBlank wait_vbl = {
> +		.request.type = DRM_VBLANK_RELATIVE | igt_crtc_get_vbl_flag(crtc),
> +		.request.sequence = 1,
> +	};
> +
> +	do_or_die(drmWaitVBlank(crtc->display->drm_fd, &wait_vbl));
> +
> +	if (ts_ns)
> +		*ts_ns = wait_vbl.reply.tval_sec * NSEC_PER_SEC +
> +			 wait_vbl.reply.tval_usec * NSEC_PER_USEC;
> +	if (seq)
> +		*seq = wait_vbl.reply.sequence;
> +}

Gut feeling says it's probably better to extend __igt_vblank_wait() and
make this a thin wrapper around that.

> +
>  /**
>   * igt_wait_for_vblank:
>   * @drm_fd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8d4d14847..8d1928af6 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -652,6 +652,7 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
>  const char *igt_plane_rotation_name(igt_rotation_t rotation);
>  
>  void igt_wait_for_vblank(igt_crtc_t *crtc);
> +void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq);
>  void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count);
>  
>  /**

-- 
Jani Nikula, Intel
