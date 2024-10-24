Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5797DD0BB5B
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406810E0C7;
	Thu, 24 Oct 2024 04:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T016T5Wa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7407110E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729745688; x=1761281688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ldZ4/HNnxDIjN7I6RIk2sbGmPJKEazJrONNlpHqmEpY=;
 b=T016T5WaUXsvdICpS1s5Uful/JfgN77h6zgk3MDAVihdnAyALOByQLX6
 1N/QFWVZ7m4IwB8WluAll5KZV0FB5vH9w8d+nSFFPwbbdf+ZPwXoo7uz7
 Bbirhv61tzsqkoK57jAqGq9Wlce2AnZNKDLW7hJfYVfcPw8x2tIjLzzBM
 L5c5fvPmHndXtLmuczpL5HcH4OcyJDxy+nXfOIOhz4W2W3D2D3Vr9n08m
 BzyNosT2Ydt8cGu2h7y1CVdxwKSyo375tOh23x8ctMdRedKs9gmUkxc3k
 hf8vf/fZGqDghVRvCwfugfytVilQPJdm+9a/+vOjgRUl/RqcEmqDhPN3r g==;
X-CSE-ConnectionGUID: iInjQr5IQTWua7tknQjovg==
X-CSE-MsgGUID: ep5v6+isRgm6zZfIYtjjlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46823178"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46823178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:54:48 -0700
X-CSE-ConnectionGUID: /WqZp7qFQPW/9Sii4nyMTg==
X-CSE-MsgGUID: MdPN6/WhTbCWJJG37Y+STA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80400813"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 21:54:39 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/3] Move backlight read, write to lib
Date: Thu, 24 Oct 2024 10:22:09 +0530
Message-Id: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Move backlight read and backlight write functions to library and rename
the function as igt_backlight_read and igt_backlight_write.

changes include:

Moving the backlight read and write functions to the library.
Renaming the functions to `igt_backlight_read` and `igt_backlight_write`.
Updating the existing `kms_pm_backlight` to use the newly moved functions.
Adding a new scenario in `kms_hdr` to manipulate brightness while in HDR 
using the newly moved functions.

Santhosh Reddy Guddati (3):
  lib/igt_kms: Move backlight read and write to lib
  tests/intel/kms_pm_backlight: Refactor and use functions from lib
  tests/kms_hdr: Test brightness manipulation in HDR mode

 lib/igt_kms.c                  |  66 ++++++++++++++++++++
 lib/igt_kms.h                  |  12 ++++
 tests/intel/kms_pm_backlight.c | 108 +++++++++------------------------
 tests/kms_hdr.c                |  42 ++++++++++++-
 4 files changed, 147 insertions(+), 81 deletions(-)

-- 
2.34.1

