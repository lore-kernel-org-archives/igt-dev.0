Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B267D911BC
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:36 +0530
Message-Id: <20220814180908.2553394-20-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 19/51] tests/kms_lease: Add support for Bigjoiner
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
