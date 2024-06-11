Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D28C27C5E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 10:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8721110E594;
	Tue, 11 Jun 2024 10:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuBHv1FX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D627210E594
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718102465; x=1749638465;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=YYWZFVFMNkC0JqB8NETd4n9uby3eidNM/qDWiXEDcL4=;
 b=SuBHv1FX9gK0hY30p3hujaG/oPq/SyKaLpPrFajFSn0M2UxI0E6ch6c0
 oQLBtBDylBcXvfmHHjIkwDbwl/m/VbLklI77SuWh+4Hj9z3yiuEvyWDWL
 LXwjHhXjW1FIhcX+r9xfmQDqAz7vn1QH2qeNdR4WwkJeJJX7BUBUj83dK
 OhWJ3WxfTPIOU6jV+QIRjDwTZQoypLRM5UoHbZyeSCMpqs6mpyNkgfkji
 NngPFPvvCKQVW7HcvvJizHvUaCa5wIgRvdpLW/cbV1cvCaZgoPbHELhje
 7yeAvEv3i5RCMcrQSvEnHFZyaAJjRlNsnz8rEl9G/3vyvM98xBifhI6Tt Q==;
X-CSE-ConnectionGUID: 2ojEkJfVQhGMol5fa9cHVQ==
X-CSE-MsgGUID: sC+XUz1tQpWPGqvetTCoMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26217714"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="26217714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:41:05 -0700
X-CSE-ConnectionGUID: vlcK0mVQRV+Othku61E5Ew==
X-CSE-MsgGUID: xvwtjKRzRuOhO2APBeVBbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="62563538"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:41:00 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 0/5] lib/gpgpu: add shader support
Date: Tue, 11 Jun 2024 12:40:49 +0200
Message-Id: <20240611-iga64_inline_ups-v6-0-b634ec43a610@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALEpaGYC/4XOwWrDMBAE0F8JOletvFrJVk/9j1KCLK1jQSwHy
 TUtwf9eOVBqEkOPc5g3c2WZUqDMXg9XlmgOOYyxBP10YK638UQ8+JIZCECBoHg4WY3HEM8h0vH
 zkjnKxvvOawGyY6V2SdSFrxv5/lFyazPxNtno+hUqlSmRHV4GmydKa6MPeRrT9+3DXK293znzO
 DdXXHAgYx1q1+nWvoU40fnZjQNb52b4A1S183eGAmgja5SuFaZR94DcAIA7gFwBQKh1VTvy8h7
 A/wAsgAOSlVOKRPMAqC3Q7ACqAJ33DRnvvEa3BZZl+QE07Y2c1gEAAA==
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=YYWZFVFMNkC0JqB8NETd4n9uby3eidNM/qDWiXEDcL4=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmaCm4tFmXBNByZhjwZzRzqqzqh9BwFkX7OcgN35Pn
 Z0+3UFmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmgpuAAKCRAjYrKT3hD910vgDA
 CpUfMQFHuxgN5h7LibH4TNJ0Axvz3kmH6w7K6uOjLFU+kksXzyYkl3rTcxIqYRNMbSX+RsCyq7aozU
 f3iBeAiL3zbu6ca9xo711rbn5mFcgVLy5mvaoDEdvZiczs0rfNz//MBVXnAXs1/dxabuXYdqHfq2Xp
 2VW9tGNFUyRZo3RFQynIy7+sXijalez6zzmb6dUnZcIfUcWLET0OQ1dtXOfxe/6vsvi5Jhrd2ql7So
 tvj9yoXSSgD0zNrEFqDzTLzh26X5BZRezJgeridQHloOOpuO1QnaPcuSYfqPHN+OooROGCmOAapvMk
 ytEeXN0XJnsKcgTyz2KV+QahjcZVqy3ApOGlMM99XhJ6yfKcjIerqmpGBRisC6Z7jW/4W3H7cMVZrw
 0yCzkbBiIfxpT9pWiuhbzVsOOw/fJ2FGIT7zwQiCQ4EokXuYJ1kDNQzjhCAEtfjFnTmSPjZJS5vrDl
 80lsX4trPVyXfMCRkExGizjQf177GIFgz/22fxW60P2C8=
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

v3:
- bumped minimal meson version,
- use old string literals to satisfy clang
v4:
- bump meson to latest version supported by CI builder
v5:
- just small update, to ping potential reviewers :)
- revert back required meson version, instead use old syntax to make CI happy
v6:
- addressed most Kamil's comments - added docs for public functions,
  generator script moved to scripts, added ifdef guards to iga64_macros.h,
  fixed docs and description in xe_exec_sip test

To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com
- Link to v2: https://lore.kernel.org/r/20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com
- Link to v3: https://lore.kernel.org/r/20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com
- Link to v4: https://lore.kernel.org/r/20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com
- Link to v5: https://lore.kernel.org/r/20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com

---
Andrzej Hajda (5):
      lib/gpu_cmds: add Xe_LP version of emit_vfe_state
      lib/gpgpu_shader: tooling for preparing and running gpgpu shaders
      lib/gpgpu_shader: add inline support for iga64 assembly
      lib/igt_sysfs: add helpers to access engine sysfs directory
      intel/xe_exec_sip: add shader sanity test

 lib/gpgpu_shader.c           | 313 +++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h           |  63 +++++++++
 lib/gpu_cmds.c               |  52 ++++++-
 lib/gpu_cmds.h               |   6 +
 lib/iga64_generated_codes.c  |  87 ++++++++++++
 lib/iga64_macros.h           |  18 +++
 lib/igt_sysfs.c              |  71 ++++++++++
 lib/igt_sysfs.h              |   3 +
 lib/meson.build              |  18 +++
 meson.build                  |   9 +-
 scripts/generate_iga64_codes | 115 ++++++++++++++++
 scripts/meson.build          |   1 +
 tests/intel/xe_exec_sip.c    | 197 +++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 14 files changed, 944 insertions(+), 10 deletions(-)
---
base-commit: 73618605b4370cf902267aaf1d25666ff5e26112
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

