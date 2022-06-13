Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FB310E61C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 05:11:37 +0000 (UTC)
Message-ID: <d6ef18f2-5dd2-64d7-6ef5-4711fced1525@intel.com>
Date: Mon, 13 Jun 2022 10:41:19 +0530
Content-Language: en-US
To: <juhapekka.heikkila@gmail.com>, "B, Jeevan" <jeevan.b@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20220601052834.26864-1-karthik.b.s@intel.com>
 <90c91558731c434397bf82a1ef47e500@intel.com>
 <dfd811f2-5b66-c16d-952b-e98b1f34f6b0@gmail.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <dfd811f2-5b66-c16d-952b-e98b1f34f6b0@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_big_fb: Move cleanup
 code to fixture
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

On 6/10/2022 7:59 PM, Juha-Pekka Heikkila wrote:
> On 2.6.2022 12.42, B, Jeevan wrote:
>>> -----Original Message-----
>>> From: B S, Karthik <karthik.b.s@intel.com>
>>> Sent: Wednesday, June 1, 2022 10:59 AM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: B, Jeevan <jeevan.b@intel.com>; B S, Karthik 
>>> <karthik.b.s@intel.com>
>>> Subject: [PATCH i-g-t v2] tests/i915/kms_big_fb: Move cleanup code to
>>> fixture
>>>
>>> When a subtest fails, it exits from the assert and does not run the 
>>> cleanup
>>> part of the subtest. To avoid this, move the cleanup code to 
>>> igt_fixture
>>> outside the subtest.
>>>
>>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> Reviewed-by: Jeevan B <jeevan.b@intel.com>

Hi JP,

Thanks for pointing this out. Didn't notice this as pre-merge shows all 
green on CI. Will find the root cause and float a fix asap or will 
revert it.

Thanks,
Karthik.B.S
>
> Guys, this set broke big_fb tests. See any of these tests that were 
> ran 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7210/shards-all.html?testfilter=kms_big_fb
>
> For example 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7210/shard-dg1-17/igt@kms_big_fb@linear-16bpp-rotate-0.html
>
> ..
> Starting subtest: linear-16bpp-rotate-0
> Subtest linear-16bpp-rotate-0: SUCCESS (1.781s)
> (kms_big_fb:992) intel_allocator-CRITICAL: Test assertion failure 
> function handle_request, file ../lib/intel_allocator.c:477:
> (kms_big_fb:992) intel_allocator-CRITICAL: Failed assertion: al
> Test kms_big_fb failed.
> ..
>
> /Juha-Pekka
>
>
>>> ---
>>>   tests/i915/kms_big_fb.c | 46 
>>> ++++++++++++++++++-----------------------
>>>   1 file changed, 20 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c index
>>> 91ad3b4d..abf974bb 100644
>>> --- a/tests/i915/kms_big_fb.c
>>> +++ b/tests/i915/kms_big_fb.c
>>> @@ -264,12 +264,6 @@ static void prep_fb(data_t *data)
>>>       generate_pattern(data, &data->big_fb, 640, 480); }
>>>
>>> -static void cleanup_fb(data_t *data)
>>> -{
>>> -    igt_remove_fb(data->drm_fd, &data->big_fb);
>>> -    data->big_fb.fb_id = 0;
>>> -}
>>> -
>>>   static void set_c8_lut(data_t *data)
>>>   {
>>>       igt_pipe_t *pipe = &data->display.pipes[data->pipe]; @@ -463,14
>>> +457,6 @@ static bool test_pipe(data_t *data)
>>>       if (data->format == DRM_FORMAT_C8)
>>>           unset_lut(data);
>>>
>>> -    igt_pipe_crc_free(data->pipe_crc);
>>> -
>>> -    igt_output_set_pipe(data->output, PIPE_ANY);
>>> -
>>> -    igt_remove_fb(data->drm_fd, &data->small_fb);
>>> -
>>> -    intel_bb_destroy(data->ibb);
>>> -
>>>       return ret;
>>>   }
>>>
>>> @@ -563,14 +549,6 @@ max_hw_stride_async_flip_test(data_t *data)
>>>       }
>>>       igt_reset_timeout();
>>>
>>> -    igt_pipe_crc_free(data->pipe_crc);
>>> -    igt_output_set_pipe(data->output, PIPE_NONE);
>>> -    igt_remove_fb(data->drm_fd, &data->big_fb);
>>> -    igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
>>> -    igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
>>> -
>>> -    intel_bb_destroy(data->ibb);
>>> -
>>>       return true;
>>>   }
>>>
>>> @@ -773,6 +751,22 @@ set_max_hw_stride(data_t *data)
>>>       }
>>>   }
>>>
>>> +static void test_cleanup(data_t *data)
>>> +{
>>> +    if (!data->output)
>>> +        return;
>>> +
>>> +    igt_pipe_crc_free(data->pipe_crc);
>>> +    igt_output_set_pipe(data->output, PIPE_NONE);
>>> +    igt_remove_fb(data->drm_fd, &data->big_fb);
>>> +    igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
>>> +    igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
>>> +    igt_remove_fb(data->drm_fd, &data->small_fb);
>>> +
>>> +    intel_bb_destroy(data->ibb);
>>> +    data->output = NULL;
>>> +}
>>> +
>>>   static data_t data = {};
>>>
>>>   static const struct {
>>> @@ -918,7 +912,7 @@ igt_main
>>>               }
>>>
>>>               igt_fixture
>>> -                cleanup_fb(&data);
>>> +                test_cleanup(&data);
>>>           }
>>>       }
>>>
>>> @@ -972,10 +966,10 @@ igt_main
>>>                               test_scanout(&data);
>>>                       }
>>>                       data.async_flip_test = false;
>>> -                }
>>>
>>> -                igt_fixture
>>> -                    cleanup_fb(&data);
>>> +                    igt_fixture
>>> +                        test_cleanup(&data);
>>> +                }
>>>               }
>>>           }
>>>       }
>>> -- 
>>> 2.22.0
>>
>
