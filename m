Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4010E1F4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 10:42:07 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 11:41:49 +0100
Message-Id: <20231114104151.67085-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Add dg1 compute pipeline
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

Enable dg1 compute pipeline for i915.

v2: remove xe_ prefix and add comment about indirect data (Francois)

Zbigniew Kempczyński (2):
  lib/intel_compute: Prepare tgllp compute functions to be dg1 ready
  lib/intel_compute: Add dg1 compute implementation for i915

 lib/intel_compute.c                | 236 ++++++++++++++++++-----------
 lib/intel_compute_square_kernels.c |  42 +++++
 2 files changed, 187 insertions(+), 91 deletions(-)

-- 
2.34.1
