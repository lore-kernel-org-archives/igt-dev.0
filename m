Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD756C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F4210E681;
	Mon,  4 Mar 2024 15:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLY65TIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69A010E681
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709564720; x=1741100720;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=36Akf+Si7cjWIuo1HRr1VneeyXvJH9Iie2ik4mGYcq8=;
 b=BLY65TIq3mDkrCXG1GgoLMG4ByKT/a/tGmUEK/LKrhzbeBS9gQfJMU0U
 0NmjG4QsIKweE179sC6bGVYU1IQZi24eHN4X8yd4KJ/T6Y6Kxa6HrHCIe
 4sSRYwlHB5EgL52WY9oT/LuDOV6K8XLkjXWVia6SKecK79VH6XEoF4HXY
 icdxATZCIazy3qOVnhSW0PrYEF5JLk/Of2/3iDrgHebRvt0P5JOQSkByW
 FTHnr1D59D2KzZwqzBXhxpWDsR9Jb9kpOVJ8pt5PqQA7D/zjCeUEdlp7G
 r4u089/CVCdG4UX9dTxzmQnQWqSR+aFNc9WkwfMkeLJgCunAJfUISfb65 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3921599"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3921599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:05:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13709760"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:05:19 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B3F0B580960;
 Mon,  4 Mar 2024 07:05:16 -0800 (PST)
Date: Mon, 4 Mar 2024 16:05:13 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t 05/24] tests/intel: Introduce Caching subcategory
Message-ID: <20240304160513.40470a12@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-6-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-6-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:15:58 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's have 'Caching' subcategory to show where we are testing cashing.

LGTM.
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>


> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/gem_caching.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
> index 4a8f69e97..4a95cf528 100644
> --- a/tests/intel/gem_caching.c
> +++ b/tests/intel/gem_caching.c
> @@ -45,9 +45,9 @@
>   * Category: Desktop client
>   * Description: Test snoop consistency when touching partial cachelines.
>   * Feature: caching
> - * Functionality: data coherency
> + * Functionality: coherency
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Caching
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: read-writes
