Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C36CF531CE
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 23:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75B410E557;
	Mon, 13 Apr 2026 23:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SR5Yr/Qh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE39010E557
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nYZsLU0w14RDmDyaH6m1vsnDbhekfnvl/ZtLnB5xnis=; b=SR5Yr/QhYFcN7YTCevnPT30vA7
 EtbyGpFSqcwKlBEy6xi/6t4nU42qlv2JWVJ4aP5f01/DucGX03OB9xMK7AlbCq+v7ab7nbnk1wmKr
 i6U0qzjBwt7txCpFEHFHzyDtLF79hodRJNIeBU3Y7oTtSbuX3sbAxFP8uq4h/euaY0ZI3sEddRNlJ
 qScANBYegRefwZaHSBoce/JXNEVJh6+igXgEnyZttCnpyhs7ygK2IKHTLjYZ0Zx3gfrqXy+Fcz/jM
 ijVO0QKwgbzzSaAD9AJL+r+4AtBLjuZ6JQG3YAiqsMm3tHWUZS7GaPwrRixe5HewGPWFuJcOO8zmx
 ySsd6qnw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wCQqH-00FeK3-Vf; Tue, 14 Apr 2026 01:37:22 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 0/4] tool/intel_hdcp: Fix flickering and show actual
 HDCP status
Date: Mon, 13 Apr 2026 16:36:25 -0700
Message-ID: <20260413233629.771034-1-John.Harrison@Igalia.com>
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

Make it clear what the current HDCP status is rather than relying on
the user noticing a single frame flicker of the background colour.

v2: Split into more patches
v3: Fix text rendering calculations

CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

John Harrison (4):
  tools/intel_hdcp: Fix status rendering
  tools/intel_hdcp: Move text rendering into helper function
  tools/intel_hdcp: Show actual HDCP status
  tools/intel_hdcp: Fix flickering when changing HDCP state

 tools/intel_hdcp.c | 95 +++++++++++++++++-----------------------------
 1 file changed, 35 insertions(+), 60 deletions(-)

-- 
2.43.0

