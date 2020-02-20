Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044996ECFE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 08:50:46 +0000 (UTC)
From: "Kumar, Ranjeet1" <ranjeet1.kumar@intel.com>
Date: Thu, 20 Feb 2020 08:50:42 +0000
Message-ID: <274141C8A0A31546A510F01C1A9ED9F2BAF223@BGSMSX101.gar.corp.intel.com>
References: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
 <158133419181.5235.12047516556267303590@skylake-alporthouse-com>
 <274141C8A0A31546A510F01C1A9ED9F2BA71DE@BGSMSX101.gar.corp.intel.com>
 <158158096500.11180.5218028198982885077@skylake-alporthouse-com>
In-Reply-To: <158158096500.11180.5218028198982885077@skylake-alporthouse-com>
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

Hi Chris , 

This OUT_RELLOC instruction are covered in gem_exec_bad_domains, gem_write_read_ring_switch test too. 
 I tried replacing OUT_RELLOC with OUT_RELLOC_FENCED and successfully tests got passed. 

Thanks,
Ranjeet 

We can enhance this test case by adding 

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Thursday, February 13, 2020 1:33 PM
To: Kumar, Ranjeet1 <ranjeet1.kumar@intel.com>; igt-dev@lists.freedesktop.org
Subject: RE: [igt-dev] [PATCH] [PATCH i-g-t]test/i915/gem_pipe_control_store_loop: Removal of test

Quoting Kumar, Ranjeet1 (2020-02-13 04:09:37)
> Thanks Chris for the review,
> 
> Can we go ahead and remove this test ? or am I missing something?

The test is capturing a vital bit of uAPI. How are you planning to enhance the test?

No, you may not remove it.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
