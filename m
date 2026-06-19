Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59548CD98F6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 13:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0638310E084;
	Fri, 19 Jun 2026 13:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Ocuw2bya";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847D910E084
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 13:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781877279; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aEyvGGL8AgHh59Bm1xmc9tpGm4Hf2zqdRVlrpJCYHb1BnOvuSew/qr0cn/w9oriy9yl7oQJjh5WcN/Jbu9msHLVisLNaW0FBhzPRGqnHTdppGBdtFBmAKymFZqRwsxXluuoOEFUxxb8MQo6JyTJeuNQSaJbn7QVLeuvFu5kNVKQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781877279;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XK5IJwpADPUiq2zPMqFwQf4EKN580rfjfWOxFOBVjMw=; 
 b=HAlRbZ3au5ZD8+0Tgdnm7COMwkju6ibxPIeZ0n0JsxZFV2ksYf//jMvi5VM1MYinsF3/56XLMb4lH5EK7/BgcbYeICClgro7maaX37C3p+xrelNBAdZDQZFKBwiiYAFQuGSyPIuvwa96uajV9efWF6erRkj2Aj+sFAG0QOhskjI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781877278; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=XK5IJwpADPUiq2zPMqFwQf4EKN580rfjfWOxFOBVjMw=;
 b=Ocuw2byahXaAUrZqmH3JdfN9OwmPCsM8M1xxsVBh3TAuy6uax7iWvRu9aSKVSpCx
 ZbbRS6BvqSGdXi2lfUzMP+C6t8ewi2Rbs+4CFs781ggKKyHPmHHrSy6hsDzr4XxdeYX
 xKkfyjPZXT7hTWNzBV0gOMYgyP1W1WTEo52TXLWo=
Received: by mx.zohomail.com with SMTPS id 178187727676195.31268162202707;
 Fri, 19 Jun 2026 06:54:36 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v3 0/3] Test panthor sparse mappings
Date: Fri, 19 Jun 2026 14:54:27 +0100
Message-Id: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNyw6DIBBFf8WwLgZFsO2q/9G4GHFUGgUyqGlj/
 Pf6WJ7k3HNXFpEsRvZMVka42Gi920HeEmZ6cB1y2+zMcpFroTPNA7ip98RjAIrIRwjBui7yUmH
 RalFIAzXb14Gwtd+z/K4ujnP9QTMducPobZw8/c7rJTu860WJe1bmSpapLJRWD8UzDg1ZcOkAN
 I81vowfBqg9QWr8yKpt2/7+G4pOyQAAAA==
X-Change-ID: 20260616-panthor-sparse-mappings-75e4f6043cab
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=BW1X3jJUicFLqKsPcYNqgPV4r+zgmltybViVQfKofyk=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqNUoZH+28OAQ9tH8Ak3DevEUoUrWTgNU/ntAtg
 EOWubi+FOKJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajVKGQAKCRAOJn5M7lND
 PbH+C/9DYKskpAbdg9WS9hzzEO44StNW+HAXaGPKBzahyiw5LsvMZt7cIXGh+tPYBdIGn4xgtU2
 WlGi6y/3LgZ5Kt/8mLCe2GME5MODrnFnF3FImPyuOB20CaOwKSb58zF6Ktss5H1y7tdl9yqkIgt
 EAr563ZJrawTHICy7yO4QAiA8BvwpbOvHnJrWYYcqnoTUNtprfVlipBWL2u6Hn0/J0CCPjeK+ME
 XvclHMVtJVMTbI8oV0FM2Yvq4gLJz5t/+M4QYuYkj+Ubla/Pu+sb3/i5xzoiRV22vRhxWvfw1LA
 IElNsSMPIkTHcwXZGXkOD8PvpHzlTY9PNeH83ju0F+PBhjJlM4AKRzascBegGwAQKA0rjqpwzUV
 Z8uksdGQljSZS5xlO5wkII3TDICgUByCT9VFfei4hLRkUfZ30lAP5KvSlAR/NNsw9gu670Fxdrl
 pu4MfVgaxKR/SDwjLGj6rK09YMdH35Q4sJpOxA8t+a4txQtP2zu2ewulpM3Ep7iROF06s=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D
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

This patch series adds IGT tests to validate Panthor's sparse mappings
functionality. They are meant to support sparse bindings in Vulkan, but we
found it necessary to test it separately to make sure all corner remap and
unmap cases intersecting with sparse VA's are covered.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
Changes in v3:
- Moved all the tests into vm_bind.c
- Fixed a multiline bitwise OR formatting nit.
- Added igt_describe() macros to all the new tests.
- Fixed commit hash numbers when updating uAPI file.
- Removed vm_bind_sparse_high_vas because operation is illegal
---
Changes in v2:
- Reformated DRM uAPI update commit so that it meets the usual IGT convention.
- Renamed panthor_vm_repeat.c to panthor_vm_sparse.c to reflect changes in interface naming.
- Deleted test that submits job to the GPU targeting bound addresses because sparse mappings
 no longer require a user-created BO.
- Changed interfaces and sparse mapping sequence in the tests to reflect the changes above.
- Link to v1: https://lore.kernel.org/igt-dev/20260313175908.1752151-1-adrian.larumbe@collabora.com

---
Adrián Larumbe (3):
      drm-uapi/panthor: sync with kernel 12cf826bf1dd
      panthor: Add IGT library helper for Panthor sparse mappings
      tests/panthor: Add Panthor sparse VM_BIND tests

 include/drm-uapi/panthor_drm.h | 246 +++++++++++++++++++++++++++++++++-
 lib/igt_panthor.h              |  10 ++
 tests/panthor/panthor_vm.c     | 291 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 541 insertions(+), 6 deletions(-)
---
base-commit: 8d2d82db00ea4c2c8c5904520323067607e5d75b
change-id: 20260616-panthor-sparse-mappings-75e4f6043cab

Best regards,
--  
Adrián Larumbe <adrian.larumbe@collabora.com>

