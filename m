Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA5D6DDED
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 10:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D848E10E857;
	Fri, 15 Nov 2024 10:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ae9Z/MHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A532F10E84A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731668367; x=1763204367;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=4H6Giqs2FUDqnEzZmFCYF5rtQicroMbnWgnfkMpzXok=;
 b=ae9Z/MHfks8wlahrZEdJGt6jV/Zxsui+JcutiJ3f333TFqbxB9s5pXo6
 gV7KkWq5moD2ZkxetKwHIA92Y7iGUBTrf4qZtgdI13znoOBCZqD2KN6GB
 x4aY/YEhhVJaRvK5SAikZXY9XupN4nlTfKAxZ+pDypNIlMAtL3riG3axx
 3UZcBLEYxGaoz2T9PQHtqWyDEK8IgafKKo/m0G/AxyB0cYbbxvOX8OUDT
 OlGYofH32e1DwlmjDKp/ZemE0fAu9LkrzWHp2LGLMq/vQDd51mKP1Jbrt
 9IVn3RQGK2UpN/D6QkA9DzyO6DjRB5tUJLVLMbqnHTAJwiHBVYNzNfwzN A==;
X-CSE-ConnectionGUID: DnO0/Eb0QSel0RKlv191mQ==
X-CSE-MsgGUID: XdbbRSATSny5AMJqb7YDpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31824701"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31824701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:59:27 -0800
X-CSE-ConnectionGUID: egmA5hD0SteNY/mc+gpC+g==
X-CSE-MsgGUID: tqYO29omRbGjsvNXzRxHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88948331"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:59:25 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/2] lib/gpgpu_shader: simplify load/store shaders
Date: Fri, 15 Nov 2024 11:59:10 +0100
Message-Id: <20241115-gpgpu_send_rework-v2-0-d1c84135aaaf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4pN2cC/22OQQ6CMBREr0K6ttrWRtSV9zCEFPhAo7TN/wU1h
 LtbiEs3k7zFm5mZEaAFYtdsZgiTJetdArXLWN0b1wG3TWKmhNJSihPvQhfGksA1JcLL44OfZW6
 OoFt90sCSFxBa+94670XiyhDwCo2r+7VpDBQRzHAYDEXA1egtRY+f7cQkV++3J/WfvUlywUFcp
 E4BeaVu1kV47ms/sGJZli9FSagj1AAAAA==
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=4H6Giqs2FUDqnEzZmFCYF5rtQicroMbnWgnfkMpzXok=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnNymLF/weK9ZeXFAHTHNHTeAfwCdREc1y8kZWdn5I
 wfczUbmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZzcpiwAKCRAjYrKT3hD913etDA
 CC+FxJPJEnJc4ALPL/Sx7UQvHOc/n11Fsap6ubpt5SuUgZDKTtkCaHRDgpUOACL+Lx1WMrFLX12Jfu
 lmeBmDbpt2k7HQoijV6gk/zLrdAigTdEb0DYgjmK2MpMP0HlSWXxdT9rKolRO8HSagi4kLpVUds5cV
 6rD2is+U8GFk6UAmS9ClBiT+1MsrSXtgaQVsI8u0mVOf5uGY/4S4uCNAIiG/pVGG/Vm64sFOLZATTX
 Hx8A9jpsNo0FCflMrL+gtaZZcGLrQ9iep6FBY3slsbpFB2GJ9YT7MXt6D3lPUe1Kx92MsD1pTMMLjb
 Ik16s0OBg8DPl1ObWy4mRXiyf4KMtDc+LbYPqMcq0Zwh7CVaC0HD7d2M6+4k1I9NVhwG7JUxNCqeUG
 oYvE2cytaiEvIto+lTNL8yUqFa2MvHeEqhPmyoqRjW1Gkfg7cRNCvunS/6dz88DQnMtSMoYUKl2IFC
 DoI420CdVXPWJ6kr4uwKkU44XUETg1GXajaHMHKRbidVU=
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

v2:
  - addressed comments to v1, details in patches

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com

---
Andrzej Hajda (2):
      scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation
      lib/gpgpu_shader: simplify load/store shaders

 lib/gpgpu_shader.c           | 160 +++-------------------
 lib/iga64_generated_codes.c  | 318 +++++++++++++++++++++----------------------
 lib/iga64_macros.h           |  48 ++++++-
 lib/meson.build              |   1 +
 scripts/generate_iga64_codes |   2 +-
 5 files changed, 221 insertions(+), 308 deletions(-)
---
base-commit: 190dec96be5487f86c45b7e6cf11b8174ebabf31
change-id: 20241106-gpgpu_send_rework-817a3e4f464e

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

