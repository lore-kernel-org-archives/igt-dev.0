Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B276E441
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 18:06:11 +0000 (UTC)
Date: Tue, 5 Oct 2021 20:05:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211005180544.GA26350@zkempczy-mobl2>
References: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
 <20211004054056.24346-3-zbigniew.kempczynski@intel.com>
 <87bl44z8av.wl-ashutosh.dixit@intel.com>
 <20211005065218.GA3744@zkempczy-mobl2>
 <874k9vnyvh.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874k9vnyvh.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/intel_bufops: Store gem bo size
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

On Tue, Oct 05, 2021 at 10:51:46AM -0700, Dixit, Ashutosh wrote:

<cut>

> > >
> > > So this is not a new issue, maybe it's ok, but I just wanted to check with
> > > you if you think all these scenarios work out ok even after introducing
> > > separate buf->size and buf->bo_size. Thanks.
> >
> > Thank you're carefully looking at the code. Please go over it one more time
> > and verify what I've written. Maybe I just don't see something obvious...
> 
> Sorry of course you are right, I completely missed size is being set as you
> indicate above. So this is also:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the review, series pushed.

--
Zbigniew
