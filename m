Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB7110F6FBF
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 16:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5C310ED53;
	Wed,  1 Apr 2026 16:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPHXYdxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828E710ED53
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775060143; x=1806596143;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RX5evxKG15YU2KVnqmPHAmYDK1yE8Ot8JLsaZz4+Pm8=;
 b=TPHXYdxA4jTwydZSDQl8uFbn7LJ2kejmk5IDmrGgPtU+yxRhq9KkYPy/
 WkazkiDnYH3SqqiyjnRuvxMGc2jOI5XIc7amPqb8HXh/tKhgdmc5WSEtc
 bd5d9THq0ahPADuau+aAeTwe4Net+PlrAWaFoPv8DOA9pJqZayRUA/9PN
 CgLGNKUZWw0SspnohzQNX/m8WRNaXvZNmxQJoY826fq3IaPqkaagJQod8
 uxbBu1oqYPBfwhyqSbd7+Tsw7PD2DTGkKqEd0Q2haD9Jg5G5z0mLZyxSZ
 xhN6cp7mG14xuBmtuaIJfI6Z1ls3kTa9MsOfD6RUriqutSy/aJko7CI7N g==;
X-CSE-ConnectionGUID: GdoQFcHiQxeblJeU9+Tv/A==
X-CSE-MsgGUID: 5uMZyg/rRdCTju5gsQo2Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78700354"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78700354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:15:43 -0700
X-CSE-ConnectionGUID: YyZi1hTrRQW3CPcvXnYDFQ==
X-CSE-MsgGUID: KkVDXqv3Q22pv3/From7lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226582428"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:15:42 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Remove the "center"
 scaling mode test
Date: Wed,  1 Apr 2026 19:15:39 +0300
Message-ID: <20260401161539.30360-1-ville.syrjala@linux.intel.com>
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

The "center" scaling mode doesn't actually involve any scaling,
so it's fine to use with the sharpness filter enabled. Remove
the test that claims otherwise.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_sharpness_filter.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index c9fc191fdc02..15c5e600626b 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -148,7 +148,6 @@ static const igt_rotation_t rotations[] = {
 };
 static const uint32_t scaling_modes[] = {
 	DRM_MODE_SCALE_FULLSCREEN,
-	DRM_MODE_SCALE_CENTER,
 	DRM_MODE_SCALE_ASPECT,
 };
 
-- 
2.52.0

