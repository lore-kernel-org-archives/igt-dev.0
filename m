Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84706E038
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2019 14:17:55 +0000 (UTC)
From: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>
Date: Fri, 20 Dec 2019 19:55:14 +0530
Message-Id: <20191220142515.13424-1-venkata.ramana.nayana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/i915/gem_fence: platforms not
 supporting fences
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
Cc: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For platforms not supporting fences(no aperture), skip tests

Nayana, Venkata Ramana (1):
  tests/i915/gem_fence: platforms not supporting fences

 tests/i915/gem_fence_thrash.c       | 2 +-
 tests/i915/gem_fenced_exec_thrash.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
