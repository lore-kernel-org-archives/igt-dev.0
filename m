Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCDB6E833
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 03:51:40 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so498155pjb.0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 20:51:40 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 22 Mar 2021 22:51:26 -0500
Message-Id: <20210323035135.3367084-1-jason@jlekstrand.net>
In-Reply-To: <20210322204123.3331055-1-jason@jlekstrand.net>
References: <20210322204123.3331055-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/9] Adjust IGT for upstream API clean-ups
 (v2)
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

I'm trying to remove some unused APIs from upstream i915.  This i-g-t
series updates tests in accordance with those removals.  For a few things,
it simply deletes tests which test explicitly for that feature.  For
cloning, we do actually use that for a bunch of stuff today so I just
implement the two clones we care about (engines and VMs) directly with
getparam and a create setparam.

Jason Ekstrand (9):
  tests/i915: Drop gem_ctx_ringsize
  tests/i915/gem_exec_balancer: Drop the ringsize subtest
  tests/i915/gem_exec_endless: Stop setting the ring size
  tests/i915/gem_ctx_param: Drop the zeromap subtests
  tests/i915: Drop gem_ctx_clone
  tests/i915/gem_ctx_create: Stop cloning engines
  tests/i915/gem_ctx_persistence: Drop the clone test
  tests/i915/gem_exec_balancer: Stop cloning engines
  lib/i915/gem_context: Implement VM and engine cloning manually (v2)

 lib/i915/gem_context.c           | 109 ++++++--
 lib/i915/gem_context.h           |   7 +-
 tests/Makefile.sources           |   6 -
 tests/i915/gem_ctx_clone.c       | 450 -------------------------------
 tests/i915/gem_ctx_create.c      |   4 +-
 tests/i915/gem_ctx_param.c       |  33 ---
 tests/i915/gem_ctx_persistence.c |  30 ---
 tests/i915/gem_ctx_ringsize.c    | 345 ------------------------
 tests/i915/gem_ctx_shared.c      |  10 +-
 tests/i915/gem_exec_balancer.c   |  90 +------
 tests/i915/gem_exec_endless.c    |  12 +-
 tests/i915/gem_exec_schedule.c   |   8 +-
 tests/meson.build                |   2 -
 13 files changed, 108 insertions(+), 998 deletions(-)
 delete mode 100644 tests/i915/gem_ctx_clone.c
 delete mode 100644 tests/i915/gem_ctx_ringsize.c

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
