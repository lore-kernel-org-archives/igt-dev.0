Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F21BC982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 06:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350D10E41C;
	Tue, 22 Sep 2026 06:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHwbxiF6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6510E41C
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 06:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790059941; x=1821595941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zmNv2lK0ZmifnddQshz8oYe3l/EPiK/I4ggSMzm8FPw=;
 b=jHwbxiF6BHF+lNzwKmM1og+d3oL733sFL9tlbtWROEFY3AwBu6qQnpOd
 1Lu50MCQCEgFMi3hnkCmCJo6zLKZACLxy+U0EYmmb9IOI52IBjUvG8/Ot
 eHMfaaHuNYt1CUWTsxb+lFIPF+PwUWnjAvhTnHQLmnkuPB0GQrEUwkKU1
 UcVE0rthdWiROvkIeeM4Nfd/+0kR2Of+0jRn2ev9SY2Z59jZAaq+O1IoR
 31eA5eYnoDU+BCBAdHmCw7Ke+wIHV/0QwmmRHJy8p0DXp1x4MVsttVwHM
 3XBsRds0SdZVVSA8z/MeTdFKe0bfAk9/EwSPetunb4W4pjWrUStFZh1VL g==;
X-CSE-ConnectionGUID: y2S4IbdmQGyMLhQhBh8b1g==
X-CSE-MsgGUID: lzWVnBA6SeKriTkn7bZMzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="108132386"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="108132386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 23:52:20 -0700
X-CSE-ConnectionGUID: bWaJUZb0Ri2Ll4jw31mfTw==
X-CSE-MsgGUID: ZtRghD8xQr2rPH2uHwgAnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="271545105"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 23:52:18 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v3 0/3] tests/intel/xe_sriov_mmio_regs: Add tests to verify
 registers on VFs
Date: Tue, 22 Sep 2026 08:52:08 +0200
Message-ID: <20260922065211.3004767-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

In case of SR-IOV, the VF has limited access to the registers. Let's add
tests to verify that the VF actually has access only to the allowed list
of registers, and verify that registers dedicated to VFs work properly.

Lukasz Laguna (2):
  lib/igt_sriov_device: Add helpers to get SR-IOV function name
  intel-ci: Block igt@xe_sriov_mmio_regs.*

Piotr Piórkowski (1):
  tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs

 lib/igt_sriov_device.c           |  53 +++-
 lib/igt_sriov_device.h           |   2 +
 tests/intel-ci/xe.blocklist.txt  |   1 +
 tests/intel/xe_sriov_mmio_regs.c | 408 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 5 files changed, 462 insertions(+), 3 deletions(-)
 create mode 100644 tests/intel/xe_sriov_mmio_regs.c

-- 
2.43.0

