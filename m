Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7FDD711D8
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 18:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B9B10E115;
	Wed, 20 Nov 2024 18:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HR8lUwN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01AB10E7A3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732127547; x=1763663547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DGaTh6yXSRXoF9KaItQGrT4ngJ1oiZdU0yMw+vvuUR0=;
 b=HR8lUwN3PJcYI3sBeMqjiAXwxUsj0fhWLMIHgD8RKBXoHYq2uZqa9E6q
 7rm3KhdiL+4TyVdaKgZyyjcX09KOagx0N3efgvciYeu6EYiraoFcmfyme
 i5Eb2zdMUuV77P5zrHx1azKz+bNpDZaZfe+QGLBPffdGjEZpmWgAYUrGy
 9+VM24LKHg17Y0ro4MSx6OvX2SwqMQ9tVoRbfCzG7P+foBIiDlxTFh3rq
 zNetsEO4VjfD4N7BqePPwhKcwhh4fncG1DUUBSw3hjGX3sFsSU2wr4o35
 yU3GGyUMkPFJmek09TRmWDPvMTF7sduF0lJJEL+qIUDRapA2ZlRXODYQs Q==;
X-CSE-ConnectionGUID: xSbl61BeTymz0FFfTI2d7w==
X-CSE-MsgGUID: A+NTWwN5SBmt4dS6e8E67Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54705900"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="54705900"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:27 -0800
X-CSE-ConnectionGUID: EszBg9phSHK18LoOt493Sw==
X-CSE-MsgGUID: cr0WBHcgQOK9daupegJLYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="95067486"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:26 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 3/4] runner/executor: Fix error handling at
 terminating test
Date: Wed, 20 Nov 2024 19:32:07 +0100
Message-ID: <20241120183208.146299-4-kamil.konieczny@linux.intel.com>
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

Instead of just returning and leaking memory and file descriptors
inform user about an error which occurred and terminate
gracefully.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index a5b5c0eab..5a4c2e1b2 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1533,8 +1533,12 @@ static int monitor_output(pid_t child,
 			}
 
 			killed = next_kill_signal(killed);
-			if (!kill_child(killed, child))
-				return -1;
+			if (!kill_child(killed, child)) {
+				errf("Error at terminating test with %s, errno=%d\n",
+				     killed == SIGQUIT ? "SIGQUIT" : "SIGKILL", errno);
+				killed = -1;
+				break; /* while */
+			}
 			time_killed = time_now;
 		}
 	}
-- 
2.47.0

