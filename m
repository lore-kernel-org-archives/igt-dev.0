Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE3C6E0E8
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 09:11:55 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Thu, 12 Mar 2020 10:09:30 +0100
Message-Id: <20200312090933.20001-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] tests/gem_exec_alignment.c: Update
 subtests
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

Changes modify many subtest, and implement priority inversion test
case. Splited into three patches due to code sections shared between 
pi and many subtest. "PATCH i-g-t 1/3 tests/gem_exec_alignment.c: Timeout
alarm wrappers" has no sense without at least one of next patches. 

Dominik Grzegorzek (3):
  tests/gem_exec_alignment.c: Timeout alarm wrappers
  tests/gem_exec_alignment.c: Update subtest many
  tests/gem_exec_alignment.c: Add priority inversion test

 tests/i915/gem_exec_alignment.c | 283 +++++++++++++++++++++++++++++---
 1 file changed, 260 insertions(+), 23 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
