Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A786D10DC0
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 08:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F79610E670;
	Mon,  2 Dec 2024 08:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Y78JS4lF";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0384910E06D
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Dec 2024 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9/ypUVceU2MeSs0F9JmO8RbSEdWt99MHuXVyeSXAfIU=; b=Y78JS4lFaouF/Hg6eciwEwSss1
 3SIaAXEfroyeYibftVn8JjAKs4rEWajUx1yzOtjlbl+WbUSwsPYRJQHshmkZQGcr5L0VQMvEYmyQ9
 wi/wtpQBWfTe/WH++C1ZYn/ycWs+YllmrZRYEMO9cvrzLMrGmV2PoKMA8FzvtCoKvEuPv6coLGIhD
 x+3ofa3cMcMPfc5HWBZNgSjlcmgPsvrGuqq5VZUJ1fUR1hGgfnYJYU4Ppy5eZbypzlDiz8mDqmonT
 T79z8E2IHYYnMIVxXEtFJPo3uOHSJl6h7rJM83TkAWuQzR5O909zO0U7z6eBKTzlFw3sK0IDnAgcJ
 PMxPAzIQ==;
Received: from [177.139.20.227] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tHoqF-00F4Q3-CD; Sun, 01 Dec 2024 19:38:47 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 kernel-dev@igalia.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 0/1] tests/kms_async_flips: add atomic test
Date: Sun,  1 Dec 2024 15:38:40 -0300
Message-ID: <20241201183841.71046-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:56:47 +0000
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

Despiste async page flip support for atomic uAPI being merged into the kernel,
the respective test wasn't merged [1]. I have rebased it and proposing it again.

[1] https://lore.kernel.org/igt-dev/20220824145832.426397-1-contact@emersion.fr/

Simon Ser (1):
  tests/kms_async_flips: add atomic test

 tests/kms_async_flips.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

-- 
2.47.0

