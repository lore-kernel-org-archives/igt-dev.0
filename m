Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A97C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 15:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218B810E67A;
	Tue,  8 Jul 2025 15:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncRUMh6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EAC10E67A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751986938; x=1783522938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F4skZlQUCh4IGhD1lGcyyH3rbnr03JSOyv66On5d9I8=;
 b=ncRUMh6CkyrI/8yfzkZP4A0fJcZCtBAEw6+/ZspC6Jt9DUNY1XZH6FGu
 90srXS1rqVGrOClXgNMaAMSBi5M9DtflqpW7js1jv8kZwn9Izi0Ac2hBC
 KeSdtmVP6b4aFDyi3kuXps/S+OTzBm7yNzfV0j4NfBYOrBt7GEN2HS9Il
 lHC4duRuToxVay96HDNN3rY2XO1cVYf1o4V5YxMpmz2YAFF9/gL5+409f
 mcfzYjdSx600NewhwGfNZ5jRlI/id8eZTpUU28efnUwv+d25+EY5gsn+N
 0lLmFRXKTaCNKU766btTYMI8CkqDpRwcBdbKpTa+7mkqv4fhEsRI4Pw9B Q==;
X-CSE-ConnectionGUID: 80yvbGjyR+yfMx8dLkMXmw==
X-CSE-MsgGUID: oxFbcX7JQZiLI7NznWvkqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76778464"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="76778464"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:02:18 -0700
X-CSE-ConnectionGUID: B5Gf1CuwR3eptR6QlWUHkg==
X-CSE-MsgGUID: D8/Go6mXQiWl/5zfcqm1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="186533993"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.226])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:02:17 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH] script/test_list: fix a document generator bug
Date: Tue,  8 Jul 2025 11:02:07 -0400
Message-ID: <20250708150207.247795-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
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

Remove an extra 'f' from the print() function.

Fixes: b9c6750f935f ("scripts/test_list: Do not stop the build if documentation fails")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 scripts/test_list.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 5f1b4218b..cb2fb054c 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1427,7 +1427,7 @@ class TestList:
                     continue
 
                 file_line.rstrip(r"\n")
-                printf(f"{fname}:{file_ln + 1}: Warning: unrecognized line. Need to add field at %s?\n\t==> %s" %
+                print(f"{fname}:{file_ln + 1}: Warning: unrecognized line. Need to add field at %s?\n\t==> %s" %
                          (config_origin, file_line))
 
     def show_subtests(self, sort_field):
-- 
2.50.0

