Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B14AC5DF71
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 07:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72581138A0;
	Tue,  2 Jun 2026 07:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J90jP+WA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0F811389F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780385545; x=1811921545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2tZkVbW1MvwShw1pnpe8YjwGigy0SPQRRXDpbqPqBjs=;
 b=J90jP+WArqOhI9OymFpIHvDl37Zp94dlYoi6Dc/WF0qUOB7rIiPA/DUi
 FZwEM3qB71LCo6/Js19JB1Tpa1svjrBl6MVjysw9SLjSFq1Zh8zGbsjqR
 RsqmNMLSNpoly5fryue8qt8l6zEgoo4HGn2qfTsjupX9JMFP5VBW6QbBO
 MgZ2lPyLbkvMxIznKjN2PVmUwesKuUj1PrLiVQ0Mi/2eJAwyhnv2i5G82
 vNH6GdEWdUAlBpRPs0pR3ETYOxeJ1fu2F8UDuIkZrHmzxDcikndqkfpeU
 jM3RhKt0soemK+oH04G1Tdeke2fbCS7sVOZG1lm6ORdg+1wMPNr7NX4Sa Q==;
X-CSE-ConnectionGUID: uGAmYpBITLqqr3Q4YNYGHw==
X-CSE-MsgGUID: 9wgUweOxSLih3p9PjSb1Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="85020693"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="85020693"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 00:32:24 -0700
X-CSE-ConnectionGUID: p5uw2R7YRpCXgsepYDiLYQ==
X-CSE-MsgGUID: GT5EDqm4STCjDGJ6OUKCiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="267472910"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.207])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 00:32:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t] runner: Avoid compilation failure on c17 and earlier
Date: Tue,  2 Jun 2026 09:32:21 +0200
Message-ID: <20260602073220.1067144-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
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

Older compilers don't allow to define variables within switch/goto.
Move these definition to avoid compilation break.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
 runner/resultgen.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index a1938b3f65..b6d977f72a 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1163,6 +1163,9 @@ static int ftw_attachments_list(const char *fpath, const struct stat *sb,
 				int typeflag, struct FTW *ftwbuf)
 {
 	struct json_t *obj = NULL, *attobj = NULL;
+	const char *attdirkey = "attachments-dir";
+	char *p, *currpath = (char *) fpath + 2;
+	char currdir[PATH_MAX];
 
 	(void)sb;
 	(void)ftwbuf;
@@ -1181,10 +1184,6 @@ static int ftw_attachments_list(const char *fpath, const struct stat *sb,
 	 * Instead of duplicating string we temporarily overwrite '/' with '\0'.
 	 */
 	case FTW_F:
-		const char *attdirkey = "attachments-dir";
-		char *p, *currpath = (char *) fpath + 2;
-		char currdir[PATH_MAX];
-
 		p = strstr(currpath, "/");
 		if (!p)
 			return -1;
-- 
2.54.0

