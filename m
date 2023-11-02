Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A781E10E0CB
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 15:52:28 +0000 (UTC)
Message-ID: <18229c5f-b522-4c72-b720-9769f5ae2ecd@amd.com>
Date: Thu, 2 Nov 2023 11:52:20 -0400
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Alexander Goins <agoins@nvidia.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton
 <joshua@froggi.es>, Daniel Vetter <daniel@ffwll.ch>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
 <20230908150315.75977-2-harry.wentland@amd.com>
 <20230918092447.vkzmoom77i55n7rp@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230918092447.vkzmoom77i55n7rp@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH 1/7] include/drm-uapi: Add COLOROP object
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



On 2023-09-18 05:24, Kamil Konieczny wrote:
> Hi Harry,
> 
> On 2023-09-08 at 11:03:09 -0400, Harry Wentland wrote:
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> 
> Put here description from cover letter or at least links
> to drm-uapi commits (prefereable lore.kernel.org) with subjects
> cited (as links can break in future).
> 

I agree this needs a bit of a description and will be remedied
in the next version, but for the bigger picture shouldn't this
be in the cover letter? If I copy-paste the cover letter here
then why not in every other patch of the series?

(Email patch series still confuse me -_-)

Harry

> Regards,
> Kamil
> 
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> ---
>>  include/drm-uapi/drm_mode.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
>> index e4a2570a6058..e7e56150616b 100644
>> --- a/include/drm-uapi/drm_mode.h
>> +++ b/include/drm-uapi/drm_mode.h
>> @@ -626,6 +626,7 @@ struct drm_mode_connector_set_property {
>>  #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
>>  #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
>>  #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
>> +#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
>>  #define DRM_MODE_OBJECT_ANY 0
>>  
>>  struct drm_mode_obj_get_properties {
>> -- 
>> 2.42.0
>>
