Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F59C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDB610E26F;
	Wed, 14 May 2025 14:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S49NUdw/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1137410E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747232628; x=1778768628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IBOYqZC85BRoxChMElVv8TWQgVKKnuB0euYxPXMaDfQ=;
 b=S49NUdw/aWf6IEXg7GpjdjglVJd8AmXa9PGZjgkrAnKu79vNHj1oIljM
 IiB+Oa6waSrFDRaFECmKeTI/GArdeyN3sg5d03Z9eqU/ADnW2ndjQLhUK
 fitAmsEHWAe8CRfJlFayA3CfHDYI4NaQO6PNKJ2Uj9p+paBfuXTt3WtoQ
 9YcADpprdN1TsfptUBCLEc/qtA3BVFkyqhswZcutFFpBHEncgB/a0vy+5
 qbn5Qfd5xO7fJa0lHSja7/eoSWmzdZ4vy/1dEkx/jC6psAzrc3C2ms4VK
 sZHed9HA+x6NMqVhzIPcbIBiUJX7rllF+pw/BL7TDJZk7Z6bXddXe9e11 A==;
X-CSE-ConnectionGUID: Ys+e0D26QeCrQkmYhxKzWg==
X-CSE-MsgGUID: GQwssPPnRxawAE4zdx35mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66687222"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="66687222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:23:43 -0700
X-CSE-ConnectionGUID: OxClbOF9T5G2JAHmvenUGA==
X-CSE-MsgGUID: 5RZKLSY0QwmnYUzgeTXepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="169003544"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:23:41 -0700
Date: Wed, 14 May 2025 16:23:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 15/15] lib/igt_device_scan: reuse igt hash
Message-ID: <20250514142338.ie5ikt7vmtskaslh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-16-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507160148.53857-16-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-07 at 16:01:48 +0000, Jeevaka Prabu Badrappan wrote:

please add description here.

> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_device_scan.c | 76 ++++++++++++++++++++++---------------------
>  lib/meson.build       |  1 +
>  2 files changed, 40 insertions(+), 37 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index e23943a10..7d54886dd 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -26,12 +26,12 @@
>  #include "igt_core.h"
>  #include "igt_device_scan.h"
>  #include "igt_list.h"
> +#include "igt_map.h"
>  #include "intel_chipset.h"
>  
>  #include <ctype.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> -#include <glib.h>
>  #include <libudev.h>
>  #ifdef __linux__
>  #include <linux/limits.h>
> @@ -224,8 +224,8 @@ struct igt_device {
>  	/* Point to vendor spec if can be found */
>  
>  	/* Properties / sysattrs rewriten from udev lists */
> -	GHashTable *props_ht;
> -	GHashTable *attrs_ht;
> +	struct igt_map *props_map;
> +	struct igt_map *attrs_map;
>  
>  	/* Most usable variables from udev device */
>  	char *subsystem;
> @@ -464,6 +464,11 @@ static bool is_on_blacklist(const char *what)
>  
>  }
>  
> +static int key_equals(const void *key1, const void *key2)
> +{
> +	return strcmp((char *)key1, (char *)key2) == 0;
> +}
> +
>  static struct igt_device *igt_device_new(void)
>  {
>  	struct igt_device *dev;
> @@ -472,14 +477,14 @@ static struct igt_device *igt_device_new(void)
>  	if (!dev)
>  		return NULL;
>  
> -	dev->attrs_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
> -					      free, free);
> -	dev->props_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
> -					      free, free);
> +	dev->attrs_map = igt_map_create(igt_map_hash_32, key_equals);
> +	dev->props_map = igt_map_create(igt_map_hash_32, key_equals);
>  
> -	if (dev->attrs_ht && dev->props_ht)
> +	if (dev->attrs_map && dev->props_map)
>  		return dev;
>  
> +	igt_map_destroy(dev->attrs_map, NULL);
> +	igt_map_destroy(dev->props_map, NULL);
>  	free(dev);
>  
>  	return NULL;
> @@ -491,7 +496,7 @@ static void igt_device_add_prop(struct igt_device *dev,
>  	if (!key || !value)
>  		return;
>  
> -	g_hash_table_insert(dev->props_ht, strdup(key), strdup(value));
> +	igt_map_insert(dev->props_map, strdup(key), strdup(value));
>  }
>  
>  static void igt_device_add_attr(struct igt_device *dev,
> @@ -525,7 +530,7 @@ static void igt_device_add_attr(struct igt_device *dev,
>  		v++;
>  	}
>  
> -	g_hash_table_insert(dev->attrs_ht, strdup(key), strdup(v));
> +	igt_map_insert(dev->attrs_map, strdup(key), strdup(value));
>  }
>  
>  /* Iterate over udev properties list and rewrite it to igt_device properties
> @@ -585,19 +590,30 @@ static void get_attrs_limited(struct udev_device *dev, struct igt_device *idev)
>  	}
>  }
>  
> -#define get_prop(dev, prop) ((char *) g_hash_table_lookup(dev->props_ht, prop))
> -#define get_attr(dev, attr) ((char *) g_hash_table_lookup(dev->attrs_ht, attr))
> +#define get_prop(dev, prop) ((char *) igt_map_search(dev->props_map, prop))
> +#define get_attr(dev, attr) ((char *) igt_map_search(dev->attrs_map, attr))
>  #define get_prop_subsystem(dev) get_prop(dev, "SUBSYSTEM")
>  #define is_drm_subsystem(dev)  (strequal(get_prop_subsystem(dev), "drm"))
>  #define is_pci_subsystem(dev)  (strequal(get_prop_subsystem(dev), "pci"))
>  
> -static void print_ht(GHashTable *ht);
> +static inline void _print_key_value(const char *k, const char *v)
> +{
> +	printf("%-32s: %s\n", k, v);
> +}
> +
>  static void dump_props_and_attrs(const struct igt_device *dev)
>  {
> +	struct igt_map_entry *entry;
> +
>  	printf("\n[properties]\n");
> -	print_ht(dev->props_ht);
> +	igt_map_foreach(dev->props_map, entry) {
> +		_print_key_value((char *)entry->key, (char *)entry->data);
> +	}
> +
>  	printf("\n[attributes]\n");
> -	print_ht(dev->attrs_ht);
> +	igt_map_foreach(dev->attrs_map, entry) {
> +		_print_key_value((char *)entry->key, (char *)entry->data);
> +	}
>  	printf("\n");
>  }
>  
> @@ -1076,6 +1092,12 @@ static void scan_drm_devices(bool limit_attrs)
>  	}
>  }
>  
> +static void free_key_value(struct igt_map_entry *entry)
> +{
> +	free((char *)entry->key);
> +	free(entry->data);
> +}
> +
>  static void igt_device_free(struct igt_device *dev)
>  {
>  	free(dev->codename);
> @@ -1088,8 +1110,8 @@ static void igt_device_free(struct igt_device *dev)
>  	free(dev->device);
>  	free(dev->driver);
>  	free(dev->pci_slot_name);
> -	g_hash_table_destroy(dev->attrs_ht);
> -	g_hash_table_destroy(dev->props_ht);
> +	igt_map_destroy(dev->attrs_map, free_key_value);
> +	igt_map_destroy(dev->props_map, free_key_value);
>  }
>  
>  void igt_devices_free(void)
> @@ -1323,26 +1345,6 @@ igt_devs_print_user(struct igt_list_head *view,
>  	}
>  }
>  
> -static inline void _print_key_value(const char* k, const char *v)
> -{
> -	printf("%-32s: %s\n", k, v);
> -}
> -
> -static void print_ht(GHashTable *ht)
> -{
> -	GList *keys = g_hash_table_get_keys(ht);
> -
> -	keys = g_list_sort(keys, (GCompareFunc) strcmp);
> -	while (keys) {
> -		char *k = (char *) keys->data;
> -		char *v = g_hash_table_lookup(ht, k);
> -
> -		_print_key_value(k, v);
> -		keys = g_list_next(keys);
> -	}
> -	g_list_free(keys);
> -}
> -
>  static void
>  igt_devs_print_detail(struct igt_list_head *view,
>  		      const struct igt_devices_print_format *fmt)
> diff --git a/lib/meson.build b/lib/meson.build
> index b58976a43..34979b42c 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -307,6 +307,7 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
>  	'igt_tools_stub.c',
>  	'intel_device_info.c',
>  	'intel_cmds_info.c',
> +	'igt_map.c',

Keep it sorted alphabetically,

Regards,
Kamil

>  	],
>  	dependencies : scan_dep,
>  	include_directories : inc)
> -- 
> 2.34.1
> 
