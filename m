Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1FEC71136
	for <igt-dev@archiver.kernel.org>; Sat, 14 Jun 2025 01:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2EF10EA7E;
	Sat, 14 Jun 2025 01:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVA3Iljt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DC710E9C8
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Jun 2025 01:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749863318; x=1781399318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g5MGRLm1wvcbWxGTkhNNKR5ll+o/T7aTKH0SR4EGV68=;
 b=AVA3IljthkUiIkSscNVyFTEG/xlkdReor6jXn03IC8fJDEqoC9oB0zXw
 QUD78qkMeQlcYaL/Q/yzQPBr8yVTMd6yKm/p0DvDJuLcJ/tWm3FKMHEKF
 J8gMtLoHus39UqYpZfkiHm79uBAlmZNTfvunxdNiSUpVFcZNVjVLC3i1M
 jZRg/A8ccs9ZfTEdnH2HRRMWv19tlmqT9wgAESKdAyFPVbmsudKV9ocFY
 0z0N//Wbk+JRJo2Oy/ryxYtJUfvBQikBPL0mgiGn15lr35djZPUIOr4lL
 dXVMeCLE121PVWYg5hyUWcHn05If30IHyJ0IUX2+JMeqeYaUDgop67zo3 A==;
X-CSE-ConnectionGUID: 3IVDYCyuT+WisqbTBWqv+w==
X-CSE-MsgGUID: 0GYjDRQhT/WLWwKpjAsAGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="54704313"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="54704313"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:08:37 -0700
X-CSE-ConnectionGUID: r5uJnaPRQeu0rqA/bkzlGA==
X-CSE-MsgGUID: HrWs8geBSGuyHwJl+NmksQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="147958934"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:08:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/2] Xe-perf tools update for OAM
Date: Fri, 13 Jun 2025 18:08:25 -0700
Message-ID: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Xe-perf tools update corresponding to this OAM kernel series:

	https://patchwork.freedesktop.org/series/149953/

Ashutosh Dixit (2):
  drm-uapi/xe: Sync with OAM uapi updates
  tools/xe-perf: Change xe_perf_recorder command line to use OA unit id

 include/drm-uapi/xe_drm.h        |  9 +++++
 tools/xe-perf/xe_perf_recorder.c | 66 ++++++++++++++++++++++----------
 2 files changed, 54 insertions(+), 21 deletions(-)

-- 
2.48.1

