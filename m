Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F81788DA9
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Nov 2022 16:15:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Nov 2022 17:15:33 +0100
Message-Id: <20221128161537.67096-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] Remove libdrm remnants in i915 code
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

v2: rewrite instead of prime_udl/prime_nv_* removals.

I want finally remove all libdrm stuff, to get this I had to:

1. rewrite prime_udl test - it is not used in CI due to lack of 
   DisplayLink hardware and I also don't have such hardware so 
   this is blind rewrite

2. rewrite prime_nv_* tests - similar to prime_udl (blind rewrite)

3. rewrite intel_upload_blit_* benchmarks - I tried to mimic 
   behavior as much as possible but there'e some minor differences
   in execution time. I think it is related to libdrm internals
   (how it caches handles/mappings). I'm not sure but it shouldn't
   much affect what benchmark is exercising.

4. remove all intel_batchbuffer_* code

Cc: Petri Latvala <petri.latvala@intel.com>

Zbigniew Kempczyński (4):
  tests/prime_udl: Remove intel-libdrm dependency
  tests/prime_nv: Remove intel-libdrm calls
  benchmarks/intel_upload_blit_*: Remove libdrm in upload blits
  lib/intel_batchbuffer: Get rid of libdrm batchbuffer

 benchmarks/intel_upload_blit_large.c     | 131 +++---
 benchmarks/intel_upload_blit_large_gtt.c | 130 ++---
 benchmarks/intel_upload_blit_large_map.c | 132 +++---
 benchmarks/intel_upload_blit_small.c     | 139 +++---
 lib/intel_batchbuffer.c                  | 574 +----------------------
 lib/intel_batchbuffer.h                  | 248 ----------
 tests/prime_nv_api.c                     | 151 +++---
 tests/prime_nv_pcopy.c                   | 107 ++---
 tests/prime_nv_test.c                    | 162 +++----
 tests/prime_udl.c                        |  60 +--
 10 files changed, 507 insertions(+), 1327 deletions(-)

-- 
2.34.1
