Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F73F10E786
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 16:01:33 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 19:00:55 +0300
Message-Id: <20220913160101.6569-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/7] tools/intel_watermark: Add missing
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
2.35.1
