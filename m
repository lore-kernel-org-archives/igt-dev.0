Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6357110E432
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Feb 2023 09:17:46 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Feb 2023 14:49:48 +0530
Message-Id: <20230222091950.31758-2-swati2.sharma@intel.com>
In-Reply-To: <20230222091950.31758-1-swati2.sharma@intel.com>
References: <20230222091950.31758-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/3] tests/kms_plane_scaling: Prep work
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

struct can be reused to add more test cases.

v2: -don't declare list of lists[JP]

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 74554915..ecb4087f 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -43,6 +43,15 @@ typedef struct {
 	bool extended;
 } data_t;
 
+struct invalid_paramtests {
+	const char *testname;
+	uint32_t planesize[2];
+	struct {
+		enum igt_atomic_plane_properties prop;
+		uint32_t value;
+	} params[8];
+};
+
 const struct {
 	const char * const describe;
 	const char * const name;
@@ -901,14 +910,7 @@ static void invalid_parameter_tests(data_t *d)
 	igt_plane_t *plane;
 	int rval;
 
-	const struct {
-		const char *testname;
-		uint32_t planesize[2];
-		struct {
-			enum igt_atomic_plane_properties prop;
-			uint32_t value;
-		} params[8];
-	} paramtests[] = {
+	static const struct invalid_paramtests paramtests[] = {
 		{
 			.testname = "less-than-1-height-src",
 			.planesize = {256, 8},
-- 
2.25.1
