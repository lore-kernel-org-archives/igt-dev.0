Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50710E3CC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 14:19:03 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 831CD580E36
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 07:19:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qvIFG-000fqq-08
 for igt-dev@lists.freedesktop.org; Tue, 24 Oct 2023 16:18:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Oct 2023 16:11:07 +0200
Message-ID: <20231024141855.160633-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
References: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] igt_runner: don't require root for
 dry_run
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

When --dry-run option is used, there's no need to require root,
as no tests will actually be executed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/settings.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/settings.c b/runner/settings.c
index 23aa82963344..788957948b4f 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -687,6 +687,7 @@ bool parse_options(int argc, char **argv,
 			break;
 		case OPT_DRY_RUN:
 			settings->dry_run = true;
+			settings->allow_non_root = true;
 			break;
 		case OPT_ALLOW_NON_ROOT:
 			settings->allow_non_root = true;
-- 
2.41.0
