Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:17:36 +0200
Message-ID: <20231011141734.590321-14-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
References: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 01/11] lib/ktap: Improve TODO workaround
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

A workaround was implemented in IGT KTAP parser so it could accepted KTAP
reports with missing top level KTAP version and test suite plan headers.
While the issue has been fixed by a kernel side commit c95e7c05c139
("kunit: Report the count of test suites in a module"), included in the
mainline kernel since v6.6-rc1, we still need to keep that workaround in
place to preserve IGT compatibility with LTS kernel version 6.1 as long as
it is used by major Linux distributions.

Update the comment with a reference to the kernel side fix and a
clarification on why we need to keep the workaround in place.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_ktap.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 5eac102417..3df4d6950d 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -91,9 +91,16 @@ int igt_ktap_parse(const char *buf, struct igt_ktap_results *ktap)
 				       "%*1[ ]%*1[ ]%*1[ ]%*1[ ]KTAP%*[ ]version%*[ ]%u %n",
 				       &n, &len) == 1 && len == strlen(buf))) {
 		/*
-		 * TODO: drop the following workaround as soon as
-		 * kernel side issue of missing lines with top level
-		 * KTAP version and test suite plan is fixed.
+		 * TODO: drop the following workaround, which addresses a kernel
+		 * side issue of missing lines that provide top level KTAP
+		 * version and test suite plan, as soon as no longer needed.
+		 *
+		 * The issue has been fixed in v6.6-rc1, commit c95e7c05c139
+		 * ("kunit: Report the count of test suites in a module"),
+		 * but we still need this workaround for as long as LTS kernel
+		 * version 6.1, with DRM selftests already converted to Kunit,
+		 * but without that missing Kunit headers issue fixed, is used
+		 * by major Linux distributions.
 		 */
 		if (ktap->expect == KTAP_START) {
 			ktap->suite_count = 1;
-- 
2.42.0
