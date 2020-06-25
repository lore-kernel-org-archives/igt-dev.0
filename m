Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280BB6E25F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 06:24:42 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 25 Jun 2020 11:53:16 +0530
Message-Id: <20200625062318.26368-6-mohammed.khajapasha@intel.com>
In-Reply-To: <20200625062318.26368-1-mohammed.khajapasha@intel.com>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
 <20200625062318.26368-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 5/7] lib/kms: Skip igt test cases for
 disabled display pipes
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Skip igt test cases for disabled pipes.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b20c7e8..f2909ca5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2166,8 +2166,9 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe)
 {
 	igt_output_t *output;
 
-	igt_skip_on_f(pipe >= igt_display_get_n_pipes(display),
-		      "Pipe %s does not exist.\n", kmstest_pipe_name(pipe));
+	igt_skip_on_f(((pipe >= igt_display_get_n_pipes(display)) ||
+				!(display->pipes[pipe].enabled)),
+			"Pipe %s does not exist or not enabled.\n", kmstest_pipe_name(pipe));
 
 	for_each_valid_output_on_pipe(display, pipe, output)
 		return;
@@ -2522,7 +2523,8 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 	igt_output_t *chosen_outputs[display->n_pipes];
 
 	igt_assert(pipe != PIPE_NONE);
-	igt_require(pipe < display->n_pipes);
+	igt_require((pipe < display->n_pipes) &&
+			display->pipes[pipe].enabled);
 
 	__igt_pipe_populate_outputs(display, chosen_outputs);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
