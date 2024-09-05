Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8F0CD4F5F
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2AC10E7F6;
	Thu,  5 Sep 2024 09:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6u6/KTK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048A610E7F6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528503; x=1757064503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PmixfMcfHAdxGPldB0Baxj34Nb4/Q/1+CMPc4FDK/+o=;
 b=K6u6/KTKtOhu9lulil8om28EFuiovt0CJFaR2mLhBFXsBxvmjAmfREyi
 zw+mzhB90sgVgMw+xFfkxnfHi4lz3+ufD+NymrjQ0DzlkrDZGddS9vf/v
 BajL+1kij3pprRbYXWHxXzCn99vsQ+pMZ1cJM91F6RAkN+ox7xRzW0iPa
 Wi0Byi+M5NLytUHVAaRS7ZKn+D9g7X4YhrV/JdQTdNO79RMYvkGeic9co
 JOG++P59udnnjnZatCFzx4PgiXveu7WyWCrsw+/jFg7PHzf8KNK74hp69
 uu/XG5vcFEGYa44nX/uI8yzrS3ZHRDYMsAiqWeMH6YnDoXqp9sFjcSJ0X Q==;
X-CSE-ConnectionGUID: N9YH1iRwSpmvQv2aAO9LkA==
X-CSE-MsgGUID: ES9IvjFhQIOr8L+qbvr6Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590105"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590105"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:22 -0700
X-CSE-ConnectionGUID: nObCUX5cRUKo3+iWddapww==
X-CSE-MsgGUID: PCAaC1VHTSyfbY4M5tGZRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404515"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:17 -0700
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
Subject: [PATCH i-g-t v6 00/17] Test coverage for GPU debug support
Date: Thu,  5 Sep 2024 11:27:55 +0200
Message-Id: <20240905092812.94553-1-christoph.manszewski@intel.com>
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

v6:
 - trim write_on_exception shader parameter list (Zbigniew),
 - fix assert condition for 'intel_bb_ptr_get' (Zbigniew),
 - properly use previously introduced enum arround xe_exec_sip[_eudebug]
 (Zbigniew),
 - simplify loop condition in xe_exec_sip_eudebug (Zbigniew),
 - add 'gpgpu_shader_last_instr' helper (Zbigniew),
 - assert on params of public functions in lib/xe_eudebug (Zbigniew),
 - fix assert order arround lib/xe_eudebug (Zbigniew),
 - simplify and unify casts in lib/xe_eudebug (Zbigniew),
 - more descriptive variable names for lib/xe_eudebug functions
 and structs (Zbigniew),
 - fix typo in 'xe_eudebug_debugger_dettach' (Zbigniew),
 - create 'xe_eudebug_debugger_worker_state' enum (Zbigniew),
 - misc code formatting fixes (Zbigniew),
 - use common list in meson for conditional build and doc generation of
 xe_eudebug tests (Zbigniew),
 - rebase on top of master,

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
  tests/xe_exec_sip_eudebug: Port tests for shaders and sip
  tests/xe_live_ktest: Add xe_eudebug live test

Dominik Grzegorzek (4):
  drm-uapi/xe: Sync with eudebug uapi
  lib/xe_eudebug: Introduce eu debug testing framework
  tests/xe_eudebug: Test eudebug resource tracking and manipulation
  tests/xe_eudebug_online: Debug client which runs workloads on EU

Gwan-gyeong Mun (1):
  lib/intel_batchbuffer: Add support for long-running mode execution

 docs/testplan/meson.build         |   13 +-
 include/drm-uapi/xe_drm.h         |   16 +-
 include/drm-uapi/xe_drm_eudebug.h |  341 ++++
 lib/gpgpu_shader.c                |  477 ++++-
 lib/gpgpu_shader.h                |   34 +-
 lib/iga64_generated_codes.c       |  532 +++++-
 lib/intel_batchbuffer.c           |  149 +-
 lib/intel_batchbuffer.h           |   24 +
 lib/meson.build                   |    5 +
 lib/xe/xe_eudebug.c               | 2249 ++++++++++++++++++++++++
 lib/xe/xe_eudebug.h               |  218 +++
 lib/xe/xe_ioctl.c                 |   20 +-
 lib/xe/xe_ioctl.h                 |    5 +
 meson.build                       |    2 +
 meson_options.txt                 |    5 +
 scripts/igt_doc.py                |    3 +
 scripts/test_list.py              |   47 +-
 tests/intel/xe_eudebug.c          | 2716 +++++++++++++++++++++++++++++
 tests/intel/xe_eudebug_online.c   | 2254 ++++++++++++++++++++++++
 tests/intel/xe_exec_sip.c         |  152 +-
 tests/intel/xe_exec_sip_eudebug.c |  355 ++++
 tests/intel/xe_live_ktest.c       |    6 +
 tests/meson.build                 |   10 +
 23 files changed, 9581 insertions(+), 52 deletions(-)
 create mode 100644 include/drm-uapi/xe_drm_eudebug.h
 create mode 100644 lib/xe/xe_eudebug.c
 create mode 100644 lib/xe/xe_eudebug.h
 create mode 100644 tests/intel/xe_eudebug.c
 create mode 100644 tests/intel/xe_eudebug_online.c
 create mode 100644 tests/intel/xe_exec_sip_eudebug.c

-- 
2.34.1

