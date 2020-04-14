Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874DE89CD4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 08:15:13 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 14 Apr 2020 11:14:46 +0300
Message-ID: <20200414081447.1451675-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20200414081447.1451675-1-arkadiusz.hiler@intel.com>
References: <20200414081447.1451675-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_chamelium: Issue disabling
 modeset when resetting state
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Each tests resets the state to be sure it starts with a clean slate.
Let's add disabling modeset to the pile, to be sure that we get the
hotplug events and the connector state is correct.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_chamelium.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index b7207ef9..63ae077d 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -273,7 +273,14 @@ check_analog_bridge(data_t *data, struct chamelium_port *port)
 static void
 reset_state(data_t *data, struct chamelium_port *port)
 {
-	int p;
+	int p, i;
+
+	for (i = 0; i < data->display.n_outputs; i++) {
+		igt_output_t *output = &data->display.outputs[i];
+		igt_output_set_pipe(output, PIPE_NONE);
+	}
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	chamelium_reset(data->chamelium);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
