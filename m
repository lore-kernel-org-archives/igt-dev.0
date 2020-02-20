Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8596D6ED06
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 09:04:24 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
 <158133419181.5235.12047516556267303590@skylake-alporthouse-com>
 <274141C8A0A31546A510F01C1A9ED9F2BA71DE@BGSMSX101.gar.corp.intel.com>
 <158158096500.11180.5218028198982885077@skylake-alporthouse-com>
 <274141C8A0A31546A510F01C1A9ED9F2BAF223@BGSMSX101.gar.corp.intel.com>
In-Reply-To: <274141C8A0A31546A510F01C1A9ED9F2BAF223@BGSMSX101.gar.corp.intel.com>
Message-ID: <158218945785.8112.16911735026069399304@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 09:04:17 +0000
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

Quoting Kumar, Ranjeet1 (2020-02-20 08:50:42)
> Hi Chris , 
> 
> This OUT_RELLOC instruction are covered in gem_exec_bad_domains, gem_write_read_ring_switch test too. 
>  I tried replacing OUT_RELLOC with OUT_RELLOC_FENCED and successfully tests got passed. 

The test is a regression test developed because we found a bug in the
kernel that was not being exercised (a race condition during retire). We
need to be certain that we retain such coverage. E.g. if we were to
reintroduce such a bug, would CI pick it up? [Always a useful exercise
to determine the efficacy of CI.]
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
