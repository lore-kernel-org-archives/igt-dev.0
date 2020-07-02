Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6316E203
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2020 04:52:55 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu,  2 Jul 2020 10:23:04 +0530
Message-Id: <20200702045307.19202-7-mohammed.khajapasha@intel.com>
In-Reply-To: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
References: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/9] lib/kms: Skip igt test cases for
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
 lib/igt_kms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index acf0559e..b4029757 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2192,8 +2192,7 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe)
 {
 	igt_output_t *output;
 
-	igt_skip_on_f(pipe >= igt_display_get_n_pipes(display),
-		      "Pipe %s does not exist.\n", kmstest_pipe_name(pipe));
+	igt_require_pipe(display, pipe);
 
 	for_each_valid_output_on_pipe(display, pipe, output)
 		return;
@@ -2548,7 +2547,7 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 	igt_output_t *chosen_outputs[display->n_pipes];
 
 	igt_assert(pipe != PIPE_NONE);
-	igt_require(pipe < display->n_pipes);
+	igt_require_pipe(display, pipe);
 
 	__igt_pipe_populate_outputs(display, chosen_outputs);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
