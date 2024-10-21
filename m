Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C5D1712B
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 20:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BC410E3CD;
	Mon, 21 Oct 2024 20:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cElrlDYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD8710E3CD
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541268; x=1761077268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dZKNophUcl8UO/z+yP5xF/FafOm9ilbDvFko0pHsJpA=;
 b=cElrlDYc2S1c6YvhEA3Ntr0Tt651AuHYOEndpgANScLopAu/UCwA2yK/
 Wz9+/Tgt4PVgZ+G8uFlAb2H6oHr+WtQw4kEZtetwQ5vdRaKlGRd3jvRx1
 wPvaQVevq8B6P9Tg1BX5uEoGTMimxCz6E0GjpZfFAh4mLdd/i3V79Hz02
 B2nNWQCSbfC00uXNzrcCubu9oJkoWm78cxVe4Y65dFQRqynNCIu6CT9U7
 ywQvNCVft0rKh3mUAc9WtrUp3X01TgdR6ATQI6e+ZqJwIfggDKmLczJkR
 MhXwEX21+c+muQxvYfqwih9tnDlL01MGjo77A+SlGNw8uVG68ZCg0ml2j w==;
X-CSE-ConnectionGUID: 2oUKBM/jTHCPmwzwXR0VZA==
X-CSE-MsgGUID: TJ1GaeLASQWltYjmUzgUKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51591260"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51591260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:07:48 -0700
X-CSE-ConnectionGUID: KkTsN0L8RVqo8qzizkqRyQ==
X-CSE-MsgGUID: VygdySgHRSKHLpSzVd7yPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79568685"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.47])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:07:44 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/6] Introduce xe_sriov_flr test
Date: Mon, 21 Oct 2024 22:07:31 +0200
Message-Id: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
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

v2: Correct subtest run type, use uppercase for GT.
    Adjust pte_offsets, vf_lmem_size, mmio arrays to align VF index
    with array index.
    Add set_skip_reason, set_fail_reason helpers for readability.

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
 tests/intel/xe_sriov_flr.c | 936 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 4 files changed, 1023 insertions(+)
 create mode 100644 tests/intel/xe_sriov_flr.c

-- 
2.31.1

