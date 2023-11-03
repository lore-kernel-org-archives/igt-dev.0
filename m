Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D410E1A0
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 20:47:22 +0000 (UTC)
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Date: Fri,  3 Nov 2023 13:47:18 -0700
Message-Id: <20231103204719.690769-1-jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3] lib/gpgpu_fill: Add support for Xe2 platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Addressing Christoph Manszewskis comments: Added brackets to remaining else if
statements, and fixed the XE2 format issue. I ran checkpatch and
everything seems good, there was trailing white space errors but those I
believe are false positives and are inconsistent with the rest of the
code styling therefore I ignored them

Addresing Kamil Koniecznys comments: I fixed the header, and added
Dominiks r-b 

Jagmeet Randhawa (1):
  lib/gpgpu_fill: Add support for Xe2 platforms

 lib/gpgpu_fill.c                              | 23 +++++++
 lib/gpgpu_fill.h                              |  6 ++
 lib/gpu_cmds.c                                | 61 ++++++++++++++++---
 .../shaders/gpgpu/xe2lpg_gpgpu_kernel.asm     | 13 ++++
 lib/intel_batchbuffer.c                       |  4 +-
 5 files changed, 96 insertions(+), 11 deletions(-)
 create mode 100644 lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm

-- 
2.25.1
