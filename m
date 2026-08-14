Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DB1C5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 16:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3DC10E11F;
	Fri, 14 Aug 2026 16:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijW+QAIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9833F10E17B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786723610; x=1818259610;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7v5hrt4u++VZNJ9XzFQ7+8lMJX01yB4Xa7ysc3+0v9k=;
 b=ijW+QAILVS2T7lorizevuopsqlt9kazf8G75S6DRnG8jLTSHcq+UjFou
 t5Gv0pd/ZBeR1Z8iA8de/trso+SWG562oFQ5IZvVsZ15ZRMlivPbl20qE
 o2w0loM31l8iyCnZtH+uuEDEpljLaWcXUhWeiBsxvXWRbNKHU8SiUzrPM
 GqeuDzwT00jUjjGfrmMqSMM3PoXWw375tAWiHTZXyXopB62oqs9HCOovI
 GFl6FBJ6kxRCdLvTkjbPZd0scjndnx43DzOeCDBMfXwmYKdmPbDM/fJty
 RV1suEMb9YCHR9q3VJPqkClEzn8J9eai09TVKFP9rY2L4iAwMroAnTY3a A==;
X-CSE-ConnectionGUID: m0ybNXiVTvCIsocN6XnSJw==
X-CSE-MsgGUID: Z7cYKrqWRIK3gu40Iq/ZEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97893310"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97893310"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:06:50 -0700
X-CSE-ConnectionGUID: MHdoJmbrSXS8lKsZDpiYmQ==
X-CSE-MsgGUID: ZfeYkRV5QrWi9WA5DtLZ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="289059935"
Received: from unknown (HELO himanshu-H97M-D3H.iind.intel.com) ([10.223.55.10])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2026 09:06:49 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Subject: [PATCH i-g-t 0/2] Add CRI blocklist & enable CI execution
Date: Fri, 14 Aug 2026 21:36:46 +0530
Message-ID: <20260814160648.19715-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

This series adds execution support for the CRI platform.

Patch 1 introduces xe.cri.core.blocklist.txt with CRI-specific core
test exclusions and registers it in meson.build.

Patch 2 adds the xe.cri.core.blocklist to config.json which generates
testlist for CI execution.

Himanshu Girotra (2):
  intel-ci: Add CRI core blocklist
  intel-ci: Add xe.cri.core.blocklist to config.json

 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe.cri.core.blocklist.txt | 53 ++++++++++++++++++++++++
 tests/intel/xe_test_config.json          |  1 +
 3 files changed, 55 insertions(+)
 create mode 100644 tests/intel-ci/xe.cri.core.blocklist.txt

-- 
2.50.1

