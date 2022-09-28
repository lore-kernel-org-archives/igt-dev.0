Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A5A10E384
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 08:59:13 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.37.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 17B03580C4C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 01:58:47 -0700 (PDT)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:58:40 +0200
Message-Id: <20220928085842.34107-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC 0/2] add sysfs node at subtest results when
 available
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

IGT already supports opening more than one GPU and filtering them. However,
on machines with more than one CPU, it is hard to identify what was the
one that had an IGT test report results.

In order to minimize that, store the sysfs name of the opened devnode,
as it contains the bus address of the device and the card number, which
should be unique inside a machine.

Mauro Carvalho Chehab (2):
  lib/igt_core: add a logic to store a GPU string
  lib/igt_core: print card sysfs node at subtest results

 lib/drmtest.c  |  4 +++-
 lib/igt_core.c | 27 +++++++++++++++++++++++++++
 lib/igt_core.h |  6 ++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.37.3
