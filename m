Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAD6CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F5910E40B;
	Mon, 25 May 2026 20:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cHnvmNOw";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DD710E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LZpdaWXy+HwN3lHqQ6NNkMHPvRjzrpvLs79yOs7k+RM=; b=cHnvmNOwURL9huZNk+TXah4uI0
 I3deGGEYgzZvmUPrVqWV8+HUiKV4kLdZhKcRNMUeECmrfjmhRsh/Sc5UTIOwdwn8a1ghOqEVldp1j
 AzpM31j5ktQHlOL7DUchnrzpiFTqmKMulrk2DMjJ4VdEAWCyDalUwtULTQHllimlkiV++1oM0/evk
 pfMl+VLmNfUf5R215XcyAw1rsnfsxZa8kZzHqT7z4GYvupZWiYduZxXaftQE8kh6rBOUpvaxpa2w7
 FsJqk4Acga0GQYz2LemtJvVuRTZpxbQjq17dIDcLhT1svMNABrU2X/ef+E7yYp5cgWAaf444irsNx
 3Km2VpJQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRc4i-0089fG-R0; Mon, 25 May 2026 22:39:01 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/6] tests/kms_colorop: Assorted fixes and support for
 i915/Xe
Date: Mon, 25 May 2026 13:38:21 -0700
Message-ID: <20260525203827.3155622-1-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
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

There seem to be two distinct colorop tests - kms_colorop and
kms_color_pipeline. The former requires writeback and so does not run
on Intel platforms, however the use of writeback means it can dump
failing framebuffers out as PNGs to make debug easier. The latter uses
hardware generated CRCs which have lots of caveats about how they can
(or more accurately, cannot) be uesd.

The i915/Xe drivers are in the process of gaining writeback support
(but BGR only, not RGB). That means they can start running the
kms_colorop tests. So add in BGR support and add an expected error
range for Intel platforms.

Also fix up a couple of other issues noticed along the way.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>

John Harrison (6):
  tests/kms_colorop: Add early skip if pipeline is not supported
  tests/kms_colorop: Assert that the CRC query succeeded
  tests/kms_colorop: Add cleanup of writeback connector
  lib/igt_color,igt_fb: Add more BGR support to various helpers
  tests/kms_colorop: Add BGR pixel formats
  tests/kms_colorop: Intel platforms seems to have an error range up to
    8

 lib/igt_color.c     | 54 +++++++++++++++++++++++++++++++++++++++++----
 lib/igt_fb.c        |  5 +++--
 tests/kms_colorop.c | 29 ++++++++++++++++++++++--
 3 files changed, 80 insertions(+), 8 deletions(-)

-- 
2.43.0

