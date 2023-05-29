Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E56D10E068
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 16:54:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 18:54:15 +0200
Message-Id: <20230529165417.347129-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add PVC support for gpgpu fill
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

Used both for i915 and xe.

Dominik Grzegorzek (1):
  lib/gpgpu_fill/xehpc: Adjust gpgpu_fillfunc for PVC

Zbigniew Kempczyński (1):
  lib/intel_batchbuffer: Use COMPUTE instead RENDER engine for Xe on PVC

 lib/gpgpu_fill.c                              | 23 +++++++++++++++++++
 lib/gpgpu_fill.h                              |  8 +++++++
 lib/gpu_cmds.c                                |  3 ++-
 .../shaders/gpgpu/gen12p72_gpgpu_kernel.asm   | 12 ++++++++++
 lib/intel_batchbuffer.c                       |  9 ++++++--
 5 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm

-- 
2.34.1
