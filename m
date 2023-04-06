Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <c288faf6-28ad-b0bc-c77d-16628ba93475@linux.intel.com>
Date: Thu, 6 Apr 2023 15:31:01 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230131113237.3707217-1-tvrtko.ursulin@linux.intel.com>
 <20230131113237.3707217-9-tvrtko.ursulin@linux.intel.com>
 <CAJs_Fx6viBKQwoRofup8z4ZBcGC6dabvLarzT8aoevBEjQe8Ew@mail.gmail.com>
 <c80ae665-0177-355e-e38c-a7cce5043617@linux.intel.com>
 <CAF6AEGvP-AfKW7AtJuz3a020_E15fRa_vmKvNOBy_QQo5-zopQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <CAF6AEGvP-AfKW7AtJuz3a020_E15fRa_vmKvNOBy_QQo5-zopQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] gputop: Basic vendor agnostic GPU
 top tool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 06/04/2023 15:21, Rob Clark wrote:
> On Thu, Apr 6, 2023 at 4:08 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 05/04/2023 18:57, Rob Clark wrote:
>>> On Tue, Jan 31, 2023 at 3:33 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Rudimentary vendor agnostic example of how lib_igt_drm_clients can be used
>>>> to display a sorted by card and usage list of processes using GPUs.
>>>>
>>>> Borrows a bit of code from intel_gpu_top but for now omits the fancy
>>>> features like interactive functionality, card selection, client
>>>> aggregation, sort modes, JSON output  and pretty engine names. Also no
>>>> support for global GPU or system metrics.
>>>>
>>>> On the other hand it shows clients from all DRM cards which
>>>> intel_gpu_top does not do.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>
>>> Reviewed-by: Rob Clark <robdclark@chromium.org>
>>
>> Presumably for 8/8 only?
>>
>> The rest of the series does not apply any more by now. I need to rebase..
> 
> I didn't look closely at the rest of the series (was kinda assuming
> that was mostly just moving things around).. but I see you rebased it
> so I can take a look.

There's a lot in there - first patch is extracting some code into a 
library, with the corresponding renames, but then there are six patches 
of tweaks and feature additions which finally make gputop possible.

Hopefully you can penetrate the concepts. It was all at least Valgrind 
clean back in the day I first did it.

Regards,

Tvrtko
