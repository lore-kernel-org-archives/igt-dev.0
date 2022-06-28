Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A874411BE39
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 08:11:32 +0000 (UTC)
Date: Tue, 28 Jun 2022 10:11:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yrq3sCcMl9vPcc62@kamilkon-desk1>
References: <20220627201223.8570-1-zbigniew.kempczynski@intel.com>
 <20220627201223.8570-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220627201223.8570-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_device_scan: Add sriov
 selector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zbigniew,

On 2022-06-27 at 22:12:23 +0200, Zbigniew Kempczyński wrote:
> From: Łukasz Łaguna <lukasz.laguna@intel.com>
> 
> Add sriov selector to allow pf/vf selection.
> 
> Signed-off-by: Łukasz Łaguna <lukasz.laguna@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/igt_device_scan.c | 148 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index a1cee7a42a..67ddf56eb2 100644
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
> @@ -1315,6 +1348,115 @@ static struct igt_list_head *filter_pci(const struct filter_class *fcls,
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
> +/* Find appropriate pci device matching vendor/device/card/pf/vf filter arguments.
---- ^
I would prefer

/*
 * Find ...
 */

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

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
> @@ -1350,6 +1492,12 @@ static struct filter_class filter_definition_list[] = {
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
> 2.34.1
> 
