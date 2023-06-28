Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E0710E0E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 09:53:26 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, tejas.upadhyay@intel.com,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 priyanka.dandamudi@intel.com
Date: Wed, 28 Jun 2023 15:22:37 +0530
Message-Id: <20230628095239.615655-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230628095239.615655-1-priyanka.dandamudi@intel.com>
References: <20230628095239.615655-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_sysfs: Add support to iterate
 over engines
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

It helps to test engines by iterating over sysfs/engines.

v2: Updated a parameter to accept array of strings to make dynamic for all schedulers.
Updated engine to engine_fd for better readability.(rahul)
Added description for lib function.(Kamil)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/igt_sysfs.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 50 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 35a4faa9a..3a4bf6f97 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -856,3 +856,50 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	igt_assert_eq(get, prev);
 	igt_assert(!ret);
 }
+
+/**
+ * igt_sysfs_engines:
+ * @xe: fd of the device
+ * @engines: fd of the directory engine
+ * @property: property array
+ * @test: Dynamic engine test
+ *
+ * It iterates over sysfs/engines and runs a dynamic engine test.
+ *
+ */
+void igt_sysfs_engines(int xe, int engines, const char **property,
+		       void (*test)(int, int, const char **))
+{
+	struct dirent *de;
+	DIR *dir;
+
+	lseek(engines, 0, SEEK_SET);
+
+	dir = fdopendir(engines);
+	if (!dir)
+		close(engines);
+
+	while ((de = readdir(dir))) {
+		int engine_fd;
+
+		if (*de->d_name == '.')
+			continue;
+
+		engine_fd = openat(engines, de->d_name, O_RDONLY);
+		if (engine < 0)
+			continue;
+
+		igt_dynamic(de->d_name) {
+			if (property) {
+				struct stat st;
+
+				igt_require(fstatat(engine_fd, property[0], &st, 0) == 0);
+				igt_require(fstatat(engine_fd, property[1], &st, 0) == 0);
+				igt_require(fstatat(engine_fd, property[2], &st, 0) == 0);
+			}
+			errno = 0;
+			test(xe, engine_fd, property);
+		}
+		close(engine_fd);
+	}
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 978b6906e..5635fc690 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -147,4 +147,7 @@ typedef struct igt_sysfs_rw_attr {
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 
+void igt_sysfs_engines(int xe, int engines, const char **property,
+		       void (*test)(int, int, const char **));
+
 #endif /* __IGT_SYSFS_H__ */
-- 
2.25.1
