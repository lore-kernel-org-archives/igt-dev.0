Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0B310E44C
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 17:36:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Oct 2023 19:36:18 +0200
Message-Id: <20231024173618.127007-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231024173618.127007-1-zbigniew.kempczynski@intel.com>
References: <20231024173618.127007-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 5/5] intel-ci/xe-fast-feedback: Add two
 xe_evict_ccs subtests for Xe run
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

There are two subtests which should be run in bat.
First is simple check of eviction, second exercises driver in multiple
processes to check does any race influences on object consistency.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 0cf28baf98..869dd2526d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -26,6 +26,8 @@ igt@xe_evict@evict-small-external-cm
 igt@xe_evict@evict-small-multi-vm
 igt@xe_evict@evict-small-multi-vm-cm
 igt@xe_evict@evict-threads-small
+igt@xe_evict_ccs@evict-ccs-overcommit-simple
+igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd
 igt@xe_exec_balancer@twice-virtual-basic
 igt@xe_exec_balancer@no-exec-virtual-basic
 igt@xe_exec_balancer@twice-cm-virtual-basic
-- 
2.34.1
