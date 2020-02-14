Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C51F6E7F1
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 13:39:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200213045004.28209-1-sravan.kumar.nedunoori@intel.com>
 <158163508169.4660.12334684324098797527@skylake-alporthouse-com>
 <D01393EA3B18E04A886C14D534415A2E7FAA97@BGSMSX107.gar.corp.intel.com>
In-Reply-To: <D01393EA3B18E04A886C14D534415A2E7FAA97@BGSMSX107.gar.corp.intel.com>
Message-ID: <158168758967.10420.18310961724590831465@skylake-alporthouse-com>
Date: Fri, 14 Feb 2020 13:39:49 +0000
Subject: Re: [igt-dev] [PATCH][PATCH i-g-t]
 tests/i915/gem_write_read_ring_switch Removal of IGT Test
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
To: "Nedunoori, Sravan Kumar" <sravan.kumar.nedunoori@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Nedunoori, Sravan Kumar (2020-02-14 13:26:35)
> >Given that outline, could we whip up a new pair of tests (implicit-read-fence, implicit-write-fence) for gem_exec_schedule?
> [Sravan] : Sure, will enhance the gem_exec_schedule with the Implicit-read/write-fence subtests. 
> 
> Can we go ahead with the change/patch(gem_write_read_ring_switch) 

Add; remove. In that order.

Unless you can show me that I missed a basic test case the proves the
implicit fences work, and this test is indeed redundant.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
