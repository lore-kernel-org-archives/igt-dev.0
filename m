Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265686E958
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 09:32:44 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <b5b2e573ecc9e1c9acb0ee39684508ef1ca47e69.1583905340.git.ashutosh.dixit@intel.com>
References: <b5b2e573ecc9e1c9acb0ee39684508ef1ca47e69.1583905340.git.ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158391916024.28297.8926392279679676810@build.alporthouse.com>
Date: Wed, 11 Mar 2020 09:32:40 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_rpm: use device coherent
 mapping instead of mmap_gtt
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-03-11 05:44:02)
> @@ -1629,7 +1629,9 @@ static void cursor_subtest(bool dpms)
>          * hopefully it has some fences around it. */
>         rc = drmModeRmFB(drm_fd, cursor_fb3.fb_id);
>         igt_assert_eq(rc, 0);
> -       gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false, cursor_fb3.strides[0]);
> +       if (gem_available_fences(drm_fd))
> +               gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false,
> +                              cursor_fb3.strides[0]);

We still have __gem_set_tiling() to ignore the result if we don't care?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
