Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244E4C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 15:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7AA10F062;
	Mon, 11 Mar 2024 15:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjuIG/W1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBC110F062
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710169645; x=1741705645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+wwsMfT+pLhACKiGTEnqjrJjhpK/ALJb/48cQK3qY7I=;
 b=LjuIG/W1oD7wgTXN8H3knUE5FhuBlnlzJ1kXLIDw6nt17xQ/j/niojBu
 g/eqHBnQ7zCuZy4KB6dnD0pcQKdEfxkNHzEBYIbuOvISnsyUvVZNVZFgW
 X4eAC2ieWG8ZT7N6ELmmPhVrmknBRcse36/Fi0JSIHyAKg3U/fU8BTmwV
 8BDXk8EFQeHh8cIxtZmng8oZTp7nkCCtiGH9PbKH9QLggTzuKdGsaF4HC
 lpVXFfT+5DElV5O5YpXDrCCk8S2Mq2yEuZzPQNczlrP30lMgHqVcqL1jV
 Q1SQtkYAHwy+qK//ONcfw5u4K/QpA/NzJjTsAkfO0gZ/tyhhqF/6QL+NK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4950812"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4950812"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15816863"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 08:07:23 -0700
Date: Mon, 11 Mar 2024 16:07:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 05/25] tests/intel: Let's introduce Workarounds
 subcategory
Message-ID: <20240311150720.g6zmb4pjbt4jcoml@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-6-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240308083657.1092049-6-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-08 at 08:36:37 +0000, Katarzyna Piecielska wrote:
> There is gem_workaround test that deserves it's own subcategory.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_workarounds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
> index d83c0a1db..43146f4b9 100644
> --- a/tests/intel/gem_workarounds.c
> +++ b/tests/intel/gem_workarounds.c
> @@ -36,8 +36,8 @@
>   * TEST: gem workarounds
>   * Category: Infrastructure
>   * Feature: workarounds
> - * Functionality: workarounds
> - * Sub-category: Context
> + * Functionality: context
> + * Sub-category: Workarounds
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> -- 
> 2.34.1
> 
