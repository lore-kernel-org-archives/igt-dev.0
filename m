Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D8610E051
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 07:30:14 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 08:29:40 +0100
Message-Id: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Introduce safe start and safe alignment
 to allocator
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

This series brings safe start and safe alignment to allocator, as some
platforms may require that.

Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Dominik Karol Piatkowski (4):
  lib/intel_allocator: Fixed start offset
  lib/intel_allocator: Fixed start alignment
  tests/i915/api_intel_allocator: Fixed start offset
  tests/i915/api_intel_allocator: Fixed start alignment

 lib/intel_allocator.c            | 5 +++++
 tests/i915/api_intel_allocator.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.34.1
