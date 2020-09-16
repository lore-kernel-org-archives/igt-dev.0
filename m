Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074346E34C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2020 14:49:19 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200916142822.2132678-1-apoorva1.singh@intel.com>
References: <20200916142822.2132678-1-apoorva1.singh@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 16 Sep 2020 15:49:16 +0100
Message-ID: <160026775607.2193.18098724500829698375@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap: Modified offset in
 subtest "bad-size"
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
To: apoorva1.singh@intel.com, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting apoorva1.singh@intel.com (2020-09-16 15:28:22)
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Subtest "bad-size" should keep valid/good offset
> corresponding to buffer object being mapped.
> Currently, subtest will pass for any value of size
> provided as the offset value itself will not allow
> to map any size of memory which defies the purpose
> of this subtest.
> 
> The subtest should not pass due to bad offset value
> while it should pass only due to bad size provided.
> 
> v2: Added new offset. Updated the same changes in
> "bad-size" subtest of gem_mmap_wc too.
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

2 for the price of 1, excellent.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
