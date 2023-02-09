Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E1410E917
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 06:28:21 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  9 Feb 2023 11:53:22 +0530
Message-Id: <20230209062322.1562797-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230209062322.1562797-1-bhanuprakash.modem@intel.com>
References: <20230209062322.1562797-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests/kms_atomic_transition: Test cleanup
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

As we are using same function for cleanup, no need to do other
stuff, just return after unsetting the output to pipe.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index e1b74ac2c..6179232b5 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -714,6 +714,9 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 	for (i = 0; i < data->display.n_outputs; i++)
 		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
+	if (fb == NULL && !mask)
+		return event_mask;
+
 	for_each_pipe(&data->display, pipe) {
 		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
 			DRM_PLANE_TYPE_PRIMARY);
-- 
2.39.0
