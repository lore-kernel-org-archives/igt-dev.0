Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E5ED5B847
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 22:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABE810E589;
	Mon, 28 Oct 2024 22:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cv8MLDiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DD210E589
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730155821; x=1761691821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T+tPwmOYbR6O/Gzn7jU3LWukGdh/ORv87oTXrrgAuoU=;
 b=Cv8MLDiYN5SeC55rSWzRAV+ojeHyT6JC7RUJgFNYSMOI8HSCDTssPXVs
 Jm70rXk0wsLJY18jxwLzfDI3GBpO1H5teSrdj8PQT1Aacls398KIC8bXK
 IDsp1da+WdfTXXvrHIq0cT7uRrvrPdf25o1rwa56wjyPiOw+CvI0Sa1KM
 Vvma4XwMXum49BG05SBcw1Wc34c3Ql/hsGSGgV5fBmd3MHd9+A00zRNHG
 IBRFbtiY0J8E8k7yVVaRqqtzm0+Rv0hqB9O+DSzL/0bIJYYrB9kx/5eev
 FSS29khp+a2JSiLlgWqdBy/nd5qAgGqUJo8Odjr/TWttTlA0ifOUJl0aW g==;
X-CSE-ConnectionGUID: X66vN1bmReiOmm5oysAQmg==
X-CSE-MsgGUID: DJSu1jrMSvKgVQ1eAY0XHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29676388"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="29676388"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 15:50:21 -0700
X-CSE-ConnectionGUID: 2F59hFnmQB22Yax3B6ELaA==
X-CSE-MsgGUID: qc0w8B0GQcuTUPjn9cUV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="86511393"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 15:50:18 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t, v2,
 0/1] tests/intel/xe_exec_threads: wait for all submissions to complete
Date: Mon, 28 Oct 2024 15:53:48 -0700
Message-Id: <20241028225349.1596237-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In test_compute_mode, there is an one second sleep waiting for all
the submissions to complete, but that is not reliable especially
on pre-si platforms where the GPU could be a lot slower. Instead we
should wait for the ufence to make sure the GPU is inactive before
unbinding the BO.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  tests/intel/xe_exec_threads: wait for all submissions to complete

 tests/intel/xe_exec_threads.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

-- 
2.25.1

