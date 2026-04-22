Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FE1F94CC1
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 04:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C163210E262;
	Wed, 22 Apr 2026 04:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8HqK3G7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B07110E261
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830308; x=1808366308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1GfdGUqWRgJcZ/EMXPwm6RGKxrDrPWFrKiODAnXH9xU=;
 b=J8HqK3G7KvSjaXXIdqVl2+wDKOPZcAei1hvKC+axtn+q74lkBWd6gKJn
 ykn/LDR1Ejr18oBgaI1uHQL028GV6cSQX803kDnPfUhgPl8PHOPyPCbce
 xS4TKAVpna8cT67Qa+xwYNjCrAhuuPdWK0mwIJuVlo4229euRnY6sT8z3
 dR93ONzYnmjRAZ92eUDQ4B1/17k8UT5TLmMt6cc7Fcl++d1czzm6/p0Ok
 rhK1s7zCBt7aWRO92QrMJk+02QfioNbk2FTZWEL/SPl312nCc3aNsKbpn
 bBvjovTAHy4uTlR3HHBFyeNmOc8oHGmEGUMT0M+OJ9jZRAqx7elwzINib g==;
X-CSE-ConnectionGUID: GtTP7bDKRwOnLKAScyfbzQ==
X-CSE-MsgGUID: HQbyHldsRzuKmG6KHabPbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338482"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:28 -0700
X-CSE-ConnectionGUID: L9gJUOQISpGD19gGM2YlJw==
X-CSE-MsgGUID: gIkG7igUTJ+tV1utPajmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151327"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:26 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 1/8] include/linux_scaffold: Add BIT_U{8,16,32} macros
Date: Wed, 22 Apr 2026 09:13:28 +0530
Message-ID: <20260422034335.2326098-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
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

Add macros to accommodate the kernel macros BIT_U8, BIT_U16, BIT_U32
in the header file `intel_vbt_defs.h` copied from the kernel.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/linux_scaffold.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
index 281aa5e730ed..a3acaa16117c 100644
--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -57,4 +57,8 @@ static inline s64 sign_extend64(u64 value, int index)
 #define FIELD_GET(mask, reg) \
 	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
 
+#define BIT_U8(n) ((u8)(1U << (n)))
+#define BIT_U16(n) ((u16)(1U << (n)))
+#define BIT_U32(n) ((u32)(1U << (n)))
+
 #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
-- 
2.45.2

