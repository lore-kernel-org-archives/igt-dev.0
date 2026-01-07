Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2E8D0D167
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B075710E279;
	Wed,  7 Jan 2026 18:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bhw4jYnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FADB10E651
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767811339; x=1799347339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3+HJV3qgPWogFFG342lHELK6nbI3McDhcJyvEnwbUQM=;
 b=Bhw4jYnnxsVOwqvVJYN6iALXsX+H4Lns43LIHI74QwtQoiTXLIzWurG+
 37ruhEe0RnSA+41w8/n4d1/bkFBkhpiYtzNryJYq3D/O1eh/MR8xqE7+Q
 cdeIcj5jFk5JnGaq1f0FEYtudWVvCds+GBRNwf1VL0JLYZJndL7BjKu0O
 ym0cbRgdG8CdMi13XAuX2+PvZJfPqz9iZr1/5iuUSEzJMXho694GuTlPQ
 9rmEHXwKPC+IAAtXDR6gOMTYwzp9HcfVFSk1qOdGV/hFcY92Ise8+zDSo
 6bJL7NXlTzFCa16K6pXJem42xxWqzk0YUgBYv9Auo2FPu48ZmQ1MntQDn w==;
X-CSE-ConnectionGUID: /9ny+uXyTe6Xxhfp6Xgnjw==
X-CSE-MsgGUID: Vp07zDg2TM+UiIn4/8YxQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69236255"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69236255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:19 -0800
X-CSE-ConnectionGUID: RzskKuBYQCSEJvxDVUlIrg==
X-CSE-MsgGUID: 6V9Iy1KbSiue+udAD3RbGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202199871"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:18 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 2/6] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Thu,  8 Jan 2026 00:07:35 +0530
Message-Id: <20260107183739.84597-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107183739.84597-1-soham.purkait@intel.com>
References: <20260107183739.84597-1-soham.purkait@intel.com>
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

