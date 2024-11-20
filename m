Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BA3D711D7
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 18:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07FF10E2D8;
	Wed, 20 Nov 2024 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OffZEg5l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5B10E2D8
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732127551; x=1763663551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NfMJlrvtuJJQHiOhej0Hu3/pD7TF9tuHvyXy2e4HrEk=;
 b=OffZEg5lGKSviR8gKVl0b7qD6wE6MYQDZMvXggDbJB1D77F0a8mj3n+G
 QDIWZAHDIBAzVr90U1J9lTE2A3ggAsffG1Qr3qMxWxxepbM8KGt8MMeXb
 cE5iP1oGLst3hUv1/azTid8fa7TqNJ9Q6+MiCc4InSqkc55apcX4T29ZV
 6yyja2ZtVvVXW9clQ7RuaOTCguSZNcO4ilHGlEaLt830IZBA2qzYtFaDS
 lOkvhmDtaM7m0BMA2HjgRUXKIQMocfNtTi4VSwC+HD/4ELiFUTi1RsrF9
 PlLuMe+Bdp+oIvqJauHoFNYhgVzFvnGVmC0QykS9+TKg7RkPAnfUr4Aqh A==;
X-CSE-ConnectionGUID: 3NDEVfYGQ4qLRpaMm+NgGw==
X-CSE-MsgGUID: Am6NZvJAQx6CVRMBJ4zBtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54705907"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="54705907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:31 -0800
X-CSE-ConnectionGUID: LnKbiX1HQYO4dYt7insq5g==
X-CSE-MsgGUID: wMPKKbxKTmuS8He+Tu5AMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="95067523"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:30 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 4/4] runner/executor: Inform about terminating
Date: Wed, 20 Nov 2024 19:32:08 +0100
Message-ID: <20241120183208.146299-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
References: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
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

Create a message before terminating a running test and
inform user what is a cause.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 5a4c2e1b2..316b81575 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1359,8 +1359,12 @@ static int monitor_output(pid_t child,
 
 				aborting = true;
 				killed = SIGQUIT;
-				if (!kill_child(killed, child))
+				if (!kill_child(killed, child)) {
+					errf("Error terminating child with %s, errno=%d\n",
+					     killed == SIGQUIT ? "SIGQUIT" : "SIGKILL", errno);
+
 					return -1;
+				}
 				time_killed = time_now;
 
 				continue;
-- 
2.47.0

