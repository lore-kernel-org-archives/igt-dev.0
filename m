Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23769CCA490
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 22:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A5A112A25;
	Fri, 16 Oct 2026 22:38:37 +0000 (UTC)
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com
 [165.173.182.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C891F112A2A
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 22:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1792190167; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mIgnvgNrUiPoRxK/+HMwGzQMoSjXw8Z/HMWyPpiMDeKnkoJpO4HBoVcAM5SaxBFu63mG4UjWICuIAh6eT7O3C5T57s/QQ0ML/6Xlf7OlBuu54m9MQCcvKFznp4mv0V6spOm6ZwGT8LIYTIFmkb1b3hr6YILedPOpF5qIxvmnhh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1792190167;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ItuM2Qi7CCwpA9W6TKtUxjZHgIe78fpmWMledrCtFnM=; 
 b=dnHGYEzTmOuMn/DBY/sAGDuwrK+pOEMsC1A4FMBrzrhxB99bbUQYICnale+x7bSSS5ZpZ5xwBXzp7161lrk2K/WLO59wp82w1Cg5e7csEKp0amHzISWNjj+/cZLHj7K1aRziFjh5saKty36uaqFAlcngbG/SbW585gXXImLjPHk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792190167; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=ItuM2Qi7CCwpA9W6TKtUxjZHgIe78fpmWMledrCtFnM=;
 b=St0QZfp68V+EoIqSx0bxVW/xWd9uvmwfiOQfNm78YSh/a5vQZgpdZWz/Q83JgfDA
 Yc082qIAblBm7SD8nv8qxZfxjt4NjtGADroOCXosu8L0us9bKGXyFBPnv28uFLRFcH7
 cHxCYPdf48wjmI7NDt/Ms7kY3EAQzsnZ2cef5mSo=
Received: by smtp.zohomail.com with SMTPS id 1792190165507542.4587376007738;
 Fri, 16 Oct 2026 15:36:05 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH i-g-t v2 0/2] panthor: add dev_query tests for userspace buffer
Date: Fri, 16 Oct 2026 15:35:44 -0700
Message-Id: <20261016-b4-dev_query-v2-0-067661858810@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TVtRTCe/A9DzNJuoQlSbbGRE
 P7dpmePbybzZoPIwXGEa7VB4OSi83MGdahAjzQPjM5kBiVUI4U8Y1+j4fR4fzis2FKjFbG+GMO
 QJ6/A1n2L7g4OB1ygy/Ho4uLDWk6SLOV/X5IosBXWkqVaniTftJ8m6n2go/ZP6PZ9/wEBsAabs
 wAAAA==
X-Change-ID: 20261015-b4-dev_query-7a6c2aec8dde
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, adrian.larumbe@collabora.com, 
 liviu.dudau@arm.com, steven.price@arm.com, daniel.almeida@collabora.com, 
 kamil.konieczny@linux.intel.com, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=XIfgG088jF/CkB+sydQvjizbpDHi9d2Z+YZgcUQyvYw=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmXll1h4I6M3aaueeXw1YNvNwl3L374jcOcu/nzPvkN3
 df7OLpUOkpZGMS4GGTFFFnO2hv1iFe9N9Kd/78ZZg4rE9gQLk4BmMiJF4wM52y/Hfj/YY3qQ93F
 cw2bkk3LQnfHbjFZuDFb7OCxgpM1EowMTxpPPWQOtPkldob19lf2pv0Zk88v5egOLQhdcb7zWWw
 /OwA=
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
Changes in v2:
- remove redundant min-size test
- Link to v1: https://lore.kernel.org/r/20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com

---
Deborah Brouwer (2):
      panthor: Return size from PANTHOR_DEV_QUERY
      panthor: test dev_query buffer size variations

 lib/igt_panthor.c             |  6 ++++-
 lib/igt_panthor.h             |  2 +-
 tests/panthor/panthor_query.c | 56 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 61 insertions(+), 3 deletions(-)
---
base-commit: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca
change-id: 20261015-b4-dev_query-7a6c2aec8dde

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

