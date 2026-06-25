Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FC4CDB47F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 06:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C72210F111;
	Thu, 25 Jun 2026 06:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kR18cIgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBC110F111
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 06:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782368875; x=1813904875;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xXFoCWJcHJysDVC7X8+q5hi/maKL5pavJdYy+pR02+g=;
 b=kR18cIgUGrq4RU3NZmv6oNP/rKi3cHdKqcPt8u1qLNqb2SX5hBHaV+Px
 1ceWLI7zcPxmGTuaRZApkRFoQr+k8J0VNWY3YDRjUVQeeMHtfMYAr2RjI
 Uf7XX09iGSlwLQ+BY9sMfZlsJa5O3jWxgwLQvTDEEN0GWOzsRZJNHO8qF
 g76s2bX1yPnYjOuyp6ROr4uYipSkCIa4stOpsD4Fq2UwUa4UVi5EsLVYT
 roGoKwMgw5BhuopkQBMZQpSqiZiBlxXH0B3uy/lcu1iAqlyu43lQzEsxp
 5/3IIL1MYj3Q8DTvBKTgWCQjykJHRSt+BSxowM797XTSGG+ihmtxlQkt8 A==;
X-CSE-ConnectionGUID: bM1rGXOgQEConeRO+ZTtzw==
X-CSE-MsgGUID: ABE2U6CWQNi8dvEW9bc7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83144844"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="83144844"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 23:27:55 -0700
X-CSE-ConnectionGUID: 4MjCgTowS8C5wX/ORY3/oA==
X-CSE-MsgGUID: 78dVWq8EQxCBFGJOFa90Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="247281667"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 23:27:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 23:27:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 23:27:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 23:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBQ4Rzfphb2f8PDXSlFjwB80/cYXv4YdESa41vtgEYMPkyEA9zxmjBo57m+6ii9100PmQeQERdDJByD77lXa0UfNwOxi0Oe1rguEBy2vjL98DLQfdmW87gttOehW7cNpuUEx9xeEihOW53osF9YQMtj5l+0TbPk9Xj+hsazZVrdkTBC6t66DnLy1bPEfQWXtH5F7atWQoUFdFB/mSLhaHH7tyuGgMdoxRGmhydooe3ZY50PHzxybzeBrdl3FRDTIYH1mr26RjDnss15DcheV3+3hak6ndbF0zkwdgDMf4u1Wd2kufk/N0kQ2qj5VPHtBi/lUGUqzFTLphe9gvjqH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1Ri77n7ACXasgzGeVGHSFK+PMzBob4Fh72rNohAT7E=;
 b=gZdxAy6WXy06WsEeBrfUxZWCrZlKx6GpzfefeKh403l7t+nPDspDQ7CuD4veFDwEf1mJRBjlfnZ85rgXL3fVmNc9A/OuD1jNTTwYBP4vMw8MCb53TWNCimfL8i4Va/XD2EVpO/OKK1ijClLWP2B6jDnW21h3Poce0OioF/PPJMthPnKu1BZaXxgVUogIGXJQpdHHNc+53C7TxISW1hK/gMNElUTjHBQV5soGFATIFSbs+YdWaV92cH1LowLsRcQaDnHDIyC/STEGLnbc+RUZ1j5JYaA1Crk8FmpJGWq658EgZRDWi1fPIHmhqRFeE88yn8RUA8q6/7OfhQuNaYZ/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 06:27:51 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 06:27:51 +0000
Date: Thu, 25 Jun 2026 06:27:42 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 03/25] lib: extend igt_tools_stub with additional
 stubs needed by tools
Message-ID: <4lzw2g6sd4nc2qs2jgr4mxibyh7kx2a32btq6vrdh7gxjdplv3@b6k5m4auotn7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <58b9bf1d4bf1984af79901d88c87cf34ccf7eb60.1782288071.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <58b9bf1d4bf1984af79901d88c87cf34ccf7eb60.1782288071.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::13) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f87c364-20f1-4d24-3d79-08ded282e22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|6133799003|4143699003|11063799006|5023799004|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: yufB/7HJvgKqM0W107/qAd2LP5ImbuQjX3XbMRFu9iqgXX+UAAsunYf/09jlo6f1e0F5FX6pH0ftFwMNwcsxRHLoLn2hAvz3KnlQq2KK0QAesZYPODVQdtdd5+qcL3rwmXzWYSsvDD8JAcJFGtcYn+fA+YPQMWgZ0avqTfW3qiauy2WRI8+RkBXl9dmTuAnoxauaLI9BIBYGI2BEH8c/oeNL4dIWqKK2H9KPxhhINaCUPA+ny/eBXzUdjqq6GRuWFPNTBPl5pRVrcoTL3Wnk2mSrPy54O241RXP7AS435MWYqoperKVnFzbQ+YDZFh+lrN/DJhdEJZgdfnx4XFYuhKKhKJgwmwh+KMWDU2/Z2rP3BGihKJe2+ceG2dqsLszpkopry1thgfa605WQxLGRR5eaZPN8965yFjIrZOd+b8KK3hU5T7nqYEC/bLZcaUu9ogUNrXQG7CY1kwdkMHrRxqlA3D8etpwaB2IdLzm7p/+QmrAzTf+48OhpbRWpOpwtMf1/FOxxyqrhZEoRRAWNDb1TOlji9OzOskZQzOmAD1RvW1Sj26j7AdVyWN0KU0Tt1s91x6zXGFRRC32YvI9OHXbpIg1AdFkuuGXbE54JNsrQoz7XMCEk+AqRN7EJwb1g7FUrukZUN1L5uLDHZ76a+61aQLYfNnZZF3DHe+hRKVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(5023799004)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk9OOVV6eTdiT1ZtMFhzSGxnMFJBbllqdWx6Rkk2M1dhU0lkUTJOS1VVejNO?=
 =?utf-8?B?aFcwR044VDRCSmpNVnVDRGVuUG5aeXRxRHYwcHBscHIvOFg5dHY1NTNsOE9G?=
 =?utf-8?B?RzB6a2tIV1A2NlpjWmF3UitIaXFCMmpHb3RuUEhzTXVVWS95QnVHeGtpRHhz?=
 =?utf-8?B?L1daWWFyRDVuQ05xMmljWkQwVGVDSGVZZU5uYVUxR0gramxqbWszenBYNWo3?=
 =?utf-8?B?cVpTTW5XazNYTlIrWThuYjBvdUlhYTNvcFptMDlOREdPbUlZeTExdjJqTUNP?=
 =?utf-8?B?V1RvUTVscTg0dG1maCtwaHRqZnFod0JmZ0Zhb2hqeUp2cDM0UE1NcHlsZ3N0?=
 =?utf-8?B?YWl2bjl3Zm1sUXdxTGtTYVkrbk1yNitnSGhDUEgrYk1nQlBQZnFxTXJMcHNU?=
 =?utf-8?B?OHozbDBLTWJYWlBqRU1INXNaMGFDRSt5L1hNeDQ0NHhNcitrcG1IMGVHZlhz?=
 =?utf-8?B?QStlTnkwWFkyS0lvQlJGbi85NlVmL3BPWkJWbks5S0VFMXpkRGRFemVEbDVL?=
 =?utf-8?B?M2QrellIbktSczh2bXZaS2FDRytMUi9IaHVFWjdXa3J4YnJoN01WTGJpV3dC?=
 =?utf-8?B?TTh4azNGNXhZTTNOL3RSZU1GOVZFZy8zbW9lNi9SSGFYUGgwZUFsN2Y3aHdX?=
 =?utf-8?B?bWdESFVrNGdWRmlOelg1WnBhb1FYazBDSEVSMmt4NzRzTmVUKzNuNlpwbDdS?=
 =?utf-8?B?UFB1WXR3QUZRcW43eXdQNGJrNGt3YkRkUW8yYitsOXdxQWhyNmFGMGlnazQ4?=
 =?utf-8?B?eDd6MHcwK0FYdmhqZFhML1dUUHJiSjJZNGZobE5WOW4vNnRnWXdJcXE5Sm5x?=
 =?utf-8?B?SHM4WkgvelVLRVJIbFVvb0RyL09GcUpSblhSc0dpTUJGamhKTEM1Qkp4NWc3?=
 =?utf-8?B?aCt0YjliYWptR256RXR6OHB3RlBmaXpsOHhYZUxISURReXkvc3RvUy9GblBu?=
 =?utf-8?B?b3ZPV1o2Zk1aRlRJU0xPRUdJRlNlMGVmU3RlWkRoSGtBMTFTdjJNV01ZTUs3?=
 =?utf-8?B?SUx6STB3aXY5cGlaQXgxVDAxcXRINnhUZzVQRkVIZDJ1NlRVZXAxR1dteGp2?=
 =?utf-8?B?aVgwYVc0ZGNReVNyZ3NZNlVWZldBZndGNHVQMXMwS3V1c0ZQdDlTVWM3T3c3?=
 =?utf-8?B?Y25vQUVnRVkyNGlEK1VoQ3NBVjN0M3BBazVNMS8veWE1alJmd2lUNjNobFFP?=
 =?utf-8?B?MjZ2TGtaQ3RPV21mOFBvRTk2b2hyTWVpNy9qMm13bk1JNmlkaC9vR0tlS0do?=
 =?utf-8?B?dkx0c3FjTm55THYzbno0Q29ZT0JhajMwTjA2emtEanZIbk43SVNyTmxHZU5Y?=
 =?utf-8?B?c20wc29LcGpvQ1pJUGpyOHpPWEljWEQ3UVM0bjJwUWNiNjI3Q3htU2lQaWRi?=
 =?utf-8?B?NVZwM0YvT2cyd1RGd2FMZnJJZXRub01iaGhYWkw3MG1jTG0xeGt4QmxoRGNj?=
 =?utf-8?B?c21uRWtzZFpMWjhZMzNZWFY5VDFDVmQzdEN4UTJydjQwUFA2WHloSXJHTFZv?=
 =?utf-8?B?a0E3bHRTYzZxZ3h1MUt2b3FLVGVabW1waTNFVmpOK3NHUmdFQVdHd2VpcmtH?=
 =?utf-8?B?ZVBFNGtWYjNNd0NCdFNaOWovQTRySWJBSEsxU2dPU1JYV0tid1lWaFFQK2o1?=
 =?utf-8?B?cVlZVWJHNnRhSjdBUFYrRk9BYTFFbHpxM0FyQ3VreWw1aUtsMm5PbCswajFt?=
 =?utf-8?B?V08vTU9wTzZ5eDcvcWFValpLdStmRHhIaHZubFR6WHkwSzdxeEVob3pzZk5k?=
 =?utf-8?B?eEZmQlBxNFZGRHZ3RWdRc0Z0dG8rZEh4N29GcVhrc29CL0U4NjRFL3JHbnFN?=
 =?utf-8?B?czJwWmk0YWN4anBOY3VUc1NMb0pDQkwxdDJ6UnYrWFl3WG1Sc0lxbzBQTjZp?=
 =?utf-8?B?Ni94K1o2QU1xVUVNSmZMUElSZ094NmEwR2Rjb0dWaFJYM0xGWFdEN0ZDNytz?=
 =?utf-8?B?NWhpai9GN2xEaS9xRHJTTzlaaTJxOCtQQ3Q1V29VRWpyWm1WTjNuWnJ0aDFz?=
 =?utf-8?B?Kzc1Rmk4eVdndGxsZVd2U3UwYmF2K3FnYTlkcFFiUUJJcXU2TE5QTDVOajBP?=
 =?utf-8?B?dXJJQ3BSbTZsTTIwL0M4YmRkMnJsY0FNUEVraW51N0ZzWUtSUFc0bnhKYTRN?=
 =?utf-8?B?b1R2QWJiQVl5WCtCdElQUThMUldTOXg1Y1Ywak43TFdUNFFVSjR3MVRpN2cx?=
 =?utf-8?B?VzlIZytSODZmclU0czdTSTVmcHZuY3VJY0Z1RExQdjF2Q3djN3hsUFU3Z0J5?=
 =?utf-8?B?M1pYYjBqVy9Db1pZWHI2Rjd6WmVIYklrQjlNcWxlSDFWeHUyZS9OcVRaOFh4?=
 =?utf-8?B?RE5nOTVkVGY2dGdjZElyOTVLREYrMmNCZStxK2NMdldyRXhJZDYxdm90YnJy?=
 =?utf-8?Q?Ped0keKbZ8s6JPJU=3D?=
X-Exchange-RoutingPolicyChecked: TUI85bIji7lifD88rxhTnSvWki+0jluebRnSBdvz3DROGwghMtgFM5fuQebW0kz1yxZ1Hyc+P4/00IGU4T84rF4I6RqdQafqw4AB1KJCoBROAl5DEZDF3rekij+/M0QWwy3OuJTg9OI0n08MMEkn4mqXgxoD/DRoWGehONY3M9i05bLOia5F2FHaCII+euCP8BFNg7So1ZjZ5bHU1WmaGSfgU1k42OT6dP8HqxFxdXHYQu3Q0ekAgbbWCoR3zELeiPE1CO5OdI1YCdKmYcxkMX80WK3fmvHoXwvoXw9cAMFgzwg+q+yfk0O+6iM0VWTyI6TfhCHjmJ1NOCl8a+VMQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f87c364-20f1-4d24-3d79-08ded282e22b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:27:51.6302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LG3nARvCAljtIv/Me0gmFHOs/DN5BurZ+1F/+by88fvTH8hRIBeWMF2Ymci7oZDb8oPDVVSYXXnoZZVgdrwnQzluTmyBn05riyYwBM8a9xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Sebastian,

[...]

> +
> +/*
> + * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
> + * The type is used as an opaque pointer; this stub always returns -1.
> + */
> +struct pci_device;
> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
>  
>  /* Stub for igt_log, this stub will simply print the msg on stderr device.
>   * Domain and log level are ignored.
> @@ -49,3 +66,53 @@ void __igt_fail_assert(const char *domain, const char *file,
>  		func, assertion);
>  	exit(1);
>  }
> +
> +void __igt_skip_check(const char *file, const int line,
> +		      const char *func, const char *check, const char *format, ...)
> +{
> +	fprintf(stderr, "%s: %d %s Skipped: %s", file, line, func, check);
> +	if (format) {
> +		va_list args;
> +
> +		fprintf(stderr, ": ");
> +		va_start(args, format);
> +		vfprintf(stderr, format, args);
> +		va_end(args);
> +	}
> +	fprintf(stderr, "\n");
> +	exit(77);
> +}
> +
> +/* Stub: tools use exit(0) rather than the full igt teardown sequence. */
Please unify the commenting style in this file. Either use
"Stub for <func_name>" prefix or  "Stub: " that you introduced
in this patch for all the comments. Also, existing annotations
are separated from declarations with a newline - you could
address that as well.

> +__noreturn void igt_exit(void)
> +{
> +	exit(0);
> +}
> +
> +/* Stub: open a debugfs entry for a DRM device directly by path.
> + * device == -1 follows the igt_debugfs_path() convention of defaulting to
> + * the first DRM device (dri/0).  When a valid fd is given, the DRM minor is
> + * resolved via fstat() so the correct dri/<minor> directory is used.
> + */
> +int igt_debugfs_open(int device, const char *filename, int mode)
> +{
> +	char path[PATH_MAX];
> +	int drm_minor = 0;
> +
> +	if (device >= 0) {
> +		struct stat st;
> +
> +		if (fstat(device, &st) == 0 && S_ISCHR(st.st_mode))
> +			drm_minor = minor(st.st_rdev);
> +	}
> +
> +	snprintf(path, sizeof(path),
> +		 "/sys/kernel/debug/dri/%d/%s", drm_minor, filename);
> +	return open(path, mode);
> +}
> +
> +/* Stub: in tool context the driver keeps the GPU awake; no forcewake needed. */
> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
> +{
> +	return -1;
> +}
> -- 
> 2.53.0
> 

-- 
Best Regards,
Krzysztof
