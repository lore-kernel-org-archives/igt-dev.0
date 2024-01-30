Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81567C47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8F6112DBF;
	Tue, 30 Jan 2024 05:49:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2849F112DBE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706593769; x=1738129769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KugiOVx5smRX24FXRXNpbvfPiUuVOt4OSVWWEwlfek=;
 b=TwpF53vp0jHQsAcbwP36vMzRiV46bE2BxCj+5j9XTOP9sU7w7hx9kjJJ
 UNKcZUHlUiOWLPl+eiBC0ZvetNQ6w0XtUJaOa/GUSaDORDH/5qpXCOdpC
 Tk9rJ9mE+FLYKaEXMvj2Q11O0SDkej7e3P4kMguX+WeFb8+fgIQQ6U8hC
 Szl4njmMXRwCCSUSvsmr7rQQAKqxjG5N0/N74k53/v1h5UIZ9HcQlnWrB
 +HNfxxIPd8/2RmsnENr2W4aUgk9fpATBKaEwsjx9zntBBmpuczrR3fD8f
 NPu5r+Glr9DLaqQvtp25aOLExZjOu9IUVKHvqMpFzLOhwkklgqSXj+QO9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393609686"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393609686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3603194"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:27 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v5 9/9] HAX/DO_NOT_MERGE: Test VRR in BAT
Date: Tue, 30 Jan 2024 11:12:35 +0530
Message-ID: <20240130054235.533132-10-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
References: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 7 +++++++
 tests/intel-ci/xe-fast-feedback.testlist | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 662e49cc3..aac1b39c9 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -128,6 +128,13 @@ igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@kms_psr@psr-primary-mmap-gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr@flip-basic
+igt@kms_vrr@flipline
+igt@kms_vrr@negative-basic
+igt@kms_vrr@max-min
+igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@flip-basic-fastset
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f297fe965..f28d6c82f 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -220,6 +220,13 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@kms_vrr@flip-basic
+igt@kms_vrr@flipline
+igt@kms_vrr@negative-basic
+igt@kms_vrr@max-min
+igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@flip-basic-fastset
 
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
-- 
2.43.0

