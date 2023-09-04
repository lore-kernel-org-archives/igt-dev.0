Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6710E32E
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Sep 2023 11:06:03 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, karolina.stolarek@intel.com,
 sai.gowtham.ch@intel.com
Date: Mon,  4 Sep 2023 16:34:58 +0530
Message-Id: <20230904110458.24177-5-sai.gowtham.ch@intel.com>
In-Reply-To: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
References: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/intel_reg: Add copy commands in the
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
