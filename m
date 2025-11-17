Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45063CEBF61
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E780F10E03A;
	Mon, 17 Nov 2025 10:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPTngxBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB02510E03A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376555; x=1794912555;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=9w87ZscrCo8VuVlvZsFXhpwOf1z+h9kgHkjR5tHHbR4=;
 b=JPTngxBulLANjLuHX9eq51AcYRZT+eEKBdabud5DZXXp+ujK+bw1ubik
 9pRckJFyj/bPckf9Q9VtNevWcy+q/QRf94I9MteU6tuQ/aSzQK1N2K/pW
 y6yavqj17EsMLHaKvqukXkKGJfr7/QozAxYUcKwIVyC62qcySK9aqmqOo
 1g9gonnM39uju0UAdPwyJW7rSW1DEHFMndjkudME4roTfEA0wHFfYlYeZ
 9tsJby1X5YwS2ylcH8ky9dMJM58njI6mH6sGK6vZW2bKg6fvpf1+5Fu2h
 QYE2rdTE2GQ4NvHS9TMl0PezZrEpy4fJ3oRjPgzEQU2nay2FoxzEDPVSP Q==;
X-CSE-ConnectionGUID: 5zJMuyvkTlOmHZPC/fck5w==
X-CSE-MsgGUID: XgJ/N4HZT4S0ptTSEKgWNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306073"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:14 -0800
X-CSE-ConnectionGUID: aXkgVwoiQbKSMtkOp27eLQ==
X-CSE-MsgGUID: 0ml7Oq01SBujUDmhrq4aWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213817949"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:11 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 0/8] lib/xe/xe_query: implement few query helpers
Date: Mon, 17 Nov 2025 11:47:38 +0100
Message-Id: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEr9GmkC/32OwQ6CMBAFf8X0bJUWLODJ/zCGLGWRJlBwCwRC+
 HcLJw7G4xxm3luYQzLo2P20MMLRONNaD+H5xHQF9o3cFJ6ZDORNiEDxCbPPgDRnFdYdkuMpRGk
 UyiKRScG81hGWZtqTz5fnHBzynMDqagsNnesJobk24HqkzaiM61ua9w+j2Lw/c6PgAS9iJSCNI
 i3D+GFsj/VFtw3b5kZ5DMQ/AtIHUCuVg4JSaHEMrOv6BdwJ3vQTAQAA
X-Change-ID: 20251106-xe_query_helpers-9a49432d828d
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=9w87ZscrCo8VuVlvZsFXhpwOf1z+h9kgHkjR5tHHbR4=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1ihUHxxxC+fIMsqFce2y61RbfORTxuRI7nE
 1Hm6xxkwxWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9YgAKCRAjYrKT3hD9
 19oyC/9c67TmYbRM3wyfcldFBqUxAu1f4R104E0TBwQCAG+Ls9tjyyVeQ1j0Kwl4TNiGZaQlsiY
 tTJRLdLCgjT8iWtU9m8nV47y+S8OgUs3d26uuZXOmVqNkUyQNnG9uq7i6XVcfgCi6MeqSt/bXgO
 uV94dePkOXa1hEoyJp5K/OtJj3mTA/7j+gLDKNXgQnJltpdllXPFXF+9/JruQqLdzy6cg4oL/ax
 Cz4sq+ohQNWx10duG9+Sz6AzAyp2yfwfMVqVIB4mItWzJz2EMkMG1UUNrvft6QKl79Ye6ry/B0f
 UEz07Ju676BZZWOrr0i/vQgQCy7VcVoWYka5manoi9uEtBKof4/nv34PReWOZ2Ydzw31d94PvcD
 we/V28u8JorhJHlGgZJwcWdwREnqsFn37qtmXWV2AsgEUYkpS2wTzcmKC/y2ljO6YrEDxfCk3oj
 Tg/Bfh4mYg7aNkHyoSEBRXHwDSJJrhB3mrn7ugBy+kpymS7/YZTiBUVgCpG460WllZW+0=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

This patchset adds following helpers to xe_query library:
- xe_hwconfig_get_u32 - to get single value from hwconfig,
  similar helper exists in kernel,
- xe_query_device - encapsulates common code around DRM_IOCTL_XE_DEVICE_QUERY,
- xe_for_each_topology_mask - iterator for blob returned by DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
Beside adding helpers patchset also shows their usefullness.

Cleaner code and diffstat of 85 insertions vs 282 deletions hopefuly
proves usability of these helpers.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v3:
- added sanity check for len > 0 in xe_hwconfig_get_u32 (Priyanka),
- in xe_query_device treat returned query.size == 0 as unsupported query,
- with above change allow query for HWCONFIG to fail - case of old platforms (ADL-S),
- added R-B tag for patch 2,
- Link to v2: https://lore.kernel.org/r/20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com

Changes in v2:
- add xe_query_device arg to allow fail without assert,
  because EU_STALL and OA_UNITS are not implemented on old platforms,
- also return NULL if data size is 0 - case of hwconfig on old platforms,
- split first patch to implementation and conversion,
- Link to v1: https://lore.kernel.org/r/20251106-xe_query_helpers-v1-0-d761a944c237@intel.com

---
Andrzej Hajda (8):
      lib/xe_query: add helper to get first value of hwconfig
      tests/intel/xe_eudebug_online: use helper to get hwconfig value
      lib/xe/xe_query: introduce helper for device query
      lib/xe/xe_query: use recently introduced helper to query device
      lib/xe/xe_query: introduce iterator for GT topology masks
      tests/intel/xe_eudebug_online: use xe_query helpers for query GT topology
      tests/intel/xe_query: use xe_query helpers for query GT topology
      lib/xe/xe_oa: use xe_query helpers for query GT topology

 lib/xe/xe_oa.c                  |  37 ++-----
 lib/xe/xe_query.c               | 222 ++++++++++------------------------------
 lib/xe/xe_query.h               |   8 ++
 tests/intel/xe_eudebug_online.c |  41 +-------
 tests/intel/xe_query.c          |  69 +++----------
 5 files changed, 95 insertions(+), 282 deletions(-)
---
base-commit: 7810bd1660b760d468164e83ca7d980ec83231a0
change-id: 20251106-xe_query_helpers-9a49432d828d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

