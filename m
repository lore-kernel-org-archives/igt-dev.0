Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48954C5DF66
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 12:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89110E7B7;
	Mon, 17 Aug 2026 12:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTM7Q6yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0246D10E7B7
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786971211; x=1818507211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mt+Y2JVCbDLjeLBM2CjLKT0uusbSxTGOMHTwK/7HCM0=;
 b=lTM7Q6yodolHmuNAE5DItVAIyTWFRPwoxOKkaDDU6GbHGEWcvHnQ2pU3
 CYT7792YUGOe6UZntvcVFjOC6aysNGMWBKSHRpbumMDwlF1amrot+6m99
 MGvWbEcenfriHK4je+nEc+Fkukccwuu9lPnzpiqI8T8CPDYti493gUCDv
 aKMI5xCB/i2NRdzpvaKZvVCznNh1poE1j0TwmL0LnmNpybM56sFe8JLj4
 ikmmpDe+1W9NrVkvX1/8An+jg5jHJYyPxQTZ7SipbGhxJodDotE1Bw14j
 LcqiscvH0/YCHWERZvD7OzHamadY3BYX3l4avuV2n7KK5lLE98hjXL9fO w==;
X-CSE-ConnectionGUID: boob95rcQ5KuHhAVwk5iiw==
X-CSE-MsgGUID: BzEajQrwTsysVhgVOtIXfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86565295"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="86565295"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:53:31 -0700
X-CSE-ConnectionGUID: gqU0cwhLT/yPzUnO608E7w==
X-CSE-MsgGUID: b3isHQ1yS4Obar9u3DyPQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="263146409"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:53:28 -0700
Date: Mon, 17 Aug 2026 14:53:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3] tests/sw_sync: fix invalid fd test
Message-ID: <20260817125308.5ksjhsr476ee7xbn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Luka Mamrikishvili <lmamrikishvili01@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20260815142146.370294-1-lmamrikishvili01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260815142146.370294-1-lmamrikishvili01@gmail.com>
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

Hi Luka,
On 2026-08-15 at 16:21:33 +0200, Luka Mamrikishvili wrote:
> The invalid file fd test overwrites the file descriptor returned by
> mkstemp() with a DRM device file descriptor. As a result, it tests a
> device fd twice instead of testing a regular file fd, and leaks both
> the first device fd and temporary file fd.
> 
> Close the device fd after its test and retain the temporary file fd
> for the file fd test.
> 
> Signed-off-by: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Applied, thanks!



Regards,
Kamil

> ---
> v3:
> - Use drm_close_driver() for the fd returned by drm_open_driver().
> - Add Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>.
> 
> v2:
> - Add the i-g-t subject tag for CI.
> 
>  tests/sw_sync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index 8012652d6..2df6b5601 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -334,6 +334,7 @@ static void test_sync_merge_invalid(void)
>  	fence_invalid = drm_open_driver(DRIVER_ANY);
>  	fence_merge = sync_fence_merge(in_fence, fence_invalid);
>  	igt_assert_f(fence_merge < 0, "Verify invalid fd (device fd) handling");
> +	drm_close_driver(fence_invalid);
>  
>  	fence_invalid = mkstemp(tmppath);
>  	if (fence_invalid == -1) {
> @@ -341,7 +342,6 @@ static void test_sync_merge_invalid(void)
>  		goto out;
>  	}
>  	unlink(tmppath);
> -	fence_invalid = drm_open_driver(DRIVER_ANY);
>  	fence_merge = sync_fence_merge(in_fence, fence_invalid);
>  	close(fence_invalid);
>  	igt_assert_f(fence_merge < 0, "Verify invalid fd (file fd) handling");
> -- 
> 2.55.0
> 
