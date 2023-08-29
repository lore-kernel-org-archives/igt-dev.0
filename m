Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:07 -0700
Message-Id: <20230829141107.1505705-5-lucas.demarchi@intel.com>
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 4/4] tests/xe_debugfs: skip page table level
 check for Xe2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Starting with Xe2, a 5-level page table is always used, regardless of
the actual virtual address range supported by the platform. Do not
depend on VA range to configure max page table level.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/xe/xe_debugfs.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index e51d03661..72c069bfc 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -74,6 +74,7 @@ static int validate_entries(int fd, const char *add_path, const char * const str
 static void
 test_base(int fd, struct drm_xe_query_config *config)
 {
+	uint16_t devid = intel_get_drm_devid(fd);
 	static const char * const expected_files[] = {
 		"gt0",
 		"gt1",
@@ -86,7 +87,6 @@ test_base(int fd, struct drm_xe_query_config *config)
 		"clients",
 		"name"
 	};
-
 	char reference[4096];
 	int val = 0;
 
@@ -104,16 +104,19 @@ test_base(int fd, struct drm_xe_query_config *config)
 
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
-	switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
-	case 48:
-		val = 3;
-		break;
-	case 57:
-		val = 4;
-		break;
+	if (!AT_LEAST_GEN(devid, 20)) {
+		switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
+		case 48:
+			val = 3;
+			break;
+		case 57:
+			val = 4;
+			break;
+		}
+
+		sprintf(reference, "vm_max_level %d", val);
+		igt_assert(igt_debugfs_search(fd, "info", reference));
 	}
-	sprintf(reference, "vm_max_level %d", val);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
 
 	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
 	if (config->info[XE_QUERY_CONFIG_GT_COUNT] > 1)
-- 
2.40.1
