Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED3C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 10:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A5310E18B;
	Fri, 10 Jul 2026 10:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1rOpfuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338D110E18B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783680086; x=1815216086;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LggN5J72iZls94He/39WujwMzhvBySujgmHBXXcJExA=;
 b=H1rOpfuyvw0jjEbF8SsVhs3Bmxc7FME8t8zYNmPMvTORpotCYhs52PFT
 5cBl6s33LopNeu5ZLRWg0BD3Xh3HtUqS3yZj2gWLYuaDgG1WHvdELE5Zo
 7yPjoGSGd3ZajRXyNKvilHLYV9Z7U+GOuI2WZhiD91BqjFY8Q3b7OP/O/
 LGLrIJO3p6ivb7ujgYWEw947seHkvDIdCHQcJOi6sBDuuvijUpKUIhxfx
 OvrE7ZHMieujAYE17DM4Q2wCa5t00hpx/3zAduU0LC2QfMLJnml4h4VwR
 0DdFTTg8LArUZ/tc9t2yzHFLk4aE1Ci/I79aFs40WfD6dOH5/l5vVUftx g==;
X-CSE-ConnectionGUID: D++VPAciTTyv5nOr63Wj+w==
X-CSE-MsgGUID: gkVW4DqjRseDrmj/sK9W6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71901342"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71901342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:41:25 -0700
X-CSE-ConnectionGUID: TTmJUkmHSeyn9hHYAeFmkA==
X-CSE-MsgGUID: 7x1GXKF0SHeJuGMk4Tm06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258736953"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:41:25 -0700
Date: Fri, 10 Jul 2026 12:41:21 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/msm/msm_perfcntrs: Fix compilation break
Message-ID: <ttry5hhu2kgxt4yyyayl64k7rjdegxca4vycjnemhsrgu3zgkc@5dqhvx7frvec>
References: <20260710103337.73892-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710103337.73892-1-kamil.konieczny@linux.intel.com>
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

On Fri, Jul 10, 2026 at 12:33:37PM +0200, Kamil Konieczny wrote:
> I used checkpatch script for fixes and forgot to check compilation
> after, it added 'void' to igt_main and it caused fail with:
> 
> ../tests/msm/msm_perfcntrs.c:64:18: error: macro "igt_main" passed 1 arguments, but takes just 0
>    64 | int igt_main(void)
> 
> Fix it by removing unneeded 'void'.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/msm/msm_perfcntrs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/msm/msm_perfcntrs.c b/tests/msm/msm_perfcntrs.c
> index ea63fbab3..e425ee255 100644
> --- a/tests/msm/msm_perfcntrs.c
> +++ b/tests/msm/msm_perfcntrs.c
> @@ -61,7 +61,7 @@ get_available_counters(struct msm_device *dev, bool global)
>  	}
>  }
>  
> -int igt_main(void)
> +int igt_main()
>  {
>  	/* device instance for global counter collection: */
>  	struct msm_device *dev_global = NULL;
> -- 
> 2.54.0
> 
