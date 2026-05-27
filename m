Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E707ACD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C0A10E938;
	Wed, 27 May 2026 19:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nLrbLPks";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090BE10E95F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qujdaaTZ1AVzE3C3muLDITSvWyVQsW80W65L0bfZRcY=; b=nLrbLPksAqUZBY+DvN0de0R/KB
 Kven9FkdSdET9WCBxAFWkM4+Ppu9Ee0fRaqdvYU+xcxapqaAp+ZDyF0Y6S7qv7BqQyzw8OA8IHHlB
 Sf8WMJWzDlIsqc5ox3zNbdyPgJvio8GLxw1CCsOUHGzU3pz2Qrs8y36fkB2y1RvX1nwSiq8bgfQEn
 VQT1nYe5xfJ9brAcSu1khj/4tCCeF13s56JqXl5hN94ZVM14lk5vqU2UlxMVzM3g03EQHzDtR6UIf
 QFfOjvPUCIR333EF4PLrE+ynCh9jXPwhp3MEO6sPXaydGeRFjuRf1Vg2up/L12SeE2y4Oq9m1IBk/
 xD14RR7Q==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSJmY-0092ni-8l; Wed, 27 May 2026 21:19:10 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, Sowmiya S <sowmiya.s@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t 0/3] tests/kms_colorop: Assorted fixes / tweaks
Date: Wed, 27 May 2026 12:18:36 -0700
Message-ID: <20260527191839.639696-1-John.Harrison@Igalia.com>
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

Fixes some issues encountered while adding support for Intel platforms
to the kms_colorop test. These are the generic changes that can be
sent standalone. The Intel specific changes are in a separate set as
they are dependent upon other in flight patch sets.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Sowmiya S <sowmiya.s@intel.com>
CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
CC: Karthik B S <karthik.b.s@intel.com>
CC: Swati Sharma <swati2.sharma@intel.com>
CC: Alex Hung <alex.hung@amd.com>
CC: Harry Wentland <harry.wentland@amd.com>
CC: kernel-dev@igalia.com

John Harrison (3):
  tests/kms_colorop: Add early skip if pipeline is not supported
  tests/kms_colorop: Assert that the CRC query succeeded
  tests/kms_colorop: Add cleanup of writeback connector

 tests/kms_colorop.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.43.0

