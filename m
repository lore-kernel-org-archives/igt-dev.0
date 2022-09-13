Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E62210E786
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 16:01:35 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 19:00:56 +0300
Message-Id: <20220913160101.6569-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20220913160101.6569-1-ville.syrjala@linux.intel.com>
References: <20220913160101.6569-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/7] tools/intel_watermark: Don't do
 intel_register_access_fini() too early on hsw/bdw
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

The tool will segfault if we try to the WM_DBG read/write after
intel_register_access_fini(). So move intel_register_access_fini()
to the very end.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 1818d79d0bee..d61379c6dc7f 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -644,8 +644,6 @@ static void ilk_wm_dump(void)
 	if (IS_BROADWELL(devid) || IS_HASWELL(devid))
 		wm_misc = read_reg(0x45260);
 
-	intel_register_access_fini(&mmio_data);
-
 	for (i = 0; i < num_pipes; i++)
 		printf("    WM_PIPE_%c = 0x%08x\n", pipe_name(i), wm_pipe[i]);
 	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
@@ -765,6 +763,8 @@ static void ilk_wm_dump(void)
 		/* clear the sticky bits */
 		write_reg(0x45280, wm_dbg);
 	}
+
+	intel_register_access_fini(&mmio_data);
 }
 
 static void vlv_wm_dump(void)
-- 
2.35.1
