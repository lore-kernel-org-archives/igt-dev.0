Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E8B10E747
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 17:08:27 +0000 (UTC)
Date: Thu, 30 Nov 2023 18:07:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231130170728.pepzvmqa6wmk5wje@kamilkon-desk.igk.intel.com>
References: <20231130111735.435263-1-matthew.auld@intel.com>
 <20231130111735.435263-2-matthew.auld@intel.com>
 <20231130135556.crdwx3uzgmcym5qo@kamilkon-desk.igk.intel.com>
 <57854b8e-adda-46a6-bf95-327c98fa7486@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <57854b8e-adda-46a6-bf95-327c98fa7486@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci/xe-fast-feedback:
 add create-invalid-mbz
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Matthew,
On 2023-11-30 at 15:00:32 +0000, Matthew Auld wrote:
> On 30/11/2023 13:55, Kamil Konieczny wrote:
> > Hi Matthew,
> > On 2023-11-30 at 11:17:35 +0000, Matthew Auld wrote:
> > > Ensure we have some coverage in BAT for gem_create MBZ fields.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >   tests/intel-ci/xe-fast-feedback.testlist | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> > > index 5c53e249d..a83c17de7 100644
> > > --- a/tests/intel-ci/xe-fast-feedback.testlist
> > > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > > @@ -2,6 +2,7 @@
> > >   igt@xe_module_load@load
> > >   igt@xe_compute@compute-square
> > > +igt@xe_create@create-invalid-mbz
> > 
> > Please move it before @create-massive-size,
> > it should be sorted alphabetically.
> 
> Ok, I didn't realise that was a requirement. I can move it.
> 
> Note that there are a bunch of tests in this list not following any kind of
> alphabetical sorting, but is more ordered/grouped/structured by
> functionality, which I think makes more sense IMO. Like here
> create-invalid-mbz is just a really simple sanity check for gem_create so
> running it first made sense to me. A better example is maybe xe_vm@shared-*,
> since for that it makes sense to run the pte subtest first, with every next
> test being the next level up in the paging structures:
> 
> igt@xe_vm@shared-pte-page
> igt@xe_vm@shared-pde-page
> igt@xe_vm@shared-pde2-page
> igt@xe_vm@shared-pde3-page
> 
> So here it rather ordered by functionally. Anyway, I think if we intend to
> sort this alphabetically we should put a comment at the top of the file or
> something, and then also send a patch to sort everything?
> 

imho when we put something out-of-order we should write comment, like:

# A comment why this should run before other tests

or

# A comment why this should run after other tests

Then with such comment you can have non-alphabetical order.

Regards,
Kamil

> > 
> > Regards,
> > Kamil
> > 
> > >   igt@xe_create@create-execqueues-noleak
> > >   igt@xe_create@create-execqueues-leak
> > >   igt@xe_create@create-massive-size
> > > -- 
> > > 2.43.0
> > > 
