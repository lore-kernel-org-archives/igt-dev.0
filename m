Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F23E73145
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C110E3BF;
	Mon,  2 Feb 2026 08:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFBZpRbj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E510E39F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770021420; x=1801557420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tr98I9JMcJWNq5Dive9BSWN/HsNBOrl/sNYC5JUaHZA=;
 b=NFBZpRbjQGdSI5apLR50Yhe0j6KIsuru6QsyxQjDPh9zEw7qTXI5cWPj
 XlCoQnAC8u4x721l5uDw8k39O9VI6MnSlHb4nDoR/G+yDa8hZel6Ui2vr
 4AJXV/ZKD8eFmn2W5PfgKv+BkXwUMH5Wv53BBsvTNiM1JMsFNX1+zUic7
 NsL68qf6evDHLnA2QfY9d5WKZTUbPmvI0tYOMBbHH0Lu6c4k1QS5q1p0V
 KgxHnmwjNB0TsKKB/acgvkyKr0qX8qXSl94lUU30PlXOYBAVutPGDXe3f
 +5IE6ymqxR80FXRB507xFH+P+ulxc1m69t0cpPzYxDjjzBnzSo1r3KW4X Q==;
X-CSE-ConnectionGUID: vuPFbA/3TImL/QrowGhgVA==
X-CSE-MsgGUID: Noj+OBUoTxqkJlLJsMYW8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71259765"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71259765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:37:00 -0800
X-CSE-ConnectionGUID: RuZbDEFOQa6EN4EeqUjO+w==
X-CSE-MsgGUID: FYS/8GDzToO0yj92TY7DKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209317407"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:36:58 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/2] intel-ci: Add linear-reflect-x tests to display
 blocklists
Date: Mon,  2 Feb 2026 14:03:00 +0530
Message-ID: <20260202083300.647462-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202083300.647462-1-karthik.b.s@intel.com>
References: <20260202083300.647462-1-karthik.b.s@intel.com>
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

Linear-reflect-x modifier is valid after display ver 35.
Blocklist these subtest for older platforms.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 583df28e3..25f57925d 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -205,4 +205,5 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 # Valid skip :- For display ver >= 35
 ##################################################################
 igt@kms_frontbuffer_tracking@.*argb161616f.*
+igt@kms_flip_scaled_crc@.*linear-reflect-x
 ##################################################################
-- 
2.43.0

