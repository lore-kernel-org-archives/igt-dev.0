Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFFD606A320
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRZKCdIb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6469210E3A5;
	Sat, 21 Nov 2026 09:43:49 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E89510E3A5
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 09:42:46 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-1a2af4c8d00so3139517c88.0
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 01:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795254166; x=1795858966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VZJY1bIb7dak4IvxCv5mbhcRFV0v3mJ1FNEAp11JAgg=;
 b=MRZKCdIbtL3Q2QfKkknKqRS+uAMp9zh5D8jBKbg9HqH7cti7rIckrF9vZiUgMdaLIn
 hIcoanvH4mMh4eA3KhIlnYp3NE4NNRL105uHJLSLZ7xCg3+lRYqJba2tDwILwQiFSHOY
 7UWVtXfT6cyarXoIvcsvv7X2BJiRYYqRLrqy+kZ+OeULBpj/lQcRjyEnKh0buO1LobwV
 PtoOrhqRhkLe5Gu8D2mdTMeX2QsetFYgz+aD0UfH96hxUawfZu3l/oduGUWou9Ow9umP
 1Gi1vkBfSkIq+CmtWKmpvX0o3yPkl9gZm427GXGc1CqRloXyTAXqpv1NpGBn0XKx1kXY
 s8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795254166; x=1795858966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VZJY1bIb7dak4IvxCv5mbhcRFV0v3mJ1FNEAp11JAgg=;
 b=ZMjPHwcBTfG3t/jz77aolDr8cSEFskbjgy73YuVtf+aEJ6qPrJusUl6xuluJrhQFyU
 aOrjaYSBHVB8AKua69WnEKGbulxW5TWKlwRKM9bJAOZ3wsUVYoG1WF+5SFKdfL2sOE7H
 24AN/lV0tNy7OQWq3P4oDv82CuUaCDYgaUEPE8HwFpXvrL97RLzOSFGWq0MNCpOFmzzH
 Z8YNKOrTyulCLGwy5akZF/kv7wa9cJUsJAXYiyv0Gxhb/sLmxw7BINDrUy9kSh4Kt3BE
 T7igcYUCq+RBIzpgevFsR9vwHWwDFVKNaaWOj4m93q9l/6TfEUJU3f1fUZcLDD3Dt6UH
 wvBQ==
X-Gm-Message-State: APuU4Z/Hy5+jt8uUi6BIF7GTWYmN9mHvPXMiAiFrKliuxsAFB579et9R
 7yOg03kslhlpg10+p5dQpwpE2YoBGQpfXB2BjqUbLcnI/ipAqQ0YMkg8BV1wVw==
X-Gm-Gg: AZFdTZebfsfqNlf27OV8nr7bGTwYkB7QHrLHGffVk3m1rt/vNyoZYbQFBpQpqNtl4xm
 7FYb+JXLFS/ucp42h/5OquRJxgAeNysIyaof8uN5TRRjgG7xfbhYfDOSQsQBaILOtWfLyHjwKCG
 FlIA2QmIMx19F6AXGzQz2eCrKBqzdk5uXr1lSKCgAjFd98xVc3U6bJkWxTDZinW1+QxY6Uohgxf
 Z66bgh2IR7ilCswvOWLR9ehXB8r/XebnpkMreryZYOqK8jD2bfJLlMC3qlz05ohmgCF9zYU3bEF
 BdfIsUoFrVlyI3M3OOcBIMZzNRO0XPe3ERiGDlvSyBdi/Et1/cB9Gm4ea8jc4yoWRTkSmf1GvXQ
 xIsTZDEBAVs8c+qq265YOzmdt+lH8oxqMqMXo4HL3MzkfgTXPl0TjADm4gsj2PV9xoGODAe8Eeq
 zV+RnIkc9BYWnKmoRHDll7pAjORgKAbZBWJe0NntvuISS78OBTTYltq2u4naD8nKWqnpsri8zmu
 y1IwShMB3yc4gxFYu4ldSpnTHLe5a8GaTvUHMpfTXAhnaUYwSV5x6/ub1fSmtfwYePhqZRC8BBH
 ahjZd/AbKS0p4uxQFi2X/QQ/Nv9e4NEN2ezz0DsCTg9bTg==
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id
 a92af1059eb24-1b5568e5983mr7160417c88.28.1795254165834; 
 Sat, 21 Nov 2026 01:42:45 -0800 (PST)
Received: from gye-SER8.tail6a86d6.ts.net ([121.125.115.175])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55684c85fsm19092456c88.14.2026.11.21.01.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 01:42:45 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 0/3] gputop: Support accel devices
Date: Sat, 21 Nov 2026 18:41:54 +0900
Message-ID: <20261121094225.628262-1-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make gputop show the clients of accel devices (/dev/accel/*) too.

Accel drivers print the same drm-usage-stats fdinfo as DRM drivers
through drm_show_fdinfo() in the DRM core, but igt_drm_clients only
scans DRM nodes (major 226), so they never show up in gputop.

- Patch 1 extends the client identifier from the minor to dev_t (no
  functional change).
- Patch 2 also scans accel nodes (major 261).
- Patch 3 shows the device node and driver name in the client header
  instead of "DRM minor N".

Tested on RK3588 (Rock 5B+) with panthor (GPU) and rocket (NPU) running
at the same time, on drm-misc-next plus the rocket fdinfo series [1]
(bars trimmed):

  renderD128 (panthor)
  PID      MEM      RSS  panthor  NAME
  727       9M       9M   100.0%  gpuload
  accel0 (rocket)
  PID      MEM      RSS      npu  NAME
  724      23M       0B    14.7%  benchmark_model

Not tested on Intel hardware (patch 1, Intel frequency sysfs path:
/sys/class/drm/cardN -> /sys/dev/char/<major>:<minor>).

[1] https://lore.kernel.org/all/20261120141225.789350-1-sidong.yang@furiosa.ai/

Gyeyoung Baek (3):
  lib/igt_drm_clients: Track clients by dev_t instead of DRM minor
  lib/igt_drm_clients: Also scan accel device nodes
  tools/gputop: Show device node and driver name in client header

 lib/igt_drm_clients.c |  41 ++++++++++-------
 lib/igt_drm_clients.h |   4 +-
 tools/gputop.c        | 102 +++++++++++++++++++++++++-----------------
 3 files changed, 88 insertions(+), 59 deletions(-)

-- 
2.43.0

