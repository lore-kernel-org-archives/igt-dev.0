Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FD96E2F9
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 18:59:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i10so17803465wrv.10
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 11:59:52 -0700 (PDT)
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-8-juhapekka.heikkila@gmail.com>
 <158749264502.11203.2272792297388581562@build.alporthouse.com>
 <6df922c2-fead-47b2-a447-7d224803cff6@gmail.com>
 <158749418519.11203.15109734100555990375@build.alporthouse.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <cc21fa6e-582a-69af-def1-572a3def50e6@gmail.com>
Date: Tue, 21 Apr 2020 21:59:46 +0300
MIME-Version: 1.0
In-Reply-To: <158749418519.11203.15109734100555990375@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] lib/debugfs: use regular module
 param functions for prefault_disable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 21.4.2020 21.36, Chris Wilson wrote:
> Quoting Juha-Pekka Heikkila (2020-04-21 19:30:00)
>> On 21.4.2020 21.10, Chris Wilson wrote:
>>> Quoting Juha-Pekka Heikkila (2020-04-21 17:17:24)
>>>> From: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>> Functional change switches from igt_require to igt_assert on errors.
>>>
>>> Adding entirely unused functions for fun?
>>
>> That probably is from legacy, Jani's igt branch that I took was not very
>> new.
>>
>> Chris, you have opinion about patch 6/8 on what's going on there?
>> There's in __igt_params_open(..) those two blocks of file checking which
>> on first block is checking if wanted parameter file is in selected
>> device directory and second block is just about 'guessing' default
>> device name. I'm somehow thinking there would be easier way for those
>> but I didn't find other way so I ended up reading and parsing files. It
>> seems to work but not feeling comfortable with it.
> 
> Heh, not guilty of igt_set_module_param(). I would rip out any implicit
> device lookup and make sure there's always a device fd to work with. If
> that is not possible, then make the module name a parameter.

I'll need to give it some thought with making module name as parameter. 
There's not many tests that would require change but those tests will 
need to be added with some code that will recognize what driver are they on.

/Juha-Pekka
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
