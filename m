Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523C76E0B6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 17:02:53 +0000 (UTC)
Date: Wed, 12 Feb 2020 19:01:19 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200212170119.GB6428@ideak-desk.fi.intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
 <20200211023108.25369-6-imre.deak@intel.com>
 <87mu9ouznz.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mu9ouznz.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH v2 6/8] tests/kms_frontbuffer_tracking: Skip
 GTT subtests on platforms w/o aperture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 09:45:20PM -0800, Dixit, Ashutosh wrote:
> On Mon, 10 Feb 2020 18:31:06 -0800, Imre Deak wrote:
> > @@ -3025,6 +3042,9 @@ static void basic_subtest(const struct test_mode *t)
> >	fb1 = params->primary.fb;
> >
> >	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++, r++) {
> > +		igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
> > +			    !gem_has_mappable_ggtt(drm.fd));
> > +
> 
> I don't think this is incorrect. It will result in the entire subtest being
> skipped, for all methods, rather than only the GTT method. Need to use
> 'continue' here.

Right. The test doesn't expect that we skip any methods, but it looks
easy to fix that. 

-Imre
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
