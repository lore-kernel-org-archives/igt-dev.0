Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D688312B170
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 09:45:05 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 28 Jun 2022 11:44:34 +0200
Message-Id: <20220628094435.854519-7-ryszard.knop@intel.com>
In-Reply-To: <20220628094435.854519-1-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] runner: Set requested env vars during
 execution
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

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/executor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index 9b89cc09..21c41715 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1872,6 +1872,14 @@ bool execute(struct execute_state *state,
 		return true;
 	}
 
+	if (!igt_list_empty_or_null(&settings->env_vars)) {
+		struct environment_variable *iter;
+
+		igt_list_for_each_entry(iter, &settings->env_vars, link) {
+			setenv(iter->key, iter->value, 1);
+		}
+	}
+
 	if ((resdirfd = open(settings->results_path, O_DIRECTORY | O_RDONLY)) < 0) {
 		/* Initialize state should have done this */
 		errf("Error: Failure opening results path %s\n",
-- 
2.36.1
