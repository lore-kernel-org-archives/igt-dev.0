Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CFF109B46D
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAFB10E2B3;
	Tue, 31 Mar 2026 14:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSa53Gca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C190D10E2B3
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774965974; x=1806501974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/EWCLrste7iqukbynk5AayGc5e1MoYAwwL0yL6ndmw=;
 b=QSa53GcaMAtn6XQnv+Uxv0wkh1WkGV1bbYkDRwyFfIzSdtmzcVnBo4bj
 NtyRS7NcGyQCXgkbH1hbh+dBco1/0LiM7Rorj/G5JelJT3yMySyUyBx1R
 v4g3Tqmzre0x2imYoVNh992x/uSsvX575/1Vnlg0juZsHIZzuVxzQL+GH
 9BD4hI2FbwZLloRGStSvxw6RX5oJ8t7+kYiXb2Ok9H4mxQxDz7sg/dAhH
 /MY6jSXUEVQovVINurkL9tnD30XsolktjWPuF0AWhx/a8i2kBkI1QgDjA
 XtKDEnPk9jDSjs0pqDO36kYavXNWnLdtI5RlF4wgDBBTl1WXfOfiENRs/ A==;
X-CSE-ConnectionGUID: aTACSwTSRgaCg1K0cBNxZg==
X-CSE-MsgGUID: 3BBedGVNTyCnKGYgvj++6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76040764"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76040764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:14 -0700
X-CSE-ConnectionGUID: oCbR1NRWSuGFpQ9rcXj1Rg==
X-CSE-MsgGUID: GQT9gAOFR7uKFj7oHr21ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230839478"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.212])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:12 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v5 3/4] lib/intel_pat: Set PTA + ATS PAT entries to
 invalid value
Date: Tue, 31 Mar 2026 16:05:45 +0200
Message-ID: <20260331140541.2561104-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
References: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
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

Some platforms (like LNL) requires PTA PAT entries shouldn't be
programmed and default register value should be used.

Setting this to max during parsing pat_sw_config or pat debugfs
allows detect these platforms and ignore some actions if necessary.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_pat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index f1f5644dce..2f35bb7724 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -51,6 +51,8 @@ static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cach
 
 	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
 	xe_pat_cache->uc_comp = XE_PAT_IDX_INVALID;
+	xe_pat_cache->pta_mode = UINT32_MAX;
+	xe_pat_cache->pat_ats = UINT32_MAX;
 
 	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
 		uint32_t value = 0;
-- 
2.43.0

