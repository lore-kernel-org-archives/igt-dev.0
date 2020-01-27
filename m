Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC226E1BB
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 17:13:15 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200127170205.7195-4-ramalingam.c@intel.com>
References: <20200127170205.7195-1-ramalingam.c@intel.com>
 <20200127170205.7195-4-ramalingam.c@intel.com>
Message-ID: <158014518219.25356.9692221359856117157@skylake-alporthouse-com>
Date: Mon, 27 Jan 2020 17:13:02 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tests/dumb_duffer: extending for
 lmem coverage.
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

Quoting Ramalingam C (2020-01-27 17:02:04)
>         igt_fixture {
> -               fd = drm_open_driver(DRIVER_ANY);
> +               data.drm_fd = drm_open_driver(DRIVER_ANY);
> +               data.lmem = false;
> +               data.page_size = 4096;
> +               if (is_i915_device(data.drm_fd)) {
> +                       if (gem_has_lmem(data.drm_fd)) {
> +                               data.lmem = true;
> +                               data.page_size = 65536;
> +                       }

Just say to be agnostic to all potential limitations across drivers,
bump the allocation unit to SZ_2M. Let's not hardcode any backend
specific behaviour if we avoid it.

An alternative might be to assume that create.size returned for a 1x1
surface is the min_page_size. Better.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
