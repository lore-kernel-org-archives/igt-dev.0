Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68C6D58D50
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 14:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC7010E28C;
	Mon, 25 Nov 2024 14:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1JiUFtM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E65710E28C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732545235; x=1764081235;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=7QwBj8BoDnqBKVIoFod35bRHzZMh6ZtQU1XmngELblY=;
 b=V1JiUFtM9Y/gGmrZ80XiAkIWMzsFZ497f8NX0i/Dzkl0KcBePRGt2tu7
 JQzgulEa65WEvtCjOp5QgS+pyuGjLEgiL3KneHhRJBeGStwQZJpfkkYyD
 1uwtzvTWHsVQchkTi77qpIySp2tPdqXRR/OvRWa8UN2SSZbdkK1q+Nmr4
 WfbLnFsJ55if95IpE9cNnaB5uKeQ4R7mrlTSdHyKTtxZ9DQG0esxPB5U8
 b7mYCSPo38Asa5ybAB50YUngc3MCKP07RTzzn8yVe94SkldV2kN73G7qr
 9d6X/neUYMQEqdV/+jzkcHpuykRjZcAiu39DJVSeSDl5yCwoWPdoDS461 g==;
X-CSE-ConnectionGUID: FCHxti+GTu29sJJJuqangQ==
X-CSE-MsgGUID: Pd4uIOXkTe+DoIfe6Df4uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50177107"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="50177107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:33:54 -0800
X-CSE-ConnectionGUID: QqUMm8KlSFqfedKK6Cp8ZQ==
X-CSE-MsgGUID: GApP7rT4RU6C6E6pDwJlMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="96349997"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:33:51 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 0/4] lib/gpgpu_shader: simplify load/store shaders and
 add Xe3 support
Date: Mon, 25 Nov 2024 15:32:59 +0100
Message-Id: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJuKRGcC/23OQW6DMBAF0KtEXtetxwwO7ar3qKJobAawGgyyC
 WkVcfeaqAsUsRnpL/77cxeJo+ckPg53EXn2yQ8hh/LlIFxHoWXp65yFVhoBlJHt2I7Xc+JQnyP
 fhvgtKzhSwdigQRa5N0Zu/M/D/DrlbCmxtJGC61bpOqYpMvVvPaWJ49rofJqG+Pt4Yoa1978Hu
 LM3g1SS1TtgPny0+tOHiS+vbujFujfrrVDuCToLNbgKoSiJqHkWio2gYU8osqCsIcKKrFLmWcC
 tsPsDZsGBsaWpCJqi3grLsvwBaOpykJoBAAA=
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=7QwBj8BoDnqBKVIoFod35bRHzZMh6ZtQU1XmngELblY=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRIrMqAd2uzC0rLb1HBcSGq2G6GKTWkU7xFHuYvnI
 ITwQMTmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0SKzAAKCRAjYrKT3hD9114JC/
 4jGH/sEz7cjQVW5MEQQqlTrz6epqN0Oxh4mzhwi7QIAGDA8639KPICYHJnJsLzVvony+GA8sBK8RRn
 PVqCAKh8v9LZG/fXOROqzhQFBXrIC4yjY8LGsOee6qpOHSytw2z00uJIWIRqode0mwIE9vgHLPmjEm
 H5gdpTcI7x4YVHuKtwzZyCQzc3wiOeoVmoVgBsWTRRc23zWBiobSytbL95VS0u5f5ZYvHvmSJnOubn
 XjkOpDjd4uT+mGgNPMsVwWapwdASEOJSuqi6T/i8arEHyl9ZF3Z3cdqR4wBukq5YD+fdD2lLT3Nlmf
 Zw6Zo7uYlTknhIx90FoMgCOxBEMMBNVwB9VgWnO8o/oCGQvPIBmJEHUSmQfOOG05wakjpOouFrvCKc
 1zcNEbc9WyhOHD8op8p5DaIlr2bHqvsB9iaBNrbpJ3iE4XQZKOybaTv112KWWtGdSO8p3D4GKr5EI7
 8Z9ZS1+8qgpxteuRx1I5IH5RbwU8AZxCX6RQy/+/2X+0M=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

The patchset tries to simplify and unify iga64 load/store assemblies.
Moreover it adds support for Xe3 platforms (PTL).

v2:
  - addressed comments to v1, details in patches
v3:
  - added passing surface descriptor via COMPUTE_WALKER/inline_data,
    required for stateless load/stores in Xe3.
  - added support for Xe3 platforms.
v4:
  - fixed placement of gpgpu_alloc_gpu_addr changes(Dominik),
  - pass vm_id in gpgpu_alloc_gpu_addr (Dominik),
  - added R-B
v5:
  - updated comment in the last patch (Dominik),
  - removed extra lines (Dominik)
  - added R-B,
  - rebased

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com
- Link to v2: https://lore.kernel.org/r/20241115-gpgpu_send_rework-v2-0-d1c84135aaaf@intel.com
- Link to v3: https://lore.kernel.org/r/20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com
- Link to v4: https://lore.kernel.org/r/20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com

---
Andrzej Hajda (4):
      scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation
      lib/gpgpu_shader: simplify load/store shaders
      lib/gpgpu_shader: pass surface desription to shaders via inline data
      lib/gpgpu_shader: add support for Xe3 platforms

 lib/gpgpu_shader.c           | 188 +++++++------------------
 lib/iga64_generated_codes.c  | 329 +++++++++++++++++++++----------------------
 lib/iga64_macros.h           |  72 +++++++++-
 lib/meson.build              |   1 +
 scripts/generate_iga64_codes |   2 +-
 5 files changed, 280 insertions(+), 312 deletions(-)
---
base-commit: 027caf37991f4d39cb41beaf82dc7c920d976db6
change-id: 20241106-gpgpu_send_rework-817a3e4f464e

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

