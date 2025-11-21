Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850F2CFC267
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DFD89F49;
	Fri, 21 Nov 2025 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcRQt8WY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9137689F49
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763727882; x=1795263882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h8bPypiuvaYpYrUnVLhh+K13zTBwgYkxelFInzXQL6I=;
 b=dcRQt8WYTG5nIeffL/nsgMtSIo2hDTAhRDaY8LdtJI71ODF4FH5QWoai
 3/zRRLVwEiKfl6vGTlPW5yG6xkxMJvAKcpG768gG8RZ02rr7ZJ2QjkYC9
 O2rrewZKNMB0eAXBKZlfJuZ42MDJhsFo+OYn11kqu4+soSUYin1AdMh0W
 yQ2jXpWYuF8w3+XZJnsI8M08NxwowWMmiCZM0gkGSY7LAl6F98aTr/zF1
 R/MZ0ViLDMxv/3VSWOX+hFJRN+skwgJFpebiM42M2+v1LrnNi5OMOuOFY
 PzW0ecbZk/qtKpKt0BPVN1aaLvoVtTTkzCKuUdj5ZH7+xNguPc6AvnAjL g==;
X-CSE-ConnectionGUID: yQ+EW31KQMeJ0kiEhNU/4w==
X-CSE-MsgGUID: v4TQuzR7TOSgGmHoIFblTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77289564"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77289564"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:24:42 -0800
X-CSE-ConnectionGUID: q6o2yjGYRP6jAs0Y3JFjgg==
X-CSE-MsgGUID: QQqhgjfMRyOLUwlLWKfjIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215047334"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:24:40 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/6] Update sharpness filter test and related CI/lib
 changes
Date: Fri, 21 Nov 2025 18:01:28 +0530
Message-Id: <20251121123134.1099006-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Update sharpness filter test and apply necessary CI/lib adjustments.

Swati Sharma (6):
  intel-ci: Add sharpness filter chamelium test
  intel-ci: Add sharpness filter tests to i915 blocklist
  tests: Move kms_sharpness_filter to tests/intel/
  lib/kms: Refactor get_num_scalers() using read_pipe_info()
  lib/kms: Add helper to detect presence of scaler blocks
  tests/intel/kms_sharpness_filter: Skip pipes without sharpness-capable
    scaler[1]

 lib/igt_kms.c                               | 69 +++++++++++++++------
 lib/igt_kms.h                               |  1 +
 tests/intel-ci/i915.blocklist.txt           |  2 +
 tests/intel-ci/i915.chamelium-only.testlist |  1 +
 tests/{ => intel}/kms_sharpness_filter.c    |  6 ++
 tests/meson.build                           |  2 +-
 6 files changed, 62 insertions(+), 19 deletions(-)
 rename tests/{ => intel}/kms_sharpness_filter.c (99%)

-- 
2.25.1

