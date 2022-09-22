Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBEE10EA7F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:46:24 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C10D1580DC7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:46:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1obHqf-00CcSX-7v
 for igt-dev@lists.freedesktop.org; Thu, 22 Sep 2022 10:46:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:46:17 +0200
Message-Id: <c8b925cf47178fff05354735e5138859bc501e75.1663836123.git.mchehab@kernel.org>
In-Reply-To: <cover.1663836123.git.mchehab@kernel.org>
References: <cover.1663836123.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 5/6] scripts/code_cov_parse_info: take gcc IPA
 optimizations into account
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

When -O2/-O3 is used with GCC, IPA will produce function variants
at the object code. So, for a function or macro foo(), it may
produce several actual functions at the object code, like:

	foo.isra.3
	foo.isra.4

For the purposes of code coverage, all of those are the same
function, so use a regex with "\w+", which will exclude the
.isra.<number>, considering all variants as the same function.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1663836123.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index e8bac730e88b..7f3e1f9ef116 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -136,7 +136,9 @@ sub parse_info_data($)
 		# Function coverage
 
 		# FN:<line number of function start>,<function name>
-		if (m/^FN:(-?\d+),(.*)/) {
+		# Note: /w+ intentionally removes IPA gcc-optimization names, as
+		# this is more related to branch coverage
+		if (m/^FN:(-?\d+),(\w+)/) {
 			my $ln = $1;
 
 			$func = $2;
@@ -156,7 +158,9 @@ sub parse_info_data($)
 
 		# Parse functions that were actually used
 		# FNDA:<execution count>,<function name>
-		if (m/^FNDA:(-?\d+),(.*)/) {
+		# Note: /w+ intentionally removes IPA gcc-optimization names, as
+		# this is more related to branch coverage
+		if (m/^FNDA:(-?\d+),(\w+)/) {
 			my $count = $1;
 
 			# Negative gcov results are possible, as reported at:
-- 
2.37.2
