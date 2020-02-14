Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DED86F8A6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 00:48:35 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200214004037.5847-1-antonio.argenziano@intel.com>
References: <20200214004037.5847-1-antonio.argenziano@intel.com>
Message-ID: <158164130041.7047.9315425229421344115@skylake-alporthouse-com>
Date: Fri, 14 Feb 2020 00:48:20 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_threaded_access_tiled:
 Require fences
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dixit@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-02-14 00:40:37)
> The test tries to allocate tiled objects which is not possible without
> fences.
> 
> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>

All the test is doing is parallel page faulting/copying from an object
and not try to determine if it saw any bogosity.

Of one object, so not even any thrashing, or any page faults after the
first. Virtually no contention or any time in the kernel at all.

I don't see it increasing any path coverage through the kernel at all.
A tiny bit in HW, but that is also done by gem_mmap_gtt/forked

Nevertheless,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
