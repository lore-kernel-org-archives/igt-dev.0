Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6B010E660
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 09:04:49 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu,  1 Sep 2022 11:04:31 +0200
Message-Id: <20220901090431.110527-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: Don't free uninitialized pointers
 in add_env_var
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

If we goto error before assigning env_kv, it's left uninitialized, which
we later attempt to free(). Initialize both variables to NULL.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/settings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 23aa8296..e8e1f50e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -440,7 +440,7 @@ static char *string_trim_and_duplicate(const char *string) {
  * an empty variable for the runner process, then providing just the "KEY".
  */
 static bool add_env_var(struct igt_list_head *env_vars, const char *key_value) {
-	char *env_kv, *value_str;
+	char *env_kv = NULL, *value_str = NULL;
 	struct environment_variable *var = NULL;
 
 	if (env_vars == NULL || key_value == NULL || strlen(key_value) == 0)
-- 
2.37.3
