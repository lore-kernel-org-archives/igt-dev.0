Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E66C77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 11:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5356610E573;
	Tue, 24 Jun 2025 11:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9oW5qp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E8B10E573
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750764150; x=1782300150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V1YbofB0Fvuv4Q2pWmrdJGO8w6UPiMk9Sowy5X7jG3Y=;
 b=g9oW5qp41ZyZKxsaZVSqAxSe5Scj9cSEws5JWNZRH9VVljb7vCkkiaOm
 GRWnFFYFc0iAiXwU1JJTSymQeULrK1+fkJ/11RiG+e9eAQPVHzYGj5mga
 vTlEsDzMyP7vigU6r4kthZ9UPuvgoPGmaod8fxHeshdpjV56RhAxj1geV
 xZ/RFcnQBv+0uj4iae0LpGBDwopGnaVLtFHXJBE4iQnFz02G9UKHQk9Xx
 FKndJGys3rBkZOIyTpx+dQONfPdqKxsgYnds1VNJRQ9Jw9HS9Yk6ZBhV4
 d2pwS6UwFKhNfojsDbTHTqiSKIX0X5OVVCtlTDMYHzvkJO44MSZfCvP7M g==;
X-CSE-ConnectionGUID: gh3hKXCRTEyKl7AIBPaWWQ==
X-CSE-MsgGUID: FpgI4RfMSkOaDTiPMGf5ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52721241"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52721241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:22:30 -0700
X-CSE-ConnectionGUID: bt6wUdbpTu2QVlg0cMgUkQ==
X-CSE-MsgGUID: WWr5s+mTTEyU0ZhBug/8DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151315059"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:22:29 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] intel-ci/xe.blocklist: Block virtgpu test
Date: Tue, 24 Jun 2025 13:22:15 +0200
Message-ID: <20250624112215.67441-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624112215.67441-1-kamil.konieczny@linux.intel.com>
References: <20250624112215.67441-1-kamil.konieczny@linux.intel.com>
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

There is new VirtIO-GPU test so block it from running.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ebe1ff006..a21c8a3d3 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -10,6 +10,7 @@ igt@panfrost.*
 igt@v3d.*
 igt@vc4.*
 igt@vgem_.*
+igt@.*virtgpu.*
 igt@vmwgfx.*
 ##################################################################
 # Exclude all i915 tests
-- 
2.49.0

