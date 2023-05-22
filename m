Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1F910E24D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 07:12:38 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.143.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 77676580D7C
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 00:12:35 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q0zia-00ASwx-28
 for igt-dev@lists.freedesktop.org; Mon, 22 May 2023 09:12:32 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 09:12:28 +0200
Message-Id: <20230522071230.2494402-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230522071230.2494402-1-mauro.chehab@linux.intel.com>
References: <20230522071230.2494402-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/6] i915/gem_ctx_*: better document i915
 context tests
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Merge data from some ancillary internal documentation to improve
i915 gem_ctx test descriptions.

This patch was auto-generated via script.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/gem_ctx_bad_destroy.c |  4 ++++
 tests/i915/gem_ctx_create.c      |  8 ++++++++
 tests/i915/gem_ctx_engines.c     |  4 ++++
 tests/i915/gem_ctx_exec.c        | 12 ++++++++++++
 tests/i915/gem_ctx_freq.c        |  4 ++++
 tests/i915/gem_ctx_isolation.c   | 26 +++++++++++++++++++++++++-
 tests/i915/gem_ctx_param.c       |  4 ++++
 tests/i915/gem_ctx_persistence.c |  4 ++++
 tests/i915/gem_ctx_shared.c      | 22 ++++++++++++++++++++++
 9 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
index 90495da8ab2e..8c47e7c1cb67 100644
--- a/tests/i915/gem_ctx_bad_destroy.c
+++ b/tests/i915/gem_ctx_bad_destroy.c
@@ -36,9 +36,13 @@
 
 /**
  * TEST: gem ctx bad destroy
+ * Category: Infrastructure
  * Description: Negative test cases for destroy contexts.
  * Feature: context
+ * Functionality: context management
  * Run type: FULL
+ * Sub-category: i915
+ * Test category: GEM_Legacy
  *
  * SUBTEST: double-destroy
  *
diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 0c65027bc838..3c806ee5b9d9 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -51,12 +51,20 @@
  * Run type: FULL
  *
  * SUBTEST: basic
+ * Category: Infrastructure
  * Description: Test random context creation
+ * Functionality: context management
  * Run type: BAT
+ * Sub-category: i915
+ * Test category: GEM_Legacy
  *
  * SUBTEST: basic-files
+ * Category: Infrastructure
  * Description: Exercise implicit per-fd context creation
+ * Functionality: context management
  * Run type: BAT
+ * Sub-category: i915
+ * Test category: GEM_Legacy
  *
  * SUBTEST: ext-param
  * Description: Verify valid and invalid context extensions
diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index d15a7b7e5f67..61718494e86a 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -45,8 +45,12 @@
 #include "sw_sync.h"
 /**
  * TEST: gem ctx engines
+ * Category: Infrastructure
  * Feature: context
+ * Functionality: context management
  * Run type: FULL
+ * Sub-category: i915
+ * Test category: GEM_Legacy
  *
  * SUBTEST: execute-allforone
  *
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 9fec2bb10fdf..4109eb3f03d1 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -51,26 +51,38 @@
  * TEST: gem ctx exec
  * Description: Test context batch buffer execution.
  * Feature: context
+ * Functionality: command submission
+ * Sub-category: i915
  *
  * SUBTEST: basic
+ * Category: Infrastructure
  * Description: Check the basic context batch buffer execution.
  * Run type: BAT
+ * Test category: GEM_Legacy
  *
  * SUBTEST: basic-close-race
+ * Category: Infrastructure
  * Description: Race the execution and interrupt handlers along a context, while closing it at a random time.
  * Run type: FULL
+ * Test category: GEM_Legacy
  *
  * SUBTEST: basic-invalid-context
+ * Category: Infrastructure
  * Description: Verify that execbuf with invalid context fails.
  * Run type: FULL
+ * Test category: GEM_Legacy
  *
  * SUBTEST: basic-nohangcheck
+ * Category: Server
  * Description: Verify that contexts are automatically shotdown on close, if hangchecking is disabled.
  * Run type: FULL
+ * Test category: GEM_Legacy
  *
  * SUBTEST: basic-norecovery
+ * Category: Server
  * Description: Check the status of context after a hang by setting and unsetting the RECOVERABLE.
  * Run type: FULL
+ * Test category: GEM_Legacy
  *
  * SUBTEST: eviction
  * Description: Check maximum number of buffers it can evict for a context.
diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index 8e432cbdf8f5..2c30934daa23 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -36,8 +36,12 @@
 #include "sw_sync.h"
 /**
  * TEST: gem ctx freq
+ * Category: Server
  * Feature: context
+ * Functionality: frequency management
  * Run type: FULL
+ * Sub-category: Performance
+ * Test category: GEM_Legacy
  *
  * SUBTEST: sysfs
  */
diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 2c2da296d301..4f806a22cb4a 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -28,26 +28,50 @@
 #include "igt_types.h"
 /**
  * TEST: gem ctx isolation
- * Feature: context
+ * Category: Infrastructure
  * Run type: FULL
+ * Sub-category: HW
  *
  * SUBTEST: clean
+ * Feature: context
+ * Functionality: security
+ * Test category: GEM_Legacy
  *
  * SUBTEST: dirty-create
+ * Feature: context
+ * Functionality: security
+ * Test category: GEM_Legacy
  *
  * SUBTEST: dirty-switch
+ * Feature: context
+ * Functionality: security
+ * Test category: GEM_Legacy
  *
  * SUBTEST: nonpriv
+ * Feature: context
+ * Functionality: security
+ * Test category: GEM_Legacy
  *
  * SUBTEST: nonpriv-switch
+ * Feature: context
+ * Functionality: security
+ * Test category: GEM_Legacy
  *
  * SUBTEST: preservation
+ * Feature: context
+ * Functionality: security
+ * Test category: GEM_Legacy
  *
  * SUBTEST: preservation-S3
+ * Feature: context
  *
  * SUBTEST: preservation-S4
+ * Feature: context
  *
  * SUBTEST: preservation-reset
+ * Feature: context
+ * Functionality: security
+ * Test category: GEM_Legacy
  */
 
 /* MAX_REG must be greater than the maximum register address. */
diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index 5e56c645572b..dddc946a28af 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -32,8 +32,12 @@
 #include "i915/gem_vm.h"
 /**
  * TEST: gem ctx param
+ * Category: Infrastructure
  * Description: Basic test for context set/get param input validation.
+ * Functionality: context management
  * Run type: FULL
+ * Sub-category: i915
+ * Test category: GEM_Legacy
  *
  * SUBTEST: basic
  * Description: Basic test for context get/set param ioctls using valid context
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 42cf9632989e..bc5a4b5b41ba 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -47,8 +47,12 @@
 #include "sw_sync.h"
 /**
  * TEST: gem ctx persistence
+ * Category: Server
  * Feature: context
+ * Functionality: security
  * Run type: FULL
+ * Sub-category: Compute
+ * Test category: GEM_Legacy
  *
  * SUBTEST: engines-cleanup
  *
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 98827f09f9ea..f29005518c40 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -66,20 +66,42 @@
  * SUBTEST: Q-smoketest-all
  *
  * SUBTEST: create-shared-gtt
+ * Category: Desktop client
+ * Functionality: context management
+ * Sub-category: Media
+ * Test category: GEM_Legacy
  *
  * SUBTEST: detached-shared-gtt
+ * Category: Desktop client
+ * Functionality: context management
+ * Sub-category: Media
+ * Test category: GEM_Legacy
  *
  * SUBTEST: disjoint-timelines
+ * Category: Desktop client
+ * Functionality: context management
+ * Sub-category: Media
+ * Test category: GEM_Legacy
  *
  * SUBTEST: exec-shared-gtt
+ * Category: Desktop client
+ * Functionality: context management
+ * Sub-category: Media
+ * Test category: GEM_Legacy
  *
  * SUBTEST: exec-single-timeline
+ * Category: Desktop client
+ * Functionality: context management
+ * Test category: GEM_Legacy
  *
  * SUBTEST: exhaust-shared-gtt
  *
  * SUBTEST: exhaust-shared-gtt-lrc
  *
  * SUBTEST: single-timeline
+ * Category: Desktop client
+ * Functionality: context management
+ * Test category: GEM_Legacy
  */
 
 #define LO 0
-- 
2.40.1
