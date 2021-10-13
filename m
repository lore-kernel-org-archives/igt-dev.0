Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160256EA5F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 12:59:55 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:43 +0300
Message-Id: <20211013125949.19373-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/7] lib: Introduce igt_memdup()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Provide a helper to do the malloc()+memcpy() in one swift blow.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_aux.c | 11 +++++++++++
 lib/igt_aux.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 1217f5e88094..2445e483e210 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1527,3 +1527,14 @@ uint64_t vfs_file_max(void)
 	}
 	return max;
 }
+
+void *igt_memdup(const void *ptr, size_t len)
+{
+	void *dup;
+
+	dup = malloc(len);
+	if (dup)
+		memcpy(dup, ptr, len);
+
+	return dup;
+}
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 30b175d70d8b..a3c477abcd86 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -324,4 +324,6 @@ void igt_lsof(const char *dpath);
 
 uint64_t vfs_file_max(void);
 
+void *igt_memdup(const void *ptr, size_t len);
+
 #endif /* IGT_AUX_H */
-- 
2.32.0
