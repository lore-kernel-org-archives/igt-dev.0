Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA09210E551
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:18:40 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:08:45 +0300
Message-Id: <20230601130850.26359-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
References: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/7] tests/kms_tiled_display: Make
 basic_test() static
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

MAke basic_test() static since it's not needed anywhere else.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_tiled_display.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 3bb240fd574a..ad98462012db 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -70,9 +70,6 @@ typedef struct {
 
 } data_t;
 
-void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd,
-		igt_display_t *display);
-
 #ifdef HAVE_CHAMELIUM
 static void test_with_chamelium(data_t *data, igt_display_t *display);
 #endif
@@ -422,8 +419,8 @@ static void test_with_chamelium(data_t *data, igt_display_t *display)
 }
 #endif
 
-void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd,
-		igt_display_t *display)
+static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd,
+		       igt_display_t *display)
 {
 		int ret;
 
-- 
2.39.3
