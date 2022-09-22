Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFD110E418
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:46:24 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B9074580D96
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:46:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1obHqf-00CcSL-5w
 for igt-dev@lists.freedesktop.org; Thu, 22 Sep 2022 10:46:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:46:13 +0200
Message-Id: <96fb696ef6016434de996e1853061fc4a4fff3b7.1663836123.git.mchehab@kernel.org>
In-Reply-To: <cover.1663836123.git.mchehab@kernel.org>
References: <cover.1663836123.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/6] scripts/code_cov_parse_info: avoid warning
 messages on parsing
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

Some fields (FNH, BRH, LH) produce warning messages when they're found
at the info file.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1663836123.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 09f9aba5760b..78b7e2dada5e 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -195,7 +195,7 @@ sub parse_info_data($)
 		# FNH:<number of function hit>
 		if (m/^FNH:(-?\d+)/) {
 			my $hits = $1;
-			if ($record{$source}{$func}{fnh} < $hits) {
+			if (!defined($record{$source}{$func}{fnh}) || $record{$source}{$func}{fnh} < $hits) {
 				$record{$source}{$func}{fnh} = $hits;
 			}
 			next;
@@ -234,7 +234,7 @@ sub parse_info_data($)
 		# BRH:<number of branches hit>
 		if (m/^BRH:(-?\d+)/) {
 			my $hits = $1;
-			if ($record{$source}{$func}{brh} < $hits) {
+			if (!defined($record{$source}{$func}{brh}) || $record{$source}{$func}{brh} < $hits) {
 				$record{$source}{$func}{brh} = $hits;
 			}
 			next;
@@ -268,7 +268,7 @@ sub parse_info_data($)
 		# LH:<number of lines with a non-zero execution count>
 		if (m/^LH:(-?\d+)/) {
 			my $hits = $1;
-			if ($record{$source}{$func}{lh} < $hits) {
+			if (!defined($record{$source}{$func}{lh}) || $record{$source}{$func}{lh} < $hits) {
 				$record{$source}{$func}{lh} = $hits;
 			}
 			next;
-- 
2.37.2
