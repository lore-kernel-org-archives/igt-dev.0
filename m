Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E716EE1E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 12:12:01 +0000 (UTC)
Date: Tue, 16 Nov 2021 14:10:55 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZOfz86+VDg8MQtg@platvala-desk.ger.corp.intel.com>
References: <20211115071610.14773-1-zbigniew.kempczynski@intel.com>
 <20211115071610.14773-3-zbigniew.kempczynski@intel.com>
 <CAM0jSHNpsMar+2fLQ5Epir6cRF4FahnkuSv=D4oTEjb6hA0W+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHNpsMar+2fLQ5Epir6cRF4FahnkuSv=D4oTEjb6hA0W+g@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci/fast-feedback: Add
 four subtests of gem_lmem_swapping to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 11:07:46AM +0000, Matthew Auld wrote:
> On Mon, 15 Nov 2021 at 07:16, Zbigniew Kempczyński
> <zbigniew.kempczynski@intel.com> wrote:
> >
> > Add basic and some random subtests to BAT to verify early lmem swapping
> > is working on discrete.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> 
> Acked-by: Matthew Auld <matthew.auld@intel.com>
> 
> According to the logs the below adds ~100+ seconds to BAT on DG1,
> hopefully that is acceptable.

That doesn't make DG1 the slowest BAT machine (chromebooks with their
eMMC disks still have that crown) and if the situation changes we can
revisit.

My

Acked-by: Petri Latvala <petri.latvala@intel.com>

from before still stands.

> 
> > ---
> >  tests/intel-ci/fast-feedback.testlist | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> > index fa5006d2e..de1c6cb46 100644
> > --- a/tests/intel-ci/fast-feedback.testlist
> > +++ b/tests/intel-ci/fast-feedback.testlist
> > @@ -34,6 +34,10 @@ igt@gem_flink_basic@double-flink
> >  igt@gem_flink_basic@flink-lifetime
> >  igt@gem_huc_copy@huc-copy
> >  igt@gem_linear_blits@basic
> > +igt@gem_lmem_swapping@basic
> > +igt@gem_lmem_swapping@parallel-random-engines
> > +igt@gem_lmem_swapping@random-engines
> > +igt@gem_lmem_swapping@verify-random
> >  igt@gem_mmap@basic
> >  igt@gem_mmap_gtt@basic
> >  igt@gem_render_linear_blits@basic
> > --
> > 2.26.0
> >
