Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809211098796
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 15:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FF210E225;
	Fri, 20 Mar 2026 15:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/X80sFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE19910EB0D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774019340; x=1805555340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qL9kddMHyuBTiGxPapFAK7TBmb5R9LtYZYTQyjaOTus=;
 b=i/X80sFfG8NE3ljE1Mq7PI6WLVtAcp+5HUTrvSRcYqGonNMT1gswGfQ2
 kqh9Viah230zCOt/rtfmCZqqUHT+WOyAx5utPsfsxRSNs2cTm39hGBGF8
 XjuU2R0VSJpduj8PeldJU0l6+/0JI/QtuKtwNjUkzZc19v/U4rWjAsLel
 crEk1amgm87NlNoat/+RKXbLJHJXo9p5jdv8rYGa1cDJ3ms1cHpE74lCd
 pJa6dKsg5pjtwL47gvWq0sqS7/eUGH2kdycKCer5LQWbZ4+xE2i+B1U5j
 wDBHQcriFqT5370k8vJbEQnf8k9d0VgLlrFbrdkdODQWn9Javx0+7Hu2d Q==;
X-CSE-ConnectionGUID: iOD+VnoBSYK1uLndqzW3Mw==
X-CSE-MsgGUID: p4uzVNWIQ2uZLtXRq4wu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75224142"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75224142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 08:09:00 -0700
X-CSE-ConnectionGUID: dGNosd8wQ9yqP7ZBCkTYbw==
X-CSE-MsgGUID: G2IxsYeMRCyoOXTx0og5eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227795640"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 08:08:59 -0700
Date: Fri, 20 Mar 2026 16:08:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 1/4] runner: Rename dirfd to avoid clash with dirfd()
Message-ID: <20260320150855.ui5rd5g7knw37edi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
 <20260319215124.2066611-7-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319215124.2066611-7-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-03-19 at 22:51:26 +0100, Zbigniew Kempczyński wrote:
> Upcoming change within execute_next_entry() will call dirfd() so
> rename local dirfd variable is necessary.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  runner/executor.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 847abe481a..885a38a99f 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1772,7 +1772,7 @@ static int execute_next_entry(struct execute_state *state,
>  			      char **abortreason,
>  			      bool *abort_already_written)
>  {
> -	int dirfd;
> +	int ddirfd;

Maybe idirfd? Or ndirfd? But it is up to you,
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	int outputs[_F_LAST];
>  	int kmsgfd;
>  	int outpipe[2] = { -1, -1 };
> @@ -1786,19 +1786,19 @@ static int execute_next_entry(struct execute_state *state,
>  
>  	snprintf(name, sizeof(name), "%zd", idx);
>  	mkdirat(resdirfd, name, 0777);
> -	if ((dirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> +	if ((ddirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
>  		errf("Error accessing individual test result directory\n");
>  		return -1;
>  	}
>  
> -	if (!open_output_files(dirfd, outputs, true)) {
> +	if (!open_output_files(ddirfd, outputs, true)) {
>  		errf("Error opening output files\n");
>  		result = -1;
>  		goto out_dirfd;
>  	}
>  
>  	if (settings->sync) {
> -		fsync(dirfd);
> +		fsync(ddirfd);
>  		fsync(resdirfd);
>  	}
>  
> @@ -1900,8 +1900,8 @@ out_pipe:
>  	close_outputs(outputs);
>  out_dirfd:
>  	if (settings->sync)
> -		fsync(dirfd);
> -	close(dirfd);
> +		fsync(ddirfd);
> +	close(ddirfd);
>  	if (settings->sync)
>  		fsync(resdirfd);
>  
> -- 
> 2.43.0
> 
