Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229FD10E9F4
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:34:23 +0000 (UTC)
Message-ID: <46567128-61fa-4ef3-a78a-898b0e26db2e@amd.com>
Date: Fri, 3 Nov 2023 10:34:16 -0400
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
 <20230908150315.75977-6-harry.wentland@amd.com>
 <20230915175258.0181c016.pekka.paalanen@collabora.com>
 <f20017fc-2e91-4210-a446-06652347153e@amd.com>
 <20230918110218.3c7975c4.pekka.paalanen@collabora.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230918110218.3c7975c4.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH 5/7] igt/color: Add SW color transform
 functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Alexander Goins <agoins@nvidia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Daniel Vetter <daniel@ffwll.ch>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-09-18 04:02, Pekka Paalanen wrote:
> On Fri, 15 Sep 2023 15:50:52 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-09-15 10:52, Pekka Paalanen wrote:
>>> On Fri, 8 Sep 2023 11:03:13 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> In order to test color we want to compare a HW (KMS) transform
>>>> with a SW transform. This introduces color transform for an
>>>> sRGB EOTF but this can be extended to other transforms. Code is
>>>> borrowed from Skia.
>>>>
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>> Cc: Simon Ser <contact@emersion.fr>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Melissa Wen <mwen@igalia.com>
>>>> Cc: Jonas Ådahl <jadahl@redhat.com>
>>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>> Cc: Alexander Goins <agoins@nvidia.com>
>>>> Cc: Joshua Ashton <joshua@froggi.es>
>>>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>>>> Cc: Aleix Pol <aleixpol@kde.org>
>>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>>>> Cc: Victoria Brekenfeld <victoria@system76.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>>>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>>>> ---
>>>>  lib/igt_color.c | 330 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  lib/igt_color.h | 105 +++++++++++++++
>>>>  lib/igt_fb.c    |   6 +-
>>>>  lib/igt_fb.h    |   2 +
>>>>  lib/meson.build |   1 +
>>>>  5 files changed, 441 insertions(+), 3 deletions(-)
>>>>  create mode 100644 lib/igt_color.c
>>>>  create mode 100644 lib/igt_color.h
> 
> ...
> 
>>>> +/*
>>>> + * A transfer function mapping encoded values to linear values,
>>>> + * represented by this 7-parameter piecewise function:
>>>> + *
>>>> + *   linear = sign(encoded) *  (c*|encoded| + f)       , 0 <= |encoded| < d
>>>> + *          = sign(encoded) * ((a*|encoded| + b)^g + e), d <= |encoded|  
>>>
>>> The code you have does not actually do the extended form (use of sign
>>> and absolute value), but clamps the result to [0.0, 1.0].
>>>   
>>
>> Yes, the intention (and I didn't write this but copied it) is to be able to use
>> this to describe most (all?) standard transfer functions. See
>> https://github.com/google/skia/blob/main/include/core/SkColorSpace.h
> 
> My complaint is about doc and implementation disagreeing.
> 
> xvYCC and integer-encoded scRGB would need an extended range if anyone
> wanted to test those, if they even fit here. I also do not understand
> how it can be possible to express PQ EOTF or HLG OETF with this
> parameterisation. Maybe it's an approximation on a very limited domain?
> 

I have a feeling Skia maps everything to [0.0, 1.0] and agree that this
wouldn't work in the cases you mention (PQ would work with an additional
scaling of the values to 125.0).

What's here seems to work fine for sRGB but I'll have to hook this all up
to amdgpu and test both sRGB and PQ at the very least.

Harry

> 
> Thanks,
> pq
> 
>>>> + *
>>>> + * (A simple gamma transfer function sets g to gamma and a to 1.)
>>>> + */
>>>> +struct igt_color_tf {
>>>> +    float g, a,b,c,d,e,f;
>>>> +};
>>>> +
>>>> +const struct igt_color_tf srgb_tf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
>>>> +
>>>> +/* end of Skia-based code */
>>>> +
>>>> +typedef struct igt_pixel {
>>>> +	float r;
>>>> +	float g;
>>>> +	float b;
>>>> +} igt_pixel_t;  
>>>
>>> Thanks,
>>> pq  
>>
> 
