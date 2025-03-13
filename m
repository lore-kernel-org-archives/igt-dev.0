Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBF1C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 10:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B7B10E838;
	Thu, 13 Mar 2025 10:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcA9IG+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3BD10E838
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741863544; x=1773399544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RF+yMzEul+aR+KLcjRHwkRSKBP79HLs9jOIhlEdtKZ0=;
 b=PcA9IG+FtmfcwiKv4wnbR+gIREQF+wQWY04AOlUJ8k9CsP7jTgbrZwXu
 x+l4Yxc6P3bvpGDIN0+OsXeqOaWx6UNid28HhT2qecV/UFAa1gjioDEQ9
 pIZk5+5tQC7I1+DrielLK4UkFtQcwL8FlpjwtGAPWigDF+yKr90cw43rm
 FvV2vO5YljgTVXENnnpAILDcPM3C+rbOOP7s4z/rYseOP8S98X60Jv0Wj
 g2EvUsDN/mkD9mrClfZbiXeK5/++pN45yeMj/v9dbKIZ/wZlz6fPDO321
 9gKWhMwFSCqfeU0DbuIPvOYoz4Zq3UGh4VS0wROI22slJAz7U0SwhsdQB w==;
X-CSE-ConnectionGUID: m/rN8mQDRzeH/yxDFl/2ZQ==
X-CSE-MsgGUID: vOZTYUDPSASt2wRI6foryw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43076718"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="43076718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:59:01 -0700
X-CSE-ConnectionGUID: f78boOGxSzOm07wSDGCMtQ==
X-CSE-MsgGUID: McMICEXqTYOPZTQf0Jg8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="151762171"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:58:58 -0700
Date: Thu, 13 Mar 2025 11:58:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t] runner/kmemleak: Remove unnecessary lseek() calls
Message-ID: <20250313105843.pcqi7rfn3ffefvs5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com
References: <20250310200220.233045-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310200220.233045-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-03-10 at 21:02:20 +0100, Peter Senna Tschudin wrote:
> Earlier versions of the code performed multiple read operations on the
> kmemleak file without closing and reopening the file descriptor. To
> handle this, lseek() was used to reset the read position.
> 
> However, the current implementation no longer requires these lseek()
> calls, as the redundant read operations have been removed. This commit
> eliminates the leftover lseek() calls that are now unnecessary.
> 
> Cc: vitaly.prosyak@amd.com
> Cc: christian.koenig@amd.com
> Cc: alexander.deucher@amd.com
> Cc: jesse.zhang@amd.com
> Cc: harry.wentland@amd.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: ryszard.knop@intel.com
> Cc: lucas.demarchi@intel.com
> Cc: katarzyna.piecielska@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/kmemleak.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/runner/kmemleak.c b/runner/kmemleak.c
> index e1bfb65ba..e52bc12d5 100644
> --- a/runner/kmemleak.c
> +++ b/runner/kmemleak.c
> @@ -116,9 +116,6 @@ static bool runner_kmemleak_found_leaks(void)
>  
>  	rlen = read(fd, buf, 1);
>  
> -	if (rlen == 1)
> -		lseek(fd, 0, SEEK_SET);
> -
>  	close(fd);
>  
>  	return rlen == 1;
> @@ -169,12 +166,6 @@ static bool runner_kmemleak_append_to(const char *last_test, int resdirfd,
>  	if (kmemleakfd < 0)
>  		return false;
>  
> -	/* Seek back to first byte */
> -	if (lseek(kmemleakfd, 0, SEEK_SET) == (off_t)-1) {
> -		close(kmemleakfd);
> -		return false;
> -	}
> -
>  	/* Open text file to append */
>  	resfilefd = openat(resdirfd, KMEMLEAK_RESFILENAME,
>  			   O_RDWR | O_CREAT | O_APPEND, 0666);
> -- 
> 2.34.1
> 
