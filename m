Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7116EABE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 14:38:17 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 15 Jan 2020 16:38:11 +0200
Message-Id: <20200115143813.28958-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2]  CCS Clear Color plane content check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The patch series introduces CCS plane content check for Clear Color
feature. To enable this, we need to enable fast clear on rendercopy
function, which is presented on the first patch of the series.

Mika Kahola (2):
  lib/rendercopy: Enable render target Fast Clear for GEN12
  tests/kms_ccs: Enable CCS plane checks for Clear Color

 lib/gen12_render.h      |   9 ++
 lib/igt_fb.c            |  13 +++
 lib/intel_batchbuffer.c |  10 +++
 lib/intel_batchbuffer.h |   1 +
 lib/rendercopy.h        |   5 ++
 lib/rendercopy_gen9.c   | 191 +++++++++++++++++++++++++++++++++++++++-
 tests/kms_ccs.c         |   3 +-
 7 files changed, 229 insertions(+), 3 deletions(-)
 create mode 100644 lib/gen12_render.h

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
