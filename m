Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D642EC35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 11:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6210E027;
	Fri, 21 Mar 2025 11:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7YEKXKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664610E027
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742558093; x=1774094093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U2w13GHpRjerxSTdH3C8itaCvV15PkVWXhiVLxhW2tY=;
 b=I7YEKXKXzdSwWL7FyjXbfXtL3sHlPA+i1IkivVnNnXr4jiMUv5CgpP/M
 49+p6RJEsbCQdfMXbL0RX94Zt0d4xVyqkCl9LBfXYkWzjxbhXD45vYufb
 QYrc5HGxBr2+YqKnjqtiRg8nfKmk/RLc3OntZx6yRiPYhGK/+UHyI/XJv
 eEEe+vKX2r9NlUZLmu32B+oN2bVki3WepQTYBnYP8SmdplikGdegpYsQx
 nbDXb6kbXMZoqhdnvmKlddfZgw4YI3CZtgcXSNYw1TwipVCFYmaGqIbsn
 NGmlUIAu1a+yn6tnvL0KRCcogCawKMihCyi5xay7Uq9jU5ojFsDts72Fl A==;
X-CSE-ConnectionGUID: Tsd/6WsgSQigZwqZ4Fl7BQ==
X-CSE-MsgGUID: XXqFis2EQ5WwLyKY5zuiCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69173443"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="69173443"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:54:53 -0700
X-CSE-ConnectionGUID: vrtKWLuVQ1qfB25zhRygMQ==
X-CSE-MsgGUID: dBHzV6e+R4CBasglnsZjFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128062710"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:54:51 -0700
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 1/1] lib/igt_core: capture logs for child processes
Date: Fri, 21 Mar 2025 12:54:33 +0100
Message-Id: <20250321115433.736043-2-pawel.sikora@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321115433.736043-1-pawel.sikora@linux.intel.com>
References: <20250321115433.736043-1-pawel.sikora@linux.intel.com>
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

This change addresses the issue of missing logs for child
processes in the IGT runner.

The '_igt_log_buffer_dump()' function is now called before
exiting child processes, ensuring that logs are properly
captured and not lost when IGT fails and child processes
dump logs before exiting.

v2: Make the dump conditional based on active comms (Kamil)

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
---
 lib/igt_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index c19689a51..512d88437 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -296,6 +296,7 @@ static bool in_fixture = false;
 static bool test_with_subtests = false;
 static bool in_atexit_handler = false;
 static bool show_ftrace = false;
+static bool has_comms = false;
 static enum {
 	CONT = 0, SKIP, FAIL
 } skip_subtests_henceforth = CONT;
@@ -1905,11 +1906,17 @@ void igt_fail(int exitcode)
 		failed_one = true;
 	}
 
-	/* Silent exit, parent will do the yelling. */
+	/* If igt_runner uses comms, it could grab each child's logs without
+	 * them interleaving in stdout/stderr. */
+	has_comms = runner_connected();
+	if (has_comms)
+		_igt_log_buffer_dump();
+
 	if (test_child)
 		exit(exitcode);
 
-	_igt_log_buffer_dump();
+	if (!has_comms)
+		_igt_log_buffer_dump();
 
 	if (test_multi_fork_child)
 		exit(exitcode);
-- 
2.34.1

