Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F0CD0D15D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDF910E64C;
	Wed,  7 Jan 2026 18:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3zfIQfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB0110E24E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810723; x=1799346723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3+HJV3qgPWogFFG342lHELK6nbI3McDhcJyvEnwbUQM=;
 b=a3zfIQfEhtfQAT08KdInADz9OytfBVci8v3ky/1JIzvPyaN2Zf77IqDg
 B800/NIJp/N6tMp1Yglj2pIqCPzqANQ2TSN/XwzPvmnHwHz/i3qsZkumA
 UI4N463VIGfw0O5lW78rUkkf459/u+7PsTrg5ywbKRprMX2WP/0KS9PRm
 S8OTS0/okA+dJB36hsRELX/S3DVpP5Mr2Vn/AaoewPxRvG5aXcGZeQxlL
 dbcAdHvg+DNCoFF62THEMdtBCHsj7X4OesexnWmiEUm5avxMc6IdC3uLi
 po301uyvr9F3MDD7VV8mnpGKhsZOtghcHKa2U+8755tCIKvmRAMEK0u6+ Q==;
X-CSE-ConnectionGUID: UN8HEoDBRg6qwTlu953z0w==
X-CSE-MsgGUID: xVC4VclOTP6RZPjOTda/FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80549393"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="80549393"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:32:03 -0800
X-CSE-ConnectionGUID: UY3L4k3CR5imXnh8wdJH/g==
X-CSE-MsgGUID: aFWg6M5iQNyXhUK06Fk9mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207845956"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:31:31 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 2/6] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Wed,  7 Jan 2026 23:56:50 +0530
Message-Id: <20260107182654.84173-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107182654.84173-1-soham.purkait@intel.com>
References: <20260107182654.84173-1-soham.purkait@intel.com>
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

Add clamp helper macro to utils.h to remove dependency on lib/xe/*

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop.src/utils.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/gputop.src/utils.h b/tools/gputop.src/utils.h
index 00befed56..0334ec839 100644
--- a/tools/gputop.src/utils.h
+++ b/tools/gputop.src/utils.h
@@ -19,6 +19,14 @@
 
 #define PERCLIENT_ENGINE_WIDTH 8
 
+#define clamp(val, lo, hi)			\
+({						\
+	__typeof__(val) _v = (val);             \
+	__typeof__(lo)  _lo = (lo);             \
+	__typeof__(hi)  _hi = (hi);             \
+	_v < _lo ? _lo : (_v > _hi ? _hi : _v); \
+})
+
 /**
  * struct gputop_driver
  *
-- 
2.34.1

