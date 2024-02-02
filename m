Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304EDC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 15:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE7210E7ED;
	Fri,  2 Feb 2024 15:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKJQOsRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0110E7ED
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706887971; x=1738423971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kZ+DrkDWk3XOrdVLngQaVkFHhotKXPZi2dIW9OeQhLc=;
 b=bKJQOsRcUY2pE4QMylx39Wl1YqGDowV0KRGru6p85gzTWllUAMZ9NAv+
 8BxDWL+ddJUzBSpEKfG9gwGpmXmmxyRb3flGBSTW8AKKss6UEjOwdx6ms
 fBUMnjTfpAXsxs6ItaVaBi4s1wYoBcxkfM1f0DtH9I0Z8Il4qTJMeczkY
 JS8FH0F4U9oUViBa9FmjooiQr86PgE2xTgw81FND/xFSsPrl8KEldRK6q
 /d3Ku1Nj7sqjCYSlN9gtYffdc6MwQuvKdUTXFogxIueivcOEqgqawvCMc
 rQ0J0og1wsP8HFws0udD+nZ6b/3gUQvbz4QgtL80G2I3gsb3in70UuEzo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17593850"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17593850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:32:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="109856"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 07:32:50 -0800
Date: Fri, 2 Feb 2024 16:32:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v6 3/8] lib/drmtest: allow opening cards out of order
Message-ID: <20240202153232.ajdwvrylsbuk5jtk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240201155047.48608-1-kamil.konieczny@linux.intel.com>
 <20240201155047.48608-4-kamil.konieczny@linux.intel.com>
 <3205042.NnENhoQgcM@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3205042.NnENhoQgcM@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi,

On 2024-02-02 at 12:38:21 +0100, Janusz Krzysztofik wrote:
> On Thursday, 1 February 2024 16:50:42 CET Kamil Konieczny wrote:
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
> > Relax that condition. Also relax condition for filtered devices and
> 
> Can we have those two parts split into two patches, please?  If not then could 
> you please explain why (how they depend on each other)?

I will remove this and you can see how it looks with old
conditions checked, e.g. when n-th card should be different
from m-th card, for n != m. I can reintroduce that second
behaviour later.

Regards,
Kamil

> 
> Thanks,
> Janusz
> 
> 
> > allow them to open already opened ones, basically it will allow
> > running multi-GPU scenarios on single-GPU system with filter:
> > 
> > IGT_DEVICE=pci:vendor=Intel,card=0\;pci:vendor=Intel,card=0
> > 
> > Changes in __search_and_open() was suggested by Zbigniew.
> > 
> > v5:
> >  removed caching for names of opened cards
> >  relaxed opening of filtered devices
> > v6:
> >  fixed assingment in _is_already_open() (Janusz)
> >  simplify use of this function
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/drmtest.c | 66 ++++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 49 insertions(+), 17 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 73d9159af..5bb084508 100644
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
> > +	for (int i = 0, end = min(_opened_fds_count, as_idx); i < end; ++i) {
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
> > @@ -359,23 +378,38 @@ static bool _is_already_opened(const char *path, int as_idx)
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
> > +		if (fd != -1) {
> > +			++idx;
> > +			if (idx < as_idx) {
> > +				close(fd);
> > +				continue;
> > +			}
> > +
> >  			return fd;
> > +		}
> >  	}
> >  
> >  	return -1;
> > @@ -486,8 +520,7 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
> >   *   * idx-th filter (starting with 0, filters are semicolon separated) is used
> >   *   * if there is no idx-th filter, goto 2
> >   *   * first device maching the filter is selected
> > - *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
> > - *   * otherwise open the device and return the fd
> > + *   * open the device and return the fd
> >   *
> >   * 2. compatibility mode - open the first DRM device we can find that is not
> >   *    already opened for indexes 0..idx-1, searching up to 16 device nodes
> > @@ -542,11 +575,10 @@ int __drm_open_driver_another(int idx, int chipset)
> >  		if (!found || !strlen(card.card))
> >  			igt_warn("No card matches the filter! [%s]\n",
> >  				 igt_device_filter_get(idx));
> > -		else if (_is_already_opened(card.card, idx))
> > -			igt_warn("card maching filter %d is already opened\n", idx);
> > -		else
> > +		else {
> > +			_is_already_opened(card.card, idx, NULL); /* check only filesystem boundary */
> >  			fd = __open_driver_exact(card.card, chipset);
> > -
> > +		}
> >  	} else {
> >  		/* no filter for device idx, let's open whatever is available */
> >  		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
> > 
> 
> 
> 
> 
