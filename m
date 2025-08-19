Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9028ACA0EEB
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 15:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4871710E629;
	Tue, 19 Aug 2025 15:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgtWxV6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8510E629
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618669; x=1787154669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1jDgyy6zL2mKPTdz0h5iGSSfSWqvrzPTMzWsxV0TWa4=;
 b=IgtWxV6X7DqgjPNCe2L4BB1w8O0HRV8x/uv/f0cojY8I6/Pg8glanTej
 ezG3FGydT4wigjSDOGaWa9hc6Ccjkw0PTNLqJWoP3fShkN5izyQYOdTN5
 k5JwhGRy6r5Vuir9v2ZsXQWENwoQveUfNHKR+o6Qjge66n0BG5K22xX3n
 Ml2iYJEJqlt+3yxtjU5h1+U4m+hf0U2FEscndWdc5lDRXKETFMJYVkuhb
 v98pU+PueHkMA8DIVgHOSDNSav4n66nRCQgzVt51/LUWaGaY98Ih5UsMJ
 pKpXPYtt0RQcYuYp+PxsrEgwDsu686KaahVe15YMV3cFLcdeY+1ZftQXx w==;
X-CSE-ConnectionGUID: IlzKrUC3TeWOXcYW38dTkw==
X-CSE-MsgGUID: 5LkvZUMuR8G1ZO8iJcZACw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57779687"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57779687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:09 -0700
X-CSE-ConnectionGUID: +y7JYkpWTwiJwjCy8oX7+g==
X-CSE-MsgGUID: VCuD3CCQRwmUUYUHDXWccA==
X-ExtLoop1: 1
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:07 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v1 0/3] Convert kms_3d into subtest
Date: Tue, 19 Aug 2025 17:50:55 +0200
Message-ID: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Convert this kms test to have one basic subtest. This will allow to add
proper cleanup at test end.

Also add a fix to PNG file loading in igt_fb lib.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Kamil Konieczny (3):
  lib/igt_fb: Add check before loading PNG file
  tests/kms_3d: Convert to subtest
  tests/kms_3d: Add resources cleanup

 lib/igt_fb.c   |   8 +--
 tests/kms_3d.c | 136 +++++++++++++++++++++++++++----------------------
 2 files changed, 79 insertions(+), 65 deletions(-)

-- 
2.51.0

