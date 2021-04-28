Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C5C6EC30
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Apr 2021 20:21:48 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id i14so1065350pgk.5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Apr 2021 13:21:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 28 Apr 2021 15:21:39 -0500
Message-Id: <20210428202143.1388452-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Add tests for newly invalid cases
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

As part of the ioctl clean-ups, I've made a few unused cases of
get/set_param return -EINVAL.  This little series adds IGT tests for those
cases.  Daniel, please let me know if you see any I missed.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Jason Ekstrand (4):
  tests/i915/gem_ctx_param: Add tests for recently removed params
  tests/i915/gem_ctx_param: Add a couple invalid PARAM_VM cases
  tests/i915/gem_ctx_engines: Add more invalid SET_CONTEXT_PARAM cases
  tests/i915/gem_exec_balancer: Add a test for combind balancing and
    bonding

 tests/i915/gem_ctx_engines.c   | 20 +++++++++--
 tests/i915/gem_ctx_param.c     | 61 ++++++++++++++++++++++++++++++++++
 tests/i915/gem_exec_balancer.c | 26 +++++++++++++++
 3 files changed, 105 insertions(+), 2 deletions(-)

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
