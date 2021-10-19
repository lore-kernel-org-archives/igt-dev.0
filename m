Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC98B6E8A1
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 20:19:43 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 19 Oct 2021 23:19:35 +0300
Message-Id: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] kms: Run tiled display tests on any set
 of connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reposting of the old "let's test port sync everywhere" thing.

Since this was last posted we seem to have gained a chamelium
variant of the same thing. But it requires chamelium for some reason,
so not genrally very useful. Also it seems to use a fixed override
EDID so it's not going to be useful for any kind of visual tests since
likely you won't get a picture on your screens. The stuff I'm adding
here allows one to slap on the tile blocks to the existing displays
so as long as you have a battery of mostly identical displays hooked
up you can run them in sync with the fake tile info.

There were a few oddball things now in igt_edid on account of the
two approaches, but I didn't bother refactoring the chamelium stuff
at this time.

The reason I remembered this is that we seem to have some odd
transcoder readout failures in CI, and so far the one common thing
I've noticed across all of them is port sync seemingly being enabled.
So far can't explain what is going on, so I'd like to give CI a bit
more ammunition to trip that stuff up.

Ville Syrjälä (5):
  tests/kms_tiled_display: Get rid of DP stuff
  tests/kms_tiled_display: Replace the igt_display pointer with a struct
  tests/kms_tiled_display: Limit the difference in the timestamps to one
    scanline
  lib/edid: Add support for making DisplayID tile blocks
  tests/kms_tiled_display: Override the EDID to fake some tiles

 lib/igt_edid.c                                |  76 +++++++
 lib/igt_edid.h                                |  49 +++++
 ...dp_tiled_display.c => kms_tiled_display.c} | 203 ++++++++++++++----
 tests/meson.build                             |   2 +-
 4 files changed, 292 insertions(+), 38 deletions(-)
 rename tests/{kms_dp_tiled_display.c => kms_tiled_display.c} (71%)

-- 
2.32.0
