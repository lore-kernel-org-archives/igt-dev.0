Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892DFF01835
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F28410ED2E;
	Fri,  6 Mar 2026 13:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnB5QnWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD74210ED2E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803446; x=1804339446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y279WLItbEbrwib3pnytfHzHVnjEnscDnXnBGirQwbI=;
 b=OnB5QnWcT9/G5agPAQV3mz7LYubwVBFGcK0/qgg5nLuJXqkkM2bKVvaJ
 2+jI2oPDxegGHW4qhiCaVO0fFftgGGAI3J+rHws4XqM20DxCJKfXrK18t
 82q72SiP1UtgcdARH7F/x34O5YPoFxaZDpbw3ItvkzwSd8nGDjQZgfggq
 YZdhEA3ZPd+Prjweyg2s9UwzyJ1Ci4SUIeF+PR7E4XLjRvt8YCTb1g2Nk
 //Qi4I2QbJRP+S36mvI1buSX07eNX0Hvg2LtMnN/l6fIlc/hRT3Q6xPfG
 mEvuX04D138LFjgxm2CHv7L6/R17M/Yw7RxuiR3AQ3fNseUQzLyn5SWZY g==;
X-CSE-ConnectionGUID: zM6V9ee5S0W/IJLE+L5sPg==
X-CSE-MsgGUID: /kAkZQtKTHqPZBRdu4TJ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="72933820"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="72933820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:06 -0800
X-CSE-ConnectionGUID: L9kH7JGpSDuemZr+Ji5ICw==
X-CSE-MsgGUID: wbDg5VBOSEOa2pn/zotCHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256931431"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 0/5] igt: reduce igt_crtc_for_pipe() usage
Date: Fri,  6 Mar 2026 15:23:53 +0200
Message-ID: <cover.1772803372.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add igt_next_crtc() and igt_random_crtc() to let us remove a few more
igt_crtc_for_pipe() calls.

Jani Nikula (5):
  lib/kms: add igt_next_crtc()
  tests/intel/gem_pxp: use igt_next_crtc()
  tests/intel/xe_pxp: use igt_next_crtc()
  tests/kms_multipipe_modeset: use igt_next_crtc()
  lib/kms: add igt_random_crtc() and use it in gem_eio

 lib/igt_kms.c                 | 39 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h                 |  2 ++
 tests/intel/gem_eio.c         |  7 +------
 tests/intel/gem_pxp.c         |  7 +++----
 tests/intel/xe_pxp.c          | 15 ++++++--------
 tests/kms_multipipe_modeset.c | 32 +++++++++++++---------------
 6 files changed, 65 insertions(+), 37 deletions(-)

-- 
2.47.3

