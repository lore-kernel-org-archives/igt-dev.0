Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8A86ED63
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 15:53:31 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200116135546.14003-1-anna.karas@intel.com>
 <20200121150400.15207-1-anna.karas@intel.com>
In-Reply-To: <20200121150400.15207-1-anna.karas@intel.com>
Message-ID: <157962200684.5216.7245636638665670840@skylake-alporthouse-com>
Date: Tue, 21 Jan 2020 15:53:26 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] Distinguish particular engines during
 calculating nop calibration
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
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Anna Karas (2020-01-21 15:04:00)
> @@ -3242,14 +3421,13 @@ int main(int argc, char **argv)
>                 goto err;
>         }
>  
> -       if (!nop_calibration) {
> -               if (verbose > 1)
> -                       printf("Calibrating nop delay with %u%% tolerance...\n",
> +       if (!has_nop_calibration) {
> +               if (verbose > 1) {
> +                       printf("Calibrating nop delays with %u%% tolerance...\n",
>                                 tolerance_pct);
> -               nop_calibration = calibrate_nop(tolerance_pct);
> -               if (verbose)
> -                       printf("Nop calibration for %uus delay is %lu.\n",
> -                              nop_calibration_us, nop_calibration);
> +               }
> +
> +               calibrate_engines();
>  
>                 goto out;
>         }
> @@ -3309,8 +3487,7 @@ int main(int argc, char **argv)
>  
>         if (verbose > 1) {

Hmm, could this be
if (verbose > 1 || !has_nop_calibration)
so that a plain run of gem_wsim shows the calibration results?

>                 printf("Random seed is %u.\n", master_prng);
> -               printf("Using %lu nop calibration for %uus delay.\n",
> -                      nop_calibration, nop_calibration_us);
> +               print_engines_calibrations();
>                 printf("%u client%s.\n", clients, clients > 1 ? "s" : "");
>                 if (flags & SWAPVCS)
>                         printf("Swapping VCS rings between clients.\n");
> -- 
> 2.19.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
