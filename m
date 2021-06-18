Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8256EA28
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 14:29:12 +0000 (UTC)
From: Anson Jacob <Anson.Jacob@amd.com>
Date: Fri, 18 Jun 2021 10:28:52 -0400
Message-ID: <20210618142855.5750-2-Anson.Jacob@amd.com>
In-Reply-To: <20210618142855.5750-1-Anson.Jacob@amd.com>
References: <20210618142855.5750-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_kms: Fix test_init() crash when
 <6 pipes
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
Cc: Petri Latvala <petri.latvala@intel.com>, Anson Jacob <Anson.Jacob@amd.com>, Victor Lu <victorchengchi.lu@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[why & how]
An upstream change is causing the common amdgpu test_init() to crash on
ASICs with <6 pipes.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Mark Yacoub <markyacoub@google.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c7c69b6ea0eb..26c51a384918 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2164,8 +2164,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	 * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CRTC_ID ioctl
 	 * for a pipe to do pipe ordering with respect to crtc list.
 	 */
-	display->n_pipes = IGT_MAX_PIPES;
-	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
+	display->n_pipes = resources->count_crtcs;
+	display->pipes = calloc(sizeof(igt_pipe_t), IGT_MAX_PIPES);
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
 
 	for (i = 0; i < resources->count_crtcs; i++) {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
