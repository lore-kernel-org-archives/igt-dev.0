Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A506C2BB85
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9252C10E098;
	Fri, 21 Jun 2024 23:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+0gEjq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8236610E098
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010913; x=1750546913;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=thqJ5ts8E7BAQafIlkQVQZr99zBpvg3E1CLl7a4uixQ=;
 b=U+0gEjq7/unPEHNMvvnkxVvpxlCZNSKhTytjqc0kZr6dG0kAnTzHhBI/
 Bx96r83nn3Y0ZQxCxeUz/szvIVW/tKXukej0V5dA5RxiEkr2iC193vRcj
 hDttsRnsX5AZTGjHPDAIcDKBmxog8FbHp5/Rau8kEzKhA1g1bRG1KcIeU
 wdNDUI4gZde1HzGmc7l3BUceScGIcoWC52SRK3Dw4hTn+T3oJPBFRfK+/
 PvmLh3oa5/gW8jJ6i4e19MzkqzuLUchQVqyXO9j0fsPPZvR4cB4qOq+v7
 Xr/wnbmB4Me83yBwzKLvtKAv3XTgO7X8xvZK66/hVGZe7a891UeW+JUEd Q==;
X-CSE-ConnectionGUID: bU7WuxXaRXizibnT+nn+tw==
X-CSE-MsgGUID: 7QIivYU8SJe5krFsb/986g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204926"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204926"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
X-CSE-ConnectionGUID: D3qkACrdSwiTMdlLNVlovw==
X-CSE-MsgGUID: +vL07JHWQp2kjmK7u9g95w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597313"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/8] Add per-client engine utilization tests
Date: Sat, 22 Jun 2024 07:00:54 +0800
Message-Id: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
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

From: root <root@xpumcyp04.jf.intel.com>

Port per client engine utilization tests from i915 to xe.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (8):
  tests/intel/xe_drm_fdinfo: Update basic test to include client
    utilization
  tests/intel/xe_drm_fdinfo: Add helper to read utilization for all
    classes
  tests/intel/xe_drm_fdinfo: Add helpers for spinning batches
  tests/intel/xe_drm_fdinfo: Add single engine tests
  tests/intel/xe_drm_fdinfo: Add tests to verify all class utilization
  tests/intel/xe_drm_fdinfo: Add an iterator for virtual engines
  tests/intel/xe_drm_fdinfo: Add tests for virtual engines
  tests/intel/xe_drm_fdinfo: Add tests for parallel engines

 tests/intel/xe_drm_fdinfo.c | 586 +++++++++++++++++++++++++++++++++++-
 1 file changed, 579 insertions(+), 7 deletions(-)

-- 
2.34.1

