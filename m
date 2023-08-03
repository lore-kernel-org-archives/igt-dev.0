Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10E410E5B8
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 07:49:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 09:49:00 +0200
Message-Id: <20230803074902.172493-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add xe_media_fill test
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

It's adopted to xe gem_media_fill test.

Zbigniew Kempczyński (2):
  lib/media_fill: Use RENDER engine flag to work on Xe
  tests/xe_media_fill: Exercise media fill on Xe

 lib/media_fill.c         |   2 +-
 tests/meson.build        |   1 +
 tests/xe/xe_media_fill.c | 135 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 tests/xe/xe_media_fill.c

-- 
2.34.1
