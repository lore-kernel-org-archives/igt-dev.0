Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106E510E119
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 14:29:57 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 16:29:22 +0200
Message-Id: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v2 i-g-t 0/9] Add initial eudebug coverage
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series introduces test coverage for eudebug event
interface recently proposed as an RFC.
(https://patchwork.freedesktop.org/series/116442/) 

This series adds xe_eudebug tests together with 
a library that encapsulates common paths in current 
and future eu debugger scenarios. It provides an abstraction
over debugger and debuggee processes, asynchronous event reader,
and event log buffers for post-mortem analysis.

Place xe_eudebug tests inside xe/staging/ directory
and behind xe_staging build option as the kernel part 
won't be merged anytime soon.

Dominik Grzegorzek (8):
  xe: sync uapi headers
  meson: Introduce xe_staging build option
  xe/staging/xe_eudebug: test eudebug connection
  lib/staging/xe_eudebug: introduce eu debug testing framework
  xe/staging/xe_eudebug: test open close events
  xe/staging/xe_eudebug: exercise read_event ioctl
  xe/staging/xe_eudebug: add vm events sanity check
  xe/staging/xe_eudebug: Race discovery against eudebug attach.
  xe/staging/xe_eudebug: Add TEST/SUBTEST documentation

 include/drm-uapi/xe_drm_tmp.h |   76 +++
 lib/meson.build               |    3 +-
 lib/xe/staging/xe_eudebug.c   | 1047 +++++++++++++++++++++++++++++++++
 lib/xe/staging/xe_eudebug.h   |   89 +++
 meson.build                   |    1 +
 meson_options.txt             |    5 +
 tests/meson.build             |   17 +
 tests/xe/staging/xe_eudebug.c |  639 ++++++++++++++++++++
 8 files changed, 1876 insertions(+), 1 deletion(-)
 create mode 100644 include/drm-uapi/xe_drm_tmp.h
 create mode 100644 lib/xe/staging/xe_eudebug.c
 create mode 100644 lib/xe/staging/xe_eudebug.h
 create mode 100644 tests/xe/staging/xe_eudebug.c

-- 
2.34.1
