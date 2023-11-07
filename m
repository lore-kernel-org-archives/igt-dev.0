Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B7E10E634
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 17:43:58 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 18:43:44 +0100
Message-ID: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 0/5] drm-uapi: sync with drm-next
 f2cab4b318ee
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

Sync with drm-next commit ("f2cab4b318ee8023f4ad640b906ae268942a7db4")

In core headers there are documentation updates and two additional formats in
drm_fourcc.h

Kamil Konieczny (5):
  include/drm-uapi: sync core headers with drm-next
  drm-uapi/amdgpu: sync with drm-next
  drm-uapi/i915: sync with drm-next
  drm-uapi/nouveau: sync with drm-next
  drm-uapi/virtgpu: sync with drm-next

 include/drm-uapi/amdgpu_drm.h  |  50 ++++--
 include/drm-uapi/drm.h         |  20 +++
 include/drm-uapi/drm_fourcc.h  |   2 +
 include/drm-uapi/drm_mode.h    |  16 +-
 include/drm-uapi/i915_drm.h    |   8 +-
 include/drm-uapi/nouveau_drm.h | 281 ++++++++++++++++++++++++++++++++-
 include/drm-uapi/virtgpu_drm.h |  49 ++++++
 7 files changed, 405 insertions(+), 21 deletions(-)

-- 
2.42.0
