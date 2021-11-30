Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2088.outbound.protection.outlook.com [40.107.95.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF576E9A5
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 08:35:51 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Tue, 30 Nov 2021 16:35:02 +0800
Message-ID: <20211130083503.10221-11-stylon.wang@amd.com>
In-Reply-To: <20211130083503.10221-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 10/11] tests/amdgpu/amd_plane: Ensure pipes
 are enabled before accessing
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Anson Jacob <Anson.Jacob@amd.com>

Couple of tests were accessing pipe's without ensuring if they are
enabled or not. Using for_each_pipe macro to do so.

Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
---
 tests/amdgpu/amd_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 66302ebf..e4c7dca3 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -150,9 +150,9 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 	int i, n, max_pipes = display->n_pipes;
 
-	for (i = 0; i < max_pipes; ++i) {
+	for_each_pipe(display, i) {
 		data->pipe_id[i] = PIPE_A + i;
-		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
+		data->pipe[i] = &display->pipes[data->pipe_id[i]];
 		data->primary[i] = igt_pipe_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
 		data->overlay[i] = igt_pipe_get_plane_type_index(
@@ -188,9 +188,9 @@ static void test_init(data_t *data)
 static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i, max_pipes = display->n_pipes;
+	int i;
 
-	for (i = 0; i < max_pipes; ++i) {
+	for_each_pipe(display, i) {
 		igt_pipe_crc_free(data->pipe_crc[i]);
 	}
 
-- 
2.33.1
