Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225E16E0DD
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Feb 2021 11:29:55 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 15 Feb 2021 13:29:43 +0200
Message-Id: <20210215112944.92423-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] lib/i915/perf: Add ADL support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi all,

This is available at :

   https://gitlab.freedesktop.org/llandwerlin/igt-gpu-tools/-/commits/review/i915-perf-adl

Probably won't make it to the ml as the change is quite big.

Cheers,

Lionel Landwerlin (1):
  lib/i915/perf: add ADL support

 lib/Makefile.am                            |     6 +-
 lib/i915/perf-configs/guids.xml            |    26 +
 lib/i915/perf-configs/mdapi-xml-convert.py |     1 +
 lib/i915/perf-configs/oa-adl.xml           | 10624 +++++++++++++++++++
 lib/i915/perf-configs/update-guids.py      |     2 +-
 lib/i915/perf.c                            |     3 +
 lib/meson.build                            |     2 +-
 7 files changed, 10661 insertions(+), 3 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-adl.xml

--
2.30.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
