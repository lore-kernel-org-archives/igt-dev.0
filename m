Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB95C3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 07:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1965710E177;
	Wed, 24 Jul 2024 07:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrKldTbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C36E10E1C7
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721805290; x=1753341290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mNqSKp/JovEsM6+EsQfCqGJbNb0FF7C0sl6c8vecgNk=;
 b=jrKldTbQZ1R+Q+FmohCToRKbs0pEi+hKazoaWq3II2g9R+qra+ZOafFu
 B+Qk69wYaqWscfNWUIqUMeqm4RCu430eNJ2CCW4tC18ISNY1vUGoSh9tc
 87+9b9zSQmnwBpyuQG5CeAQ70He/UqPai5GyxSBShk7ywlTYfx9lcnHWr
 K8lPiITZw28NR3WBxmKhezSeICohgSzy3ZE6aHGMNx2TaJrUnOIEhw7Km
 wI3yqZ+1z1JmcyG6iNSgmEm88anVQEABn37vKmv0qWhkASInhtlu22V5T
 QaTDq55P7xcXbbady+Dnyr3Eu1TeT6k3leOAa8vNbbqnQUim0ZdtNkl4b g==;
X-CSE-ConnectionGUID: JlBoU2E9S7Gut5in5peYVg==
X-CSE-MsgGUID: tBNCnD/jSDOuhzOYY55zWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19600625"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19600625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:14:50 -0700
X-CSE-ConnectionGUID: LIADai2PRvGTGce+UhkUyg==
X-CSE-MsgGUID: gK0dd2KQSgWABzWdfHpMZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52430127"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:14:48 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 2/2] HAX: Test rmfb tests in BAT
Date: Wed, 24 Jul 2024 12:35:44 +0530
Message-ID: <20240724070544.1734040-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
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
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..d3a27866e 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -128,6 +128,8 @@ igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@kms_psr@psr-primary-mmap-gtt
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
 igt@kms_setmode@basic-clone-single-crtc
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..d76ff236b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,8 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
 igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
 igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
 igt@xe_compute@compute-square
-- 
2.43.2

