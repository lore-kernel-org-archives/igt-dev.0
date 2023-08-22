Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B84410E377
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 14:34:59 +0000 (UTC)
Message-ID: <eac5d9ed-4e76-41f1-aacb-f53e14fb7845@amd.com>
Date: Tue, 22 Aug 2023 10:34:51 -0400
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Alex Hung <alex.hung@amd.com>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
 <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
 <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
 <sa6iblbqyfnu4oropbazlakghwh3ekcnajojmj4th4bswjqlxg@sfmkfo7d7tsj>
 <28f80f34-c7a9-44c8-a33a-6ded92458e29@amd.com>
 <b5a1c8f7-0748-d3bb-fc8c-8cbee32e5168@amd.com>
 <k6cahbb4qc3pxiyexroh2egb7dhrb4ljf6hqaffdwrmsfxzkzg@xjifh5hbu5bt>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <k6cahbb4qc3pxiyexroh2egb7dhrb4ljf6hqaffdwrmsfxzkzg@xjifh5hbu5bt>
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



On 2023-08-22 10:14, Maxime Ripard wrote:
> On Thu, Aug 17, 2023 at 10:22:56AM -0600, Alex Hung wrote:
>>>>>> I think we should make a proper test for that format, instead of a
>>>>>> (silent) fallback?
>>>>>
>>>>> Not sure what's the proper test or the fallback you are referring to. The
>>>>> intention here is to test XRGB2101010 when possible without breaking the
>>>>> original behaviours for XRGB8888.
>>>>
>>>> Right, but you're not even testing that XRGB2101010 is actually there,
>>>> so if amdgpu format listing was somehow broken and you were to expose
>>>> XRGB8888 instead of XRGB2101010, you wouldn't notice. That's not great.
>>
>> Only XRGB2101010 is supported.
>>
>>>>> Changing kms_writeback to tests multiple formats requires significant
>>>>> modifications and tests which requires a driver capable of multiple formats
>>>>> in the first place.
>>>>
>>>> That's fine, amdgpu will be that driver.
>>
>> The purpose of this patch is to improve kms_writeback coverage:
>>
>> - check XRGB8888, and test if supported or skip otherwise
>> to
>> - no XRGB8888? also check XRGB2101010, and test if supported or skip
>> otherwise
>>
>> For amdgpu, no writeback -> support XRGB2101010 in writeback.
>>
>> XRGB2101010 will be used for testing. XRGB8888 may or may not be added later
>> depending on whether there will be consumers of the feature but that is out
>> of scope of this IGT patch.
> 
> My point is the fallback doesn't provide anything, and is harmful to
> some extent. So far, we have some hardware that support XRGB8888 only,
> and some that support XRGB2101010 only.
> 
> There's no point in falling back from one to the other, and if we ever
> have hardware that would support both it prevents from checking both.
> 
> And sure, we could address it then, or we could address it now. It's
> just adding an extra parameter to a couple of functions and a few new
> subtests, it's not like we need to rewrite the whole thing.
> 

I tend to agree. My preference would be to have a subtest for each
supported format, i.e. a -xrgb8888 and an -xrgb2101010 test.

I think there was some concern about not changing existing test
names. In that case we can keep the original test names for the
-xrgb8888 tests and append the format to the new tests.

Harry

> Maxime
