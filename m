Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165810E599
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 10:21:51 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 64A90580DD0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 03:21:50 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtmdY-000Vc3-0M
 for igt-dev@lists.freedesktop.org; Fri, 20 Oct 2023 12:21:48 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 12:20:33 +0200
Message-ID: <20231020102146.121478-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
References: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] igt_runner: output planned job_list
 tasks in dry-run mode
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

If igt_runner is executed in dry-run mode, show what jobs
were planned to be executed. That helps debugging issues at
the runner job plan logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/executor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index d3e6296dd6d8..3b9e39f4001b 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -2287,6 +2287,12 @@ bool execute(struct execute_state *state,
 	bool status = true;
 
 	if (state->dry) {
+		for (; state->next < job_list->size; state->next++) {
+			char *job_name;
+
+			job_name = entry_display_name(&job_list->entries[state->next]);
+			outf("dry-run: %s\n", job_name);
+		}
 		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
 		return true;
 	}
-- 
2.41.0
