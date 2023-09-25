Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F68C10E21B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 12:36:46 +0000 (UTC)
Message-ID: <da7c81c7-c370-8c1c-ba85-c46fbbee50ae@collabora.com>
Date: Mon, 25 Sep 2023 09:36:38 -0300
MIME-Version: 1.0
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>
References: <20230921224422.55121-1-robdclark@gmail.com>
 <20230922123457.woa7xvcb52xsozoz@kamilkon-desk.igk.intel.com>
 <20230925121556.pyc2uunjbtm5hu27@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230925121556.pyc2uunjbtm5hu27@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] core_getversion: Test for desired device
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

Hi,

On 25/09/2023 09:15, Kamil Konieczny wrote:
> Hi,
> 
> On 2023-09-22 at 14:35:01 +0200, Kamil Konieczny wrote:
>> Hi Rob,
>>
>> On 2023-09-21 at 15:44:22 -0700, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> We discovered in drm/ci that if the drm device fails to probe, all the
>>> tests come back as "Skip", and the job is considered successful.  So fix
>> -------------------------- ^^^^^ ---------------------------------^
>> No comma before "and", s/, and/ and/, also use only one space separator
>> after end of statement,  s/.  So/. So/. As a side note, it is better to
>> avoid starting with "So", better:
>>
>> Fixed getversion test ...
>>
>>> the getversion test to fail if there is no drm device, or if the drm
>> ------------------------------------------------------ ^
>> s/, or/ or/
>>
>>> device does not match the expected device.
>>
>> Please write also that you used new enviroment var IGT_REQUIRED_DRIVERS
>> for that purpose.
>>
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>   tests/core_getversion.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
>>> index 32cb976e4923..e5416993d7a3 100644
>>> --- a/tests/core_getversion.c
>>> +++ b/tests/core_getversion.c
>>> @@ -48,14 +48,18 @@ igt_simple_main
>>>   {
>>>   	int fd;
>>>   	drmVersionPtr v;
>>> +	const char *name = getenv("IGT_REQUIRED_DRIVERS");
>>>   
>>> -	fd = drm_open_driver(DRIVER_ANY);
>>> +	fd = __drm_open_driver(DRIVER_ANY);
>>> +	igt_assert_fd(fd);
>>>   	v = drmGetVersion(fd);
>>>   	igt_assert_neq(strlen(v->name), 0);
>>>   	igt_assert_neq(strlen(v->date), 0);
>>>   	igt_assert_neq(strlen(v->desc), 0);
>>>   	if (is_i915_device(fd))
>>>   		igt_assert_lte(1, v->version_major);
>>> +	if (name)
>>> +		igt_assert_eq(strcmp(name, v->name), 0);
>> ------------------ ^
>> Better for debug would be:
>> 		igt_assert_f(!strcmp(name, v->name), "Expected driver: %s but got: %s\n", name, v->name);
> -------------------- ^
> 
> This should be:
>   		igt_assert_f(strcmp(name, v->name), "Expected driver: %s but got: %s\n", name, v->name);


According to 
https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-assert-f

igt_assert_f "Fails (sub-)test if the condition is not met."

If we want name and v->name to match, strcmp returns 0, so it should be 
igt_assert_f(!strcmp.. no? Unless I'm missing something.

Regards,
Helen

> 
> Regards,
> Kamil
> 
>>
>> Regards,
>> Kamil
>>
>>>   
>>>   	drmFree(v);
>>>   	drm_close_driver(fd);
>>> -- 
>>> 2.41.0
>>>
