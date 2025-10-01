Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3776CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 09:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E36A10E2FF;
	Wed,  1 Oct 2025 09:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkBsrBjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2610510E2FF
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759310108; x=1790846108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/bd7g1Vxt7yJ4LuxNBNgUz6tzvFOFa4HiTpvGx7+Ol4=;
 b=OkBsrBjX2Cfm8t8ow7h8j0+bmCxpGdUDkcaogpOoCxOU6scxxsS77f1Y
 GBlU1sYatTlC3mtME7WcclJaGTz/+NC+Rei4R+quJQdNgcKOqy3N1qsu6
 jTSzcGiQVRaUXBo4g8f/PGD7ZTyi6Vh11Nqynm3OMj8iECX57J3+fEttB
 DI6pNxOqbCNdoKZnV/d9yuw5b5mx1eud3qkIFkW+IvRS3Yjx8+/9oKOxY
 Gtt6/zpRy23fOWlci0JKgE30UiDWTluYYpl8o/ozH5airxFDYZtGLzi3T
 STuSTITeavvuwVz0vku+itjNQ7SBx2c7v54sv2iU336A3X4BaQMH/3zDj w==;
X-CSE-ConnectionGUID: iLCw2N+9QmibqsYAlpvmBw==
X-CSE-MsgGUID: QvLED9ycSLqRo90VYyJZjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61472857"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61472857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:15:07 -0700
X-CSE-ConnectionGUID: 8KpwJ5VFS5qaDd4AznrKLQ==
X-CSE-MsgGUID: UGmI8JqMRe6om6FHwkyAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="179167154"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:15:04 -0700
Date: Wed, 1 Oct 2025 11:15:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v8 i-g-t 1/9] lib/xe_eudebug: Fix safe_pipe_read
Message-ID: <vsfnh5zs74ug2f65qasehifkm5lmjf26zdyinm26z7vbc2ygjj@yxt4txjvqcby>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
 <20250930104209.22462-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930104209.22462-2-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 30, 2025 at 12:42:01PM +0200, Dominik Karol Piątkowski wrote:
> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
> misleading, as the underlying error may be different. Do an early return
> with -errno if the poll fails.
> 
> Don't break on poll failure in debugger_worker_loop if errno was EINTR
> and continue instead to repeat the poll.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 667c31c6e..65297d623 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>  		if (!ret) {
>  			catch_child_failure();
>  			t += interval_ms;
> +		} else if (ret == -1) {
> +			return -errno;

I'm sorry, I thought below code was a part this conditional block.
Shouldn't we handle EINTR here for poll as well?

--
Zbigniew

>  		}
>  	} while (!ret && t < timeout_ms);
>  
> @@ -1078,6 +1080,9 @@ static void *debugger_worker_loop(void *data)
>  		ret = poll(&p, 1, timeout_ms);
>  
>  		if (ret == -1) {
> +			if (errno == EINTR)
> +				continue;
> +
>  			igt_info("poll failed with errno %d\n", errno);
>  			break;
>  		}
> -- 
> 2.34.1
> 
