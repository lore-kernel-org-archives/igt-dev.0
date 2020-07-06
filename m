Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF7F6E174
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 07:21:31 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Mon,  6 Jul 2020 09:21:16 +0200
Message-Id: <20200706072118.17441-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Remove libdrm dependency from
 gem_[caching/hang]
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

Thanks to intel_bb we can easly remove libdrm from igt tests.
Removal of libdrm dependency from gem_hang made by git rm :).

Dominik Grzegorzek (2):
  i915/gem_caching: Remove libdrm dependency
  i915/gem_hang: Removal

 tests/i915/gem_caching.c | 176 ++++++++++++++++++++++++---------------
 tests/i915/gem_hang.c    |  98 ----------------------
 tests/meson.build        |   1 -
 3 files changed, 107 insertions(+), 168 deletions(-)
 delete mode 100644 tests/i915/gem_hang.c

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
