Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1B6CCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652CC10E399;
	Mon, 13 Oct 2025 13:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnPW+zvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D747F10E399
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362541; x=1791898541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MWmTtmwUdq0k268rs/QomVuAkahYOM3ifNsz9yFiVgc=;
 b=DnPW+zvYLKLp6xx1801szrLRoUnMNzMSwHTNhECLZD1FTn7EhCXbkJZs
 w3AN9V6aaY/BxOvlj7rHTqCt/h3TEqIy8WFbGLarA+Fr3ivPX2/Pt/c6T
 K4FAXfS3MyD//z1mfSoISwhUvuXUw5vRbmQGqg/l5on9WwcywPIh1+Fr+
 ZE2W41MfLF41d5WVxW+4lfpH0AakecjD35kVN8qzuEu9j/ZmHd/wV8vxb
 MokfMK8127PAkdsV+ypSBLEc3HYVdpwQkCF13l2GSCcSieoxniQBeNpNO
 rsKXTQAdP5JICjJeGXgWB2By3vM/YICm7ab+hvQpbyAdSe3dNUOM8obmP A==;
X-CSE-ConnectionGUID: N5p4OF0MRLygyzjKjK8d/A==
X-CSE-MsgGUID: 7mYBeOSjSbWjrQrRDXDGGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73106021"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73106021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:40 -0700
X-CSE-ConnectionGUID: QvlWio6bQjulZQgjVDa/fQ==
X-CSE-MsgGUID: r3CXQkfmRn23EZyphj7o1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180844517"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v10 0/3] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Mon, 13 Oct 2025 13:34:32 +0000
Message-ID: <20251013133439.543393-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

Patch 1 introduces a preemption capability check.
Patch 2 Adds kernel validation logic and kernel lookup.
Patch 3 removes redundant loop count logic for WMTP. Since WMTP uses a loop/SIP kernel
        and does not require a separate long kernel, the loop count assignment for
        WMTP is unnecessary and has been removed.
---
**Patch Summary:**

- **[PATCH 1/2]** tests/intel/xe_compute_preempt: Compute preemption check
  Adds preemption capability detection and kernel validation logic.


- **[PATCH 2/3]** igt/lib/intel_compute.c: Add kernel lookup and
 validation for compute IP versions

- **[PATCH 3/3]** igt/lib/intel_compute.c: Update loop count for WMTP
  Removes unnecessary loop count assignment for WMTP, which uses loop/SIP kernels

Sobin Thomas (3):
  tests/intel/xe_compute_preempt: Compute preemption check
  lib/intel/intel_compute: Add kernel validation for compute IP versions
  lib/intel_compute: Adjust long kernel usage for WMTP

 lib/intel_compute.c              | 168 ++++++++++++++++++++++++++-----
 lib/intel_compute.h              |  11 ++
 tests/intel/xe_compute_preempt.c |   6 ++
 3 files changed, 158 insertions(+), 27 deletions(-)

-- 
2.51.0

