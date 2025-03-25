Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B055AC3600B
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 16:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6344410E5B9;
	Tue, 25 Mar 2025 16:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nt2FQBoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E126A10E5B9
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742920099; x=1774456099;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=s0S1lTIizJnKU1g5s99lYFkAK9JWKP2eVJ7ytvuXw7w=;
 b=nt2FQBoSgoAReotbWAXelKn7XYcFV7xQXCH1YsH4YKwCQj9Xm2K9hCW7
 K4PWw2hdcbPLffa0T0mqL6giNvHWR6T2HSkD2TiYR873BZTERx7811qQe
 1D8fwQqOEmWOjqk1imJtX1+SSPEC7fmPvZBuUtwCs3KMhxiJGWEu8rOKn
 FnBkFB3DgVLWfzH0UwG3Z9RUQcuvVEvc/09A0IaCpKwyGeaI2NsuaBpoW
 jVYVglnbC5QdJcWzUFR7xaIbtBOCbkoVmiHUHOu+95jV+zBl9KRTbAJcl
 DbUIW7wzhoYV62dPOVXl/RC5LldaKtMmNMCDuBzH9f1zJRb48qGh3IUHn g==;
X-CSE-ConnectionGUID: gBOLQxJSTxuimKlNpT75yA==
X-CSE-MsgGUID: PooDt199QQ2HJKVgIohlmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69538941"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="69538941"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:28:19 -0700
X-CSE-ConnectionGUID: bMNV7mtoS9Gdipiu3MsXZg==
X-CSE-MsgGUID: e9ysrXvBS1KF0HHi+6Atcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="161640796"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:28:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 09:28:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 09:28:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 09:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsBvkLcnwbPnXRbdlBKRnoQ0nr2KRDcfetjl6FCZI9g79SuRpN7VMy+m4Y9OYo/xdRpEWwv8XIh6MUCqP4DAmGWnEz1iOwPy/TV8yvc0CWVmcOcjJfInTyttISLRJaV+tgHiqupQfQBDXVDmaktQcifSaUr5YeRxjlDuhC+UVnXvCndlIvuvgaiuRFIjOfu5xDfV6Uts5YKtU6RkgVcfwwH4bQOuGMs4Z7mkhggT+nw1aNJvtcQ2Q3GYhA8B41841+RThYC6MDKigTv3Bo9d4Es3MG+6+KgkZ/rZmjiKRCRcsNXkc5sC1Fb1CSjE4bZfuZF5XgI2Hdg0JT2owSZPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB9WFFv+5WnElMlCrmyCRKoFz5R6enAROpCnVUID7y8=;
 b=L7bvPfUIYTfAeQ1+y2T2CDJj0uLyCI5rmYq7QhYcY/xmF86ykICXUCTBVpidegEqXX9km2BSuNYeWNRR4+3BdT3VdfYWCTkbMY4xpinXRntL4Rt0nib7er3DY0kI1hYnUQIFehYGVHupDHWhmJE3IjluM70r99nJuRAKIHA9OdRW1ZM61c1S+T59YDSxVydlscVg986KVRad9S5HxdBxCJpO1AXrqw6l1whkUEZiPR0lGcgMCgcqx364l/HUgNilu6ZY0UFT3t7Y3YZue0VVdDsCuCRl8ov3nR1Blw2r/X7O8PwS8WNe7KcNVyK6fax3+QiRhGcO6vB1iS6okQrQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 25 Mar
 2025 16:28:14 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 16:28:14 +0000
Date: Tue, 25 Mar 2025 18:28:15 +0200
From: Imre Deak <imre.deak@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Remove PkgC dependecy to
 validate deep-pkgc test
Message-ID: <Z-LZn04ZRpFIPKdp@ideak-desk.fi.intel.com>
References: <20250309100301.41405-1-mohammed.thasleem@intel.com>
 <20250309102833.56309-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250309102833.56309-1-mohammed.thasleem@intel.com>
X-ClientProxiedBy: AS9PR06CA0577.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::17) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BN9PR11MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 042b0041-f843-49dd-6a08-08dd6bba0a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6m1AKcsgEPKG92sBBczpg0dGuZ2LYl8JCwy7FnAiSOldPzMwGba5v8cB0Rfq?=
 =?us-ascii?Q?YhEdYQHrA6k2ztDduycfYu84lYrK6MDLRUWgnxh+gmaKJYO8gG3S/2g14jka?=
 =?us-ascii?Q?TE+SrcfLH8kWi5ZHN14ffhhQdmshGA12zvmuVcGmslB1QTbCfpZWoMNDPOUg?=
 =?us-ascii?Q?98mIIUDto9pTNlAydoyA8cMyauNfyb8hWlsSTDh876iVB7BfoDjeRKIGhAYA?=
 =?us-ascii?Q?GD+rzACJ+KxApCFxK0IWpHfGPtSWdSA3LUewCv2VnAW45X0Dk13VFXmWD59N?=
 =?us-ascii?Q?8iFIcNrohF1Wfc6mWhdOk4+y/VGd6cbgDrZR+bh0es3SYuQtRcR1mhNptii2?=
 =?us-ascii?Q?EtF2tOe/SDlYf2Eed+WMQmCb3VaDQl86ZUaX0t8cvyl9sBGzrMDmEBKPgTLT?=
 =?us-ascii?Q?Ues/PEPvCLjHGNHyi1nKv570vrZId4SQvrEBAG4m5AtI7gT12ykso8q4WYRx?=
 =?us-ascii?Q?Qcf+IRkGg4pQzWWK/W7WFaycARC+V4lCoN+aJzwidwhV7pPYm5ijbUBN714h?=
 =?us-ascii?Q?0iiQj1dQ/PBWU6BeGLP61SSQH70PTf1PiKgirnE3xBoUxHgNP1axhv5E+kH1?=
 =?us-ascii?Q?WIQjiNpxTFWWEk7Pkxi5vO5wCktIAP8Iv8/tlk+wGH+5/qCmCYf3o/cP5M2z?=
 =?us-ascii?Q?4qCneb0MM+tR5FwX/LSqCbI5d1A45mPpQGvWPGcLCv7SOJuOIEP2nr7jAVsU?=
 =?us-ascii?Q?i2Ka7F99+civZ7knCZB0L0alJVL/9q9t20jeIwTqDK2NR3VvyhHQXgbdn7fX?=
 =?us-ascii?Q?NcJFEYOmofwDSKgrY/6Qzth4EWwXht7Uq/gWGelgnzQv6dsJB9EF+z8VJp4k?=
 =?us-ascii?Q?cZ0WGJ/gJKxi/lEGCmlmY21Zlm1gQhY/kM47dvpSxArYrO1Z9HNWkaTTRrr+?=
 =?us-ascii?Q?somdKdJ1kHwUWtxneuYWpyYjdiWQRAGlX5fOJLty2wBNxIkWA+rCYkq6P21p?=
 =?us-ascii?Q?iEkNkEmyZsyvk7J2sKyokBAumUPOeXeoQ0zzmIAkI0natgkEaSFmR9vRxr/h?=
 =?us-ascii?Q?qBgN9F0zfg+lxKZHfOFYyYJM72ttsUHvbNLT46g1WlNieLtGDSaqTaexXyfW?=
 =?us-ascii?Q?/8hgu3gpaJKimubpE3YLc3Tx7pKZAfp5xbHK8c6zI6jdHuYstkbHcMN6Bng4?=
 =?us-ascii?Q?X/68+ZR9kP39Lt2N4Pu3GqoP0tXUboJmCTBNjPISATHdib8l6SKU27swBars?=
 =?us-ascii?Q?kz6vy4W4Qnn578e7LJ2+e0a5QjxsyTDkbExbZw+yrLUCDiKhMJUV7lz6Fw2+?=
 =?us-ascii?Q?BGOlsZcROmLL7VqEIP1Zi3uuNSICLDCbNqGaCCJ0UnrGqaDB+UfWAYMszh6j?=
 =?us-ascii?Q?5EDclZonEmee+lWhC5k74DsZGKtEiDolT5NiRYQoCWhTqKvxLAU9QPZK+O7k?=
 =?us-ascii?Q?IQ412nKF/KQXeI27X2ro9F1OfLfD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19JaWbyMWDBIczxnkMlG2hPRjNEYTLxorqOArbdZJz5/W4kQ2hRonxNtivNm?=
 =?us-ascii?Q?6JoCpFix/g3kTkZ2Pe4wr7pWSTkttQUy8IY1ZfL0swDJOGIxOeRWkATV5UaX?=
 =?us-ascii?Q?EadBbOFVrCn5ucvsiBfANiLiJRsj8PANsas5sc9Ba3uxNhy3jd+/0SZudujq?=
 =?us-ascii?Q?9MFUPCZFm7+F3NCqmxGnlggvAW0deJd6wH8McSFhrDcYFWGgKPhLgGygi6qi?=
 =?us-ascii?Q?U8enrwxIZXw7AkYLCW+2fWwvuBtyUGyynOFML91bUyr7O6RGSr7c7NwAGurd?=
 =?us-ascii?Q?StdWsTNSxE/6DMUBAgFgRvK5cIEjFdqhOQeMmRBdkddkfq4si3xINzPY1sz5?=
 =?us-ascii?Q?C3V1g6+TBqstplXU6+v34puPKWihDhS1eNOtSXuUTZjjASjpnDoguBvHMvSb?=
 =?us-ascii?Q?nfnm4Wfp2U9VL9gKVbyhQv93hv1hYeCYfvBa6U6C4hzlt42lPfIVJQ+fqy6A?=
 =?us-ascii?Q?QeXCYmWowvcTdeIjBte7ycuKAqqD2LSAXCpJmirIUZIcUZHsqvudyv8lEoXA?=
 =?us-ascii?Q?PqAXagWzKRexsBnFHyJzKzBSupEE4hMVGJ3wLtl3M2ji+U+ktTIIS4vaePBs?=
 =?us-ascii?Q?rlYZx/eZsXLaR20YPTYpQQl3TKYLGbIMvigtnd2hcpMpV7/y3zac2OKq7Ks0?=
 =?us-ascii?Q?wa6pGyuktUkvmgoAgOUM4M5WBThy96u/wpK6iuQVQoS0B0pQuzwEUuhV12uV?=
 =?us-ascii?Q?y60TZ24R58166AW1bGm2PKsE7GK2g6Vsl1R7RY07iyF4tQcZ2ygTTLFADf2i?=
 =?us-ascii?Q?3lzohwnnOfM3krV6ktbMZCnkwHj0jZnypBZqijGp4S/PXOmNc9VB2zz9lK4k?=
 =?us-ascii?Q?2SISxPEinlslXV4x493e8ahCflnkBKaF72HOgrTvgbLOW7Ka3x+kh98n5Qtm?=
 =?us-ascii?Q?o4Ys5Un6ow5a8ZXZ00536D9PReE7xboYnuxZOBDrKhfElcYTrRpnihfbHjp8?=
 =?us-ascii?Q?NkTHTooT2tniJXiXVDJYwtVdBQLh/xGdLq8T980kNMSbhG47nYJaS+puY9aW?=
 =?us-ascii?Q?zVKPy8KQxuHfaZlKTDi29RK1uRlNRovhbguXE6bKK9JAwFWznvXxrpl/nFht?=
 =?us-ascii?Q?nyNyGfuNwoHcK91CyVxz5FYYsDoTY6GGwXFyzKxH0ybwfRcAk/98xlf7LTZN?=
 =?us-ascii?Q?FxBtvsFsCLtW4trqLBfP9ruLMG1KzgfYsVYorZj6RbiUH9QjqhNFa8/Ef+dl?=
 =?us-ascii?Q?0kXm1kJCzIcjHw1CHtGAqdcAW7B3zMQ7fF/Gp34BAsdvMsKH+k5SDJKRMOHt?=
 =?us-ascii?Q?DiSqP1+ueJ8B2NuiZwdDs4ob6ZqofJdzIESHfosVzipFhzQ3QWTvCn/Rfb4u?=
 =?us-ascii?Q?N8K40+XETkDIjPbuKP36Y0er89P8wHtCo9I2jZjuICqdGhuX0ucqUBElDuoS?=
 =?us-ascii?Q?D0idSeZckTRtfBazuqjgYe2rwA8RTH374Hz7ZGIKEreULUCmJksIJwg4uN5X?=
 =?us-ascii?Q?opCOVbSI47xJAdxTygiEYUa5HCP1SF5Lk0EPyZQs/p2pvAdJAC7rbJuAK+gZ?=
 =?us-ascii?Q?kK+Ky4bS0ZBSDH2V103eE1kx5bMvOl40KBHyK+J/cLVsb2npeKpCjdfxv2vJ?=
 =?us-ascii?Q?omC/nY7f0EN7oPjPw0orrOmIdW+RswS1OHKllK0i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 042b0041-f843-49dd-6a08-08dd6bba0a8c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 16:28:14.3876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0axP5sbU0qmQdkN20d8uyGBMhKQxNIu42GKV65gnSLmh1cVtXo6kOkf3zUuly/auJ9Py36YaM46s5njzI7gBmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
X-OriginatorOrg: intel.com
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Sun, Mar 09, 2025 at 03:58:33PM +0530, Mohammed Thasleem wrote:
> PkgC counter was removed from MTL onwards, so an alternative counter was
> used to validate deep pkgC tests. With the new KMD changes, a dedicated DC6
> debugfs entry counter has been created to validate these tests,
> allowing for the removal of the existing alternative counter code.
> 
> v2: Updated igt_describe and discription.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 34 ++++++++++------------------------
>  1 file changed, 10 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index b4f30a37d..ed24a24b8 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -78,7 +78,8 @@
>   * Description: This test validates display engine entry to DC9 state
>   *
>   * SUBTEST: deep-pkgc
> - * Description: This test validates display engine entry to PKGC10 state for extended vblank
> + * Description: This test validates display engine entry to deep pkgc by
> + *              checking dc6 entry for extended vblank
>   * Functionality: pm_dc
>   *
>   * SUBTEST: dc5-retention-flops
> @@ -617,22 +618,7 @@ static int has_panels_without_dc_support(igt_display_t *display)
>  	return external_panel;
>  }
>  
> -static unsigned int read_pkgc_counter(int debugfs_root_fd)
> -{
> -	char buf[4096];
> -	char *str;
> -	int len;
> -
> -	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
> -	igt_skip_on_f(len < 0, "PKGC state file not found\n");
> -	buf[len] = '\0';
> -	str = strstr(buf, "Package C10");
> -	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
> -
> -	return get_dc_counter(str);
> -}
> -
> -static void test_deep_pkgc_state(data_t *data)
> +static void test_deep_pkgc_state(data_t *data, int dc_target)
>  {
>  	unsigned int pre_val = 0, cur_val = 0;
>  	time_t start = time(NULL);
> @@ -694,7 +680,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_display_commit(&data->display);
>  	/* Wait for the vblank to sync the frame time */
>  	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
> -	pre_val = read_pkgc_counter(data->debugfs_root_fd);
> +	pre_val = read_dc_counter(data->debugfs_fd, dc_target);
>  	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
>  	usleep(delay * 0.5);
>  
> @@ -703,8 +689,8 @@ static void test_deep_pkgc_state(data_t *data)
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>  		igt_display_commit(&data->display);
>  
> -		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
> -						      (delay * 2), (5 * MSEC));
> +		igt_wait((cur_val = read_dc_counter(data->debugfs_fd, dc_target)) > pre_val,
> +						    (delay * 2), (5 * MSEC));
>  		if (cur_val > pre_val) {
>  			pkgc_flag = true;
>  			break;
> @@ -712,7 +698,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	}
>  
>  	cleanup_dc3co_fbs(data);
> -	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
> +	igt_assert_f(pkgc_flag, "Deep pkgc state is not achieved.\n");
>  }
>  
>  static void kms_poll_state_restore(int sig)
> @@ -781,13 +767,13 @@ igt_main
>  		test_dc_state_psr(&data, CHECK_DC6);
>  	}
>  
> -	igt_describe("This test validates display engine entry to PKGC10 state "
> -		     "during extended vblank");
> +	igt_describe("This test validates display engine entry to deep pkgc by "
> +		     "checking dc6 state entry during extended vblank");
>  	igt_subtest("deep-pkgc") {
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
>  		igt_require(intel_display_ver(data.devid) >= 20);
> -		test_deep_pkgc_state(&data);
> +		test_deep_pkgc_state(&data, CHECK_DC6);

What would be now the difference between this and the DC6 tests?

>  	}
>  
>  	igt_describe("This test validates display engine entry to DC5 state "
> -- 
> 2.43.0
> 
