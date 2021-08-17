Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9716E19B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 13:43:53 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 17 Aug 2021 16:45:22 +0300
Message-Id: <20210817134523.1390961-2-mika.kahola@intel.com>
In-Reply-To: <20210817134523.1390961-1-mika.kahola@intel.com>
References: <20210817134523.1390961-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane_multiple: Reset display
 before testing
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
Cc: Mika Kahola <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Reset display before entering teste execution. Sometimes,
display can be left on stale state and resetting display
cleans up the state.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_plane_multiple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 45cabb50..25e694b8 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -68,6 +68,8 @@ struct {
  */
 static void test_init(data_t *data, enum pipe pipe, int n_planes)
 {
+	igt_display_reset(&data->display);
+
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane = calloc(n_planes, sizeof(*data->plane));
-- 
2.27.0
