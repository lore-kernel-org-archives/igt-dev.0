Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4718510E190
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 09:28:25 +0000 (UTC)
From: Marius Vlad <marius.vlad@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 12:28:15 +0300
Message-Id: <20230901092819.16924-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Add vkms configfs testing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tzimmermann@suse.de, yixie@chromium.org, seanpaul@chromium.org,
 daniel@ffwll.ch, brpol@chromium.org, igormtorrente@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With this series we add some basic tests for sanity checking the
ConfigFS functionality into the vkms driver. This would allow to create
and to customize dynamically the entire DRM pipeline.

This small series adds a new library (igt_vkms) for creating the entire
pipeline, as well as enabling the device and set the connectors as
connected or disconnected. Further more it adds some helpers
(igt_configfs) to create the proper ConfigFS mount point.

The sub-tests in this series added are:

- a basic device test, that creates an entire pipeline with a primary
  plane
- an empty test, that doesn't create a primary plane and which should
  fail
- a test that creates multiple overlay and cursor planes
- a test that creates multiple pipelines
- a test similar to basic device test but that also disables the vkms
  device at the end

These kernel changes were written initially by Jim Shargo, and then were
picked up by Brandon Pollack. As of today the latest version is at 
https://patchwork.kernel.org/project/dri-devel/list/?series=780110

The i-g-t changes were also developed by Jim Shargo, and I've massaged
them a bit doing some minor changes since their inception. These changes
are:

- replaced all string strcat/strcpy with snprintfs
- renamed all _permit_ functions to _attach_
- added documentation for all public functions
- vkms_crtc_no_primary_test was fixed such that should it now fails
  as expected
- split the changes one more time, and group one of the patches 
  with the introduction of igt_configfs
- fixed skipping the (sub)tests if vkms wasn't found loaded

I've kept the original author as Jim was the original person
working on them.

For history purposes I've picked these up from 
https://gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/merge_requests/1.

Jim Shargo (4):
  lib/drmtest: Add VKMS as a known driver type
  lib/confifs: Add helpers for mounting/unmounting configfs
  tests/vkms: Add a small library for VKMS testing
  tests/vkms: Add more tests for VKMS

 lib/drmtest.c              |  26 ++
 lib/drmtest.h              |   9 +-
 lib/igt.h                  |   3 +-
 lib/igt_aux.c              |  25 ++
 lib/igt_aux.h              |   2 +
 lib/igt_configfs.c         | 106 ++++++++
 lib/igt_configfs.h         |  36 +++
 lib/igt_debugfs.c          |  29 +--
 lib/igt_vkms.c             | 514 +++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  66 +++++
 lib/meson.build            |   2 +
 tests/meson.build          |  13 +
 tests/vkms/vkms_configfs.c | 194 ++++++++++++++
 13 files changed, 995 insertions(+), 30 deletions(-)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/vkms_configfs.c

-- 
2.40.1
