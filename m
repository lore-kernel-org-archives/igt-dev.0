Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C546C10EE59
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jan 2022 13:03:01 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Fri, 28 Jan 2022 14:02:02 +0100
Message-Id: <20220128130203.14790-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] lib/intel_batchbuffer: reset allocator
 before subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

igt_core inits intel_allocator before next subtest and this
makes allocator handle keeped in intel_batchbuffer invalid.
Moreover any call to intel_allocator can result in fail as
there are no allocators until first allocator_open.

Reset allocator in intel_batchbuffer and recreate its offsets
before next subtest run.

Kamil Konieczny (1):
  lib/intel_batchbuffer: add tracking and reset for allocator

 lib/igt_core.c          |  2 ++
 lib/intel_batchbuffer.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  6 ++++++
 3 files changed, 46 insertions(+)

-- 
2.32.0
