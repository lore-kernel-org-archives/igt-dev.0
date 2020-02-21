Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062586EEB3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 08:11:48 +0000 (UTC)
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
 <158221394398.8112.3030544091167296957@skylake-alporthouse-com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <17c9b20d-5808-809d-1b55-713032797d1a@linux.intel.com>
Date: Fri, 21 Feb 2020 10:11:45 +0200
MIME-Version: 1.0
In-Reply-To: <158221394398.8112.3030544091167296957@skylake-alporthouse-com>
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

On 2020-02-20 17:52, Chris Wilson wrote:
> Quoting Martin Peres (2020-02-20 15:32:09)
>> +###############################################################################
>> +# This test virtually never failed, yet is responsible for a relatively big
>> +# execution time on some platforms:
>> +#
>> +# - shard-skl: 1.3% (~3 minutes)
>> +# - shard-kbl: 0.3% (~0.3 minutes)
>> +# - shard-apl: 0.6% (~1 minute)
>> +# - shard-glk: 0.4% (50 seconds)
>> +# - shard-icl: 0.1% (15 seconds)
>> +# - shard-tgl: 0.1% (15 seconds)
>> +#
>> +# Data acquired on 2020-02-20 by Martin Peres
>> +###############################################################################
>> +igt@sw_sync@sync_expired_merge
> 
> Change from fixed workload to fixed runtime.

Thanks! I reviewed your patch and dropped this hunk :)

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
