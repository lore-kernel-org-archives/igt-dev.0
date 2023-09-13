Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A585710E4CB
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 14:24:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:24:15 +0200
Message-Id: <20230913142417.584184-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add missing Meteorlake gpgpu fill
 condition
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

Missing version leads to hang, unfortunately test didn't notice
that reporting it is succeding even if it wasn't true on MTL.

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Arjun Melkaveri (1):
  lib/intel_batchbuffer: Add Meteorlake gpgpu fill entry

Zbigniew Kempczyński (1):
  tests/i915_pipe_stress: Remove stack variables

 lib/intel_batchbuffer.c        | 4 +++-
 tests/intel/i915_pipe_stress.c | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.34.1
