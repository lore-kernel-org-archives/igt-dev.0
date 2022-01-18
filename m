Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2810E19F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jan 2022 22:32:45 +0000 (UTC)
Date: Tue, 18 Jan 2022 14:32:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <YedACz8aYwPs59md@mdroper-desk1.amr.corp.intel.com>
References: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
 <20220117085700.1723228-2-priyanka.dandamudi@intel.com>
 <85czkq9krp.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85czkq9krp.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] lib/igt_gt: Check for shared
 reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 12:20:42PM -0800, Dixit, Ashutosh wrote:
> On Mon, 17 Jan 2022 00:56:59 -0800, <priyanka.dandamudi@intel.com> wrote:
> >
> > +bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
> > +{
> > +	const struct intel_execution_engine2 *e;
> > +	bool rcs0 = false;
> > +	bool ccs0 = false;
> > +	int ccs_count = 0;
> > +
> > +	for_each_ctx_engine(fd, ctx, e) {
> > +		if ((rcs0 && ccs0) || (ccs_count > 1))
> > +			break;
> > +		else if (e->class == I915_ENGINE_CLASS_RENDER)
> > +			rcs0 = true;
> > +		else if (e->class == I915_ENGINE_CLASS_COMPUTE) {
> > +			ccs0 = true;
> > +			ccs_count++;
> > +		}
> > +	}
> > +	return ((rcs0 && ccs0) || (ccs_count > 1));
> > +}
> 
> No need for bool, just use counts. Something like:
> 
> bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
> {
> 	const struct intel_execution_engine2 *e;
> 	int rcs = 0, ccs = 0;
> 
> 	for_each_ctx_engine(fd, ctx, e) {
> 		if (e->class == I915_ENGINE_CLASS_RENDER)
> 			rcs++;
> 		else if (e->class == I915_ENGINE_CLASS_COMPUTE)
> 			ccs++;
> 	}
> 
> 	return ((rcs && ccs) || (ccs >= 2));
> }
> 
> Hmm, this can just be:
> 
> bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
> {
> 	const struct intel_execution_engine2 *e;
> 	int count = 0;
> 
> 	for_each_ctx_engine(fd, ctx, e)
> 		if (e->class == I915_ENGINE_CLASS_RENDER ||
> 			e->class == I915_ENGINE_CLASS_COMPUTE)
> 		count++;
> 
> 	return count >= 2;
> }

Yeah, there's no reason to count RCS and CCS separately; all we care
about is whether there's more than one engine in the shared reset
domain.

However I think any approach that involves just counting engines from
userspace isn't really going to work once we start supporting multi-tile
since the various RCS/CCS engines on two separate GTs do belong to
separate reset domains.  E.g., if you query the engine list and see just
CCS0 and CCS1 (or even RCS0 and CCS0) you don't know whether those
engines are both from a single GT and thus share a reset domain, or
whether they come from different GTs and each has its own reset domain.


Matt

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
