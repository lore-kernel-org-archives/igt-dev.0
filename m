Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495110F9A5
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 18:22:54 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon,  7 Feb 2022 23:51:46 +0530
Message-Id: <20220207182152.31211-12-jeevan.b@intel.com>
In-Reply-To: <20220207182152.31211-1-jeevan.b@intel.com>
References: <20220207182152.31211-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 11/17] igt/tests: Add support for
 Tile4(TileF) format to testdisplay
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

testdisplay is a great test for manual testing/debug of Tile-4; we just
need an extra parameter to enable that tiling format.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/testdisplay.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 54327761..e9fbd260 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -593,7 +593,7 @@ static void set_termio_mode(void)
 	tcsetattr(tio_fd, TCSANOW, &tio);
 }
 
-static char optstr[] = "3Aiaf:s:d:p:mrto:j:y";
+static char optstr[] = "3Aiaf:s:d:p:mrt4o:j:y";
 static struct option long_opts[] = {
 	{"yb", 0, 0, OPT_YB},
 	{"yf", 0, 0, OPT_YF},
@@ -612,6 +612,7 @@ static const char *help_str =
 	"  -t\tuse an X-tiled framebuffer\n"
 	"  -y, --yb\n"
 	"  \tuse a Y-tiled framebuffer\n"
+	"  -4\tuse an Tile-4 framebuffer\n"
 	"  --yf\tuse a Yf-tiled framebuffer\n"
 	"  -j\tdo dpms off, optional arg to select dpms level (1-3)\n"
 	"  -r\tprint a QR code on the screen whose content is \"pass\" for the automatic test\n"
@@ -680,6 +681,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 	case OPT_YF:
 		modifier = I915_FORMAT_MOD_Yf_TILED;
 		break;
+	case '4':
+		modifier = I915_FORMAT_MOD_4_TILED;
+		break;
 	case 'r':
 		qr_code = 1;
 		break;
-- 
2.17.1
