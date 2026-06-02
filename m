Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425DCCD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E850910F17C;
	Tue,  2 Jun 2026 14:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axFCDLOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAFF10F17C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780408817; x=1811944817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Cevfxl7igngLzYp0QsYT6T3Exs5XvAoWJd6XqKAAE/Y=;
 b=axFCDLOaAuymo4Y8qFPkwIQMHby45KRVWfOH/o212E/QTSHJ8UfwgZMS
 SWtTCeo55Vel1xRxBLYA7IJYTvwXg7uieFR1CBORXuqTQCgNf7bZVqYCT
 OMkGOf6Iu7vG8GRd9cNfu9MipA4skA1VqQwrg07n7ZJVCsOJhvxz0ZEV5
 zQd+IyJVhVY6TdNJ6Wex5dQkad+oaMOiLJkEBnZxsfqavmLpZMPOJRu0Q
 9guVCc1UKMbfMDVSHsJP72JlDOYI4Gt4F9thPWRaKxa1RbFm9Bkj/yUiF
 LLA7i5nm33pqqoQW237GFX7EUYpFY6gfojDMFcwFJ3wxQC6WxyzbJqDgR Q==;
X-CSE-ConnectionGUID: ymqcXYpqRoWsu6GbKMB6Dg==
X-CSE-MsgGUID: /ZQG3cgwTO+yzoQAhXNijQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="106640696"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="106640696"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:00:17 -0700
X-CSE-ConnectionGUID: x+PLTtSyQTu6SvHQTy1nkA==
X-CSE-MsgGUID: 6EsK3r6uReiVjf2XTl9R8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="244021319"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.73])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:00:16 -0700
Date: Tue, 2 Jun 2026 16:00:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] runner/resultgen: Fix fd leakage
Message-ID: <feg2qgdu7vd2c2cl5k5cok3ds3yj4dayartzbvpzlgipycnxvq@urrteexaqryq>
References: <20260602124809.111457-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602124809.111457-1-kamil.konieczny@linux.intel.com>
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

On Tue, Jun 02, 2026 at 02:48:09PM +0200, Kamil Konieczny wrote:
> Close dir fd before exit from fill_from_attachments().
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Fixes: d34395a7ede7 ("runner/resultgen: Insert attachments list into results.json")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/resultgen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index aeec9eb08..1ee167fb0 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1230,6 +1230,7 @@ static bool fill_from_attachments(int idirfd, struct json_t *tests)
>  	tmp_tests = tests;
>  	ret = nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
>  	fchdir(dirfd(currdir));
> +	closedir(currdir);

Ah, good catch. I noticed runner_test experiences this when executed
with two last tests in a row.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  	return ret ? false : true;
>  }
> -- 
> 2.54.0
> 
