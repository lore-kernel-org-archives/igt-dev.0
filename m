Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001A6EADF
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 22:32:41 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id l1so4629679pgb.5
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 15:32:41 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 19 Mar 2021 17:32:25 -0500
Message-Id: <20210319223233.2982842-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/8] Adjust IGT for upstream API clean-ups
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

Jason Ekstrand (8):
  tests/i915: Drop gem_ctx_ringsize
  tests/i915/gem_exec_balancer: Drop the ringsize subtest
  tests/i915/gem_exec_endless: Stop setting the ring size
  tests/i915/gem_ctx_param: Drop the zeromap subtests
  tests/i915: Drop gem_ctx_clone
  tests/i915/gem_ctx_create: Stop cloning engines
  tests/i915/gem_ctx_persistence: Drop the clone test
  lib/i915/gem_context: Implement VM and engine cloning manually

 lib/i915/gem_context.c           |  90 +++++--
 lib/i915/gem_context.h           |   7 +-
 tests/Makefile.sources           |   6 -
 tests/i915/gem_ctx_clone.c       | 450 -------------------------------
 tests/i915/gem_ctx_create.c      |   4 +-
 tests/i915/gem_ctx_param.c       |  33 ---
 tests/i915/gem_ctx_persistence.c |  30 ---
 tests/i915/gem_ctx_ringsize.c    | 345 ------------------------
 tests/i915/gem_ctx_shared.c      |  10 +-
 tests/i915/gem_exec_balancer.c   |  60 +----
 tests/i915/gem_exec_endless.c    |  12 +-
 tests/i915/gem_exec_schedule.c   |   8 +-
 tests/meson.build                |   2 -
 13 files changed, 88 insertions(+), 969 deletions(-)
 delete mode 100644 tests/i915/gem_ctx_clone.c
 delete mode 100644 tests/i915/gem_ctx_ringsize.c

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
