Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D71ACCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A70310E153;
	Mon, 13 Oct 2025 20:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVKOyvjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A7110E153
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387449; x=1791923449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o3HjziOP5IYETH21u9pAhnTIFguwPIynGjmCmVgj+MI=;
 b=gVKOyvjyZjTmZE2D8Vf7XUCZQfrgsGyTqEZFViznjq56z6HtWt2g9tD4
 6JT48IJtj5wngln/jxKGzemVQJsMkgDXv6L/3iSxh4h8eDen/MAhGwodc
 GMe2Lylnkc4ZpFqKytX/L4ek96+/e7vN/f+cC84rGwWaI/sppnzSs+ffC
 gSOqu0sRs+I27UZoG0iJcV1G7gmW3Ew6BPPrfXPSu1HUmeODzPZEqLM5q
 2dc7H5DwpfNo2lg3njHwDfJ+z61fU0n4DOal+3KWCIxiE5hCToakaT20V
 Xbm/eVwnRPsj8iikE4d9CG9i214EgJRlorlWhELdYR1udq6LXrVuc2FQX Q==;
X-CSE-ConnectionGUID: N/C6GnjmQbeaV31Fr4rOpg==
X-CSE-MsgGUID: bdwLVRI3RFOPamFmHYJdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641927"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641927"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: 4HLzZI1ZS+uKEilpNu0dWw==
X-CSE-MsgGUID: dsaYR/MWQ9SChBaqyAepqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924005"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t v2 00/18] Change OA IGT's to run on all OA units
Date: Mon, 13 Oct 2025 13:30:23 -0700
Message-ID: <20251013203042.925115-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Previously OA IGT's were running only on the OAG OA unit. This patchset
changes the tests so they can be run on any/all OA units. For example, on
BMG, the non-zero-reason-all test will now result in the following output:

	$ sudo ./build/tests/xe_oa --r non-zero-reason-all
	IGT-Version: 2.2-g30a56696e (x86_64) (Linux: 6.15.0+ x86_64)
	Using IGT_SRANDOM=1759524233 for randomisation
	Opened device: /dev/dri/card0
	Starting subtest: non-zero-reason-all
	Starting dynamic subtest: oag-0
	Dynamic subtest oag-0: SUCCESS (0.055s)
	Starting dynamic subtest: sag-1
	Dynamic subtest sag-1: SUCCESS (0.071s)
	Starting dynamic subtest: oam-2
	Dynamic subtest oam-2: SUCCESS (0.069s)
	Starting dynamic subtest: oam-3
	Dynamic subtest oam-3: SUCCESS (0.068s)
	Subtest non-zero-reason-all: SUCCESS (0.263s)

v2: Address code review comments from Umesh

Ashutosh Dixit (18):
  tests/intel/xe_oa: Add OAM formats to lnl_oa_formats
  tests/intel/xe_oa: Get rid of unnecessary
    DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE
  tests/intel/xe_oa: Rename nth_oa_unit to oa_unit_by_id
  tests/intel/xe_oa: Change oa_unit_engine to take an oa_unit argument
  tests/intel/xe_oa: Add oa_unit_by_type
  tests/intel/xe_oa: Add for_each_oa_unit
  tests/intel/xe_oa: Convert test_oa_formats to take an OA unit argument
  tests/intel/xe_oa: Convert several more tests to take OA unit
    arguments
  tests/intel/xe_oa: Convert test_non_zero_reason to take an OA unit
    argument
  tests/intel/xe_oa: Convert blocking/polling tests to take OA unit
    arguments
  tests/intel/xe_oa: Convert test_mi_rpc to take an OA unit argument
  tests/intel/xe_oa: Convert
    test_single_ctx_render_target_writes_a_counter
  tests/intel/xe_oa: Convert OA buffer mmap tests to take OA unit
    arguments
  tests/intel/xe_oa: Convert MMIO trigger tests to take OA unit
    arguments
  tests/intel/xe_oa: Convert sync tests to take OA unit arguments
  tests/intel/xe_oa: Run test_oa_unit_exclusive_stream on multiple OA
    units
  tests/intel/xe_oa: Add new non-zero-reason-all test
  tests/intel/xe_oa: Constify arguments to various functions

 tests/intel/xe_oa.c | 506 ++++++++++++++++++++++----------------------
 1 file changed, 256 insertions(+), 250 deletions(-)

-- 
2.48.1

