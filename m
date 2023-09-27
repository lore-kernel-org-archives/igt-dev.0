Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C20510E575
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 16:55:46 +0000 (UTC)
Date: Wed, 27 Sep 2023 12:55:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZRRehIfAtg5csw86@intel.com>
References: <20230926130054.6-1-francois.dugast@intel.com>
 <20230926130054.6-2-francois.dugast@intel.com>
 <0660e811-3b98-7f02-aaab-ce3c5fe2bbdb@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0660e811-3b98-7f02-aaab-ce3c5fe2bbdb@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 01/24] drm-uapi/xe_drm: Align with new PMU
 interface
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 05:50:53PM +0100, Tvrtko Ursulin wrote:
> 
> On 26/09/2023 14:00, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Align with commit ("drm/xe/pmu: Enable PMU interface")
> > 
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   include/drm-uapi/xe_drm.h | 38 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> > 
> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > index 804c02270..643eb6e82 100644
> > --- a/include/drm-uapi/xe_drm.h
> > +++ b/include/drm-uapi/xe_drm.h
> > @@ -1053,6 +1053,44 @@ struct drm_xe_vm_madvise {
> >   	__u64 reserved[2];
> >   };
> > +/**
> > + * DOC: XE PMU event config IDs
> > + *
> > + * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
> > + * as part of perf_event_open syscall to read a particular event.
> > + *
> > + * For example to open the XE_PMU_INTERRUPTS(0):
> > + *
> > + * .. code-block:: C
> > + *	struct perf_event_attr attr;
> > + *	long long count;
> > + *	int cpu = 0;
> > + *	int fd;
> > + *
> > + *	memset(&attr, 0, sizeof(struct perf_event_attr));
> > + *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
> > + *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> > + *	attr.use_clockid = 1;
> > + *	attr.clockid = CLOCK_MONOTONIC;
> > + *	attr.config = XE_PMU_INTERRUPTS(0);
> > + *
> > + *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
> > + */
> > +
> > +/*
> > + * Top bits of every counter are GT id.
> > + */
> > +#define __XE_PMU_GT_SHIFT (56)
> > +
> > +#define ___XE_PMU_OTHER(gt, x) \
> > +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> > +
> > +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> 
> AFAIR interrupts is probably the least useful counter and I don't remember
> that anyone asked much about it. Therefore I'd say it could be worth seeing
> if you could just drop it. Changes to intel_gpu_top to work with the below
> set (no per engine, no frequencies) will have to be extensive already
> anyway.

Aravind, could you please reply to that?

> 
> Regards,
> 
> Tvrtko
> 
> > +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> > +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> > +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> > +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> > +
> >   #if defined(__cplusplus)
> >   }
> >   #endif
