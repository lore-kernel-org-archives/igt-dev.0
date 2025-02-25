Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FF5C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 13:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C7010E69B;
	Tue, 25 Feb 2025 13:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQkwHMWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2295F10E69B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740491101; x=1772027101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DXVnf5+TIHgp+o2L5o/S6hfYAX0Q030HXj3UP1j5cqU=;
 b=DQkwHMWs08bLXkNR02M/kemaAMqYO4GldnSwnm7XL8SHGL60jkMBSPs2
 fDeHWgzejwfy6if8abm8gxmDAMxtNI6PvK8DF+XSt0+00b+o1TSW8d7DE
 cqxg//js+Wfp85LpXpYPWeb9Lkew8jpWbPhnEXcHrlLj8D/LZnE2Y5LxA
 vL178RfVNofmCu/XtTVyiXlv9/6oEMFLBMDCmcmHy+zqgfHkUgU4Hl8iZ
 +/oQHbw9fsAqS9IY7Lkdqfp/VmhfttMxZhsIJm/qdf8yGQAg3LlQ95/Kb
 shUS+e+yFaVjTpnyMPUqbb7igiWBy9t/2nDRy9zY0FH2/Wt3dMfSuWljD Q==;
X-CSE-ConnectionGUID: RrjIcGrXQ4mvqUzZHtk1pQ==
X-CSE-MsgGUID: eP+Eez6uSXmeV6rS6PgWuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51931752"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="51931752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:45:00 -0800
X-CSE-ConnectionGUID: DVd26UlzTaGQUmxkhX6jAw==
X-CSE-MsgGUID: UT0N6fhbTvu0fdB7QZFbqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116249616"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:44:57 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 juha-pekka.heikkila@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/1] Add FBC Dirty Rectangle tests
Date: Tue, 25 Feb 2025 19:11:13 +0530
Message-Id: <20250225134114.2381856-1-santhosh.reddy.guddati@intel.com>
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

This feature allows FBC to recompress a subsection of a frame.
When the Dirty Rectangle Enable bit is set in the FBC_DIRTY_CTL register,
and there is a sync flip indication, display will read the scanlines
between (and including) the Dirty Rectangle Start Line and End Line,
in FBC_DIRTY_RECTANGLE, from the uncompressed frame buffer.

Utilise the FP_DAMAGE_CLIPS property in the below subtests to validate
the feature.

1.Implement basic tests for Frame Buffer Compression (FBC) with dirty rectangles.
2.Add tests for dirty rectangles outside the visible region.
3.Include tests for dirtyfb functionality.
4.Support different formats in FBC dirty rectangle tests.
5.Ensure proper CRC validation for each test case.

Santhosh Reddy Guddati (1):
  tests/intel/kms_fbc_dirty_rect: Add FBC dirty rectangle tests

 tests/intel/kms_fbc_dirty_rect.c | 559 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 560 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1

