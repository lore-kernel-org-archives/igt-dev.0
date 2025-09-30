Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7607CCA471
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A00C10E562;
	Tue, 30 Sep 2025 10:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot0CB7Q7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE89510E560
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228950; x=1790764950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WawbjLCClKj81qFGqTSvxtnljVMdahgRARnkl1rvSm4=;
 b=Ot0CB7Q7vK6yJNdZWmoWEmHWB+lWKIBm7fLCFQM561EWFNC8acm60PvP
 bBkRrYmD5LNrwr4Lc+CO8I9OJUILkSiP9NM4dmCWtgxfQARyAy524BCmi
 E5pbj/TKXsDPt4j9NyNPytm2Wi1csw8J+M0R//tJL+ItlgsATnHG8Unzk
 zj14d6KouyZNCoeXCglp7aEd6qWExbr8J4RQs/dbyoa6W0nc8XctCtqeF
 IsqLOraT9oKqDs+s9Uq7iuM+yOx0ZiRChCIHSknKe9JD4dTyVvzmlEviQ
 YyoJRqkOQ0Ib0CM2N4nh0a+bh8nDNAUTc2DRibQ0Y/QbIJWtdXtynQgrs Q==;
X-CSE-ConnectionGUID: 0EXX4WovRdWg81vi0WRsyA==
X-CSE-MsgGUID: VM59b0ZGQpGombeoSglgKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61371480"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61371480"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:27 -0700
X-CSE-ConnectionGUID: SVSGB2K7Q3KStyi/vGA2Sw==
X-CSE-MsgGUID: USJGXrOWRiuCl2IfltQSWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178446586"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:25 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v8 i-g-t 3/9] tests/xe_eudebug_online: Allow dead client in
 set-breakpoint-sigint-debugger
Date: Tue, 30 Sep 2025 12:42:03 +0200
Message-Id: <20250930104209.22462-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
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

There is a chance that the client will become dead during
set-breakpoint-sigint-debugger test - avoid tripping over the assert by
allowing this situation during this test.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Acked-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 535f00818..aa58e5f99 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1569,6 +1569,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 
 		data = online_debug_data_create(hwe);
 		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+		s->client->allow_dead_client = true;
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 						open_trigger);
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
-- 
2.34.1

