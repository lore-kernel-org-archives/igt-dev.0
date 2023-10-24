Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFB310E3C8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 14:19:03 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 81D04580E30
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 07:19:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qvIFG-000fqw-0E
 for igt-dev@lists.freedesktop.org; Tue, 24 Oct 2023 16:18:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Oct 2023 16:11:09 +0200
Message-ID: <20231024141855.160633-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
References: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] runner/job_list: use case-insensitive
 regular expressions
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

There are some KMS tests that are case-sensitive. Eventually,
those could be blocklisted with a different case, causing troubles
for CI runs.

As it makes no sense to have the same test name with different
cases, handle regular expressions in a case-insensitive way.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/settings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 788957948b4f..42d8137f18e9 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -323,7 +323,7 @@ static bool add_regex(struct regex_list *list, char *new)
 	GRegex *regex;
 	GError *error = NULL;
 
-	regex = g_regex_new(new, G_REGEX_OPTIMIZE, 0, &error);
+	regex = g_regex_new(new, G_REGEX_CASELESS | G_REGEX_OPTIMIZE, 0, &error);
 	if (error) {
 		usage(stderr, "Invalid regex '%s': %s", new, error->message);
 		g_error_free(error);
-- 
2.41.0
