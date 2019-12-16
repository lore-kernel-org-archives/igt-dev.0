Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A028C6E593
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2019 14:11:57 +0000 (UTC)
References: <20191216120923.2376-1-tvrtko.ursulin@linux.intel.com>
 <20191216120923.2376-2-tvrtko.ursulin@linux.intel.com>
 <157650281113.2428.13876026348312542903@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <e01d7d43-9592-4a9c-dbd3-392b3e37407c@linux.intel.com>
Date: Mon, 16 Dec 2019 14:11:53 +0000
MIME-Version: 1.0
In-Reply-To: <157650281113.2428.13876026348312542903@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] intel-gpu-top: Support for client
 stats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Brian Welty <brian.welty@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 16/12/2019 13:26, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2019-12-16 12:09:23)
>> +static void __restore_stats(void)
>> +{
>> +       int ret;
>> +
>> +       if (__stats_enabled)
>> +               return;
>> +
>> +       ret = __set_stats(false);
> 
> Therein lies the problem with a global toggle. :(

Inverted check bug, okay. :) But yes, global toggle is a bit of a silly 
thing.

> Hmm, if our stats toggling is always in process_csb() responding to
> events, they shouldn't affect execution latency... I think you have made
> them cheap enough to consider always enabling. Let's see.

I think they will be. Didn't spot anything in casual testing but can do 
more pathological cases if you want.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
