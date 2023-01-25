Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F0210E710
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 04:55:26 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 06:55:13 +0200
Message-Id: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/10] tools/intel_watermark: Add missing
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
2.39.1
