Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FD0C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 14:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D42C10E107;
	Mon, 21 Sep 2026 14:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H62DbxFy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4007410E842
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790002087; x=1821538087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jXRxxIIkgCoanZzMje8Qwc445kV/UxHtlxOmN5O84dc=;
 b=H62DbxFyVxh3AcpStwgt7a4pWI+kvlMO+6HQwJ9lSYv34dzeWkwNCHJi
 kpa2yIdKyWKEUg91225N711CN+IhcCMuiKEx69tH0wkYOSP+U+jH9VcWP
 jsmxx5NqRw4SJmDd67zbhNyrz0wJKtiDfDVHv86f/+dNYa+68PHBScaYC
 yocLr9oID+41fQEA1EWQKA2XjkoKqg8EGKpK9/2MHsejGjJRVdKWTJXzf
 4dvER168YQNQWlS3W7+nHxX5yuL+ypOg9cAo6IXL968qvR2t5LvSwx7lh
 Rsuz0Xcs9i09Dhh3RL2qeQowNNQ0CPmCi8zJvl3Znzk++XFxdH/JEdEJs Q==;
X-CSE-ConnectionGUID: z0H3vStyTn6i5/Nq1rLlCg==
X-CSE-MsgGUID: dsvLoZu2SVaTCtJL3alTmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90386375"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90386375"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:48:07 -0700
X-CSE-ConnectionGUID: BsJG2ItoT7ecG2JUwhUdRA==
X-CSE-MsgGUID: jOdZMhQFRVKBlJPu3vTj/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3983550"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:48:06 -0700
Date: Mon, 21 Sep 2026 16:47:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t v6] intel-ci: Add multigpu svm to CRI Core blocklist
Message-ID: <20260921144759.2fmsnkwc7ouobjqi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com
References: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
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

Hi Venkateswara,
On 2026-09-21 at 17:26:10 +0530, Venkateswara Rao Muppidi wrote:
> Add multiGPU SVM tests to the CRI core blocklist,
> as multiGPU tests require a separate test configuration.
> 

One more thing your wrote 'multigpu svm' but blocked all multigpu,
so description should match regex.

It could be corrected at merge time, no need for resend.

Regards,
Kamil


> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 4172f055b..2e7779064 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -17,7 +17,7 @@ igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
>  ##################################################################
>  # Valid skip: multigpu runs in separate config
>  ##################################################################
> -igt@.*@.*multigpu.*
> +igt@.*multigpu.*
>  igt@xe_peer2peer@.*
>  #################################################################
>  # Valid skip: No render engine support on CRI
> -- 
> 2.43.0
> 
