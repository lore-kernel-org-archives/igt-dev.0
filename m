Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCF310E4FC
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 16:23:05 +0000 (UTC)
Message-ID: <b5a1c8f7-0748-d3bb-fc8c-8cbee32e5168@amd.com>
Date: Thu, 17 Aug 2023 10:22:56 -0600
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, Maxime Ripard <maxime@cerno.tech>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
 <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
 <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
 <sa6iblbqyfnu4oropbazlakghwh3ekcnajojmj4th4bswjqlxg@sfmkfo7d7tsj>
 <28f80f34-c7a9-44c8-a33a-6ded92458e29@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <28f80f34-c7a9-44c8-a33a-6ded92458e29@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 2023-08-17 08:15, Harry Wentland wrote:
> 
> 
> On 2023-08-17 03:50, Maxime Ripard wrote:
>> On Thu, Aug 17, 2023 at 01:09:44AM -0600, Alex Hung wrote:
>>>
>>>
>>> On 2023-08-17 00:32, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Wed, Aug 16, 2023 at 02:53:16PM -0600, Alex Hung wrote:
>>>>> Allow kms_writeback to run with DRM_FORMAT_XRGB8888 if supported
>>>>> or to try DRM_FORMAT_XRGB2101010 if DRM_FORMAT_XRGB8888 is not
>>>>> available.
>>>>
>>>> XRGB8888 is always supposed to be available, if it's not, it's a driver
>>>> issue. Which means that XRGB2101010 will never actually be tested.
>>>
>>> It is up to a device driver to support specific format(s), not necessary an
>>> issue. At least for now amdgpu won't support XRGB8888 but XRGB2101010.
>>
>> I guess it's unrelated to that patch in particular, but it's not ok from
>> a KMS standpoint. It was poorly documented before, but see
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helper.c#L430
>> https://lore.kernel.org/dri-devel/20230807140317.26146-2-jfalempe@redhat.com/

We are not supporting any userspace applications other than testing. I 
also don't read this as "you MUST do color conversion to 8888" but as 
"color conversion to 8888 is one of two cases you are allowed to do".

>>
> 
> Our HW writeback can't do 8888. This would be a silly reason to not be
> able to use it for testing purposes.
> 
> I don't even understand what "SW Color Conversion" means here. Is it
> expected that drivers use CPU code in kernel to walk the buffer and
> "color convert" from XRGB8888 to whatever the HW supports (and the
> inverse for the writeback buffer)? That seems a bit ridiculous.
> 
> Harry
> 
> 
>>>> I think we should make a proper test for that format, instead of a
>>>> (silent) fallback?
>>>
>>> Not sure what's the proper test or the fallback you are referring to. The
>>> intention here is to test XRGB2101010 when possible without breaking the
>>> original behaviours for XRGB8888.
>>
>> Right, but you're not even testing that XRGB2101010 is actually there,
>> so if amdgpu format listing was somehow broken and you were to expose
>> XRGB8888 instead of XRGB2101010, you wouldn't notice. That's not great.

Only XRGB2101010 is supported.

>>
>>> Changing kms_writeback to tests multiple formats requires significant
>>> modifications and tests which requires a driver capable of multiple formats
>>> in the first place.
>>
>> That's fine, amdgpu will be that driver.

The purpose of this patch is to improve kms_writeback coverage:

- check XRGB8888, and test if supported or skip otherwise
to
- no XRGB8888? also check XRGB2101010, and test if supported or skip 
otherwise

For amdgpu, no writeback -> support XRGB2101010 in writeback.

XRGB2101010 will be used for testing. XRGB8888 may or may not be added 
later depending on whether there will be consumers of the feature but 
that is out of scope of this IGT patch.

Alex

>>
>> Maxime
> 
