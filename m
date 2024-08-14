Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D661C531DC
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 21:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147E210E1F6;
	Wed, 14 Aug 2024 21:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAulN8B6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707B210E1F6
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723672034; x=1755208034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BinGivKSvJmAWtbBT+jFSlq/rlOEyJAhl/2Xzy5V2VI=;
 b=CAulN8B6vWOi6RB5dvxuzOKs8Ww+XaC8L76JSmNMCoE5jlgTaxbxKBER
 JcZCEt6tjI6n1kHVc41djKowEy0gl3Ds7gu0JHAd38xHir0PEx9j69wC2
 FvtuxwCkzPfNpMh7+CAWL+iC0L/0t46b47+SYnhpLH2e2tpFUgu3YNa20
 Oe2Iu6Q5ICNRfLQige0F+1uEPSCFrq383EwuHkvfx2tERprKitlwg9PtU
 qi+mwFzyMHmIh7y5tOM4ZPXh4Pvt9FRo5RTkZo4yDcTr3aa89h0dFr5Nn
 YuFxdNsCDRTir1eEdsKyxM4mF/18VyemglGb9a71xY4b9NKywe8i71/R3 w==;
X-CSE-ConnectionGUID: LRckXEi7SPiKGQMWz+qBAg==
X-CSE-MsgGUID: f7/UH4nlRCa1hs0c+JWUDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21785902"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="21785902"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 14:47:13 -0700
X-CSE-ConnectionGUID: fYFKL3AlRGaalP+lvukOFw==
X-CSE-MsgGUID: oz4OuLmiRWSQTmqXj3ZbBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="63983770"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 14:47:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_core: Add a couple of time conversion macros
Date: Wed, 14 Aug 2024 14:47:04 -0700
Message-ID: <20240814214705.3718355-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814214705.3718355-1-lucas.demarchi@intel.com>
References: <20240814214705.3718355-1-lucas.demarchi@intel.com>
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

NSEC_PER_MSEC is defined in a few places: move it to a shared place
and make it build on top of USEC_PER_MSEC.
---
 lib/igt_core.h                    | 2 ++
 tests/intel/gem_ctx_persistence.c | 1 -
 tests/intel/xe_exec_sip.c         | 2 --
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index c83bcbaba..74fa0ed49 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1509,6 +1509,8 @@ void igt_kmsg(const char *format, ...);
 #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
 #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
 #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
+#define USEC_PER_MSEC (1000u)
+#define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
 
 #define for_if(expr__) if (!(expr__)) {} else
 
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 8d4a874d4..974444cf1 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -122,7 +122,6 @@
 
 #define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
 static unsigned long reset_timeout_ms = RESET_TIMEOUT_MS;
-#define NSEC_PER_MSEC (1000 * 1000ull)
 
 static void cleanup(int i915)
 {
diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index f99726761..ea1770cd6 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -31,8 +31,6 @@
 
 #define SHADER_CANARY 0x01010101
 
-#define NSEC_PER_MSEC (1000 * 1000ull)
-
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
-- 
2.43.0

