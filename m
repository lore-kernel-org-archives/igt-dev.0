Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1646EE13
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:50:10 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:43 -0700
Message-Id: <20210514064953.1644250-7-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/16] Add MI_SET_APPID instruction
 definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add MI_SET_APPID instruction and param definitions

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/intel_reg.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index ac1fc6cb..46b5da20 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2546,6 +2546,15 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define CTXT_PALETTE_SAVE_DISABLE	(1<<3)
 #define CTXT_PALETTE_RESTORE_DISABLE	(1<<2)
 
+#define MI_SET_APPID                    (0x0E << 23)
+#define APPID_CTXSAVE_INHIBIT           (1 << 8)
+#define APPID_CTXREST_INHIBIT           (1 << 9)
+#define DISPLAY_APPTYPE                 (0)
+#define TRANSCODE_APPTYPE               (1)
+#define APPTYPE(n)                      (n << 7)
+#define APPID(n)                        (n & 0x7f)
+
+
 /* Dword 0 */
 #define MI_VERTEX_BUFFER		(0x17<<23)
 #define MI_VERTEX_BUFFER_IDX(x)		(x<<20)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
