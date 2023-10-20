Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75E210E59E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 10:21:51 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 64AAB580E33
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 03:21:50 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtmdY-000Vc0-0J
 for igt-dev@lists.freedesktop.org; Fri, 20 Oct 2023 12:21:48 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 12:20:32 +0200
Message-ID: <20231020102146.121478-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
References: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] igt_runner: don't require root for
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
