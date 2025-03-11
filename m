Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04F0C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 13:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6862F10E5B4;
	Tue, 11 Mar 2025 13:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVmKv5n6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442710E252
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701356; x=1773237356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kpb+ZXWtgiU/J7J5ZuaYVlII3ubBX5tlek774PbIr5Q=;
 b=VVmKv5n6pNeiN1NdCDEISYiIRI1Uh1O+Xw2BH8LONijyYxfm3bOoJYYx
 icWjDVhzgUvjTZYYpV4PPLtqN7JXJiYLy522qNv2ZvRtynyrK1meqZqGm
 ZJQI7Cdu+mpq5E7xNGlRAqt/SNAqI3CfgHpeh82SceOok1/MbDAJqFoPm
 ssqgV2VhdVcc/CEcXMnXj6TBwuIkD/arWhOQH3QqIYz1SHnoWJYoRlkgu
 yGXzziAj4WYUpTHi441PBfo6Ya6BzyvYB3yp3vOUMLwKke3s1GyUOFB8L
 Pqbnyo3YSJJMfrf0s17pS86HgVtAsjL5ztb302CODfau/wQEVL3uFjs6s g==;
X-CSE-ConnectionGUID: eRwDQ4ryTLmG3LsYqURNlQ==
X-CSE-MsgGUID: 7Capei71TCuWYnNq4AWtJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42616261"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42616261"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:56 -0700
X-CSE-ConnectionGUID: 2Vfw6FqkQJmzE4FHSlfKmw==
X-CSE-MsgGUID: Q+vI6wiGQK2giOaCsObmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151131528"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.177])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:55 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 2/3] lib/eudebug: Fix xe_eudebug_client_stop corner
 case
Date: Tue, 11 Mar 2025 14:55:28 +0100
Message-Id: <20250311135529.5425-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
References: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
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

After `token_signal(c->p_in, CLIENT_STOP, c->pid)`, the client is
expected to end its work and exit. By the time the waitpid() is called,
the client process may be gone already, resulting in a failed assert.

Fix it by skipping the assert in case of errno being ECHILD, meaning
the process already exited.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 558882914..b17efa2d0 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1450,12 +1450,16 @@ void xe_eudebug_client_stop(struct xe_eudebug_client *c)
 {
 	if (c->pid) {
 		int waitstatus;
+		int ret;
 
 		xe_eudebug_client_wait_done(c);
 
 		token_signal(c->p_in, CLIENT_STOP, c->pid);
-		igt_assert_eq(waitpid(c->pid, &waitstatus, 0),
-			      c->pid);
+		ret = waitpid(c->pid, &waitstatus, 0);
+		/* process may be gone already */
+		if (!(ret == -1 && errno == ECHILD))
+			igt_assert_eq(ret, c->pid);
+
 		c->pid = 0;
 	}
 }
-- 
2.34.1

