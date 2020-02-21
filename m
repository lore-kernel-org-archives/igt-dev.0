Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DE06E271
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 11:25:08 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Fri, 21 Feb 2020 11:25:04 +0000
Message-ID: <F959E33BDD0A9E4E9BE35174E15E72EC01983322@BGSMSX109.gar.corp.intel.com>
References: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
 <158218486195.8112.17792417633553495989@skylake-alporthouse-com>
In-Reply-To: <158218486195.8112.17792417633553495989@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_request_retire: Removal of test
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

Thanks Chris, 

"gem_ctx_param" AFAIU, in this program it relies on a quirk of execbuf that it does not try to move a VMA , and so that  having used an object in one context, it will have the same address in the next context that shared the VM. 
Having said that, I would also go through gem_ctx_persistance as per your suggestion.

Regards,
Priyanka



-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: 20 February 2020 01:18 PM
To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_request_retire: Removal of test

Quoting priyanka.dandamudi@intel.com (2020-02-20 05:14:32)
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test is trying to hit a race condition by submitting same buffer 
> object between two contexts on different rings.Similar scenario can be 
> found in gem_ctx_param and gem_exec_ctx.This test doesn't add anything 
> to other tests.So,removing the test.

Neither of those try to replicate the bug found in this regression test.
gem_ctx_persistence does have similar patterns. Are you sure we do have it covered?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
