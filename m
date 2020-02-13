Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB166E167
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 04:09:43 +0000 (UTC)
From: "Kumar, Ranjeet1" <ranjeet1.kumar@intel.com>
Date: Thu, 13 Feb 2020 04:09:37 +0000
Message-ID: <274141C8A0A31546A510F01C1A9ED9F2BA71DE@BGSMSX101.gar.corp.intel.com>
References: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
 <158133419181.5235.12047516556267303590@skylake-alporthouse-com>
In-Reply-To: <158133419181.5235.12047516556267303590@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Chris for the review,

Can we go ahead and remove this test ? or am I missing something?

Thanks,
Ranjeet

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Monday, February 10, 2020 5:00 PM
To: igt-dev@lists.freedesktop.org; Kumar, Ranjeet1 <ranjeet1.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]test/i915/gem_pipe_control_store_loop: Removal of test

Quoting ranjeet kumar (2020-02-06 11:01:10)
> This test doesnt have any dependecy with other tests,  hence is called out as redundant.
> This test has already been covered by gem_sync, hence it is being removed.
> gem_pipe_control_store_loop is not covered by gen2/gen3.

Except it does do something rather special, since on gen6 this instruction was broken and we needed a bit of extra uAPI to cater for it... It's the magical reloc=(INSTRUCTION, INSTRUCTION).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
