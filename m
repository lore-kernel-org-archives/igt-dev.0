Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913D510E24B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:18:27 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:08:43 +0300
Message-Id: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/7] kms: Run tiled display tests on any
 set of connectors
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Another rebase of the old series to run the tiled display tests
on any set of connectors. Would help with testing i915 port sync
feature without actually having tiled displays around.

Ville Syrjälä (7):
  tests/kms_tiled_display: Get rid of DP stuff
  tests/kms_tiled_display: Make basic_test() static
  tests/kms_tiled_display: Cleanup the chamelium ifdefs
  tests/kms_tiled_display: Replace the igt_display pointer with a struct
  tests/kms_tiled_display: Limit the difference in the timestamps to one
    scanline
  lib/edid: Add support for making DisplayID tile blocks
  tests/kms_tiled_display: Override the EDID to fake some tiles

 lib/igt_edid.c                                |  76 ++++++
 lib/igt_edid.h                                |  49 ++++
 ...dp_tiled_display.c => kms_tiled_display.c} | 241 +++++++++++++-----
 tests/meson.build                             |   2 +-
 4 files changed, 307 insertions(+), 61 deletions(-)
 rename tests/{kms_dp_tiled_display.c => kms_tiled_display.c} (67%)

-- 
2.39.3
