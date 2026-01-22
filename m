Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A43D6CFA1
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 18:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D92910EA38;
	Thu, 22 Jan 2026 18:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLGHe4X9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A72D10EA38
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769106429; x=1800642429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZQ49v7pjxYGvLbwz7w6N7dlw6Qpu6lfq0HQm3+QPgWQ=;
 b=XLGHe4X9Yc6s49xdVuwGtkNx1r6qGzTGPhV6avY7gXYp1hTyVSgQblLJ
 aXxdQnNQplAQi0K+YUiQV6mnxPBcS68p9LljhVAPnEHgmE9riO7QNOnEn
 y3rEuPj7vX6QSMf+UKSPROaIXts9O9duYrbNlNm9hjA51Llz/Ra6YjLrB
 dAceuT174sqx9qfTGhBPmw2xjUfTH9dE2pT2kJbZzd786jBJbwfGgfvsq
 OA3VptErh1zGLji5axNAyjoVmxdW8asOCxjlhs1BNObr6VM4riZv71RMa
 vJVWGnGqhv2JN2zF5F8FBJwZf8gNl183NjAoLbdxcwEY6brXbyzONhtev Q==;
X-CSE-ConnectionGUID: Gz18/5ThR6K4PXJO0zNJwQ==
X-CSE-MsgGUID: oHielLECSpGoRJS7ouFDGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81729788"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81729788"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 10:27:09 -0800
X-CSE-ConnectionGUID: LTNU+2heSrOoH+B5igS8/Q==
X-CSE-MsgGUID: b+Fq8rUVRkSSjmUkuFytgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211657521"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2026 10:27:08 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 0/2] DC5 DPMS/PSR suspend/resume validation test
Date: Thu, 22 Jan 2026 23:52:17 +0530
Message-Id: <20260122182219.9635-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

This test validates dc5 dpms/psr before and after suspend/resume cycle.

Mohammed Thasleem (2):
  tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume validation test
  tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume validation test

 tests/intel/kms_pm_dc.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.25.1

