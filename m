Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4908C3DA45
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 15:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C82910E26A;
	Thu, 11 Jul 2024 15:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1cTNeDM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7CD10E26A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720710983; x=1752246983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7MF5Z+lHvmP3uigq6JjjXoRCnY0rh7cLNXqheTFv3rE=;
 b=k1cTNeDMSCanLC+K3QvTTXtSLdPYdCvF6hNKOTMoDsCzAOZIErNJ2lUo
 QhwuSOysyqJ1j1Xx6W3mNL24MbPZhjoxHiC/+oSLi5jnxsLN5JZZs88/9
 F9AA1qeFs3/J1hXIORtyfwjBnsIySrL+LYqC6ddw+NW9QxfX9fgOh19Fk
 7uJcofh0FIJ+Q8sCHRjSOAF1/1SX4mpCetkRQjwb0L5Ll6vAq5yaC5E0O
 ORn9b1bDqZ82FxrOf5tH64+cn+aT3pXVtf0hx6Fm0WFHxoyXR4W64SoQP
 524R+TiUwyTPjbI/15S9AzMaN7sLVubDdIfh+ofvjNqMYqyHLXD4qIw3y Q==;
X-CSE-ConnectionGUID: WzUhxqtZQ6yvDPhI2INaew==
X-CSE-MsgGUID: hwUUMG+YQyqhQwn2toANVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="40616682"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="40616682"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 08:14:44 -0700
X-CSE-ConnectionGUID: Quo6Sy1IQ1KrohXKC4DHEA==
X-CSE-MsgGUID: 3slbfYwBRzKsblIZ0a7+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="52895358"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 08:14:41 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, kamil.konieczny@linux.intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH v3 i-g-t] tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress
 tests
Date: Thu, 11 Jul 2024 17:14:37 +0200
Message-Id: <20240711151437.996509-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Blocklist certain sriov_basic tests identified as overly stressful or
time-consuming to be executed with all dynamic subtests at once.
However, these dynamic subtests can still be executed via testlists
(refer to the BAT example below).

Included in the blocklist to prevent simultaneous execution of all
dynamic subtests:
 igt@sriov_basic@enable-vfs-autoprobe-on
 igt@sriov_basic@enable-vfs-bind-unbind-each
 igt@sriov_basic@bind-unbind-vf

Tests retained for execution:

BAT:
 igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
 igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1

FULL:
 igt@sriov_basic@enable-vfs-autoprobe-off
 igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all

v2: - improve description (Jonathan)
    - add missing '$' at the end of enable-vfs-autoprobe-on,
      bind-unbind-vf to prevent blocking dynamic subtests on testlists
v3: - resolve merge conflicts

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index dd7c05041..f9ef612c4 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -83,9 +83,10 @@ igt@kms_prime@.*
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
 ##################################################################
-# SR-IOV tests that are too stressful or time-consuming
+# SR-IOV tests too stressful or time-consuming
+# to execute all dynamic subtests at once.
 ##################################################################
-igt@sriov_basic@enable-vfs-autoprobe-on
+igt@sriov_basic@enable-vfs-autoprobe-on$
 igt@sriov_basic@enable-vfs-bind-unbind-each$
-igt@sriov_basic@bind-unbind-vf
+igt@sriov_basic@bind-unbind-vf$
 ##################################################################
-- 
2.31.1

