Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC31CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C028610E8A4;
	Wed, 10 Apr 2024 06:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6MVU6aP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA8F1131BC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730817; x=1744266817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wFkl4JD0g2No45Qx80hCPmnlbrUUOVwPOOx2a9EVPMI=;
 b=X6MVU6aPw4qp+Vf3kOXl7XuJeAhpn4XF+m4Upep+FtT8e5lHf+RoY75j
 PAUfEhevVB1HXf9x4ZWP0HAKVivhgYY92OUXKy9OToexy4YaUYgPR0t9q
 wPKpyNK4OPLN9nPAdAfe9+OFdrk7oTxHfwj5MBuBWLrAghVMoN2iIytsF
 kwIe7aWR0s3gRvbBTmvozCUiReQnpon/LsqKLxcKmZkfWPKVNvo7fL7v4
 +Q8RT2yW7+1QDOKp8EjfcdUvpocVMa29QH4Ijf7q8G7FX+tPAxIz0G8Qi
 ITEH8a/g9rKmzeC7g80bK+cUuaWKIIulLpSxretBjfWt9zNHkEPtzeWPy w==;
X-CSE-ConnectionGUID: K+TMkPW4RaChoHEr+06e1Q==
X-CSE-MsgGUID: njWiUW0sROiYTPHGhHqSZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948137"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:36 -0700
X-CSE-ConnectionGUID: jxmqlOlRSrK53uhVjF59MA==
X-CSE-MsgGUID: V++WlMK8RTetWJ1aSiwSGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138105"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:36 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/9] enhancements for forcing debugfs of connector
Date: Wed, 10 Apr 2024 12:14:17 +0530
Message-Id: <20240410064426.1968399-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

We have kmstest_force_connector that allows forcing a state
to status sysfs, use the same mechanism for debugfs as well.
Haven't reused the kmstest_force_connector as its used for sysfs
and wanted to have seperate flows for debugfs and sysfs.

patch series adds kmstest_force_connector_debugfs which allows
set value to particular debugfs of a connector, also it adds an exit
handler to clear the state at exit.

Kunal Joshi (9):
  lib/igt_kms: Refacror forced_connector struct
  lib/igt_kms: add forced_connectors_debugfs array
  lib/igt_kms: add enum kmstest_force_type
  lib/igt_kms: refactor helpers forced_connectors helpers
  lib/igt_kms: add igt_reset_connectors_debugfs
  lib/igt_kms: add exit handler function to clear force debugfs state
  lib/igt_kms: add kmstest_force_connector_debugfs
  tests/intel/km_big_joiner: use kmstest_force_connector_debugfs for
    better cleanup functionality
  lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status

 lib/igt_kms.c                | 203 +++++++++++++++++++++++++++--------
 lib/igt_kms.h                |  25 ++++-
 tests/intel/kms_big_joiner.c |  23 ++--
 3 files changed, 193 insertions(+), 58 deletions(-)

-- 
2.34.1

