Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289F110E0E8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 19:12:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id q17so11954901lji.11
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 12:12:19 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 22:11:39 +0300
Message-Id: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] misc fixes
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

Sanitized kms_cursor_crc a bit, it became slighly faster.
Fix intel clear color handling in libigt.
Add missing intel modifiers into multiplane rotation tests and try
to make test itself bit more readable.

/Juha-Pekka

Juha-Pekka Heikkila (4):
  tests/kms_cursor_crc: wait for cursor only when needed
  tests/kms_rotation_crc: add I915_FORMAT_MOD_4_TILED to multiplane
    rotation tests
  lib/rendercopy: separate intel clear color functions
  tests/kms_rotation_crc: try to simplify multiplane rotation tests

 lib/intel_batchbuffer.c  |   8 +-
 lib/rendercopy.h         |   4 +
 lib/rendercopy_gen9.c    |  45 +++---
 tests/kms_cursor_crc.c   |  19 +--
 tests/kms_rotation_crc.c | 295 +++++++++++++++++++++++----------------
 5 files changed, 225 insertions(+), 146 deletions(-)

-- 
2.37.3
