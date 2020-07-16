Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ABF6EC46
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 10:40:13 +0000 (UTC)
Date: Thu, 16 Jul 2020 13:40:09 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200716104009.yaexvqjejdh7g4oq@ahiler-desk1.fi.intel.com>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
 <20200711200602.3217-11-mohammed.khajapasha@intel.com>
 <20200715145026.zvanrvlbamlalkbs@ahiler-desk1.fi.intel.com>
 <87tuy7zs2x.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tuy7zs2x.fsf@intel.com>
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 01:12:38PM +0300, Jani Nikula wrote:
> On Wed, 15 Jul 2020, Arkadiusz Hiler <arkadiusz.hiler@intel.com> wrote:
> > In KMS & i915 there are two thing that are called pipe:
> 
> ...
> 
> > Is there any practical reason besides people wanting to have test
> > results for pipe-c corresponding to Intel's hardware understanding of
> > what pipe-c is?
> >
> > You may need to ELI5 that to me. I have very rudimentary understanding
> > of this area and only learned about the multiple meanings of "pipe"
> > while doing the review here :-)
> 
> Something I've been saying all along: If you call something a "pipe", it
> *must* mean Intel hardware pipe. If you call something "crtc index", it
> *must* mean the ABI crtc index. Don't mix the two. Don't implicitly
> convert between the two (i.e. you need explicit conversion using the
> IOCTL). Assume it's purely a coincidence that they've previously matched
> 1:1.

I am all for clarifying things up, but I am not very familiar with the
history of how we ended up here - that's why I am asking all those
questions.

What bothers me is that pipe already has multiple meanings, not only in IGT.

From https://www.keithp.com/blogs/DRM-lease-4/ :
"It has been kludged into supporting multiple CRTCs by taking bits from
the 'type' parameter to hold a 'pipe' number, which is the index in the
kernel into the array of CRTCs."

https://elixir.bootlin.com/linux/v5.7.8/source/drivers/gpu/drm/drm_vblank.c#L1658

So pipe = crtc index (or offset) in the array of CRTCs, not the hardware
concept of a pipe. It's not the IGT inventing this terminology, and
there is already a precedent where the mapping doesn't have to be 1:1
(DRM Lease).

> In this case, naming is everything, and proper naming leads to clarity
> of the concepts and implementation.

crtc_index is also not awfully clear as it's too easy to confuse it with
crtc_id.

https://gitlab.freedesktop.org/mesa/drm/-/blob/master/xf86drmMode.h#L272


I am fine with IGT:
 1. using crtc_id for crtc_id
 2. using crtc_offset for the offset of that CRTC in the drmModeRes.crtcs
 3. using pipe to describe the hardware context

And I think that this patch series gets us there.


But I am afraid that we will diverge too much form kernel's vocabulary
which won't help with the core of the confusion.

Do you happen to know how the CRTC/pipe situation looks like with other
vendors?

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
