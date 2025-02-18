Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B155C021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DD510E761;
	Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NtLi05KY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B57110E761
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910495; x=1771446495;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9UTW7DNUSa1gxOREkqLQRprUQUH2XJWTRB/traDMHCA=;
 b=NtLi05KY/kyoviSolq1YKacah0/Ugdj/6CktBgXnOaEEtBwyTZKDJ/nm
 zFIh3przGURPC3yDpWpUSu9y1DGYDy1uXti/CRHgril8ubVeCaZLOE2Mq
 A3InLOp4EKu5/V1sTayjzmthuzoKLcIe98NmrO8i/pfDjcxrOemH90gTb
 1AyOC3YiExJzR1uigLKGHqIs8qXHl8s16f6EURQzovlNRqBfUXX2QaDJE
 yLDa1jq99fOWGjyn0SM99Yxpi3QvhpuaBCuCtIJfBXsu1kCei9t/ATMm9
 NH3l0TBD84tfY14+jH4unPSLlvRpTOOUrzK5knNcCmsaHnVsc7jb3aJ14 w==;
X-CSE-ConnectionGUID: K3bX0HrXQuqEEpCEKgUvTQ==
X-CSE-MsgGUID: Pya2GQrNRXG0D++/IMgRpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545832"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: R25iVyFaSP6W7UdUmm00cg==
X-CSE-MsgGUID: fLKOTEVESRaHQCpGFwr4ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367433"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 00/14] CI run only
Date: Tue, 18 Feb 2025 12:27:58 -0800
Message-Id: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

CI, not for review

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (14):
  tests/intel/xe_oa: Use static for global variables
  tests/intel/xe_oa: Drop unused macro
  tests/intel/xe_oa: Rename oa_exp_1_millisec to oa_exponent_default
  tests/intel/xe_oa: Use default exponent for some tests
  tests/intel/xe_oa: Use same render copy width and height across tests
  tests/intel/xe_oa: Rewrite the polling small buf test
  tests/intel/xe_oa: Simplify the buffer-fill test
  tests/intel/xe_oa: Use default buffer size for non-zero reason
  tests/intel/xe_oa: Test oa buffer sizes
  tests/intel/xe_oa: Rewrite enable-disable test
  tests/intel/xe_oa: Enable unprivileged-single-ctx-counters and fix it
  tests/intel/xe_oa: Fix mmio_trigger_reports testing
  tests/intel/xe_oa: Set boundaries for OA exponent test
  tests/intel/xe_oa: Try largest buffer size and Xe1

 tests/intel/xe_oa.c | 574 ++++++++++++++++----------------------------
 1 file changed, 205 insertions(+), 369 deletions(-)

-- 
2.34.1

