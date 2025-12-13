Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB90D5B15D
	for <igt-dev@archiver.kernel.org>; Sat, 13 Dec 2025 19:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39ED10E191;
	Sat, 13 Dec 2025 19:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="TzCOX+hG";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16E410E191
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Dec 2025 19:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765652541; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dSbSmFi5mVazsnadptQr3LG8B1ekh531U6SyrCuonNIZRodBRYatlVdT+RtU80wBi/VdhGwdkZKXTyJJ5Dfj77p60JFPf3I8jawPGmzLJtz6HAhfJwpg7v14srlzU8N7YRdgreQcqN/Pihz5SU7UcpTaFhawq/dydQAoZ7HdzyA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765652541;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=q4m0tLf++BBa7Jdre1F5tQVJVsMvekMGQfb+OMEsE3A=; 
 b=acRWreCq+aUdYUUIX3WhacoAMuVVsst5kZgb56pu7GfZQALVQ5f5gDRDO7HkkwjhmF0xVki6Zz2i8LbpsEnQHzHUPFXSwZ/gyz4Mv9paIaAVjONdAsZX05dz7GBt4Ihx5Lniue+AVqfRuz3NHDkd+6ONOWDH7DU6X4JOtaNmV/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765652541; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=q4m0tLf++BBa7Jdre1F5tQVJVsMvekMGQfb+OMEsE3A=;
 b=TzCOX+hGmA9L4E/9jZOeh3v8GiKb+6GUDSONuI5+3SeVw60CpCmee6/24nwbvw4x
 bsYhNsN2uFH6u+s5kSmACYlgqXfpfSiIXv5eX7IgqUUx1tYeUVr0PVfcLTZFrAX1+N/
 hnLAac/E1HG2UGXinyfRZEJg7l3U3/qog8/7alxg=
Received: by mx.zohomail.com with SMTPS id 1765652538816456.1828251388231;
 Sat, 13 Dec 2025 11:02:18 -0800 (PST)
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
Subject: [PATCH RESEND i-g-t v2 0/2] Panthor tests for huge partial unmaps
Date: Sat, 13 Dec 2025 19:01:36 +0000
Message-ID: <20251213190205.2435793-1-adrian.larumbe@collabora.com>
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
