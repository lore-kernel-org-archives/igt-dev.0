Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBF7C61DC2
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 08:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D78910EC49;
	Wed, 26 Aug 2026 08:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fp3b8HtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E120610EBF2
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787733456; x=1819269456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9m4KChpOCvDm2yZdwm5eg/8r/Uq8SZNNDqWtuhO/wJ8=;
 b=fp3b8HtYk1CHcZweJ7DNQJiXam9Yw3l2y3iUKqElMVkPspLouk6Vyyp3
 A2hy5G+h8cZh1O9GREf4L3s92ugF0TfLCTrO596jH9n+/U2Zxh54YdCna
 pwtqfyjjei9Jt1b0juulbHHzkLLr+nTqthY1ZtaZYNiczPeQa8vo96PDj
 0bN0HSK9eouH0rVsTBLH+KQIduqHJJvT/bui8IHk7e4jDouhwstVG8Cef
 tOvpsbxzWGE+cBfBYgBYTWbZ+C9XzTBgSZ8gPgZmlu4G1VncY/6TMCbQJ
 NvaHh/HerShoH0PsW214WC1pc7tZv2c6ox6dIJzniIVsqOsmJA0ddUMIp Q==;
X-CSE-ConnectionGUID: kYQ3PwERSiq8OMp40yPf9A==
X-CSE-MsgGUID: uzmYUhivQtaqDCzuJ+BwlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88088434"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88088434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:37:35 -0700
X-CSE-ConnectionGUID: OrilJP6lTBOS8/ZIaqMgkA==
X-CSE-MsgGUID: kx6Tc+erQfygXuilgsPGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="266940006"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:37:34 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v1 0/3] tests/intel/xe_sriov_mmio_regs: Add tests to verify
 registers on VFs
Date: Wed, 26 Aug 2026 10:37:27 +0200
Message-ID: <20260826083730.2750-1-lukasz.laguna@intel.com>
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
 tests/intel/xe_sriov_mmio_regs.c | 406 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 5 files changed, 432 insertions(+)
 create mode 100644 tests/intel/xe_sriov_mmio_regs.c

-- 
2.43.0

