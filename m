Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F416E25C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2020 10:38:34 +0000 (UTC)
References: <20200304092901.2347-1-tvrtko.ursulin@linux.intel.com>
 <158331665415.426.8490559854402248554@emeril.freedesktop.org>
 <158331690823.11744.4175864291424750819@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <e76afadc-1c32-2802-7db1-ae95e421963b@linux.intel.com>
Date: Wed, 4 Mar 2020 10:38:31 +0000
MIME-Version: 1.0
In-Reply-To: <158331690823.11744.4175864291424750819@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/query=3A_Do_not_assert_engine_info_rsvd_being_zero?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Patchwork <patchwork@emeril.freedesktop.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 04/03/2020 10:15, Chris Wilson wrote:
> Quoting Patchwork (2020-03-04 10:10:54)
>> == Series Details ==
>>
>> Series: tests/i915/query: Do not assert engine info rsvd being zero
>> URL   : https://patchwork.freedesktop.org/series/74250/
>> State : success
> 
> Did we do a check to make sure the fields were written? Write a few
> rounds of poison into the struct and make sure the poison isn't returned
> on success. (A few rounds just in case few strike it lucky with the
> poison.) And a pair of redzones to check we don't overwrite the ends (I
> think we did that at least, by placing the pointer next to unmapped
> pages.)

We only have a check for no writes past len, nothing to check these 
particular rsvd are actually written to by the kernel. It will clear 
them though, contrary to my commit message (!).

If we add some poisoning of the engine array elements themselves, then 
we are back to having to fix the test if we extend the amount of data 
i915 returns. Unless we think we can choose a value for poison which can 
never be a valid something else. Not sure how useful that is. I guess it 
is a different approach than trying to figure out the returned data is 
valid. Not actually needing to understand the data (and replicate the 
logic), but just saying "Yeah it looks like something non-random has 
been returned, it's a pass.".

Regards,

Tvrtko


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
