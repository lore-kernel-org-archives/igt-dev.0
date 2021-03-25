Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06236EB23
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 05:45:53 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Wed, 24 Mar 2021 22:45:39 -0700
Message-Id: <20210325054549.465386-6-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 05/15] Add MI_SET_APPID instruction
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
index ac1fc6cb..553f4839 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2546,6 +2546,15 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define CTXT_PALETTE_SAVE_DISABLE	(1<<3)
 #define CTXT_PALETTE_RESTORE_DISABLE	(1<<2)
 
+#define MI_SET_APPID                    (0x0e<<23)
+#define APPID_CTXSAVE_INHIBIT           (1<<8)
+#define APPID_CTXREST_INHIBIT           (1<<9)
+#define DISPLAY_APPTYPE                 (0)
+#define TRANSCODE_APPTYPE               (1)
+#define APPTYPE(n)                      ((n & 0x1)<<7)
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
