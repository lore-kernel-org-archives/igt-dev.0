Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6D9CFC534
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 10:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C567210E406;
	Mon, 14 Oct 2024 10:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUrihqXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0B210E406
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728900144; x=1760436144;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DOCQ8uis2if07VF5EU9fU4CarycxdKY32vsiMaAxosc=;
 b=dUrihqXrYr3L8UicrHrK4Akx6pTct7GB9Z7Sphk16BuXzrlr/XmLThOL
 CEdUZH9Rzb3nfzYnvlb8ZkSeMBBubWR2Dkj8LsdjVkIwJUKCql9nMpB6G
 eGhlX3PMuKIh/86pIIfOvamH+lYa5aK0Ctm8zy8bEOPdhPx9G326aCwxm
 THlcM0TMoIXd2xu/u3PpQYpbKvNKmSAmpoVcEpKVJMEm5/agDUCrK7SjG
 T8yTt+WL2mtxwa312pu7bUv2x0Kn8S5aNNqOYPnlEqP9ta8EaMLyE9CGC
 AukGHUG9m1vivlgP2zV5NtiOZFU1gOJ7BISJOMR9r/MDR7wMt+jZpDblh g==;
X-CSE-ConnectionGUID: RMZxaZCkTGeFQnovWVAZig==
X-CSE-MsgGUID: U6uW6noYTcaN0ONcK3u1qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28125330"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="28125330"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 03:02:23 -0700
X-CSE-ConnectionGUID: k758rNaZSGOOShIWdroCTw==
X-CSE-MsgGUID: JanRLUJ3SY2TVsoToPtkBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77979812"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:02:22 -0700
Date: Mon, 14 Oct 2024 12:02:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe-fast-feedback: fixup
 xe_dma_buf_sync
Message-ID: <20241014100219.auiexqbyi4ijeuyd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20241014084710.63569-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014084710.63569-1-matthew.auld@intel.com>
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

Hi Matthew,
On 2024-10-14 at 09:47:10 +0100, Matthew Auld wrote:
> export-dma-buf-once was split into a few different subtests, but we
> missed updating the test list here.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3061
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 01b01dcf9..d9fb98aab 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -75,8 +75,10 @@ igt@xe_create@create-massive-size
>  igt@xe_debugfs@base
>  igt@xe_debugfs@gt
>  igt@xe_debugfs@forcewake
> -igt@xe_dma_buf_sync@export-dma-buf-once
> +igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
>  igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
> +igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
> +igt@xe_dma_buf_sync@export-dma-buf-once-write-read-sync
>  igt@xe_evict_ccs@evict-overcommit-simple
>  igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
>  igt@xe_exec_atomic@basic-dec-all
> -- 
> 2.46.2
> 
