Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D510E4CF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 08:48:20 +0000 (UTC)
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 14:33:13 +0530
Message-Id: <20231107090315.32744-1-melanie.lobo@intel.com>
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
Subject: [igt-dev] [PATCH 0/2] Add support for FP16 compressed format
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

This series adds support for FP16 compressed format

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for FP16 compressed
    formats
  tests/intel/kms_flip_scaled_crc: Add support for FP16 compressed
    formats

 lib/intel_aux_pgtable.c           |  5 +++++
 tests/intel/kms_flip_scaled_crc.c | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.17.1
