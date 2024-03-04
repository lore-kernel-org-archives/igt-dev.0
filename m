Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD02C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A04B10E756;
	Mon,  4 Mar 2024 15:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlMuAtqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C970B10E756
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709564801; x=1741100801;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=idAN6ta5DJx5yIt4Lq4uBNKqowf8lmvJyxR0+a9jIdo=;
 b=YlMuAtqe6aqXPM3L8XY6BRx6dvegOlKSTqDIGmUjT8L3v/gSnIWbUmKI
 nRSs49KPC5Zao1yhABD8XwgNVUep1xUFMq9dkvF0kxwyHBtF5cyJzl+i+
 SPbp4bcMtg+257aTzsq3AS9I0y1uEL1S3D/B5Nc9Hs7+MswYYdaX86FW1
 AgGaiXE+AjvuZ6aqhRb061b3dMDd2kR/+7vBoOViNzzkwgTwlBtVliV9L
 JgLVr1f5LVKMyx6JjhsMajoWAsxDf03zDahOeOGJFrV8RaPLgq6G6l8nP
 mnmt8g8T9xpf8Ezd2D8lLjlfOzXam1+6HkDwQGe3K3ZQkel3tl80qTCao A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3919924"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3919924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13683021"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:06:39 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4E68A580960;
 Mon,  4 Mar 2024 07:06:37 -0800 (PST)
Date: Mon, 4 Mar 2024 16:06:34 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t 06/24] tests/intel: Introduce Context subcategory
Message-ID: <20240304160634.0327dc48@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-7-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-7-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  4 Mar 2024 11:15:59 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's introduce Context subcategory.



> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/gem_ctx_bad_destroy.c | 4 ++--
>  tests/intel/gem_ctx_engines.c     | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
> index 65f6b5583..b6575e2d8 100644
> --- a/tests/intel/gem_ctx_bad_destroy.c
> +++ b/tests/intel/gem_ctx_bad_destroy.c
> @@ -39,9 +39,9 @@
>   * Category: Infrastructure
>   * Description: Negative test cases for destroy contexts.
>   * Feature: context
> - * Functionality: context management
> + * Functionality: context
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Context

As explained on patch 3, having two buckets with the same name is
confusing.

>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: double-destroy
> diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
> index 61718494e..75770e1f1 100644
> --- a/tests/intel/gem_ctx_engines.c
> +++ b/tests/intel/gem_ctx_engines.c
> @@ -47,9 +47,9 @@
>   * TEST: gem ctx engines
>   * Category: Infrastructure
>   * Feature: context
> - * Functionality: context management
> + * Functionality: context
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Context
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: execute-allforone
