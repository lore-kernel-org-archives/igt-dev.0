Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088D31121F4
 for <igt-dev@lists.freedesktop.org>; Sun,  5 Jun 2022 06:19:56 +0000 (UTC)
Message-ID: <a125ca7d-2da7-36fe-4d69-1f36b0e0c68c@quicinc.com>
Date: Sat, 4 Jun 2022 23:19:51 -0700
MIME-Version: 1.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <165286178725.21388.6717310292088982350@emeril.freedesktop.org>
 <934c60df-1293-38d1-408e-ab1bb2c88ec6@quicinc.com>
 <a0efd9f6-3c9d-3b98-5605-a7b3b9d5746a@quicinc.com>
 <8735gjluaf.wl-ashutosh.dixit@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <8735gjluaf.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?RndkOiDinJcgRmkuQ0kuSUdUOiBmYWlsdXJlIGZvciBs?=
 =?utf-8?q?ib/igt=5Fkms=3A_Set_pipe-=3Eplane=5Fprimary_to_driver-assigned_?=
 =?utf-8?q?primary_plane_when_there_are_multiple_possible_primary_planes_?=
 =?utf-8?b?KHJldjYp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com, Petri
 Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh

On 6/4/2022 7:26 PM, Dixit, Ashutosh wrote:
> On Thu, 19 May 2022 13:44:35 -0700, Jessica Zhang wrote:
>>
>>
>>
>> On 5/19/2022 1:34 PM, Jessica Zhang wrote:
>>> Hi Lakshmi,
>>>
>>> I looked into this regression, but it doesn't seem to be related to my
>>> patch. Can you help take a look at it?
> 
> It seems the failures were related after all and CI correctly caught
> them. They should be properly investigated by both the author an committer
> before merging a patch. This has resulted in multiple people wasting a
> fair amount of their time and multiple bugs being filed as a result :/

Please correct if we are missing something.

That time, CI had reported a different error. Please refer to the 
following CI report of the series:

https://patchwork.freedesktop.org/series/103897/#rev5

That we still think is unrelated to the change. Please comment if you 
think otherwise.

The issues reported by all the following bugs in Jani's email have a 
very clear and consistent signature of the SEG fault:

https://gitlab.freedesktop.org/drm/intel/issues/6133
https://gitlab.freedesktop.org/drm/intel/-/issues/6134
https://gitlab.freedesktop.org/drm/intel/-/issues/6135
https://gitlab.freedesktop.org/drm/intel/-/issues/6136
https://gitlab.freedesktop.org/drm/intel/-/issues/6137


Stack trace:
  #0 [fatal_sig_handler+0xd6]
  #1 [killpg+0x40]
  #2 [igt_display_require+0x260]
  #3 [__igt_unique____real_main318+0x3c8]
  #4 [main+0x34]
  #5 [__libc_start_main+0xf3]
  #6 [_start+0x2a]

If this signature was seen in the CI runs earlier of our patch series, 
this could have been easily fixed by us as it was not really very hard 
to fix once we saw this signature. So i think the CI run on our change 
always gave an unrelated error which is different from the other issues 
seen here.

Thanks

Abhinav
