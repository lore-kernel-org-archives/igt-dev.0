Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30BF10E3E6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 12:04:12 +0000 (UTC)
Date: Thu, 5 Oct 2023 14:03:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231005120357.rkhh7hztmxua7bnb@zkempczy-mobl2>
References: <20231004164946.138398-1-kamil.konieczny@linux.intel.com>
 <20231004164946.138398-2-kamil.konieczny@linux.intel.com>
 <20231005114417.ql2uw4ezss2utmqx@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005114417.ql2uw4ezss2utmqx@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v8 1/6] lib/drmtest: allow out of order
 device opening
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

On Thu, Oct 05, 2023 at 01:44:17PM +0200, Zbigniew Kempczyński wrote:

<cut>
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index e1da66c87..43524c5ad 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -296,13 +296,18 @@ static int _opened_fds_count;
> >  static void _set_opened_fd(int idx, int fd)
> >  {
> >  	assert(idx < ARRAY_SIZE(_opened_fds));
> > -	assert(idx <= _opened_fds_count);
> > +
> > +	if (idx >= _opened_fds_count) {
> > +		for (int i = _opened_fds_count; i < idx; ++i)
> > +			_opened_fds[i].fd = -1;
> > +	}
> 
> Do you need if conditional? I mean if idx == _opened_fds_count
> (let's say _opened _fds_count == 5 and idx == 5, so you're hiting
> next element) and for loop just won't run -> i = 5, i < 5.
> 
> >  
> >  	_opened_fds[idx].fd = fd;
> 
> And you're write fd at index 5.
> 
> >  
> >  	assert(fstat(fd, &_opened_fds[idx].stat) == 0);
> >  
> > -	_opened_fds_count = idx+1;
> > +	if (idx >= _opened_fds_count)
> > +		_opened_fds_count = idx + 1;
> >  }
> 
> Anyway, you're allowing to selectively extend currently opened
> fd array keeping -1 on not occupied slots.
> 
> Rest looks good to me.
> 

I've forgotten to write about r-b - after addressing above conditional
nitpick.

> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> --
> Zbigniew

--
Zbigniew
