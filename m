Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7164110E371
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 13:24:17 +0000 (UTC)
Message-ID: <90eed5af-d11f-0670-c96e-532d4fd994c8@linux.intel.com>
Date: Thu, 13 Apr 2023 15:24:13 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
References: <20230413092159.146658-1-mauro.chehab@linux.intel.com>
 <20230413092159.146658-5-mauro.chehab@linux.intel.com>
 <20230413101008.cnh67hsuj4tegso4@kamilkon-desk1>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230413101008.cnh67hsuj4tegso4@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] meson_options.txt: disable
 Sphinx by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 4/13/23 12:10, Kamil Konieczny wrote:
> Hi Mauro,
>
> On 2023-04-13 at 11:21:59 +0200, Mauro Carvalho Chehab wrote:
>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> Building IGT with Sphinx enabled and rst2pdf installed takes:
>>
>> 	$ touch tests/xe/xe_compute.c
>> 	$ time ninja -C build
>>
>> 	...
>>
>>          real    0m10.545s
>>          user    0m13.778s
>>          sys     0m0.724s
>>
>> With Sphinx disabled, the same build is a lot faster:
>>
>> 	$ touch tests/xe/xe_compute.c
>> 	$ time ninja -C build
>>
>> 	...
>>
>> 	real	0m1.746s
>> 	user	0m1.574s
>> 	sys	0m0.171s
>>
>> As Sphinx and PDF outputs aren't something that every single
>> IGT developer would need, let's speedup the build by disabling
>> it by default.
> imho this may require a change in our building pipeline so
> +cc Petri.

Ok. I applied the first three patches. I'll wait for an ack on this one.


Regards,

Mauro
