Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E5E10EC7F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Apr 2023 08:27:43 +0000 (UTC)
Message-ID: <0cfabc58-d15d-bffe-c8ec-d40d10d7e6c3@linux.intel.com>
Date: Fri, 14 Apr 2023 09:27:38 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230407215625.1551410-1-robdclark@gmail.com>
 <20230407215625.1551410-2-robdclark@gmail.com>
 <94672f31-599f-1926-d7dd-9ba4006d76e3@linux.intel.com>
 <CAF6AEGtqL-XGH3vpcmwSSDjsgCbnphsDbN8vL5BL55kS1D05Ug@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <CAF6AEGtqL-XGH3vpcmwSSDjsgCbnphsDbN8vL5BL55kS1D05Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH igt 1/2] lib/igt_drm_fdinfo: Parse memory usage
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 13/04/2023 19:26, Rob Clark wrote:
> On Thu, Apr 13, 2023 at 8:19 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 07/04/2023 22:56, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Add parsing for the memory usage related fdinfo stats.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    lib/igt_drm_fdinfo.c | 39 +++++++++++++++++++++++++++++++++++++++
>>>    lib/igt_drm_fdinfo.h |  9 +++++++++
>>>    2 files changed, 48 insertions(+)
>>>
>>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>> index b850d221..6269e166 100644
>>> --- a/lib/igt_drm_fdinfo.c
>>> +++ b/lib/igt_drm_fdinfo.c
>>> @@ -124,6 +124,34 @@ static const char *find_kv(const char *buf, const char *key, size_t keylen)
>>>        return *p ? p : NULL;
>>>    }
>>>
>>> +static size_t find_mem_kv(const char *buf, const char *key)
>>> +{
>>> +     const char *val = find_kv(buf, key, strlen(key));
>>
>> If you were asking yourself why I made strlen an argument to find_kv I
>> have to admit I micro-optimized it a bit based on profiling. Sad fact is
>> hunting for drm fdinfo in procfs sucks and gputop uses more CPU time
>> than top, to even display less data. More processes with more open files
>> there are, even when the 99.9% are not DRM, more taxing it is.
> 
> Did a release build really not end up with it inlined??  If so I guess
> we can make this a macro, but it seems a bit surprising.  This should
> be a thing the compiler can figure out.

AFAIR it wasn't able to figure out to evaluate the strlen at compile 
time when inside find_kv. Pretty sure it was the default build 
(debugoptimized) but it was also more than a year ago now so I guess I'd 
need to repeat the experiment to be sure.

Regards,

Tvrtko
