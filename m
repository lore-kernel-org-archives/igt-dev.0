Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A310E13D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 11:48:33 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 11:48:01 +0000
Message-ID: <20231107114816.190793-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 00/15] PAT and cache coherency support
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

Series implements the IGT side of things needed to support the new Xe uapi
here:
https://patchwork.freedesktop.org/series/123027/

Branch with the IGT changes:
https://gitlab.freedesktop.org/mwa/igt-gpu-tools/-/commits/xe-pat-index

Branch with the KMD changes:
https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads

v2:
  - Various tweaks and improvements.
  - Rebase on Xe2 additions.
  - Handle compressed wt on Xe2 + some other xe2 specific pat_index modes.
v3:
  - Various fixes and improvements.
v4:
  - Various improvements. Rebase
v5:
  - Some more improvements, including testing some xelpg modes.
v6:
  - Some more minor improvements.
v7:
  - Account for dropping coh_mode.
  - Add store-dword mode for the xe_pat tests to ensure we run on every engine
    (randomised over runs).
v8:
  - Couple minor fixes, like unbreaking api_intel_allocator@default-alignment

-- 
2.41.0
