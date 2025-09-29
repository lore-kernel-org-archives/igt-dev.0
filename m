Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD5DCAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B564110E486;
	Mon, 29 Sep 2025 19:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JShB9KlF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BC410E486
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173123; x=1790709123;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F74QSOqdK8tuXECSOYbu6nlv+r750ObzZMvztktSsbE=;
 b=JShB9KlF9BMlJ9o0oAwgCnyIx/OfsDGZBxt60u6qXzRjnQSGCQC3u2Dj
 ZJHKTX9fOG9I1lBUTUBH8A2st9V2nSl4lAhIYeK96EjapwSpu/xCtqIRJ
 JlvBO1Eq/597OnTSjAPNe6Oaw/Y/4pc2+aO++BQmwsFvTK2abFJ5jd84M
 p9VoP3vgVKyhkw13In3VFSy/KX+Gq+bQg54tKz18F5Pba68bT4B/Aag/u
 trZzRpL5owF/xoL0Q5KPB9mQA8jOFL8k7jqG4S+2J3yPksNu33smT+xni
 NnDob3e0xM1eN9Wxzk6p63BJN9UH9ey6FAYHRXOqQP/obY9EpJK4SUYmF A==;
X-CSE-ConnectionGUID: yvc2KMTORfmuhiZzJXGKLQ==
X-CSE-MsgGUID: 7ikYuYAFRVOEdlkjFMHhfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="84037874"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="84037874"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:12:02 -0700
X-CSE-ConnectionGUID: uimfVPNiTxCl5EMKCal4kw==
X-CSE-MsgGUID: W/QIUSH9S+2wbmavjYkMvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="177574624"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:12:01 -0700
Date: Mon, 29 Sep 2025 21:11:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v7 i-g-t 1/9] lib/xe_eudebug: Fix safe_pipe_read
Message-ID: <e63a5rqom4fboiedty5udplmxj5335ckqdn3qj23cbhlzx5t6t@lx3xtx3liccn>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
 <20250926074801.9031-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926074801.9031-2-dominik.karol.piatkowski@intel.com>
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

On Fri, Sep 26, 2025 at 09:47:53AM +0200, Dominik Karol Piątkowski wrote:
> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
> misleading, as the underlying error may be different. Do an early return
> with -errno if the poll fails.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 667c31c6e..d29c82857 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>  		if (!ret) {
>  			catch_child_failure();
>  			t += interval_ms;
> +		} else if (ret == -1) {
> +			return -errno;

What will happen if poll() is interrupted by a signal? I think for EINTR
you should continue and repeat the poll().

--
Zbigniew

>  		}
>  	} while (!ret && t < timeout_ms);
>  
> -- 
> 2.34.1
> 
