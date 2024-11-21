Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750D9D78799
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1165910E9F3;
	Thu, 21 Nov 2024 17:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je/PZ4c6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D97B10E9F1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209204; x=1763745204;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=a/Hb0/19utz4cmqS8p1C35l+pfSj3r8xra+hDFfL9EI=;
 b=je/PZ4c6Yr8nHoK50qnmkhObBhNtU9AzrHmDHALiLrcNhM015Y0D+NUD
 es5gMwFsfkp91FD/Xv8H6BvJiaTvFb/NiEmtS8j5XU6DC+eso3nzqJ2AH
 /ysaTWI6meXFUGSmRlXQSye0TzmPasO2HV6UnKXR2cHiAzrcY7FAT5qOV
 MildIj+MeNLlDapu7beIOuKyDf4nitO9w9iFi8GlO5GjzBY23BFroIaG7
 YYmi9N/3DJJLYIAX7vYOEVfrz52q54pxvhDS+aT3Y2cCsys8og3kBv6Rr
 yVe2diA/RBF0dd3jMvqNLxpZtS2sttqOSatHz7Q+/lII4X5c2pXI2XIhp A==;
X-CSE-ConnectionGUID: N8JnEEKwQrCFOf6LgALWvg==
X-CSE-MsgGUID: ZOY+7L0OQPy6f0Y0L1c3nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42953408"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="42953408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:24 -0800
X-CSE-ConnectionGUID: z5sGn4xCSO+MyNdwlFxf+Q==
X-CSE-MsgGUID: VGOW4K/uSIyFXwD9KQe5gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95365417"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:22 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 0/4] lib/gpgpu_shader: simplify load/store shaders and
 add Xe3 support
Date: Thu, 21 Nov 2024 18:12:48 +0100
Message-Id: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBqP2cC/22OzQ6CMBAGX8X0bJUtxb+T72GMWWCBRmnJFqvG8
 O62xgMHL5vMYebbt/DEhrw4LN6CKRhvnI2QLxei6tC2JE0dWahMaYBsI9uhHe4XT7a+MD0cX+U
 OtpiTbvRGk4jewNSY57d5Okcu0ZMsGW3VpdJ98CMT9use/UicjM740fHr+0SA5P32QP/ZCyAzS
 dkedDy0LdXR2JFuq8r1Iu0FNS8U/woqFmqodhryAhGbeWGapg/aQad2FgEAAA==
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=a/Hb0/19utz4cmqS8p1C35l+pfSj3r8xra+hDFfL9EI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnP2ovclDvc0E7db9qU0v2NTc7Sv7DxYfhixYd9kFU
 hiAD+ASJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZz9qLwAKCRAjYrKT3hD916EdDA
 CP0MzSE1YC28YxanFK4wjx8/qF7NkqAKBOF1z++qlnUhB1EKjfczFVjEOxUEKKmdnmElaw4Pjj+i6k
 kfMQ+SjmFz9JoCsntydjeG0Y0Q81zHU1Fo3xlAopWL0pJ3TisKD25K1hsbmNXnY4Wjub/R3/Oadncc
 E6deg81O4uD1VIehMiPJ4weucocDfwk3PYBN6qlV835Gn/NLAWGwSFDfBCvoCzZYwJZ7yzLE0jmU2Y
 LEIr2GKmccg26TkQ0BTEEV1RcMZDl9dDbx1/ZpLGNm2RZSj1onGrRqGCNmkeTtAPJgcKHx+ITVaKXp
 cd+UHO+77A8oEPoGuhlx4C6ZBoTttnawSrOhOshOVmSBbkGUvs19BxHtcF0Z8Zkt1WaO4krgHfEOoP
 s0RHLgAUcEbUEhZUACM0+1PKEtOuM2RwJ/NNcCt/XZ4XD9z7nfjNTkCcxgybSttCtkbSwUk1Fvdf22
 zeffeO36/oMW5KYEv2roklCDgMyCM5+ENFcnvu/yWsv/0=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com
- Link to v2: https://lore.kernel.org/r/20241115-gpgpu_send_rework-v2-0-d1c84135aaaf@intel.com

---
Andrzej Hajda (4):
      scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation
      lib/gpgpu_shader: simplify load/store shaders
      lib/gpgpu_shader: pass surface desription to shaders via inline data
      lib/gpgpu_shader: add support for Xe3 platforms

 lib/gpgpu_shader.c           | 188 +++++++------------------
 lib/iga64_generated_codes.c  | 329 +++++++++++++++++++++----------------------
 lib/iga64_macros.h           |  77 +++++++++-
 lib/meson.build              |   1 +
 scripts/generate_iga64_codes |   2 +-
 5 files changed, 285 insertions(+), 312 deletions(-)
---
base-commit: 190dec96be5487f86c45b7e6cf11b8174ebabf31
change-id: 20241106-gpgpu_send_rework-817a3e4f464e

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

