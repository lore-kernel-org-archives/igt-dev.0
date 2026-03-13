Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA2107BCD5
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 17:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EA610E373;
	Fri, 13 Mar 2026 17:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="exKHnI8f";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CEA10E373
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 17:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773424768; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=j9pLqhWRdHtR24zZKUro+ENyH9T7fcQ+5QkxroSqopV07humB8qIzZwl8ogqv5Lrk20a6o4pa5w/uay6SmX1vUjeuZvxQ6H/a96KnB8F2rF2dSzjZMDUWLxnaruTsj3Gg3ZH204bdWrsqk1NuPgg9R0nOB7Xd9yNPV3RpaI+Ni8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1773424768;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3hsTphqO7G3BveUpfNg5LEtiRym1ivzIvrLTQ14n8OU=; 
 b=axDJtFJzlqh8R2spot1uRTWh4hlHd3gelPLO0ycyl5cCxoz3c6ifB8SAzqvJKTnGgBC/G6oSGrPEPJeSA9fD65TTTR3+w5fueK6PBM8tbNayZihmR6rtOVMjAbEwar4f2/0m0/+CQY2Y4cFB5XHugDnJkH3Z4oNYf/nFYn/vBbs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773424768; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3hsTphqO7G3BveUpfNg5LEtiRym1ivzIvrLTQ14n8OU=;
 b=exKHnI8f2uJepDZk8EkkONOqYdmhKbU5j/ZzK2Ad1jr8xWZnSjLt0qLDbxJDTRsD
 oNaIqss8SooNix/U+J8/YIt7N7rdmKJABkvj7V65i93Moh9C99xZ8NftWpAsyy3aHSs
 xnkgWyFKoZ7l2oT+q8n/iZ1PlAyKpJVHgrV4CZrs=
Received: by mx.zohomail.com with SMTPS id 1773424766411775.0824085326719;
 Fri, 13 Mar 2026 10:59:26 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Janne Grunau <j@jannau.net>,
 Danilo Krummrich <dakr@kernel.org>, kernel@collabora.com
Subject: [PATCH v1 0/4] Test panthor repeated mappings
Date: Fri, 13 Mar 2026 17:58:27 +0000
Message-ID: <20260313175908.1752151-1-adrian.larumbe@collabora.com>
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

This patch series adds IGT tests to validate Panthor's repeated mappings
functionality. They are meant to support sparse bindings in Vulkan, but we
found it necessary to test it separately to make sure all corner remap and
unmap cases intersecting with repeated VA's are covered.

Kernel changes necessary for the tests to work can be found at [1]

[1] https://lore.kernel.org/dri-devel/20260313150956.1618635-1-adrian.larumbe@collabora.com/T/#t

Adrián Larumbe (4):
  drm-uapi/panthor: Sync panthor uapi
  panthor: Move issue_store_multiple into library file
  test/panthor: Add support for repeated mappings
  tests/panthor: Add VM_BIND repeat tests

 include/drm-uapi/panthor_drm.h    | 190 +++++++++-
 lib/igt_panthor.c                 |  42 ++-
 lib/igt_panthor.h                 |  13 +-
 tests/panthor/meson.build         |   1 +
 tests/panthor/panthor_group.c     |  34 +-
 tests/panthor/panthor_vm.c        |   3 +-
 tests/panthor/panthor_vm_repeat.c | 555 ++++++++++++++++++++++++++++++
 7 files changed, 800 insertions(+), 38 deletions(-)
 create mode 100644 tests/panthor/panthor_vm_repeat.c


base-commit: d3c67e0f1fa76ac3d71095825bbc9df0d307e4fc
--
2.53.0
