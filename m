Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7CE10E041
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 10:07:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so400871866b.0
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 02:07:03 -0800 (PST)
Message-ID: <7e113968-b406-4753-a407-a7fc8ee3e908@gmail.com>
Date: Mon, 13 Nov 2023 12:06:53 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20231113094353.1232575-1-bhanuprakash.modem@intel.com>
 <8HEEyr-hZOCEfFX_B7QVCqB5hDIu6JDdaZPl1vyqw6Ep-AMyApTLBdgROVNAKPiKb6fXfAr-Yqz-HcQ4evk3knZ-lGv5F9xjpILCCztDf4c=@emersion.fr>
 <11ff717a-06d2-49fd-b73d-0a372f1c80c8@gmail.com>
 <-X2kuWRq8oIQ1Lco4I-MR9aiuCxru-OYWgvZpjoaH-Vhou2l_0l7ojH97Xet1fRob4VpnlImB3BpP-lC0rTo80o4-xAYiK2hbo1_YgyD2ew=@emersion.fr>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <-X2kuWRq8oIQ1Lco4I-MR9aiuCxru-OYWgvZpjoaH-Vhou2l_0l7ojH97Xet1fRob4VpnlImB3BpP-lC0rTo80o4-xAYiK2hbo1_YgyD2ew=@emersion.fr>
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

On 13.11.2023 12.02, Simon Ser wrote:
> On Monday, November 13th, 2023 at 10:59, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> 
>> On 13.11.2023 11.55, Simon Ser wrote:
>>
>>> NACK. Please fix your docs/testplan/i915_tests.rst instead.
>>
>> Let's do fixes outside of master branch where it doesn't bother others.
> 
> Sorry, but no. This commit fixes a bug already. The CI regression is
> completely unrelated, and Intel-specific, I really don't understand why
> it happens in the first place.
> 
> Is it by design that actual bug fixes break Intel CI?

As is this is blocking others totally unrelated to this. This patch 
never passed ci in the first place hence never should've been merged. 
Let's fix it somewhere else than on everyone's build machines independently.

/Juha-Pekka
