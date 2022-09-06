Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3749B10E622
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 09:53:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:19:57 +0530
Message-Id: <20220906095030.486152-20-bhanuprakash.modem@intel.com>
In-Reply-To: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
References: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 19/52] tests/kms_lease: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_lease.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 0bf102a6..512d2fc3 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -823,6 +823,12 @@ static void run_test(data_t *data, void (*testfunc)(data_t *))
 			 kmstest_pipe_name(p),
 			 igt_output_name(output));
 
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, p);
+		if (!igt_test_constraint(display))
+			continue;
+
 		data->pipe = p;
 		data->crtc_id = pipe_to_crtc_id(display, p);
 		data->connector_id = output->id;
-- 
2.35.1
