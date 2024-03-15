Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E313C54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 19:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842C4112471;
	Fri, 15 Mar 2024 19:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxFdJrbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BE7112470
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 19:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710530113; x=1742066113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8YWxiWWpjLOtl77Jz+A0ow1cj9pQxBhVP0h/SWQew+M=;
 b=AxFdJrbGQODRzcmcdHtrgEtGqGFnhVit8/JS+6tn3ZDI040d2dTRodZw
 gMWr5Kv/bPV4uRuKtcScmtUGM+vCrPsBXJc7QthDIEcA1tf/Yqh2DSBVp
 Joh5CANPfe6Fl95MwPBYI1dDqYpNhckCO+RFMqlsAU+EWe1w1LbMNZaCO
 BBNXDk5yOQdXzOeuCyT2jwaRia14OE1wpGocdVVoBv4sApnZm/RjGS7Vl
 We8V17rRjuFjJul1S2Zz0phcF4Emr4ZY0bbaSJAO2eQR3pYxRRej6H5hL
 ALFCBUsr3dy5po1iFYpW1UMix73ElW6eivdawaZGpe0Fzzapzul/MIJ9h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16063962"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="16063962"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 12:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="827780746"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="827780746"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 12:15:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 21:15:05 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH i-g-t 0/5] tests/kms_cursor_crc: Test SIZE_HINTS
Date: Fri, 15 Mar 2024 21:15:00 +0200
Message-ID: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add some kind of basic test for the SIZE_HINTS property.

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>

Ville Syrjälä (5):
  wip: drm-uapi: add drm_plane_size_hints
  lib/igt_kms: Add IGT_PLANE_SIZE_HINTS
  tests/kms_cursor_crc: Make require_cursor_size() a bit more sensible
  tests/kms_cursor_crc: Test the SIZE_HINTS property
  CI: tests/intel-ci: Run kms_cursor_crc@cursor-size-hints

 include/drm-uapi/drm_mode.h           | 11 +++++
 lib/igt_kms.c                         |  1 +
 lib/igt_kms.h                         |  1 +
 tests/intel-ci/fast-feedback.testlist |  1 +
 tests/kms_cursor_crc.c                | 69 +++++++++++++++++++++++++--
 5 files changed, 80 insertions(+), 3 deletions(-)

-- 
2.43.2

