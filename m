Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586D7C83F2D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 14:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC6910E6C8;
	Thu, 29 Aug 2024 14:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TADZ1icr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA46410E6C6
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724942782; x=1756478782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I9JimlvwFjtUst2Ze7vspgar2ze1JRLchf/eeuyDoAI=;
 b=TADZ1icraoPDQ5Mwv9WrsvzRKwHwfSiscter4p11JSFRVRJgN4EnzsVS
 ky59jf9DueYSQ3NpzmHQa6PnY0Z48OVs/JabLsbuo8i0LV7NCMkynMUe6
 A3Z+WjUo6/nkhFc1W3YsZcgw9NMbBH2R92vQSEScbJRsPYxtm8yorml0s
 e3Jx5XLXptNHrfZ5Gsydu6XmJBmIrfJRM18azMW7ueMxFBdBbA+vwIrui
 pt2/AjVl9rKLY48yICSqtwXSvD4/c0O+5ViOoOy+fSmOgrLzjXdvAGgdq
 rVmwd4+eE3Fz8/S28iQCzONLgdDLGp/ChpEE5dBy3u+m3vD5SeP1PPqmB w==;
X-CSE-ConnectionGUID: 0p8V1DRDQK+R66scgFpeNQ==
X-CSE-MsgGUID: Ih3FGgeuQ6q9eQFNq+FHSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34947486"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34947486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:03 -0700
X-CSE-ConnectionGUID: R1H1TcBKQRKHeErv9o7paw==
X-CSE-MsgGUID: 2noALGJcQ7u5utCjyD7iYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64303883"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.237])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:45:58 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v5 00/17] Test coverage for GPU debug support
Date: Thu, 29 Aug 2024 16:45:30 +0200
Message-Id: <20240829144547.105371-1-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

In this series the eudebug kernel and validation team would like to
add test coverage for GPU debug support recently proposed as an RFC.
(https://patchwork.freedesktop.org/series/136572/)

This series adds 'xe_eudebug' and 'xe_eudebug_online' tests together
with a library that encapsulates common paths in current and future
EU debugger scenarios. It also extends the 'xe_exec_sip' test and
'gpgpu_shader' library.

The aim of the 'xe_eudebug' test is to validate the eudebug resource
tracking and event delivery mechanism. The 'xe_eudebug_online' test is
dedicated for 'online' scenarios which means scenarios that exercise
hardware exception handling and thread state manipulation.

The xe_eudebug library provides an abstraction over debugger and debuggee
processes, asynchronous event reader, and event log buffers for post-mortem
analysis.

Latest kernel code can be found here:
https://gitlab.freedesktop.org/miku/kernel/-/commits/eudebug-dev

Thank you in advance for any comments and insight.

v2:
 - make sure to include all patches and verify that each individual
 patch compiles (Zbigniew)

v3:
 - fix multiple typos (Dominik Karol),
 - squash subtest and eudebug lib patches (Zbigniew),
 - include uapi sync/fix (Kamil)

v4:
 - move all eudebug uapi changes to xe_drm_eudebug.h (Zbigniew),
 - move some 'xe_exec_sip' tests to 'xe_exec_sip_eudebug' test (Zbigniew),
 - control eudebug lib and test build with meson flag and disable it by
 default (Zbigniew),
 - fix multiple checkpatch issues (Kamil),
 - apply review comments from Dominik,

v5:
 - add comment to 'xe_drm_eudebug' (Zbigniew),
 - misc fixes and cleanups in gpgpu_shader.[ch] (Zbigniew),
 - assert on offset in intel_bb_ptr_get (Zbigniew),
 - use enum for shader and sip type in 'xe_exec_sip[_eudebug]'
 (Zbigniew),
 - fix string concatenation issue for meson older than 0.49,
 - more (hopefully all relevant) checkpatch issues addressed,

Andrzej Hajda (5):
  lib/gpgpu_shader: Add write_on_exception template
  lib/gpgpu_shader: Add set/clear exception register (cr0.1) helpers
  lib/intel_batchbuffer: Add helper to get pointer at specified offset
  lib/gpgpu_shader: Allow enabling illegal opcode exceptions in shader
  tests/xe_exec_sip: Introduce invalid instruction tests

Christoph Manszewski (7):
  drm-uapi/xe: Sync with oa uapi fix
  lib/xe_ioctl: Add wrapper with vm_bind_op extension parameter
  lib/gpgpu_shader: Extend shader building library
  tests/xe_exec_sip: Add sanity-after-timeout test
  scripts/igt_doc: Add '--exclude-files' parameter
  tests/xe_exec_sip_eudebug: Add SIP tests for eudebug
  tests/xe_live_ktest: Add xe_eudebug live test

Dominik Grzegorzek (4):
  drm-uapi/xe: Sync with eudebug uapi
  lib/xe_eudebug: Introduce eu debug testing framework
  tests/xe_eudebug: Test eudebug resource tracking and manipulation
  tests/xe_eudebug_online: Debug client which runs workloads on EU

Gwan-gyeong Mun (1):
  lib/intel_batchbuffer: Add support for long-running mode execution

 docs/testplan/meson.build         |   22 +-
 include/drm-uapi/xe_drm.h         |   16 +-
 include/drm-uapi/xe_drm_eudebug.h |  341 ++++
 lib/gpgpu_shader.c                |  480 ++++-
 lib/gpgpu_shader.h                |   29 +-
 lib/iga64_generated_codes.c       |  547 +++++-
 lib/intel_batchbuffer.c           |  149 +-
 lib/intel_batchbuffer.h           |   24 +
 lib/meson.build                   |    5 +
 lib/xe/xe_eudebug.c               | 2198 +++++++++++++++++++++++
 lib/xe/xe_eudebug.h               |  212 +++
 lib/xe/xe_ioctl.c                 |   20 +-
 lib/xe/xe_ioctl.h                 |    5 +
 meson.build                       |    2 +
 meson_options.txt                 |    5 +
 scripts/igt_doc.py                |    3 +
 scripts/test_list.py              |   47 +-
 tests/intel/xe_eudebug.c          | 2715 +++++++++++++++++++++++++++++
 tests/intel/xe_eudebug_online.c   | 2254 ++++++++++++++++++++++++
 tests/intel/xe_exec_sip.c         |  147 +-
 tests/intel/xe_exec_sip_eudebug.c |  351 ++++
 tests/intel/xe_live_ktest.c       |    6 +
 tests/meson.build                 |    8 +
 23 files changed, 9534 insertions(+), 52 deletions(-)
 create mode 100644 include/drm-uapi/xe_drm_eudebug.h
 create mode 100644 lib/xe/xe_eudebug.c
 create mode 100644 lib/xe/xe_eudebug.h
 create mode 100644 tests/intel/xe_eudebug.c
 create mode 100644 tests/intel/xe_eudebug_online.c
 create mode 100644 tests/intel/xe_exec_sip_eudebug.c

-- 
2.34.1

