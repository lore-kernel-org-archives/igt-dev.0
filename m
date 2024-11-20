Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A09D63923
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 10:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2A110E6E6;
	Wed, 20 Nov 2024 10:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tm/x+hce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C8D10E6E6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732098921; x=1763634921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sOmlfx9Kico9ozib8JRps1aMKUuX6uk3dlI4fcxTqJ0=;
 b=Tm/x+hce+iXvetn4zhcrIzHMjMgzc1jimiddfAG6ZYUGBLcROeYYDb2D
 xyjIT31CNeKYHhabJshx/MpkTwY/FGR8p1BhP5T0UDK8Mv1MgctAKQ1Lk
 H5ApBRHUMqhu0hZJetTnBWSWQs5GMzCfdxPZZTBD/fyIYFx1oqBahppOV
 bACtbindTNLbzfHBPAwYflro1QF2YaXyOeE5TglOXjiOSaIddcXKRyACb
 UKvXWYPzGpk9yZgonET3PMhK5tyECCGYqQQlC8laHMPrTTFE6FUKVY2Mq
 wMJ4HIRyNrQcOioFQhI7W1SWfgUh+BhIzulSeFOtxjoSjpynjKl/tXC1b A==;
X-CSE-ConnectionGUID: lcjuOipGSzu6a5JqF9BF+Q==
X-CSE-MsgGUID: u5qBU/MRRHOQjcAPpX5YGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="36056305"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="36056305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:35:21 -0800
X-CSE-ConnectionGUID: 4ezJp1SCSO2fdc7Imk47fg==
X-CSE-MsgGUID: T0KapTqVQpWMRe4aR3pWMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="127410360"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.31])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:35:19 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 1/2] HAX/DO_NOT_MERGE: Add wait-zero-handles to fast
 feedback list
Date: Wed, 20 Nov 2024 11:35:06 +0100
Message-ID: <20241120103507.7653-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
References: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
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

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 tests/intel-ci/xe.blocklist.txt          | 1 -
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..cf3a9d9b1 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@syncobj_wait@wait-zero-handles
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..b9f4d8700 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@syncobj_wait@wait-zero-handles
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f9ef612c4..3997adda7 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -38,7 +38,6 @@ igt@drm_read
 igt@dumb.*
 igt@prime_.*
 igt@sw_sync
-igt@syncobj_.*
 igt@template
 igt@tools_test
 ##################################################################
-- 
2.45.2

