Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <5ef3e508-9f0a-1c73-ac42-e6c7ac4e027e@riseup.net>
Date: Fri, 15 Sep 2023 11:44:49 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
 <4fb393ff-3b2a-369a-5e9f-f96d802b2d87@riseup.net>
 <3244709.oiGErgHkdL@jkrzyszt-mobl2.ger.corp.intel.com>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <3244709.oiGErgHkdL@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH] drm/tests: Fix incorrect argument in
 drm_test_mm_insert_range
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, igt-dev@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 9/15/23 11:17, Janusz Krzysztofik wrote:
> Hi Maíra,
> 
> Thanks for review.
> 
> On Friday, 15 September 2023 16:01:31 CEST Maira Canal wrote:
>> Hi,
>>
>> On 9/11/23 10:03, Janusz Krzysztofik wrote:
>>> While drm_mm test was converted form igt selftest to kunit, unexpected
>>> value of "end" argument equal "start" was introduced to one of calls to a
>>> function that executes the drm_test_mm_insert_range for specific start/end
>>> pair of arguments.  As a consequence, DRM_MM_BUG_ON(end <= start) is
>>> triggered.  Fix it by restoring the original value.
>>>
>>> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>
>> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
>>
>> Do you need me to push it to drm-misc-fixes?
> 
> Yes, please do if you can.

Pushed to drm-misc/drm-misc-fixes. Thanks!

Best Regards,
- Maíra

> 
> Thanks,
> Janusz
> 
>>
>> Best Regards,
>> - Maíra
>>
>>> Cc: "Maíra Canal" <mairacanal@riseup.net>
>>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>>> Cc: Daniel Latypov <dlatypov@google.com>
>>> Cc: stable@vger.kernel.org # v6.1+
>>> ---
>>>    drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
>>> index 186b28dc70380..05d5e7af6d250 100644
>>> --- a/drivers/gpu/drm/tests/drm_mm_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
>>> @@ -939,7 +939,7 @@ static void drm_test_mm_insert_range(struct kunit *test)
>>>    		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size, 0, max - 1));
>>>    		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size, 0, max / 2));
>>>    		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size,
>>> -								    max / 2, max / 2));
>>> +								    max / 2, max));
>>>    		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size,
>>>    								    max / 4 + 1, 3 * max / 4 - 1));
>>>    
>>
> 
> 
> 
> 
