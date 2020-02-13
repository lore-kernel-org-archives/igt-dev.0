Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC26E194
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 08:02:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
 <158133419181.5235.12047516556267303590@skylake-alporthouse-com>
 <274141C8A0A31546A510F01C1A9ED9F2BA71DE@BGSMSX101.gar.corp.intel.com>
In-Reply-To: <274141C8A0A31546A510F01C1A9ED9F2BA71DE@BGSMSX101.gar.corp.intel.com>
Message-ID: <158158096500.11180.5218028198982885077@skylake-alporthouse-com>
Date: Thu, 13 Feb 2020 08:02:45 +0000
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
To: "Kumar, Ranjeet1" <ranjeet1.kumar@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Kumar, Ranjeet1 (2020-02-13 04:09:37)
> Thanks Chris for the review,
> 
> Can we go ahead and remove this test ? or am I missing something?

The test is capturing a vital bit of uAPI. How are you planning to
enhance the test?

No, you may not remove it.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
