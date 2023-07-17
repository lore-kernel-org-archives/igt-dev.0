Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58B510E035
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jul 2023 11:28:03 +0000 (UTC)
Date: Mon, 17 Jul 2023 13:27:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Liu, HaoPing (Alan)" <HaoPing.liu@amd.com>
Message-ID: <20230717112759.4fytbedtckx4okqj@zkempczy-mobl2>
References: <20230705152606.13117-1-HaoPing.Liu@amd.com>
 <20230711175913.vdyn6zfgndquvnt2@kamilkon-desk1>
 <9eea967b-52ea-03b4-295e-2fcdf945d33f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eea967b-52ea-03b4-295e-2fcdf945d33f@amd.com>
Subject: Re: [igt-dev] [PATCH v3 1/2] drm-uapi/drm_mode: sync with latest
 uAPI changes for checksum_region
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Lili.Gong@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 05:23:39PM +0800, Liu, HaoPing (Alan) wrote:
> Hi Kamil,
> 
> 
> On 2023/7/12 上午 01:59, Kamil Konieczny wrote:
> > Hi Alan,
> > 
> > On 2023-07-05 at 23:26:05 +0800, Alan Liu wrote:
> > > Add struct drm_checksum_region and struct drm_checksum_crc as the
> > > userspace data for using checksum_region feature.
> > > 
> > > Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
> > Please send this as a separate patch, write also to which repo
> > are you sync-ing, is it drm-tip?
> 
> I am trying to submit patches of checksum_region feature to dri-devel
> (https://patchwork.freedesktop.org/series/119499/).
> 
> This patch series is the IGT for testing checksum_region, and this
> particular patch adds the structs in drm_mode.h for IGT userspace to test
> checksum_region.
> 
> I think I've already collected all the changes to drm_mode.h into this
> patch. Do you want me to separate this patch into a new patch series?

I've just take a look to uapi drm_mode.h change and it is not officially
accepted. In this case we're not merging not ready uapi.

Introduce your change by localizing it in the test (for example

struct local_drm_checksum_region {
...
}

Use it in the test, and when your uapi will be accepted you may
merge drm_mode.h file, removing above local struct replacing by
drm_checksum_region.

--
Zbigniew

> 
> 
> Thanks,
> 
> Alan
> 
> > Regards,
> > Kamil
> > 
> > > ---
> > >   include/drm-uapi/drm_mode.h | 42 +++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 42 insertions(+)
> > > 
> > > diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> > > index e4a2570a6..dec073921 100644
> > > --- a/include/drm-uapi/drm_mode.h
> > > +++ b/include/drm-uapi/drm_mode.h
> > > @@ -1209,6 +1209,48 @@ struct drm_mode_rect {
> > >   	__s32 y2;
> > >   };
> > > +/**
> > > + * struct drm_checksum_region - The enablement and region of checksum_region
> > > + * @x_start: Horizontal starting coordinate of the region.
> > > + * @y_start: Vertical starting coordinate of the region.
> > > + * @x_end: Horizontal ending coordinate of the region.
> > > + * @y_end: Vertical ending coordinate of the region.
> > > + * @checksum_region_enable: To enable or disable checksum_region.
> > > + *
> > > + * Userspace uses this structure to configure the region and enablement for
> > > + * checksum_region. Userspace should not submit a region out of the displayable
> > > + * region because there is nothing to display and need protection.
> > > + */
> > > +struct drm_checksum_region {
> > > +        __u32 x_start;
> > > +        __u32 y_start;
> > > +        __u32 x_end;
> > > +        __u32 y_end;
> > > +        __u8 checksum_region_enable;
> > > +        __u8 pad[7];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_checksum_crc - The CRC value of the corresponding checksum region.
> > > + * @crc_r: CRC value of red color.
> > > + * @crc_g: CRC value of green color.
> > > + * @crc_b: CRC value of blue color.
> > > + * @frame_count: a referenced frame count to indicate which frame the CRC values
> > > + *  are generated at.
> > > + *
> > > + * Userspace uses this structure to retrieve the CRC values of the current
> > > + * checksum region. @frame_count will be reset once a new region is updated or
> > > + * it reaches a maximum value. Currently these CRC values are designed to
> > > + * be validated with pre-saved CRC values, so userspace doesn't need to concern
> > > + * about the algorithm used to compute the CRC.
> > > + */
> > > +struct drm_checksum_crc {
> > > +        __u32 crc_r;
> > > +        __u32 crc_g;
> > > +        __u32 crc_b;
> > > +        __u32 frame_count;
> > > +};
> > > +
> > >   #if defined(__cplusplus)
> > >   }
> > >   #endif
> > > -- 
> > > 2.34.1
> > > 
