Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FCD6E963
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 11:30:05 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
In-Reply-To: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
Message-ID: <158133419181.5235.12047516556267303590@skylake-alporthouse-com>
Date: Mon, 10 Feb 2020 11:29:51 +0000
Subject: Re: [igt-dev] [PATCH] [PATCH
 i-g-t]test/i915/gem_pipe_control_store_loop: Removal of test
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
To: igt-dev@lists.freedesktop.org, ranjeet1.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting ranjeet kumar (2020-02-06 11:01:10)
> This test doesnt have any dependecy with other tests,  hence is called out as redundant.
> This test has already been covered by gem_sync, hence it is being removed.
> gem_pipe_control_store_loop is not covered by gen2/gen3.

Except it does do something rather special, since on gen6 this
instruction was broken and we needed a bit of extra uAPI to cater for
it... It's the magical reloc=(INSTRUCTION, INSTRUCTION).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
