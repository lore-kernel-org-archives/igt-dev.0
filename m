Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA1C6E91F
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 20:19:27 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y6so25004182eds.1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 13:19:26 -0700 (PDT)
References: <20210322184539.123128-1-arek@hiler.eu>
 <161645090879.19229.3811293110753986704@emeril.freedesktop.org>
 <20210323190459.xt5vp2arjvgb6spn@hatecraft.localdomain>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <caea82fe-2daf-11a0-4d89-609748cbcf82@gmail.com>
Date: Tue, 23 Mar 2021 22:19:19 +0200
MIME-Version: 1.0
In-Reply-To: <20210323190459.xt5vp2arjvgb6spn@hatecraft.localdomain>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?drm=5Fread=3A_Don=27t_use_deprecated_siginterrupt?=
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
To: Arkadiusz Hiler <arek@hiler.eu>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 23.3.2021 21.04, Arkadiusz Hiler wrote:
> On Mon, Mar 22, 2021 at 10:08:28PM -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: tests/drm_read: Don't use deprecated siginterrupt
>> URL   : https://patchwork.freedesktop.org/series/88298/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from CI_DRM_9882 -> IGTPW_5638
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with IGTPW_5638 absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in IGTPW_5638, please notify your bug team to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in IGTPW_5638:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@i915_selftest@live@gt_pm:
>>      - fi-tgl-u2:          [PASS][1] -> [DMESG-WARN][2] +2 similar issues
>>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-u2/igt@i915_selftest@live@gt_pm.html
>>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-u2/igt@i915_selftest@live@gt_pm.html
> 
> Who do I CC for false positives nowadays?
> 

I believe its still Lakshmi (CCd)

/Juha-Pekka
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
