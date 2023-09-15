Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9758C10E0FC
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 05:17:30 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 karolina.stolarek@intel.com, sai.gowtham.ch@intel.com
Date: Fri, 15 Sep 2023 10:46:15 +0530
Message-Id: <20230915051617.9361-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/intel_reg: Add copy commands in the
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
 lib/intel_reg.h | 4 ++++
 1 file changed, 4 insertions(+)

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
