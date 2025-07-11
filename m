Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF55C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 09:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C5710E9DB;
	Fri, 11 Jul 2025 09:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhSFPu/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DFC10E9DB
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752226251; x=1783762251;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fXUTorm/lQYl3hym167OiwIaVpkLzEUMMJf1uyTVK0I=;
 b=IhSFPu/8E29wKBRE2DhU10uNRIbWIgkssF80yfmkcjDHihG8DPSpQ+x1
 tNpS6J8GF/ywXGMhV66FxaRMiRrwLUXui6YSo8CmGVISWH4s0FEl949es
 1My0JSWzvYz+T/bPJdpMRJaqZwTYj4eiJFUVPa5CXdxqumyW50dV7hv5N
 19EmSHDy26L9kRcQg9V1pXjOHDB7JL5E9FErYhY8WwwI4S3gk4rhAfcUS
 b0d1bEa/F9oHryPULgWYAmN7u+8CYM/u6d+Ovnh/gMxnxNS0HnWP5UHym
 N8890INLMqtwwN0c3Y+nGXcFzlJMbBUsm1P1phohE+5JgsjTiMvJGvl87 w==;
X-CSE-ConnectionGUID: IwNcrimNQ0SqHAtDo+f6lA==
X-CSE-MsgGUID: wkuUmz0YSCaT9uT4jpTQRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="57134627"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="57134627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 02:30:51 -0700
X-CSE-ConnectionGUID: EuYlYsaoSSey4nVm+mSCLQ==
X-CSE-MsgGUID: slLJotcwQ46XSwLqRQyELA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="155957908"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 02:30:50 -0700
Date: Fri, 11 Jul 2025 11:30:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] .checkpatch.conf: Add checkpatch.pl defaults for IGT
Message-ID: <20250711093034.z4eth72uzukiqnym@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250710181613.62487-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710181613.62487-1-peter.senna@linux.intel.com>
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
On 2025-07-10 at 20:16:13 +0200, Peter Senna Tschudin wrote:

small nit about subject, no need for resend, now it reads:

[PATCH i-g-t] .checkpatch.conf: Add checkpatch.pl defaults for IGT

imho it could be shorter, like:

[PATCH i-g-t] checkpatch.conf: Add defaults for IGT

Note dropping first dot and dropping script name, as it
is described in commit message and also as a first word.

> CONTRIBUTING.md contains instruction on how to use Linux kernel'
> checkpatch.pl, including command line arguments for the tool.
> 
> As IGT maintainers use these options, let's standardize it in a
> configuration file so that everyone using checkpatch.pl from IGT's
> source code will use the same options.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

I tested it and it work as expected, thank you for taking care of it,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  .checkpatch.conf | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 .checkpatch.conf
> 
> diff --git a/.checkpatch.conf b/.checkpatch.conf
> new file mode 100644
> index 000000000..eac25592f
> --- /dev/null
> +++ b/.checkpatch.conf
> @@ -0,0 +1,6 @@
> +--emacs
> +--strict
> +--show-types
> +--max-line-length=100
> +--ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER,PREFER_KERNEL_TYPES
> +
> -- 
> 2.43.0
> 
