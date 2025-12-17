Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBB4D64095
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 09:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED4A10E037;
	Wed, 17 Dec 2025 09:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n28978lB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ECD10E037
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765962578; x=1797498578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aA6g052eqPfR4MV+hUNUVaks3PDDqOzd4LK6Pq9CP2E=;
 b=n28978lBFkHJUJ+vKLsfn9878XITp/gB6DUwcogZ8obUt2comBN30Z3u
 dINuzAe8CTLihh2dZQT20NT09ar0FNwdxemWzQehsJE6HT8XAAFlMBpXv
 M98zdBA20q+/Ar0cHGkRPq4HbhunGY/nOBM+rsNny4tA4iZEy02SecYmk
 OZCB7Q4fDpy4BALZ6AlxXlkYZQ0QhoWpF+uPchyMELpkgrzPuZdSwKW+f
 VzSsk1BY86nkc9RSnwuZdqVrBQSA/F52Ls0cyQU85VhpUN5kU9eET+I/A
 bmtYIVsDIaUgxW5prdoYRWV8W9iFOkO2RBAJ5YNitg4TIKPDcaKPM/vJm Q==;
X-CSE-ConnectionGUID: aLO+SZMgTV65UjMbp2eurw==
X-CSE-MsgGUID: 0F30cbayT6aFY4O2MiAmlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67834381"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67834381"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:09:37 -0800
X-CSE-ConnectionGUID: kcGEqN/LSt2KRscrFPgs5g==
X-CSE-MsgGUID: nOZpnWGEQfW8kYZSus9e9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198011466"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:09:35 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v4 0/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Wed, 17 Dec 2025 14:31:47 +0530
Message-ID: <20251217090146.1558855-4-sk.anirban@intel.com>
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

Change throttle_basic_api to read the new atomic reasons attribute
instead of checking status and individual reason files separately.
This validates the kernel's TOCTOU-free throttling interface.

Sk Anirban (2):
  tests/intel/xe_gt_freq: Modify test to support new throttle reasons
    sysfs
  HAX: Add throttle_basic_api test to fast feedback list

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_gt_freq.c                 | 48 ++++++++----------------
 2 files changed, 16 insertions(+), 33 deletions(-)

-- 
2.43.0

