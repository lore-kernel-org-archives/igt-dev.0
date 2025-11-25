Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3A2CFD315
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6304110E3A5;
	Tue, 25 Nov 2025 09:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KivDiBSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A4410E39E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063535; x=1795599535;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=B6214BiI6PI8jmMcn4pv43M5goXqauqJo/3/jP6g+kc=;
 b=KivDiBSCkMVPBOAHJqbTdEHbzC2j22XhhOxiyPBWAdQ+/hCrHuTbpSGP
 kEjdg9qXrcOkfNzs2GRyZ6mRJKMoOcAQB89J13lIJ4k1uYk3OQcZppoGE
 QV/FWVPgAgO8AFSiia+dPZZMeVKqJgxrw6nekYlM5uyUHfJgK8dsHJXrw
 bbSQ/wjQcffoo5bAQqI9B3w6APokPNtFpSPP3DplhFtAjOTP2vesHC4dU
 GPPO2C8WnTRKAGUtW/lqDyb0b+5MpzhRbFA2X/wD2XUid7/iT92E2SQFT
 pn5PJxZjAzj54N3QFQoeRLM6hx/1+vKA55Iaose7oHwJw64YpTMiHPRXW A==;
X-CSE-ConnectionGUID: YRK9KonXQH+Bi9P2WoXhkA==
X-CSE-MsgGUID: Q/a6awInSZ+5I3titsTz+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66022170"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66022170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:38:54 -0800
X-CSE-ConnectionGUID: kxP/B0kWQbu6wjg2ma9Njg==
X-CSE-MsgGUID: 8xGW5SzpQSCPXrK42g9gRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215943958"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:38:51 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 0/7] lib/xe/xe_query: implement few query helpers
Date: Tue, 25 Nov 2025 10:37:20 +0100
Message-Id: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANB4JWkC/33QTW7DIBAF4KtErEsLGMYmq94jiiIMkxop/ik4V
 qLIdy9khSyry7d43xvNi0QMHiM5Hl4k4OKjH4cU4ONAbGeGH6TepUwEE4pzBvSBl987huelw9u
 EIVJtpJaVcI1oHEm1KeDVP97k6ZxyayLSNpjBdhm6T3EOaPqv3sQZQ250Ps5jeL5vWHju/TO3c
 Mqoq4EbLaUVVf3thxlvn3bsSZ5bRAnUO4BIAFqA1oC5csu3QFUAfA+oEiCU0400qBrbbgFZAIL
 tADID6MBZJp3TcguoEuA7gMo/AG3T9cBQQwms6/oHt/m0q9YBAAA=
X-Change-ID: 20251106-xe_query_helpers-9a49432d828d
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2899;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=B6214BiI6PI8jmMcn4pv43M5goXqauqJo/3/jP6g+kc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJXjlv4TMloLWb+Jw6ljtc4BPZCMdrbV4qIdla
 uUW1px+PSqJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSV45QAKCRAjYrKT3hD9
 1/MJC/9dVDzBQ+sjB8qyYK/vGMdzc7fI29hwGABNIr0VSgiAuOdCSHvRuuE702e+qVMJlY9oO7j
 +THyGKrWX1S/uXREewmlrfn0edApyzqSqFXQtWwlhxkZOfP1rPx3N1C86NGwE0itzXPTaiSM6po
 26ysYNgkb6Tyu3wKh6qXKcnyMJ4hfy/CE6fOUXpEFdqpFKDpr4Fj+f/fmbsWxYkedCcvCsFrVY0
 bROFWaDlM2Qp0O2BKiwnqa2hZRTp/5ih5zFHwTfaJhhAOs12pTrRLpdxtyj2o0PeLA6d+zOGlbT
 c8LYE6ooHFPAWeeL1HyLAD/BsbKZ3sczYXQeTFfKHgV13CUSkvV7bhd/HkzRBtUfLEfsRwk76nd
 dFk788FwxEeHoD7RWtTX9p/1X+UYmMGpJhAtuFQjPqDo5v6/EJoujN96sFZcYybOshpRK4CX8ev
 tzok6SFV2IU5W9cUf3EMI1lpgapAjxScVqRbfHzu7eRH7gjUbr7JS7nzG/HB44alwSmuc=
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
Changes in v6:
- unsquashed last three patches back, to simplify maintenance
- added r-b tags
- Link to v5: https://lore.kernel.org/r/20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com

Changes in v5:
- dropped patch adding xe_hwconfig_get_u32 - similar helper was just merged
- rebased - to solve recent conflicts
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
Andrzej Hajda (7):
      tests/intel/xe_eudebug_online: use helper to get hwconfig value
      lib/xe/xe_query: introduce helpers for device query
      lib/xe/xe_query: use recently introduced helper to query device
      lib/xe/xe_query: introduce iterator for GT topology masks
      lib/xe/xe_oa: use xe_query helpers for query GT topology
      tests/intel/xe_query: use xe_query helpers for query GT topology
      tests/intel/xe_eudebug_online: use xe_query helpers for query GT topology

 lib/xe/xe_oa.c                  |  37 ++------
 lib/xe/xe_query.c               | 203 +++++++---------------------------------
 lib/xe/xe_query.h               |  26 +++++
 tests/intel/xe_eudebug_online.c |  41 +-------
 tests/intel/xe_query.c          |  69 ++++----------
 5 files changed, 93 insertions(+), 283 deletions(-)
---
base-commit: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949
change-id: 20251106-xe_query_helpers-9a49432d828d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

