Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC3E10EADB
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 14:55:16 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>
Date: Mon, 28 Mar 2022 16:55:01 +0200
Message-Id: <20220328145509.2331195-1-maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [PATCH i-g-t v2 0/8] Writeback fixes and improvements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,=0D
=0D
Here's a series addressing the writeback-check-output test not passing=0D
on vc4. This is due to the fact that the writeback controller will force=0D
the X component to 0, while we expect the output and input buffers to be=0D
identical, and the input buffer has 0xff.=0D
=0D
This series tackles this by adding some support to dump the faulty=0D
frames in PNG and raw, which proved to be useful while debugging this=0D
series. Then, we rework the hash function to ignore the X component of=0D
our buffer and only hash the pixels themselves.=0D
=0D
Finally, we change the input buffer X value to a garbage, different from=0D
0 and 0xff, value to make sure the hardware properly ignores the=0D
component and doesn't treat it as alpha.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Rebased on master=0D
  - Added maintainers to the recipients=0D
=0D
Maxime Ripard (8):=0D
  lib/igt_frame: Rename summary fd variable=0D
  lib/igt_frame: Move frame dump logging to function=0D
  lib/igt_frame: Move frame path creation to function=0D
  lib/igt_frame: Add function to dump frames in RGB and raw=0D
  tests/kms_writeback: Use endianness accessor to fill pixels=0D
  tests/kms_writeback: Dump the frames if the don't match=0D
  lib/igt_fb: Ignore the X component when computing CRC=0D
  tests/kms_writeback: Use a garbage X value to create fill our test=0D
    buffer=0D
=0D
 lib/igt_core.h        |   9 +++=0D
 lib/igt_fb.c          |  20 ++++--=0D
 lib/igt_frame.c       | 137 ++++++++++++++++++++++++++++++++++++------=0D
 lib/igt_frame.h       |   4 ++=0D
 tests/kms_writeback.c |  40 +++++++++++-=0D
 5 files changed, 185 insertions(+), 25 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
