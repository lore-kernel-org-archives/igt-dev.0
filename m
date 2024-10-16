Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94F4D1AD55
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 13:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCFF10E2DD;
	Wed, 16 Oct 2024 13:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyTXVp6S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0259010E2DD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729085405; x=1760621405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mGAZ1ZkWSYoIMnCgVeu8/dWqaNe15RtB8KxsLkD4n70=;
 b=jyTXVp6SC2mBIgDB/+g1zUZfdDNP3Mu957QNi5a+kjGUari1TAtoWhQx
 PRQc7og8uWuh4OFhePQBpr0BrGmu2LGzp7GsKnvnIZiR+sBymGtySSNqN
 9c0OVxJIh/kFkG90BC9Z6pBU7Vv+urCPS4oViKuRfDNQ+sMcJOVFAFhua
 W7+MTR2VisuLB0WpliWj/duznBkQP86I7e2X1PiwRCjmauDXLAzCiH0tH
 m5vyNvJAKKkJysLk0sMZK7nFJ6JFOydnnd9bg/DndLd+mQltWPNPKXyAC
 XSKzJV5KrrAZRzg9pA08I4MBSs5K/Oy+kNuzwE80odbcZvp6gzjUoG7pU w==;
X-CSE-ConnectionGUID: 82wuzM9PT8SjmiBFB4jvEQ==
X-CSE-MsgGUID: /OuCuo0UQ4io02hQakBkHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39902872"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="39902872"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:30:04 -0700
X-CSE-ConnectionGUID: nFLmBDFWRvS+1hGi5RfOog==
X-CSE-MsgGUID: TgzExf3KTC2utchfe6/Bpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="83041195"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:30:02 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_exec_balancer: Disable parallel tests
 on execlists
Date: Wed, 16 Oct 2024 15:27:21 +0200
Message-ID: <20241016132718.36457-4-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

The functionality of parallel execbuf tests is not supported in
execlists mode. Fix the check in has_parallel_execbuf() to take that
into account.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_exec_balancer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 20e31baf0..30f2cb241 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -3378,6 +3378,9 @@ static bool has_parallel_execbuf(int i915)
 	const intel_ctx_t *ctx = NULL;
 	int err;
 
+	if (gem_using_execlists(i915))
+		return false;
+
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
 		unsigned int count;
-- 
2.45.2

