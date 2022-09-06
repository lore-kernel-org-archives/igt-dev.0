Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A844310E61B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 09:53:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:19:54 +0530
Message-Id: <20220906095030.486152-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
References: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 16/52] tests/kms_dp_tiled_display: Add support
 for Bigjoiner
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
 tests/kms_dp_tiled_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index 8f503e40..1ef815a0 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -271,6 +271,7 @@ static void setup_mode(data_t *data)
 		igt_require(found);
 		igt_output_override_mode(output, mode);
 	}
+	igt_require(igt_test_constraint(data->display));
 	igt_display_commit_atomic(data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
 				  NULL);
 }
-- 
2.35.1
