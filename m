Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A0CC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 12:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D2910E02D;
	Thu, 29 May 2025 12:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lc34+Mc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF8110E02D
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748521521; x=1780057521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EqM88lsWAowHKnEUM90RNrXmNsYhVpXmOA+0IZY+Umg=;
 b=lc34+Mc1g1kfs3LAVd+Hg3h3MFn8sM0+bkKjTbw3HFMqmtKvHQMRwZAk
 0MP2hFZceXpSjXqMCQR4h1T61TjX7IKXd1NoR1GQ4qd6wISA06xV4AtvV
 sxWtSjfjfFok6JPFtPKfqgdBvqG4DWf8vpnR5Xp5gypgNu14mqzMbP9zO
 mVvyXKBca1Ux7P7iVpk2IGiWkUsg7h7qs5g9CK/+GU9oYQH5CA5BPd6Ex
 L6CnFRrauIThW9RZ0pDq0IexCqxbAq0u04rIc7M83yvI+rHHIROAYr9Db
 /3s9i7wlDwglRhX9n3WJavc54CCuHyVKlBvl/p1WEdjfL3JT1nPvgxUVM w==;
X-CSE-ConnectionGUID: 0mLl0/NoRIysYRrYFpVCqA==
X-CSE-MsgGUID: w4LjOltETvqsLHnZ6qwRsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50456873"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50456873"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:25:21 -0700
X-CSE-ConnectionGUID: t36iGyxXQ+yxYh3d7ab6zg==
X-CSE-MsgGUID: qwcaNGlPS9i1qSTC6yp0xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="143583230"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:25:19 -0700
Date: Thu, 29 May 2025 14:25:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Fix typo error tab
Message-ID: <20250529122517.o63lxkk4jbgbie2j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250528141454.2729293-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250528141454.2729293-1-zhanjun.dong@intel.com>
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

Hi Zhanjun,
On 2025-05-28 at 10:14:54 -0400, Zhanjun Dong wrote:
> Fix typo error <Tab> to <Space>.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index f9bd5c761..9fe6bfe35 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -83,8 +83,8 @@ static void ignore_faults_in_dmesg(const char function_name[])
>  	if (function_is_part_of_guc(function_name)) {
>  		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>  		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
>  	}

Nice, maybe '\t' should be replaced with dot '.' in igt_core.c function
so it will be ignored if someone in future will made similar error.

Regards,
Kamil

>  
>  	igt_emit_ignore_dmesg_regex(regex);
> -- 
> 2.34.1
> 
