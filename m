Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F02C6E2BE
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 13:24:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w15so2061720wru.4
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 05:24:49 -0800 (PST)
References: <1582286887-23159-1-git-send-email-juhapekka.heikkila@gmail.com>
 <158228779749.30577.13907167889704375473@skylake-alporthouse-com>
 <8b77c078-a89f-2b90-37bc-b7b2ee689866@gmail.com>
 <158229098521.30577.509445839669102035@skylake-alporthouse-com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <02fd3a54-7970-53b8-b386-1c5ce9e58f5d@gmail.com>
Date: Fri, 21 Feb 2020 15:24:42 +0200
MIME-Version: 1.0
In-Reply-To: <158229098521.30577.509445839669102035@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: increase
 timeout for nonblocking flip wait
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
List-ID: <igt-dev@lists.freedesktop.org>

On 21.2.2020 15.16, Chris Wilson wrote:
> Quoting Juha-Pekka Heikkila (2020-02-21 13:12:46)
>> On 21.2.2020 14.23, Chris Wilson wrote:
>>> Quoting Juha-Pekka Heikkila (2020-02-21 12:08:07)
>>>> When run on more than one monitor there may be modeset in queue
>>>> which will block flip. Kernel will timeout with modeset at
>>>> ten seconds so lets wait in test also that same ten seconds at
>>>> maximum.
>>>
>>> 10s! You are joking, right? For a modeset that should not be there?
>>
>> 10s sounded quite big number to me too but that is from Ville. This test
>> is now failing because modeset + flip take more than one second, on my
>> ICL box with eDP + HDMI connected it becomes 1.19s. Arek is talking
>> about test box where it is more than two seconds. Anyway if 10s is what
>> kernel is waiting in the worst case I don't think test should be more
>> strict.
> 
> I think the kernel is broken. From a UX perspective that needs fixing.

Possibly yes. In this test when modeset happen that monitor which is 
causing delay is coming from power saving. There's really big wait on 
kernel to see power cycle has gone through on monitor with modeset. 
Probably depend on much quality of monitor hw.

/Juha-Pekka
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
