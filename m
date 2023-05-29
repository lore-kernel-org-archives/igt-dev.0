Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785E010E252
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 08:59:31 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon, 29 May 2023 14:29:31 +0530
Message-Id: <20230529085931.473267-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 multi threaded eviction tests
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add VRAM eviction tests with multi-threading.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 7242c8d8..69e70118 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -7,17 +7,22 @@ igt@xe_debugfs@gt
 igt@xe_debugfs@forcewake
 igt@xe_dma_buf_sync@export-dma-buf-once
 igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
+igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
 igt@xe_evict@evict-beng-small
 igt@xe_evict@evict-beng-small-cm
 igt@xe_evict@evict-beng-small-external
 igt@xe_evict@evict-beng-small-external-cm
 igt@xe_evict@evict-beng-small-multi-vm
+igt@xe_evict@evict-cm-threads-small
+igt@xe_evict@evict-mixed-threads-small
+igt@xe_evict@evict-mixed-threads-small-multi-vm
 igt@xe_evict@evict-small
 igt@xe_evict@evict-small-cm
 igt@xe_evict@evict-small-external
 igt@xe_evict@evict-small-external-cm
 igt@xe_evict@evict-small-multi-vm
 igt@xe_evict@evict-small-multi-vm-cm
+igt@xe_evict@evict-threads-small
 igt@xe_exec_balancer@twice-virtual-basic
 igt@xe_exec_balancer@no-exec-virtual-basic
 igt@xe_exec_balancer@twice-cm-virtual-basic
-- 
2.25.1
