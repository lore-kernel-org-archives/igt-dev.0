Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FC510E06B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 07:08:03 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Dec 2022 08:07:15 +0100
Message-Id: <20221220070717.4757-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t 0/2] Introduce safe start and safe
 alignment to allocator
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

Dominik Karol Piatkowski (2):
  lib/intel_allocator: Fixed start offset and alignment
  tests/i915/api_intel_allocator: Fixed start offset

 lib/intel_allocator.c            | 5 +++++
 tests/i915/api_intel_allocator.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.34.1
