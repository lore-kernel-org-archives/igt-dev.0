Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8217810E12F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 14:48:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 15:48:01 +0100
Message-Id: <20231107144803.165466-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add dg1 compute pipeline
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

Zbigniew Kempczyński (2):
  lib/intel_compute: Prepare tgllp compute functions to be dg1 ready
  lib/intel_compute: Add dg1 compute implementation for i915

 lib/intel_compute.c                | 231 +++++++++++++++++------------
 lib/intel_compute_square_kernels.c |  42 ++++++
 2 files changed, 182 insertions(+), 91 deletions(-)

-- 
2.34.1
