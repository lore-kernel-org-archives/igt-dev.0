Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8610E26B
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Mar 2022 17:42:50 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Mar 2022 19:42:43 +0200
Message-Id: <20220325174246.25162-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tools/intel_watermark: Add missing
 intel_register_access_fini() for skl+
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The skl+ code forgot to call intel_register_access_fini(). Make
it do so.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 1e235ed30a63..1818d79d0bee 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -590,6 +590,8 @@ static void skl_wm_dump(void)
 	printf("\n");
 	/* clear the sticky bits */
 	write_reg(0x45280, wm_dbg);
+
+	intel_register_access_fini(&mmio_data);
 }
 
 static void ilk_wm_dump(void)
-- 
2.34.1
