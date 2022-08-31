Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3302410E31A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 11:07:51 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 31 Aug 2022 13:07:27 +0200
Message-Id: <20220831110729.730006-6-ryszard.knop@intel.com>
In-Reply-To: <20220831110729.730006-1-ryszard.knop@intel.com>
References: <20220831110729.730006-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 5/7] runner: Set requested env vars
 during execution
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

v2: Removed unnecessary checks, misc cleanup (Mauro)
Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/executor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 9b89cc09..964d0063 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1860,10 +1860,10 @@ bool execute(struct execute_state *state,
 	     struct settings *settings,
 	     struct job_list *job_list)
 {
+	int resdirfd, testdirfd, unamefd, timefd, sigfd;
+	struct environment_variable *env_var;
 	struct utsname unamebuf;
-	int resdirfd, testdirfd, unamefd, timefd;
 	sigset_t sigmask;
-	int sigfd;
 	double time_spent = 0.0;
 	bool status = true;
 
@@ -1872,6 +1872,10 @@ bool execute(struct execute_state *state,
 		return true;
 	}
 
+	igt_list_for_each_entry(env_var, &settings->env_vars, link) {
+		setenv(env_var->key, env_var->value, 1);
+	}
+
 	if ((resdirfd = open(settings->results_path, O_DIRECTORY | O_RDONLY)) < 0) {
 		/* Initialize state should have done this */
 		errf("Error: Failure opening results path %s\n",
-- 
2.37.2
