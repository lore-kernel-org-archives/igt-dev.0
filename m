Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69B510E797
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 10:35:09 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Thu, 24 Mar 2022 15:57:48 +0530
Message-Id: <20220324102750.21771-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to drm_import_export
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

Add test description to drm_import_export.

Priyanka Dandamudi (2):
  tests/drm_import_export: Added test description for test case
  HAX: don't do full run

 tests/drm_import_export.c             |   9 ++
 tests/intel-ci/fast-feedback.testlist | 179 +-------------------------
 2 files changed, 10 insertions(+), 178 deletions(-)

-- 
2.25.1
