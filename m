Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BEFE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 10:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E493C10E12F;
	Thu,  5 Dec 2024 10:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/GQiJHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469AA10E12F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733395304; x=1764931304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V7AlZ4ApmEmZ2qLkBODBGDZFOkmE8G0TwJVd/H4GNuc=;
 b=C/GQiJHc2VE1AkeKDvuTOPp0HL3W3UTiakLy0KnFGb/lHfvoslTOd/BD
 fJvoB9IX6+xRxZcc9Awk2m8myM5wsEky4Y6TO9huBb8jPC2Fv4HLS0n9B
 Wy6NhtTyCxG0VatszYgSb8YUC5NnWJou0UWu9E3wKy2k3z4MqDj4k4kic
 cuslL4daMgw+tlov5evfhVmmz9cMMaWZHyxdqubgc/yyE2UQSwD+aCdLh
 v2HRsJwSCDT8yFxZRDJbb5gJJgPf3OF4fwmYYdkJ20X5lHyEqHIlE2RwL
 ACLeeyjlkwY6sVMiLXxGTpsg/ao6eLgq4J5NQeJAikVioZtdgEEHfQi39 g==;
X-CSE-ConnectionGUID: l6KFBE95Rau/gdFUM/KM2w==
X-CSE-MsgGUID: oUG0FkBTSlqh3V+Sv9H6vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33832383"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33832383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:41:44 -0800
X-CSE-ConnectionGUID: pjV44N7MRZC5Jx6AMEWRWA==
X-CSE-MsgGUID: 8DX4k4qpR3+zlB+aBC4DEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94892296"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.244.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:41:42 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] lib/intel_bufops: Set NEEDS_VISIBLE_VRAM for each buf
 by default
Date: Thu,  5 Dec 2024 11:41:34 +0100
Message-Id: <20241205104134.22790-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Some tests (i.e. xe_eudebug_online, xe_exec_sip) are mapping intel_buf.
If the backing storage is nvram, any access to mmaped buffer may
cause segmentation fault. Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
by default as intel_bufs might be mapped and this is not harmful.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

 lib/intel_bufops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 619222019..49b91a171 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1021,7 +1021,8 @@ static void __intel_buf_init(struct buf_ops *bops,
 				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 
 			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
-			buf->handle = xe_bo_create_caching(bops->fd, 0, bo_size, region, 0,
+			buf->handle = xe_bo_create_caching(bops->fd, 0, bo_size, region,
+							   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 							   cpu_caching);
 		}
 	}
-- 
2.34.1

