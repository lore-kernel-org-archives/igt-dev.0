Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D0F6E89E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 08:07:33 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <5f97be54-85cf-d4e3-0534-45a132ed33f1@gmail.com>
References: <20200419151750.3863-1-juhapekka.heikkila@gmail.com>
 <20200419151750.3863-3-juhapekka.heikkila@gmail.com>
 <20200420093321.GY9497@platvala-desk.ger.corp.intel.com>
 <5f97be54-85cf-d4e3-0534-45a132ed33f1@gmail.com>
Date: Tue, 21 Apr 2020 11:07:29 +0300
Message-ID: <87r1whz2gu.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] lib/params: start renaming
 functions igt_params_*
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
To: juhapekka.heikkila@gmail.com, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 21 Apr 2020, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> On 20.4.2020 12.33, Petri Latvala wrote:
>> On Sun, Apr 19, 2020 at 06:17:44PM +0300, Juha-Pekka Heikkila wrote:
>>> From: Jani Nikula <jani.nikula@intel.com>
>>>
>>> based on patch from Jani Nikula.
>> 
>> 
>>  From Jani, and then based on Jani.
>> 
>> Please keep the original S-o-b as well as your own.
>> 
>> 
>
> Yea, that look like a mess now. I'm thinking I should take authorship on 
> changed patches. I don't think I can keep Jani's S-o-b for changed 
> patches. I'll anyway need to make changes yet so this it's not final 
> revision, currently I have i915 hardcoded there for parameter path.

Like I've said way back when, it's fine with me for you to take
authorship when you change the patches. The starting point was a hacky
pile of patches that I threw over the fence, and I think it would be
silly for me to insist on retaining the authorship.

That said, Signed-off-by is a legal thing, and you *should* retain
that. See https://developercertificate.org/ for what it signifies.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
