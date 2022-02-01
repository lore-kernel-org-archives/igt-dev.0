Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427A610E5BA
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Feb 2022 14:08:12 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue,  1 Feb 2022 15:07:56 +0100
Message-Id: <20220201140757.28844-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/1] lib/intel_batchbuffer: reset
 allocator before subtest
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

Add flag for turn on tracking with default off and helper
for turning it on/off. It will not change behaviour of already
used tests.

v2: add flag for tracking with default off (Zbigniew review)

Kamil Konieczny (1):
  lib/intel_batchbuffer: add tracking and reset for allocator

 lib/igt_core.c          |  2 ++
 lib/intel_batchbuffer.c | 61 +++++++++++++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  7 +++++
 3 files changed, 70 insertions(+)

-- 
2.32.0
