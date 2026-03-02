Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ACAEA4E07
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 14:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2629D10E4FF;
	Mon,  2 Mar 2026 14:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLscns5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4901110E4FF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 14:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772460561; x=1803996561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ieky9GQFdRte7AORFNKcXhNAi3u89DznqCyg74l2oQ=;
 b=YLscns5Srf3Lzor8b/NhBK9XyCFfvFSZVB2IkFdVNgxUGZbn8fFpsOsA
 vYMgZG8k6dswIk94okHzHQ8eDXuovRy7/zCgkJB3QRJ16yggl540zcoWy
 oIan+es7be5D9lWsRZUYco+96WGEvUAhaETuDsH+1RMuQetPEl4qusSPi
 rmkVRrdRa1IFm4Z9YWXTk8W32sm6PzxHqnQq2y2498tIHVcwWf1MmZ9gJ
 fq4SAZa8yRNcnzcEZbI/aZwSrg0WpApZJ7hkx2Ta7ns1yYhfuO0cNjq5e
 DubqrjbG0f2yrkMoDOYIQ03wjCTR6QSeayOboE45TkcPoeDKdpUknlTrs A==;
X-CSE-ConnectionGUID: ne64t+7tRMuJ9u0GyJ/NRw==
X-CSE-MsgGUID: YY4d8p5PRqeENOfIYt22yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84932940"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84932940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:09:20 -0800
X-CSE-ConnectionGUID: 4QSW6ejBQ5Kmh/+vHi6VvQ==
X-CSE-MsgGUID: qZ8dQmOsTLy5/Z0r36CA2Q==
X-ExtLoop1: 1
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:09:18 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/2] Refresh connector when property fetch fails and
 update proper atomic flag
Date: Mon,  2 Mar 2026 20:00:11 +0530
Message-ID: <20260302143013.264657-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

drmModeObjectGetProperties() may fail for connectors
that have just changed state (e.g., hotplug, reprobing)
and whose connector ID is now stale. Add a connector
specific recovery path to test_properties.
Also update proper atomic flag for each specific subtest.

Sowmiya S (2):
  tests/kms_properties: Refresh connector when property fetch fails
  tests/kms_properties: Use per-subtest atomic flag

 tests/kms_properties.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

