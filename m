Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A981CC54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 16:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5215B89FD4;
	Tue, 27 May 2025 16:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgfNS7wb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC17089FD4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362258; x=1779898258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ff6XIffl2tJHRa37DmLs5ETjmek+dyAFOXM6sOvZsGw=;
 b=dgfNS7wbsgWnnuQNuIbqcX629OlCxZUMXxdnFdaBdWjxk/A5TB5FsD7H
 K6mw8vS6DFC8U6d2+EdQK/P0wuQyY1GPaTGg/pJHrU7HBMe/6urExroIk
 0Dbtyct5thK+0E+ch+7FVsUDmtf0J1fR8CQaJVoqtoSl1xEA83tdyxq/0
 3C9TMpxCNLwOs12R5UOJcQAiZb+y1/gl9izLgqR6sbd0lhU029YWDNyPy
 dtzc933MYBd6BrUlYINb5ZwnJggjIgPWXmvQmHegTF0rTrhcXPVXgxz/r
 btlnR/HbVobXNIa2SvWtRu5TjNORu8JeR/w38EHgu8cfQesIJKGygjpa9 w==;
X-CSE-ConnectionGUID: RAk+cCzEQMyhlfJ2ub2QVQ==
X-CSE-MsgGUID: o4bDMHaAQ2q3QhWMHk559w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50286593"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50286593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:10:57 -0700
X-CSE-ConnectionGUID: /4LMeF+lS+aG+IioXKoaPA==
X-CSE-MsgGUID: 32Yshhh4Sn+aTYjTAQwH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147901096"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:10:56 -0700
Date: Tue, 27 May 2025 18:10:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH i-g-t v4 3/9] lib/igt_nouveau: fixup print formatting for
 files in lib
Message-ID: <20250527161053.r2flbsf7rsk4ckg3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
 <20250527120421.79026-4-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527120421.79026-4-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-05-27 at 12:04:15 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIx64.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>

Same note about subject as in 1/9 patch, as for content

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_nouveau.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
> index fdf6020a3..62a53c8b1 100644
> --- a/lib/igt_nouveau.c
> +++ b/lib/igt_nouveau.c
> @@ -96,7 +96,7 @@ uint64_t igt_nouveau_get_block_height(uint64_t modifier)
>  		gob_height = 4;
>  		break;
>  	default:
> -		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
> +		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %" PRIx64 "\n",
>  			      modifier);
>  		break;
>  	}
> -- 
> 2.34.1
> 
