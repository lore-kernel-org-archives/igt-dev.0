Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A24FCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF0010E6C8;
	Wed,  1 Oct 2025 11:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyS7xt3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F221C10E6C8
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319716; x=1790855716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJwxJilkvsVMgj/Kv7JFzbP7DDN1KuQ6LSyfmNrdvPc=;
 b=JyS7xt3S8M8R+xqo0syAj0yqiQvJaGB+NNJotWK+JEx7BhQoiDHwb31u
 Qc3Q4WUn/eA4gwZCNvEa7MjpxYMzuzN0C29gR8w18mNMYZdcDaMfEviXg
 S/4AAp/O46ueDOQltWD1+YWNXlyfr5eRFRletgaiipKmXsIMZnGFGcHgj
 EV6KmzpydL1XZ36HiIHvg/SPDkI4GPRX5oKGSmjnXhVP1zzRKIM9yITKD
 Fezl/BtptS/5oEEaO4iWVgAslL8Buquc7vfuMiqO2RdHElbBIzTvccvBE
 8uqsuG3tQsLjX8J9WQFUvb1hlFBHeY4JO2iMMWtMzOZ99+t0vl54A7Ix9 A==;
X-CSE-ConnectionGUID: Xl1hZV8eQ929Mn+0DUoo5w==
X-CSE-MsgGUID: 45T4PvBMRtiwKFSum4e/rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014981"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014981"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:16 -0700
X-CSE-ConnectionGUID: cdpb6n5QQLC1ZSZMs6JDyw==
X-CSE-MsgGUID: RSz4vGMARk6nSwNx4t32qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496237"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:15 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 05/10] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
Date: Wed,  1 Oct 2025 13:54:42 +0200
Message-Id: <20251001115447.11843-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
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

Use xe_eudebug_debugger_kill instead of pthread_kill to allow proper
handling of signals inside debugger thread.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index aa58e5f99..30e661b13 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1600,7 +1600,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		else if (event_count > 0 && event_count < events_max)
 			sigints_during_test++;
 
-		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
+		xe_eudebug_debugger_kill(s->debugger, SIGINT);
 		close(s->debugger->fd);
 
 		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-- 
2.34.1

