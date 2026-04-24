Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1AAFED3DF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 15:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F8A10F5EE;
	Fri, 24 Apr 2026 15:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8/90e35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2583510F5EE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777043644; x=1808579644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zeYzy8zJksl44v6UddXDIsSK8E7ZGyJdwCes77fFak=;
 b=K8/90e35VbkPbc3SyOqZ9UaqySZizRgLnJFY1O9OpZy1CDy6XEmNTBVC
 4I/ZjTnQwclHleyV2VgFJB/rm6bWaG8TtHLpnw0BBNN6yqYA61Sa2z1gB
 v/dj5wnlDu/knXeX0y++pU+pQro6MtgF8ntzM3xkWFlxukq4/C83ggl1k
 N06HZotvvnTxSf5r8RY7w+u3D4xwmmHesPwUJRHlPQgI1pmKTsI++GY/H
 MrR5z6LRw3TOkQEJRNpsBarOGT5f+z+O73W4LkvEHCRqHgMlQ30RDM3m3
 f6LZohnwSsTBSU2ZEPwn2RrRFLWXgBJGk7XL+q11oL7IuXCYBqoJGN7qZ Q==;
X-CSE-ConnectionGUID: HRJbKNbcQIipnlr10IS38w==
X-CSE-MsgGUID: ur0aensSTue+VAzG4ZZDhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77728778"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77728778"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:03 -0700
X-CSE-ConnectionGUID: P4wEyzZUQNulKOX4dfvv7Q==
X-CSE-MsgGUID: 3idM/BE/RKWWSYHFhNFnYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="233271530"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:01 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t 0/3] Few fixes for igt_display_reset_outputs() in
 lib/igt_kms
Date: Fri, 24 Apr 2026 17:13:52 +0200
Message-ID: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Discussion around a fix for asserts in

https://patchwork.freedesktop.org/series/165136/
tests/kms: correct index validation logic

lead to conclusion that the missing part was additional
swap of pointers. While looking at code I also spot one
more potential problem, fixed in 3rd commit.

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Kamil Konieczny (3):
  Revert "tests/kms: correct index validation logic"
  lib/igt_kms: Fix assert in igt_display_reset_outputs()
  lib/igt_kms: Fix cleanup in igt_display_reset_outputs()

 lib/igt_kms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.54.0

