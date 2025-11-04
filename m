Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8947ECCFA06
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 11:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFBF10E260;
	Tue,  4 Nov 2025 11:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7EAYdxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4510E260
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762257287; x=1793793287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjElelTrJIt6GJTvDSKnbIxQWV+uM+MICI6VNyFsqUo=;
 b=d7EAYdxvN/XFM3j9i1grq+HgoWqmVWYGq3xSLsvz/ZJdiU55ca1uaHMh
 08j+x4wZuGsXyJbqrm/pXY/ZY4FFhoPHiT9HKgclxNVpQmHOeu1e3w5m8
 dGPuT8liFbe1rPHbltJcXDBFi0hjiw30zlx9gQbWaWcuSdM7MoquHvWWg
 PLWTXmX/d6Hgf5QQIi178cwnNXdBL6ZTBM+YuA3a2e/Yn7sf23GxFxF1U
 GkFm7YTGjD3RPb1y88qFbzNjGOg99lwHXAoJ+QawzxjCj2ol5YydKkwMA
 DDaf511Moft5FJ2WZMOZpwsHsaMsOatdzknt5lsZUej3/eRIdEikLCsq/ Q==;
X-CSE-ConnectionGUID: YYW3JRqqS0iMWOL+ApFe4A==
X-CSE-MsgGUID: SwHAsbdsTVeD54j3nM+Arg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75459871"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75459871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:54:47 -0800
X-CSE-ConnectionGUID: arEL8u3mTVm1B1//JSU+QQ==
X-CSE-MsgGUID: q0skDvqsQlGSCHdSCuHrIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="217782754"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.245.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:54:46 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_exec_sip_eudebug: Band-aid
 breakpoint-waitsip(-heavy)
Date: Tue,  4 Nov 2025 12:54:18 +0100
Message-Id: <20251104115418.11917-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104115418.11917-1-dominik.karol.piatkowski@intel.com>
References: <20251104115418.11917-1-dominik.karol.piatkowski@intel.com>
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

Both breakpoint-waitsip and breakpoint-waitsip-heavy are expected to trigger
a reset, but the reset is asynchronous and can overlap with test starting on
next engine.  Mitigate it by adding an arbitrary sleep until a proper
solution is in place.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_sip_eudebug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index e5b8ba418..6af034380 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -304,6 +304,16 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 	xe_vm_destroy(fd, vm_id);
 	xe_device_put(fd);
 	close(fd);
+
+	/*
+	 * XXX: build a sync between reset and test end
+	 *
+	 * Both breakpoint-waitsip and breakpoint-waitsip-heavy are expected to trigger a reset,
+	 * but the reset is asynchronous and can overlap with test starting on next engine.
+	 * Mitigate it by adding an arbitrary sleep until a proper solution is in place.
+	 */
+	if (sip_type == SIP_WAIT || sip_type == SIP_HEAVY)
+		sleep(1);
 }
 
 #define test_render_and_compute(t, __fd, __eci) \
-- 
2.34.1

