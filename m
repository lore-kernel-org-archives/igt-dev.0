Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFE606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fClxD5E0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF9A10FA40;
	Wed, 25 Nov 2026 09:52:56 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D1710E590
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 19:44:45 +0000 (UTC)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-920fb8b9859so3790216d6.2
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 11:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795549485; x=1796154285;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qBY3pbohUa30DWTCIdY3S5ou+p7iDAzUbkwoJghY7dg=;
 b=fClxD5E0f1I7k1Azi+AwSQvcm5mhWiXlQrFaNnGCvO5r8ASkMp2zZLqnPdl+7I2Tom
 JL0b6EueK6xhyKUBwAdDWzd588GQ9C98tbBeQbvg1Ni7Ks3j+4q8bwRfqLdn256unF1u
 0RPBFojNJ4ru65gGlyU/KV4epUSW9pmx8z6pTXe4wl0p4i+v6+66gkLv+uprx4lQMGFn
 XM6+ZfnwMHkD4HtZrSusP7A7iRlUNTMjIeZX6iU/LODgELgYyoNo+2PPPj1UykMFSXb/
 SbBApcoQxE33Foxyfn/JTCYEaFZ7YtuI29cJx2WiL9m1wRNhILXfdaiwksJzEHt7vIIT
 z0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795549485; x=1796154285;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qBY3pbohUa30DWTCIdY3S5ou+p7iDAzUbkwoJghY7dg=;
 b=IdkqpkwH7/WgFrtMPn46wq0DiX5EnofLGGE38aL1bDrIAvHxdpZZjJRUgU2pnyVYQo
 F6drgAQUxcLnQJW5CgokpUQG6kYi5ncTSNIvy44k3eeaZndvuw5YsWHLBwgo1REnrAlj
 Om+X1/F6IZSsjTL+2639SBNW4T3Eyn+x8+3fQzFkstyNS2VHBg2BfcGJMf3spblXzZkV
 VkosnlJZYMLdcqsiWcJKLft8T1a11m0Qsj5pjsJ+AjKeh0ScJkVLKkqeK0WE6sMseQfH
 bLdYyzL8m5xv4R17xE1nKIknsMEUx+yDZGo0sjXHNbUEsKi99bbTrCZH1trE+c8W9rHR
 4k4w==
X-Gm-Message-State: APuU4Z/Z7cPP2/2rImlGRCv+yDuZqpE1YwQm/fkBW4JOVndXUX6ABLqf
 ejSyUFEE1Rtkzpa6WC/suhVa7tCHrRXp3kfRe53HP8P9plLNb7HvHRwZLKCFRcWjWlkb0+OPF/M
 dGw7USEPfxNlzVtMJvhIfQ/wsLE483Qg85ZMuVluBdBKoz4XMoyvN41hqnZC92wcM4gWQZEzh+R
 kgcvo2Xi2juc8Qzvlj73Tm60V8UwqxAYM0uj0emJgl69Y2trPMcnkQ5quG
X-Received: from qvqg10.prod.google.com ([2002:ad4:514a:0:b0:921:1571:e6c1])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a0c:f00f:0:b0:921:1150:b15 with SMTP id
 6a1803df08f44-92134b496c9mr235038676d6.52.1795549484617; 
 Tue, 24 Nov 2026 11:44:44 -0800 (PST)
Date: Tue, 24 Nov 2026 14:44:39 -0500
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124194441.314626-1-gildekel@google.com>
Subject: [PATCH i-g-t v3 0/2] lib/igt_kms: Skip non-scanout connectors
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Jani Nikula <jani.nikula@intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Nov 2026 09:48:20 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qualcomm's downstream msm SDE driver exposes its writeback output as an
always-connected DRM_MODE_CONNECTOR_VIRTUAL connector next to physical
eDP and DP connectors. igt_output_is_connected() treats any CONNECTED
connector with modes as a display, so KMS tests pick that connector and
fail their first modeset with -EINVAL.

This series classifies non-scanout connectors from standard KMS uAPI
without affecting virtual-only drivers (VKMS, virtio-gpu, vmwgfx) or
adding any ioctl overhead on physical-only drivers (i915, xe, amdgpu,
nouveau, upstream msm):
- Patch 1/2 marks WRITEBACK connectors, connectors with WRITEBACK_FB_ID,
  and connected VIRTUAL connectors that coexist with physical connectors
  and reject a primary-plane DRM_MODE_ATOMIC_TEST_ONLY modeset across
  all compatible CRTCs as non_scanout_sink in
  igt_display_reset_outputs().
- Patch 2/2 teaches kms_setmode, which enumerates raw drmModeRes
  connectors on a legacy fd, to skip connectors flagged as
  non_scanout_sink.

v3:
- Split kms_setmode into patch 2/2 and use for_each_output() in
  igt_display_reset_outputs(), per Jani Nikula's feedback.
- Clarify driver motivation and zero-ioctl CI path in patch 1/2.
v2:
- Replace custom libdrm dumb-buffer probing with an igt_display_t/igt_fb
  TEST_ONLY probe in igt_display_reset_outputs().

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mark Yacoub <markyacoub@google.com>

Gil Dekel (2):
  lib/igt_kms: Skip non-scanout connectors
  tests/kms_setmode: Skip non-scanout sinks

 lib/igt_kms.c       | 86 +++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kms.h       |  8 +++--
 tests/kms_setmode.c | 37 +++++++++++++++++++
 3 files changed, 125 insertions(+), 6 deletions(-)

-- 
Gil Dekel, Senior SWE, Google | Android Laptops & Tablets Display

