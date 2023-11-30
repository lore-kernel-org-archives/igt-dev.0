Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C64C10E0EC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 00:35:38 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Date: Thu, 30 Nov 2023 04:35:24 -0800
Message-Id: <cover.1701180818.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/6] Compression support for Lunarlake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mmatthew.auld@intel.com, igt-dev@lists.freedesktop.org,
 ayaz.siddiqui@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Series enables the compression feature for Lunarlake and address various
changes of the feature from Gen12. The Main-to-CCS ratio has been
changed to 512:1. This changes the calculations and value for fields
such as CCS Copy size for blitter command APIs. 
This patch series updates tests xe_ccs and gem_ccs for XE2.  

These changes are based on top of the "vm_bind pat_index" patch here:
https://patchwork.freedesktop.org/series/124667/

v2: Lots of improvements/tweaks (Kamil)
    Addressed review comments (Matthew, Karolina)
v3: Reused dg2_xy_fast_copy definition for defing xe2_cmds_info struct(Karolina)
    Split the patch to address ccs_size calculation and updating
pat_index, updated the intel_get_pat_idx_uc_comp function as per review
comments (Kamil)

-- 
2.34.1
