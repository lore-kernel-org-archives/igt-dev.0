Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB59BE77180
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 16:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ED410E908;
	Tue, 10 Dec 2024 16:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7NfCNwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0710E908
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733847336; x=1765383336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HKLPy09RWqG7xDQxkzlWQRxnjFrInOF2LYOyrg1fjOU=;
 b=c7NfCNwrP2Vz0DJ5WFre/K/QXRFcgFsx2RGijy1IHHDEDY0abgO2e2Kn
 wYrHGPP2Nyz98GjuvIo0tQ6/fA0GIRmfozQUrgCpNkM8MPinvY04Q9s5R
 MGLI4y3QJlkG2dtWpwamAUcgUHCQhczNR2dHPLzLEMeOYabBsuq9NI/tl
 zFXeeCU7n/OhxzqRb07RkCWWalMz5SPkBqKnSDyHnw8IbfsdtDIWFjy7K
 n3s36x/LQ5Uj3R0/uRaEA5ZjBWVbNhdqsrqv7YG5gEDYOGLsq1sfEkByB
 rtApr4pGvQLgrcu8DqTHt2ALTg6nLk7UgBhR/15VNWXCrXqSPdTiTc/QQ g==;
X-CSE-ConnectionGUID: dG7pSQBSSrGjo3D8iCTqDA==
X-CSE-MsgGUID: SFMx3SVlQDaIuQxiU+9q5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38125478"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208,223";a="38125478"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:15:35 -0800
X-CSE-ConnectionGUID: J0bku7FvSB22535NSbisPw==
X-CSE-MsgGUID: 9q56RVyPQPqwfemtsxRwQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208,223";a="95520380"
Received: from unknown (HELO localhost) ([10.217.180.234])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:15:32 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 0/3] VF: Avoid reading inaccessible registers
Date: Tue, 10 Dec 2024 17:15:22 +0100
Message-Id: <20241210161525.777763-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

From VF-level some registers are not accessible. Don't check for flat
ccs from VF-level, also don't use Wa_22019338487 for VF.

v2: Updated description for has_flat_ccs flag setting on VF
    when disabled in BIOS. (Matt)
    Reworked workaround ommision on VF to use the RTP mechanism. (Matt)

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

Jakub Kolakowski (1):
  drm/xe/vf: Don't check has flat ccs in bios on VF

Marcin Bernatowicz (2):
  drm/xe/rtp: Add match helper to omit SR-IOV VF device
  drm/xe/vf: Don't apply Wa_22019338487 for VF

 drivers/gpu/drm/xe/xe_device.c     |  2 +-
 drivers/gpu/drm/xe/xe_rtp.c        |  5 +++++
 drivers/gpu/drm/xe/xe_rtp.h        | 11 +++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
 4 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.31.1

