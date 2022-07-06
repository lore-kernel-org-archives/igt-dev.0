Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4AB10F8A3
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jul 2022 07:09:51 +0000 (UTC)
Date: Wed, 6 Jul 2022 09:09:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: =?utf-8?B?xYF1a2FzeiDFgWFndW5h?= <lukasz.laguna@intel.com>
Message-ID: <YsU1MSqI5v0Gi+ZW@zkempczy-mobl2>
References: <20220705150542.21155-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220705150542.21155-1-lukasz.laguna@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_device_scan: Add sriov selector
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

On Tue, Jul 05, 2022 at 05:05:42PM +0200, Łukasz Łaguna wrote:
> Add sriov selector to allow pf/vf selection.
> 
> Signed-off-by: Łukasz Łaguna <lukasz.laguna@intel.com>

Thanks for sending this. Will make my work easier during adding grouping
to device selection (pci + now sriov filters).


Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_device_scan.c | 149 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index a1cee7a4..356064d0 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -128,6 +128,35 @@
>   *   return you same device regardless the order of enumeration.
>   *
>   *   Simple syntactic sugar over using the sysfs paths.
> + *
> + * - sriov: select pf or vf
> + *   |[<!-- language="plain" -->
> + *   sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]
> + *   ]|
> + *
> + *   Filter extends pci selector to allow pf/vf selection:
> + *
> + *   |[<!-- language="plain" -->
> + *   sriov:vendor=Intel,device=1234,card=0,vf=2
> + *   ]|
> + *
> + *   When vf is not defined, pf will be selected:
> + *
> + *   |[<!-- language="plain" -->
> + *   sriov:vendor=Intel,device=1234,card=0
> + *   ]|
> + *
> + *   In case a device has more than one pf, you can also select a specific pf
> + *   or a vf associated with a specific pf:
> + *
> + *   |[<!-- language="plain" -->
> + *   sriov:vendor=Intel,device=1234,card=0,pf=1
> + *   ]|
> + *
> + *   |[<!-- language="plain" -->
> + *   sriov:vendor=Intel,device=1234,card=0,pf=1,vf=0
> + *   ]|
> + *
>   */
>  
>  #ifdef DEBUG_DEVICE_SCAN
> @@ -1152,6 +1181,8 @@ struct filter {
>  		char *slot;
>  		char *drm;
>  		char *driver;
> +		char *pf;
> +		char *vf;
>  	} data;
>  };
>  
> @@ -1169,6 +1200,8 @@ static void fill_filter_data(struct filter *filter, const char *key, const char
>  	__fill_key(slot);
>  	__fill_key(drm);
>  	__fill_key(driver);
> +	__fill_key(pf);
> +	__fill_key(vf);
>  #undef __fill_key
>  
>  }
> @@ -1315,6 +1348,116 @@ static struct igt_list_head *filter_pci(const struct filter_class *fcls,
>  	return &igt_devs.filtered;
>  }
>  
> +static bool is_pf(struct igt_device *dev)
> +{
> +	if (get_attr(dev, "sriov_numvfs") == NULL)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool is_vf(struct igt_device *dev)
> +{
> +	if (get_attr(dev, "physfn") == NULL)
> +		return false;
> +
> +	return true;
> +}
> +
> +/*
> + * Find appropriate pci device matching vendor/device/card/pf/vf filter arguments.
> + */
> +static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
> +					const struct filter *filter)
> +{
> +	struct igt_device *dev, *dup;
> +	int card = -1, pf = -1, vf = -1;
> +	char *pf_pci_slot_name = NULL;
> +	(void) fcls;
> +
> +	DBG("filter sriov\n");
> +
> +	if (filter->data.card) {
> +		sscanf(filter->data.card, "%d", &card);
> +		if (card < 0) {
> +			return &igt_devs.filtered;
> +		}
> +	} else {
> +		card = 0;
> +	}
> +
> +	if (filter->data.pf) {
> +		sscanf(filter->data.pf, "%d", &pf);
> +		if (pf < 0) {
> +			return &igt_devs.filtered;
> +		}
> +	} else {
> +		pf = 0;
> +	}
> +
> +	if (filter->data.vf) {
> +		sscanf(filter->data.vf, "%d", &vf);
> +		if (vf < 0) {
> +			return &igt_devs.filtered;
> +		}
> +	}
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		if (!is_pci_subsystem(dev))
> +			continue;
> +
> +		/* Skip if 'vendor' doesn't match (hex or name) */
> +		if (filter->data.vendor && !is_vendor_matched(dev, filter->data.vendor))
> +			continue;
> +
> +		/* Skip if 'device' doesn't match */
> +		if (filter->data.device && strcasecmp(filter->data.device, dev->device))
> +			continue;
> +
> +		/* We get n-th card */
> +		if (!card) {
> +			if (!pf) {
> +				if (is_pf(dev))
> +					pf_pci_slot_name = dev->pci_slot_name;
> +
> +				/* vf parameter was not passed, get pf */
> +				if (vf < 0) {
> +					if (!is_pf(dev))
> +						continue;
> +
> +					dup = duplicate_device(dev);
> +					igt_list_add_tail(&dup->link, &igt_devs.filtered);
> +					break;
> +				} else {
> +					/* Skip if vf is not associated with defined pf */
> +					if (!strequal(get_attr(dev, "physfn"), pf_pci_slot_name))
> +						continue;
> +
> +					if (!vf) {
> +						if (!is_vf(dev))
> +							continue;
> +
> +						dup = duplicate_device(dev);
> +						igt_list_add_tail(&dup->link, &igt_devs.filtered);
> +						break;
> +					}
> +					if (is_vf(dev)) {
> +						vf--;
> +						continue;
> +					}
> +				}
> +			}
> +			if (is_pf(dev)) {
> +				pf--;
> +				continue;
> +			}
> +		}
> +		card--;
> +	}
> +
> +	return &igt_devs.filtered;
> +}
> +
>  static bool sys_path_valid(const struct filter_class *fcls,
>  			   const struct filter *filter)
>  {
> @@ -1350,6 +1493,12 @@ static struct filter_class filter_definition_list[] = {
>  		.help = "pci:[vendor=%04x/name][,device=%04x][,card=%d] | [slot=%04x:%02x:%02x.%x]",
>  		.detail = "vendor is hex number or vendor name\n",
>  	},
> +	{
> +		.name = "sriov",
> +		.filter_function = filter_sriov,
> +		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
> +		.detail = "find pf or vf\n",
> +	},
>  	{
>  		.name = NULL,
>  	},
> -- 
> 2.31.1
> 
