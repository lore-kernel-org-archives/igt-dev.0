Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040FE6EA47
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Mar 2021 17:12:43 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 4 Mar 2021 17:12:37 +0000
Message-ID: <BYAPR11MB37844714658AF6BF0B16BF908A979@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-3-alan.previn.teres.alexis@intel.com>
 <161481491026.25897.13137851056108749856@build.alporthouse.com>
In-Reply-To: <161481491026.25897.13137851056108749856@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t 02/11] Add basic PXP testing of buffer and
 context alloc
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Chris - got it. Im assuming future kms subtest will still qualify for "gem_.." test name since its reacting on this GEM interface feature.

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Wednesday, March 3, 2021 3:42 PM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; igt-dev@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t 02/11] Add basic PXP testing of buffer and context alloc

Quoting Alan Previn (2021-03-02 22:53:25)
> Test PXP capability support as well as the allocation of protected 
> buffers and protected contexts.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/Makefile.sources |   3 +
>  tests/i915/i915_pxp.c  | 410 
> +++++++++++++++++++++++++++++++++++++++++

This is a GEM interface so gem_ctx_pxp or gem_exec_pxp, with gem_pxp as a final if either the other two don't fit.

(Now when we move to i915/i915_gem_foo.c is another question).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
