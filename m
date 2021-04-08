Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DC66EA19
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 07:16:39 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Thu,  8 Apr 2021 12:56:42 +0530
Message-Id: <20210408072642.21995-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_panel_fitting.c : Added test
 description
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_panel_fitting.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 4f4c5608..398addeb 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -257,9 +257,11 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Tests panel fitting usages with legacy style commit.");
 	igt_subtest("legacy")
 		test_panel_fitting(&data);
 
+	igt_describe("Tests panel fitting usages with atomic fastset.");
 	igt_subtest("atomic-fastset")
 		test_atomic_fastset(&data);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
