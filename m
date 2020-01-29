Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787FA6E442
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 21:09:43 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200129181002.9405-2-krishnaiah.bommu@intel.com>
References: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
 <20200129181002.9405-2-krishnaiah.bommu@intel.com>
Message-ID: <158033216228.13511.16715726772665260638@skylake-alporthouse-com>
Date: Wed, 29 Jan 2020 21:09:22 +0000
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Bommu Krishnaiah (2020-01-29 18:10:02)
> Update the context with supported engines on the platform with set_property
> I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
> the available engines only.
> 
> v2: addressed the review comments.
> v3: addressed v2 review comments.
> V4: Re-introduced the gem_context_set_all_engines() API,test_process_mixed()
> test creating new forked process, to set engine map to new forked process
> I added gem_context_set_all_engines() API.
> v5: addressed v4 review comments.
> v6: addressed chris comments.

This is totally useless as a recording of the history. Explain why you
had to make the changes, for posterity.

> -       __for_each_static_engine(e) {
> +       for_each_engine(e, i915) {

Incorrect change that leads to compiler warnings and prevents the legacy
tests being listed by CI.

I've given up and fixed it.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
