Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85446EF23
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 09:27:03 +0000 (UTC)
From: "Kumar, Ranjeet1" <ranjeet1.kumar@intel.com>
Date: Fri, 21 Feb 2020 09:26:57 +0000
Message-ID: <274141C8A0A31546A510F01C1A9ED9F2BB03F2@BGSMSX101.gar.corp.intel.com>
References: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
 <158133419181.5235.12047516556267303590@skylake-alporthouse-com>
 <274141C8A0A31546A510F01C1A9ED9F2BA71DE@BGSMSX101.gar.corp.intel.com>
 <158158096500.11180.5218028198982885077@skylake-alporthouse-com>
 <274141C8A0A31546A510F01C1A9ED9F2BAF223@BGSMSX101.gar.corp.intel.com>
 <158218945785.8112.16911735026069399304@skylake-alporthouse-com>
In-Reply-To: <158218945785.8112.16911735026069399304@skylake-alporthouse-com>
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

Hi Chris,

For the coverage purpose we are enhancing "gem_exec_bad_domains"  to exercise this race condition i.e.  OUT_RELLOC.
I will be sending enhanced "gem_exec_bad_domains"  program by Monday. 

Thanks,
Ranjeet

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Thursday, February 20, 2020 2:34 PM
To: Kumar, Ranjeet1 <ranjeet1.kumar@intel.com>; igt-dev@lists.freedesktop.org
Subject: RE: [igt-dev] [PATCH] [PATCH i-g-t]test/i915/gem_pipe_control_store_loop: Removal of test

Quoting Kumar, Ranjeet1 (2020-02-20 08:50:42)
> Hi Chris ,
> 
> This OUT_RELLOC instruction are covered in gem_exec_bad_domains, gem_write_read_ring_switch test too. 
>  I tried replacing OUT_RELLOC with OUT_RELLOC_FENCED and successfully tests got passed. 

The test is a regression test developed because we found a bug in the kernel that was not being exercised (a race condition during retire). We need to be certain that we retain such coverage. E.g. if we were to reintroduce such a bug, would CI pick it up? [Always a useful exercise to determine the efficacy of CI.] -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
