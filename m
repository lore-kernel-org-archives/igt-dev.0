Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5716E0EE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 11:22:51 +0000 (UTC)
Date: Fri, 6 Mar 2020 13:22:47 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20200306112247.GB1398@intel.intel>
References: <20200218121549.12917-1-sai.gowtham.ch@intel.com>
 <20200305124250.GA32109@kdec5-desk.ger.corp.intel.com>
 <5734061626B4B34D8BE569E3846B57A2C218DE@BGSMSX107.gar.corp.intel.com>
 <7d9f289b-7b04-9355-0e2b-0ede2b2a2b08@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d9f289b-7b04-9355-0e2b-0ede2b2a2b08@linux.intel.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_create:
 Added __for_each_physical_engine to utilize all available engines.
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch,
 Sai Gowtham" <sai.gowtham.ch@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tvrtko,

> > After fork we need to transfer the engine map from parent fd default
> > context. (gem_context_copy_engines)
> > 
> > Also, since we have __for_each_physical_engine in the top level
> > igt_fixture, I think _all_ subtests run with default ctx engine map. So
> > all which submit to one from either all_engines or ppgtt_engines need to
> > make sure engine maps are aligned.
> > 
> > it was suggested by tvrtko in one of the patch: https://patchwork.freedesktop.org/patch/351622/?series=72889&rev=1
> 
> I was sadly wrong there, it is not required to reopen and copy engines after
> fork. So __for_each_physical_engine should do it in this case.
> 
> Regards,
> 
> Tvrtko
> 
> P.S. You could also dynamically size (allocate) the engines array while at
> it to be more in line with the other recent cleanups.
> 
> Hm.. actually, do we even need the array? Andi, __for_each_physical_engine
> will always create engine map with consecutive e->flags integers, right?
> There can be no holes?

yes, you are right, we do not need in this case the array and
there shouldn't be holes, indeed.

Andi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
