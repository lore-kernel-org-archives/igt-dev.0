Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B86110E1B0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Sep 2022 12:49:52 +0000 (UTC)
Date: Tue, 20 Sep 2022 15:49:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Yym2ypbyWfiOxA4J@platvala-desk.ger.corp.intel.com>
References: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
 <20220901114442.55071-13-zbigniew.kempczynski@intel.com>
 <YxF/s58rrzmMJ5mH@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxF/s58rrzmMJ5mH@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t 12/12] i915/gem_mmap_offset: Crudely
 measure read/write to different mmaps
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

On Fri, Sep 02, 2022 at 05:59:47AM +0200, Zbigniew Kempczyński wrote:
> On Thu, Sep 01, 2022 at 01:44:42PM +0200, Zbigniew Kempczyński wrote:
> > From: Chris Wilson <chris.p.wilson@intel.com>
> > 
> > Compare the read/write performance of different mmap types to different
> > memory regions.
> >
> 
> +Petri - please decide can we merge this.
> 
> This tests performance only but execution time < 1s so I got no problem
> with this (it may be handy in the future for debugging purposes).
> 
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Ideally tests that don't test should be in benchmarks/ instead. Having
this immediately in benchmarks looks ideal but surely we could use
some numbers from all platforms, and currently that only happens if
this is in tests/.

For merging this:
Acked-by: Petri Latvala <petri.latvala@intel.com>

In the future this should be moved to benchmarks but CI changes are
needed to actually start running them on the regular. I spoke with
Kamil to get that road planned out.


-- 
Petri Latvala
