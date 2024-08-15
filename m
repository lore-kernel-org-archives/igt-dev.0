Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937D0C52D7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 19:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501B610E521;
	Thu, 15 Aug 2024 19:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSjcpAud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5579110E522
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723749406; x=1755285406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ydpLL5jgB0oOLWcXnaHNyZdzCWKEmmaS7TghlIvpQI8=;
 b=bSjcpAudtxLk+k/83hmz2vOSCqnMqaLN22cHHU7amE32V5i6rY1yAPwe
 eLGQ9ybFwThCnl+ITTETlcDgOX0Fl4Rq28BEpJ8dQibyVJDQB6aYppZuW
 FKBdFYxwe+2hwMlYOVeXzbxRwTaZNWtBdhXqjfbGdrk5c0PXiKONsozlj
 Xta5hqB9L6dlPZPuBOiFmeSpVMCHMpDL4PdGJwswU2XwS+KGp+reySD4u
 HrbRJPEmmeuI4syTkHHs0n1cXpbpwuGNXkA3HnpNUAWM5ukQ5RjcFsOxR
 GM7wGP6N/GkGsu2HlqbLmsDBNyO/s8uhLFUlZIaOAwUMBxVv0ZtcsWmTk A==;
X-CSE-ConnectionGUID: kW5fEz0gT0G/77qwF7CgbQ==
X-CSE-MsgGUID: jercurqAQTuYw5kuYV+2tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24928097"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="24928097"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:16:46 -0700
X-CSE-ConnectionGUID: oNogc3cWTMqN9WhabROKqQ==
X-CSE-MsgGUID: CEGJTGtEQ5y1PpKiZsV5iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="82644363"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.233])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:16:44 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] tools/dpcd_reg: Advertise the dump command in usage text
Date: Thu, 15 Aug 2024 16:16:00 -0300
Message-ID: <20240815191626.49244-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.0
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

When no command is passed, the default operation for dpcd_reg is to dump
DPCD data. However, passing "dump" explicitly is also supported.

Improve the help message to let the user know about the "dump" command
and that it is the default operation.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tools/dpcd_reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/dpcd_reg.c b/tools/dpcd_reg.c
index 2761168d0030..7d497e36a46b 100644
--- a/tools/dpcd_reg.c
+++ b/tools/dpcd_reg.c
@@ -89,6 +89,7 @@ static void print_usage(void)
 {
 	printf("Usage: dpcd_reg [OPTION ...] COMMAND\n\n");
 	printf("COMMAND is one of:\n");
+	printf("  dump:		Dump dpcd data (default command)\n");
 	printf("  read:		Read [count] bytes dpcd reg at an offset\n");
 	printf("  write:	Write a dpcd reg at an offset\n\n");
 	printf("Options for the above COMMANDS are\n");
-- 
2.46.0

