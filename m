Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110FEC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 12:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A104810E93E;
	Thu, 30 Jan 2025 12:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsYac8YI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B08510E93E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 12:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738238458; x=1769774458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9ySqgmDDArcuFdcXhyjf+BoxJXx703jIqSQVJnE3TMw=;
 b=NsYac8YIpT7oDsYK0wL8a1jD+jyTQMUVKRg1N8Y82D0VCgzE/bm7RvnJ
 C+GIGrqRqOMy4ygZghcj/+VwdUOmPoroIcJ3lDzTHA7w56xdIddLhm9e+
 BupiQKJ6X0yrnBJuqfT800DoYIpmOQycfLJ/NovZjo3PD+cKJm1xcczvw
 SSrHQ0ud8GKL7e4rKqWIooSRU4kLptMHiJjrzAqA8ATPtoQb/7Zkq8Bqm
 mZjdMVu6zvbCikO9N4nCkcQej+UyWvayHGnOHrH4I085yTtDsTJjLU62r
 /tRgltbtSwnE3WT/K+EstEOlhY8lEPqR6SSIekGHtKuUSOPtMNlMXrrpX g==;
X-CSE-ConnectionGUID: 6iNgGccLR3qNkweVet2sxQ==
X-CSE-MsgGUID: 5vUUWzDoT22lO43bT6IjpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="37979473"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="37979473"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 04:00:58 -0800
X-CSE-ConnectionGUID: PS7rIspNQRmbi14/CkgD2g==
X-CSE-MsgGUID: 9p7f0CeqRautOCPCe2l7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="140200018"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:00:57 -0800
Date: Thu, 30 Jan 2025 13:00:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_device_scan: limit fetched device
 attributes from udev
Message-ID: <20250130120054.whg5k6koxron26c3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250130102741.38454-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250130102741.38454-1-zbigniew.kempczynski@intel.com>
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
On 2025-01-30 at 11:27:41 +0100, Zbigniew Kempczyński wrote:
> Tests don't need all attributes so default device scanning is now
> limited to small list directly used in device filters. To be backward
> compatible tools like lsgpu still may scan whole attribute list what
> keeps this behavior intact.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

+Cc sriov developers, please wait with merge until you hear
opinion from them

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
> v2: refactor code a bit (Kamil)

Now it looks better, change is smaller and easy to read.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  lib/igt_device_scan.c | 50 ++++++++++++++++++++++++++++++++++---------
>  lib/igt_device_scan.h |  1 +
>  tools/lsgpu.c         |  2 +-
>  3 files changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index c36b0efa90..711bedc5c8 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -22,6 +22,7 @@
>   *
>   */
>  
> +#include "drmtest.h"
>  #include "igt_core.h"
>  #include "igt_device_scan.h"
>  #include "igt_list.h"
> @@ -206,6 +207,8 @@ enum dev_type {
>  #define STR_INTEGRATED "integrated"
>  #define STR_DISCRETE "discrete"
>  
> +static const char * const attrs[] = { "driver", "sriov_numvfs", "physfn" };
> +
>  static inline bool strequal(const char *a, const char *b)
>  {
>  	if (a == NULL || b == NULL)
> @@ -548,7 +551,7 @@ static void get_props(struct udev_device *dev, struct igt_device *idev)
>   * Function skips sysattrs from blacklist ht (acquiring some values can take
>   * seconds).
>   */
> -static void get_attrs(struct udev_device *dev, struct igt_device *idev)
> +static void get_attrs_all(struct udev_device *dev, struct igt_device *idev)
>  {
>  	struct udev_list_entry *entry;
>  
> @@ -569,6 +572,19 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
>  	}
>  }
>  
> +static void get_attrs_limited(struct udev_device *dev, struct igt_device *idev)
> +{
> +	const char *value;
> +
> +	for (int i = 0; i < ARRAY_SIZE(attrs); i++) {
> +		value = udev_device_get_sysattr_value(dev, attrs[i]);
> +		if (!value)
> +			continue;
> +		igt_device_add_attr(idev, attrs[i], value);
> +		DBG("attr: %s, val: %s\n", attrs[i], value);
> +	}
> +}
> +
>  #define get_prop(dev, prop) ((char *) g_hash_table_lookup(dev->props_ht, prop))
>  #define get_attr(dev, attr) ((char *) g_hash_table_lookup(dev->attrs_ht, attr))
>  #define get_prop_subsystem(dev) get_prop(dev, "SUBSYSTEM")
> @@ -639,7 +655,8 @@ static char* strdup_nullsafe(const char* str)
>   * Fills structure with most usable udev device variables, properties
>   * and sysattrs.
>   */
> -static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
> +static struct igt_device *igt_device_new_from_udev(struct udev_device *dev,
> +						   bool limit_attrs)
>  {
>  	struct igt_device *idev = igt_device_new();
>  
> @@ -654,7 +671,8 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
>  		idev->drm_render = strdup(idev->devnode);
>  
>  	get_props(dev, idev);
> -	get_attrs(dev, idev);
> +	limit_attrs ? get_attrs_limited(dev, idev) :
> +		      get_attrs_all(dev, idev);
>  
>  	if (is_pci_subsystem(idev)) {
>  		uint16_t vendor, device;
> @@ -868,7 +886,8 @@ static struct igt_device *igt_device_from_syspath(const char *syspath)
>   */
>  static void update_or_add_parent(struct udev *udev,
>  				 struct udev_device *dev,
> -				 struct igt_device *idev)
> +				 struct igt_device *idev,
> +				 bool limit_attrs)
>  {
>  	struct udev_device *parent_dev;
>  	struct igt_device *parent_idev;
> @@ -899,7 +918,7 @@ static void update_or_add_parent(struct udev *udev,
>  		 * return fresh udev device.
>  		 */
>  		parent_dev = udev_device_new_from_syspath(udev, syspath);
> -		parent_idev = igt_device_new_from_udev(parent_dev);
> +		parent_idev = igt_device_new_from_udev(parent_dev, limit_attrs);
>  		udev_device_unref(parent_dev);
>  
>  		if (parent_idev)
> @@ -1000,7 +1019,7 @@ static void index_pci_devices(void)
>   * Function sorts all found devices to keep same order of bus devices
>   * for providing predictable search.
>   */
> -static void scan_drm_devices(void)
> +static void scan_drm_devices(bool limit_attrs)
>  {
>  	struct udev *udev;
>  	struct udev_enumerate *enumerate;
> @@ -1035,9 +1054,9 @@ static void scan_drm_devices(void)
>  
>  		path = udev_list_entry_get_name(dev_list_entry);
>  		udev_dev = udev_device_new_from_syspath(udev, path);
> -		idev = igt_device_new_from_udev(udev_dev);
> +		idev = igt_device_new_from_udev(udev_dev, limit_attrs);
>  		igt_list_add_tail(&idev->link, &igt_devs.all);
> -		update_or_add_parent(udev, udev_dev, idev);
> +		update_or_add_parent(udev, udev_dev, idev, limit_attrs);
>  
>  		udev_device_unref(udev_dev);
>  	}
> @@ -1092,17 +1111,28 @@ void igt_devices_free(void)
>   *
>   * Function scans udev in search of gpu devices.
>   */
> -void igt_devices_scan(void)
> +
> +static void __igt_devices_scan(bool limit_attrs)
>  {
>  	if (igt_devs.devs_scanned)
>  		igt_devices_free();
>  
>  	prepare_scan();
> -	scan_drm_devices();
> +	scan_drm_devices(limit_attrs);
>  
>  	igt_devs.devs_scanned = true;
>  }
>  
> +void igt_devices_scan(void)
> +{
> +	__igt_devices_scan(true);
> +}
> +
> +void igt_devices_scan_all_attrs(void)
> +{
> +	__igt_devices_scan(false);
> +}
> +
>  static inline void _pr_simple(const char *k, const char *v)
>  {
>  	printf("    %-16s: %s\n", k, v);
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index fa90134aa3..92741fe3c7 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -64,6 +64,7 @@ struct igt_device_card {
>  };
>  
>  void igt_devices_scan(void);
> +void igt_devices_scan_all_attrs(void);
>  
>  void igt_devices_print(const struct igt_devices_print_format *fmt);
>  void igt_devices_print_vendors(void);
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index e482ca6b75..e683900833 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -362,7 +362,7 @@ int main(int argc, char *argv[])
>  		printf("Notice: Using filter from .igtrc\n");
>  	}
>  
> -	igt_devices_scan();
> +	igt_devices_scan_all_attrs();
>  
>  	if (igt_device != NULL) {
>  		struct igt_device_card card;
> -- 
> 2.34.1
> 
