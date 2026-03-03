Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F3E67A6B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 06:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D68010E63D;
	Tue,  3 Mar 2026 06:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsva7HLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9831B10E05C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 06:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772520294; x=1804056294;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b7MDO/Rw3A4EwJeV5ZQfSnf9LlZxciKZh8RtmhDM5oU=;
 b=nsva7HLPqbO7JE2tCcGAWMSJshbt9hQBjSD9R9fDoAmI92lsM7W77OrG
 frTBbYWz7KfWWMfY4Hoz8bT0Fuo9NY3HOgyFYTIYkfBhgMpu8XwK4YNX9
 P/r8tThyT5JKF2rdh2vTZI58Rjh9HPT1sftm0Y+6lGLpRUIrm2+NG3d1k
 KDFKFrkbeNX8zGqo73HwcDyOyaS5KJHxcTyJOhTNpYc4vGybmcnOw1a9w
 qAR+tAxHwsPXd7gMsJo6gKzLozte5MvFf0eSCQy1BrTfnhG5H2RT0hrxm
 dictaFLjLp4v9feieGo97Jlaf5ioTSOic4eH4fcslQs8BWpPb4be8s8vR A==;
X-CSE-ConnectionGUID: VUUjID4AQdytpFKCXF9qEA==
X-CSE-MsgGUID: Aq8C6epqQaa+s1A3DCDsGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="99018468"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="99018468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:44:54 -0800
X-CSE-ConnectionGUID: cs3CKUVfRJ+iD5ko6JI7+Q==
X-CSE-MsgGUID: /831FTimTaqQu6eQrSobOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217129426"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa010.jf.intel.com with ESMTP; 02 Mar 2026 22:44:52 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t RESEND v1 0/2] Validate compute walker notification
Date: Tue,  3 Mar 2026 12:14:49 +0530
Message-ID: <20260303064451.1685885-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test to validate compute walker notification and update libs related
to compute walker for post sync.

This test is dependent on lib changes present in 
https://patchwork.freedesktop.org/series/162040/

Priyanka Dandamudi (2):
  lib/gpu_cmds: Add support for compute walker interrupt
  tests/intel/xe_non_msix: Test compute walker interrupt on non msix

 lib/gpgpu_shader.c        |   4 +-
 lib/gpgpu_shader.h        |   2 +
 lib/gpu_cmds.c            |  15 +-
 lib/gpu_cmds.h            |   9 +-
 tests/intel/xe_non_msix.c | 301 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 6 files changed, 326 insertions(+), 6 deletions(-)
 create mode 100644 tests/intel/xe_non_msix.c

-- 
2.43.0

