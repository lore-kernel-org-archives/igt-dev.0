Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60039C83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1077810E758;
	Wed, 16 Jul 2025 09:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJ1ct/Dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149C310E758
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752657662; x=1784193662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mt3N1QZZ8U4iwi2ChK8qa86Xv6Z4a//FQv7MIgjCpko=;
 b=ZJ1ct/Dp/gS4U7IvZ5420SmMlgrhdo6elwi4NG5LlNWpv+EqvfBf7OMA
 N2Xjt1YSseuZmFygDNmW8dZlfBh00gXdJyrRQcKuNVSzWu43BFPsaTZab
 od6R0pzEt1A33yWWaTmayO0uQttpxMurxjWgX8hy+t02hq2gbIKvgujYn
 ugT3iA0C9DkCyUx4/0Od+fM8fY7rz23EmIfYnPgG96EdzjrxS16VN7eY+
 f7cY+s8iL9ykwUWP8GQyQgYTVxzCL9wDbdPqM0nHBb8YCq4ndmL/vwfiQ
 z0H8Ahp9JZ9CQ3CRRMRHZ1n8ltQXQwUh+fDkg/7D4aVVOEcJjQiPKvUKA A==;
X-CSE-ConnectionGUID: G5O2nEFfQf2NPulaNDzKUw==
X-CSE-MsgGUID: 2xa+6IfVTB6LsE/c5skwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54005870"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54005870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 02:21:01 -0700
X-CSE-ConnectionGUID: YS81E35GSpaU8ZzLaRbWfA==
X-CSE-MsgGUID: DpXxKInRTbWnj5kQpD44CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="161775897"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 02:21:00 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, pranay.samala@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Split pixel format tests by RGB/YUV filtering
Date: Wed, 16 Jul 2025 14:50:34 +0530
Message-ID: <20250716092036.301862-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

This patch series improves the pixel format testing logic in
kms_plane by introducing dynamic subtests categorized by
format type RGB, planar YUV, and packed YUV.

Naladala Ramanaidu (2):
  lib/igt_fb: Add helpers to identify planar and packed YUV formats
  tests/kms_plane: Split pixel format tests by RGB/YUV filtering

 lib/igt_fb.c      | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h      |  2 ++
 tests/kms_plane.c | 48 ++++++++++++++++++++++++++++++++-------
 3 files changed, 99 insertions(+), 8 deletions(-)

-- 
2.43.0

