Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A85110E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:45:46 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 17:44:26 +0200
Message-Id: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 0/8] Add initial eudebug coverage
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


Dominik Grzegorzek (8):
  xe: sync uapi headers
  xe/xe_eudebug: test eudebug connection
  xe/xe_eudebug: introduce eu debug testing framework
  xe/xe_eudebug: test open close events
  xe/xe_eudebug: exercise read_event ioctl
  xe/xe_eudebug: add vm events sanity check
  xe/xe_eudebug: Race discovery against eudebug attach.
  xe/xe_eudebug: Add TEST/SUBTEST documentation

 include/drm-uapi/xe_drm_tmp.h |   76 +++
 lib/meson.build               |    1 +
 lib/xe/xe_eudebug.c           | 1047 +++++++++++++++++++++++++++++++++
 lib/xe/xe_eudebug.h           |   89 +++
 tests/meson.build             |    1 +
 tests/xe/xe_eudebug.c         |  638 ++++++++++++++++++++
 6 files changed, 1852 insertions(+)
 create mode 100644 include/drm-uapi/xe_drm_tmp.h
 create mode 100644 lib/xe/xe_eudebug.c
 create mode 100644 lib/xe/xe_eudebug.h
 create mode 100644 tests/xe/xe_eudebug.c

-- 
2.34.1
