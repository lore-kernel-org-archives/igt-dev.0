Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B3B10FCD5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 08:59:37 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 12 Apr 2022 10:59:08 +0200
Message-Id: <2a6359e9b7cfcc7cfaa37339d3aa8a3af9788d66.1649753814.git.mchehab@kernel.org>
In-Reply-To: <cover.1649753814.git.mchehab@kernel.org>
References: <cover.1649753814.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 09/12] code_cov_parse_info: fix error handling
 when opening files
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

While on bash scripts we use "||" for error handling, perl
uses "or" instead. Yet, it doesn't warn when "||" is used.

That causes it to print a warning when the open fail while
reading filter files, instead of the original intent of
finishing and reporting an error.

Reviewed-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1649753814.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 3e1525a67d99..c8284a297b33 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -513,7 +513,7 @@ my $filter_str = "";
 my $has_filter;
 
 if ($func_filters) {
-	open IN, $func_filters || die "Can't open $func_filters";
+	open IN, $func_filters or die "Can't open $func_filters";
 	while (<IN>) {
 		s/^\s+//;
 		s/\s+$//;
@@ -524,7 +524,7 @@ if ($func_filters) {
 }
 
 if ($src_filters) {
-	open IN, $src_filters || die "Can't open $src_filters";
+	open IN, $src_filters or die "Can't open $src_filters";
 	while (<IN>) {
 		s/^\s+//;
 		s/\s+$//;
-- 
2.35.1
