Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5B06ED46
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 09:28:34 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date: Tue, 28 Jan 2020 14:42:16 +0530
Message-Id: <20200128091217.27112-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 0/1] tests/i915/gem_ctx_persistence: Set
 context with supported engines
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Update the context with supported engines on the platform with set_property
I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
the available engines only.

v2: addressed the review comments.
v3: addressed v2 review comments.
V4: Re-introduced the gem_context_set_all_engines() API,test_process_mixed() 
test creating new forked process, to set engine map to new forked process 
I added gem_context_set_all_engines() API.

Bommu Krishnaiah (1):
  tests/i915/gem_ctx_persistence: Set context with supported engines

 lib/i915/gem_engine_topology.c   | 11 +++++++
 lib/i915/gem_engine_topology.h   |  2 ++
 tests/i915/gem_ctx_persistence.c | 52 ++++++++++++++++++++++++++------
 3 files changed, 55 insertions(+), 10 deletions(-)

-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
