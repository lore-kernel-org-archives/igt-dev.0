Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A42F531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A72D10E28D;
	Tue, 14 Apr 2026 07:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZd7EX1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D72110E590
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150912; x=1807686912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6t2/whJAxMNb8spxL5MuU2g9CnkaUoVpRpBn2pAcv/4=;
 b=LZd7EX1cvLEKHGoaNf/HWppHFtQlfDpVdpGmIBMEfYXZM4bZ+ptD1DzC
 c4o7sS7UOpo4ViG/JGtfqGThvxYrYc0g5Vl36c0lGuPPU9mI2+Ux53Xut
 lOFAmUkhY4DwntKlZPuuG4MUxzjobw8tJOrXIa25XyvkTIQolYy6iGbcU
 CKOLQkDhW74Dv/CnbWvFXJ1PUgZnlNnvAO9BHMo+hLFMSlhYgvJylPwcf
 oVWhmyLM9lB96NcXfqcjaZisXb8LyqOwNpTVnKCKM54NX4PHMXUjOPFOj
 vRb0t3YA+Sua8krFpWVgiv3LE/FefdXqKPE1erq64UoIQbQSG4TPHuJC8 g==;
X-CSE-ConnectionGUID: kV7qyHVoSVqwImOdEWkyIA==
X-CSE-MsgGUID: k2l5fjZDQQidlFKWeZap2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102555770"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102555770"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:12 -0700
X-CSE-ConnectionGUID: d4tDBQfqQdWtR7yD1lVyxQ==
X-CSE-MsgGUID: ZRJHApvHRIW13SoZ62Ea0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234047167"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 06/16] lib/kms: drop struct igt_colorop definition
Date: Tue, 14 Apr 2026 10:14:26 +0300
Message-ID: <a2f0849693f45bc54755e0a7fe6a9597df53fdcb.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
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

There is no need for the struct igt_colorop definition, we can simply
use the igt_colorop_t typedef.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e785dce8b105..9e7eb499fdfb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -411,7 +411,7 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
 
 typedef struct _igt_plane igt_plane_t;
 
-typedef struct igt_colorop {
+typedef struct {
 	uint32_t id;
 	igt_plane_t *plane;
 
-- 
2.47.3

