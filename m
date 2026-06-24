Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900AECDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 14:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB9E10E0B1;
	Wed, 24 Jun 2026 14:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFKaZWPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375A10EF6A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782310341; x=1813846341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r5m6yV8VxQXvLgnGcKWfO7Qi7xAe5XFr7QemgjXvaz4=;
 b=KFKaZWPHFRDESG7sEGtCvDrbizr0fqSHXAtsWIZXgUaRz9xsfZshnd76
 NKdUtsDVoTDKJkHweIFX6qJOT0hPaAjelmOqvhsd0dI0RTJ5NAs/N1pzX
 N2B8UU6eRhMDusJ1rss1i/N8o4MF3K6zRI6iluiyzLNZcDw9fEqi/X3FG
 Qyl99vFD1Worj0hoaQqsdoQ/IcyusGezIZwHDQW+387eMgZIsfZAh0Hr7
 dlhQRLcDibK9c4TXdC+M6hCSZeAe7VV1ReaMsoLo0A2tFKSL9dij6DN0/
 9wet1aZ7BpYzVIJpH5vYLA/QPNLhIaVYDJkq4sEOVg/xt4nKxUcKa8kE3 g==;
X-CSE-ConnectionGUID: LqZzSRAYT6m+1AUxUcDjgA==
X-CSE-MsgGUID: YVxx451zTeePCx0qnM9tlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86977215"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86977215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:12:20 -0700
X-CSE-ConnectionGUID: zupSNp+DQIask8Y4JcyN0w==
X-CSE-MsgGUID: xzpKONE3SWahTmbfLpgYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="243505241"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:12:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 07:12:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 07:12:20 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 07:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/vh+lMAy/kaZNW/zH+9tlSnfD0UMXMrH9di1G3ps2SeOC+2xJ1mgAizCf8oPVdLDk5ccqV8uYSRjsLwSJJIv9pxHUUE2M2TQo3x9DBSbGUqTyxziE5oHuuxBw0LNcZOHUydKiipI6P1K2fiEBURdPnUmTYOE8EbIkD1zv8ZZ8wmDxyfV2yIG45VccOgV9jb0Fsykbq1naQyoHIDVokPzln3Mwz1AYxzZZ7JncURuDwTxZobT6fMLg9dkzpoOkBb65cBQRVBsAlZpb75+0En2R4YEyxRPHhfSyHgq1G+/v03Yic3iHk7EqzkhrSMP1iLQ7kEGi8/FGIhq3D64MwxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfUYhlAHRSYMJakpqoBIytcw6e46BurjMHwq6OGJkYI=;
 b=wprCYd+QO5Pp4xlMrG3i1ohJvEqVyn5Pgrhn6IDCFIdoUVkcOrD9hwbfhzyUlkQdPPpS8AOpAaov7PNIm59+BDHraaXOWXfqn7/R7pbW9JxmLO5sZNpYDirGfVjWs88DumgUn5DE2dGi5bUWV6w3lQhsKK4hVvOhv42cqdrq38uFTax3u4+K4OQGihm6SpY8+3t8vbL0rf0h9C6xSYhgO/YsMvTOuhBX4IX8DZsZysM29UjJzEHsx07YNLGMitDwiQGnScK6z0g1OZ2CBKFugyqCLzeuvhAOEZZr0XQoVKXKVNVfHhlYpmPB64CTyn0Ia0PrZIsq+fcamNFsPIgz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 14:12:14 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 14:12:14 +0000
Date: Wed, 24 Jun 2026 14:12:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 1/3] tests/dmabuf: Port dmabuf tests to KUnit
Message-ID: <hrvqbj7oz3finj4l2gyon2yupmnroqgigeesa55qzecopvdu4l@6ka4mphrdbcq>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
 <20260623200152.12996-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260623200152.12996-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: DUZPR01CA0150.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::7) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d572af3-8218-422d-882b-08ded1fa9742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|4143699003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 7FJONtACSAu+NwTaaz4YPPZWNAhgreVgBumRnVH4oMu30OOV366PuDnA8JiKEj0VNMJvQSEymQD+93gQVKUIIzLI2jcEVtwzPhMO4ihHzUxjMsoQMkoa9b7fZ4faJvWRvkmmFJ0Aawm8jWdkV1g45tkxyuzbkm/cbaNrT2REVO2QgaAyFhZzETmtSIsnBCVkDzvjTd/NGNJXW2rlFmtCeYrBJuXMKKXS/qFt3SPU1MZGud2xjfVs2mzETG3YKzq/jDfuB2VMNenbt7vi7IuHgRGgbVZO/adUPMZTCLZe9WL046A2tfcqMqqPTn94NFd/sx3uQTBqqu0s4+RrZYwi2D6vl9qOmE6h1QXjn3zMO7LBUUIaZPZ2Lk/lueEa3MBve+EhnnF00ihGJWhPDPQye3SGBik+iB4eUVWmiO9O0Bhsb5Qgla+UKh750JKd8Kk3jf/EedkexbNZSi1gV+ygjjfUbV2UWUZ+/5SMVtkhPyffWPh4kvcLCgcuOamUNLZmUzC1uhXqUvCHi8/xpWGbRIlcWz9QMTwcxvcsS/KQW3RN8VjlFjyYmK0SHkeblTM/QiHFn3Dwu0FjN9WtfEX07VVFCYsrglri/pVlIehVgl0IlgMpA3sGlyJy5WlJuP4+Mk/ACyfnE967HzCni71sl3sWFhEJQReUJxjQS5fYQgw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(4143699003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEtURWkrbThqRzBqTkFjYldSbFhsVnVLTkdqNFBVb0N1NVcvdWZ4NFFRbFh5?=
 =?utf-8?B?UEcveDE4WHRrN2hkUkxRYmN5ZkNsK2U0SklJYVZCUkRKNEkwWkJONHBSZjl3?=
 =?utf-8?B?eXRSNnhIMyt4N05rN0VrRVh3akdtencwYWlGS1A4VlBKbFhyczZiQXVKUjBY?=
 =?utf-8?B?SGMwVExCK3RXRHh1K2docStNdFFMK1ZrTVdib1BTY2t5a2dmUlNuWGdPT0lH?=
 =?utf-8?B?QndIcmpQbFFwS3hROWdzVUYxWGRzbGd4TlFNWWJCYmdEdG41cDJnRnZkemIv?=
 =?utf-8?B?OU9BWU5pRkpnUnpNQ1BwRVc1UWpBVEcyMGU4eDNScUtQZjFmVW82RUpxZHN0?=
 =?utf-8?B?UEV5dExxZmNYZzJpRTg2SzI5dXNjdFh1c3N2UFRtR1BOWk9BYjdTQ0YxZjl1?=
 =?utf-8?B?REVRRmptenhqZVpaMXV1VnBqekRiVXVxVW5hbWxTTDZQQi92UjFzTFBadkhB?=
 =?utf-8?B?eXlXdzk0TDJsZzgwM2UreXFBYVdOa1lycGtGVVBmUGNFY3hyNlpKU3BnSGFy?=
 =?utf-8?B?NkJaeHV5Zk10V3RwbVFwQ1YvZmNxaS9nN0pPd2U1VFYrYmorNzNkSGNYVFhF?=
 =?utf-8?B?WHh6TTM4RUdmNzdNaHBEQUhBU09neDh0RjFsalBuMnpzZW5ZNUlnVDR5blZM?=
 =?utf-8?B?a3p5blZIWUpkSEcxV0Jyc3pzNHZkSk9aaDV5Z051THhOTk8yNGt6U0M0ZElr?=
 =?utf-8?B?ZkF2L21TODN1V05YVDZ1VFh3SStHMkdaYTNrTzROL0EzZExUS0I5NUNodXg5?=
 =?utf-8?B?cVhtYnhOVGhTdTNGQS9RWEplYzhVUnRDRmxTVlBvQWhOcEpGWFJaUVJSdFVk?=
 =?utf-8?B?UW02Y1Jwc3EwTmRWVlRoV0g0NFFLME1ySkFVS3dzMEJ0c2J5WVo4SHlleE5T?=
 =?utf-8?B?Mjdram5hdjVzZzZmNzhyT3B6NlJiekxxdmtKc0dOcVJMWFhweFE4SU00cjRa?=
 =?utf-8?B?VEFMZGkyNk5HcEtlUnljTFY5NTZrMEZESUpSMVZKZDhnZDF1dzJoRlRsTU9L?=
 =?utf-8?B?bmRhMVVVdkk4MXMrLzlsYTREc0VEUGQzdkwzZ3lMb2NYak12d0I1cUM3WG8z?=
 =?utf-8?B?T1Y0ZzUvaFMrR3gwUEtQRmtNQ0x0cmd0Qm9EZlg2Rk90WjhkS3JYbE5JWmJ5?=
 =?utf-8?B?UVNUenZCcHVtQ2VvNStEUXM1ZE9VSTQ3NEdody9ZNi9kYzIyOTl1dFFRSWwv?=
 =?utf-8?B?Y3c2S2xmV3loeVEwcW9EdkZnUWNSZC9zU202aEd6M3FGemxTeFZLL0pXbHNX?=
 =?utf-8?B?TU5yZzI3NnhWd05XWDJGb0JJSW1VYjdIOWxVZUJjTjZvZUV4VTZzWUF4NVFD?=
 =?utf-8?B?eXY2bzY5bnQ3RXExOG16WGE0UU9sSTQvMWdDVXM0UGRPK0JZTFBtaFEvK0Fm?=
 =?utf-8?B?eXI0d0hUenhuYXRrNEFvV1dhYjFZN2dvdnNmVFM5Um9vWkVyc0psMDY5bFVm?=
 =?utf-8?B?TVc0ZmxKZ3lhUzJTbHBiazgwM2JCcGlwMkRRTkVZQTQvWlVESGlHbHhOUlgv?=
 =?utf-8?B?TG84d0g5ZU9icU1abVBYTldaMGswT0pYMkU1M2h0YjIvS3Y2YVMrL0x3ZlUy?=
 =?utf-8?B?Yy9SOEFzbC9MUUpIZmZmUS8waU45bU5IQXJVMG5DYWtSbVg5ZXBwSzV3eTRu?=
 =?utf-8?B?bWV6YzRmZk4rd1ZHZlFaN2N5enZOMmNFT1I1a2l1UTg2Mm41d3VHNHVOaXE5?=
 =?utf-8?B?UzE3VTJyM1phOTBhOGVFM0x1aVpRa3JKaHp5NVgyaytCVE5OMVo0TXAwNlhx?=
 =?utf-8?B?Y2Y5MGNDYjBpR0VELzJmUWtFejI2c3F6WVc0NEs4WHhwQ1hac2lFZmpZL1Qx?=
 =?utf-8?B?Vk1KTzd6MTIvZmd2dUpPdXVpRTRPOHF4a1RabzZITEJNeVYrVGgza0Jqc01t?=
 =?utf-8?B?VlBJME41Ky9mZEZraDBWYWFZUTdMOC9KWnczWkZMSkQ2S05xTTIzUUZmN1Bi?=
 =?utf-8?B?Z3RMa21IMjdtSmZWL20wYjNDVDRwdmFPbVh3cUw2MGZKNWorcFNtMUJwdlJh?=
 =?utf-8?B?ZUtrdlh1VWs3eWhsRXdMRzJWR29vTXg4eVhVQUFqWnY4QlR6OHYzKzFZRHJa?=
 =?utf-8?B?QkVBYXk5eWNOZ1pnM0lxZ1BHdTNETFA3V0R2ZDNmTS9UaXp1ZlBTODcyWU1r?=
 =?utf-8?B?WCtaMzkrV21yRDB6THd2bWJwa3RVandPa0NlOERVSVZSU2s5N0taZ3RQYXVw?=
 =?utf-8?B?cGkwS0hiQmhDb21yaFlYOHRvMjJhWEhWU1lVa2lNaThXclBLaThFUjVCaThp?=
 =?utf-8?B?WExpMjJuYS9IaWNlbm5heTQvdy9kWmFGbDhEdTZzNFZSU3dlWGhzVWx2TjNz?=
 =?utf-8?B?amFBdGhaYjFhLzVmVHJkWTd4Q2xCbHVnNDNtWVNKSVcxQ24rZkJ2cVBIWjlo?=
 =?utf-8?Q?211OmHKnv+SVDs5E=3D?=
X-Exchange-RoutingPolicyChecked: Ffzbn6ULjY46ftHZ4zwFNauqMHYybRRCnm7QSi3TzX2fLdK9mSDLYjEb467YEQ1+Q9Ihy5omXsMdSuBhZSilSSbJY1it/FbXkGij97hU1/5/JxgTXJqX6uiH/nT2U790U/DPyIsBg+S6bAYHNiewCkL2fux7ok1pORJxboqxSmCEGIrTzYYTSnQt0PmQC2g5ljmRMyoKqt9rdt8yCBlYyQDgnJGw9jCPSXdWojMxj5prmNVbYJOuhBN5BrSFQkmpMH5J39LWjOWGI2sEi1gEC43BVTCuTmJsvG+VmrFRj/LHEBYIJeW69OeZNvo0NXVd03OUKCf8dnADIq0083p4tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d572af3-8218-422d-882b-08ded1fa9742
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 14:12:14.4555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hytVfo5+1tygJyoWMqaSlxLafrPAft+E9+Uwbw/Hi40bfXpjZI78CK6opJHWMcT7rdB2kb4Rfk4+ee7n2ctyiJwOYelZkf5vrBGwNh0tyC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

Hi Krzysztof,

On 2026-06-23 at 22:01:50 +0200, Krzysztof Niemiec wrote:
> The dmabuf tests have been moved out of the selftest mechanism into
> KUnit in these commits in the kernel:
> 
> commit 126c50bc2fb6 ("dma-buf: Remove the old selftest")
> commit 6055c9e333cf ("dma-buf: Change st-dma-fence-chain.c to use kunit")
> commit 465f3934381c ("dma-buf: Change st-dma-fence-unwrap.c to use kunit")
> commit 9baa35a39939 ("dma-buf: Change st-dma-fence.c to use kunit")
> commit 15b9bde78bad ("dma-buf: Change st-dma-resv.c to use kunit")
> 
> Launch dmabuf tests as KUnit tests instead of selftests from IGT's side
> to reflect the kernel changes.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/dmabuf.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)

The change looks good:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
