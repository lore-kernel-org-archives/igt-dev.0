Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECD1112B80
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 18:00:32 +0000 (UTC)
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 14:59:25 -0300
Message-Id: <20220516175927.27616-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_async_flips: Expand test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, kernel-dev@igalia.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

This patchset enables kms_async_flips to run in more vendors. It was
tested at i915, amdgpu and vc4.

The first patch adds a helper to keep the same behavior of the test
while keeping things simple, and the second patch make the test work on
more platforms.

André Almeida (2):
  lib/igt_fb: Add support for drawing rectangles with random colors
  tests/kms_async_flips: Support more vendors

 lib/igt_fb.c            | 20 ++++++++++++++++++
 lib/igt_fb.h            |  1 +
 tests/kms_async_flips.c | 47 ++++++++++++++++++++++++-----------------
 3 files changed, 49 insertions(+), 19 deletions(-)

-- 
2.36.0
