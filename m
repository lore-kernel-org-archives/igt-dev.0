Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0BB10E32F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 10:44:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859c464daso34658465e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 02:44:49 -0800 (PST)
Message-ID: <f4924d25-142d-458d-bdbd-ee4b799e5308@gmail.com>
Date: Mon, 13 Nov 2023 12:44:34 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20231113094353.1232575-1-bhanuprakash.modem@intel.com>
 <8HEEyr-hZOCEfFX_B7QVCqB5hDIu6JDdaZPl1vyqw6Ep-AMyApTLBdgROVNAKPiKb6fXfAr-Yqz-HcQ4evk3knZ-lGv5F9xjpILCCztDf4c=@emersion.fr>
 <11ff717a-06d2-49fd-b73d-0a372f1c80c8@gmail.com>
 <-X2kuWRq8oIQ1Lco4I-MR9aiuCxru-OYWgvZpjoaH-Vhou2l_0l7ojH97Xet1fRob4VpnlImB3BpP-lC0rTo80o4-xAYiK2hbo1_YgyD2ew=@emersion.fr>
 <7e113968-b406-4753-a407-a7fc8ee3e908@gmail.com>
 <i8_3cM1wQXQV0rRJ1PxYHAe03idImtlCfV5UXOCcGrCxTt0ta1pjY0SuhPZvLTIyXqtLco3NawRlMKPy5ANYBwChb6oXvdQ2xcAKLF6QPdo=@emersion.fr>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <i8_3cM1wQXQV0rRJ1PxYHAe03idImtlCfV5UXOCcGrCxTt0ta1pjY0SuhPZvLTIyXqtLco3NawRlMKPy5ANYBwChb6oXvdQ2xcAKLF6QPdo=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] Revert "syncobj_timeline: don't expect EINVAL
 for WAIT_UNSUBMITTED, | WAIT_AVAILABLE"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 13.11.2023 12.30, Simon Ser wrote:
> On Monday, November 13th, 2023 at 11:06, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> 
>> On 13.11.2023 12.02, Simon Ser wrote:
>>
>>> On Monday, November 13th, 2023 at 10:59, Juha-Pekka Heikkila juhapekka.heikkila@gmail.com wrote:
>>>
>>>> On 13.11.2023 11.55, Simon Ser wrote:
>>>>
>>>>> NACK. Please fix your docs/testplan/i915_tests.rst instead.
>>>>
>>>> Let's do fixes outside of master branch where it doesn't bother others.
>>>
>>> Sorry, but no. This commit fixes a bug already. The CI regression is
>>> completely unrelated, and Intel-specific, I really don't understand why
>>> it happens in the first place.
>>>
>>> Is it by design that actual bug fixes break Intel CI?
>>
>> As is this is blocking others totally unrelated to this. This patch
>> never passed ci in the first place hence never should've been merged.
>> Let's fix it somewhere else than on everyone's build machines independently.
> 
> If we want a quick fix, we can disable the broken Intel CI, instead of
> reverting a completely correct bugfix.

Simon, disabling CI doesn't universally fix the build for everyone. If 
you don't use testplan it's your story but it's not the story for all 
other igt users. Passing ci testing is the requirement for merging, 
that's why ci is running on patch sets. This reverted patch didn't even 
build in ci and after you merged it others started to see what ci 
already had reported about this patch.

/Juha-Pekka
