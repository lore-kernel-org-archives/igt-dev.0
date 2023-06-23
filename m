Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B4D10E013
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 23:10:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-313e12db357so158573f8f.0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 16:10:20 -0700 (PDT)
From: James Shargo <jshargo@chromium.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 23 Jun 2023 19:09:51 -0400
Message-ID: <20230623230954.115437-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add tests and support for VKMS's new
 ConfigFS features
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

From: Jim Shargo <jshargo@chromium.org>

These changes include new library functionality for working with mount
points and the creation of ConfigFS-based devices.

The ConfigFS functionality is currently under review. You can take a
look at the patches here:
https://gitlab.freedesktop.org/jshargo/compositor-kernel-explorations/-/merge_requests/4/commits

Thanks for taking a look! I'm still new to IGT, so please look with
extra care. I am excited to be contributing :).

Jim Shargo (3):
  lib/drmtest: Add VKMS as a known driver type
  lib/igt_aux: Make "is_mountpoint" public ("igt_is_mountpoint")
  tests/vkms: Adds VKMS tests and library functions to support them

 lib/drmtest.c              |  26 +++
 lib/drmtest.h              |   7 +-
 lib/igt.h                  |   2 +
 lib/igt_aux.c              |  25 +++
 lib/igt_aux.h              |   2 +
 lib/igt_configfs.c         | 105 +++++++++++
 lib/igt_configfs.h         |  35 ++++
 lib/igt_debugfs.c          |  29 +--
 lib/igt_vkms.c             | 362 +++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  58 ++++++
 lib/meson.build            |   2 +
 tests/meson.build          |  13 ++
 tests/vkms/vkms_configfs.c | 189 +++++++++++++++++++
 13 files changed, 827 insertions(+), 28 deletions(-)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/vkms_configfs.c

-- 
2.41.0.162.gfafddb0af9-goog
