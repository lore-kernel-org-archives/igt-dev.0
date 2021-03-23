Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7CB6E086
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 06:42:08 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue, 23 Mar 2021 11:46:37 +0530
Message-Id: <20210323061639.26460-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Bug fixes in kms_atomic_transition
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
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Fixes for few corner case bugs seen in kms_atomic_transition test.

Karthik B S (2):
  tests/kms_atomic_transition: Fix clean up when subtest fails
  tests/kms_atomic_transition: Reset the pipe_count variable

 tests/kms_atomic_transition.c | 59 ++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 12 deletions(-)

-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
