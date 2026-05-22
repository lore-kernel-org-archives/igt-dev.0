Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0060CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 15:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3A610F677;
	Fri, 22 May 2026 15:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="aHcUrAQS";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9E10E262
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779465418;
 bh=InCo3BVPWnZBCmkye6MRvPPfaafkibp3Ix6Ib+kkiJ8=;
 h=From:To:Cc:Subject:Date:From;
 b=aHcUrAQSGC1k6JQoace1cYt8b6AzlgvacSbdx6JGmKdoc74LzIsBs/ezy8a/Ai3q1
 mh6QBf1Vd1egbqCPP3lZ5oLQFKRcvHY0ui2bcd4ZMvGjCP8P1Iw/4g25RwhO5rZ5Ck
 SmvQI2iZQYnew1d4w9oDAX1gggREIoCD7bcX2eZYA8HgtC2+iOvkrqB3xGByeqh4ap
 WqXPVinDlziUh9OFG7bk6rRgs9XyAURgjQ4l34HYmks1Mdjn+9pb26zdoBEUk2ucPt
 juUtQtIYxHSxKQrDbE/votutdx/TB8O9VhlQZZ0oRQaG0T59q4/ylxL1PY36B8DaVn
 5/vfCedKnKJXQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/3] tests/kms_color: Add support for background color
 testing.
Date: Fri, 22 May 2026 17:56:32 +0200
Message-ID: <20260522155635.1215421-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

Addressed all review feedback from v1.

Maarten Lankhorst (3):
  drm-uapi: Update drm_mode.h to linux upstream tag v7.1-rc4.
  lib/igt_kms: Add support for the BACKGROUND_COLOR property.
  tests/kms_color: Add background-color subtest to test the
    BACKGROUND_COLOR property

 include/drm-uapi/drm_mode.h | 193 ++++++++++++++++++++++++++++++++++--
 include/linux_scaffold.h    |   2 +
 lib/igt_kms.c               |   6 ++
 lib/igt_kms.h               |   1 +
 tests/kms_color.c           |  72 ++++++++++++++
 5 files changed, 267 insertions(+), 7 deletions(-)

-- 
2.53.0

