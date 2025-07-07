Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE6FC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 14:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EBC10E4BA;
	Mon,  7 Jul 2025 14:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bq5NrODF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189D710E4BA
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751899422; x=1783435422;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u2eDSPkofYTNT1RkOwpbH9ETuM/2sxP2RQxbkHEFHOU=;
 b=bq5NrODF8YvvTF04CLAbkQ5e4gBnmGk32sBtNYaPtjSuKW3/Y4Af5vTM
 LHRDRv7bHWXvLghdS+mfaG2r70UcexwRSzFYx+7791ba0OctsBW1ba78F
 8azMqeW3Pdlkya/c58MZ8UhQL1iKUzgfNUVtTknlY2RWqSw7q/tQfQa0T
 GuC/eWXmDYW9ceU7+kvxlVI7AWuwhVPLly3t5cYcAgbFA8r1VIOHECAlR
 A1jvOYFskI3NTLRXCVTyLGGjy9ke26oAFOJl42+mX08UZ/O5KuV6T8+P3
 mnzf0GlPKBPynwctLcN+nywjdMB54VeXE/6alHUjbK9y6nlhEFtNe1zIZ w==;
X-CSE-ConnectionGUID: p7qljyGeQRSnnGNx7X+0iw==
X-CSE-MsgGUID: NMdJ/C/lSJutuaoePDN4Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54213414"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="54213414"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:43:41 -0700
X-CSE-ConnectionGUID: wxfWxNrxR+qkq0D8vAWEug==
X-CSE-MsgGUID: bOtRPYgHSXqcUfUE5azNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="186253290"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:43:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:43:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 07:43:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fl+sLSVz8GQs105RRcpMVk+khxOzAQEKqpqM2FMJpBiyj7Fy1kdavWNSv4xNvkDmQZWjIUpU6X8Nr5Hc58Br+6wRQxEElOP4mYuzjUYg25k4CYi9x9sP/nnMKzrt32D7qt4nmRkSqnbmfG7y9eJcosfoEVv5ghG8RZskRPaYE0UbVYJds25oELer2P0zeoyud7IQy53ifp1TcfcTOEdVxRDQ0j61lgQIoD5flIUiLZVVJyFYv989TI/8/g6MKWU5BxjdrRY2c7qqne2jskT+PAD3PSO68FJg/gdq4eHlH9HZmmk10xDoSTBeWBPtbinVoa9RxCT87QMfkPyjp6zhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmGrwDy0vDnN94uJtaQfVY4z0A5xafQ4E4KyOTz9bZI=;
 b=kLAs51uKWhi5YMmFeXIOnepxGafqFSioAkPyzwKDqZEv+FL/+4wwk8gc7IEHvdq/OYZSywjcBvkcrE2yuXqbEeU73gYF+7ZRYXcmJMsPbDQM/2snc2++by3IuMrBXpv/GjkrvnVgGXF1QOewfkHCJcTLCruthcfVgOh1pFq0lFmmAoGDf77UNUUJNMNfxrT5ynERRUFswVQreXNs7ZGkeyRqliYgb478D7QQoYY/uBGXCRTYNtBGG2m4YnqScDK6KJ4RKTqmV4N0xlsTiUqXYSa8MKeY0BAHrK5jSoNzEkHwYiINZqh7mYn0OEvofg1pC1zptLzxjosY4aHAoPJLEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 14:43:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 14:43:32 +0000
Date: Mon, 7 Jul 2025 10:43:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <marcin.bernatowicz@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>, <zbigniew.kempczynski@intel.com>,
 <ewelina.musial@intel.com>
Subject: Re: [PATCH v3 resend i-g-t 5/6] tests: Add xe_debugfs
Message-ID: <aGvdEGG5hdLLIfU7@intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-6-peter.senna@linux.intel.com>
 <aGbpyhgv6AwZ41Sm@intel.com>
 <81885310-1ccf-4d0e-9ec2-606807c5a185@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81885310-1ccf-4d0e-9ec2-606807c5a185@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a74f40-81a1-4cf9-78b7-08ddbd64a52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?W1OvL4hB3F+8d2vz4UXeZzDCFB/QvdRNqocROkXG6J+r5P09EmFBV4KZU0?=
 =?iso-8859-1?Q?wWcxdUcvC3Ga8b3iEYgri1dytKpKN0UXt96JHhMUnZUmAe3gj3DTD0TUbX?=
 =?iso-8859-1?Q?+8h9SZo9LD/o7t5kPD3lGAHkHECp7o1dY+rO8lhBUgBEIOG3erdrAh+8+l?=
 =?iso-8859-1?Q?5L88G7wgW3lzd7XYA9asGcbRELUdEW15v9a3DgLXoi9/EEuxgo6Pp9Hv+3?=
 =?iso-8859-1?Q?2/kjfGxNYjN8/3TJDpgwrNOADqJmcx2s28iOFRQn39BLE2Y3OQS1quYm+f?=
 =?iso-8859-1?Q?PyU4obmtyUh6AmpqZ1mkXu0NC9qmW1PeBlaWLxff6CAo+WY524V0/VJflB?=
 =?iso-8859-1?Q?RpkOwfB/+V5FdGLLJ45Tx91uc1s0FGT5Tj3NvSHBCqCdNr+MXqoo1s0bNx?=
 =?iso-8859-1?Q?3VylsljXLw0/x7bj81uFSwzdTBRcC1ApKgx+U/8wXAaaaY9FflENB4sDXs?=
 =?iso-8859-1?Q?ZwWlBxGeBWbSO3Me95XOCRQGKLWUh9/UDF2tUyT9uIDJDEVIkFeQG621mP?=
 =?iso-8859-1?Q?y5O6JTwLs1h3p3WL4aJJRqDffDnEeeYjK2gDygSf33y2R8BLs6ClS30x38?=
 =?iso-8859-1?Q?ttdnbct9DoiNyNyITglk/eO21+qoojnlF9f83rtcc1WCpSfaIV2GRMz/Fq?=
 =?iso-8859-1?Q?fjB/qPZzNgKfpaKUxmhlfkqGShhCF9uyKIIrYAO1XX9zHJisbPyX/I4aOi?=
 =?iso-8859-1?Q?ahklxcKhWT4c0fDm6ywPpcI5P3KjXvcp54l1COxqh6WgQSzb+5r6UJITGv?=
 =?iso-8859-1?Q?A2HCO0KHQght+meAGSgNZQYqQrbSx1/jBMfCQ5ZmVTMIpWjVfoNKPO5n0B?=
 =?iso-8859-1?Q?rzVhZme3hs927BwSwoJZmmS8AXmTqkvZU+XwIzBGp41DNlTxfzk7x7ZLA6?=
 =?iso-8859-1?Q?nBL93z0IIZADmmE81rJ0PVmzxUlb83DBrkUMTsvE/xfzVt24pQVykpr6oE?=
 =?iso-8859-1?Q?oCyMAJgElk0UWnrRD/ojbqpdw+YieNsr2hjec3/WdcRbj4e43jai+f6uqi?=
 =?iso-8859-1?Q?mUyFFhKwWi7NSvSs5RXfSaZX2GzM0UTTXeveaDiftiMjJsl5Tm9WJblwgU?=
 =?iso-8859-1?Q?BH4y3lRMVnfHZ0YUTgjtzL5gqHQBNoWyVPku5+W3EPjoqcCjIGSYwRV1Do?=
 =?iso-8859-1?Q?YiYpf6tTY8t0zhM4OIohNtigIq72WKqbV8t5PR0CcK6u6Dt8ilRB8uEYuQ?=
 =?iso-8859-1?Q?xPEf1HnZhcARK6wHWpBxhTZiQTyHrP2ynpfyZmj1dzgA7swnaLz3+Tk8Kd?=
 =?iso-8859-1?Q?rGiIjD10jCKwbmJ4ttuBc/jqBHl14Uyo/tl9uUNcqQbM0Vg5WjDT1ZVIgH?=
 =?iso-8859-1?Q?sPZOSNa1y1sg0NJC0Y/+CICYA9e0okMjaXimI/EQO1CcGv7dHgc4BxmXmP?=
 =?iso-8859-1?Q?rLTa7F2SEz0VagAApydF8Tm9RnMyvsSA5vS55aHRsrPYIneCMhqK7ibo+m?=
 =?iso-8859-1?Q?uVMUt34EUiv5Mbdyefw6z1b5Tm7ULRHitjVoRUBJcZlKAkMLU89VPB8jWk?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mAY6KegjPYrPaE6uxP2elbrkct0rK7hnT8fIwubjH7k6G2LsymfOxd8mw0?=
 =?iso-8859-1?Q?EM7Q7tmDPAvrsK33/8oRfDHxy7r37cW8ZMsmr5HuQihh8fT4mRR06RxWVn?=
 =?iso-8859-1?Q?Xi0/uqFHdlBUQDYiyoEdGckPRxysTmNtsCYrGJoY7x40GvTiPZYfbmSiRY?=
 =?iso-8859-1?Q?3jiuqoUT5sYV/MO15yrqk20S9PM0XP4s4P079aa7bCuqeeXXFCZWSsg8mq?=
 =?iso-8859-1?Q?prwvbq+oDdsSqQYL/ncGiAx5j2NYeFUVT9LatLptjP5sMk/f00MBq6We9P?=
 =?iso-8859-1?Q?D4FQlse+fvQClqYjitgd9BP9uR+Xph8j4g8bcvrala1uMwTxVJdcIT4UOK?=
 =?iso-8859-1?Q?HRFu+X2XhB7wkUW/YDPBoUnk7fXviUeuY304cz4XQhwBGwhWKP0WgsjlOA?=
 =?iso-8859-1?Q?w5RTUn/TRGcLpPn3hgvxwPtmjqItarH6ZtoGG3ltyP2nuoLNCk8qXYcrKU?=
 =?iso-8859-1?Q?/OsGyvbZw1g/PkB+/zb5hK+lnOATVuocipsZkJ5R/VAO455OpRK8G3Z631?=
 =?iso-8859-1?Q?bTFX/P12MoJ7bn7wN/DMBH4fSZiNmup1qFUI7GxxQu1V7F8kHLfqYJ8j9+?=
 =?iso-8859-1?Q?pTvmN7VvWfBpXj87Q2cKZsUl/DJY1zl1dOl4HWTD8SLhtup9HDcrC/lgJw?=
 =?iso-8859-1?Q?wI031s5+2OUtdAVn5+U87E2S3I32NGkDJNmKQbzOAgCEJj+fPaJb5Qu09H?=
 =?iso-8859-1?Q?1tONTFAB4aBrjByceqoBpt2zS3XGEjeZaGYutOgVUbMZQj1D+NZcjlb83v?=
 =?iso-8859-1?Q?DAnLBhb4EKxvc2w7ZcqKrrjMVqlXddbjaDdfPuolvsgmZsnhPN6+UHUscg?=
 =?iso-8859-1?Q?SS7elH+feqjkpS0l0bzr1VJvhxDxIWRX1FfWZ9yrlSmzpzgzoqK8LJN3uN?=
 =?iso-8859-1?Q?d9vg6++8/8WxVtZHgBUolGVcPyWtTnJ+6FavD8DG2DusAlNQV4OmfNXqnU?=
 =?iso-8859-1?Q?uvSC29r+aInZIWy47eEkOPq7Bw9CkDttP2KiMNMNMX/uIBQvzHgZhBUAW4?=
 =?iso-8859-1?Q?6W82oSM1zDDiXLcqVvxn6aToPj6jYGPoILFDqMdZchY4Ob04+1+mJQjnUr?=
 =?iso-8859-1?Q?EY6AqcYwIC8tGgs6bypzxFZrqsMiCAqcaVFuoJKjjnQYwq0lR4f5cgPXtO?=
 =?iso-8859-1?Q?u7uJIuI7qTWQ7zwuCHIft6m91eKpNdO9kowrhseIe6pi5xnSjeyyLtyCiG?=
 =?iso-8859-1?Q?dKhEz+OLIYQzkvvk6u6PAq+caDmIyEiZP6STZmeLnJAYCjTX/L0fFjqAKH?=
 =?iso-8859-1?Q?xgf8JmNPLvgujeE0mXtYMowvFcV5RjXMBvD+qkV0IZjny3xxnP12xdHqms?=
 =?iso-8859-1?Q?RjT/Xa/6Mp6NDGmnV/x5vlO3Eti+uFLqYHEbAFSlF5OJblPpBg+/xsW5jP?=
 =?iso-8859-1?Q?5eG1yBhekApziVYg5RZxkGwWFPJdbOy2JRvIsJFyQU7sddS7s/7li0gEhs?=
 =?iso-8859-1?Q?uWvu5Jhh0lEvs2HXJ70c1XYJWcweTJcZzrfxweYN9HOtEyy1X80+jYlhyt?=
 =?iso-8859-1?Q?eViDbOGMWa/jxskYNjK6AindpJ3JmPGD8Hz/2JnKJk+SzBdp2JGJBBLPQg?=
 =?iso-8859-1?Q?FSfz8wsUj0pFJuOOME/LQcsJd4DEcT7kWAJBzcl+KZkNi318xUlfj9OyNk?=
 =?iso-8859-1?Q?JYW65YgRQYOlalnzo3qkWhb1WC3f7qC8xm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a74f40-81a1-4cf9-78b7-08ddbd64a52c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 14:43:32.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfQeHJ8KVQRKn1msyfT9ljUrHe95cAGK7XQUPEypBUFLriWYiWJYCAJ8TmBNTEO4Sy15r/oI58k8iN466mMcgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
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

On Fri, Jul 04, 2025 at 11:06:15AM +0200, Peter Senna Tschudin wrote:
> 
> 
> On 7/3/2025 10:36 PM, Rodrigo Vivi wrote:
> > On Mon, Jun 16, 2025 at 09:42:37AM +0200, Peter Senna Tschudin wrote:
> >> xe_debugfs is a test specific to Xe GPUs. It is intended to complement
> >> the existing generic debugfs tests core_debugfs and
> >> core_debugfs_display_on_off.
> >>
> >> Additionally, this test has been updated to use the igt_dir
> >> infrastructure, resulting in simpler code.
> >>
> >> Cc: michal.wajdeczko@intel.com
> >> Cc: marcin.bernatowicz@intel.com
> >> Cc: kamil.konieczny@linux.intel.com
> >> Cc: katarzyna.piecielska@intel.com
> >> Cc: zbigniew.kempczynski@intel.com
> >> Cc: ewelina.musial@intel.com
> >> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> >> ---
> >> v3:
> >>  - unchanged from v2
> >> v2:
> >>  - changed style of comparison to NULL
> >>
> >>  tests/intel-ci/xe-fast-feedback.testlist |   2 +
> >>  tests/intel/xe_debugfs.c                 | 208 +++++++++++++++++++++++
> >>  tests/meson.build                        |   1 +
> >>  3 files changed, 211 insertions(+)
> >>  create mode 100644 tests/intel/xe_debugfs.c
> >>
> >> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> >> index a5f799f6b..c52f08953 100644
> >> --- a/tests/intel-ci/xe-fast-feedback.testlist
> >> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> >> @@ -78,6 +78,8 @@ igt@xe_create@create-execqueues-noleak
> >>  igt@xe_create@create-execqueues-leak
> >>  igt@xe_create@create-invalid-mbz
> >>  igt@xe_create@create-massive-size
> >> +igt@xe_debugfs@xe-base
> >> +igt@xe_debugfs@xe-forcewake
> >>  igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
> >>  igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
> >>  igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
> >> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> >> new file mode 100644
> >> index 000000000..66a5fa0f6
> >> --- /dev/null
> >> +++ b/tests/intel/xe_debugfs.c
> >> @@ -0,0 +1,208 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2025 Intel Corporation
> >> + */
> >> +
> >> +#include <dirent.h>
> >> +#include <fcntl.h>
> >> +
> >> +#include "igt.h"
> >> +#include "igt_debugfs.h"
> >> +#include "igt_dir.h"
> >> +#include "igt_sysfs.h"
> >> +#include "xe/xe_query.h"
> >> +
> >> +
> >> +struct {
> >> +	bool warn_on_not_hit;
> >> +} opt = { 0 };
> >> +
> >> +/**
> >> + * TEST: Xe debugfs test
> >> + * Description: Xe-specific debugfs tests. These are complementary to the
> >> + * core_debugfs and core_debugfs_display_on_off tests.
> >> + *
> >> + * Category: Core
> >> + * Mega feature: General Core features
> >> + * Sub-category: uapi
> >> + * Functionality: debugfs
> >> + * Feature: core
> >> + * Test category: uapi
> >> + *
> >> + */
> >> +
> >> +IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
> >> +
> >> +static int xe_validate_entries(igt_dir_t *igt_dir,
> >> +			       const char * const str_val[], int str_cnt)
> >> +{
> >> +	igt_dir_file_list_t *file_list_entry;
> >> +
> >> +	if (!igt_dir)
> >> +		return -1;
> >> +
> >> +	igt_dir_scan_dirfd(igt_dir, -1);
> >> +
> >> +	for (int i = 0; i < str_cnt; i++) {
> >> +		int hit = 0;
> >> +
> >> +		igt_list_for_each_entry(file_list_entry,
> >> +					&igt_dir->file_list_head, link) {
> >> +			if (strcmp(file_list_entry->relative_path,
> >> +				   str_val[i]) == 0) {
> >> +				hit = 1;
> >> +				break;
> >> +			}
> >> +		}
> >> +
> >> +		if (!hit && opt.warn_on_not_hit)
> >> +			igt_warn("no test for: %s\n", str_val[i]);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +/**
> >> + * SUBTEST: xe-base
> >> + * Description: Check if various debugfs devnodes exist and test reading them
> >> + */
> >> +static void
> >> +xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
> >> +{
> >> +	uint16_t devid = intel_get_drm_devid(fd);
> >> +	static const char * const expected_files[] = {
> >> +		"gt0",
> >> +		"gt1",
> >> +		"stolen_mm",
> >> +		"gtt_mm",
> >> +		"vram0_mm",
> >> +		"forcewake_all",
> >> +		"info",
> >> +		"gem_names",
> >> +		"clients",
> >> +		"name"
> >> +	};
> >> +	char reference[4096];
> >> +	int val = 0;
> >> +
> >> +	igt_assert(config);
> >> +	sprintf(reference, "devid 0x%llx",
> >> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
> >> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> >> +
> >> +	sprintf(reference, "revid %lld",
> >> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
> >> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> >> +
> >> +	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> >> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
> >> +
> >> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> >> +
> >> +	if (intel_gen(devid) < 20) {
> >> +		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
> >> +		case 48:
> >> +			val = 3;
> >> +			break;
> >> +		case 57:
> >> +			val = 4;
> >> +			break;
> >> +		}
> >> +
> >> +		sprintf(reference, "vm_max_level %d", val);
> >> +		igt_assert(igt_debugfs_search(fd, "info", reference));
> >> +	}
> >> +
> >> +	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
> >> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> >> +
> >> +	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
> >> +
> >> +	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
> >> +	igt_debugfs_dump(fd, "gtt_mm");
> >> +
> >> +	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
> >> +		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
> >> +		igt_debugfs_dump(fd, "vram0_mm");
> >> +	}
> >> +
> >> +	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
> >> +		igt_debugfs_dump(fd, "stolen_mm");
> >> +
> >> +	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
> >> +	igt_debugfs_dump(fd, "clients");
> >> +
> >> +	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
> >> +	igt_debugfs_dump(fd, "gem_names");
> >> +
> >> +	xe_validate_entries(igt_dir, expected_files,
> >> +			    ARRAY_SIZE(expected_files));
> >> +}
> >> +
> >> +/**
> >> + * SUBTEST: xe-forcewake
> >> + * Description: Check forcewake debugfs devnode
> >> + */
> >> +static void
> >> +xe_test_forcewake(int fd)
> >> +{
> >> +	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
> > 
> > What I don't see here is how do we avoid the forcewake_all to be read
> > in the other test? Or that doesn't matter there?
> 
> There is a recent kernel change that I forgot about. Now the kernel
> requires opening the files for write to trigger a GPU reset.
> 
> The core_ tests only attempt to open files for reading using O_RDONLY.
> This should no longer trigger resets in the GPU. So I guess that from
> the Xe perspective, we are actually good to go trying to open all files
> for reading.

Okay then, let's go like this

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> >> +
> >> +	igt_assert_neq(handle, -1);
> >> +	close(handle);
> >> +}
> >> +
> >> +const char *help_str =
> >> +	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
> >> +
> >> +struct option long_options[] = {
> >> +	{ "--warn-not-hit", no_argument, NULL, 'w'},
> >> +	{ 0, 0, 0, 0 }
> >> +};
> >> +
> >> +static int opt_handler(int option, int option_index, void *input)
> >> +{
> >> +	switch (option) {
> >> +	case 'w':
> >> +		opt.warn_on_not_hit = true;
> > 
> > what about make this the default?
> > 
> >> +		break;
> >> +	default:
> >> +		return IGT_OPT_HANDLER_ERROR;
> >> +	}
> >> +
> >> +	return IGT_OPT_HANDLER_SUCCESS;
> >> +}
> >> +
> >> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> >> +{
> >> +	int debugfs = -1;
> >> +	int fd = -1;
> >> +	igt_dir_t *igt_dir = NULL;
> >> +
> >> +	igt_fixture {
> >> +		fd = drm_open_driver_master(DRIVER_XE);
> >> +		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
> >> +		debugfs = igt_debugfs_dir(fd);
> >> +
> >> +		igt_dir = igt_dir_create(debugfs);
> >> +		igt_require(igt_dir);
> >> +
> >> +		kmstest_set_vt_graphics_mode();
> >> +	}
> >> +
> >> +	igt_describe("Check if various debugfs devnodes exist and test reading them.");
> >> +	igt_subtest("xe-base") {
> >> +		xe_test_base(fd, xe_config(fd), igt_dir);
> >> +	}
> >> +
> >> +	igt_describe("Check forcewake debugfs devnode");
> >> +	igt_subtest("xe-forcewake") {
> >> +		xe_test_forcewake(fd);
> >> +	}
> >> +
> >> +	igt_fixture {
> >> +		igt_dir_destroy(igt_dir);
> >> +		close(debugfs);
> >> +		drm_close_driver(fd);
> >> +	}
> >> +}
> >> diff --git a/tests/meson.build b/tests/meson.build
> >> index a06172d2e..847598255 100644
> >> --- a/tests/meson.build
> >> +++ b/tests/meson.build
> >> @@ -283,6 +283,7 @@ intel_xe_progs = [
> >>  	'xe_compute_preempt',
> >>  	'xe_copy_basic',
> >>  	'xe_configfs',
> >> +	'xe_debugfs',
> >>  	'xe_dma_buf_sync',
> >>  	'xe_drm_fdinfo',
> >>  	'xe_eu_stall',
> >> -- 
> >> 2.43.0
> >>
> 
