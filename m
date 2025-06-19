Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CAFC7115A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 09:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E74610E9ED;
	Thu, 19 Jun 2025 09:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N++hG1N6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD9610E9ED
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750324463; x=1781860463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AM/BovnuZCSFHgQFeYWvyx+D6reMmTmz3a+5qeuAyuk=;
 b=N++hG1N6t/QnXQ03H4sDE3H51/iF7rcp16B3npwHVXjj+lbCqyMN+x+p
 wHJUHDTLCbQECOcy8/mjRmaAn6krt7qDGP9nLhL+SIxzNn12fxOGEr9ba
 zJZffG7KHdgAboxOBwDF6Xac3CLtFClF7wSPpMyYU/++PvIR1DV+roYJ0
 Qiu4em7Fm5kSMfYi28Rug+BSMEHKSsz/6zzrWt1ZQFSbA7eShMpkWZjef
 dvGabD6ZgvVh2xgM5po+KSAvaufnquaZ309THAcltXA99tgmKPgTBHoN3
 IA4plp9PHVxtFXvmXRrd46De1PWv3M6nLY19rq9ZJQgz2eFz9np1EobXM A==;
X-CSE-ConnectionGUID: 2u+2gekhSVG+Tf5+eK5fUA==
X-CSE-MsgGUID: cFeNKCuVTByQINtdtsK/0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52723826"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52723826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:14:22 -0700
X-CSE-ConnectionGUID: oLSPzS7ZTAKDakLXBkGGyA==
X-CSE-MsgGUID: K0U8FmOcR1qMdISAbIwWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="150898565"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:14:21 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: clinton.a.taylor@intel.com
Subject: [PATCH i-g-t] lib/pciids: Add additional pciid for Battlemage
Date: Thu, 19 Jun 2025 15:00:04 +0530
Message-Id: <20250619093004.3589959-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Clint Taylor <clinton.a.taylor@intel.com>

In BMG pci ids added 0xE221

Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
---
 lib/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index d212848d0..7624fb48d 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -853,7 +853,8 @@
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
 	MACRO__(0xE215, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__)
+	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE221, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
-- 
2.25.1

