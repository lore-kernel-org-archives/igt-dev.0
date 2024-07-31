Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7289C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 06:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDDD10E129;
	Wed, 31 Jul 2024 06:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Odo6/vsa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB9010E129
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722407066; x=1753943066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=doBRhcjTjvo6Df/plzZM7n26C0A1Tqmvppc/+4yLRnM=;
 b=Odo6/vsaE7zWnrw4O3ONcVMJvahG9otgL0XcqCGoKTKXOqYi0jFkQKug
 03oecKF78RKEqASk5yen1nomhBeN2d6MUHQT0F4ZdWjZQncK6ZpbukOLa
 T4TXTigPR6PR48YROxUYgXdFtV8v7s7AOiq4n8Ew9IqSkez/kE4xmRMpq
 ri2MYST/pxCDwhY0Wghny0gex/bpO0FEHPkLkXdourYQ8qHG49Hm6Bqik
 AuNKhj+hvz5Jb68e3IjTJkoE2iU9z5SQy+4xqXNuxSYiji9JqiyE3yHpx
 bYe0VrP4hT+PmxOUVp0ZjAdiYSe0BMU9NVyYdrgv/gx5shtJY94WI/167 w==;
X-CSE-ConnectionGUID: OjHMr6ACSVS/rd9PeLcFZA==
X-CSE-MsgGUID: cVew4+wMTri9I0zQesPa1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="45681049"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="45681049"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 23:24:25 -0700
X-CSE-ConnectionGUID: 2P5hssZ3TvCrt5lFVyeDDg==
X-CSE-MsgGUID: 8JQA19XLQ9qWKwPGMVuwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="58911056"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 23:24:24 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t] tests/intel-ci/xe: Block kms_rmfb@close-fd test
Date: Wed, 31 Jul 2024 11:45:12 +0530
Message-ID: <20240731061512.1954095-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Upon reopening the driver, the 'kms_rmfb@close-fd' test expects
that 'getcrtc' should return an FB ID of 0. However, due to the
default modeset, 'getcrtc' always returns a non-zero FB ID, which
is expected behavior.

In the case of the i915 driver, the 'i915_gem_drop_caches' clears
the cache and sets the FB ID to 0. Currently, there is no equivalent
mechanism in the XE driver.

Therefore, we should block this test from XE execution until an
alternative solution is implemented.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f9ef612c4..4ee8fb0d4 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -78,6 +78,10 @@ igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
 # KMS: Yet to add/missing XE support
 ##################################################################
 igt@kms_prime@.*
+
+# Expected failure on XE:
+# https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
+igt@kms_rmfb@close-fd
 ##################################################################
 # KMS: Non-Intel tests
 ##################################################################
-- 
2.43.2

