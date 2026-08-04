Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC72C55172
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 07:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04BD10E105;
	Tue,  4 Aug 2026 07:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IM78Nkpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF310E105
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785828253; x=1817364253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vt8RgzaOU+MLtEfs+zqT+ENJO+SUfEWb8XbNLGImZNk=;
 b=IM78NkpxyUBx7L8eL9TnDMO9RR0o0iTkeLF41zVIPhtwpRhVocJwzBJr
 fGyxG0lfYcmw6lRwPVbrRdW/BuDIMdQwq2h6fhf951gsG/ImnrHUHzQGu
 ppG1AuqSYHOuJz99eVRK1zGZGe2BIBSpum7iyf0/nVlxa3XH+5XEkcxLK
 Khc5l2gWPISR8QL89NzxB1/147YUNSQk3aFy0wnI+AiaRPmdWji7YDAWB
 3F12vgom18d9qDsAfWCgWP/uCTCNeqmk/O1kbaP4w40iTBWpP9+IKT883
 rTaB4EqxJPS1iCRi1u2UCNSGGWiD2tluXCKnW/ZvncvEcGjhcYul/LPbg w==;
X-CSE-ConnectionGUID: yRC/bCG/RVOq+tYvl4E+4g==
X-CSE-MsgGUID: T+oweSfcQhaXaJtr6SNRqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86570597"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86570597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:24:12 -0700
X-CSE-ConnectionGUID: WZqBXPUvTmit9EkCI/7xAg==
X-CSE-MsgGUID: l1oIvUEgQjqGBJLGjG3HeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="259647273"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:24:11 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH 0/2] tests/intel/xe_sriov_ggtt: Add test checking GGTT accesses
Date: Tue,  4 Aug 2026 09:24:05 +0200
Message-ID: <20260804072407.1090889-1-lukasz.laguna@intel.com>
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

Add a test validating PTE ownership, accessibility, and modifiability
by PF and VFs.

The following scenarios are covered:
- pf-check-vfs-ids: verify VF ID assignment for each VF GGTT range,
- pf-check-vfs-pte: verify PF modifiability of VF PTEs,
- vfs-check-own-pte: verify VF modifiability of its own PTEs,
- vfs-check-other-vfs-pte: verify VF can't access other VFs PTEs,
- vfs-check-pf-pte: verify VF can't access PF PTEs

Lukasz Laguna (1):
  intel-ci: Block igt@xe_sriov_ggtt.*

Piotr Piórkowski (1):
  tests/intel/xe_sriov_ggtt: Add test checking GGTT accesses

 lib/xe/xe_ggtt.h                |   7 +
 tests/intel-ci/xe.blocklist.txt |   4 +
 tests/intel/xe_sriov_ggtt.c     | 757 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 4 files changed, 769 insertions(+)
 create mode 100644 tests/intel/xe_sriov_ggtt.c

-- 
2.43.0

