Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F4D10F1AD
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 06:27:02 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Mon,  4 Apr 2022 08:26:39 +0200
Message-Id: <20220404062642.378928-10-mauro.chehab@linux.intel.com>
In-Reply-To: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 09/12] code_cov_parse_info: fix error handling
 when opening files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
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
