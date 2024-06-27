Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEE6C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768AA10EA50;
	Thu, 27 Jun 2024 07:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eu2Eu0nd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB92A10EA50
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719473121; x=1751009121;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=ChoBwZoyFH6UX1PrxSy/J4pTEWk+oBruYmg8WRcBNvc=;
 b=Eu2Eu0ndUPEapo012ENG67BUycZsKScWkPUIVCQ1WKCtYJNb7L0HbdBa
 R+QWRSl0zj9lo4ZkfhU1DXswGUUrlCycSYr+0srV3R09GnNtAr46aGlm3
 c78Rgayvu7AgsspQvvyKPqnwu2xUcpXZTev5LmXVjgzK1iDL4Xz/up8Bw
 1OfpmAyxUGaJixtiko7k90IK/uuTrs3YMQMeavG0ubwegU/f6MnlAdtZl
 O7PLCDZS9dpA6LvYGABcEVRJXWCiEWUHK4b4qORdQwb5vhfuza3JBmHQd
 pui4OeH3RpFSn092RhDcjQQeMljQOE7d3su8hh8sADd1oAZKdYPP7ItX2 A==;
X-CSE-ConnectionGUID: bLTOGOyiQfqj4vm3b3ETew==
X-CSE-MsgGUID: O8oWRoQyT1Osm41YO/KdCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20466236"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="20466236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:20 -0700
X-CSE-ConnectionGUID: f+/z2ehvTpufYuFVnpiRCA==
X-CSE-MsgGUID: o+yPzU/IReKbOQ5lIc3vFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49221708"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:19 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v8 0/5] lib/gpgpu: add shader support
Date: Thu, 27 Jun 2024 09:24:59 +0200
Message-Id: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMsTfWYC/4XRTWrDMBAF4KsEretWPyNZzqr3KCXIo3EsiO0gu
 aYl+O6VAyXGMXT5Fu97A3NjiWKgxI6HG4s0hRSGPgf7cmDYuv5MRfA5M8klcJC6CGdn4BT6S+j
 p9HVNBSjrfeMNl6phuXaN1ITvO/nxmXPtEhV1dD22C5QrYyTXvXUujRSXRhvSOMSf+w2TWHp/c
 9Xz3CQKXkiqHILBxtTuPfQjXV5x6NgyN8kHoMXOvZPMgKlUCQprXlm9BdQKkLADqAWQIEsjSiS
 vtgD8B0AGUJISqDVx+wToNWB3AJ2BxntLlUdvALeAeQBGiB3AZKA2CghBOSP4FijXgNwBygxwD
 7XNb6oslmtgnudfXgF/tVgCAAA=
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3229;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=ChoBwZoyFH6UX1PrxSy/J4pTEWk+oBruYmg8WRcBNvc=;
 b=owEB7AET/pANAwAKASNispPeEP3XAcsmYgBmfRPb8rTbT0FzpTuHnXwF4wvsjcUn0mie1FEUwCHh
 Mo7VVmmJAbIEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZn0T2wAKCRAjYrKT3hD91xOaC/
 jmTzTlseNIHGBAwGay2dmpjM21L/Amzaia2VgHbJNn9OavWDqQ5sHFY2yrgrT4b3QDk3pPK5VYqdn6
 iMWKkUQx2p1QAfI6nJw6KT4HOs4UdsP5W0feXb7M5xtQ14zJw1oBD9Abb30OxB673bmpasga+nS0t9
 XbM7SrTtEtEU2XRK7es4g+YayYbTveTkQv26EOYhRxpjgd+GEnI7jOYnyoVrfxe68trt8rbWCutPKb
 kb+wHYxTvt7hF/C3Oc2cFLrm8NnGe3QrrjrKj4SBd/7KP8dBzz6yOoFdfqAHwkCSr/Ux07p85Q5MfY
 zHbu9KWfCAd2JgNW+zQnSyCapfafe67wR1yOAk8tUIk0n3nAf7zJUNF1zrmb91mhtzQOJ9vR4Md8KQ
 ny4SqpoOJluD9eKgS+gv/85ApL6K7/Kjx23SkzgkV+lATaI7m1GqJPYkyabvCPsAFXm7H1LwevqUYK
 mNgN0kztJOnHxMetMbglr0CStTJsonwopt9T+ETe+ODQ==
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
v8:
- added sanity check for assemblies,
- added asserts after memory allocations,
- cosmetic changes,
- added r-b/a-b tags, one patch left :)

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
- Link to v7: https://lore.kernel.org/r/20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com

---
Andrzej Hajda (5):
      lib/gpu_cmds: add Xe_LP version of emit_vfe_state
      lib/gpgpu_shader: tooling for preparing and running gpgpu shaders
      lib/gpgpu_shader: add inline support for iga64 assembly
      lib/igt_sysfs: add helpers to access engine sysfs directory
      intel/xe_exec_sip: add shader sanity test

 lib/gpgpu_shader.c           | 315 +++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h           |  63 +++++++++
 lib/gpu_cmds.c               |  52 ++++++-
 lib/gpu_cmds.h               |   6 +
 lib/iga64_generated_codes.c  |  87 ++++++++++++
 lib/iga64_macros.h           |  16 +++
 lib/igt_sysfs.c              |  71 ++++++++++
 lib/igt_sysfs.h              |   3 +
 lib/meson.build              |  18 +++
 meson.build                  |   9 +-
 scripts/generate_iga64_codes | 129 ++++++++++++++++++
 scripts/meson.build          |   1 +
 tests/intel/xe_exec_sip.c    | 196 +++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 14 files changed, 957 insertions(+), 10 deletions(-)
---
base-commit: f13702b8e4e847c56da3ef6f0969065d686049c5
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

