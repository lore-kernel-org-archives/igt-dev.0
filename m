Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D3389C49
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 09:48:14 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 19 May 2020 12:48:01 +0300
Message-Id: <20200519094803.8687-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 0/2] tests/kms_ccs: CCS Clear Color Test
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

Clear Color testing is performed with Clear Color DRM format modifier
and with YUV format only.

Mika Kahola (2):
  tests/kms_ccs: Add debug information on format modifier
  tests/kms_ccs: CCS Clear Color test

 lib/intel_batchbuffer.c |  10 +++
 lib/intel_batchbuffer.h |   5 ++
 lib/rendercopy.h        |   3 +
 lib/rendercopy_gen9.c   | 131 ++++++++++++++++++++++++++++++++++++++++
 tests/kms_ccs.c         |  74 +++++++++++++++++++----
 5 files changed, 210 insertions(+), 13 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
