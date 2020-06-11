Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA366E157
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2020 12:31:10 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 11 Jun 2020 15:30:59 +0300
Message-Id: <20200611123101.7468-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t v2 0/2] tests/kms_ccs: CCS Clear Color
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a RFC patch that proposes to test CCS clear color
capability. This is actually a third edition of the clear color
tests. The first two required tweaking and all received comments
have been helpful. Therefore, any comments/proposals to improve
the test are warmly welcomed

The test paints a solid color on primary fb and a small sprite fb.
These are cleared with fast clear feature. A crc is captured and
compared against the reference.

Logically it may be an odd plae to define color clear function in
intel_batchbuffer.c but I decided to do so as we have rendercopy and
veboxcopy functions defined there as well.

v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
    Enable fast clear bit on 3D sequence (Matt)
    Add helper function to figure out clear color modifier (Matt)

Mika Kahola (2):
  tests/kms_ccs: Add debug information on format modifier
  tests/kms_ccs: CCS Clear Color test

 lib/gen8_render.h       |  1 +
 lib/intel_batchbuffer.c | 10 +++++
 lib/intel_batchbuffer.h |  6 +++
 lib/rendercopy.h        |  5 +++
 lib/rendercopy_gen9.c   | 56 ++++++++++++++++++++-----
 tests/kms_ccs.c         | 91 ++++++++++++++++++++++++++++++++++-------
 6 files changed, 145 insertions(+), 24 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
