Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86FBF531CA
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1210E050;
	Mon, 13 Apr 2026 20:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lswVbAA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDA910E031
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776110427; x=1807646427;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nz442prm2MLHnROziGz2QQ9Qyr+JhRU+FxZ7oOQC+sg=;
 b=lswVbAA6JvpkDIO/R0rHmSLB72oWUaqK3OYqGDI+LY4BtTM9yarQlsDA
 41lt/ExkbDs4/BtY6ryLZKUcJGQmQApCRbNrmXuwywS0aQIphTTXaPTmz
 EV1qss26sMc29P8Fcf0HXZ/jviNngv53FD3nb1qvdtM/L0zoAIBNqwxsc
 XgAK6T1Gf+dWWNsJ30TvyUvX7ytG9bcmuu2vOXoo5vUkI2Qe6yLl9vPiQ
 ZuWfk3Dj1NA4/ELTCu0/UDHTtzw1ydCdXjz7hCw0AY4sjFRc033sVVbxn
 86Jjq3XgQKliAeF7y2xKKUXhQ7eZu5m1dl7UIN7upv5W57L1d01idhEfP w==;
X-CSE-ConnectionGUID: V+iqbbh3Qj+6qRLD5C2/Vg==
X-CSE-MsgGUID: 2Zx8Y8npS6CaDmiVitdOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87357127"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87357127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:26 -0700
X-CSE-ConnectionGUID: nZPvcGlLRoS5jKeOisP1XQ==
X-CSE-MsgGUID: rpUh3GOIQr6270ln+NlwLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234860945"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:26 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] tests/kms: Nuke local iterator macros
Date: Mon, 13 Apr 2026 23:00:18 +0300
Message-ID: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Clear out some local iterator macros from tests.

Ville Syrjälä (3):
  lib/kms: Avoid local iterator variable in for_each_output()
  tests/kms: Nuke local copies of for_each_valid_output_on_crtc()
  tests/kms: Use for_each_crtc_with_valid_output()

 lib/igt_kms.h              |  7 ++--
 tests/kms_display_modes.c  | 71 +++++++++++++-----------------------
 tests/kms_plane_multiple.c | 73 +++++++++++++-------------------------
 3 files changed, 53 insertions(+), 98 deletions(-)

-- 
2.52.0

