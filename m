Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DEFCD5BD5
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 12:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8450410E1E6;
	Wed, 27 May 2026 12:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTtwuXxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F43010E1E6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779885260; x=1811421260;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7gisb2LGMQ6tsjGOG48W7hOJH+y1JUJiubM3wQGQB/A=;
 b=BTtwuXxjIKk2lqYSO5B2r3Bgj2N0UIiPamLX3iOqT3Y2wj18AskHw0HV
 EFlDsqW/yKAx99dGAL/cYBHhuRx7FXT9x1qj0gk9Nq3uqNAEjv0IaguBc
 KmnU50+1APIlR6URMA5pYQARuRP8S6htVtCNd+OJTBRSSvadCve/ID01u
 /lgpDQJO5TDiSxrUu78dzmxa9o7ORyrbtI4uIFZoSLUt9csfIr9WJn56g
 mf1YwUySYmjMuSPARUeNO4JxJYhRZnmcKnJdfmWRvihlwCAMxk5AmtIab
 iXl0xZJKehK46IzU8NKFLvfG5Np8YIrYjLIScRpl/fulkSMNFHlcMb79c Q==;
X-CSE-ConnectionGUID: DG1Ldn+5Q3q9BsPgD1ceAg==
X-CSE-MsgGUID: W3/cE1Z9QmaGh1Fi3Xts3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91816456"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91816456"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:34:20 -0700
X-CSE-ConnectionGUID: AjIYtONOQTiRJ07MX37YQA==
X-CSE-MsgGUID: TXiSw3eKSe6PikZfRQWdaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="266112591"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:34:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
Cc: gustavo.sousa@intel.com, ngai-mint.kwan@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_wa: Return false for non-root users
In-Reply-To: <20260527034342.1952153-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260527034342.1952153-1-ashutosh.dixit@intel.com>
Date: Wed, 27 May 2026 15:34:15 +0300
Message-ID: <f5d457a42fb7d837541253d101dba763bb815e32@intel.com>
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

On Tue, 26 May 2026, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> Under some circurmstancs debugfs reads are initiated by non-root users. In
> these cases, just return false rather than asserting that debugfs could not
> be read.

Who can read debugfs is a distro policy and configuration decision, and
it's not just a binary root/non-root anyway.


BR,
Jani.

>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/intel_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> index a16ea62a4c..2d0d664f3c 100644
> --- a/lib/intel_wa.c
> +++ b/lib/intel_wa.c
> @@ -47,6 +47,10 @@ bool igt_has_intel_wa(int drm_fd, const char *check_wa)
>  	unsigned int xe;
>  	char name[256];
>  
> +	/* If we are not root, we can't read debugfs, just return false */
> +	if (getuid() != 0)
> +		return false;
> +
>  	debugfs_fd = igt_debugfs_dir(drm_fd);
>  	igt_assert(debugfs_fd >= 0);

-- 
Jani Nikula, Intel
