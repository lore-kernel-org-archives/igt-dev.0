Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AF410E074
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 09:05:38 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 11:05:27 +0200
Message-Id: <20230519090527.11396-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 pagefault tests
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add pagefault tests.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 8acd7f4ca..7242c8d83 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -95,6 +95,45 @@ igt@xe_exec_compute_mode@twice-bindengine-rebind
 igt@xe_exec_compute_mode@twice-bindengine-userptr-rebind
 igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate
 igt@xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race
+igt@xe_exec_fault_mode@twice-basic
+igt@xe_exec_fault_mode@many-basic
+igt@xe_exec_fault_mode@twice-userptr
+igt@xe_exec_fault_mode@twice-rebind
+igt@xe_exec_fault_mode@twice-userptr-rebind
+igt@xe_exec_fault_mode@twice-userptr-invalidate
+igt@xe_exec_fault_mode@twice-userptr-invalidate-race
+igt@xe_exec_fault_mode@twice-bindengine
+igt@xe_exec_fault_mode@twice-bindengine-userptr
+igt@xe_exec_fault_mode@twice-bindengine-rebind
+igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind
+igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate
+igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race
+igt@xe_exec_fault_mode@twice-basic-imm
+igt@xe_exec_fault_mode@twice-userptr-imm
+igt@xe_exec_fault_mode@twice-rebind-imm
+igt@xe_exec_fault_mode@twice-userptr-rebind-imm
+igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
+igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@twice-bindengine-imm
+igt@xe_exec_fault_mode@twice-bindengine-userptr-imm
+igt@xe_exec_fault_mode@twice-bindengine-rebind-imm
+igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-imm
+igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-imm
+igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@twice-basic-prefetch
+igt@xe_exec_fault_mode@twice-userptr-prefetch
+igt@xe_exec_fault_mode@twice-rebind-prefetch
+igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch
+igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch
+igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch
+igt@xe_exec_fault_mode@twice-bindengine-prefetch
+igt@xe_exec_fault_mode@twice-bindengine-userptr-prefetch
+igt@xe_exec_fault_mode@twice-bindengine-rebind-prefetch
+igt@xe_exec_fault_mode@twice-bindengine-userptr-rebind-prefetch
+igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-prefetch
+igt@xe_exec_fault_mode@twice-bindengine-userptr-invalidate-race-prefetch
+igt@xe_exec_fault_mode@twice-invalid-fault
+igt@xe_exec_fault_mode@twice-invalid-userptr-fault
 igt@xe_exec_reset@close-fd-no-exec
 igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
-- 
2.39.2
