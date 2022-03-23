Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2A510E6D0
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 13:08:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Mar 2022 14:06:51 +0100
Message-Id: <20220323130653.65094-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add missing 48b flag to execbuf
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On dg2 we can not fit into 4G vm space so using 48b flag is 
necessary to avoid getting -EINVAL.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Zbigniew Kempczyński (2):
  tests/i915/gem_exec_suspend: Add 48b exec flag for execbuf
  tests/i915/gem_exec_parallel: Add 48b flag to execbuf

 tests/i915/gem_exec_parallel.c | 5 +++--
 tests/i915/gem_exec_suspend.c  | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.32.0
