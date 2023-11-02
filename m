Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD810E0A9
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 21:42:54 +0000 (UTC)
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Date: Thu,  2 Nov 2023 14:42:50 -0700
Message-Id: <20231102214251.669712-1-jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] XE2: lib/gpgpu_fill: Add support for Xe2
 platforms
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

Addressing comments from Dominik Grzegorzek, fixed kernel asm typo,
fixed SOB order to chronological, removed XXX as suggested

Jagmeet Randhawa (1):
  XE2: lib/gpgpu_fill: Add support for Xe2 platforms

 lib/gpgpu_fill.c                              | 23 ++++++++
 lib/gpgpu_fill.h                              |  6 +++
 lib/gpu_cmds.c                                | 53 ++++++++++++++++---
 .../shaders/gpgpu/xe2lpg_gpgpu_kernel.asm     | 13 +++++
 lib/intel_batchbuffer.c                       |  4 +-
 5 files changed, 90 insertions(+), 9 deletions(-)
 create mode 100644 lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm

-- 
2.25.1
