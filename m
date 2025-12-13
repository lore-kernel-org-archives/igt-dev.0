Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1618DD5B15F
	for <igt-dev@archiver.kernel.org>; Sat, 13 Dec 2025 18:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B498710E189;
	Sat, 13 Dec 2025 18:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Kn62UQNO";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE210E189
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Dec 2025 18:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765651918; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CiAYMSp/cNmDlf2mTZbdjoVUcLX+LxmBppxpjTALDhA3H3W/BKI0fsrbADwFqlfMn4tV9Qbp6N9XwRAy7LLlxMiwAm1D1ruTP35pZpyphRV0Upx0ourO7/QUQ+ElpRs+Cvp2qPmNZhZaIq5/n3pbVHFgz23opu1yZReTfPG3Xu8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765651918;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=q4m0tLf++BBa7Jdre1F5tQVJVsMvekMGQfb+OMEsE3A=; 
 b=SQ1wkPC4lLf1nNaNSQgVmT7H53lOLlU8eHQy/W5RFwf9tXR0znShPtrP1ogp/64gf9jbpwoCujZRrg7xf6HPMcalHu7qlXYnIH9SrHz+EJDpN4RiSheJz5LeY9iZGbmomQudWAXRJzGZBnWu6tjEQ2kOSdRpCwZjw3dig9I8k9I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765651918; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=q4m0tLf++BBa7Jdre1F5tQVJVsMvekMGQfb+OMEsE3A=;
 b=Kn62UQNOYb9Z/uCd3E4MMz/gwNIOpfXfX9E3q8TYWm2cwj8aH4UlNxA0qVp6Zu9u
 PoTWAcVxywWu0nkxOhHNWp34eVgYJRW42Bp721ymssIWsZtVL5y+cmAKDLC9rc6ZtwL
 xJg840cRrvnOpH0idt7+Q0eegE+e4EhAEJPiKoBU=
Received: by mx.zohomail.com with SMTPS id 1765651916481803.4316126263792;
 Sat, 13 Dec 2025 10:51:56 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 0/2] Panthor tests for huge partial unmaps
Date: Sat, 13 Dec 2025 18:51:20 +0000
Message-ID: <20251213185133.2428123-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
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

This is v2 of [1]. Kernel changes being tested can be found at [2]. However, v3 of them will
soon be released, but it can be easily located at the lore mirror for drm-misc.

This patch series tests that partial unmaps of huge pages are dealt with gracefully in Panthor.

[1] https://lore.kernel.org/igt-dev/20251127030145.585641-1-adrian.larumbe@collabora.com/T/#t
[2] https://lore.kernel.org/dri-devel/20251127035021.624045-1-adrian.larumbe@collabora.com/

Changelog:

v2:
 - Minor formatting nits
 - Moved all the new tests into panthor_vm.c, because they validate GPU MMU functionality.

Adrián Larumbe (2):
  panthor: Allow specifying offset when mapping a BO against a VM
  tests/panthor: Add VM_BIND tests for partial huge page unmaps

 lib/igt_panthor.c          |   5 +-
 lib/igt_panthor.h          |  10 +-
 tests/panthor/panthor_vm.c | 191 +++++++++++++++++++++++++++++++++++++
 3 files changed, 202 insertions(+), 4 deletions(-)


base-commit: 7bc8d310594c1dc1a851451845d1ea3c15fbd53d
--
2.51.2
