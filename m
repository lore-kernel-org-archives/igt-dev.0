Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD6A10E377
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 14:51:51 +0000 (UTC)
Message-ID: <c18ff50d-d06e-4037-9adc-2a89507f76f1@amd.com>
Date: Tue, 22 Aug 2023 10:51:39 -0400
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
 <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
 <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
 <sa6iblbqyfnu4oropbazlakghwh3ekcnajojmj4th4bswjqlxg@sfmkfo7d7tsj>
 <28f80f34-c7a9-44c8-a33a-6ded92458e29@amd.com>
 <z63pwygl73s6tdiusqx7vxu7ara6eung3l6bkaa4ffy4twwau2@iidh6mhtqq7c>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <z63pwygl73s6tdiusqx7vxu7ara6eung3l6bkaa4ffy4twwau2@iidh6mhtqq7c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 3/3] tests/kms_writeback: support
 DRM_FORMAT_XRGB2101010 for writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-08-22 09:26, Maxime Ripard wrote:
> On Thu, Aug 17, 2023 at 10:15:04AM -0400, Harry Wentland wrote:
>>
>>
>> On 2023-08-17 03:50, Maxime Ripard wrote:
>>> On Thu, Aug 17, 2023 at 01:09:44AM -0600, Alex Hung wrote:
>>>>
>>>>
>>>> On 2023-08-17 00:32, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Wed, Aug 16, 2023 at 02:53:16PM -0600, Alex Hung wrote:
>>>>>> Allow kms_writeback to run with DRM_FORMAT_XRGB8888 if supported
>>>>>> or to try DRM_FORMAT_XRGB2101010 if DRM_FORMAT_XRGB8888 is not
>>>>>> available.
>>>>>
>>>>> XRGB8888 is always supposed to be available, if it's not, it's a driver
>>>>> issue. Which means that XRGB2101010 will never actually be tested.
>>>>
>>>> It is up to a device driver to support specific format(s), not necessary an
>>>> issue. At least for now amdgpu won't support XRGB8888 but XRGB2101010.
>>>
>>> I guess it's unrelated to that patch in particular, but it's not ok from
>>> a KMS standpoint. It was poorly documented before, but see
>>>
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helper.c#L430
>>> https://lore.kernel.org/dri-devel/20230807140317.26146-2-jfalempe@redhat.com/
>>>
>>
>> Our HW writeback can't do 8888. This would be a silly reason to not be
>> able to use it for testing purposes.
> 
> Ah, right, sorry for the brainfart.
> 
>> I don't even understand what "SW Color Conversion" means here. Is it
>> expected that drivers use CPU code in kernel to walk the buffer and
>> "color convert" from XRGB8888 to whatever the HW supports (and the
>> inverse for the writeback buffer)? That seems a bit ridiculous.
> 
> That's exactly what that means. We have a bunch of helpers to do that
> already, used for example by simpledrm if it's backed by a different
> format. See:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_format_helper.c#L914
> 

Huh, I wasn't aware of that. Thanks for pointing that out.

In our case the driver supports XRGB8888 on a plane's framebuffer. The only
limitation is on the writeback connector's fb. But I guess the way the kernel
doc talks about this it would apply to either.

What do you think would the right approach? Implement a
drm_fb_xrgb2101010_to_xrgb8888 variant in drm_fb_blit and call that on
the output buffer?

I got to say I'm not at all a fan of forcing compatibility with XRGB8888 if
this means a CPU blit. I feel this is misleading DRM clients, giving them
the impression XRGB8888 is supported by HW even though it requires a (terribly
slow and costly) CPU blit.

Harry

> Maxime
