Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA24C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F5410F537;
	Fri, 12 Apr 2024 09:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWmx/1iF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036EA10F54C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913326; x=1744449326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rxxF0GKnuMADct4d9XE14T6H/V/Q3mE13oPVn++nDp8=;
 b=EWmx/1iFSyCUoK0No10DUUOONUC2Xh8MpIbsAhSeCdaXMBoAyiKGXyKb
 WIf815mNd6J6+u9e1F62siqzFKFbXHmXQ6DgVujOADEvmjBKPN+Jg6eZN
 dGULYapomgJUbb+/x+TF3zQiRO9GyRDLW5GgayTWM8C33uCKXJgfykIhm
 mfZTDJvOp2SlUpdORB6aPOUITH7I8IbR8DQgxIkbCHGZOHC0OPiq7/l3w
 T41BKLEujaSMPTmNZtPwvY8GeVW5qZ91WlqYNrLK5AHThXBc7zmXhKFLH
 eOkUCue+15hKL+vUCs/a6HpeSCvfaZxqq2FKR/i3kZkNh3+3H/uP2ffbx w==;
X-CSE-ConnectionGUID: jHlHyDt3QjaKrSmgq8p73Q==
X-CSE-MsgGUID: /MIgI7+fRgCUDYOoEgFpIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12146402"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12146402"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:16 -0700
X-CSE-ConnectionGUID: PMwegTPuT2i7rzo3Y7aO5A==
X-CSE-MsgGUID: KpOzq+gdR0OW2dWXhAGF0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21165121"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:15 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 0/4] Tes update for atomics related uAPI changes
Date: Fri, 12 Apr 2024 11:01:13 +0200
Message-ID: <20240412090117.32727-1-nirmoy.das@intel.com>
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
  test/intel/xe_query: Print DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM

 include/drm-uapi/xe_drm.h    | 20 ++++++++++++++++----
 tests/intel/xe_exec_atomic.c | 10 ++++++----
 tests/intel/xe_query.c       |  2 ++
 3 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.42.0

