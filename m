Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFAF606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 21:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=La/dZNQg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1258E10E0F3;
	Tue, 20 Oct 2026 21:36:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096110E0F3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 21:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792532110; x=1824068110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KBqBRTlDHjpltp/a/rWsaonO/f1gR9swND18SjCOOZk=;
 b=La/dZNQg7X8a0gZF2uO327zqhp+LZZjZS0yHY7khz+xecvL07eyrsH87
 IPGAWZtUWVewiyMb9lDST/fYsNHiGylGCCSXt8zMWI42hoRMea4WpQiqd
 5UWLaFTJA912LQUJDK8K7ZwbPNanAG0gDBc5NH3/GFRxB9BPn2856dFCx
 OiBUgGkW0MQyH+arGMHSUc2GqATY+0QaXmV7wjUGqlX0Bv71ngPFjm9/b
 FwMc6zuklcqZE35xSsWdCOvrP1qHzR3/JjCjLZRPEINs4tDc6146I0VzH
 X+5iwJJY/Et9gEcuAL09wM0AA+T4KukYFV1nJDyakOWH2d1dTDypvzhKR w==;
X-CSE-ConnectionGUID: HxBtLkCUQ7uYdjBNbrfc4Q==
X-CSE-MsgGUID: UAWmGJrqStWg1d7rM60jnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1263497"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1263497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:35:09 -0700
X-CSE-ConnectionGUID: OsmN19ZKRl+LrvQ8C/bLgA==
X-CSE-MsgGUID: O2P/2bIZSUqbjA6ZgpJJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2806442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:35:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:35:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 14:35:09 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VacGgMvYnpXE0tYGOiB8dU1QBW+rWUxrvq2bzTjUHZKfJFH0Wy/hBpLu58XrsfH25jteD45NufnOcrZGEaBRikIcwmSTo7IBRmSZ4jDPJzds2fy/HwHsuTaIHpd9+ZagTGVNtc7WilgKfBMWqZvYYcF4CvU1U8VPpmKWrBN2aOoK+wdPzCPzxeGOxRK9GKIkm3yTIeOILtQIrR+Ad7IeoKEaLwjX1p81DSQef5yT9mV7VDQkHuMd51Faz2Ajv/MK5XJy2pnPmf1lMBlmbEJsvukkzTWMG05ZOnDI3wPYujG2yVaoaoAw9pPPQru7uD6g6L9dChujtYa+Bl1zDFeYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cu3EWNvKaABqDVBlmSJqujX1YOQy22yiTwU/o5ixOaI=;
 b=VJe9a3UfFW1R/jr6Q3cFeatVTqy9cM2mE1Vxcb4zBPS/Hg3OrOQbprrMGTq4k4G6Nsh8veVPrK5fNPlUuvc96zpMI2k1HM3AofvbSljWtTCaF4Kfaon3ap9pSVu1Um1MLI4k1r+o4CHv750G9DNA8r/A2KLmjlZDDVIm4VzK0tZ8xz+DZh5dydbHXTxo/8YVnc+CHG9jSVkwgWxRZZLQIPlgIUcchT7kkXg/0ZPD21WiAHPQ0IJ0guSirCHKwL6ryLz/orsvpGj/NTBXyOkE1FfgOqVkmb3QhLHM40QPp+QFN/TdYgocljYtmGYyvx0iHJBQJZMY+4oFKK6PKXMCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by EA3PR11MB899369.namprd11.prod.outlook.com
 (2603:10b6:303:30a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:35:05 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 21:35:05 +0000
Date: Tue, 20 Oct 2026 14:35:03 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2 09/11] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
Message-ID: <20261020213503.GF180749@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-9-528b575299d2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923-wa_14026539277-v2-9-528b575299d2@intel.com>
X-ClientProxiedBy: SJ0PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::25) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|EA3PR11MB899369:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e230d1f-a160-4d73-2a8a-08df2ef201a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|10070799003|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: Y8LEPZOCxDsAgtyYonQZfvhWMtjYLQtAlEEkSvnsnu2MaVlmjGrEsPdgvjidYktEqsuvAbRJUSJqGDM5eztva42a45+jIp58Hn4P9dc/jvBi7I6PDVKD1dFI3QeueyOQl2JYNJx8+zsYID+IybOot1BrRNxW0pd/RsDSRe5XOHVCqJA0Yqv3A6UK83v5jiyc6KOi7LkNq6xXxtigUWYGVDFvqPkzbMahA+TF2TGOGfdkHscmxKIXrFYs/3uqSR3EeorMcTrPiOGhpg2mmNqYYElIyEO3v6sP2eL/Jb/rv2gSbbohLMkKcf7JcS/qCec0m83LTTUdk6RTGlkzHa5oi5WF1qupFWdkXjh8EQi3PmSbBee/XB2K6PNBmJQgENiau+CrYNXReXMer4VMPWTbeEdBf571sx1TQ3A96EcvrSS26z1PY7RBo4eCC/Gidc3fqFMvhUEksGUkp/2o7gIRVoegybkbxPRX31BeKJK6wPsfoyxMqeyQEGVoEyuwjJ6/LmYCyzXYkoBw9zKz7vo9Gy8rtKkqv86vqvE/u9ZlRSgqFqxW8nfRycvRveD2KfYTGYrv0wfuA/O96MxBkwYQ6rOFR9DD9wJJN7qCFTxzapAIHhwG01MbmBwEj4KUhNicMoqbJQka4ok0JaExU/bU0pl2JY32FmceySdpybtBv3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(10070799003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?08I5Wokv6LlTPoCtd3Pho8iKdEimxam8Vg/hMknGtZeDhDKmvKocTEFA01G+?=
 =?us-ascii?Q?V6L9H0VWfC/8ddvkUF8mKHlIga0LhDOhZ2OxXZEO7vSmzcDFoolGRUYgF1wC?=
 =?us-ascii?Q?mJU8eiFaaWW92xQHZH15Piqv4Ps3sprxLwztjBO9lg+LTh/Mg0u6hsGtgNlW?=
 =?us-ascii?Q?5nncJNTDyQHhRtUGGlxC2HQQmHj0RCKMZ/oK39DkULAgjND2P4pBUXEK2FTp?=
 =?us-ascii?Q?GCTRyjzkAK3tyHOIN6yx7oZzkeOVSzhpvmQk99C0OlN8qN88X1owqFyclQJH?=
 =?us-ascii?Q?b8f1aO/VflfhecFZBq8S/JiNiEdBl7eAwT0h2vcBoYu6+77CEai0xuHB8a/q?=
 =?us-ascii?Q?FQLIH6wxmCulcNawOqhob5sFNz76fxnOH68TESOGMwSNdG7KS7MXdod/UslI?=
 =?us-ascii?Q?reZFD9KW3sMHCL4iCjB0CNUuWjnovucGyf6PbWo8+UxlYOT0W1mXZ8DupAkz?=
 =?us-ascii?Q?g2u52fjwXgOrualSj90L6ZlMVyS5C0kbaZpJCdbOfKZrel+NEGGONhUjdlch?=
 =?us-ascii?Q?NCJrJTOzFOzv7tYPIYQrCUldnh3soMy4ScZDKmDvqH+1DoCMScETh6snqEku?=
 =?us-ascii?Q?xQQ7KFZCOSzeRS8gYA/QBD5GvNzRqHEDlJqKO+RawpYNU2xzFeVcDRHtxBn6?=
 =?us-ascii?Q?UoY2XqqAPk/XAiL6ZeBWEXH/2T1VUshaCy7er7MDTkK7ndDt8L1kxYpD7KzX?=
 =?us-ascii?Q?UAdjxS2V+zrEPAXPYyuUG+VoAKRfT+PZo4Xb8m//HJblVTBLv0SwP1c6V5Lu?=
 =?us-ascii?Q?65zlR9mTkh89X0JneWjOH/Nx/h4yJ0ogWar3aALm5DRX/fXBNlsLKyxUzPV/?=
 =?us-ascii?Q?/iZKmAngw++XD61/JR7D0pSaju9OS/kHvgWdnnIAujqL1iK+m/q3DICsxy7V?=
 =?us-ascii?Q?EiZMTAgnXLYmZjpUBF3v6AgNS8CDekjNbd1Gxb2Wdv2oR6ridIJSmFh3SsgI?=
 =?us-ascii?Q?ziNCLrqbZSzM1Vb0LnBP5FovBMB2/VS5Tyq86+pw52tvbKF0H3Cff6JFrwJZ?=
 =?us-ascii?Q?GyXSKpsDaMyPHNTfarrcCUUYstpT+QcIg7NXjew9KVkKGJZrp4xfal4+qFfx?=
 =?us-ascii?Q?PMDKoyWPuIbkmKISnrNigmEdWfpCjJQDEe40+B3UwLLJViujTngomf5Hd8ud?=
 =?us-ascii?Q?gaoxdnJYQaFuEe9FCJG6aOfWH0WOeGrIu2fHc8pvL6uIILr19r6G1jPgAjOv?=
 =?us-ascii?Q?PU8mKZjAPJuT5e0DKnWHVZOVKsz4f/UV9kNlDV51UgXGMacKxpJVlBWnUs2Y?=
 =?us-ascii?Q?yVzWQ5aQ7VrhZPsJiGkjw5Ul6QNIAJxgsYQLgXUqQsAEZ/HmMKuiTzplzAKl?=
 =?us-ascii?Q?ZIbrMRMp2I5S9tjj6hpXnaVdQt9FVUXrDpJH/7Z5oYwplsRglp6wDBT8IEVk?=
 =?us-ascii?Q?zKE3pJpv+S/C7ufDjf7JnH5oNU8ybQwaJ/f2p5dbURVMRgGc0NoZi9HNxufQ?=
 =?us-ascii?Q?sEkY6Poxn1TIjT7csGERlaYh/2HYRK4TABG48eLWbJZzyeb5Cthzuh0cDlwt?=
 =?us-ascii?Q?TOpxp2wW8n8GYMs57P+59xfF5ulTqRQV368u/C2HNz7BkyW8eGrHFwlcEmf3?=
 =?us-ascii?Q?oVmIt3bQfzUp5pJl8dqI9ARIV2tZVBsfwpVKy2fHbRbMpq6xms70o2FvJog9?=
 =?us-ascii?Q?nxQJTZ34fdX7lYpB8vjdf2wIrWBIqxnT9GNSIeRDm+B7xn3m7Mj4Ol7T2ynU?=
 =?us-ascii?Q?c6DnUcIDV//Lh3sBDxdOEYDoU9IGHYn758xeQ4tYyXsfYLJ+2SL7LGzedG7R?=
 =?us-ascii?Q?KSlKNY6qaHwSyJjFNqD5VraLn1yXBFTbSdqXHrYxLq96SVX5zL5dFagBOT7R?=
X-MS-Exchange-AntiSpam-MessageData-1: 3JNByNZXmDI0dx2dEn0SbvzZLeB/hNHQwmI=
X-Exchange-RoutingPolicyChecked: vz/TAciUVHme3nCDVC8D+Q/U42mFP+ZWgOG4VfcZ0hlRpX641g04EUPKxoMd+v6xr0fo/yqdGwn9Xf/iKSzQZ/4HoXXfvnX9F/KGhWo7vioLb56hN51z2jZO6FinwqVg2fW6aWhcRFNT6zA3C92s0pOj9TApnev2P0zuuXh1t3rhWPMM9GuHDfEbpOrw6mC6fJVwkxf8gQqj8gdGR4+c1Ark2u9Ye5SlKLaYeqZQ2tLJX2CGsl3F58BS+3VD2ReSpWhGh9m1T1ehTBodhd208+3NnMkC5sEmOFfFvvTegGGQLG4GD+HSHId65vGrm/Z4ooa24zKAKdkyc54W+TxCEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e230d1f-a160-4d73-2a8a-08df2ef201a9
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:35:05.6546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNCOXm1XUBixBWaUMb3OqXOv6NKcK9M8HhD9g6oGeEaaqBysEuMNKJsRKQDtCtXjQCiMvaI3IWTgnEmLCn2optaV9PJg/YxGzys9iuFlkO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB899369
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

On Wed, Sep 23, 2026 at 06:41:16PM -0300, Gustavo Sousa wrote:
> Currently xe_device_get() manages the PAT cached information
> information by itself, by doing the necessary memory
> allocation/deallocation and calling xe_get_pat_sw_config() to
> initialize the cached information.
> 
> Such management is arguably better suited to be implemented as part of
> the intel_pat module and encapsulated such that xe_query doesn't need
> to know the details.
> 
> We will introduce changes that will require an extra logic for
> initializing the cache and having such encapsulation makes it much
> easier to implement.  Since we will touch this area, take this
> opportunity to move the existing management to intel_pat.
> 
> v2:
>   - Don't use void pointer as type of pat_cache. (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/intel_pat.c   | 27 ++++++++++++++++++++++++++-
>  lib/intel_pat.h   |  5 +++++
>  lib/xe/xe_query.c |  9 ++-------
>  3 files changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index da7ba1e51b16..db0f057cbd1e 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -144,6 +144,31 @@ int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
>  	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
>  }
>  
> +void intel_pat_build_xe_cache(struct xe_device *xe_dev)
> +{
> +	struct intel_pat_cache *pat_cache;
> +
> +	pat_cache = calloc(1, sizeof(*pat_cache));
> +	igt_assert(pat_cache);
> +
> +	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
> +		free(pat_cache);
> +		return;
> +	}
> +
> +	xe_dev->pat_cache = pat_cache;
> +}
> +
> +void intel_pat_free_xe_cache(struct xe_device *xe_dev)
> +{
> +	if (!xe_dev->pat_cache)
> +		return;
> +
> +	free(xe_dev->pat_cache);
> +
> +	xe_dev->pat_cache = NULL;
> +}
> +
>  /*
>   * Hardcoded PAT indices for Xe platforms, used as a fallback when the
>   * kernel doesn't expose gt0/pat_sw_config in debugfs.
> @@ -217,7 +242,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  		struct xe_device *xe_dev = xe_device_get(fd);
>  
>  		if (xe_dev->pat_cache) {
> -			*pat = *xe_dev->pat_cache;
> +			*pat = *((struct intel_pat_cache *)xe_dev->pat_cache);
>  		} else if (xe_pat_fallback(fd, pat)) {
>  			igt_info("PAT sw_config debugfs not available, "
>  				 "using hardcoded fallback\n");
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index 52a61e8d25fb..fc8fa3fa9f45 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -13,6 +13,8 @@
>  #define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
>  #define XE_PAT_MAX_ENTRIES 32
>  
> +struct xe_device;
> +
>  struct xe_pat_entry {
>  	uint32_t pat;
>  	bool rsvd;
> @@ -42,4 +44,7 @@ bool intel_has_pat_wt(int fd);
>  int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>  int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>  
> +void intel_pat_build_xe_cache(struct xe_device *xe_dev);
> +void intel_pat_free_xe_cache(struct xe_device *xe_dev);
> +
>  #endif /* INTEL_PAT_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index d2c4329aa317..e7945c8923db 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -377,8 +377,8 @@ static void xe_device_free(struct xe_device *xe_dev)
>  	free(xe_dev->mem_regions);
>  	free(xe_dev->vram_size);
>  	free(xe_dev->eu_stall);
> -	free(xe_dev->pat_cache);
>  
> +	intel_pat_free_xe_cache(xe_dev);
>  	xe_wa_free_cache(xe_dev);
>  
>  	free(xe_dev);
> @@ -458,12 +458,7 @@ struct xe_device *xe_device_get(int fd)
>  	 * should be extended to cache PAT entries by platform version/
>  	 * revision instead.
>  	 */
> -	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
> -	igt_assert(xe_dev->pat_cache);
> -	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache, 0) <= 0) {
> -		free(xe_dev->pat_cache);
> -		xe_dev->pat_cache = NULL;
> -	}
> +	intel_pat_build_xe_cache(xe_dev);
>  
>  	/* We may get here from multiple threads, use first cached xe_dev */
>  	pthread_mutex_lock(&cache.cache_mutex);
> 
> -- 
> 2.55.0
> 
