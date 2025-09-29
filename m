Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B20ECAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F7E10E485;
	Mon, 29 Sep 2025 19:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meXolbq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DF610E485
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173464; x=1790709464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qx4wfGO93G24eCi62cUX3C8UgeK4Y6QKSYkcdk31NVg=;
 b=meXolbq8ItIMuCJ65/AmKyJqoIowdivyX6P9i3NmmlRhCAq648mwkapO
 1ewKLTBuf1UvoI0yfAE1wtPOztuuiPSs3T+GMR0DyZLg3oWaaVSKwVuna
 66+S6gZ0UPEgSBCxWH7LlF6cCk0ZpU1K48h96dbDldLfc8Tm/MMffxtCd
 CkuxMYh5CRxtBRWBqNiuKX5MViwV4hR1MCHXdQx66mOOYIDVHgRwit+az
 4iVs3O1vNLuyc1klbYJ9ZUwmz87Fy01/tTODCTRxYHDMbnfmpJLYHailU
 41sluboDWrfkpJx8mF220psnheM2S44OMhlT/0uu4tZ9pA70pKOFLNQes A==;
X-CSE-ConnectionGUID: AZNuZWJzTvqVt/Fr/pTIUg==
X-CSE-MsgGUID: ADZXtc+pRGa0IjERgcuQ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71671681"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="71671681"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:17:44 -0700
X-CSE-ConnectionGUID: h/6ZNnjGQtemANwqWwqOWg==
X-CSE-MsgGUID: hvilCAxMSPmUOAZ1kpbbIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182597615"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:17:41 -0700
Date: Mon, 29 Sep 2025 21:17:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v7 i-g-t 7/9] tests/xe_eudebug_online: Introduce proper
 sync for closing debugger fd in set-breakpoint-sigint-debugger
Message-ID: <gda4cxzeggw3t3fxk62ybxaozj366xb4oko7775kzqttrppmlz@lgkldu34ulsv>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
 <20250926074801.9031-8-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926074801.9031-8-dominik.karol.piatkowski@intel.com>
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

On Fri, Sep 26, 2025 at 09:47:59AM +0200, Dominik Karol Piątkowski wrote:
> Wait for the SIGINT handling to complete before closing the debugger fd
> to avoid tripping over asserts.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 30e661b13..e388ea888 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1601,6 +1601,9 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>  			sigints_during_test++;
>  
>  		xe_eudebug_debugger_kill(s->debugger, SIGINT);
> +		/* Don't close debugger fd before it dies */
> +		while (!s->debugger->handled_sigint)
> +			usleep(1000);

Add handled_sigint struct member in this patch.

--
Zbigniew

>  		close(s->debugger->fd);
>  
>  		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
> -- 
> 2.34.1
> 
