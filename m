Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4CACAC587
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 16:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5D10E12D;
	Thu, 11 Sep 2025 16:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zc7epAzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367A10E12D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757607421; x=1789143421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M3ga2Yp3LB2NBKI3eq8/9tNNY450uB34WAK8RxHgNyA=;
 b=Zc7epAzD3d7XiGxVqHBXXooiBi/gVv0m1+di1dIL0VyTwTJGo3bfL1lC
 VkVREf36L3XEtOqo1RucPxNNNPPyBswXnkMgYTu/M2lOZysmrCjQaVYmS
 Hkp6iMFOl/FoYsWVYJ0ZnoY2jOg8MRdMTj/LX1th0e/YKyg1MnD7lWK2I
 CQpLcF6qcLFz+YJ9SeQYB/BC1C3ka0HGzl5FlZs/vKqUAGIq5FSVotq2u
 GxZRfaxq2LUB4M1BLNlfZ6p1Gnsri8NSfVbxvTYBmwWmCm4z5YVl2CgVp
 89vBTCosi+jwR7m7HGbNSqPBbV9Wi88V2pZbKVhLp5RS4Mi/RcjKhZU88 A==;
X-CSE-ConnectionGUID: UDJN839CRuShr+heqc1zPw==
X-CSE-MsgGUID: qNMrdw3IT1Koaaev0zbskQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60055471"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="60055471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 09:17:00 -0700
X-CSE-ConnectionGUID: HgToj8S9Qy212J5j+61Hgg==
X-CSE-MsgGUID: YOHVrCgVQZeNlEnrMc+ndQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="174112524"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 09:17:01 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_evict_ccs: Adjust object size for
 non-resizable BAR
Date: Thu, 11 Sep 2025 16:16:52 +0000
Message-Id: <20250911161653.1870189-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum BAR size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

v5: Fixed review comment for igt warnings and commit subject. [kamil]
    Fixed the condition for user provided max size value. [kamil]

v6: Modified to adjust params only incase vram_mb <= 256MB. [kamil]

v7: Fixed print message after adjustment of object size. [kamil]

Sobin Thomas (1):
  tests/intel/xe_evict_ccs: Adjust object size for non-resizable BAR

 tests/intel/xe_evict_ccs.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_evict_ccs.c

-- 
2.34.1

