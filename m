Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD057CAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576EF10E9F6;
	Fri, 26 Sep 2025 07:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TT7pQwwK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1F10E9F1
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872901; x=1790408901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WawbjLCClKj81qFGqTSvxtnljVMdahgRARnkl1rvSm4=;
 b=TT7pQwwKcQJRNrjzb+R9I3afJ8M0RsBSYM2erXXoXy5/OCzPoN8a0XIq
 uvg3eYA2Pjj3x53MTC29+PwaqA+C/R/CGJzjkmmmED0CpiqhFNKvVFAds
 8nefhNSTDIpR6w6iWyoAR+ic71ASYjIj+U+IJLnPeyzZa6S3dZpWpVBtq
 GVK4Y2sYsFWGKZNmdCo4Q81fJrwB9isxi4CozU/YB/1DzNXCJleZNb75+
 oV9YlWLRCGUzG1airXzfIvP7bolQkmxO3hNax1uhalHZHYIWlG2sn8F87
 lOP6qaWmNuTEiz8k0nMPlpIxVhtgWethKZ3Gbwl59ILENSEPCmA/YUd6G A==;
X-CSE-ConnectionGUID: RYW30SWmTNOp4VxaBOwd8g==
X-CSE-MsgGUID: v1EW8cBnQGOGzhqqFXQP/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372375"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:21 -0700
X-CSE-ConnectionGUID: CD2/7aCoR7qb9uDu4qAMmQ==
X-CSE-MsgGUID: JhDjcotCTRmbL9XQ0Qmfxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474214"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:20 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 3/9] tests/xe_eudebug_online: Allow dead client in
 set-breakpoint-sigint-debugger
Date: Fri, 26 Sep 2025 09:47:55 +0200
Message-Id: <20250926074801.9031-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
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

