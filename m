Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55FF10EB0A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 16:57:25 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Fri, 17 Jun 2022 17:38:20 +0530
Message-Id: <20220617120822.1208890-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] HAX add description to gem_mmap_gtt
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test description to gem_mmap_gtt.

Priyanka Dandamudi (2):
  i915/gem_mmap_gtt: added description for test case
  HAX: don't do full run

 tests/i915/gem_mmap_gtt.c             |  52 ++++++++
 tests/intel-ci/fast-feedback.testlist | 184 +-------------------------
 2 files changed, 53 insertions(+), 183 deletions(-)

-- 
2.25.1
