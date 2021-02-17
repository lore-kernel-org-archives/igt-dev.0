Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843C66E4F4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Feb 2021 12:18:33 +0000 (UTC)
From: Martin Peres <martin.peres@mupuf.org>
Date: Wed, 17 Feb 2021 14:18:11 +0200
Message-Id: <20210217121812.103903-2-martin.peres@mupuf.org>
In-Reply-To: <20210217121812.103903-1-martin.peres@mupuf.org>
References: <20210217121812.103903-1-martin.peres@mupuf.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 2/3] amdgpu/info: convert asserts to
 human-readable explanations
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Having a test fail with "r != 0" is not helpful, and forces developers
to open the source code of IGT to figure out what this actually means.

This commit changes these asserts so as the function call that failed
is in the stack trace, and adds a human-readable explanation of what
failed.

Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Suggested-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Martin Peres <martin.peres@mupuf.org>
---
 tests/amdgpu/amd_info.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index 6764e640..b8f61e16 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -34,14 +34,13 @@ static void query_firmware_version_test(void)
 {
 	struct amdgpu_gpu_info gpu_info = {};
 	uint32_t version, feature;
-	int r;
 
-	r = amdgpu_query_gpu_info(dev, &gpu_info);
-	igt_assert_eq(r, 0);
+	igt_assert_f(amdgpu_query_gpu_info(dev, &gpu_info) == 0,
+		     "Failed to query the gpu information\n");
 
-	r = amdgpu_query_firmware_version(dev, AMDGPU_INFO_FW_VCE, 0, 0,
-					  &version, &feature);
-	igt_assert_eq(r, 0);
+	igt_assert_f(amdgpu_query_firmware_version(dev, AMDGPU_INFO_FW_VCE, 0,
+						   0, &version, &feature) == 0,
+		     "Failed to query the firmware version\n");
 }
 
 IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
