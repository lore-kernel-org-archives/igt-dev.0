Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F17C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 09:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C2110E7FE;
	Wed, 12 Jun 2024 09:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJ4XvTMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7F710E801
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718185158; x=1749721158;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=1j5Y/qmKJKDcRi9BKx/X+zHaZ/P9192u8FWMzH+dMWg=;
 b=fJ4XvTMlQ4A77il11t72HwjOwMS0t0M9Ig0ChX78izclwAp9Jah0i6KC
 RHKWqCP2eg0+7C1G1Gug8WN605JGhCkz6YRT3t7HKMzUxrwErhL4pyFvY
 5M6yuT//C7RQZEY2UMjZ3iZ4n9pTCCWr6Ji1RDG5bfwJbza3NvPvU2Z7c
 WGslMpxOHwlbCPPfxvKhBNYbrvFGUqWmNMhH9dRsDdfgjbxzgbzQiISwM
 QO29JlDW6uQ7XGm9GFZYk/wHE8F/jkn6CE3AX/RGtoiivdnfOGtl/qFhW
 eLMd3kscam7yH7AIE2dUM9QKvUR/ny8Z87Jz/2Bj+0EBKxqAMJvodq5gf w==;
X-CSE-ConnectionGUID: K3EQKcoRRJqzoHogdaY7bw==
X-CSE-MsgGUID: 0mumSobQQfKax21Q4ZwE1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14901163"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14901163"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:39:17 -0700
X-CSE-ConnectionGUID: KtSyXpi9TLWT76UEbrd09w==
X-CSE-MsgGUID: pOGsWiNZQCaiC7nsu6glyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39795066"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:39:15 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v7 0/5] lib/gpgpu: add shader support
Date: Wed, 12 Jun 2024 11:38:58 +0200
Message-Id: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALJsaWYC/4XOzWrDMBAE4FcJOtetflZrO6e+RylBltaxIJaD5
 JqW4HevHCgxjqHHOcw3c2OJoqfEjocbizT55IeQQ/lyYLYz4UyFdzkzySVwkLrwZ4Nw8uHiA52
 +rqkAVTnXOuRStSzXrpFa/30nPz5zbkyiookm2G6BcmWMZPq33qSR4tLofBqH+HP/MIml9zdXP
 89NouCFpNpYQNtiY959GOnyaoeeLXOTfABa7PydZAawViUo2/C60ltArQAJO4BaAAmyRFFacmo
 LwH8AZMBKUsJqTbx6AvQaqHYAnYHWuYpqZx2C3QL4AFCIHQAz0KACsqAMCr4G5nn+BZRT5qgXA
 gAA
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2985;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=1j5Y/qmKJKDcRi9BKx/X+zHaZ/P9192u8FWMzH+dMWg=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmaWzACLHPT6UTlzaswADrkz19YpsGrEasUPKd06aF
 IlQt2oiJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmlswAAKCRAjYrKT3hD91wJWC/
 9X8FHlxYzVKtppdRDUdPsWlsUNNKKOSYeqnd+Te32Xt5zztuMZzkEhCh4PfOtZ0n2YwJ3qt2eeqSXH
 rrPle2EkHbC7AuKT1z0RWhVtoD24t7rnkNrKtWdvMQVQy8VabNhoPW1wdb66obzt8ltKFyRn1kOfey
 tMQe1jvJZ9gg28NXWFflpDRvC3yTnljO1OSYLTQlTvtBs/ulfyNqF0IrXl1K/okLVVrFNpiPB2TGQQ
 U/4TBTXrEQUycrgR7Vi4b7HwdoiZeB++caALGzxzHOfEFZZ16VZYlfpUfzLOZiRdhhm41VcCVBt0NK
 Q0zd3A3N/SffurNfltOCc1hEcczfhtZyDd8YaaSy7W9j2Fo2eXmE/sw8nucm4hk4RwB5XOmkvZTa64
 yw4xwsNN+Z29jMrmZPKM0eYOacAx7itV8OFIxEMj0MbtyWuWp15t5RaAogT3KLF3BsNVQ1mR/COs5y
 x4yyFfkLRws8AsaAj5TW9LSnEdaRDoWayWdZJ/aXbcM8I=
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
v7:
- addressed checkpatch issues,
- removed "Driver requirement: xe" tag

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
- Link to v6: https://lore.kernel.org/r/20240611-iga64_inline_ups-v6-0-b634ec43a610@intel.com

---
Andrzej Hajda (5):
      lib/gpu_cmds: add Xe_LP version of emit_vfe_state
      lib/gpgpu_shader: tooling for preparing and running gpgpu shaders
      lib/gpgpu_shader: add inline support for iga64 assembly
      lib/igt_sysfs: add helpers to access engine sysfs directory
      intel/xe_exec_sip: add shader sanity test

 lib/gpgpu_shader.c           | 312 +++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h           |  63 +++++++++
 lib/gpu_cmds.c               |  52 +++++++-
 lib/gpu_cmds.h               |   6 +
 lib/iga64_generated_codes.c  |  87 ++++++++++++
 lib/iga64_macros.h           |  18 +++
 lib/igt_sysfs.c              |  71 ++++++++++
 lib/igt_sysfs.h              |   3 +
 lib/meson.build              |  18 +++
 meson.build                  |   9 +-
 scripts/generate_iga64_codes | 115 ++++++++++++++++
 scripts/meson.build          |   1 +
 tests/intel/xe_exec_sip.c    | 196 +++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 14 files changed, 942 insertions(+), 10 deletions(-)
---
base-commit: 73618605b4370cf902267aaf1d25666ff5e26112
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

