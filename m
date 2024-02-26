Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0FFC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 07:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7510EEEC;
	Mon, 26 Feb 2024 07:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEsPdprX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B0710EEE8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 07:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708932408; x=1740468408;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ftnmka+vhpF3ToUfHCHBxc3B7Jp8dPab86LCTxRuI/4=;
 b=kEsPdprXk2Z0caq0tGhcU3UAH23qo4p2+0Ga5YpfzobCqwzI1jkU4rUp
 hrEBu5jstFAd0K0xCzjunOaBuAn7s5JdnlI5DBcS+KzxaqPPANOG5w9WR
 ymmqKntAblb0Va2/JL192TiCkAOjjedoFnNju7VT4kkexdNCSl7bZiRjZ
 C+eELRiHth4qyZUJfAZ3BloLDBzj7bJDr6T4UHxO4gbAklDp1alWhUDeJ
 3/QMxMQF8ERjrsAjJ0uAnpIV7VzOmgoRBRAm7Sew5Olz9DMXBBztIi/lW
 YOWHQCgWJSUXm3L8Gea/zvjD3BDhAQAcccHC6SKGBgwQ7kl9LDx9kczNd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="6147586"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6147586"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6923266"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:44 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v6 9/9] HAX/DO_NOT_MERGE: Test VRR in BAT
Date: Mon, 26 Feb 2024 12:50:35 +0530
Message-ID: <20240226072035.2620383-10-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
References: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
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
index be0965110..0b6623b18 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -129,6 +129,13 @@ igt@kms_psr@psr-cursor-plane-move
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
index 17863b6b1..cbc2b138d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -222,6 +222,13 @@ igt@kms_prop_blob@basic
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

