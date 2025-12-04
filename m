Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7047D1D86A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 06:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E48410E122;
	Thu,  4 Dec 2025 06:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIjxGm0x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C0510E122
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764829884; x=1796365884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+7wxOYFAfiQyuPtOipS++sCzkKg2U8M8xaqAYI87qvA=;
 b=cIjxGm0xFMxu+Ev1N+AEhdvSgnu18uCjd/cW7NNUocKe67UCkSV/7Ral
 qa8jyH7vtjv9HUZOLU/9qVnV5wqyQJWRX1ks0SDm5qX64Vim1JYjqUp02
 MjVcMX5hKe6EXimMaFsNkkFJdZOH1h4wDHP6xwaTIVNRm4ykC0arH9Adw
 LTzjmmrUUgjpk/ccrYAQCb4nTa4CEVZrl9n0REf+E3sRv1Uhaa6eDd8nb
 ZmY2Gim1UAbPzr6o+gJeBGjqykZ+Od5LEDPFVoxBGDUq8issGN+OcQjKp
 nr07WZUxBnBV/Mbk/0bbBXzGPMO0eBx4pbcB9aWmEgFXLj3XPltNJFOrj A==;
X-CSE-ConnectionGUID: 3nNHtpASR5yF//JXjLw2Vg==
X-CSE-MsgGUID: Tp1EjnoQT/m8j/CgdPQsKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70691567"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70691567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:31:24 -0800
X-CSE-ConnectionGUID: wte0plDiQZ26msuZA44sEA==
X-CSE-MsgGUID: LVSEfvLiSVWxHHBhN2Gqcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="200033516"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:31:21 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 0/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Thu,  4 Dec 2025 11:54:29 +0530
Message-ID: <20251204062428.401397-4-sk.anirban@intel.com>
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

 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/intel/xe_gt_freq.c                 | 51 ++++++++----------------
 2 files changed, 17 insertions(+), 35 deletions(-)

-- 
2.43.0

