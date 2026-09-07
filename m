Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CD4C79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 12:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496E510E02A;
	Mon,  7 Sep 2026 12:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xhinxbyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0370110E02A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788785227; x=1820321227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FG5Uk8N6VVNusZ7fs7evzg9lfaqzaYAVSxmnZ2a4H5E=;
 b=Xhinxbyi1NrpWdArFCzKRW0AWMlHyrCuDIjgFNYYusyERJFFQsJO8khM
 pC35Oc3Hpj0MTx3PPWLp9R+joNxpkM+hqM/P9P0IjQOxG1XWi73PKusWc
 HV5GV8LwwNftujNvX6aJ1xmPALfN+3FAB9mZek9AacrMVV9/HIJ6u7wtf
 yFs5DLE5f+J+53vMfucMxDPj610V2uM/CyQXq1zTMnRAsgbmM9OzwEoWX
 Bz9RJpFnVaTOcJPxo1GhgfCkMgqbQlFbciPJjuSRdo5qgdQ0fKISoM1D7
 UZlf5NspQmghIksBxfktSPdSfbKKw0nr39tzYXeTWTOhtzQwXq9vtbY3l g==;
X-CSE-ConnectionGUID: vFqp3gehRQCAyiWLDaqxDw==
X-CSE-MsgGUID: 6aGbW9qFSym858wEM03Rlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="91697193"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="91697193"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:47:07 -0700
X-CSE-ConnectionGUID: pGSPOk9TQu+MNFupqI0Jpw==
X-CSE-MsgGUID: 5sm+h02pSn+NH6TJiCuPdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272631574"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:47:06 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v2 0/3] tests/intel/xe_sriov_mmio_regs: Add tests to verify
 registers on VFs
Date: Mon,  7 Sep 2026 14:46:55 +0200
Message-ID: <20260907124658.613244-1-lukasz.laguna@intel.com>
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
  lib/igt_sriov_device: Add helper to get SR-IOV function name
  intel-ci: Block igt@xe_sriov_mmio_regs.*

Piotr Piórkowski (1):
  tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs

 lib/igt_sriov_device.c           |  23 ++
 lib/igt_sriov_device.h           |   1 +
 tests/intel-ci/xe.blocklist.txt  |   1 +
 tests/intel/xe_sriov_mmio_regs.c | 408 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 5 files changed, 434 insertions(+)
 create mode 100644 tests/intel/xe_sriov_mmio_regs.c

-- 
2.43.0

