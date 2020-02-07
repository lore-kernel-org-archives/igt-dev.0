Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427B06FCDF
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 14:44:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200207134527.17205-1-ramalingam.c@intel.com>
 <20200207134527.17205-2-ramalingam.c@intel.com>
In-Reply-To: <20200207134527.17205-2-ramalingam.c@intel.com>
Message-ID: <158108667615.15496.13203855080851124379@skylake-alporthouse-com>
Date: Fri, 07 Feb 2020 14:44:36 +0000
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ramalingam C (2020-02-07 13:45:27)
> @@ -2016,16 +2016,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>         /* GEM */
>         igt_subtest("gem-mmap-cpu")
>                 gem_mmap_subtest(false);
> -       igt_subtest("gem-mmap-gtt")
> +       igt_subtest("gem-mmap-gtt") {
> +               gem_require_mappable_ggtt(drm_fd);
>                 gem_mmap_subtest(true);

Would not the lmem bar also be susceptible to power management
artefacts?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
