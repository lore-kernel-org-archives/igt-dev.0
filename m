Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3672CEDD80
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6439310E111;
	Wed,  9 Oct 2024 11:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7iMUJlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96610E111
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473425; x=1760009425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZMhXeR+L7C3kAvdBV4iFFJO+yXtLT3aDX5zXId58vJw=;
 b=e7iMUJlRvlf5msEfty7JOWatsc1V4yTf5dc65eWJvkBK7WBTZB0Lpkb7
 ZxcchPG0GSgdBLvfvMbLL47QUBbi7VnwfiVJyDXvgjnMs0t5k4A4pzwoP
 BULi6B/TLHM08qezMr/IMlfB6AlZZSv49by+DyFFp8nlBcr6amTplB6Ag
 5lXH3kEn79N1WuQnuu1ZRLWm4eZ+6VSv9JKTubcNTm5PqWWSZL9XgeXEx
 2aD/Ql26/bQDJi3e3Ch7pBjVE3DJfKFSsPBhz+Uhrs1QsnprOP9PEiEVr
 /1MSiwhtYXknWhKUwCaNAYZZPw8stNLNog/0ZdHI1NVn/OKthwkSbk2Tg Q==;
X-CSE-ConnectionGUID: g3I+jmq7Ql6lf3mRuHt99A==
X-CSE-MsgGUID: kqlW0alURne3NRIuQ+Ix6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27853158"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27853158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:24 -0700
X-CSE-ConnectionGUID: J/MnJ0j3SCGoP9n0oIVqmw==
X-CSE-MsgGUID: MBdaExyDSoayBzVVDRZVBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="75819429"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.16.246])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:22 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/6] Introduce xe_sriov_flr test
Date: Wed,  9 Oct 2024 13:30:12 +0200
Message-Id: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Introduce VF (Virtual Function) FLR (Function Level Reset) tests to
validate shared resource cleanup and ensure isolation across VFs (confirm
that one VF's FLR does not affect another VF's resources). To reduce
runtime perform a single FLR and verify all subchecks (clear-lmem,
clear-ggtt, clear-scratch-regs, clear-media-scratch-regs) in one go.
The proposed skeleton ensures that while one subcheck may stop due
to failure or a skip condition, other subchecks can continue execution.

The series includes:

lib/igt_sriov_device: Add helper for opening SR-IOV device sysfs
lib/igt_sriov_device: Add helper for resetting SR-IOV device

tests/intel/xe_sriov_flr: Add skeleton for clear and isolation tests
Introduce a skeleton and verify_flr method to orchestrate FLRs across VFs.

tests/intel/xe_sriov_flr: Implement clear-ggtt subcheck
Add GGTT subcheck to verify address resets post-FLR.

tests/intel/xe_sriov_flr: Implement clear-lmem subcheck
Add LMEM subcheck to validate VF memory clearing post-FLR.

tests/intel/xe_sriov_flr: Implement clear-scratch-regs and
                          clear-media-scratch-regs subchecks
Add subchecks to verify clearing of scratch and media scratch registers
post-FLR.

Example test output:

ATSM:~# xe_sriov_flr
IGT-Version: 1.29-gf1c71392e (x86_64) (Linux: 6.11.0-rc5-xe+ x86_64)
Using IGT_SRANDOM=1728461543 for randomisation
Opened device: /dev/dri/card1
Starting subtest: flr-vf1-clear
clear-ggtt: SUCCESS
clear-lmem: SUCCESS
clear-scratch-regs: SUCCESS
clear-media-scratch-regs: SKIP : No media GT
Subtest flr-vf1-clear: SUCCESS (7.506s)
Starting subtest: flr-each-isolation
clear-ggtt: SUCCESS
clear-lmem: SUCCESS
clear-scratch-regs: SUCCESS
clear-media-scratch-regs: SKIP : No media GT
Subtest flr-each-isolation: SUCCESS (11.797s)

Marcin Bernatowicz (6):
  lib/igt_sriov_device: add helper for opening SR-IOV device sysfs
  lib/igt_sriov_device: add helper for resetting SR-IOV device
  tests/intel/xe_sriov_flr: Add skeleton for clear and isolation tests
  tests/intel/xe_sriov_flr: Implement clear-ggtt subcheck
  tests/intel/xe_sriov_flr: Implement clear-lmem subcheck
  tests/intel/xe_sriov_flr: Implement clear-scratch-regs and
    clear-media-scratch-regs subchecks

 lib/igt_sriov_device.c     |  83 ++++
 lib/igt_sriov_device.h     |   3 +
 tests/intel/xe_sriov_flr.c | 911 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 4 files changed, 998 insertions(+)
 create mode 100644 tests/intel/xe_sriov_flr.c

-- 
2.31.1

