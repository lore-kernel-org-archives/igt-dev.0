Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0FBCAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 12:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6652F10E904;
	Thu, 25 Sep 2025 12:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+IeFqiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFAF10E8FC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758803888; x=1790339888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WawbjLCClKj81qFGqTSvxtnljVMdahgRARnkl1rvSm4=;
 b=T+IeFqiW41tMIdg8IuGlFFr0dtMKbo06kB8iWy95Xfue6WysJPmgDhhb
 jbNVmVMScqj3mdPk8NorQmvlErl32r6kK7BiI2Bpm9IeUZkOhBWEQTabp
 03miKPXstUDhh+roG0cilAnkm4m3KrGAWOeMX+V8Lokyh60haUfaJMAZY
 ytwG4UcZyWyVs7qU6SXmVmn/E6xhW9KQG++sUmiUAWmOR7FtYnayHsew6
 3WcMlZ1cl+8/K76P25zLeCUwxsXcy7VEl0c0AdStaJngZRvrR4dmOhxdk
 MMIXpNbrA9/Gyk/V1P1w0yrjDjbJKkL6xOobwvm2aQg/b/4jd4fPPTThy g==;
X-CSE-ConnectionGUID: u4THOFetTOSwBpKPRxmkDw==
X-CSE-MsgGUID: fhxmOnlBSTGEl2fevsXybg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61226511"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61226511"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:08 -0700
X-CSE-ConnectionGUID: iTW2VmI1QRa81h/r+V7Jrg==
X-CSE-MsgGUID: 2KFquhZmT+ajGzRGp1rUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176894456"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:06 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v6 i-g-t 3/9] tests/xe_eudebug_online: Allow dead client in
 set-breakpoint-sigint-debugger
Date: Thu, 25 Sep 2025 14:37:39 +0200
Message-Id: <20250925123745.15721-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
References: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
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

