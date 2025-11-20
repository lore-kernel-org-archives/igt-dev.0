Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D7ACF8863
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 14:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186F610E2A9;
	Thu, 20 Nov 2025 14:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aq0z8s6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D5110E2A9
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763648887; x=1795184887;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=UW5znf71wLrWcIXfVZnUCBxOowiAxEXFgVyeNEGcMP8=;
 b=Aq0z8s6pGkPeS6p1o00V0gA0SqcctqHQwTW+L60UgXpHc/58iLzYOFsZ
 biG7GgYHp1qFSkBNdudwqqHDr43L0rkh8nTBvjLXmwvEotQtbvGvffv+N
 ZHTurZ/CPws6Nlk5o/ySz52TuqWShM1Oxjem+v2vbY+4ki6BSC3/Ew0Xy
 Vn3gcBuP8ZUNrDHt+DvDHBsjptCt02pD+UmDwJIDnPbcjykVF1Aj1a7jN
 krZOOVR3k/T38WyiQ7EcvQGc7URra8hDH2c9HJSszFOMp2CRQ1tnn5z1r
 8Kp+5YAugFQgzylLtWZAAjh6RYhzHeIdDpq+hIcixtx49c9vnZnWIH/X4 g==;
X-CSE-ConnectionGUID: eQ5eZSi4TMKf21Hb+19MvQ==
X-CSE-MsgGUID: ueJjWTjAQDqjJ0Qre1U3vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76824120"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76824120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:06 -0800
X-CSE-ConnectionGUID: TZtR9gaPT7mBGrpsVmsHoQ==
X-CSE-MsgGUID: 4M3BEvnoRFiJKMFXJ/sr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191057628"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:04 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v4 0/6] lib/xe/xe_query: implement few query helpers
Date: Thu, 20 Nov 2025 15:25:37 +0100
Message-Id: <20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEkH2kC/33OzQ6CMBAE4FchPVulpRTw5HsYY5Z2lSb8uQWCM
 by7xRMxxuMc5pt5MY/k0LNj9GKEk/Oua0NQu4iZCto7cmdDZjKWqRCx5jNeHyPS81ph3SN5XoA
 qVCJtLnPLQq0nvLn5Q54vIZfgkZcEralWaOz9QAjNoQE/IK2Nyvmho+fnwyTW3p+5SfCY20wLK
 JQyMslOrh2w3puuYevcJLdA9gOQAUCjdQkabsKIbyDZAOIXkARAprbIFWCam3ILLMvyBqRldW9
 UAQAA
X-Change-ID: 20251106-xe_query_helpers-9a49432d828d
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=UW5znf71wLrWcIXfVZnUCBxOowiAxEXFgVyeNEGcMP8=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpHyUuJyUH1mu+1mGbYLRxdC7oIfaUgBoEkJmZp
 znEjdH2Kb2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaR8lLgAKCRAjYrKT3hD9
 12RhDACY6BXnAPUp7soav9QFCaUCGANmSKAxkZKjGL7dY8K4dEKIVe4IBHTkcMEB4YRIvvoH2t+
 vi9/BJB9pFVEe01b0UcQhEOD7O2KBZb6Zisq8t7Aqv4UdaNUGnORpbWUQZ6BPW20OtjY/2E0AYX
 25YwJXnDLvc+wjocrg05Mta7sR4szs1HkaKOG2hTkh0Rq5AzpH+bqRAh8BB77z1VYiHH/qlQpHS
 LryG7WYhHs4Z5G90uJCss2YptriEGRuogS7U5+29kHsQ6323R9MQEUZp4JV6MQnxC9oQf/g7/MG
 XjUfj7lgxwVHEhrRkMXW+ohtZEDi0HOXFmF63mEhI49o5XZbzshvESGeEY+/iJjaHnnBlo9J8Rr
 e3uwF3Oio5QfMg7K0+tgWbE2nSQ1MU7IHsfToG3nJxqe/TQu+YE/n5sCnmW7Yv/lII3eWPV9ZDU
 KljuncxNDxK44+Ika8p2C503PoqEUfMtaFR43sj10eiDBAMQUCu2oWWaL83p41sWIXiz0=
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
Andrzej Hajda (6):
      lib/xe_query: add helper to get first value of hwconfig
      tests/intel/xe_eudebug_online: use helper to get hwconfig value
      lib/xe/xe_query: introduce helpers for device query
      lib/xe/xe_query: use recently introduced helper to query device
      lib/xe/xe_query: introduce iterator for GT topology masks
      xe/treewide: use xe_query helpers for query GT topology

 lib/xe/xe_oa.c                  |  37 ++-----
 lib/xe/xe_query.c               | 220 ++++++++++------------------------------
 lib/xe/xe_query.h               |  27 +++++
 tests/intel/xe_eudebug_online.c |  41 +-------
 tests/intel/xe_query.c          |  69 ++++---------
 5 files changed, 111 insertions(+), 283 deletions(-)
---
base-commit: 5aeea13f553d4c5882cf4af9c83c8609265200f1
change-id: 20251106-xe_query_helpers-9a49432d828d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

