Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8F26E7F1
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 13:37:35 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200214125254.2420-1-satyavathi.k@intel.com>
In-Reply-To: <20200214125254.2420-1-satyavathi.k@intel.com>
Message-ID: <158168744868.10420.6113827716736483782@skylake-alporthouse-com>
Date: Fri, 14 Feb 2020 13:37:28 +0000
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] tests/i915/gem_ringfill:Added
 __for_each_physical_engine to utilize all available engines.
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
To: igt-dev@lists.freedesktop.org, satyavathi.k@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting satyavat (2020-02-14 12:52:54)
> @@ -203,8 +203,9 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
>                 igt_debug("Forking %d children\n", nchild);
>                 igt_fork(child, nchild) {
>                         if (flags & NEWFD) {
> -                               fd = drm_open_driver(DRIVER_INTEL);
> -                               setup_execbuf(fd, &execbuf, obj, reloc, ring);
> +                               i915 = gem_reopen_driver(fd);
> +                               gem_context_copy_engines(fd, 0, i915, 0);
> +                               setup_execbuf(fd, &execbuf, obj, reloc, e);
>                         }
>                         fill_ring(fd, &execbuf, flags, timeout);

Doesn't this change the test somewhat?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
