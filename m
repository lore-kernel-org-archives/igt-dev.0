Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021FECCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 10:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADF210E072;
	Thu, 16 Oct 2025 10:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPRQLGLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEED10E072
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760610785; x=1792146785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sbf4O1HRjy2osd1GKnMK6fstAJmMIOCJrg9+dvGVbD0=;
 b=cPRQLGLXwToOAYS8EdM75d9dBDC61CK4qYT60svLu5+RQKjAURrCgV9x
 3Aosa4GzwF17itAtxZxV9NMtkwydkV7J6rI2T5tWYPVAAEmCtC1iFCIPR
 NNKsyJQq5GbToHbYLjzNeyr99G6InrBqTS3YUKGR6qrAmQvNRQXKBqwJG
 04IH8wxhCCYQEponJubd7TIa9oZSS8BKqPkMpSde+1ouVGXO29/K9vMkq
 lzKHiVwp7vVwYc7zmB1iDUyVODJAxX/4hspF/1AjcmsMggAjdaFsFkaI2
 NiL24LMXbPF2Us/3WqPbU7Zjyj93Ylz+ah8oDKadIQ2ak17xJHa21zyjb g==;
X-CSE-ConnectionGUID: 6WOBzRO5R6S20a4K+Mmahg==
X-CSE-MsgGUID: zN9WhFkXTQSTAncO3BrVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62843421"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62843421"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:33:04 -0700
X-CSE-ConnectionGUID: pOvChDcpRKaAXlJAYGm55w==
X-CSE-MsgGUID: F2ZEDGhDR1GXUJNaxHE77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="219584497"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:33:02 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] Fix frequency assertion when RPe raises min frequency
Date: Thu, 16 Oct 2025 15:59:36 +0530
Message-ID: <20251016102935.1935374-4-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

When running workloads, RPe may dynamically raise the minimum frequency
above the original value. To handle this, set the maximum frequency to
current minimum instead of the original minimum.

Sk Anirban (2):
  tests/intel/xe_pmu: Fix frequency assertion when RPe raises min
    frequency
  HAX: Add gt-frequency test to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 tests/intel/xe_pmu.c                     | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.43.0

