Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E606610E744
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 14:40:55 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.34.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C7820580C9B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 06:40:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rAt52-000dA9-35
 for igt-dev@lists.freedesktop.org; Wed, 06 Dec 2023 15:40:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 15:39:36 +0100
Message-ID: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Add some missing descriptions
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Address those build time warnings:

	Warning: igt@xe_live_ktest@bo Description documentation is missing
	Warning: igt@xe_live_ktest@dmabuf Description documentation is missing
	Warning: igt@xe_live_ktest@migrate Description documentation is missing
	Warning: igt@xe_sysfs_defaults@engine-defaults Description documentation is missing
	Warning: igt@xe_media_fill@media-fill Description documentation is missing

Mauro Carvalho Chehab (3):
  tests/intel/xe_live_ktest: document live kunit tests
  tests/xe_sysfs_defaults: add a description for engine-defaults
  tests/intel/xe_media_fill: address a documentation warning

 tests/intel/xe_live_ktest.c     | 7 +++++++
 tests/intel/xe_media_fill.c     | 5 +++--
 tests/intel/xe_sysfs_defaults.c | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.43.0
