Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB27610E04B
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 05:35:16 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Apr 2023 08:34:48 +0300
Message-Id: <20230405053451.2878039-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Testcases for dirtyfb ioctl
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

This patchset is adding new testcases for dirtyfb ioctl with features
like FBC, PSR and DRRS.

Also some helpers are split from kms_frontbuffer_tracking to be shared
with a new testcases.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Jouni Högander (3):
  tests/i915/kms_frontbuffer_tracking: Split fbc into separate helper
  tests/i915/kms_frontbuffer_tracking: Split drrs
  tests/kms_dirtyfb: Add new test for dirtyfb ioctl

 tests/i915/kms_dirtyfb.c              | 309 ++++++++++++++++++++++++++
 tests/i915/kms_drrs_helper.c          |  83 +++++++
 tests/i915/kms_drrs_helper.h          |  15 ++
 tests/i915/kms_fbc_helper.c           |  57 +++++
 tests/i915/kms_fbc_helper.h           |  19 ++
 tests/i915/kms_frontbuffer_tracking.c | 140 ++----------
 tests/meson.build                     |  17 +-
 7 files changed, 516 insertions(+), 124 deletions(-)
 create mode 100644 tests/i915/kms_dirtyfb.c
 create mode 100644 tests/i915/kms_drrs_helper.c
 create mode 100644 tests/i915/kms_drrs_helper.h
 create mode 100644 tests/i915/kms_fbc_helper.c
 create mode 100644 tests/i915/kms_fbc_helper.h

-- 
2.34.1
