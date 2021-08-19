Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B836E99D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 15:22:25 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 19 Aug 2021 18:25:06 +0300
Message-Id: <20210819152507.25912-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] kms_ccs: Require a connected output
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, Matthew Auld <matthew.auld@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Check that the output exists before dereferencing, as it may be NULL if
there are no displays connected.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/3678
---
 tests/kms_ccs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index e60a6a77..238c245c 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -513,6 +513,7 @@ static void test_output(data_t *data, const char* testformatstring)
 	igt_fixture {
 		data->output = igt_get_single_output_for_pipe(&data->display,
 							      data->pipe);
+		igt_require(data->output);
 		igt_output_set_pipe(data->output, data->pipe);
 	}
 
@@ -611,6 +612,7 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 		igt_require_pipe_crc(data.drm_fd);
 
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 
 		if (!data.user_seed)
 			data.seed = time(NULL);
-- 
2.29.2
