Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60399C27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 08:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877510E35E;
	Mon, 10 Jun 2024 08:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+CRSONB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B7B10E0BE
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718003514; x=1749539514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vmSeDaI4NxiVeoDSvaSAOLsIsP7m4T1Nvdjgkb2M+l4=;
 b=D+CRSONBouSbPIPVQNp7+kENgZqmQTaPQhH2dSnMQJeloyHD3amWxyq0
 sufD+AL34XrArwHMHe5iVJ6ZuJu2jDNyXSaGf0ryPB0JuQcM7xrdoUTOY
 QBvY6q43j1RjfvRg5EC9zLqKficrzVKsTtCGf26LutxY9Md1O70KFE6CT
 h3Zp8k8eOcVYZNJPUpweaaJELigQt9i1aUif11QrtJALe5h09yfm12/gX
 YTRQ9XagdjCxef3fTeuZv2aoL+0KZhZtzZ2mbn7VUA54UwOZNpRxVBpqG
 5TaUZLUtM2v4YJ2dcQuvzvEivbf5FmpOBJS9cpe9GU7XvCcezOQEvRJ8I w==;
X-CSE-ConnectionGUID: 1ZFCLFaZQTq0/PZtgH9HaQ==
X-CSE-MsgGUID: 2Fs5IC9ATIGAQkRfdggbmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14882304"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14882304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 00:11:53 -0700
X-CSE-ConnectionGUID: uUzwMD0pQKWwtIp93h+P6g==
X-CSE-MsgGUID: FXwaoDccQAKzHA3A4XuPRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="62137313"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 00:11:52 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v2 i-g-t] tests/intel/xe_create: Don't assert on presi
 execution
Date: Mon, 10 Jun 2024 12:43:20 +0530
Message-Id: <20240610071320.1752770-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jun 2024 08:23:18 +0000
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

create_execqueues subtest is testing the time required for creating
execqueues along with testing the functionality.
Presi environments are not for testing performance. We can't use the
same time limit set for silicon on presi environments as presi would be
slow.
Therefore the time limit check is skipped while executing on simulation.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 tests/intel/xe_create.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d41557c85..76ffdcef2 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -238,9 +238,14 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
 	}
 
 	seconds = igt_seconds_elapsed(&tv);
-	igt_assert_f(seconds < real_timeout,
-		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
-		     MAXEXECQUEUES, seconds, real_timeout);
+	if (seconds > real_timeout) {
+		if (igt_run_in_simulation())
+			igt_info("Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
+				 MAXEXECQUEUES, seconds, real_timeout);
+		else
+			igt_assert_f(false, "Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
+				     MAXEXECQUEUES, seconds, real_timeout);
+	}
 }
 
 /**
-- 
2.25.1

