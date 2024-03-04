Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20D8C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFF410E217;
	Mon,  4 Mar 2024 15:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l39/X0fe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A1910E217
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565842; x=1741101842;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wIFtAlyL4bMAufrgwnXVV6ir0UNo6HsoxCiqpHVHmqg=;
 b=l39/X0feas1AQ6ahjbfEKrbNdfd6GjCYwB2sZv3L4A4MuODaLkUbQglR
 1V+ClefSBqmkZLrL2HIJpDDDIRvPMIpjs3YiyfSKiJdqPBS54RK+OLPJv
 ujkwXPw5gGkVXpEPplMfERzUGXu3qe+d9ZTNofBtBBz59UwKYoT/vQiWF
 Atc6NH2RITX8TNy9isem6HzAY+wBdbBKfSQg2v2YyQsU38j/G7eB3sJ4c
 EH8fpb6UccEqhYNvKOStfhqiWL/WcaFMnRZijJWQ9YEgWQoGCTrDH9nJH
 j/is1ztP2r7SsNoWop98bkhKTqu6mWmn2K0Nw6j9N+X/raua2GsolSK2l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15496474"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15496474"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13529165"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:24:01 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BA1645807E7;
 Mon,  4 Mar 2024 07:23:58 -0800 (PST)
Date: Mon, 4 Mar 2024 16:23:55 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH i-g-t 20/24] tests/intel: Introduce Debugging subcategory
Message-ID: <20240304162355.4fc474f4@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-21-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-21-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:13 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Test i915_hangman is focusing on debugging capabilities.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>  tests/intel/i915_hangman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
> index 8a7de5626..0749a9900 100644
> --- a/tests/intel/i915_hangman.c
> +++ b/tests/intel/i915_hangman.c
> @@ -46,7 +46,7 @@
>   * Description: Tests for hang detection and recovery
>   * Feature: reset
>   * Functionality: error handling
> - * Sub-category: debugger
> + * Sub-category: Debugging
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: detector
