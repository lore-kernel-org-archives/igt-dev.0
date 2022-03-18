Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBC610E0E6
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 16:05:01 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 17:04:43 +0100
Message-Id: <20220318160445.27986-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] i915/gem_ctx_create: lower time of
 active subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Lower time for active subtest in gem_ctx_create to about 80s.
First patch adds lib function for choosing random engine from
each class, second lower number of engines on which subtest is
run.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/i915/gem_engine_topology: add iterator for choosing one random
    engine from each class
  i915/gem_ctx_create: lower time of active subtest

 lib/i915/gem_engine_topology.c | 64 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h | 19 ++++++++++
 tests/i915/gem_ctx_create.c    |  2 +-
 3 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.32.0
