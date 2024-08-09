Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3430C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 12:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388C10E8EE;
	Fri,  9 Aug 2024 12:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzOaemZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA5010E8EE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723207114; x=1754743114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c7dBp+Y60DPCaKOIcC3GDj8qjCzD7YlnZE4iqUNHMRY=;
 b=nzOaemZd4/d0ZBOu25cgnPDAk5bsvRc8oL8HakWX7eU/qRYEqK0WofwC
 qMSsU7t/B+x7c/blHeiT3EKZE3JYz8DAzO/DtwcS/5eTjNG+qr95awUOC
 +1HO69cbiNAEFtP9JRXOAG9kDiVKk58EXRbSY2u4FwnpAVP+GokHEM1DD
 KAMIV4CeNr1cFRZrCAzTewWANi+E4njdCXZjhPF0+Z79doxl0IixbQGRZ
 hPLQ6wOhqND8fsSfzhzDr8G4mV7CKgY6MBnkt36D2Aa2u3w8am1wzILwt
 BI5novF1ekURbwOTM/CWLGhUoccx5R0+aX7QS1Eh5ADj8xZUDYNCLCgMw A==;
X-CSE-ConnectionGUID: FrOtfAzpR36sV66UmcEcow==
X-CSE-MsgGUID: nvcs3OYHSGq0wpbU/zV8iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32525345"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32525345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:38:33 -0700
X-CSE-ConnectionGUID: wSQc0VcVRiqUj7cOsD/Hfw==
X-CSE-MsgGUID: FROeiZ32SuiuH0PW11RGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57760901"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:38:29 -0700
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
Subject: [PATCH i-g-t v3 00/14] Test coverage for GPU debug support
Date: Fri,  9 Aug 2024 14:37:59 +0200
Message-Id: <20240809123813.109365-1-christoph.manszewski@intel.com>
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

Andrzej Hajda (4):
  lib/gpgpu_shader: Add write_on_exception template
  lib/gpgpu_shader: Add set/clear exception register (cr0.1) helpers
  lib/intel_batchbuffer: Add helper to get pointer at specified offset
  lib/gpgpu_shader: Allow enabling illegal opcode exceptions in shader

Christoph Manszewski (5):
  drm-uapi/xe: Sync with oa uapi fix
  lib/xe_ioctl: Add wrapper with vm_bind_op extension parameter
  lib/gpgpu_shader: Extend shader building library
  tests/xe_exec_sip: Extend SIP interaction testing
  tests/xe_live_ktest: Add xe_eudebug live test

Dominik Grzegorzek (4):
  drm-uapi/xe: Sync with eudebug uapi
  lib/xe_eudebug: Introduce eu debug testing framework
  tests/xe_eudebug: Test eudebug resource tracking and manipulation
  tests/xe_eudebug_online: Debug client which runs workloads on EU

Gwan-gyeong Mun (1):
  lib/intel_batchbuffer: Add support for long-running mode execution

 include/drm-uapi/xe_drm.h         |  112 +-
 include/drm-uapi/xe_drm_eudebug.h |  225 +++
 lib/gpgpu_shader.c                |  474 ++++-
 lib/gpgpu_shader.h                |   29 +-
 lib/iga64_generated_codes.c       |  428 ++++-
 lib/intel_batchbuffer.c           |  153 +-
 lib/intel_batchbuffer.h           |   22 +
 lib/meson.build                   |    1 +
 lib/xe/xe_eudebug.c               | 2192 +++++++++++++++++++++++
 lib/xe/xe_eudebug.h               |  206 +++
 lib/xe/xe_ioctl.c                 |   20 +-
 lib/xe/xe_ioctl.h                 |    5 +
 tests/intel/xe_eudebug.c          | 2671 +++++++++++++++++++++++++++++
 tests/intel/xe_eudebug_online.c   | 2203 ++++++++++++++++++++++++
 tests/intel/xe_exec_sip.c         |  332 +++-
 tests/intel/xe_live_ktest.c       |    6 +
 tests/meson.build                 |    2 +
 17 files changed, 9036 insertions(+), 45 deletions(-)
 create mode 100644 include/drm-uapi/xe_drm_eudebug.h
 create mode 100644 lib/xe/xe_eudebug.c
 create mode 100644 lib/xe/xe_eudebug.h
 create mode 100644 tests/intel/xe_eudebug.c
 create mode 100644 tests/intel/xe_eudebug_online.c

-- 
2.34.1

