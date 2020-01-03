Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B406E1B1
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2020 09:50:59 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Fri,  3 Jan 2020 11:48:31 +0200
Message-Id: <20200103094832.27324-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v15 0/1] Introduce i915 pipe stress test
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
Cc: martin.peres@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This test case will challenge hardware, by using as maximum
display buffer/memory bandwidth as possible. To achieve that
it runs some workload on each CPU core, also it runs some GPU
load simultaneously, also uses kms to add as much planes as
possible using highest possible mode.

Stanislav Lisovskiy (1):
  igt/tests: kms_plane_stress: Add plane stress test

 tests/Makefile.sources        |   3 +
 tests/i915/i915_pipe_stress.c | 888 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 3 files changed, 892 insertions(+)
 create mode 100644 tests/i915/i915_pipe_stress.c

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
