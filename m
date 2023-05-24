Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Erico Nunes <nunes.erico@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 15:49:27 +0200
Message-Id: <20230524134930.61911-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Initial tests for the lima drm driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: anarsoul@gmail.com, yuq825@gmail.com, lima@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I started working on something for the lima drm driver and realized that
there is no coverage for it in igt yet. It would be nice to have some to
check the driver specific ioctls and support that work.
Here are some to get some basic support and if we can get these in, we
can follow up with more tests to cover the remaining ioctls.
I used the panfrost and v3d gem tests as a reference for these initial
tests.

Erico Nunes (3):
  lib: Add support for opening lima devices
  lib/lima: Add lima helpers
  tests/lima: Add initial tests for lima

 lib/drmtest.c        |  3 ++
 lib/drmtest.h        |  1 +
 lib/igt_lima.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_lima.h       | 26 ++++++++++++
 lib/meson.build      |  1 +
 tests/lima_gem_new.c | 78 +++++++++++++++++++++++++++++++++++
 tests/meson.build    |  1 +
 7 files changed, 207 insertions(+)
 create mode 100644 lib/igt_lima.c
 create mode 100644 lib/igt_lima.h
 create mode 100644 tests/lima_gem_new.c

-- 
2.40.1
