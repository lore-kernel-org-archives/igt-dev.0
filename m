Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2085F6E8DC
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2020 06:54:27 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed,  1 Apr 2020 09:54:21 +0300
Message-Id: <20200401065423.29345-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_concurrent: Calculate
 maximum number of planes to meet bandwidth requirement
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
Cc: juhapekka.heikkila@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The first patch reverts a commit that caused regression on HSW pipe B/C tests.
The second patch proposes a different approach, compared to reverted patch,
to calculate maximum number of planes that still meet the bandwidth limitation.

v2: Fix CI build failure (CI)

Mika Kahola (2):
  Revert "tests/kms_concurrent: Test maximum number of planes supported
    by the platform"
  tests/kms_concurrent: Use maximum number of planes that
    display/platform combination supports

 tests/kms_concurrent.c | 77 +++++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 46 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
