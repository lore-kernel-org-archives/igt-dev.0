Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B258C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 13:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752B510EA05;
	Fri, 24 May 2024 13:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AC5rmFlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992C310EA05
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716557534; x=1748093534;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=YQJ+Yi+6A3tcHHL6CZboyJR3i3CtUf0jT3HkLyf0D4Q=;
 b=AC5rmFlD4wSzLpJ/LvpB1zjCVNAWh0EnxGBkiVseBQRzrQZwy/gsi2Vk
 CUBXYGP5EVT52O94ntVu28iHhxOaT6j7h6sZIuSSIaOYSJD2LCNf6RNTw
 mGikNxlTQ5ARqSLaRh6AxS6SY8xupeIkYZI9IsZQY7RJaCCeTJ+2HtfKp
 sUA6zBFRIN/vUpbL0UGzSuPp6UyV7hM+KSYbqvmqs1iY9F5rd0Ln69ceX
 CH1TX0Gzu+sa8XkPlumhrbJ5lVDuXPpB77mPPCSGlV+X8APFR39DSlFp5
 qLt5vuuIBtNbU2ruYJXxHliwiQJ+YRGSp65m3EluC+6JGw90STizg7gns A==;
X-CSE-ConnectionGUID: 4Go8OnwPTLu/vONgTG1RTQ==
X-CSE-MsgGUID: fVmZwCXgQNyV3cDlupVhMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30441272"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="30441272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:14 -0700
X-CSE-ConnectionGUID: FkNeoJq6S2O5s2GFPlcPJA==
X-CSE-MsgGUID: hy+MqrPnQryNK4843IVueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34040869"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:11 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v4 0/5] lib/gpgpu: add shader support
Date: Fri, 24 May 2024 15:31:58 +0200
Message-Id: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM6WUGYC/23OwW7DIBAE0F+JOJcWL2sc59T/qKoIwzpeKcYRu
 KhV5H8vRKoatTnOYd7MVSSKTEkcdlcRKXPiJZSATzvhJhtOJNmXLEABKoRW8skaPHI4c6DjxyV
 J1HvvR28U6FGU2iXSyJ838u295MEmkkO0wU0VKpU1kp1fZptWirUxcVqX+HX7kJva+5nr/8/lR
 ioJ1FuHxo1msK8cVjo/u2UWdS7DL9A2D/5mKIDpdYfaDarft38BfQcAPgB0BQChM03nyOt7YNu
 2b0cYkYJUAQAA
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=YQJ+Yi+6A3tcHHL6CZboyJR3i3CtUf0jT3HkLyf0D4Q=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUJbYQ5x6rcZB17itJ/osxZUWQH4pVnZMrg3HNNxb
 gCu8V/yJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlCW2AAKCRAjYrKT3hD91/XhC/
 0TCwDs/zmNbpYkq8o2vWhxw3MxUf+8IvgYx9etkasrQNROgX06WwK6fizxkWj1nrABIu2B6zfVf9lu
 uZZs4ARP080lww/t4zySMRpkTcIVGYfcFF93iE5+fjze/x+vYzhRX0XmcQlYdXRdW0xmo3cXm5Jm/m
 dB3LciIAhvDA/G3WxQnogfCC92AcrbMwm/910ppu1st3zqlJ0PSY9EyeqlVw6gtb9ajTLBIDnhz/+D
 740drz56WalXlkWF2LYwITnw1EiXB+TC36x4/i01/X+Asvm27QyGNRUUGccbmMIEtXTWgi0UfnPy4E
 ik2m8joguXMun4RzagL1PBxeT/GBBWTbN8gGo9ztKclBjHG6WRTKcFCiajhLK/UCEUE5sZ1twHI+5N
 KJpgI1TeqEoXhn2xhG6wjbcuriBZxyKLD4QmzQXHPxpjS8LhKjGWpkUp+5UCjueB/nys+06U2ezV0L
 YUtKWFXcTQUGziMzC/B5ILGUBovE+Zg0rMEgNTM9cOWG8=
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
 meson.build                 |   2 +-
 tests/intel/xe_exec_sip.c   | 195 +++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 13 files changed, 908 insertions(+), 7 deletions(-)
---
base-commit: 1d7b961235e345db20933c057f265898e2e96fd2
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

