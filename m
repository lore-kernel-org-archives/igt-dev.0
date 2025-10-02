Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828C2CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 08:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294B210E7A4;
	Thu,  2 Oct 2025 08:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgQHVZMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2998110E0E0
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759395296; x=1790931296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xu/BdZ3Uj8LZjPO40Xal+eGxyevoIRGM+vfV862v6Tg=;
 b=RgQHVZMHjpOD194lwLYc34+IpZP/AEyMrL/fvxD0j3efeaQs9wpu57iA
 8onP9hbJj+7iazeIh0MvVkcom4e93z5ShxU2zlcZ2usYU/IeWvf02bu1l
 ksM+RXTc8NsLmEUpxEqSDc/vSxfX788tYmIC8j+hSxwNgbA7M0tZt+Zp4
 7OIjG6e+8XADOrdXbzJRvBQoWnelgL0e0YOBWzI380VMdgIAFZ1Y1t1ay
 UWoYK2lryUlaanN3rNJz/WwIcoU617gbLYtaPal50jYhEwuFx8LnF91tu
 7pLy/HMcFjlksclZM4xO/xhtJwcozPb5htrUJl/Q+9EkxZ9whLomQdLGz A==;
X-CSE-ConnectionGUID: d1lRU9vFShOjNe0rDe6MNQ==
X-CSE-MsgGUID: VN7pXn0WQr2ZuTa29OfOyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79100690"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="79100690"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 01:54:56 -0700
X-CSE-ConnectionGUID: E9djBtwxSSOTZnYGJ9oHmg==
X-CSE-MsgGUID: X8BCIvvFRZSy9PaZExiB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178801700"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 01:54:54 -0700
Message-ID: <be919ef6-d565-425c-b94f-da8d4e2b237c@intel.com>
Date: Thu, 2 Oct 2025 10:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
 <20251001115447.11843-2-dominik.karol.piatkowski@intel.com>
 <nfbsoyylux5qyvteu7xcuiwteamx2zjry4x6fiyj4u6ve2ghke@yzttaaj55nc3>
 <ddb7f247-9bc0-485d-9c5f-89bae340eee4@intel.com>
 <DS0PR11MB72647F3EE3DFE97EE0EE3FE4D9E7A@DS0PR11MB7264.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <DS0PR11MB72647F3EE3DFE97EE0EE3FE4D9E7A@DS0PR11MB7264.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Dominik,

On 2.10.2025 09:50, Piatkowski, Dominik Karol wrote:
> Hi Christoph,
> 
>> -----Original Message-----
>> From: Manszewski, Christoph <christoph.manszewski@intel.com>
>> Sent: Wednesday, October 1, 2025 7:50 PM
>> To: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Piatkowski,
>> Dominik Karol <dominik.karol.piatkowski@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Mika Kuoppala
>> <mika.kuoppala@linux.intel.com>
>> Subject: Re: [PATCH v9 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
>>
>> Hi,
>>
>> On 1.10.2025 14:04, Zbigniew Kempczyński wrote:
>>> On Wed, Oct 01, 2025 at 01:54:38PM +0200, Dominik Karol Piątkowski
>> wrote:
>>>> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
>>>> misleading, as the underlying error may be different. Do an early return
>>>> with -errno if the poll fails, unless errno is set to EINTR - repeat the
>>>> poll in this case.
>>
>> That makes sense however...
>>
>>>>
>>>
>>> LGTM, but for being sure let's wait for CI.
>>>
>>> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>>
>>> --
>>> Zbigniew
>>>
>>>> Signed-off-by: Dominik Karol Piątkowski
>> <dominik.karol.piatkowski@intel.com>
>>>> ---
>>>>    lib/xe/xe_eudebug.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>>>> index 667c31c6e..840b501c5 100644
>>>> --- a/lib/xe/xe_eudebug.c
>>>> +++ b/lib/xe/xe_eudebug.c
>>>> @@ -271,6 +271,10 @@ static int safe_pipe_read(int pipe[2], void *buf,
>> int nbytes, int timeout_ms)
>>>>    		if (!ret) {
>>>>    			catch_child_failure();
>>>>    			t += interval_ms;
>>>> +		} else if (ret == -1) {
>>>> +			if (errno == EINTR)
>>>> +				continue;
>>
>> ...this won't poll again for EINTR because ret == -1 so !ret is false
>> and we exit the loop.
> 
>  From poll(2):
> "On error, -1 is returned, and errno is set to indicate the error."
> 
> Receiving signal during poll() will interrupt it and it will return -1 with
> errno set to EINTR. Indeed !ret is false (it's true only on ret == 0), but
> we will then enter the else if part, compare errno to EINTR and continue if
> we actually got EINTR - it will take us to the beginning of the loop,

that is the part that is not true I think. According to the bellow 
snippet from the c standard, it will take us to the end of the loop:

```
3.6.6.2 The continue statement

Constraints

    A continue statement shall appear only in or as a loop body.

Semantics

    A continue statement causes a jump to the loop-continuation portion
of the smallest enclosing iteration statement; that is, to the end of
the loop body.  More precisely, in each of the statements

          while (/*...*/) {    do {                 for (/*...*/) {
            /*...*/              /*...*/              /*...*/
            continue;            continue;            continue;
            /*...*/              /*...*/              /*...*/
          contin: ;            contin: ;            contin: ;
          }                    } while (/*...*/);   }

unless the continue statement shown is in an enclosed iteration
statement (in which case it is interpreted within that statement), it
is equivalent to goto contin;
```

Regards,
Christoph

> repeating the poll. Am I missing something here?
> 
> Thanks,
> Dominik Karol
> 
>>
>> Regards,
>> Christoph
>>>> +			return -errno;
>>>>    		}
>>>>    	} while (!ret && t < timeout_ms);
>>>>
>>>> --
>>>> 2.34.1
>>>>
> 

