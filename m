Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62A210E19D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 21:04:48 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tvrtko.ursulin@intel.com, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 22:03:31 +0100
Message-ID: <20230808210437.977482-2-adrian.larumbe@collabora.com>
In-Reply-To: <20230808210437.977482-1-adrian.larumbe@collabora.com>
References: <20230808210437.977482-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] lib/igt_drm_fdinfo.c: refactor region array
 population code
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adrian.larumbe@collabora.com, kernel@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The same sequence of operations is being done every time a DRM memory
region key:value pair is found in the DRM fdinfo file. Refactor them all
into a macro to avoid code reduplication.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_drm_fdinfo.c | 64 +++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 45 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index f5a5b8e19dc3..b72822894782 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -191,6 +191,19 @@ out:
 	return found;
 }
 
+#define UPDATE_REGION(idx, region, val)					\
+	do {								\
+		if (idx >= 0) {						\
+			info->region_mem[idx].region = val;		\
+			if (!regions_found[idx]) {			\
+				info->num_regions++;			\
+				regions_found[idx] = true;		\
+				if (idx > info->last_region_index)	\
+					info->last_region_index = idx;	\
+			}						\
+		}							\
+	} while (0)
+
 unsigned int
 __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		       const char **name_map, unsigned int map_entries,
@@ -245,63 +258,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		} else if (!strncmp(l, "drm-total-", 10)) {
 			idx = parse_region(l, info, strlen("drm-total-"),
 					   region_map, region_entries, &val);
-			if (idx >= 0) {
-				info->region_mem[idx].total = val;
-				if (!regions_found[idx]) {
-					info->num_regions++;
-					regions_found[idx] = true;
-					if (idx > info->last_region_index)
-						info->last_region_index = idx;
-				}
-			}
+			UPDATE_REGION(idx, total, val);
 		} else if (!strncmp(l, "drm-shared-", 11)) {
 			idx = parse_region(l, info, strlen("drm-shared-"),
 					   region_map, region_entries, &val);
-			if (idx >= 0) {
-				info->region_mem[idx].shared = val;
-				if (!regions_found[idx]) {
-					info->num_regions++;
-					regions_found[idx] = true;
-					if (idx > info->last_region_index)
-						info->last_region_index = idx;
-				}
-			}
+			UPDATE_REGION(idx, shared, val);
+
 		} else if (!strncmp(l, "drm-resident-", 13)) {
 			idx = parse_region(l, info, strlen("drm-resident-"),
 					   region_map, region_entries, &val);
-			if (idx >= 0) {
-				info->region_mem[idx].resident = val;
-				if (!regions_found[idx]) {
-					info->num_regions++;
-					regions_found[idx] = true;
-					if (idx > info->last_region_index)
-						info->last_region_index = idx;
-				}
-			}
+			UPDATE_REGION(idx, resident, val);
 		} else if (!strncmp(l, "drm-purgeable-", 14)) {
 			idx = parse_region(l, info, strlen("drm-purgeable-"),
 					   region_map, region_entries, &val);
-			if (idx >= 0) {
-				info->region_mem[idx].purgeable = val;
-				if (!regions_found[idx]) {
-					info->num_regions++;
-					regions_found[idx] = true;
-					if (idx > info->last_region_index)
-						info->last_region_index = idx;
-				}
-			}
+			UPDATE_REGION(idx, purgeable, val);
 		} else if (!strncmp(l, "drm-active-", 11)) {
 			idx = parse_region(l, info, strlen("drm-active-"),
 					   region_map, region_entries, &val);
-			if (idx >= 0) {
-				info->region_mem[idx].active = val;
-				if (!regions_found[idx]) {
-					info->num_regions++;
-					regions_found[idx] = true;
-					if (idx > info->last_region_index)
-						info->last_region_index = idx;
-				}
-			}
+			UPDATE_REGION(idx, active, val);
 		}
 	}
 
-- 
2.41.0
