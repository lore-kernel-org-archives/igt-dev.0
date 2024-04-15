Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0656CC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 14:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19C810FE8E;
	Mon, 15 Apr 2024 14:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3kb705u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33EF10FE8E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713192569; x=1744728569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9j1Xqs+T2W4b4L2x9tevmYRCRwSNvto7D+lJN8OF7iw=;
 b=m3kb705ukLJ2OWFOilXMP40/tuW/9pJ0ZFZAMrm6CWcv5gq/ux33fsht
 UTq9TTC0vuIqPVoJSPhHYOfMY6+5bvEjyNQ2J0IQhUTU/X9coIsT6VBud
 UdUaO9S6ODTBlwU8EUdIuwxaIHp8UFiII9BSoxZYjkVFXq93m9b3dciLf
 1HxmE7rjpzsxdJu6kRRO3+tzN2rW6JQtoOEU/nKx4b6Rj3+eqKKF/6KL8
 lWsIne8lk300sYqyHAVRHS2uB6LT8yd0i91hLQcVEe2gGaLUO6nDzIMS4
 oJXyWvIUFquCETWOHPt3WsTozBYITTL/8PAkbJ92TsPU7RDEZxQ1gOWeJ A==;
X-CSE-ConnectionGUID: hLnrWVrSQ+ypkkHosnlM6Q==
X-CSE-MsgGUID: ppI5s84vTzOdpRcoICw8KA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19735058"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19735058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:29 -0700
X-CSE-ConnectionGUID: MtOzK9vFSxuF4Kte1PRb2A==
X-CSE-MsgGUID: XbyQpn9YQPKxuWualTOItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26580017"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:27 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3 0/4] Update for atomics related uAPI changes
Date: Mon, 15 Apr 2024 16:35:24 +0200
Message-ID: <20240415143528.4107-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Update tests as per newly added uAPIs.
https://patchwork.freedesktop.org/series/132290/

Nirmoy Das (4):
  drm-uapi/xe: Add device atomics vm bind flags
  drm-uapi/xe: Add query flag for dev atomics on SMEM
  tests/intel/xe_exec_atomic: Use new vm bind flag
  test/intel/xe_query: Print
    DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM

 include/drm-uapi/xe_drm.h    | 22 +++++++++++++++++-----
 tests/intel/xe_exec_atomic.c | 10 +++++++---
 tests/intel/xe_query.c       |  3 +++
 3 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.42.0

