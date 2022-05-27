Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 May 2022 11:50:41 +0100
Message-Id: <20220527105042.2233128-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220527105042.2233128-1-tvrtko.ursulin@linux.intel.com>
References: <20220527105042.2233128-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/drm_fdinfo: Ensure buffer is null
 terminated
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Ensure buffer is null terminated at the point where the read ended and not
at the end of the whole buffer. Otherwise string parsing can stray into
un-initialised memory.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_fdinfo.c | 8 ++++----
 lib/igt_drm_fdinfo.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index b422f67a4ace..250d9e8917f2 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -44,12 +44,12 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
 	if (fd < 0)
 		return 0;
 
-	buf[sz - 1] = 0;
-	count = read(fd, buf, sz);
-	buf[sz - 1] = 0;
+	count = read(fd, buf, sz - 1);
+	if (count > 0)
+		buf[count - 1] = 0;
 	close(fd);
 
-	return count;
+	return count > 0 ? count : 0;
 }
 
 static int parse_engine(char *line, struct drm_client_fdinfo *info,
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index 5db63e28b07e..8759471615bd 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -46,7 +46,7 @@ struct drm_client_fdinfo {
  * igt_parse_drm_fdinfo: Parses the drm fdinfo file
  *
  * @drm_fd: DRM file descriptor
- * @info: Structure to populate with read data
+ * @info: Structure to populate with read data. Must be zeroed.
  *
  * Returns the number of valid drm fdinfo keys found or zero if not all
  * mandatory keys were present or no engines found.
@@ -58,7 +58,7 @@ unsigned int igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info);
  *
  * @dir: File descriptor pointing to /proc/pid/fdinfo directory
  * @fd: String representation of the file descriptor number to parse.
- * @info: Structure to populate with read data
+ * @info: Structure to populate with read data. Must be zeroed.
  *
  * Returns the number of valid drm fdinfo keys found or zero if not all
  * mandatory keys were present or no engines found.
-- 
2.32.0
