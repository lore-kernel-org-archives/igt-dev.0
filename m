Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4E86E197
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 13:43:54 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 17 Aug 2021 16:45:23 +0300
Message-Id: <20210817134523.1390961-3-mika.kahola@intel.com>
In-Reply-To: <20210817134523.1390961-1-mika.kahola@intel.com>
References: <20210817134523.1390961-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane_lowres: Reset display
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
 tests/kms_plane_lowres.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 39c7abbe..bf24c201 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -166,6 +166,8 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
 	igt_plane_t *primary;
 	igt_crc_t crc_lowres, crc_hires1, crc_hires2;
 
+	igt_display_reset(&data->display);
+
 	igt_output_set_pipe(data->output, data->pipe);
 
 	primary = compatible_main_plane(plane, data->output, data->devid);
-- 
2.27.0
