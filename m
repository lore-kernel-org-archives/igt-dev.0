Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F48CCA462
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 23:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9681210E08E;
	Thu, 15 Oct 2026 23:46:01 +0000 (UTC)
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com
 [165.173.180.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3BF10E08E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 23:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1792107905; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DMN+7Amr6dgjcb+u/qXHpi5ZJPuWsOGqF78/Fy3Jj0Yh3gfP9/4clNaS0gCfTSOSxZlWB30b1ypGlbhIq6K9dvG/IOyAhzE33LQpwu05AAxroyz4eJq77g1QBeXpckCgNSba0wDvCWtZAZs/xYxhbRlEIhZcvhrZIAnPaFtSbZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1792107905;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=K+ecsaLkHjHtdplcZmqovQhVeGOrhu9gCk1JrtOnwV4=; 
 b=RHmfw+vuFVAURXdrgvMr/ZWvmgJXz3ER8MSTW72S18BsbXZgoNF6o7H/gSn295BIPWsTEqt7kChexk/AkrZkXh4jGAT5HdJ2scPyAQUshcAh/MWipsbjnVat5htRE/ow0PZHib21z+4YBfO6jURWgKVmDH116rPh1EBUMl+p034=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792107905; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=K+ecsaLkHjHtdplcZmqovQhVeGOrhu9gCk1JrtOnwV4=;
 b=FmIYRzGUlJvPtBosYNZg2xqhERQ7UiTGTJrF6ZPUWbg6gaU+MfmJvZypuPKm1a6e
 LBXv+OUlFgVuRVlw8cPHs+ygC0BtVZxIXHURwB728WOhce2NheOitdTzCcH7dx72+er
 RWIICB/dBPICCQDQVbKecqT6rR8FTpob0taijnb4=
Received: by smtp.zohomail.com with SMTPS id 1792107903891637.3737109338433;
 Thu, 15 Oct 2026 16:45:03 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH i-g-t 0/2] panthor: add dev_query tests for userspace
 buffer
Date: Thu, 15 Oct 2026 16:44:56 -0700
Message-Id: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3SQT3ZTUsvjC0tSiSl3zRLNko8TUZIuUlFQloJaCotS0zAqwcdF
 KmbrpuiVKsbW1AB9bnFBlAAAA
X-Change-ID: 20261015-b4-dev_query-7a6c2aec8dde
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, adrian.larumbe@collabora.com, 
 liviu.dudau@arm.com, steven.price@arm.com, daniel.almeida@collabora.com, 
 kamil.konieczny@linux.intel.com, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=MxlRm2a6MgSO/v8C7Uq7Q44N/IFGDaqY6Gq9NcbdT4E=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFkXU+sq1F5avg+siNp3qPRj7uGdrYtkXVccXWLMv+VaT
 HPk7R7pjlIWBjEuBlkxRZaz9kY94lXvjXTn/2+GmcPKBDKEgYtTACby+QXDPzMT08kbkxg18wIF
 d848pTi13Jhxqezy8FUZBSu0NklHHGf4n8RxUWrqk7+FR8xDy97x7XMWSrkqKr717nm/bVwflaZ
 O4QEA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB
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

This series expands the tests for DRM_PANTHOR_DEV_QUERY_GPU_INFO
to check primarily buffer size discrepancies between user and kernel.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

---
Deborah Brouwer (2):
      panthor: Return size from PANTHOR_DEV_QUERY
      panthor: test dev_query buffer size variations

 lib/igt_panthor.c             |  6 +++-
 lib/igt_panthor.h             |  2 +-
 tests/panthor/panthor_query.c | 64 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)
---
base-commit: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca
change-id: 20261015-b4-dev_query-7a6c2aec8dde

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

