Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4F110E1ED
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 11:44:21 +0000 (UTC)
Date: Thu, 5 Oct 2023 13:44:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231005114417.ql2uw4ezss2utmqx@zkempczy-mobl2>
References: <20231004164946.138398-1-kamil.konieczny@linux.intel.com>
 <20231004164946.138398-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004164946.138398-2-kamil.konieczny@linux.intel.com>
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

On Wed, Oct 04, 2023 at 06:49:37PM +0200, Kamil Konieczny wrote:
> Allow to open cards with filters out of order, not in
> the sequence 0...N. This will fix problem found out with test
> gem_exec_gttfill@multigpu-basic with three discrete GPUs:
> 
> Opened device: /dev/dri/card1
> Starting subtest: multigpu-basic
> <g:1> Opened device: /dev/dri/card2
> gem_exec_gttfill: ../lib/drmtest.c:313: _is_already_opened: Assertion `as_idx <= _opened_fds_count' failed.
> 
> Added also some debug prints for diagnosing problems with
> multi-GPU tests.
> 
> v2: fix setting opened count in _set_opened_fd()
> v3: search all already opened fds in _is_already_opened()
> v4: revert change in v3, this will cause treating zero as
>     special index (no checks) as some test depend on it
> v5: start searching for driver from requested index,
>     limit checks for already opened drivers to currently
>     opened count (Kamil)
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index e1da66c87..43524c5ad 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -296,13 +296,18 @@ static int _opened_fds_count;
>  static void _set_opened_fd(int idx, int fd)
>  {
>  	assert(idx < ARRAY_SIZE(_opened_fds));
> -	assert(idx <= _opened_fds_count);
> +
> +	if (idx >= _opened_fds_count) {
> +		for (int i = _opened_fds_count; i < idx; ++i)
> +			_opened_fds[i].fd = -1;
> +	}

Do you need if conditional? I mean if idx == _opened_fds_count
(let's say _opened _fds_count == 5 and idx == 5, so you're hiting
next element) and for loop just won't run -> i = 5, i < 5.

>  
>  	_opened_fds[idx].fd = fd;

And you're write fd at index 5.

>  
>  	assert(fstat(fd, &_opened_fds[idx].stat) == 0);
>  
> -	_opened_fds_count = idx+1;
> +	if (idx >= _opened_fds_count)
> +		_opened_fds_count = idx + 1;
>  }

Anyway, you're allowing to selectively extend currently opened
fd array keeping -1 on not occupied slots.

Rest looks good to me.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

>  
>  static bool _is_already_opened(const char *path, int as_idx)
> @@ -310,16 +315,23 @@ static bool _is_already_opened(const char *path, int as_idx)
>  	struct stat new;
>  
>  	assert(as_idx < ARRAY_SIZE(_opened_fds));
> -	assert(as_idx <= _opened_fds_count);
>  
>  	/*
>  	 * we cannot even stat the device, so it's of no use - let's claim it's
>  	 * already opened
>  	 */
> -	if (igt_debug_on(stat(path, &new) != 0))
> +	if (igt_debug_on(stat(path, &new) != 0)) {
> +		igt_debug("cannot stat device: %s\n", path);
>  		return true;
> +	}
> +
> +	if (as_idx > _opened_fds_count)
> +		as_idx = _opened_fds_count;

Checking up to _opened_fds_count makes sense for me.

>  
>  	for (int i = 0; i < as_idx; ++i) {
> +		if (_opened_fds[i].fd == -1)
> +			continue;
> +
>  		/* did we cross filesystem boundary? */
>  		assert(_opened_fds[i].stat.st_dev == new.st_dev);
>  
> @@ -338,6 +350,7 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
>  	if (forced)
>  		igt_debug("Force option used: Using driver %s\n", forced);
>  
> +	offset += as_idx;
>  	for (int i = 0; i < 16; i++) {
>  		char name[80];
>  		int fd;
> @@ -484,6 +497,7 @@ int __drm_open_driver_another(int idx, int chipset)
>  {
>  	int fd = -1;
>  
> +	igt_debug("card idx: %d chipset: %d\n", idx, chipset);
>  	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
>  		struct igt_device_card card;
>  		bool found;
> @@ -491,6 +505,7 @@ int __drm_open_driver_another(int idx, int chipset)
>  		found = __get_card_for_nth_filter(idx, &card);
>  
>  		if (!found) {
> +			igt_debug("cannot find card idx: %d, loading module\n", idx);
>  			drm_load_module(chipset);
>  			found = __get_card_for_nth_filter(idx, &card);
>  		}
> @@ -500,11 +515,14 @@ int __drm_open_driver_another(int idx, int chipset)
>  				 igt_device_filter_get(idx));
>  		else if (_is_already_opened(card.card, idx))
>  			igt_warn("card maching filter %d is already opened\n", idx);
> -		else
> +		else {
> +			igt_debug("card idx: %d found: %s\n", idx, card.card);
>  			fd = __open_driver_exact(card.card, chipset);
> +		}
>  
>  	} else {
>  		/* no filter for device idx, let's open whatever is available */
> +		igt_debug("No filter for device idx: %d\n", idx);
>  		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
>  	}
>  
> -- 
> 2.42.0
> 
