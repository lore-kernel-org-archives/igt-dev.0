Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D04D65C63
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 21:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241410E917;
	Wed, 17 Dec 2025 21:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="HzV8gxVU";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4C10E917
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 21:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766008764; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KTW1cycJrFC9StslVqATQI1suaomqeFknVmUNFO3WDaKI33/kbaAXTKoHkgvdw/jfa4A8No1Jpf4gQSqZQ54ucBUXsqilXzlD0euy53IV63Lvv7yIehheH29pqP1PrM9xi0lHVEnhqnWqPSOiZKibVdSavXr4aVMySTfP4H+UPw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766008764;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ifSEaxyX0w5PfKAvmCfZMBdhcDNrJjbdHMJWkeBaGVs=; 
 b=BDYvcbvFOE6YkxPC3mPK4Zv7+ON4kDZvFX2Ra+o2kkoKgqhU0S0W9QgQU38/vBKy+5+v5SyTTPjn1DHHChvvuRpy+yP5Z8ZD7a6p7SCMbCqVNSeIVIauBf52b0Vrp988u3GJ3glV7Mfn0C7JvA6T8kRcy+jaq2Znch8HgzzV5ps=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766008764; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ifSEaxyX0w5PfKAvmCfZMBdhcDNrJjbdHMJWkeBaGVs=;
 b=HzV8gxVUJhcOyGnMnX6eIqLd4SYLinAT/OpJTJ3Mzb/gHju6TVRrxaSCTtNHoeCF
 lunBnDeHL9eZkhYi3BYKa4TU4B9xOWJcl1OnWihuJgfOmOTrWsmoc34Xjo4OZtYnWLX
 yUrGNdWmUIue/Cyt1DvoDru1XoQbto/3IQP8n6ms=
Received: by mx.zohomail.com with SMTPS id 176600876229920.567807046016128;
 Wed, 17 Dec 2025 13:59:22 -0800 (PST)
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
Subject: [PATCH i-g-t v3 0/2] Panthor tests for huge partial unmaps
Date: Wed, 17 Dec 2025 21:58:55 +0000
Message-ID: <20251217215909.710730-1-adrian.larumbe@collabora.com>
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

This is v3 of [1]. Kernel changes being tested can be found at [2].

This patch series tests that partial unmaps of huge pages are dealt with gracefully in Panthor.

[1] https://lore.kernel.org/igt-dev/20251213190205.2435793-1-adrian.larumbe@collabora.com/
[2] https://lore.kernel.org/dri-devel/20251217213252.677020-1-adrian.larumbe@collabora.com/T/#t

Changelog:
v3:
 - Rebase on top of latest master to deal with rebase conflict.

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


base-commit: 1072e4f2e729d86a668819d3e142e6fe39befbf1
--
2.51.2
