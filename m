Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A576EEB3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 08:10:44 +0000 (UTC)
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
 <158221356538.8112.10760355305068621449@skylake-alporthouse-com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <46136608-3e86-6ac7-d9af-86c5c58d88f5@linux.intel.com>
Date: Fri, 21 Feb 2020 10:10:41 +0200
MIME-Version: 1.0
In-Reply-To: <158221356538.8112.10760355305068621449@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: add a pre-merge blacklist to
 reduce the testing queue
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-02-20 17:46, Chris Wilson wrote:
> Quoting Martin Peres (2020-02-20 15:32:09)
>> +###############################################################################
>> +# Modern userspace does not depend on the GTT anymore, so let's drop the
>> +# slowest tests from pre-merge testing:
>> +#
>> +# - shard-skl: 2.7% (~6.5 minutes)
>> +# - shard-kbl: 2% (~2.5 minutes)
>> +# - shard-apl: 4.7% (~8.5 minutes)
>> +# - shard-glk: 3.5% (~8 minutes)
>> +# - shard-icl: 4.2% (~8.5 minutes)
>> +# - shard-tgl: 2.5% (~4.5 minutes)
>> +#
>> +# Data acquired on 2020-02-20 by Martin Peres
>> +###############################################################################
>> +igt@gem_fence_thrash@bo-write-verify-threaded-[xy]
>> +igt@gem_tiled_(wc|(|blits|fence_blits)@(normal|interruptible))
> 
> So where's the pre-merge regression testing then?

I assume that the problem are the tests' assumptions, so if someone
wants to change them, they can just remove the tests from the blacklist.

> Just speed the tests up.

I'll be looking forward to reviewing them, in the mean time, it will be
post-merge testing only for these. We have plenty of other GTT tests
that are kept.

Martin

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
