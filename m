Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDCC10E0CB
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 14:20:05 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 16:19:32 +0200
Message-ID: <20231023141951.32425-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 0/5] drm-uapi: sync with drm-next
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
applied. Also, I splitted this into separate patches with exception of
virtgpu and vmwgfx in one patch.

Simon Ser (5):
  drm-uapi/amdgpu_drm: sync with drm-next
  drm-uapi/i915_drm: sync with drm-next
  drm-uapi/msm: sync with drm-next
  drm-uapi/panfrost: sync with drm-next
  drm-uapi: sync virtgpu and vmwgfx with drm-next

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
