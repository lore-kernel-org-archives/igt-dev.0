Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Hersen Wu <hersenxs.wu@amd.com>
Subject: [PATCH 2/3] [i-g-t] tests/amdgpu/amd_bypass: Fix psr edp r/x crc read
 timeout
Date: Wed, 17 Jan 2024 21:36:07 -0500
Message-ID: <20240118023608.55865-2-hersenxs.wu@amd.com>
In-Reply-To: <20240118023608.55865-1-hersenxs.wu@amd.com>
References: <20240118023608.55865-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com

With debugfs disallow_edp_enter_psr, disable edp psr before
tx read rx crc.

dpms off, tx write dpcd 0x600=2. this will let dpcd 0x170=0.
rx psr and crc check for rx internal logic are disabled.
with disallow_edp_enter_psr, when dpms on, kernel driver will
light up edp with dpcd 0x170=0. then tx read rx crc successfully.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_bypass.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index d192a30ea..d82e22ded 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -72,6 +72,24 @@ static void test_init(data_t *data)
 	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
 	igt_assert(data->output);
 
+	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		kmstest_set_connector_dpms(data->output->display->drm_fd,
+			data->output->config.connector, DRM_MODE_DPMS_OFF);
+
+		/* with dmps off, tx write dpcd 0x600=2 to rx. edp rx
+		 * exit psr state and stop verify crc from main link.
+		 * with disabllow edp enter psr within kernel, when run
+		 * dmps on to turn on display, kernel tx will not notify
+		 * rx psr enable and crc checking by rx. by this, when tx
+		 * want to read crc from rx, rx will check crc and response
+		 * right away. timeout will not happens.
+		 */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, true);
+
+		kmstest_set_connector_dpms(data->output->display->drm_fd,
+			data->output->config.connector, DRM_MODE_DPMS_ON);
+	}
+
 	data->mode = igt_output_get_mode(data->output);
 	igt_assert(data->mode);
 
@@ -370,6 +388,11 @@ static void bypass_8bpc_test(data_t *data)
 	igt_plane_set_fb(data->primary, NULL);
 	test_fini(data);
 	igt_remove_fb(data->drm_fd, &fb);
+
+	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		/* restore allow kernel driver eDP PSR */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, false);
+	}
 }
 
 igt_main
-- 
2.25.1
