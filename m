Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE806E82F
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Jun 2021 01:38:18 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Sat, 5 Jun 2021 01:38:15 +0000
Message-ID: <43b5bcf241ea2c2ca73b311c8a1a0c245fc87436.camel@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-11-alan.previn.teres.alexis@intel.com>
 <YLorPkfLZ9D+V+RJ@intel.com>
In-Reply-To: <YLorPkfLZ9D+V+RJ@intel.com>
Content-Language: en-US
Content-ID: <A296C122939ABF44BFDAC26CA9285FA8@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 10/17] Add test where both src and dest
 are protected
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
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2021-06-04 at 09:31 -0400, Rodrigo Vivi wrote:
> On Tue, May 18, 2021 at 03:33:37AM -0700, Alan Previn wrote:
> > -static void assert_bo_content_check(int i915, uint32_t bo, int
> > compare_op,
> > -				    uint32_t size, uint32_t color)
> > +static void assert_bo_content_check(int i915, uint32_t bo, int
> > compare_op, uint32_t size,
> > +				    uint32_t color, uint32_t *auxptr,
> > int auxsize)
> >  {
> > -	uint32_t *ptr, *ptrtmp;
> > +	uint32_t *ptr, *ptrtmp, *auxtmp;
> >  	int loop = 0, num_matches = 0;
> >  	uint32_t value;
> > -	bool op_readible = (compare_op == COMPARE_COLOR_READIBLE);
> > +	bool op_readible = ((compare_op == COMPARE_COLOR_READIBLE) ||
> > +		 (compare_op == COMPARE_BUFFER_READIBLE));
> > +	bool chk_buff = ((compare_op == COMPARE_BUFFER_READIBLE) ||
> > +		 (compare_op == COMPARE_BUFFER_UNREADIBLE));
> 
> why do we need to differentiate between color and buffer if they
> are doing the same thing everywhere?
> 
> well, I'm assuming this is a future case, so anyway:
> 
Yes, depending on the subtest, we're comparing rendered buffers against
a constant color value or we're comparing rendered buffers against an
auxiliary buffer to compare against. In some subtests, they need to
match and in other subtests they need to fail. that's why mirrored op
definitions. Thanks.

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
