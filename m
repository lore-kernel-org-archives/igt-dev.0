Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EECCCAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8D710E486;
	Mon, 29 Sep 2025 19:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6NhhrCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E37F10E486
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173222; x=1790709222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=idWh4IFO2lCPk2kKLXy0CD0b5nMP2+pJ/LuBw0Gs8Jo=;
 b=g6NhhrCNHsMbIDW9WCrhoHsBOW8wsDHWPKLKYwN+rB5rr8gC2rJJUF0k
 w8fgbjuijny8yLCnJWIPADUl3yt8KIce/H2cTELhM7DlmRGyZuiiv9Tno
 c+IMmnr82hrWUz3VGRBKIZdxroql0K1n1cbt1aiyhXPkniTsXniWf0Mkr
 2rohZpmula3yD73E3wcBXw3BXp+7xN0M6tOO7mjq5yVHEg+JcUD9wVVhI
 mzYyHtx47jxgP5rFmWZxBASOPsWajRAUA731bFm0gjQTDxEeoJMwNoE/V
 eOVdSsXNPkM3Hd/wCJjIHl/KiRMQlS/BT16xqRE4JrcMKmlfFDfSnHNfO Q==;
X-CSE-ConnectionGUID: 78rL+htkQ3WkET8SeDrqUg==
X-CSE-MsgGUID: 1u+bZcw5SeuOmUOhkxVZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61337316"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61337316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:13:42 -0700
X-CSE-ConnectionGUID: LBL69tSXQTCswfT5aogXxw==
X-CSE-MsgGUID: y52qL74USsiymA3S1sGU7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178703319"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:13:40 -0700
Date: Mon, 29 Sep 2025 21:13:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v7 i-g-t 5/9] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
Message-ID: <kxsxniokewif7azz4vji6vcbg6rvihr7vihpauuf3ma2ml7tkr@dc3ykhyklrpz>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
 <20250926074801.9031-6-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926074801.9031-6-dominik.karol.piatkowski@intel.com>
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

On Fri, Sep 26, 2025 at 09:47:57AM +0200, Dominik Karol Piątkowski wrote:
> Use xe_eudebug_debugger_kill instead of pthread_kill to allow proper
> handling of signals inside debugger thread.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index aa58e5f99..30e661b13 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1600,7 +1600,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>  		else if (event_count > 0 && event_count < events_max)
>  			sigints_during_test++;
>  
> -		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
> +		xe_eudebug_debugger_kill(s->debugger, SIGINT);
>  		close(s->debugger->fd);
>  
>  		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
> -- 
> 2.34.1
> 
