Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F94FF4959
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5063B10E4AD;
	Mon, 30 Mar 2026 07:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTEcQwUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954AC10E4AD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774856196; x=1806392196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x11mmOBYb0lkpTSpuFbpulW3Ji8UQ+ODvJ4KWSSfaFo=;
 b=dTEcQwUXgxHkANrn2kYULtTv4R5NPIs0yUt4bdyMBYVJZIvAHll/ND/T
 g4E57UIp/m0GxBnG+OmtHIqslt8c5FheoBnum630S+ndoR7IM+Ec8OVTA
 x2APbhvv7GYnU/2hyfjTYxRCASbn6vzfC7gikj4yGE9cI8UajbQ3NOZk7
 s4Xiy3HrlqToErS+aDn9mG8F3AIKqFuLXTLMIe7lWfvvQM7hgV820iMuL
 I4W6h0h3/TWRTdCZjj+mNhw1yrONwEOFOskHQ9KoefDJkSRJ9ShHlQqXz
 dVzYYQjb0nhwj6G95vaRB2j9xzEYeTQ2EBEieRpyTyBKgL/IEjDwQmErK w==;
X-CSE-ConnectionGUID: 90OTCDVvTm+EB3ls295ivg==
X-CSE-MsgGUID: k7+U9LaeSuG0DQNnWsa3mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75738059"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75738059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:36 -0700
X-CSE-ConnectionGUID: +RMRtajYSdmnJcxmCD6vyQ==
X-CSE-MsgGUID: Z2v2vgCUTt6GpLcdBTgK9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="224995743"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 0/3] lib/kms: only keep valid igt_crtc_t around
Date: Mon, 30 Mar 2026 10:36:27 +0300
Message-ID: <cover.1774856079.git.jani.nikula@intel.com>
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

Only keep valid igt_crtc_t in display->crtcs[] and make
igt_display_n_crtcs() return the actual number of CRTCs on the device.

Jani Nikula (3):
  lib/kms: start returning NULL for invalid pipes from
    igt_crtc_for_pipe()
  lib/kms: use a for_each_crtc() loop in igt_crtc_for_pipe()
  lib/kms: only keep valid CRTCs in display->crtcs[]

 lib/igt_kms.c                           | 51 +++++++++++++------------
 lib/igt_kms.h                           | 14 +------
 tests/amdgpu/amd_multidisplay_modeset.c |  2 +-
 tests/intel/kms_joiner.c                | 14 +++----
 tests/intel/kms_joiner_helper.c         |  4 +-
 tests/intel/kms_pipe_b_c_ivb.c          |  4 +-
 tests/intel/kms_pipe_stress.c           |  6 +--
 7 files changed, 44 insertions(+), 51 deletions(-)

-- 
2.47.3

