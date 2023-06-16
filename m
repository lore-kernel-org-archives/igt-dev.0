Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8395910E607
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 11:01:14 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Fri, 16 Jun 2023 16:30:39 +0530
Message-Id: <20230616110039.26850-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 xe_spin_batch test
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add xe_spin_batch tests to the test list.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Acked-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 9ea0c482..7dfe0745 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -198,6 +198,10 @@ igt@xe_query@query-topology
 igt@xe_query@query-invalid-extension
 igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
+igt@xe_spin_batch@spin-all
+igt@xe_spin_batch@spin-basic
+igt@xe_spin_batch@spin-basic-all
+igt@xe_spin_batch@spin-batch
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.39.1
