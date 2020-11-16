Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A244489A72
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 11:09:52 +0000 (UTC)
Date: Mon, 16 Nov 2020 13:09:49 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201116110949.GQ7444@platvala-desk.ger.corp.intel.com>
References: <20201113144718.1292349-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113144718.1292349-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Do not apply filtering to
 DRIVER_VGEM
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 02:47:18PM +0000, Chris Wilson wrote:
> The vgem device is used by several tests in conjunction to their HW
> backend in order to supply external fences. Do not prevent these tests
> from running by filtering out DRIVER_VGEM.
> 
> Suggested-by: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> ---
>  lib/drmtest.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 3a8bd8591..8527b56ec 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -412,9 +412,10 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
>  int __drm_open_driver_another(int idx, int chipset)
>  {
>  	int fd = -1;
> -	if (igt_device_filter_count() > idx) {
> -		bool found;
> +
> +	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
>  		struct igt_device_card card;
> +		bool found;
>  
>  		found = __get_card_for_nth_filter(idx, &card);
>  
> @@ -461,9 +462,9 @@ int __drm_open_driver(int chipset)
>  
>  int __drm_open_driver_render(int chipset)
>  {
> -	if (igt_device_filter_count() > 0) {
> -		bool found;
> +	if (chipset != DRIVER_VGEM && igt_device_filter_count() > 0) {
>  		struct igt_device_card card;
> +		bool found;
>  
>  		found = __get_card_for_nth_filter(0, &card);
>  
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
