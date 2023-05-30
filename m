Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527D710E230
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 16:50:57 +0000 (UTC)
Date: Tue, 30 May 2023 18:50:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230530165044.uhfeyqmw3jbvsjhy@zkempczy-mobl2>
References: <20230529165417.347129-1-zbigniew.kempczynski@intel.com>
 <20230529165417.347129-3-zbigniew.kempczynski@intel.com>
 <694fc94c-bc43-50a8-8614-3737a21babe4@intel.com>
 <20230530122501.twuttzwv4u5gymr2@zkempczy-mobl2>
 <de874dbf-64d3-6d57-eaaf-478c7d452adb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de874dbf-64d3-6d57-eaaf-478c7d452adb@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/intel_batchbuffer: Use COMPUTE
 instead RENDER engine for Xe on PVC
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

On Tue, May 30, 2023 at 04:50:35PM +0200, Manszewski, Christoph wrote:
> 
> 
> On 30.05.2023 14:25, Zbigniew Kempczyński wrote:
> > On Tue, May 30, 2023 at 09:13:39AM +0200, Manszewski, Christoph wrote:
> > > Hi Zbigniew,
> > > 
> > > On 29.05.2023 18:54, Zbigniew Kempczyński wrote:
> > > > For gpgpu fill currently we select I915_EXEC_RENDER which is correct
> > > > as pipeline selection allows to submit compute job on it. However
> > > > newer platforms like PVC have no render engine so replacing to compute
> > > > engine is necessary. At the moment this is workaround - more rework
> > > > in intel-bb is necessary to better support both - i915 and xe.
> > > 
> > > [PATCH i-g-t v3] lib/intel_bb: Enable custom engine support for xe
> > > makes it possible to provide custom engines. Let me know what you think.
> > 
> > Still we're using intel_bb_exec(I915_EXEC_RENDER, ...) on gpgpu what
> 
> True.
> 
> 
> > means we need to do conditionals there or introduce engine translation
> > layer in intel-bb. I'm going to convert current argument passing model
> > to designated initializers used in igt spin factory. But this doesn't
> > conflict your change which I'm going to review today.
> 
> Agreed, moreover having these two changes coexisting leaves the choice to
> the user, whether he wants to provide a custom engine, or rely on legacy
> mode.

Yes, but I think this needs some rework in this area.

Thank you for the review.

--
Zbigniew

> 
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Christoph
> 
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > Christoph
> > > 
> > > 
> > > > 
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > ---
> > > >    lib/intel_batchbuffer.c | 5 ++++-
> > > >    1 file changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > > > index 9f65536173..71f62973c8 100644
> > > > --- a/lib/intel_batchbuffer.c
> > > > +++ b/lib/intel_batchbuffer.c
> > > > @@ -2315,7 +2315,10 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
> > > >    			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> > > >    			break;
> > > >    		case I915_EXEC_RENDER:
> > > > -			inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> > > > +			if (IS_PONTEVECCHIO(xe_dev_id(ibb->fd)))
> > > > +				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> > > > +			else
> > > > +				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> > > >    			break;
> > > >    		case I915_EXEC_VEBOX:
> > > >    			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
