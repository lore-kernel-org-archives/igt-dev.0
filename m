Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05C10EA84
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:46:24 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BC889580DBD
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:46:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1obHqf-00CcSR-6v
 for igt-dev@lists.freedesktop.org; Thu, 22 Sep 2022 10:46:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:46:15 +0200
Message-Id: <91b7e3cfe277383f8ad01977a7bb0616400471f7.1663836123.git.mchehab@kernel.org>
In-Reply-To: <cover.1663836123.git.mchehab@kernel.org>
References: <cover.1663836123.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/6] scripts/code_cov_parse_info: fix brf record
 handling
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

Don't override $record{source} due to BRF, or the script will crash.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1663836123.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 037a07e26b1d..ef26192f2456 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -228,7 +228,7 @@ sub parse_info_data($)
 
 		# BRF:<number of branches found>
 		if (m/^BRF:(-?\d+)/) {
-			$record{$source}{brf} = $1;
+			$record{$source}{$func}{brf} = $1;
 			next;
 		}
 		# BRH:<number of branches hit>
-- 
2.37.2
