Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAA7C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 08:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BF710E16F;
	Tue, 30 Jul 2024 08:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FT/neiXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C44E10E16F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722327627; x=1753863627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sl8s2oZw2h2vJdJA7Qohmk485RWRWYoT/gM0agDd5sw=;
 b=FT/neiXvWcnCn8o58PBZwOfuPEZYZRTWKSZme4IIq1ChKPx852XkICyh
 vCfkfLXUYLasbiJ7EpB/84/aOl9Flmey07ntnckasFUSZ1MgIORv1YkwB
 OE0NZ0yRElikNWvVLuUxCabirnZo15KxKqyB0jlD0vu5D8O14gnyf6C7O
 AWtRd3qCvaJuPDSvlDD5YSY3Oa9i96xcmrUpbapbnHesfFSpYHZup1A9p
 kOGs8Bs/PPfb1C3pVWPgHZpb+oPak+r4ieO/b05/0zl3YnR84QFpLoWbu
 JSx7W+QFeYxdSpuALP6ZAazpU64l6FtnGD5PqURK9xdmcC4084zNApxRF g==;
X-CSE-ConnectionGUID: KhQ9+/LNSTO54WkjS0XnDQ==
X-CSE-MsgGUID: 6sCvHMIGTs6KBiEoW/jPjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23915365"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23915365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:20:27 -0700
X-CSE-ConnectionGUID: gcj3+850QQiPh9WdqSkQhg==
X-CSE-MsgGUID: Y8e0DLgHQ3CopzIJsozEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54316344"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:20:25 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] New test to validate link-off between active
 regions (LOBF)
Date: Tue, 30 Jul 2024 14:01:09 +0530
Message-Id: <20240730083111.2897557-1-jeevan.b@intel.com>
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

Add debugfs entry to validate LOBF status and create a new
test to validate.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Added library functions for LOBF status
  tests/kms_vrr: Add new test to validate LOBF

 lib/igt_kms.c   | 23 +++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 89 insertions(+), 2 deletions(-)

-- 
2.25.1

