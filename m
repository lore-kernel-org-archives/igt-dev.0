Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74714F3C266
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CCB10E15A;
	Mon,  9 Mar 2026 14:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K81+3kJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E7D10E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066113; x=1804602113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ckQy/aD/Nzo4PnqEvoVV3JiU+d9GyUKsbh83ZNVCZyY=;
 b=K81+3kJ2Ux6b2YBRbReCOb5FTCethyqpSiPTXzwlHYsfHxaFreZLm2H7
 EY78wm6HEBU8IwMtxTUBNLFzyftKP4KWnHTaY+xpjsZonpHL3/9orvxWB
 PcxuDSJ/VgbIqnED+TUr26nvTAr191QmILs3p2x8PBtQntXUP63mxZki4
 I2xpVhIM8y0cF9+61hztr4rKxTTwnC7QZEkVHAZ4UWDeXuWcn7VGVrG0D
 tSlWhUzTile9JaFvi0FAL730gLDWY2eFVjzd9Z8n0IuGc9bcyMYx37fZ9
 FnIHuYJUhUjD99q/eCcTc56KqPXQu9hx1YvRNTFlIbRSeX/tuL6pfyhp4 Q==;
X-CSE-ConnectionGUID: j6gWlkIGSyORat8YhjHegw==
X-CSE-MsgGUID: Ye1ariikRHam/fi1thkQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99559717"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="99559717"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:21:52 -0700
X-CSE-ConnectionGUID: YjL41xm4SkiNC28OwH7SfQ==
X-CSE-MsgGUID: 60ek3IidQ2ufs2KqpJrn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224466009"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:21:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 00/10] tests: avoid using crtc->pipe where possible
Date: Mon,  9 Mar 2026 16:21:34 +0200
Message-ID: <cover.1773066012.git.jani.nikula@intel.com>
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

Tests should generally avoid using crtc->pipe if possible. It's an Intel
implementation detail, and crtc->crtc_index is the generic thing to
use. Do some conversions to crtc_index use.


Jani Nikula (10):
  tests/kms_writeback: use igt_crtc_name()
  tests/kms_colorop: use igt_crtc_name()
  tests/kms_color_pipeline: use igt_crtc_name()
  tests/kms_cursor_crc: use CRTC indexes instead of pipes for CRTC
    tracking
  tests/kms_cursor_edge_walk: use CRTC indexes instead of pipes for CRTC
    tracking
  tests/kms_pipe_crc_basic: use CRTC indexes instead of pipes for CRTC
    tracking
  tests/kms_plane_alpha_blend: use CRTC indexes instead of pipes for
    CRTC tracking
  tests/kms_vblank: use CRTC indexes instead of pipes for CRTC tracking
  tests/kms_cursor_legacy: use CRTC indexes instead of pipes for CRTC
    tracking
  tests/kms_debugfs: use CRTC indexes instead of pipes for fb tracking

 tests/kms_color_pipeline.c    |  2 +-
 tests/kms_colorop.c           |  4 ++--
 tests/kms_cursor_crc.c        | 16 ++++++++--------
 tests/kms_cursor_edge_walk.c  | 14 +++++++-------
 tests/kms_cursor_legacy.c     |  2 +-
 tests/kms_debugfs.c           |  4 ++--
 tests/kms_pipe_crc_basic.c    | 14 +++++++-------
 tests/kms_plane_alpha_blend.c | 14 +++++++-------
 tests/kms_vblank.c            | 20 ++++++++++----------
 tests/kms_writeback.c         |  4 ++--
 10 files changed, 47 insertions(+), 47 deletions(-)

-- 
2.47.3

