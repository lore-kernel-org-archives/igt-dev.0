Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F318FF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD39C10E743;
	Mon, 27 Apr 2026 13:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3JupuSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC34010E743
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294851; x=1808830851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzFXTytQBrrS8t9ixAMricB1KT6QUDtl67IANP6dKXo=;
 b=H3JupuSJ9kPT/ml+xqOvVoDH8uHfkB3jvOTnTyIHIWNvUZHxj/RTqrYj
 TeeD24k5wxOXSd82styfyqeR5UZLsy00BYKJY5yyXCqzTV1W09g8xlOJv
 MfdMSh83P/qE5C1SgP30dpmJw6CJfiQK97yzypkDIbjdt0n7lC9nAjMxL
 hjgDMUHVpsKdjhDZ3xvWqDI5cX2c48/DIvFpmAC1Zd5hueyZoKbYKFNSv
 /lNLnK6CxPmh4TyPznl4TiG4k6n8cNp2T4mYQJ8RORrsm3qvwxZiJh9fx
 /FhqoH5EWaX54EgcGEejBlLjGSVzhgBb+kgJeXS0LyOXpga/RSMN7rtku Q==;
X-CSE-ConnectionGUID: v2AH4+ZPQieopzmiH2jZwQ==
X-CSE-MsgGUID: bYR4etyQQ8i+cHmhX7La0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339184"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339184"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:51 -0700
X-CSE-ConnectionGUID: k+WGkNeTT1q+SxrPgBovGQ==
X-CSE-MsgGUID: 3ru5UFiRTkSSTZqSo1cGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597698"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:48 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 1/8] include/linux_scaffold: Add BIT_U{8,16,32} macros
Date: Mon, 27 Apr 2026 18:16:00 +0530
Message-ID: <20260427124607.3115567-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
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

v2: Add BIT_U64 for completeness. (Karthik)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/linux_scaffold.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
index 281aa5e730ed..0c970c86079a 100644
--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -57,4 +57,9 @@ static inline s64 sign_extend64(u64 value, int index)
 #define FIELD_GET(mask, reg) \
 	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
 
+#define BIT_U8(n) ((u8)(1U << (n)))
+#define BIT_U16(n) ((u16)(1U << (n)))
+#define BIT_U32(n) ((u32)(1U << (n)))
+#define BIT_U64(n) ((u64)(1ULL << (n)))
+
 #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
-- 
2.45.2

