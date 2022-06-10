Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412810F005
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 12:16:49 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>
Date: Fri, 10 Jun 2022 14:16:44 +0200
Message-Id: <20220610121647.975942-1-maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] Writeback fixes and improvements
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

Hi,

Here's a series addressing the writeback-check-output test not passing
on vc4. This is due to the fact that the writeback controller will force
the X component to 0, while we expect the output and input buffers to be
identical, and the input buffer has 0xff.

This series tackles this by adding some support to dump the faulty
frames in PNG and raw, which proved to be useful while debugging this
series. Then, we rework the hash function to ignore the X component of
our buffer and only hash the pixels themselves.

Finally, we change the input buffer X value to a garbage, different from
0 and 0xff, value to make sure the hardware properly ignores the
component and doesn't treat it as alpha.

Let me know what you think,
Maxime

Changes from v2:
  - Rebased on master
  - Dropped the frame dumping patches

Changes from v1:
  - Rebased on master
  - Added maintainers to the recipients

Maxime Ripard (3):
  tests/kms_writeback: Use endianness accessor to fill pixels
  lib/igt_fb: Ignore the X component when computing CRC
  tests/kms_writeback: Use a garbage X value to create fill our test
    buffer

 lib/igt_core.h        |  9 +++++++++
 lib/igt_fb.c          | 20 ++++++++++++++++----
 tests/kms_writeback.c |  4 ++--
 3 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.36.1
