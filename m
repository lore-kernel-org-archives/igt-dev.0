Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259BDC83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 15:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D717110E39A;
	Wed, 16 Jul 2025 15:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgVXzPgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5410E39A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752679880; x=1784215880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NPMNCaZAFrTPWewuTB16NpY/HoJgbIlf1+JQXudD6Gk=;
 b=mgVXzPgvKEIrL5eHMmdXkPhILknxwWsSq135rKmgGs7YCvUJHJfjNltg
 3zp2iNY1eRMN8sRoYpzW+2WCnRU4K7CxJ8SHUV/x5fks8dic0NlN5QVva
 F9NnhAdw+9CNC4ihqoba0dl/Wb9zwQVMyabUVHc+y6oUgWsVmEFS+TJ8m
 01NexaDms92HlwEQucLr1QRJbaYsoeKMsRVqMT0wGdPxcbGrJoSXeKHfM
 Nugq6IV/6872O0XubdAwM/b+c2BkPbbosinuF4Kfbwx2k9eioEEyN2szf
 KrGCyzFqEMtsSR1qtOATWGihJSl2n3ajK5jWMuF62/GFcjvfTGEHfjSTD A==;
X-CSE-ConnectionGUID: YdiFxoTJT3iRvjpUnkOmeg==
X-CSE-MsgGUID: k3QROjHMRfC2WuFOxR6lTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54641810"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54641810"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:31:20 -0700
X-CSE-ConnectionGUID: eNEM6P3sQVWwijCXFlCZPg==
X-CSE-MsgGUID: yiFePRLYTQCW4hmUrVb1wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="156921035"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:31:18 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v1 0/2] Runner: report test command line
Date: Wed, 16 Jul 2025 17:31:00 +0200
Message-ID: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Add reporting of command line used for execution of test.

TODO: add this also to results.json but this could be non-trivial
as written in notes here:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/42

Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>

Kamil Konieczny (2):
  runner/executor: Build test command line before fork
  runner/executor: Report command used for test exec

 runner/executor.c | 97 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 73 insertions(+), 24 deletions(-)

-- 
2.50.1

