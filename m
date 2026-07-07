Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3A5C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 21:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3047810EF00;
	Tue,  7 Jul 2026 21:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jQBTRtva";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F58D10E30F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 21:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783460275; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y1McjTEBCJv+wJuY/SKNLNM8f+fZTI9v166vVaoF7YezRUAN6WEyZg4ECn0MB53WBE0B12ddUy/38Z42xgYXWWvdSSX905kcJMnJYDOTmcZQqCA8CxsUDWGWhX32FYT2wvB9b+pwuoY8V/4C6gZpPoMyy+LXM+GCPyHrawB/Fe4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783460275;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VtCzgaywQEJ8+3lwUR5eh1dCpkdryCQ9jC+53jnm1XY=; 
 b=ZMxBm0+XIfn3RL9sczKn2b8ots7degle7tkJzTb/hvX8x7XJ8F6945LaBSrpeURcBV5rZ/cJ4hamGjNlhC6bw5hoV6uUMAfusHpBc2Jp7zXu/yJTcSyDoXirTfrQVdXBeRpe9YjxQ3lHDH5iLu75Ek4HShgvacp39b2y5TKTN1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783460275; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=VtCzgaywQEJ8+3lwUR5eh1dCpkdryCQ9jC+53jnm1XY=;
 b=jQBTRtvan00pgBTC382cVxwGf+jvf8x/tJo9VXRvpKnDgPm8Gbv08gWlcmNs9Ijd
 wKcvO5RqBwmqFyJMJ/naHyrK9472nJJ55p6VSFshPVO8NiNGK1IDs1x4mBiTVcVq7BA
 Gc32/O1qQsB4Wqfot4b6TP0sXl8vjPJJqfah2y08=
Received: by mx.zohomail.com with SMTPS id 178346027443337.338192983743625;
 Tue, 7 Jul 2026 14:37:54 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v4 0/3] Test panthor sparse mappings
Date: Tue, 07 Jul 2026 22:36:25 +0100
Message-Id: <20260707-panthor-sparse-mappings-v4-0-fac6061f5adf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOwWrDMBBEfyXo3DWSZclNTv2PksNK3sQqtiRWj
 kkI/vfYzqFQ6PHBzJt5ikIcqIjT4SmY5lBCiis0Hwfhe4xXgtCtLGpZW2mVhYxx6hNDyciFYMS
 cQ7wWaA01Fysb7dGJtZ2ZLuG+m7/Pby4390N+2nRbog9lSvzYp2e15d4rRn6qtja6rXRjrDkaU
 IAdB4zVgHwbHX35NAzoEmPl0yg2/ax/BVYd/705a5DgnfW1ls46L/+6lmV5AZ45uWoVAQAA
X-Change-ID: 20260616-panthor-sparse-mappings-75e4f6043cab
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Steven Price <steven.price@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=fWPbb/45ZdpdMVNO3yml8+1ObzhxhEsHJkL13mY469E=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqTXGnhPp89r+13Qa3avh7fzNyW57cKfPWNkpeu
 tA0dXC0WfOJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCak1xpwAKCRAOJn5M7lND
 Pb8yC/9UgiC+Rv3RxSsd2b6hh/m2tJkbxevK0VROogncdnjdy8kF8Tz/wOPPE/am/M+Qv3GSs5h
 rw45vnrRiwn2g4/9O0kfFqEDNu84pPX06GJ+hVAqvTpnbHo+VjF2WipvMhxGdlGAZEsO6UDMkkb
 2euQH7qE4sY6gCpfHm2oQbjBoHMVMcw8M6qFxQO83mzhoRwlm8He0azKhnRaDX9fpFKUFXp4/1i
 6bAfPZuDE0BHSsRIH6WWfgwqTKBiblTQkqHY6elti+XKeCMpaLdNv0YOIoX9X3RKZ5oGiL/1bxV
 82gg++7I9hjIZd73DvuQ5EENHDOo0jclzdNmznnfTlfuERnEckSIoTmd5+N2Dpytayz5C/pSeMy
 Bp1xwoPjasrDT8NAYBpna97rmDttZLejyUGULhog/GhfXWYy120C7V66lCFqGSJnsd58N9uxxCg
 FM93p0FZyxG7HKOfhzHpwoWblZ0C+anvjx8ljeLyOB03Hsx98FpBFDZM5I7SNpwMu3ctQ=
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

kTo: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
Changes in v4:
- Fixed commit message that pulls uAPI changes from Panthor to reflect actual source brance.
- Added two tests for checking sparse bindings' range overflow detection.
- Rebased on top of master branch.
- Link to v3: https://patch.msgid.link/20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com
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

 include/drm-uapi/panthor_drm.h | 246 ++++++++++++++++++++++++++++++-
 lib/igt_panthor.h              |  10 ++
 tests/panthor/panthor_vm.c     | 321 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 571 insertions(+), 6 deletions(-)
---
base-commit: c5721520bb6611ab8fcbe27db0c120b72d25b99e
change-id: 20260616-panthor-sparse-mappings-75e4f6043cab

Best regards,
--  
Adrián Larumbe <adrian.larumbe@collabora.com>

