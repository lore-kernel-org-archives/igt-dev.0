Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E3810E0EF
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Jun 2023 11:13:58 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, tejas.upadhyay@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Date: Sun, 25 Jun 2023 16:43:12 +0530
Message-Id: <20230625111316.534770-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230625111316.534770-1-priyanka.dandamudi@intel.com>
References: <20230625111316.534770-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/igt_sysfs: Add support to iterate
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

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/igt_sysfs.c | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 35a4faa9..07a0bd1d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -856,3 +856,38 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	igt_assert_eq(get, prev);
 	igt_assert(!ret);
 }
+
+void igt_sysfs_engines(int xe, int engines, const char *file,
+					   void (*test)(int, int))
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
+		int engine;
+
+		if (*de->d_name == '.')
+			continue;
+
+		engine = openat(engines, de->d_name, O_RDONLY);
+		if (engine < 0)
+			continue;
+
+		igt_dynamic(de->d_name) {
+				if (file) {
+					struct stat st;
+
+					igt_require(fstatat(engine, file, &st, 0) == 0);
+				}
+				errno = 0;
+				test(xe, engine);
+		}
+		close(engine);
+	}
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 978b6906..c89780ac 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -147,4 +147,7 @@ typedef struct igt_sysfs_rw_attr {
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 
+void igt_sysfs_engines(int xe, int gt, const char *file,
+		       void (*test)(int, int));
+
 #endif /* __IGT_SYSFS_H__ */
-- 
2.25.1
