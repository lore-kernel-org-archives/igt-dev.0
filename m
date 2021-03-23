Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17E76E921
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 17:24:47 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso12455396pji.3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 10:24:47 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 12:24:32 -0500
Message-Id: <20210323172441.3388732-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/9] Adjust IGT for upstream API clean-ups
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

Sorry about so many re-sends.  I'm still trying to figure out how to make
patchwork like my patches.  I think this one should finally do the trick.

Jason Ekstrand (9):
  tests/i915: Drop gem_ctx_ringsize
  tests/i915/gem_exec_balancer: Drop the ringsize subtest
  tests/i915/gem_exec_endless: Stop setting the ring size
  tests/i915/gem_ctx_param: Drop the zeromap subtests
  tests/i915: Drop gem_ctx_clone
  tests/i915/gem_ctx_create: Stop cloning engines
  tests/i915/gem_ctx_persistence: Drop the clone test
  tests/i915/gem_exec_balancer: Stop cloning engines
  lib/i915/gem_context: Implement VM and engine cloning manually (v3)

 lib/i915/gem_context.c           | 157 ++++++++---
 lib/i915/gem_context.h           |   9 +-
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
 13 files changed, 138 insertions(+), 1018 deletions(-)
 delete mode 100644 tests/i915/gem_ctx_clone.c
 delete mode 100644 tests/i915/gem_ctx_ringsize.c

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
