Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35365E83820
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 18:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37610E03C;
	Mon, 16 Feb 2026 18:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S9hOTxyM";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350F310E03C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TOwtVSChphYEnmbRKK8WfWeW8bJ4o4GXq9dVzc0X4KU=; b=S9hOTxyM6FCHmgqNqK4YXMLiRB
 dQWYyk3BT8luaCiuXTFKnP/fOwVM7psy/TIIFgZFZy4KHup8UoXTge0z/Su8fouUbJ0L673wT21eQ
 pTaM9yG3XUO2QIW4mva04ulgX63+g9EftxwOm3kg6WAjN01hZ7XUy3JKMmFez66wN31s8JCirNWIc
 uYdzXLaX15ujghd+xBhu+Vd7M1AjyrwfpvYCTWY/KBMuzJR5N6rP0QPFCLV0mkiXHT2apJBhk5Ece
 zExFCHiyjFCghDDXlKYRBqT42QGkYIxwxa/M7GtJV5Sq79CRTyykE2/uvw8kqTILKbzNLaIZZtTpI
 cW3Mr8Ug==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vs3Ze-001Ohv-0r; Mon, 16 Feb 2026 19:43:58 +0100
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/2] tool/intel_hdcp: Fix flickering and show actual
 HDCP status
Date: Mon, 16 Feb 2026 10:43:39 -0800
Message-ID: <20260216184341.437722-1-John.Harrison@Igalia.com>
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

CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

John Harrison (2):
  tool/intel_hdcp: Show actual HDCP status
  tool/intel_hdcp: Fix flickering when changing HDCP state

 tools/intel_hdcp.c | 49 +++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

-- 
2.43.0

