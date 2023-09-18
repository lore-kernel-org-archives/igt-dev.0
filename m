Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054CA10E225
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 09:25:20 +0000 (UTC)
Date: Mon, 18 Sep 2023 11:24:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230918092447.vkzmoom77i55n7rp@kamilkon-desk.igk.intel.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
 <20230908150315.75977-2-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230908150315.75977-2-harry.wentland@amd.com>
Subject: Re: [igt-dev] [RFC PATCH 1/7] include/drm-uapi: Add COLOROP object
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alexander Goins <agoins@nvidia.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Sebastian Wick <sebastian.wick@redhat.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Jonas =?utf-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Harry,

On 2023-09-08 at 11:03:09 -0400, Harry Wentland wrote:
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

Put here description from cover letter or at least links
to drm-uapi commits (prefereable lore.kernel.org) with subjects
cited (as links can break in future).

Regards,
Kamil

> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> ---
>  include/drm-uapi/drm_mode.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index e4a2570a6058..e7e56150616b 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -626,6 +626,7 @@ struct drm_mode_connector_set_property {
>  #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
>  #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
>  #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
> +#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
>  #define DRM_MODE_OBJECT_ANY 0
>  
>  struct drm_mode_obj_get_properties {
> -- 
> 2.42.0
> 
