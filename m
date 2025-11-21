Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1D9CFA778
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7263810E853;
	Fri, 21 Nov 2025 11:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QlPBVd8P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C314A10E851
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763722831; x=1795258831;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=Evj4lKt0V4Vx3i79OigxiPIdBwzbpz32uAGSb6DaEIU=;
 b=QlPBVd8PQk25M7poG5C+Kn1rTG0kPxBqly7da69uejFgzlqsP+fML5q6
 EoFCv+9hDylLUIS15P334FmVFLJnfGE1l2PqUHiS7T1BxPBd7gcLoeb7g
 eXdZZTTrZfn8RE65zx7lkokZWQF+GUmM06+0ecrQCEIk9PfXfUl4jahxD
 bq8eWr72exFFoZAwCGZhd7Q3IiEZyu7akOllBbu95Y22RefTRX1dgTMXY
 JXzVBLh1SmkeIzhkuqN09rbCmE9KthdbhAxETQfPbIKepX4ht2pbliEHc
 fr37Q78Yq4EJLSJRfMs2rZlW2LmWpRf4XY4Eci5KS7iJ+GylDn8hrfF2A g==;
X-CSE-ConnectionGUID: E7VUei6iRkKFjTnyi99sEQ==
X-CSE-MsgGUID: f+2RAEmeTC+IW0kqRtmNaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83203544"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83203544"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:28 -0800
X-CSE-ConnectionGUID: 2qZ7TLwhSkWzbP/VHrUoDA==
X-CSE-MsgGUID: 7CC3dV6nTj+0zQdu6QzaoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195953829"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:26 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 0/5] lib/xe/xe_query: implement few query helpers
Date: Fri, 21 Nov 2025 11:58:59 +0100
Message-Id: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPNFIGkC/33OzY7CIBQF4FcxrIcRKKXFle8xmZhb7nVKYn+E2
 mhM333AVWMal2dxvnOeLFLwFNlh92SBZh/90KdQfu2Ya6H/I+4xZaaEKqUUht/pdL1ReJxauow
 UIregrS4U1qpGlmpjoLO/v8if35QbiMSbAL1rM3Qb4xQIun0HcaKQG62P0xAerw+zzL0Pc7Pkg
 mNlJFitnSqqo+8nuny7oWN5blZroNoAVALIGdOAgbN08h0oVoDcAooEqBJtrYHK2jXvgF4BSmw
 AOgOEBp3QiFavgWVZ/gHv3Rx5lQEAAA==
X-Change-ID: 20251106-xe_query_helpers-9a49432d828d
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Evj4lKt0V4Vx3i79OigxiPIdBwzbpz32uAGSb6DaEIU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpIEYEZoGs/AizKW4A3xJ+JoXTmmDeeGlUroXYO
 e1BLkBDgHmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSBGBAAKCRAjYrKT3hD9
 1962C/9gyZouZrA/fFEL8digHR+k3BbTP1xYRsoOdOBieN38fgm/ab7Pd7YVHccYaSWPifIdTOP
 57xyTGWvgvlhtkMiC1g5R86M82OrGsg5jj2UbMz1F5uNRSEzQ9RrUZ53dwmc//rB8hKq/08ora2
 hUNw9Tt9lI5gqQv1y/9fxEm9R2gyDKY/AiExfH+KrDORaZiLwk+89zfd46CigxIUTK/On94PufH
 MhkzOHX2rm/c2UwZDLW/fREDK6fDkDbqpPIUQJtN7igOiAXagoeoY4xAsiX0St42ihPAqUB8U7E
 y/g6/pofLoDx08p1HKKJ1gyl6AycYNlvmqN0qCGM0zuqiunMX2V8cqRUR4eTcW8/OftZP6R31u7
 0cJOHKgrrJ1k/s7euNvjzlom34Pg8plWo51i87ZdZTLlHspmGLo2IR1dv6+nhke1TwxQNJJHeUV
 WtULr0okaPxlbytBcRVgQZa9ts8j9g6WNMTAwffgM72B5KuAT/n51lkTGCHMxCv4XEGTk=
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
- xe_query_device - encapsulates common code around DRM_IOCTL_XE_DEVICE_QUERY,
- xe_for_each_topology_mask - iterator for blob returned by DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
Beside adding helpers patchset also shows their usefullness.

Cleaner code and diffstat of 85 insertions vs 282 deletions hopefuly
proves usability of these helpers.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v5:
- Dropped patch adding xe_hwconfig_get_u32 - similar helper was just merged
- Rebased - to solve recent conflicts
- Link to v4: https://lore.kernel.org/r/20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com

Changes in v4:
- removed can_fail arg from xe_query_device and add xe_query_device_may_fail,
- squashed last three patches into one,
- added tags,
- Link to v3: https://lore.kernel.org/r/20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com

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
Andrzej Hajda (5):
      tests/intel/xe_eudebug_online: use helper to get hwconfig value
      lib/xe/xe_query: introduce helpers for device query
      lib/xe/xe_query: use recently introduced helper to query device
      lib/xe/xe_query: introduce iterator for GT topology masks
      xe/treewide: use xe_query helpers for query GT topology

 lib/xe/xe_oa.c                  |  37 ++------
 lib/xe/xe_query.c               | 203 +++++++---------------------------------
 lib/xe/xe_query.h               |  26 +++++
 tests/intel/xe_eudebug_online.c |  41 +-------
 tests/intel/xe_query.c          |  69 ++++----------
 5 files changed, 93 insertions(+), 283 deletions(-)
---
base-commit: 7bc8d310594c1dc1a851451845d1ea3c15fbd53d
change-id: 20251106-xe_query_helpers-9a49432d828d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

