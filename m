Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9BF10E445
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 05:19:53 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Fri, 18 Aug 2023 10:49:15 +0530
Message-Id: <20230818051916.28272-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20230818051916.28272-1-sai.gowtham.ch@intel.com>
References: <20230818051916.28272-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_reg: Add copy commands in the
 lib
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add memory copy and set commands to the lib.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_mocs.h | 2 ++
 lib/intel_reg.h  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
index 255eac0ff..4f4cf53e0 100644
--- a/lib/intel_mocs.h
+++ b/lib/intel_mocs.h
@@ -6,6 +6,8 @@
 #ifndef _INTEL_MOCS_H
 #define _INTEL_MOCS_H
 
+#define MEM_COPY_MOCS_SHIFT                     25
+
 uint8_t intel_get_wb_mocs(int fd);
 uint8_t intel_get_uc_mocs(int fd);
 
diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 3bf3676dc..322aec9fd 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2564,6 +2564,10 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #define XY_FAST_COLOR_BLT		((0x2<<29)|(0x44<<22)|0xe)
 
+/* RAW memory commands */
+#define MEM_COPY_CMD                    ((0x2 << 29)|(0x5a << 22)|0x8)
+#define MEM_SET_CMD                     ((0x2 << 29)|(0x5b << 22)|0x5)
+
 #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
 /* dword 0 */
 #define   XY_FAST_COPY_SRC_TILING_LINEAR		(0 << 20)
-- 
2.39.1
