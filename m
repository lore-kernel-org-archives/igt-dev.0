Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC65CAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68FA10E48A;
	Mon, 29 Sep 2025 19:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLLoQ106";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A216E10E48A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173657; x=1790709657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XpOj9NNqPvACu5GmtpC1W2HNs2A20gLffU/vldUxTSk=;
 b=kLLoQ106SI+/qBxEH+/EYYbruCgUHWWG95H5J8TSJM1wupwLTF+eh1W2
 GZ5FdV/E/x40BTaIgAEDUe0PDF9MGu69hLGT18WSFGDaDDEE85VT/AwvB
 /jb3Wjo0vagGYwf7P1SoYPllJTG0G+F0UvVxpr4l0/Ej+FOypUR1GqgwZ
 ko6wLxUCyB8S7UuxXqwgWxVhcdWxnyW1lsdActBVh9+hIZ8eV8HZ1Xfk0
 f8Xc5g4x6KvPwVsAXmBJ8qKq6XScjNEd7+VyKDP3eqdN34JSpCMmyndHK
 E+4MhIIEaHGFYtuLHDA/TbJZO9imTEZgpRb7Rmq5F3JjcFlLsk64wVAtQ g==;
X-CSE-ConnectionGUID: vJkfYrSeS1WjnNP791hTKg==
X-CSE-MsgGUID: +M5p0c7RRbOYgwnJ1y5WSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65059774"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="65059774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:20:57 -0700
X-CSE-ConnectionGUID: 325VAY/9Qa+BRkUTZnRaOQ==
X-CSE-MsgGUID: GUNMAyJJQhCbvnChl4HzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="177436249"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:20:54 -0700
Date: Mon, 29 Sep 2025 21:20:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v7 i-g-t 9/9] tests/xe_eudebug_online: Issue SIGTERM in
 set-breakpoint-sigint-debugger
Message-ID: <qwxmgstkghwhe7ourrr4vzjg3nwxxn6s3jlenou3m7ybekafkr@fy3vbnn7apzx>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
 <20250926074801.9031-10-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926074801.9031-10-dominik.karol.piatkowski@intel.com>
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

On Fri, Sep 26, 2025 at 09:48:01AM +0200, Dominik Karol Piątkowski wrote:
> Issue some SIGTERM signals in quick succession before SIGINT to raise
> the odds of hitting the ioctl.

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index e388ea888..4c6c31da3 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -65,6 +65,8 @@
>  #define CACHING_POISON_VALUE	0xcafedead
>  #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
>  
> +#define SIGTERM_COUNT		50
> +
>  #define SHADER_CANARY 0x01010101
>  #define BAD_CANARY 0xf1f1f1f
>  #define BAD_OFFSET (0x12345678ull << 12)
> @@ -1600,6 +1602,14 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>  		else if (event_count > 0 && event_count < events_max)
>  			sigints_during_test++;
>  
> +		/*
> +		 * Issue some SIGTERM signals in quick succession before SIGINT
> +		 * to raise the odds of hitting the ioctl
> +		 */
> +		for (int i = 0; i < SIGTERM_COUNT; i++) {
> +			xe_eudebug_debugger_kill(s->debugger, SIGTERM);
> +			usleep(rand() % 1000);
> +		}
>  		xe_eudebug_debugger_kill(s->debugger, SIGINT);
>  		/* Don't close debugger fd before it dies */
>  		while (!s->debugger->handled_sigint)
> -- 
> 2.34.1
> 
