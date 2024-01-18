Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Hersen Wu <hersenxs.wu@amd.com>
Subject: [PATCH 3/3] [i-g-t] tests/amdgpu/amd_ilr: Fix psr edp rx crc read
 timeout
Date: Wed, 17 Jan 2024 21:36:08 -0500
Message-ID: <20240118023608.55865-3-hersenxs.wu@amd.com>
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

With debugfs disallow_edp_enter_psr, disable edp
psr before tx read rx crc.

With set_all_output_pipe_to_none of test_init,
tx write dpcd 0x600=2. this will let dpcd 0x170=0.
rx psr and crc check for rx internal logic are disabled.
with disallow_edp_enter_psr, when set test patterns
are committed by igt_display_commit_atomic, kernel
driver will turn on edp with dpcd 0x170=0. then tx
read rx crc successfully.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_ilr.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index b2c0f294d..1f048d665 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -205,11 +205,32 @@ static void test_flow(data_t *data, enum sub_test option)
 			continue;
 		}
 
+		/* igt_amd_output_has_ilr_setting check if debugfs exist,
+		 * but ilr settings could be all 0s -- not supported.
+		 * need check if ilr settings values are supported.
+		 */
+		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
+		if (data->supported_ilr[0] == 0)
+			continue;
+
 		igt_info("Testing on output: %s\n", output->name);
 
 		/* Init only if display supports ilr link settings */
 		test_init(data, output);
 
+		/* with set_all_output_pipe_to_none within test_init,
+		 * kernel driver tx write dpcd 0x600=2 to rx. edp rx
+		 * exit psr state and stop verify crc from main link.
+		 * with disabllow edp enter psr within kernel, when run
+		 * set test pattern, display is turned on. kernel driver
+		 * tx will not notify rx psr enable and crc checking by
+		 * rx. by this, when tx want to read crc from rx, rx will
+		 * check crc and response right away. timeout will not
+		 * happens.
+		 */
+		if (option == ILR_POLICY)
+			igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
+
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -243,6 +264,10 @@ static void test_flow(data_t *data, enum sub_test option)
 		igt_remove_fb(data->drm_fd, &data->fb);
 
 		test_fini(data);
+
+		/* restore allow kernel driver eDP PSR */
+		if (option == ILR_POLICY)
+			igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
 	}
 
 }
-- 
2.25.1
