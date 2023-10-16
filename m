Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BD110E1E7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 14:17:10 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 Oct 2023 15:14:38 +0100
Message-ID: <20231016141450.55936-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 00/12] PAT and cache coherency support
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

eries implements the IGT side of things needed to support the new Xe uapi here:
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

-- 
2.41.0
