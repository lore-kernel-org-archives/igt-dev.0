Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E91A10E2FD
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:20 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8BA7D5805CB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba16-2E
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:05:59 +0100
Message-Id: <20230117140607.2759816-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/12] code_cov_parse_info: better handle
 include regexes
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

When there are both exclude and include regexes, the include ones
may be overriding the more generic excluded ones. So, handle them
first.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 38 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index ef44229983b6..3a503423861d 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -34,17 +34,24 @@ sub is_function_excluded($)
 
 	my $func = shift;
 
+	# Handle includes first, as, when there are both include and exclude
+	# includes should take preference, as they can be overriding exclude
+	# rules
+	foreach my $r (@func_include_regexes) {
+	    return 0 if ($func =~ m/$r/);
+	}
+
 	foreach my $r (@func_exclude_regexes) {
 		return 1 if ($func =~ m/$r/);
 	}
 
-	return 0 if (!@func_include_regexes);
-
-	foreach my $r (@func_include_regexes) {
-		return 0 if ($func =~ m/$r/);
+	# If there are no exclude regexes, only include functions that are
+	# explicitly included.
+	if ($#func_exclude_regexes == 0) {
+		return 1;
 	}
 
-	return 1;
+	return 0;
 }
 
 sub is_file_excluded($)
@@ -1193,9 +1200,10 @@ Each line at B<[filter's file]> may contain a new regex:
 
 =back
 
-When both include and exclude regexes are found, exclude regexes are
-applied first and any functions that don't match the include regular
-expressions from the B<[filter's file]> will be ignored.
+Include regexes are handled first, as they can override an exclude regex.
+
+When just include regexes are used, any functions that don't match the
+include regular expressions from the B<[filter's file]> will be ignored.
 
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
@@ -1204,7 +1212,8 @@ automaticaly enabled, as the final goal is to report per-function usage.
 
 Include B<regex> to the function filter. Can be used multiple times.
 
-When used together with B<--func-filters>, regexes here are handled first.
+When used together with B<--func-filters> or B<--exclude-func>, regexes
+here are handled first.
 
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
@@ -1213,8 +1222,6 @@ automaticaly enabled, as the final goal is to report per-function usage.
 
 Include B<regex> to the function filter. Can be used multiple times.
 
-When used together with B<--func-filters>, regexes here are handled first.
-
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
 
@@ -1244,22 +1251,19 @@ Each line at B<[filter's file]> may contain a new regex:
 
 =back
 
-When both include and exclude regexes are found, exclude regexes are
-applied first and any functions that don't match the include regular
-expressions from the B<[filter's file]> will be ignored.
+Include regexes are handled first, as they can override an exclude regex.
 
 =item B<--include-src> B<regex>
 
 Include B<regex> to the sources filter. Can be used multiple times.
 
-When used together with B<--src-filters>, regexes here are handled first.
+When used together with B<--src-filters> and B<--exclude-src>, regexes
+here are handled first.
 
 =item B<--exclude-src> B<regex>
 
 Include B<regex> to the sources filter. Can be used multiple times.
 
-When used together with B<--src-filters>, regexes here are handled first.
-
 =item B<--ignore-unused> or B<--ignore_unused>
 
 Filters out unused C files and headers from the code coverage results.
-- 
2.39.0
