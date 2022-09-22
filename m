Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802DF10E419
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:46:24 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B7B52580D87
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:46:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1obHqf-00CcSO-6Q
 for igt-dev@lists.freedesktop.org; Thu, 22 Sep 2022 10:46:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:46:14 +0200
Message-Id: <8226cb9abc99f4f813ef4b2ebe5cc09dafab0abe.1663836123.git.mchehab@kernel.org>
In-Reply-To: <cover.1663836123.git.mchehab@kernel.org>
References: <cover.1663836123.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/6] scripts/code_cov_parse_info: fix --only-drm
 filtering rules
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

The --only-drm filtering rules were filtering too much, ending to
exclude functions on files with "h" on their names. Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1663836123.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 78b7e2dada5e..037a07e26b1d 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -857,8 +857,8 @@ if ($only_i915) {
 
 if ($only_drm) {
 	# Please keep in sync with the documentation
-	push @src_exclude_regexes, "trace.*\.h";
-	push @src_exclude_regexes, "drm.*\.h";
+	push @src_exclude_regexes, "trace.*\.h\$";
+	push @src_exclude_regexes, "^/drm/";
 }
 
 $str = open_filter_file($func_filters, \@func_regexes, \@func_exclude_regexes);
@@ -1051,7 +1051,9 @@ E. g. it will exclude *.h files that match the following regular expressions:
 
 And *.h files that don't match:
 
-	- drm
+	- /drm/
+
+(e. g. macros and other code outside DRM subsystem)
 
 =item B<--only-i915> or B<--only_i915>
 
-- 
2.37.2
