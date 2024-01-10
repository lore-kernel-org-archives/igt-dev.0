Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D8B10E00C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 21:32:07 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t 0/1] tests/intel/xe_ccs: Fix block-multicopy-inplace
 subtest
Date: Wed, 10 Jan 2024 01:31:25 -0800
Message-Id: <cover.1704874216.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, akshata.jahagirdar@intel.com,
 matthew.auld@intel.com, ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As part of this patchwork: https://patchwork.freedesktop.org/series/127917/
we introduced compression support for lunarlake and updated xe_ccs tests.
This patchwork resolves the "block-multicopy-inplace" subtest of xe_ccs,
that wasn't handled in the previous series.
This fix is done by passing correct pat_index based on compression.

 tests/intel/xe_ccs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.34.1
