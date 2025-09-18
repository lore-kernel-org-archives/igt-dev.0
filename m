Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789A4CAC5A0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DC810E757;
	Thu, 18 Sep 2025 12:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAq4hq9Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F0310E757
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758198857; x=1789734857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gn33ICto5n+JJ3+/oZ3wiOP2n1Kee/7IOcysFXe0bPo=;
 b=NAq4hq9QwP2ybsHuozd/Kg8eKIMA2w9EInuA7vXixBnyfKo43mt2nfw2
 +dCKdhLT0XVw7YxqmPasZG3LqRwtJ9Ria4nyXwtRrTFusj0PrGujnNjam
 DOgX+P9eXGutCgea/EkwzPX5CdqnooWICzilOinkIPh4kvfj6iZqbKNY+
 RtBokFOC7RJmJ5hoc9DOV+cxIrF6xRyk/px9uaWE82VhzTj9zmnsVeyr/
 3sBEN/qvRLgdQETYUICAuBQxb7zI42YjaiZfxN5Kusa5le+ArsE2j07vl
 KRSYtmfTANw/PdlR7d/jkfHMJeIPtg3AAOVStXAfsvvxjH8wiLd/Kl4o2 g==;
X-CSE-ConnectionGUID: Vf5nCZa4T1+eg0NAqKdVxg==
X-CSE-MsgGUID: 1EU/tLa4Sx2yKpwoSQIQFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85966201"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="85966201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:17 -0700
X-CSE-ConnectionGUID: k744OdU7RiehvVXdhvl0dA==
X-CSE-MsgGUID: Yn1s2d4FRQCktYBaq6E/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="176328170"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.244.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:16 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 3/5] tests/xe_eudebug_online: Allow dead client in
 set-breakpoint-sigint-debugger
Date: Thu, 18 Sep 2025 14:33:59 +0200
Message-Id: <20250918123401.5433-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
References: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
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

