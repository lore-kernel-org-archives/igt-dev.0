Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D6CD8CA4
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 19:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7CC10F927;
	Mon,  8 Jun 2026 19:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htyJ6Zu1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969D610F927
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 19:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780948297; x=1812484297;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zfHKROkdAdsfl4MY9J/tZn+B0lUu3J6dhvOM5Y6c+L8=;
 b=htyJ6Zu1wr2uJ4gyTW1DNcOBPFVTI19E2a/POoatOuSBkw4Oxwz9qD2Z
 00La7w+PdBtuBCtKEVcQ2QZ1HMacIHaJHQDAOVBBKINaNcnk94L/oWk7p
 N1erI6fACsZMSSbbRqkYeJBTFkHjS7DZHKt2lcCWJrfwsNyCQh0p7pOG+
 oMQCu4PP7unnyMrbAFYDzrDlYjMrvVgcXN+AI97VQ8EBQnZ8KIqUHewoP
 VKeU4HuEjvr/mbLpgn9BHE6k1zBCCJ+xdEnBPaLLyRJLOCKpn/TwMSg6J
 CMprpsWV+UalB//xYXCA7CJPNWyLMg1TM/jY6wJHf9NY6/D9W2/S26DhS w==;
X-CSE-ConnectionGUID: ADfPJ4LxSh+sblG8FHP+9Q==
X-CSE-MsgGUID: Gk53BmMnTCegCWmSLR/GwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92373447"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92373447"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:51:37 -0700
X-CSE-ConnectionGUID: dWjvLMVNS3q+7/6OKDZghQ==
X-CSE-MsgGUID: lymhtxdTQ5WNtL7NUlT2AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242699020"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com)
 ([172.28.178.99])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:51:36 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] docs/reference: Fix build on ancient Meson versions
Date: Mon,  8 Jun 2026 21:51:08 +0200
Message-ID: <20260608195124.32361-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 docs/reference/igt-gpu-tools/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
index 2c65155b7f21..f52c2c2e6eb0 100644
--- a/docs/reference/igt-gpu-tools/meson.build
+++ b/docs/reference/igt-gpu-tools/meson.build
@@ -65,7 +65,7 @@ foreach group : test_groups
 	generated_docs += custom_target(description_xml,
 		      build_by_default : true,
 		      output : description_xml,
-		      depends : test_executables + test_list_target,
+		      depends : test_executables + [ test_list_target ],
 		      command : [ gen_description, '@OUTPUT@', group, test_list_target ])
 endforeach
 
-- 
2.54.0

