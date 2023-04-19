Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4B710E1F2
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 19:54:16 +0000 (UTC)
Date: Wed, 19 Apr 2023 21:54:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230419195411.nsaotrn6evt3ebxh@zkempczy-mobl2>
References: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
 <20230418072535.14946-9-zbigniew.kempczynski@intel.com>
 <20230419140419.3sobuuz4a5sscuhf@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230419140419.3sobuuz4a5sscuhf@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v2 08/10] tests/xe-fast-feedback: Add
 xe_intel_bb test to BAT
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

On Wed, Apr 19, 2023 at 04:04:19PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2023-04-18 at 09:25:33 +0200, Zbigniew Kempczyński wrote:
> > Verifies intel-bb integration with xe.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/intel-ci/xe-fast-feedback.testlist | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> > index 5db27c6345..019804b579 100644
> > --- a/tests/intel-ci/xe-fast-feedback.testlist
> > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > @@ -1,6 +1,24 @@
> >  # Should be the first test
> >  igt@xe_module_load@load
> >  
> > +igt@xe_intel_bb@reset-bb
> > +igt@xe_intel_bb@purge-bb
> > +igt@xe_intel_bb@simple-bb
> > +igt@xe_intel_bb@simple-bb-ctx
> > +igt@xe_intel_bb@bb-with-allocator
> > +igt@xe_intel_bb@lot-of-buffers
> > +igt@xe_intel_bb@add-remove-objects
> > +igt@xe_intel_bb@destroy-bb
> > +igt@xe_intel_bb@create-in-region
> > +igt@xe_intel_bb@blit-simple
> > +igt@xe_intel_bb@blit-reloc
> > +igt@xe_intel_bb@intel-bb-blit-none
> > +igt@xe_intel_bb@intel-bb-blit-x
> > +igt@xe_intel_bb@intel-bb-blit-y
> > +igt@xe_intel_bb@offset-control
> > +igt@xe_intel_bb@delta-check
> > +igt@xe_intel_bb@full-batch
> > +igt@xe_intel_bb@render
> 
> imho we should keep it sorted alphabetically,

Right, agree. Fix in next series.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> >  igt@xe_compute@compute-square
> >  igt@xe_debugfs@base
> >  igt@xe_debugfs@gt
> > -- 
> > 2.34.1
> > 
