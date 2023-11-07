Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE01910E6AB
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 20:59:35 +0000 (UTC)
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Date: Tue,  7 Nov 2023 12:59:31 -0800
Message-Id: <20231107205932.701351-1-jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4] lib/gpgpu_fill: Add support for Xe2 platforms
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

Addresed Christoph Manszewski comments: fixed warnings and errors
brought up by checkpatch

Jagmeet Randhawa (1):
  lib/gpgpu_fill: Add support for Xe2 platforms

 lib/gpgpu_fill.c                              | 23 ++++++++
 lib/gpgpu_fill.h                              |  6 ++
 lib/gpu_cmds.c                                | 59 +++++++++++++++----
 .../shaders/gpgpu/xe2lpg_gpgpu_kernel.asm     | 13 ++++
 lib/intel_batchbuffer.c                       |  4 +-
 5 files changed, 93 insertions(+), 12 deletions(-)
 create mode 100644 lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm

-- 
2.25.1
