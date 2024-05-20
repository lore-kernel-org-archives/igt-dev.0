Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6145C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 09:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3368710E420;
	Mon, 20 May 2024 09:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GytyGFXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC0610E32F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 09:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716197733; x=1747733733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nixeiOL2C8fjPFR1lU1Bn157K1oWBuRv8E+/ecG9gSI=;
 b=GytyGFXtCxtUo2gTD90l/tZXAVGi4IVOa99RaGRD7xoj64QLgn0GfwlQ
 7RaJcT2idmAaQija/G6bkL+WFQwXQkNyQJrVewurpy5hM22gTN/s04d33
 QvIssLjrA4fODHFDIfnKCJw9rrgu6tOfK93n4Ku+Nqox+aKHd2Gz/Vt+4
 L/zfYp8cv5s9Yga7dm8ALw1bshk3CRimmybtIU88MjKFhHwhxsD8y+p4I
 Fq3UJAUUnqPFv0aCxGtmaIAfBNr2ARDeLkj8q8ZcnoIHuel33/ZoOwK87
 SixWQkrX1xrQ9pOWs7ElGtAD4PkrqQosxBp9c7tF8/EmYhjOER8p2VIDm w==;
X-CSE-ConnectionGUID: PDY3dSMxSLWl3K/OYhuHeg==
X-CSE-MsgGUID: EJexy6yDTzuybasVTYFlbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23729027"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="23729027"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:35:33 -0700
X-CSE-ConnectionGUID: a1LrVZlsQYe5ituMRpHkAw==
X-CSE-MsgGUID: mWuLxFV7QZqeLR7jNrRqMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32333515"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 02:35:31 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Date: Mon, 20 May 2024 15:16:20 +0530
Message-Id: <20240520094620.3713972-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520094620.3713972-1-jeevan.b@intel.com>
References: <20240520094620.3713972-1-jeevan.b@intel.com>
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

Add checks weather early transport if supported then
we check if early trasport is working.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 4c3e34aa0..4908f2444 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -916,6 +916,9 @@ static void run(data_t *data)
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
 							  data->pipe),
 							  "FBC still disabled\n");
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, ET_MODE, NULL))
+		igt_assert_f(psr2_early_transport_check(data->debugfs_fd),
+			     "PSR2 early transport not enabled\n");
 
 	data->screen_changes = 0;
 
-- 
2.25.1

