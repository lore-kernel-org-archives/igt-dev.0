Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E92C6E4CF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 23:11:40 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200316161132.29833-2-lyude@redhat.com>
References: <20200316161132.29833-1-lyude@redhat.com>
 <20200316161132.29833-2-lyude@redhat.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158440029619.29860.10787891189820447800@build.alporthouse.com>
Date: Mon, 16 Mar 2020 23:11:36 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_core: Make
 igt_subtest_jmpbuf/igt_dynamic_jmpbuf extern
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
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lyude (2020-03-16 16:11:29)
> From: Lyude Paul <lyude@redhat.com>
> 
> Since gcc 10, -fno-common has become the default (vs. -fcommon). As a
> result, gcc is much stricter about missing extern and static keywords
> and causes our build to fail in anything including igt_core.h:
> 
> /usr/bin/ld:
> lib/libigt-i915_gem_context_c.a(i915_gem_context.c.o):lib/igt_core.h:149:
> multiple definition of `igt_dynamic_jmpbuf';
> lib/libigt-drmtest_c.a(drmtest.c.o):lib/igt_core.h:149: first defined
> here
> /usr/bin/ld:
> lib/libigt-i915_gem_context_c.a(i915_gem_context.c.o):lib/igt_core.h:148:
> multiple definition of `igt_subtest_jmpbuf';
> lib/libigt-drmtest_c.a(drmtest.c.o):lib/igt_core.h:148: first defined
> here
> 
> So, fix this by marking these as extern and declaring them in
> lib/igt_core.c.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

One might be tempted to start marking up library private symbols.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
