Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6762A606A32A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X7WYjoUw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106B510E0C7;
	Wed, 21 Oct 2026 17:53:53 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCCE10E0C7
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792605180; x=1824141180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gjBAayqbtKak/CkgvZ0bBnBPJwKJ1OHpNw+bsbo1FFY=;
 b=X7WYjoUwIJJvPO27Z8GsP41EAjYltY/5hMC1t5N8V9igVVywS0rF+Mm8
 XSsWt1NtHCetVleTlxUbSRl58Xap9jhvIOUGtFXNN6lEqRU4FgxndPLZf
 cZbkulH0+N548b6HiPhnLJfI+3aqmdwX0hzTuyBaIh1HVJutS3rwLQMJU
 17sI6kYqP6JdtzA8D0bMhD0sPpEqemHnkim8g/5vAHZbY3Sw/Iup06Cy/
 bSLa7cSmKlDEIqD8lLtQXGwjP6JN3SwXokir1Beox+gPuwjzaWemntXih
 h2PqKZOrZ3kJWk0EbjQdZO1HvVUWE5Un5oKDmDqmSw/l6oHAceGh1l+la g==;
X-CSE-ConnectionGUID: +hmhB5fES2u3AvjVL2yUiw==
X-CSE-MsgGUID: jizI48UYQVi7aSxrG8b5sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1318940"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1318940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:52:47 -0700
X-CSE-ConnectionGUID: ioKJ0CaqRlqvCzvEI3fuwA==
X-CSE-MsgGUID: RCD6pLe5SnGFPXKcGk6ZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3210690"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:52:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:52:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 10:52:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:52:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQFq+ygUOOvVCH5InUoP07v14J0rEpEHvv5iPv03b5xMPE44Cot0ZX4X2OQT1r2Kbj0U/gVD1D17lWwy+z8njs1IJXr+lPJwKPrjYPdUAq4bkutDu3t3WJa1zjJcSYajXmvjrzo5gpKD3q3dCva93snhmq43GHDb+jN8Ox7v6UsHh/Ixj/o7S8W6RBv6tv2EQ4/oX141pVQG13pJ4paEEh3H+XCWDRzwi/sef0CJ1Uh15/Q79ZzrNwqldQ9M+Jk7RlKf4LRYuIMrxdstjTQbU4bYoT8QRFgq2vxM5ldlW3pwIE18Eef+hfaqaD62KHAyMTPgtD9JLe1E5JwUAINBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evnqMVfr4fwBt11dezotXn14JxpTL4ruQkW9GAgKx4M=;
 b=M+Yv0hPS5lvAG7uTQho6sN40TMsP+Op0Zuocssje15vdK42Kb3LwdT/G3NXj/OvAxc+fVAfkJAWbtO1y2cUe8c9hIWLNFaH9gezjBPFkL07MimgPNBFHvqt+T5iv46mXwOjwargYG0lnzUaqOINQY7aVB5gKukqqgfDh1SxvEdEIxg5mdYxbaA6W0nJzif9gMZPEtjI+k93eGw/JtjnmqCzXVq7C6/YjrHU9WdvLKEL60pe2zfqq1AFEQEICbpc/YYMBEddwBKM9faBWYXGi0KFb99NN2PHau7dUtjmyYKyLQGQVeNxEOo7WYMeh+gl1zIxyC3GsP5bKl1ncEqjazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 17:52:43 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 17:52:43 +0000
Date: Wed, 21 Oct 2026 10:52:39 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2 03/11] lib/xe: Gather workarounds debugfs dumps
 in a cache struct
Message-ID: <20261021175239.GA198340@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-3-528b575299d2@intel.com>
 <20261020212422.GB180749@msatwood-mobl> <87qzhkgf77.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87qzhkgf77.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb0818a-1b26-4e8c-eb2b-08df2f9c1b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|261021123027099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 6Jtni1JiGq7sa2FvsxhRimM/FDHLnGwL8LVapkP3zeYONqLKUCTzG+qz5nZ+HvP92ZIUl5ryJqPRp0ILk/KB3F31krdB6wXtRg7ptROO9LBJbgiP4kxuCJl9xrsOK/H/tmur+fea/XauKkgLqRCQvsrK54guvJLYJPfNp+SZ5yfm17NyN2nsQgrf++f2fhKMrmlVDg3NuBDKI7c4AJBuMX9wHAzTgd6pdaWVQIzDk8roBy+vGD955nW79APqh7N7BYto+lV7KzmDfYPJuS0NgeuFpp00GYs5AjztQuUvi1MM7nKaRwdReFFGTXcbft6jrGo6gWYwjpwdr3OY12n4GP8KEQliVEbULaiBEatSJE40kea453XGdFIOkdAAb4ErVDTHLUlcd6Cwc7jJQ7ze4AYbIILQZQJHAdJwddkQnPbaUgO7WCpxyZUdD+YN0rMPttYPXMdYSAf/Tg5NNz8yzQ4x6RFjPLsTrNOZz8kolkJBaUqO8svFgvfFgZAWLgw4IGhrY3W/kUYC61otsmrEDoy5jrocjVwlEeVMVr+R3qCY5PK04ha2HA+fXThByaEAFjRCsx8QpBmJ57hKVWqpBAtBBCBUCxg0i+B06G6Ht0FbsH69lvfnEzOtrqOWsRvTBNwFP3nuu7ZDlrZW6oCBPEgKZAKyNskrpvNKb+Wxj+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OKtHKPcvedHFzS/PpWx8ykXET2OkJuZG2/7Q0jb/6dT5H/tf9spQonWKTrPV?=
 =?us-ascii?Q?qps4kMo7+2Fu2UmlxYXQOSFZk5iyWBG7hpPitFNM4OUHg597spJEvdKclKJS?=
 =?us-ascii?Q?dsHPm7gVXGfa7IzmrxRYaDU3W6I/G6hzdvsbPqmX5FX0qofG0NPhJRQa3ot7?=
 =?us-ascii?Q?7BKG9+9dSLzrKnANaxlywivnUai9aw3OtLNK485AjuZh7L1Rhz6zu5SJO4Nn?=
 =?us-ascii?Q?CeO35G79a1tNc/i4ZJdbEhbh4zYDtKELFoeiPFmsRjBFzsU80DGOQ4qi/s51?=
 =?us-ascii?Q?n5Px5+4FhmqlR/zzJdQB6FAJOxzE7A2boplWFGZrtd+KU5UgM7dZRY9Dkv1j?=
 =?us-ascii?Q?ABXeLbjTDl0iNT65g5j2c+Z6O7odv0+jiEJf2jJnXHDOYnDzEGDTOHAzmEej?=
 =?us-ascii?Q?9lfYxdVwdu6My8KT0TCFg/V6nVdm0u5uaVWnC5YGaqQKHYDnj5ecppy3Fzb4?=
 =?us-ascii?Q?LAm/bebeSTZNQdcxNUvyQXDz0UQFO/vS7uWhupO/0s8o+VTzq9YIqm9scME3?=
 =?us-ascii?Q?hz0pyzFzlrHPOTSz+xRK5ceO2Hr263mpjdGFZaijcDV3kvITFgTSU/pGALPD?=
 =?us-ascii?Q?zT6lA0hQu6ceHsgCbCGYeLF1rrGZzh5chUHkLDkrtUETCK4Omft1dFrWBhfJ?=
 =?us-ascii?Q?6UppZtmjSUDdt74BjvuDyHnPmW+v2cru8DGsdnIKtVW2c56cyJcKUkPEMnJE?=
 =?us-ascii?Q?AMMtiaLEG7C1HUBUqtk+LhzVuaframe6O8xJUhrG67jmMxJYCzxQbN3RPXTw?=
 =?us-ascii?Q?uYJIJjJyMVLKZrXEPZUBogT7/xljWWL0/qIN8f+AlIBh2YDd5t/u/Im90rzj?=
 =?us-ascii?Q?1jJGYLLF2/m32F5PlmK/PXZfkiMvQER7yUm6rW4Ois92l/1zlzQgw838pxqX?=
 =?us-ascii?Q?lpEmcyfyE8dlWHcjVBjJFpkGxp4s4z3yreprctx1uoWXvXx4vehAIEFu8oXd?=
 =?us-ascii?Q?71dZHv7s0wG/XUyVnnhDyFYLnSNOv0Crzc8bkHMjnyxaHckw36MOMYaKd+OR?=
 =?us-ascii?Q?5NaU9x09BXxwkeIIoghzDqR/8YaduSdp9z8hPdZe4vv8hhEWi3J7ARPoJ/U7?=
 =?us-ascii?Q?CUqdv+CN11NI3cjaf3+rtjAFP0d/odeP86+XS+FPtgLcbqJG8Z/fik7XJvEq?=
 =?us-ascii?Q?MJ2tFc4KKcGLKHbsGNS25MlMv3gXBsYPV75NR00ZZTm5YbmthYPJTTtJOtPL?=
 =?us-ascii?Q?iL+A8BZ0eowUteNYwq2QsZOGZEvr+f2KxJ5P140cWwlngD6XH6D81DjJ8Ps8?=
 =?us-ascii?Q?/kKn9pOI8B4iBXovObX4cwg5gZbIHuWCS30G5IdZuExe9piRhrEHdDwQfZ+F?=
 =?us-ascii?Q?A7+7u3Pb7LDAhtjl/5jj/YTOKWwNxoIOFdWzfgIH7C82JrvgNGi5AdBk/5qF?=
 =?us-ascii?Q?CICb6VSzsG+DgioOAQApfgBoKSymt31dPDst/3j8LXuFPb26tWUKXSrlr1/R?=
 =?us-ascii?Q?Jpg/1AyTnXpSrj7byt4HzjjCMC8uY+0naM4cVMSxB3ZDj+Fe4GwTJOgWmDZb?=
 =?us-ascii?Q?Dlc7lh7jPbWsysoT9dEQiVSNQGzRgPQo8TquEJMb36bWFQOz5gG/Qh+a/If+?=
 =?us-ascii?Q?cClnZHcxmaBYXWKOKLyl5nUzlGmXBKybIxFRDrX0XmMs9bD/hdg90QsHDIwT?=
 =?us-ascii?Q?k4H5zeom5gdiYDTopkEmIC5EbqMV4+N6yaZLxFcOgtyzcdrLHptpM2vUb50A?=
 =?us-ascii?Q?xJbdpWCFgQTHY8jqnk7l12pCDVIf5LAjz71pa2okOeGcpPlPH6L4U7MSVqWY?=
 =?us-ascii?Q?xf2p4d6LOx+ceHu5OjumrRGouYr5oc0=3D?=
X-Exchange-RoutingPolicyChecked: VJlv9692wx6KNUevTTJwmyUcAYtn2yYl/S+Ox3SSVk+2X0zd5xkI9ztUJ64J9BhgHfzqND2fnLDPiu33yzTTiyOKF4p36LiKiOdn+2YM6ivldfWLZDNFhz+psU07Ck4HbPQZ6RW3EfktAEAvc7CE9XKctepMvv6be4liOoKToyrbWItQoVZsEHERV84QcFm7UKdaNaK/11ITWtWs1lSAFneix+LXfyid2nooVbHwZggobA59zq1HktvxsirQNsAgZ73opBqaothvDkLvryOnpcAI/GHT2h/ogFZoX/xJS4IE6XKD6buLZcvChLN+6YjJlaLpVLdMgkn83JLoA7E5mQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb0818a-1b26-4e8c-eb2b-08df2f9c1b46
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 17:52:43.0865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prdKaRF7f9FEgs3ghhbmZk9nftvb3iJv544u+RtXbb76Y3SFYVOUReKoxHv+daFb1niddJahqdn++PILqS6OSG5vmQMhxxX6ZlrW+fua/bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 07:49:48PM -0300, Gustavo Sousa wrote:
> Matt Atwood <matthew.s.atwood@intel.com> writes:
> 
> > On Wed, Sep 23, 2026 at 06:41:10PM -0300, Gustavo Sousa wrote:
> >> In an upcoming change, we will cache workaround information in struct
> >> xe_device.  As a preparation for that, add the logic to gather the
> >> dumps of workaround debugfs files into a cache struct.  Such a cache
> >> will be kept attached to xe_device as a follow-up.
> >> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > looks like MattR's rb got dropped from series one
> 
> Yeah.  I should have called it out, sorry.
> 
> I intentionally dropped it because I changed the approach in v2 and I
> would like a new review on this new version.
> 
> --
> Gustavo Sousa
> 
> >> ---
> >>  lib/xe/xe_wa.c | 140 +++++++++++++++++++++++++++++++++++++++++++--------------
> >>  1 file changed, 106 insertions(+), 34 deletions(-)
> >> 
> >> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> >> index c0c97e244564..93b97c7c1476 100644
> >> --- a/lib/xe/xe_wa.c
> >> +++ b/lib/xe/xe_wa.c
> >> @@ -8,6 +8,7 @@
> >>  #include <stdint.h>
> >>  #include <stdio.h>
> >>  
> >> +#include "igt_core.h"
> >>  #include "igt_debugfs.h"
> >>  #include "igt_sysfs.h"
> >>  
> >> @@ -16,6 +17,101 @@
> >>  
> >>  #include "tests/xe_wa.h"
> >>  
> >> +struct xe_wa_cache {
> >> +	int num_dumps;
> >> +	char *dumps[];
> >> +};
> >> +
> >> +static void free_wa_debugfs_dumps(struct xe_wa_cache *wa_cache)
> >> +{
> >> +	for (int i = 0; i < wa_cache->num_dumps && wa_cache->dumps[i]; i++) {
> >> +		free(wa_cache->dumps[i]);
> >> +		wa_cache->dumps[i] = NULL;
> >> +	}
> >> +}
> >> +
> >> +static int get_wa_debugfs_count(int fd)
> >> +{
> >> +	int gt;
> >> +	int count = 1; /* Device workarounds */
> >> +
> >> +	xe_for_each_gt(fd, gt)
> >> +		count++;
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
> >> +{
> >> +	int gt;
> >> +	int debugfs_fd;
> >> +	int count;
> >> +	int ret = 0;
> >> +
> >> +	debugfs_fd = igt_debugfs_dir(fd);
> >> +	if (debugfs_fd == -1)
> >> +		goto err;
> >> +
> >> +	count = 0;
> >> +
> >> +	if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
> >> +		goto err;
> >> +
> >> +	xe_for_each_gt(fd, gt) {
> >> +		char name[32];
> >> +
> >> +		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
> >> +
> >> +		if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, name)))
> >> +			goto err;
> >> +	}
> >> +
> >> +	if (igt_warn_on(count != wa_cache->num_dumps))
> >> +		goto err;
> >> +
> >> +	goto out;
> >> +
> >> +err:
> >> +	free_wa_debugfs_dumps(wa_cache);
> >> +	ret = 1;
> >> +
> >> +out:
> >> +	close(debugfs_fd);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void free_cache(struct xe_wa_cache *wa_cache)
> >> +{
> >> +	if (!wa_cache)
> >> +		return;
> >> +
> >> +	free_wa_debugfs_dumps(wa_cache);
> >> +	free(wa_cache);
> >> +}
> >> +
> >> +static struct xe_wa_cache *build_cache(int fd)
> >> +{
> >> +	struct xe_wa_cache *wa_cache;
> >> +	int num_dumps;
> >> +
> >> +	num_dumps = get_wa_debugfs_count(fd);
> >> +	wa_cache = calloc(1, sizeof(*wa_cache) + num_dumps * sizeof(wa_cache->dumps[0]));
> >> +
> >> +	if (igt_warn_on(!wa_cache))
> >> +		return NULL;
> >> +
> >> +	wa_cache->num_dumps = num_dumps;
> >> +
> >> +	if (igt_warn_on(get_wa_debugfs_dumps(fd, wa_cache))) {
> >> +		free_cache(wa_cache);
> >> +
> >> +		return NULL;
> >> +	}
> >> +
> >> +	return wa_cache;
> >> +}
> >> +
> >>  static int debugfs_dump_has_wa(char *dump, const char *wa)
> >>  {
> >>  	size_t wa_len;
> >> @@ -76,27 +172,6 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
> >>  	return debugfs_dump_has_wa(dump, wa);
> >>  }
> >>  
> >> -static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> >> -			       const char *debugfs_name, const char *wa)
> >> -{
> >> -	char *debugfs_dump;
> >> -
> >> -	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> >> -		return -1;
> >> -
> >> -	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
> >> -	if (debugfs_dump) {
> >> -		int ret = debugfs_dump_has_wa(debugfs_dump, wa);
> >> -
> >> -		free(debugfs_dump);
> >> -
> >> -		if (ret)
> >> -			return ret;
> >> -	}
> >> -
> >> -	return 0;
> >> -}
> >> -
> >>  /**
> >>   * xe_wa: Check if a workaround is enabled for the device.
> >>   * @fd: A drm file descriptor.
> >> @@ -106,25 +181,22 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> >>   */
> >>  int xe_wa(int fd, const char *wa)
> >>  {
> >> -	int ret = 0;
> >> -	int debugfs_fd;
> >> -	unsigned int xe;
> >> -	char name[256];
> >> +	struct xe_wa_cache *wa_cache = build_cache(fd);
> >> +	int ret;
> >>  
> >> -	debugfs_fd = igt_debugfs_dir(fd);
> >> -	if (debugfs_fd == -1)
> >> +	if (igt_warn_on(!wa_cache))
> >>  		return -1;
> >>  
> >> -	xe_for_each_gt(fd, xe) {
> >> -		sprintf(name, "gt%d/workarounds", xe);
> >> -		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
> >> -		if (ret)
> >> +	ret = 0;
> >> +
> >> +	for (int i = 0; i < wa_cache->num_dumps; i++) {
> >> +		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa)) {
> >> +			ret = 1;
> >>  			break;
> >> +		}
> >>  	}
> >>  
> >> -	if (!ret)
> >> -		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
> >> +	free_cache(wa_cache);
> >>  
> >> -	close(debugfs_fd);
> >>  	return ret;
> >>  }
> >> 
> >> -- 
> >> 2.55.0
> >> 
