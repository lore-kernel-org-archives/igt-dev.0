Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1AD8E9C3
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 14:21:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Mon, 11 Jul 2022 19:49:40 +0530
Message-Id: <20220711141940.610063-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_cursor_legacy: Avoid usage of same pipe
 on multiple outputs
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

Sanitize the system state before starting the subtest.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6198
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index fc4a291d..c5b2bd30 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -429,6 +429,8 @@ static void flip(igt_display_t *display,
 	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(results != MAP_FAILED);
 
+	igt_display_reset(display);
+
 	flip_pipe = find_connected_pipe(display, !!flip_pipe);
 	cursor_pipe = find_connected_pipe(display, !!cursor_pipe);
 
-- 
2.35.1
