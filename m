Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D589F63
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 09:44:07 +0000 (UTC)
Date: Mon, 20 Jul 2020 12:44:03 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200720094403.iwpexq2kwzy5h6pg@ahiler-desk1.fi.intel.com>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
 <20200711200602.3217-11-mohammed.khajapasha@intel.com>
 <20200717130233.ootl4edkexetvu2e@ahiler-desk1.fi.intel.com>
 <DM6PR11MB29387D64D9D122DB5799B0D7E97C0@DM6PR11MB2938.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR11MB29387D64D9D122DB5799B0D7E97C0@DM6PR11MB2938.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 10/11] lib/kms: Convert pipe id flags
 for a vblank using crtc offset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 06:43:59PM +0300, Khajapasha, Mohammed wrote:
> 
> 
> > -----Original Message-----
> > From: Hiler, Arkadiusz <arkadiusz.hiler@intel.com>
> > Sent: Friday, July 17, 2020 6:33 PM
> > To: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH i-g-t 10/11] lib/kms: Convert pipe id flags for a vblank
> > using crtc offset
> >
> > On Sun, Jul 12, 2020 at 01:36:01AM +0530, Mohammed Khajapasha wrote:
> > > In i915 with non-contiguous pipes display, pipes always not same as
> > > crtc index in display pipes array. Hence reading pipe id flags for a
> > > vblank event using crtc offset.
> >
> > Mention in the commit message that crtc_offset was chosen because
> > crtc_index is too close to crtc_id which can cause confusion.
> 
> As per my understanding crtc_index and crtc_id are different, crtc_id is DRM mode object id
> assigned by DRM for each drm object. And crtc_index & crtc_offset both are same for list
> crtc in mode config list.

Yes, you are correct. IMO crtc_offset is a better name than crtc_index.

Imagine having crtc_id and crtc_index sprinkled all throughout the code.
It's very easy to mistake one for the other.

It's harder to make a similar mistake with crtc_id and crtc_offset.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
