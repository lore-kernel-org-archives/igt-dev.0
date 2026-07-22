Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E540C4453D
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 16:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C1110E4AA;
	Wed, 22 Jul 2026 16:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYWgPsCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66910E486
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784738673; x=1816274673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZdousgcgRIMaVM/TmFyI9WQwkAR3DXHA3o0vBllBEM8=;
 b=OYWgPsCc4JCVz7MfTSXHuAnve7hI5UyxusI/m+0K7RlwOtElG2CpPj25
 Rs1lIPP62pktVx559rfprgSzTcarNmjMsRVzzuJGOAsKnFqqkjr3UD+2R
 8f+G+o//0DdWSanh8MIjVx7vdkrsd5Rrv3RfYqRot/lP4ohmlAjH9ylyq
 wExieOogh8QNcmVK+GrcviN4FIaYJEg7HyDAuOkeWkum73aigc4BhJcP2
 p4+CCaNHAZ81pthIDSTp95tdU5naXh5fU0C8O9xcjoepuPEEfc6KjJ4Le
 z+TqS03LaO8G/tZtma1dJSGt/vE962jDiiVK7bb2yVFcB3isAJ5+TNjkB g==;
X-CSE-ConnectionGUID: WT2SSi2tTkOx0t+k0NYgaQ==
X-CSE-MsgGUID: lvYHqlE1QaGhbA2yWBhl1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85500053"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85500053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 09:44:33 -0700
X-CSE-ConnectionGUID: 3MPY67c3Qii0X5+lIsPzQg==
X-CSE-MsgGUID: 2h5mbkFRR/KbGUrkxZweJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="253774659"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.22])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 09:44:30 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] intel-ci: Rename drm_buddy to gpu_buddy in blocklist
Date: Wed, 22 Jul 2026 18:44:17 +0200
Message-ID: <20260722164416.41225-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.55.0
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

The drm_buddy kunit test was renamed to gpu_buddy, but the blocklist
wasn't changed accordingly in the series where the renaming was done.
Change the name in the blocklist.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 80cc98608..8ac4147c5 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -29,7 +29,7 @@ igt@.*@i915.*
 # time on Intel CI
 #################################################################
 igt@dmabuf.*
-igt@drm_buddy
+igt@gpu_buddy
 igt@drm_mm
 igt@kms_selftest.*
 ##################################################################
-- 
2.55.0

