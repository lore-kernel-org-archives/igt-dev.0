Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558C76E8CC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 13:53:27 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 26 Mar 2020 15:53:20 +0200
Message-Id: <20200326135322.9958-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/2] tests/kms_concurrent: Test maximum
 number of planes supported by the platform
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

There was an error in

commit 0ab05a51a059 ("tests/kms_concurrent: Test for maximum number of planes")

supported planes. This patch proposes a fix to this commit by first computing
the number of planes that are within platform's bandwidth requirements, resets
the display and then executes the actual testing.

v2: Remove uninitialized variable (Stan)
v3: Fix styling for commit reference (checkpatch)
    Fix possible memory leak (Juha-Pekka)

Mika Kahola (2):
  tests/kms_concurrent: Test maximum number of planes supported by the
    platform
  tests/kms_concurrent: Plug possible memory leaks

 tests/kms_concurrent.c | 110 ++++++++++++++++++++---------------------
 1 file changed, 53 insertions(+), 57 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
