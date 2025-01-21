Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573BDC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 13:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77D510E592;
	Tue, 21 Jan 2025 13:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQQCNKT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF3810E592
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737467551; x=1769003551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9B29vhDpLV7kSuTkQDgyuBQ9IIxGovz8pHa376Qj+hc=;
 b=cQQCNKT+Fw6CQpJtq1qXDAbfcRZB+/1XYxCoca3TVCKvWjwx3wYhv27U
 w/wsxEFtRjn+CJYSiVxFjwin9n9O4OznJHkvQ2ST2YAqvRTTiIXiB659T
 IsyYl+rB7iuLsWDtRutedeYcZCdbzSnbCyqZxCopaa68kr1irr0oZRY2t
 7XxKRIQGS7Xdpapvxh/rpvfzcKRaKfhf0D3DT+Y2v6382OB9bdQbkiMpy
 DqZM9+JForgtxlwYP5PieEkJhHTjFD/8qWhtchM9iOJpvs2NSyynltd9z
 a/R7A/cEE0ixDa2FnhJEBOorVevrgrKBvZERIGhqOtUGAPrHfR7mmN9xL g==;
X-CSE-ConnectionGUID: x2xhWyLGQ6WwJJFnLGxaNA==
X-CSE-MsgGUID: fvo4jzuLRbuavvSpExB9hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="25480212"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="25480212"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 05:52:30 -0800
X-CSE-ConnectionGUID: K9k+UFGAS865jlgpRsIi6Q==
X-CSE-MsgGUID: OFgXt3yrSXeu47oT6dB7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106737806"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 05:52:29 -0800
Date: Tue, 21 Jan 2025 14:52:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>, peter.senna@linux.intel.com
Subject: Re: [PATCH 2/2] lib/igt_facts : Cleanup
Message-ID: <20250121135214.hiptpjcuxkc24vuq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 peter.senna@linux.intel.com
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
 <20250121063207.71737-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121063207.71737-3-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2025-01-21 at 12:02:07 +0530, Pravalika Gurram wrote:
> fix BOOL_COMPARISON, COMPARISON_TO_NULL,
> LINE_SPACING, PARENTHESIS_ALIGNMENT,

Please do not include in description what you got from chceckpatch.pl
rather write for example:

Fix code style issues.

> Remove extern from header warning from checkpatch

Same here, you should remove that line, not making a struct definition
there, so here:

Also while at this, remove unneeded extern from header.

> 
> 'Fixes: 1a9c3117328 ("lib/igt_facts: Library and unit testing")'
> 

Remove empty line.

> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>

I also spotted one more nit with '== false', see below.

> ---
>  lib/igt_facts.c | 20 ++++++++++----------
>  lib/igt_facts.h |  3 ++-
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> index bd6742065..6e7efbaf3 100644
> --- a/lib/igt_facts.c
> +++ b/lib/igt_facts.c
> @@ -677,18 +677,18 @@ static void igt_facts_test_add_get(struct igt_list_head *head)
>  	const char *last_test = NULL;
>  
>  	ret = igt_facts_list_add(name, value, last_test, head);
> -	igt_assert(ret == true);
> +	igt_assert(ret);
>  
>  	/* Assert that there is one element in the linked list */
>  	igt_assert_eq(igt_list_length(head), 1);
>  
>  	/* Assert that the element in the linked list is the one we added */
>  	fact = igt_facts_list_get(name, head);
> -	igt_assert(fact != NULL);
> +	igt_assert(fact);
>  	igt_assert_eq(strcmp(fact->name, name), 0);
>  	igt_assert_eq(strcmp(fact->value, value), 0);
> -	igt_assert(fact->present == true);
> -	igt_assert(fact->last_test == NULL);
> +	igt_assert(fact->present);
> +	igt_assert(!fact->last_test);
>  }
>  
>  /**
> @@ -729,16 +729,16 @@ static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
>  
>  	/* Assert that the two updated elements are present */
>  	fact = igt_facts_list_get(name1, head);
> -	igt_assert(fact != NULL);
> -	igt_assert(fact->present == true);
> +	igt_assert(!fact);
> +	igt_assert(fact->present);
>  
>  	fact = igt_facts_list_get(name2, head);
> -	igt_assert(fact != NULL);
> -	igt_assert(fact->present == true);
> +	igt_assert(!fact);
> +	igt_assert(fact->present);
>  
>  	/* Assert that the third element was deleted */
>  	fact = igt_facts_list_get(name3, head);
> -	igt_assert(fact == NULL);
> +	igt_assert(!fact);
>  }
>  
>  /**
> @@ -766,7 +766,7 @@ __noreturn void igt_facts_test(void)
>  	/* Assert that igt_facts_list_mark_and_sweep() cleans up the list */
>  	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == false);

This is also better written as:

 	igt_assert(!igt_list_empty(&igt_facts_list_pci_gpu_head));

>  	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> -	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == true);
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head));
>  
>  	/* Test the mark and sweep pattern used to delete elements
>  	 * from the list
> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
> index e96f88083..60d702977 100644
> --- a/lib/igt_facts.h
> +++ b/lib/igt_facts.h
> @@ -37,7 +37,8 @@ struct igt_facts_config {
>  	bool enabled;
>  	bool disable_udev;
>  };
> -extern struct igt_facts_config igt_facts_config;
> +
> +struct igt_facts_config igt_facts_config;

Remove this, it should be:

> -extern struct igt_facts_config igt_facts_config;

Regards,
Kamil

>  
>  void igt_facts_lists_init(void);
>  void igt_facts(const char *last_test);
> -- 
> 2.34.1
> 
