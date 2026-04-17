Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F042DF8E4B4
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F7310E987;
	Fri, 17 Apr 2026 07:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/s+UUJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C911610E988
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776410963; x=1807946963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bB9zyu1dZw1LArocU6Tis0VqVT+24usxYpfcEnfNJx0=;
 b=P/s+UUJ6iHJZJLJtdXVUFF/lc7xF7DDD1QE4zOU8q1XBh8dY921PxDH/
 HRzhse2WkycM2JFPVuGRIzs+ReUF353DlTlhJV+mVs6rxyX7PKdDekI3X
 anz64hik6JiGkjwt6IVAssMsBH/JI0YJXq6uRBNB1YPKkTFQQpq69YB0s
 esCSCxS5IxtfmZhQa/K2LU/htlED7F7CY/3dJvOZPDB8IA04xNmBeZAFF
 L0g9ZXkJJDrF37E8+AotHpjZr6cvPB5m3nApsKe4VE7cgG7010C/nH2ng
 /4/UFu4RcnE750mOFJ7KenjEJkZykQPhDkhSe95xLeskYuqNnxqpnoJ38 g==;
X-CSE-ConnectionGUID: rq25wj9RR36Un8qUdbobMA==
X-CSE-MsgGUID: OffLWPwtTBSQ0hqHKW9c6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81021118"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81021118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:23 -0700
X-CSE-ConnectionGUID: 8/y6PQ0lRKiovF5AaXjnrg==
X-CSE-MsgGUID: LnXSCjwWTrCEaR+yESPYQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="268985258"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:22 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 commit 1b85a9b04681
Date: Fri, 17 Apr 2026 12:44:29 +0530
Message-ID: <20260417071432.2252380-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260417071432.2252380-1-ankit.k.nautiyal@intel.com>
References: <20260417071432.2252380-1-ankit.k.nautiyal@intel.com>
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

Synchronize intel_vbt_defs.h with kernel commit:
1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")

v2: Use pipe_joiner_enable to match with kernel variable name. (Karthik)

Bspec:20142
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tools/intel_vbt_defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 6612d3a4ec49..52468fc99e62 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1090,6 +1090,7 @@ struct bdb_edp {
 	u16 edp_dsc_disable;					/* 251+ */
 	u16 t6_delay_support;					/* 260+ */
 	u16 link_idle_time[16];					/* 260+ */
+	u16 pipe_joiner_enable;					/* 261+ */
 } __packed;
 
 /*
-- 
2.45.2

