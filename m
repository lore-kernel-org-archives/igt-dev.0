Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54B810E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 19:11:42 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/3] test/kms_async_flip: fixes to get execution
Date: Tue, 26 Dec 2023 17:57:31 -0100
Message-ID: <20231226191054.23794-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

When I was reviewing "tests/kms_async_flip: Speed up the CRC test on
Intel hw" (https://patchwork.freedesktop.org/patch/572473/), I noticied
kms_async_flip aborts in the first test case with non-intel device since
commit 7fa7602ccf ("tests/kms_async_flips: Test all modifiers").
To get the execution back, the first patch changes the name of a
non-intel modifier from "?" to "unknown".

The same commit also claims to allow failure with some modifiers, but
the path for handling fb with modifiers != LINEAR and != intel doesn't
cover other vendors requirements and isn't consistent yet. Ofc,
increasing coverage with other vendor modifiers would be nice, but before
changing from run_test() to run_test_with_modifiers() the test case was
working as expected. Moreover, it seems we need a good rework of the
_with_modifiers path to make it stable again. This regression is the
reason I choose to bring back the original approach for non-intel
devices in the third path of this series. Follow-up patches can be sent
to increase test coverage with modifiers for non-intel device.

Let me know your thoughts.

Thanks,

Melissa

Melissa Wen (3):
  test/kms_async_flips: fix test abortion due to unreadable mod name
  lib/igt_fb: fix documentation of igt_create_color_fb return
  tests/kms_async_flips: test with modifiers only on intel devices

 lib/igt_fb.c            | 5 ++---
 tests/kms_async_flips.c | 5 ++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.43.0
