Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00FC6EA12
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 06:58:10 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Thu,  8 Apr 2021 12:38:16 +0530
Message-Id: <20210408070816.14781-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_fbcon_fbt : Added test description
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
 tests/kms_fbcon_fbt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
index 4df4db52..43a7ace1 100644
--- a/tests/kms_fbcon_fbt.c
+++ b/tests/kms_fbcon_fbt.c
@@ -419,12 +419,20 @@ igt_main
 	igt_fixture
 		setup_environment(&drm);
 
+	igt_describe("Test the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc")
 		subtest(&drm, &fbc, false);
+	igt_describe("Test the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with psr enabled.");
 	igt_subtest("psr")
 		subtest(&drm, &psr, false);
+	igt_describe("Suspend test to validate  the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend")
 		subtest(&drm, &fbc, true);
+	igt_describe("Suspend test to validate the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with psr enabled.");
 	igt_subtest("psr-suspend")
 		subtest(&drm, &psr, true);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
