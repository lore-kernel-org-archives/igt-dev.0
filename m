Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79A4C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0AB112650;
	Tue, 30 Jan 2024 05:28:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF66112650
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706592506; x=1738128506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hAKZDLvh3JgWInH9zbze+LezSDbpNIwKds1sLpdM+w0=;
 b=m4McmWh9oBteTXF6Rhkc1ccmCg2Fg2sRFzutsoTDNVkvHwaqigMX9ZIp
 Sq2o4+V7udjQGhZ7VVBT2OQvtClGt2jPhosKNj64djvN13yNZlSjQJQVK
 kxcgxTT1Av7Pmvrfkpo6Ie20xXLFka9thwWSHiLMkMhlJfTsxTkWSTLsk
 Z2dFFGisu4klh6xZlCCzTnR5kHQic/86GL0HoAhS1mVEyKtfHgEwQF00N
 J0P98iwr8TMY3RCdhcYbkoTt0ikD2tDfvuxLvIkSVdaK9uXuaHo/2gTBG
 0AjZVOSH8oFqCj4p8l7f+2YpdN381Y2ExbzC1fi3Nl/bC9VDMm/8M1HaV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="434351195"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="434351195"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:28:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="36382616"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:28:25 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] HAX: please do not merge
Date: Tue, 30 Jan 2024 11:07:56 +0530
Message-Id: <20240130053756.1478286-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130053756.1478286-1-kunal1.joshi@intel.com>
References: <20240130053756.1478286-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Only for testing please don't merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 662e49cc3..d0a0a9df1 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,6 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_feature_discovery@display
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

