Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E56DFA1FC9
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 15:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE25110E04D;
	Wed, 22 Apr 2026 15:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlYUbWpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A100310E04D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776872685; x=1808408685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/F9KeHYnX0KCpMC5M+hcFbL9UpgTImL5p0UUj3khs8=;
 b=HlYUbWpGtCMwBaQjMv3n/0qtWbAoe1OA4A1ZcUrbqJ7GSTM15fIxBMV+
 J2K1fjD+RjugyYlTF0xji358tgk2Vy7hIOh4SbqIxNH/Ry1uV80PRtX7h
 UltCG8tXvLhNRn2Aox6yfYTU0z+2oxRy51PTRsq6J4BwntIS4qzW9SzJj
 bn1cl1+0Cw714eyK5AWrU719E6ZqXciYLWYBfiGRM7DI1BmUQlX/5cbw7
 eeDA+76xfkavzIWmLTdQl47umwosvOgKzCuECk7gPiR/LwAZrFG7+Aa2q
 sskc5VbDDP6eDF3hyD9CXJk3TxCbH1s49G6R/r56E0Pzpj66j+GOyebZX Q==;
X-CSE-ConnectionGUID: 1Lkwqm7ZQl2Qw/WMFw/9OQ==
X-CSE-MsgGUID: 7rrAmCVrRTyE/sgB7q2qkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81692683"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="81692683"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:45 -0700
X-CSE-ConnectionGUID: Isdbzzx3RguKD0rg+8dH/w==
X-CSE-MsgGUID: saTREiXkQuuk8BDvZeosQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="236762677"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:44 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 4/5] tests/prime_udl: Fix i915 device opening
Date: Wed, 22 Apr 2026 17:44:22 +0200
Message-ID: <20260422154423.141908-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
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

There are now Intel cards handled by Xe driver so make sure we
open one handled by i915.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/prime_udl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 5d2c952d5..db83152fc 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -49,6 +49,11 @@ static int find_and_open_devices(void)
 			intel_fd = open(path, O_RDWR);
 			if (intel_fd == -1)
 				return -1;
+
+			if (!is_i915_device(intel_fd)) {
+				close(intel_fd);
+				intel_fd = -1;
+			}
 		} else if (venid == 0x17e9 && udl_fd == -1) {
 			udl_fd = open(path, O_RDWR);
 			if (udl_fd == -1)
-- 
2.54.0

