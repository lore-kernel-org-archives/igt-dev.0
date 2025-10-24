Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB93CCF9E3
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 15:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9360410EABE;
	Fri, 24 Oct 2025 15:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7HmO20n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A3110EAB5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761318474; x=1792854474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xV7B/utNARm7uD2U3DeKb/od7Dcj8iJ2n96jeL/N4ig=;
 b=H7HmO20nMP9xcim7W0pQe0m5ZMj0Ce/2qn3XkZlYqNvfc2YcB9Y3QHjg
 RWsbtIS3/iGr2n/RbLglxBhndSrjYJrd/RDCgF4cKgiE+lItZqRXWMB90
 nHWiGj9YpqOCb3pkwYztoWgRGYQKQLvPI95sadZGxXaHcUk+H+TFdKbE7
 OTVkPZfuXrj8CCl+XCFhM51aVz4ZVLvGuIivdjaTq3yH5jtgJCSHTaVEm
 rZF+A3377BSnuM+B3yO2W/RNzblAmUcIbR3r+hF3XH2vHoS+D7/O+/L/R
 v3cDNI3WjY/45IwK2shtObPo0D752K0LR4vYtn6SSMDbR+5abarpE80RM w==;
X-CSE-ConnectionGUID: dKrdhHN+T5qMiSnWz9OfYw==
X-CSE-MsgGUID: I0tPNRylScytcu34LiC0zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88970173"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="88970173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:07:53 -0700
X-CSE-ConnectionGUID: vv3t2FDsQ/GsenO7FJF2xg==
X-CSE-MsgGUID: 95pcgaXdQKW4fgN/YWLQ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="183674355"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa010.jf.intel.com with ESMTP; 24 Oct 2025 08:07:51 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v8 3/3] tests/api_intel_allocator: Check if multiprocess
 is supported
Date: Fri, 24 Oct 2025 20:24:11 +0530
Message-Id: <20251024145411.3500452-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024145411.3500452-1-s.sebinraj@intel.com>
References: <20251024145411.3500452-1-s.sebinraj@intel.com>
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

Check if multiprocess is supported and if not, skip fork_simple_stress()
for targets that don't have SYSVIPC enabled in their kernel.
Without this check, the test would fail with assertion errors when
trying to use message queues.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/api_intel_allocator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 15ba4828c..461459122 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -487,7 +487,8 @@ static void fork_simple_stress(int fd, bool two_level_inception)
 	uint64_t ahnd0, ahnd1;
 	bool are_empty;
 
-	__intel_allocator_multiprocess_prepare();
+	igt_require_f(__intel_allocator_multiprocess_prepare(),
+		      "System does not support SYSVIPC, multiprocess mode unsupported\n");
 
 	igt_fork(child, 8) {
 		if (two_level_inception) {
-- 
2.43.0

