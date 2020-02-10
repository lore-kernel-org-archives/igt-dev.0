Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4EA6E8CF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 05:47:43 +0000 (UTC)
Date: Mon, 10 Feb 2020 11:17:55 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200210054755.GA29606@intel.com>
References: <20200207134527.17205-1-ramalingam.c@intel.com>
 <20200207134527.17205-2-ramalingam.c@intel.com>
 <158108667615.15496.13203855080851124379@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158108667615.15496.13203855080851124379@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915_pm_rpm: use device
 coherent mapping instead of mmap_gtt
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-02-07 at 14:44:36 +0000, Chris Wilson wrote:
> Quoting Ramalingam C (2020-02-07 13:45:27)
> > @@ -2016,16 +2016,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
> >         /* GEM */
> >         igt_subtest("gem-mmap-cpu")
> >                 gem_mmap_subtest(false);
> > -       igt_subtest("gem-mmap-gtt")
> > +       igt_subtest("gem-mmap-gtt") {
> > +               gem_require_mappable_ggtt(drm_fd);
> >                 gem_mmap_subtest(true);
> 
> Would not the lmem bar also be susceptible to power management
> artefacts?
Chris,

I think "gem-mmap-cpu" would do the same test with lmem, but that
can be done when we have the uAPI for allocating from lmem, through
another subtest say "gem-mmap-cpu-lmem"

But at present "gem-mmap-gtt" will fail at platforms where mmap_gtt is
not present. So to avoid that, could you please approve this change?

-Ram
> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
