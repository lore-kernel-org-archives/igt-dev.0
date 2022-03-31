Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189D410E24B
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 12:49:23 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Mar 2022 15:48:36 +0300
Message-Id: <20220331124836.6186-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: Override results for subtests even
 when there's dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_runner converts passing test results to warn if a test outputs
stuff to stderr. It also converts results if kernel logs contain
warnings to dmesg-warn or dmesg-fail, depending on the test's own
result.

Perform this same conversion to subtests even if they contain dynamic
subtests, now that we have the capability of keeping those around.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
---
 runner/resultgen.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 76f9fb7d..6ecf325b 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1385,10 +1385,8 @@ static void override_results(char *binary,
 
 	for (i = 0; i < subtests->size; i++) {
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
-		if (subtests->subs[i].dynamic_size == 0) {
-			obj = get_or_create_json_object(tests, piglit_name);
-			override_result_single(obj);
-		}
+		obj = get_or_create_json_object(tests, piglit_name);
+		override_result_single(obj);
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
 			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
-- 
2.30.2
