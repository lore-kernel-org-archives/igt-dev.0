Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA477C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 17:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2865A10F86E;
	Fri,  9 Feb 2024 17:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pnh3JR1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55D110F86E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 17:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707500290; x=1739036290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NgpqJ3DLeCV1gnMYpoov11ZXrZN2l3S8OXA/aaYXX/g=;
 b=Pnh3JR1l0UeIsWe7aWyWjEaz9ot+eXeoepYi1AMH3s6pjO4/qgGDuaQv
 T7lo1L1Si0Cup8wcwKw7VBlwQ5iuPJR5kzMs4yWMU9zKaNnV7qoEy+uPy
 x9hiWb9mHqGk1dT5+mPQLbg8YWFQLDsfNBdUb1m0nGvcQ5/N6/p9LwZ6M
 kmnGSYgq8d8XXgZzaaDSROIS8dGKsbDHEA/CGtT2lWYCVR2gfiNsDboyO
 bi/BcLNyMx/92aHjiY5ySuA6AsWY1dfXLrXgTtiMF+9+DkfL2l9NPOmC6
 hLeVXcuZ+fjZLTCNqnw0jnysQb9qVwCY74U0Z53szaE2+WzQNoTVaF12X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="436610060"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="436610060"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 09:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2286776"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 09:38:09 -0800
Date: Fri, 9 Feb 2024 18:38:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v8 3/8] lib/drmtest: allow opening cards out of order
Message-ID: <20240209173805.766rzgin7tn2bjse@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240208135232.54382-1-kamil.konieczny@linux.intel.com>
 <20240208135232.54382-4-kamil.konieczny@linux.intel.com>
 <20240209123820.gfm6ty7e6wha4olm@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209123820.gfm6ty7e6wha4olm@zkempczy-mobl2>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Zbigniew,
On 2024-02-09 at 13:38:20 +0100, Zbigniew Kempczyński wrote:
> On Thu, Feb 08, 2024 at 02:52:27PM +0100, Kamil Konieczny wrote:
> > Current __drm_open_driver_another() implementation prevents
> > opening cards out of order, for example card 3 without previous
> > opens of 0..2. This can be seen with three GPU cards system and
> > gem_open_basic test:
> > 
> > sudo IGT_DEVICE=pci:vendor=Intel,card=all build/tests/gem_basic --r multigpu-create-close
> > 
> > IGT-Version: 1.28-g2548a539e (x86_64) (Linux: 6.7.0-rc5 x86_64)
> > Using IGT_SRANDOM=1706630533 for randomisation
> > Opened device: /dev/dri/card0
> > Starting subtest: multigpu-create-close
> > <g:0> Testing creating and closing an object.
> > <g:1> Opened device: /dev/dri/card1
> > <g:1> Testing creating and closing an object.
> > gem_basic: ../lib/drmtest.c:341: _is_already_opened: Assertion `as_idx <= _opened_fds_count' failed.
> > Received signal SIGABRT.
> > 
> > Relax that condition and add some more debug prints.
> > 
> > Changes in __search_and_open() was suggested by Zbigniew.
> > 
> > v5: removed caching for names of opened cards
> >  relaxed opening of filtered devices
> > v6: fixed assingment in _is_already_open() (Janusz)
> >  simplify use of this function
> > v7: restore check for already opened filtered card (Janusz)
> > v8: limit checks for N-th card to 0...N-1 range (Janusz)
> >  simplify if-else in __search_and_open() (Kamil)
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/drmtest.c | 73 +++++++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 56 insertions(+), 17 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 73d9159af..62d31b000 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -322,35 +322,54 @@ static int _opened_fds_count;
> >  static void _set_opened_fd(int idx, int fd)
> >  {
> >  	assert(idx < ARRAY_SIZE(_opened_fds));
> > -	assert(idx <= _opened_fds_count);
> > +	assert(idx >= 0);
> >  
> >  	_opened_fds[idx].fd = fd;
> >  
> >  	assert(fstat(fd, &_opened_fds[idx].stat) == 0);
> >  
> > -	_opened_fds_count = idx+1;
> > +	for (int n = _opened_fds_count; n < idx; n++)
> > +		_opened_fds[n].fd = -1;
> > +
> > +	if (idx >= _opened_fds_count)
> > +		_opened_fds_count = idx + 1;
> 
> Looks _opened_fds_count is monotonic over test runtime. I mean if you're
> running single test which is multigpu which just exists it doesn't
> matter, but what will happen if you'll run multigpu subtest after which
> you have test with single fd usage? I mean _opened_fd[] has stale data.

It was alwayes stale, there were no attempt to keep it up to date
especially that users could just call close(), not drm_close_driver().

> >  }
> >  
> > -static bool _is_already_opened(const char *path, int as_idx)
> > +/* in *err returns -errno or index to _opened_fds[] */
> > +static bool _is_already_opened(const char *path, int as_idx, int *err)
> >  {
> >  	struct stat new;
> >  
> >  	assert(as_idx < ARRAY_SIZE(_opened_fds));
> > -	assert(as_idx <= _opened_fds_count);
> > +	assert(as_idx >= 0);
> >  
> >  	/*
> >  	 * we cannot even stat the device, so it's of no use - let's claim it's
> >  	 * already opened
> >  	 */
> > -	if (igt_debug_on(stat(path, &new) != 0))
> > +	if (igt_debug_on(stat(path, &new) != 0)) {
> > +		if (err)
> > +			*err = -errno;
> > +
> >  		return true;
> > +	}
> > +
> > +	if (err)
> > +		*err = 0;
> > +
> > +	for (int i = 0, end = min(as_idx, _opened_fds_count); i < end; ++i) {
> > +		if (_opened_fds[i].fd == -1)
> > +			continue;
> >  
> > -	for (int i = 0; i < as_idx; ++i) {
> >  		/* did we cross filesystem boundary? */
> >  		assert(_opened_fds[i].stat.st_dev == new.st_dev);
> >  
> > -		if (_opened_fds[i].stat.st_ino == new.st_ino)
> > +		if (_opened_fds[i].stat.st_ino == new.st_ino) {
> > +			if (err)
> > +				*err = i;
> > +
> >  			return true;
> > +		}
> >  	}
> >  
> >  	return false;
> > @@ -359,23 +378,37 @@ static bool _is_already_opened(const char *path, int as_idx)
> >  static int __search_and_open(const char *base, int offset, unsigned int chipset, int as_idx)
> >  {
> >  	const char *forced;
> > +	int err;
> >  
> >  	forced = forced_driver();
> >  	if (forced)
> >  		igt_debug("Force option used: Using driver %s\n", forced);
> >  
> > -	for (int i = 0; i < 16; i++) {
> > +	for (int i = 0, idx = -1; i < 16 && idx < as_idx; i++) {
> >  		char name[80];
> >  		int fd;
> >  
> >  		sprintf(name, "%s%u", base, i + offset);
> >  
> > -		if (_is_already_opened(name, as_idx))
> > -			continue;
> > +		if (_is_already_opened(name, as_idx, &err)) {
> > +			if (err < 0)
> > +				continue;
> > +
> > +			if (idx + 1 < as_idx) {
> > +				++idx;
> > +				continue;
> > +			}
> > +		}
> >  
> >  		fd = __drm_open_device(name, chipset);
> > -		if (fd != -1)
> > +		if (fd == -1)
> > +			continue;
> > +
> > +		++idx;
> > +		if (idx == as_idx)
> >  			return fd;
> 
> Shouldn't we mark this fd is already opened in _opened_fds[]?

This is left for __drm_open_driver_another() as there are two
paths which openes card, one for filter and other for legacy.
See also my respond to Janusz on v7 patch 3/8.

Regards,
Kamil

> 
> --
> Zbigniew
> 
> > +
> > +		close(fd);
> >  	}
> >  
> >  	return -1;
> > @@ -486,7 +519,7 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
> >   *   * idx-th filter (starting with 0, filters are semicolon separated) is used
> >   *   * if there is no idx-th filter, goto 2
> >   *   * first device maching the filter is selected
> > - *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
> > + *   * if it's already opened (for indexes != idx) we fail with -1
> >   *   * otherwise open the device and return the fd
> >   *
> >   * 2. compatibility mode - open the first DRM device we can find that is not
> > @@ -531,6 +564,7 @@ int __drm_open_driver_another(int idx, int chipset)
> >  	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
> >  		struct igt_device_card card;
> >  		bool found;
> > +		int err;
> >  
> >  		found = __get_card_for_nth_filter(idx, &card);
> >  
> > @@ -539,14 +573,19 @@ int __drm_open_driver_another(int idx, int chipset)
> >  			found = __get_card_for_nth_filter(idx, &card);
> >  		}
> >  
> > -		if (!found || !strlen(card.card))
> > +		if (!found || !strlen(card.card)) {
> >  			igt_warn("No card matches the filter! [%s]\n",
> >  				 igt_device_filter_get(idx));
> > -		else if (_is_already_opened(card.card, idx))
> > -			igt_warn("card maching filter %d is already opened\n", idx);
> > -		else
> > +		} else if (_is_already_opened(card.card, idx, &err)) {
> > +			if (err < 0)
> > +				igt_warn("cannot stat card maching filter %d errno=%d card=%s\n", idx, err, card.card);
> > +			else if (idx != err)
> > +				igt_warn("card maching filter %d is already opened as %d, card=%s\n", idx, err, card.card);
> > +			else
> > +				fd = __open_driver_exact(card.card, chipset);
> > +		} else {
> >  			fd = __open_driver_exact(card.card, chipset);
> > -
> > +		}
> >  	} else {
> >  		/* no filter for device idx, let's open whatever is available */
> >  		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
> > -- 
> > 2.42.0
> > 
