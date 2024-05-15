Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1ADC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 09:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2093810E1DA;
	Wed, 15 May 2024 09:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwVbER3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DC610E1DA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715764518; x=1747300518;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=ueoKGa1s/2L1ss9wmtngA14+/QXBFPRloaP8I4bIUdI=;
 b=NwVbER3oha5Bxl6+SxKU3CoUFG1tVx5ZIOLlD9c1iXNLjRFTcfriUctO
 7e6Trcf9jZFWdBJAz69WuxggKiUzsDOLWFKCtYbLLpOy5nSmSHhreeO5J
 KW2U+/Xrcq/KaLoh7IruXLd7bpoqQ2EctIyzj4+urUwmujtiwxOUmEIri
 /mB8mh/PZJO8eT0kVZ87+nCgIxwah+XYAPrAb/svLWIEERalJV7tg50sJ
 cQaXlo6+HbS7ewogHG1eETn0P5i43mlv2Kk4N6U0yoZsJy9mL+IvXeei/
 1yrFZ0w5k5VCGND2fpRDqn0weDMxf5bqeD/WXSdn2owZLF6zBIUQrHr26 A==;
X-CSE-ConnectionGUID: 5wIeW7gOTZ20J9SfcmKoKw==
X-CSE-MsgGUID: Z7QMs2fkT2a71TcJYS+i8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11632048"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11632048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:15:18 -0700
X-CSE-ConnectionGUID: 1Cv3yY26R8KQhY0H9Aaq2A==
X-CSE-MsgGUID: zuOKZlvRTH2uvdrlUVhpZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="35776176"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:15:16 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/5] lib/gpgpu: add shader support
Date: Wed, 15 May 2024 11:14:59 +0200
Message-Id: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABN9RGYC/2WOwQ6CMBAFf4X0bBVKbcST/2EIWdotbAKFtJVoC
 P9uIfHkcQ7z5q0soCcM7J6tzONCgSaXQJwypntwHXIyiZnIhcyluHLqQMmG3EAOm9ccuCxvxli
 jclFalrTZo6X3MfmsE7cQkLcenO73oaREjzBeRggR/W70FOLkP8eHpdi9X676zy0Fz7nACrRU2
 qoWHuQiDmc9jazetu0Ljy0autIAAAA=
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=ueoKGa1s/2L1ss9wmtngA14+/QXBFPRloaP8I4bIUdI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmRH0ha012Aos1pY9hfDhKbs1Dwyq20DDeW02kHfv5
 dFLMDbaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZkR9IQAKCRAjYrKT3hD91z/uC/
 4yqeledbwPqiO2t5YyAWFoxBSrydfDMq62Vic9K9rUeCd7Xl/NOpuo+sJ6cZXTWPy8arjlQWASqXhM
 OZkHO22igNrQtpHKmkS6eK+7MC33EbR4dWZRWvxFhOlKISbZjaP7r5KmOdlhLPNIk2GmNdaTOqbteX
 cdifSDckacw+KJYxbPJ5MDSEkdes56PoyuzS4ujyCyLxeZIa0qFgYCcA5IBNEZkobDT4sFGf+Ov4F7
 CaLoRnPMJRPaLW0LurcXt5HeTmKMUw9mS2GjZBzk1BC6HpRGf5oKzZP3hCg+74GqnYmKM37lxVwbwB
 ytmK4a3c5+xbGBfqsiOgPXPQNIVLkLGV+ckPU7gZ0NZoIoQ/3sFX7ccsupBnTvavAARYezEEyamUWC
 zy84bn6+Yoj9KCDF4SyfKTjRiOOYXgMp6hewlrieHA0aKPZrqzBSonpCOFMjhDxWxIZ1uiYbw+KkvP
 XayCi9CoUQzqztCXQSmAAWoy+sM5nVe2fcuQanKyOiWYU=
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

This patchset adds shader support to mainline IGT.
Together with iga64 inline assembly and demo test using both.

The patches were cherry-picked/trimmed from internal branch,
quite painful process. I hope I have not cut off too much :)

To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v2:
- described in patches
- Link to v1: https://lore.kernel.org/r/20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com

---
Andrzej Hajda (5):
      lib/gpu_cmds: add Xe_LP version of emit_vfe_state
      lib/gpgpu_shader: tooling for preparing and running gpgpu shaders
      lib/gpgpu_shader: add inline support for iga64 assembly
      lib/igt_sysfs: add helpers to access engine sysfs directory
      intel/xe_exec_sip: port test for shader sanity check

 lib/generate_iga64_codes    | 115 ++++++++++++++++
 lib/gpgpu_shader.c          | 313 ++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  63 +++++++++
 lib/gpu_cmds.c              |  29 +++-
 lib/gpu_cmds.h              |   6 +
 lib/iga64_generated_codes.c |  87 ++++++++++++
 lib/iga64_macros.h          |  11 ++
 lib/igt_sysfs.c             |  71 ++++++++++
 lib/igt_sysfs.h             |   3 +
 lib/meson.build             |  19 +++
 tests/intel/xe_exec_sip.c   | 195 +++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 12 files changed, 907 insertions(+), 6 deletions(-)
---
base-commit: be9b9992805df48e785b40ac2c4d001fb680a2c1
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

