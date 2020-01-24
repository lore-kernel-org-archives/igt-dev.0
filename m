Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ACD6E357
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 12:05:17 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200124111822.16862-1-anna.karas@intel.com>
References: <d4333c56-8067-db49-084d-ff66d929eb51@linux.intel.com>
 <20200124111822.16862-1-anna.karas@intel.com>
Message-ID: <157986750750.2524.12484363762356082964@skylake-alporthouse-com>
Date: Fri, 24 Jan 2020 12:05:07 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] gem_wsim: Distinguish particular
 engines during calculating nop calibration.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anna Karas <anna.karas@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Anna Karas (2020-01-24 11:18:22)
> +       if (!has_nop_calibration) {
> +               if (verbose > 1) {
> +                       printf("Calibrating nop delays with %u%% tolerance...\n",
>                                 tolerance_pct);
> -               nop_calibration = calibrate_nop(tolerance_pct);
> -               if (verbose)
> -                       printf("Nop calibration for %uus delay is %lu.\n",
> -                              nop_calibration_us, nop_calibration);
> +               }
>  
> +               calibrate_engines();
> +               print_engine_calibrations();

One trivial fixup,
	if (verbose)
		print_engine_calibrations();
to match earlier behaviour to suppress the output with -s
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
