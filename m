Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1D56E7FA
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 11:40:45 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <852adc41-b5a9-7fd8-598c-8db7b7f5b59f@linux.intel.com>
References: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
 <20200129181002.9405-2-krishnaiah.bommu@intel.com>
 <158033216228.13511.16715726772665260638@skylake-alporthouse-com>
 <8454bc4b-d07a-07bd-a8e8-bd15795de282@linux.intel.com>
 <72a7ea9a-e3f9-1164-1b93-432f71cb9398@linux.intel.com>
 <158038170520.16598.9441619406410034128@skylake-alporthouse-com>
 <4042402c-58f3-8ff9-2165-149f06d19074@linux.intel.com>
 <158038280911.16598.3910529948495289620@skylake-alporthouse-com>
 <852adc41-b5a9-7fd8-598c-8db7b7f5b59f@linux.intel.com>
Message-ID: <158038443303.16598.12571733350789280766@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 11:40:33 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/1] tests/i915/gem_ctx_persistence:
 Set context with supported engines
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-01-30 11:37:03)
> 
> On 30/01/2020 11:13, Chris Wilson wrote:
> > But much yuck on e and e2. Can we move them to separate functions to
> > hide the eyesore?
> 
> Move to functions, how?

The subtest groups, each in their own scope.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
