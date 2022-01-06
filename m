Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7265D10E9C5
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jan 2022 09:55:55 +0000 (UTC)
Date: Thu, 6 Jan 2022 10:55:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Yda8phW7hK35Jzeb@zkempczy-mobl2>
References: <20220105064945.9640-1-zbigniew.kempczynski@intel.com>
 <20220105064945.9640-3-zbigniew.kempczynski@intel.com>
 <87sfu1a9f5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sfu1a9f5.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/i915/gem_softpin: Add
 safe-start test
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 05, 2022 at 06:24:14PM -0800, Dixit, Ashutosh wrote:
> On Tue, 04 Jan 2022 22:49:44 -0800, Zbigniew Kempczyński wrote:
> >
> > +	offset1 = gem_detect_min_start_offset_for_region(i915, region1);
> > +	offset2 = gem_detect_min_start_offset_for_region(i915, region2);
> > +	alignment = gem_detect_safe_alignment(i915);
> > +	igt_debug("safe alignment: %llx\n", (long long) alignment);
> > +	igt_debug("safe start offset: %llx\n",
> > +		  (long long) gem_detect_safe_start_offset(i915));
> > +	igt_debug("minimum object1 start offset: %llx\n", (long long) offset1);
> > +	igt_debug("minimum object2 start offset: %llx\n", (long long) offset2);
> 
> Maybe also add print for the min_alignment value here?

You want to print minimum alignment for same region?

> 
> > +	igt_describe("Check start offset and alignment detection");
> > +	igt_subtest("safe-start")
> > +		safe_start(fd);
> 
> I think "safe-start" is a really ambiguous name so we should change the
> name to something like "safe-align" or 'safe-offset", no?

Already got that name to safe-alignment on first version of patch but
I got suggestion to change to safe-start. Anyway we exercise start offset
as well as alignment here.

But my preference is also safe-align so there 2:1 voice. 

> 
> Otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the review, I'm going to wait for you comment regarding
min alignment. 

--
Zbigniew
