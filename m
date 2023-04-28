Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20E10ECED
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:48 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Fri, 28 Apr 2023 17:56:35 +0530
Message-Id: <20230428122635.3251739-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 eviction tests
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

Add VRAM eviction tests.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index ecf44ca7..f05b88c9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -159,6 +159,17 @@ igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
 igt@xe_waitfence@test
+igt@xe_evict@evict-beng-small
+igt@xe_evict@evict-beng-small-cm
+igt@xe_evict@evict-beng-small-external
+igt@xe_evict@evict-beng-small-external-cm
+igt@xe_evict@evict-beng-small-multi-vm
+igt@xe_evict@evict-small
+igt@xe_evict@evict-small-cm
+igt@xe_evict@evict-small-external
+igt@xe_evict@evict-small-external-cm
+igt@xe_evict@evict-small-multi-vm
+igt@xe_evict@evict-small-multi-vm-cm
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
 igt@kms_addfb_basic@bad-pitch-0
-- 
2.25.1
