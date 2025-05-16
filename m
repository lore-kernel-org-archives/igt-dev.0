Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA070C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 05:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9E510E109;
	Fri, 16 May 2025 05:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zfo87TX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560AB10E109
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 05:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747372038; x=1778908038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cm47wdT+gFy4/LEbXd8L9SfWX1URq4FULwrLOLGsL0c=;
 b=Zfo87TX/VszJmqdR8yyGb3TgOWJDVA0lc9j9ExYWaH8vCD2QZHOErEnp
 iIvBa/8FgYgrs/+EehIyQ6/I7a5hq7wGKM2UPCXsFlodsGY9fpfBjInbZ
 hnERwhZBRCgbLYN02ONt7Un85Lb7N9TWE7LEnl8+kJAuVPbmNXtLd5OEo
 6MaoLN0DCIeSobkCR1R3EQp+Wd5mIhvTeSHEPNy0/wTmDDWgPK0Q59aqo
 wc3SDG4fKPX05jh520v/Au7IRZyMRh22VvcFO/QrIjds1eUulB20YuQpN
 AK1AjSph2ThEj5YtJYTw3EHDNJHgD8iVxcSSrrDN7ApTes95GMDkpGrNc A==;
X-CSE-ConnectionGUID: sLO/iSQsTd2V8OqUuASs9Q==
X-CSE-MsgGUID: J0cVKy1KQmKcT1SszJllXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60724271"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60724271"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:07:18 -0700
X-CSE-ConnectionGUID: qUGnP7tcS2KamOK4iVDuxQ==
X-CSE-MsgGUID: 7x0jwFD/QomJD15kGoZ41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143350206"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.80])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:07:15 -0700
Date: Fri, 16 May 2025 07:07:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "markyacoub@google.com" <markyacoub@google.com>,
 "seanpaul@google.com" <seanpaul@google.com>, 
 "Santa, Carlos" <carlos.santa@intel.com>, "Singh,
 Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH v4 15/15] lib/igt_device_scan: reuse igt hash
Message-ID: <ikpkzdh2fcxuxdpdmyqbj74wa4ixyug3nkjsabt4b2u6bfwxzt@lroprjiumfkv>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-16-jeevaka.badrappan@intel.com>
 <grv3t2jfem5voffjcwst5osi2dlpxsr2wxyeuhm33c4w4tw3wo@rhrj75opoukb>
 <IA0PR11MB7353F8B754EFBB51A2DA3592ED90A@IA0PR11MB7353.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7353F8B754EFBB51A2DA3592ED90A@IA0PR11MB7353.namprd11.prod.outlook.com>
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

On Thu, May 15, 2025 at 08:23:33PM +0200, Badrappan, Jeevaka wrote:
>    >  #include <libudev.h>
>    >  #ifdef __linux__
>    >  #include <linux/limits.h>
>    > @@ -224,8 +224,8 @@ struct igt_device {
>    >        /* Point to vendor spec if can be found */
>    > 
>    >        /* Properties / sysattrs rewriten from udev lists */
>    > -     GHashTable *props_ht;
>    > -     GHashTable *attrs_ht;
>    > +     struct igt_map *props_map;
>    > +     struct igt_map *attrs_map;
>    > 
>    >        /* Most usable variables from udev device */
>    >        char *subsystem;
>    > @@ -464,6 +464,11 @@ static bool is_on_blacklist(const char *what)
>    > 
>    >  }
>    > 
>    > +static int key_equals(const void *key1, const void *key2)
>    > +{
>    > +     return strcmp((char *)key1, (char *)key2) == 0;
>    > +}
>    > +
>    >  static struct igt_device *igt_device_new(void)
>    >  {
>    >        struct igt_device *dev;
>    > @@ -472,14 +477,14 @@ static struct igt_device *igt_device_new(void)
>    >        if (!dev)
>    >                return NULL;
>    > 
>    > -     dev->attrs_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
>    > -                                           free, free);
>    > -     dev->props_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
>    > -                                           free, free);
>    > +     dev->attrs_map = igt_map_create(igt_map_hash_32, key_equals);
>    > +     dev->props_map = igt_map_create(igt_map_hash_32, key_equals);
>    > 
>    > -     if (dev->attrs_ht && dev->props_ht)
>    > +     if (dev->attrs_map && dev->props_map)
>    >                return dev;
>    > 
>    > +     igt_map_destroy(dev->attrs_map, NULL);
>    > +     igt_map_destroy(dev->props_map, NULL);
> 
>    > What for are you freeing the map here?
>    map and also device is freed if creation of attrs_map  or props_map fails.

Ok, now I get your point. Makes sense.

--
Zbigniew

>    Thanks and Regards,
>    Jeevaka
