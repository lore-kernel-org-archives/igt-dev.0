Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A68210E79D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 10:09:14 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 12:08:55 +0200
Message-ID: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/6] drm-uapi: sync with drm-next
 52920704df87
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

      This is re-send of v2 from https://patchwork.freedesktop.org/patch/549742/?series=121445&rev=2
"Sync with drm-next commit 52920704df878050123dfeb469aa6ab8022547c1."
with dropped drm.h, drm_fourcc.h and drm_mode.h as they are already
applied. Also, I split this into separate patches with exception of
virtgpu and vmwgfx in one patch.

v2: split also virtgpu and vmwgfx (Kamil)

Simon Ser (6):
  drm-uapi/amdgpu_drm: sync with drm-next
  drm-uapi/i915_drm: sync with drm-next
  drm-uapi/msm: sync with drm-next
  drm-uapi/panfrost: sync with drm-next
  drm-uapi/vmwgfx: sync with drm-next
  drm-uapi/virtgpu: sync virtgpu with drm-next

 include/drm-uapi/amdgpu_drm.h   | 118 +++++++++-
 include/drm-uapi/i915_drm.h     | 377 +++++++++++++++++++++++++-------
 include/drm-uapi/msm_drm.h      |  62 ++++--
 include/drm-uapi/panfrost_drm.h |  55 ++++-
 include/drm-uapi/virtgpu_drm.h  |  35 +++
 include/drm-uapi/vmwgfx_drm.h   |  10 +-
 lib/i915/i915_drm_local.h       |  49 -----
 7 files changed, 550 insertions(+), 156 deletions(-)

-- 
2.42.0
