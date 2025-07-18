Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF63C83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 15:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34410E0DC;
	Fri, 18 Jul 2025 15:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoMC+Bbs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5183510E0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752851738; x=1784387738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W7iu+TyMJ3qhmtuJZ5E004gLZOOBZUi6hazZvBTfqe0=;
 b=OoMC+Bbs1GicjOoaJDW1pWhOH1QbHT9m0TgxQMucTk2HbO09eo0vR84w
 nVrIr+fqqY277DJnU8/Ik9RM/UIj6intb+3w/WFHToQD6JP1dd9Em0kmh
 bMfXqRSLqHBdTSr7oiPwWxEMxTi5wF4jGveDdL7OUJXLg88Ceo5Oyh+iK
 aT20qZCpc8Mo5ai9rSlENx+mCazOre+/LUBwBx8s3VuWYFeFFL0Q3hDAw
 E+oDFxNZBQm89/d7VMeGyoWFJEc2v9ikuXUyOiqf3R/3f48go6yOit5Ht
 esAB6TmyCkh1olFRIeqRTz+pkFvFlUkHkmhJNNMGWH8wpStBS6I1MevwA g==;
X-CSE-ConnectionGUID: nL8kW9pTQZCEZxPYa0c8EQ==
X-CSE-MsgGUID: fuQ7R7YuT/qV9QJofkbDZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54860989"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54860989"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:38 -0700
X-CSE-ConnectionGUID: zKsxhy2rQ7+IRHSPp/U/eg==
X-CSE-MsgGUID: mp2pomsTRoCOAhe9Qm7jJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="195213437"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:37 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/3] Fix follow_symlinks meson error and few other
 warns
Date: Fri, 18 Jul 2025 17:15:18 +0200
Message-ID: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

This fixes few warnings issued by meson during compilation and
also one error reported when using older meson version.

Kamil Konieczny (3):
  intel-ci/meson: Use follow_symlinks only for new meson
  tools/gputop/meson: Fix warning
  meson: Fix warning

 meson.build                | 4 ++--
 tests/intel-ci/meson.build | 7 ++++++-
 tools/gputop/meson.build   | 8 ++++----
 3 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.50.1

