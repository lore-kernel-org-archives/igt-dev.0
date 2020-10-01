Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CBC6E84B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2020 05:43:27 +0000 (UTC)
Date: Thu, 1 Oct 2020 07:43:20 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201001054320.GB2761@zkempczy-mobl2>
References: <20200930194756.13054-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930194756.13054-1-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_device_scan: init card in
 igt_device_find_first_i915_discrete_card()
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, Chris Siebenmann <cks-rhbugzilla@cs.toronto.edu>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 03:47:56PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Because we never initialize the card pointer passed to
> igt_device_find_first_i915_discrete_card() if we don't match any cards, we make
> the mistake of checking the contents of card in main() in intel_gpu_top.c before
> they've actually been initialized, which can lead to a segfault in some
> scenarios:
> 
>    # intel_gpu_top
>    intel_gpu_top: ../tools/intel_gpu_top.c:1297: tr_pmu_name: Assertion `ret == (bufsize-1)' failed.
>    abort--core dumped
> 
> So, fix it by making sure to initialize card in
> igt_device_find_first_i915_discrete_card() like we do in
> igt_device_card_match().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reported-by: Chris Siebenmann <cks-rhbugzilla@cs.toronto.edu>
> Fedora bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1884016
> ---
>  lib/igt_device_scan.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 345bae76..d77311a4 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -453,6 +453,8 @@ void igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>  {
>  	struct igt_device *dev;
>  
> +	memset(card, 0, sizeof(*card));
> +
>  	igt_list_for_each_entry(dev, &igt_devs.all, link) {
>  
>  		if (!is_pci_subsystem(dev))
> -- 

Maybe this function should return boolean does card was found or not?
This will require change in intel_gpu_top and check return value
but is more intuitive and appropriate message can be show that card
is not found.

--
Zbigniew


> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
