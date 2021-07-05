Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E154892B6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 08:51:27 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Mon,  5 Jul 2021 10:51:06 +0200
Message-Id: <20210705085108.5476-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] For CI only
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

For CI only, do not review.

Andrzej Turko (2):
  tests/i915/gem_softpin: Exercise eviction with softpinning
  tests/i915/gem_softpin: Test eviction on a fixed address

 tests/i915/gem_softpin.c | 218 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
