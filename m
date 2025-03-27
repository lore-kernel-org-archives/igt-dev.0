Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB4C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 17:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258B210E0E0;
	Thu, 27 Mar 2025 17:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhAV40ss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BF610E0E0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743095380; x=1774631380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5sNdruGEgzdzPZvmxfM0cYgHRqBAbc95rRAz/i7OLJc=;
 b=RhAV40ssyQ0bBVjIig/IwA82T5qNsuvlippF2j+limLGuzu28gdWEjcz
 LKJ5qyWqjCWjSXmUFKKb8MWJCW1mXWA4YJ1ClPjjw/hz9OaFVbN7u0e8s
 L8bgs4/y3LeYHMRh3q+qQJznMtJsIoxxNdI87lrgzDprHpmC27fg+j3lD
 j44gUX0W0Bdte3wO5nvLl2rJFWxpIQ0iyV4Rv/yQZ7HJFjDnsPScQvaAH
 bnkdjUmGYAw26scqJ6QF6x02pOhyCIZ/X/HRlRi0cfvMFbtonVZsi0uQ6
 UtbSqoiiKCxhfAd7DnYEZPZnMJ48dI46oYNUrpgdF1ysakP9xMlBs/Wm1 w==;
X-CSE-ConnectionGUID: 0pPTkEewS5C+OfjilVYIKQ==
X-CSE-MsgGUID: Oh4EyzKIST6lPCLWFE4ZUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43683227"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="43683227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:09:33 -0700
X-CSE-ConnectionGUID: AAtiYeq6RyGOMy/7JxCm1g==
X-CSE-MsgGUID: BQ3gXFhxT9KK4yiZt4uMig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="126128240"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.254.149])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:09:31 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] intel-ci/meson.build: Add missing
 xe-sriov-vm.blocklist.txt
Date: Thu, 27 Mar 2025 18:09:25 +0100
Message-Id: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Add the missing blocklist file so it can be used in CI.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 59323eda9..b6f1357cb 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -12,6 +12,7 @@ intelci_files = [
   'xe-fast-feedback.testlist',
   'xe-fast-feedback-chamelium-only.testlist',
   'xe-sriov-vf.blocklist.txt',
+  'xe-sriov-vm.blocklist.txt',
 ]
 
 install_data(sources : intelci_files, install_dir : datadir)
-- 
2.31.1

