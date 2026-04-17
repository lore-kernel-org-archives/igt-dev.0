Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BFEF99C63
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 21:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780CE10EAA1;
	Fri, 17 Apr 2026 21:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hv/SK4SG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA54F10EAAA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776461375; x=1807997375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ekNLDgIuKR3CIAcPLoc6hwNObtEgefUtgDzxum1en4=;
 b=Hv/SK4SGMcWwac3Qrcx/yAX5iudk3Zm9MScbpGzGVxenGSbW+bCdTT4w
 m9HjNnQE0Ai2A00HJGcng5SvylKZY859P0FYPMTTi+xeg2ifvsnez+WXI
 Mgpehw3lB4rJoej6blaQ5Ukqk1dS/VyDlofhP7SIqLFlHzxKRytusX5/t
 D5ci1EIicRzhvRfRim91uBxUeEl1f2bCrTWh2vA16F676s395FxUsFkqQ
 bQqHAVOuHvD403G32+e0hRTpVi9SyVYce2/B6NYBGeCIM0OzFwGUOgs3v
 GqPbS5Ov/bHyrzoHK0FW+nljDtxioxG72t92ZB0VuryC9Rf4g9G8OjaMj g==;
X-CSE-ConnectionGUID: jniioEZhSwK7TS2g4QOILQ==
X-CSE-MsgGUID: pOJ0XCbDTCiLAhAljFVW/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76644118"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="76644118"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:29:34 -0700
X-CSE-ConnectionGUID: ZbPx2UqEQg2A1vCFJFgHgA==
X-CSE-MsgGUID: hWBN8zCrSRWqkA86sHMOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="235139998"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 14:29:33 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v3 0/5] Enable HDR in IGT Frontbuffer Feature Tests
Date: Sat, 18 Apr 2026 03:08:13 +0530
Message-Id: <20260417213818.2050571-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Patches add HDR support to the kms_frontbuffer_tracking tests.
This update integrates HDR into the feature test matrix, ensuring HDR
scenarios are exercised in RTE, suspend, and other feature-based
subtests.

Alex Hung (1):
  lib/igt_hdr: Fix EOTF bit flag checking

Swati Sharma (4):
  lib/igt_hdr: Move HDR helpers from kms_hdr into shared library
  tests/intel/kms_frontbuffer_tracking: Add HDR feature support
  lib/igt_hdr: Add helpers to enable and disable HDR on an output
  tests/intel/kms_frontbuffer_tracking: Enable HDR in feature tests

 lib/igt_hdr.c                          | 217 ++++++++
 lib/igt_hdr.h                          |  36 ++
 lib/meson.build                        |   1 +
 tests/intel/kms_frontbuffer_tracking.c | 738 ++++++++++++++++++++++++-
 tests/kms_hdr.c                        | 297 ++--------
 5 files changed, 1028 insertions(+), 261 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

-- 
2.25.1

