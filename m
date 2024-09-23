Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE21CF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 08:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABEE10E3A0;
	Mon, 23 Sep 2024 08:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zsp71tB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21310E3A0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727078732; x=1758614732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zqfpdsnG4/HWVyVGK4f6uoOW7c1VdAxiwpKBT7thhwA=;
 b=Zsp71tB+4uHxc6evIdFjsT+ENq3SnOO2gdp4v/uGR0ga1cK6tDZnAEwZ
 g7ZrmkJCwtZ13CCHkajzP7v6SHLpKUwaoV90Z8JDwjp+fowlTlhfsFZWf
 a7Ba9G0iQCS6lrv0mbNzUY+yVIrVj63MDaB6azjyTE28OEY90WXSb5HSG
 v1/YNmifUEoqurHyHyCWK6IkdIm353D2QSSbiNw8A53H1dIfS4Dn6iDL2
 5X2BgKzlh9wUJV4masP7kxx8OOE88KBDAbrQjSL3vh8IwGh4FHWdW23zx
 LjLF0BcokIx1C64nlH8Cjhufm93XmKOrZSp9xz/1GKRQp9uGcg+NZ8Uwt A==;
X-CSE-ConnectionGUID: zqbaVoEPSOCbffV+DDmKdg==
X-CSE-MsgGUID: GhtTyC2LQneAKmAmLy+X4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25963570"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25963570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 01:05:27 -0700
X-CSE-ConnectionGUID: dgFMpW8IT1GX7VlyujqVHw==
X-CSE-MsgGUID: +ouPhoI+StaetMc9FbE/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71133991"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 01:05:25 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t] scripts/test_list: Drop logging out list of not
 compiled tests
Date: Mon, 23 Sep 2024 10:05:20 +0200
Message-Id: <20240923080520.39559-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Logging out of not compiled tests looks like warning what is confusing.
Get rid of this printing to keep building steps clear.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 scripts/test_list.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 40b6b7829b..867d284003 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1196,8 +1196,6 @@ class TestList:
         run_subtests = set(self.get_testlist())
 
         not_compiled = set(self.get_not_compiled())
-        for test_basename in not_compiled:
-            print(f"INFO: Found documentation for '{test_basename}' but no binary")
 
         # Compare sets
 
-- 
2.34.1

