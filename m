Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270A788071
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 08:11:21 +0000 (UTC)
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
 <158221380406.8112.18309601206905414674@skylake-alporthouse-com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <56a02b41-4c19-3adc-a380-b6be633b89f2@linux.intel.com>
Date: Fri, 21 Feb 2020 10:11:18 +0200
MIME-Version: 1.0
In-Reply-To: <158221380406.8112.18309601206905414674@skylake-alporthouse-com>
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

On 2020-02-20 17:50, Chris Wilson wrote:
> Quoting Martin Peres (2020-02-20 15:32:09)
>> +###############################################################################
>> +# This tests modesetting-vs-wedged which is a useful thing to check, but it
>> +# seems like it mostly catches unrelated issues which are better caught by
>> +# other tests.
>> +#
>> +# - shard-skl: 0.5% (~1 minute)
>> +# - shard-kbl: 1% (~1 minute)
>> +# - shard-apl: 0.6% (~1 minute)
>> +# - shard-glk: 0.5% (~1 minute)
>> +# - shard-icl: 0.6% (~1.5 minutes)
>> +# - shard-tgl: 0.7% (~1.5 minutes)
>> +#
>> +# Data acquired on 2020-02-20 by Martin Peres
>> +###############################################################################
>> +igt@gem_eio@kms
> 
> Hah. It caught novel issues, which have not been split out into separate
> regression tests.
> 
> Making sure kms is robust is not a bad thing; you can easily speed this
> up by reducing the workload.

Thanks for your patch! I dropped this hunk :)

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
