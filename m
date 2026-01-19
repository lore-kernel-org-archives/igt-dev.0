Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4CDD29C40
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 16:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A8A10E10D;
	Mon, 19 Jan 2026 16:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6jJeQHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E632F10E10D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768840858; x=1800376858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HfH9bwnvrcBUc3+YW/IGqxm5F+BE5aYX96YGUeeolLI=;
 b=M6jJeQHhCrr5djCzUcIBYoSzzSBTjqPNtJMue6LhG3c0Ugsk1h8PF9jm
 FL4uAyRNTVVOqkfrmc/CNbHP8LVJ9NY/r6JjZAA1Ps9eNDmPUdxOKmL/O
 g+ZqapEqxtFwrGvI423wZnCMQ5wCHyPMNoUOoFgbIwu5bPDOf0V/3HBUF
 ZT8M0fc3Ak9lU4lmzrTr5pAsBDM2Tknh5lfqZBBuW2mdC2iSD2GpC6Csx
 p1jyzHWfifNwLJj65BQMJ6TZ66z37coMw1HMuzsF421TgqVPEFOzCUJOL
 VEx+NOiGjsubW3r3KWDRIlhF9VCP7KwhVGihaqBSimV1c51SprZblOif2 w==;
X-CSE-ConnectionGUID: ZkeNTKT3TcqUYhaZRZRwSw==
X-CSE-MsgGUID: imdgckQXQKapC9gSdyXfuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80775198"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="80775198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 08:40:57 -0800
X-CSE-ConnectionGUID: B1FU7zEaT0yqv5qI7ZKXyg==
X-CSE-MsgGUID: VRqdBnhXSnG2lQFvYhu3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="237178963"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 08:40:56 -0800
Date: Mon, 19 Jan 2026 17:40:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 4/5] lib/xe/xe_legacy: munmap BO before closing fd
Message-ID: <20260119164054.6ty3rxfeyipcbtrw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-5-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117000456.26207-5-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-01-17 at 00:04:55 +0000, Shuicheng Lin wrote:
> Unmap the mapped BO before returning in the CLOSE_FD path.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  lib/xe/xe_legacy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 6c0ed56c9..95246ea92 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -177,6 +177,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  			for (i = 0; i < n_exec_queues; i++)
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
> +		munmap(data, bo_size);
>  		drm_close_driver(fd);

imho you should set here fd to -1 so it also means that
this lib function should be:
xe_legacy_test_mode(int *pfd, struct drm_xe_engine_class_instance *eci,

  		int fd = *pdf;
		.... rest of code...

		drm_close_driver(fd);
		*pfd = -1;	

Regards,
Kamil

>  		/* FIXME: wait for idle */
>  		usleep(150000);
> -- 
> 2.34.1
> 
