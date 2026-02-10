Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1165BEA8128
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38A810E5AB;
	Tue, 10 Feb 2026 15:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoyaBdpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629B010E5AB
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737055; x=1802273055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PgCwKoKx5fB4s+jqgrsAfADlruBUNiuhLiTCvAMLp1I=;
 b=OoyaBdpMdRsKsOSdPnOWbT/Elu9Kr7kD+OSd1BQCRokwwhVC3BvomVxb
 VJu+Hy30DXjLk1ddrFy4me0H4MoK1Nuusf4NnHe3SuAcsYsXxjFgGOfp7
 eUxPz1LqUUixkk93iw5q27ShdyxL+cS8w4yCFXt6hd61o95L91QCaohKT
 Uph7PU91neQqQAhhaW6jK5WfiYxkK87+szupKtLDx+LGFOiNliX61clHb
 cI9V8E8d7GXjS5WKsEvj6L8Q75lFEM/vUVqnZ6nqTcYTS2rkcAQw3ScuE
 KxtW3k+qTfwKZN6yjCyMm2CVBPnHOyzSFs4SPekIhapOQ7OxIBJDTUU0h w==;
X-CSE-ConnectionGUID: CyLA2Ts8TkqK1MWHMvjSXA==
X-CSE-MsgGUID: 8Q34assHQYay5/tLFSt9Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75491794"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75491794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:15 -0800
X-CSE-ConnectionGUID: CP36yNOnT9O7Nf0ijo0EqA==
X-CSE-MsgGUID: Yg24GU7gTYKIj048Fa5+rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211434346"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 00/11] igt pipe vs crtc_index cleanups
Date: Tue, 10 Feb 2026 17:23:41 +0200
Message-ID: <cover.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

While Ville's been focusing on mass conversions with cocci, here are
some specific manual pipe vs. crtc_index cleanups.


Jani Nikula (11):
  lib/igt_kms: rename igt_crtc_t crtc_offset member to crtc_index
  lib/igt_kms: rename the rest of crtc_offset to crtc_index
  lib/kms: rename struct kmstest_connector_config pipe member to
    crtc_index
  lib/igt_kms: rename _kmstest_connector_config_find_encoder() pipe
    parameter to crtc_index
  tests/kms_flip: switch to CRTC index terminology
  tests/testdisplay: switch to CRTC index terminology
  lib/igt_kms: use for_each_crtc() for iterating CRTCs
  lib/igt_kms: rename kmstest_get_vblank() param to crtc_index
  lib/igt_kms: remove __get_crtc_mask_for_pipe()
  lib/igt_kms: pass crtc to igt_crtc_init()
  lib/igt_kms: use for_each_crtc() for cleaning up CRTCs

 lib/igt_kms.c       | 106 ++++++++++++++++++--------------------------
 lib/igt_kms.h       |  19 ++++----
 tests/kms_flip.c    |  56 +++++++++++------------
 tests/testdisplay.c |   6 +--
 4 files changed, 80 insertions(+), 107 deletions(-)

-- 
2.47.3

