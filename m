Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0674210E42E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 16:01:09 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 19:00:57 +0300
Message-Id: <20220913160101.6569-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20220913160101.6569-1-ville.syrjala@linux.intel.com>
References: <20220913160101.6569-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] tools/intel_watermark: Add missing
 newline
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

The hsw/bdw WM_DBG output is missing a newline at the end, add one.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index d61379c6dc7f..863261e823a5 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -760,6 +760,7 @@ static void ilk_wm_dump(void)
 			if (wm_dbg & (1 << (23+i)))
 				printf(" LP%d", i);
 		}
+		printf("\n");
 		/* clear the sticky bits */
 		write_reg(0x45280, wm_dbg);
 	}
-- 
2.35.1
