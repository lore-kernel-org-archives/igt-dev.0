Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DD010E6BB
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 10:52:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.34.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E125B580DA0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 02:52:09 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rApVg-000U2v-0N
 for igt-dev@lists.freedesktop.org; Wed, 06 Dec 2023 11:52:08 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 11:51:29 +0100
Message-ID: <20231206105206.115463-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Add some missing descriptions
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
	Warning: igt@xe_media_fill@media-fill Description documentation is missing
	Warning: igt@xe_sysfs_defaults@engine-defaults Description documentation is missing

Mauro Carvalho Chehab (1):
  intel/xe_media_fill.c: address a documentation warning

 tests/intel/xe_media_fill.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.43.0
