Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C799410E2A2
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 10:44:50 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 16:16:35 +0530
Message-Id: <20220909104635.2041605-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_chamelium: Fix common
 suspend/hibernate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently test executes and fails even if no ports are connected to
chamelium, Added a igt_fixture to prevent that from happening.

v2 : try_suspend_resume_hpd already loops through every port (Petri)

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
index d97b439a..1be1c41a 100644
--- a/tests/chamelium/kms_chamelium.c
+++ b/tests/chamelium/kms_chamelium.c
@@ -2945,6 +2945,11 @@ igt_main
 
 	igt_describe("Tests that operate on all connectors");
 	igt_subtest_group {
+
+		igt_fixture {
+			igt_require(data.port_count);
+		}
+
 		igt_describe(test_suspend_resume_hpd_common_desc);
 		igt_subtest("common-hpd-after-suspend")
 			test_suspend_resume_hpd_common(&data,
-- 
2.25.1
