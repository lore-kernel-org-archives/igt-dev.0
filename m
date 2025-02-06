Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E94C02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 17:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0401910E8EA;
	Thu,  6 Feb 2025 17:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnAoYa2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D396510E8EA
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738861616; x=1770397616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q+tXs8pD4kTCu3H+vRk6UM5UR5tD/NjVOp3DCTATxuU=;
 b=LnAoYa2C/EUrpU6i9uixOgq6u1TYDLTU9k7VCcbeNlaxMgjwLKVm2Lb4
 BS8opHmSRzElfcAM9elATzqRGII62DvgThNwnGADGhz9fLWZbW/tozSyv
 ogttZyKOLZuJ6ffPSIKqP3l6FHzwcLSBjzC/r2Qp5ACYoF8OsqsLz7WVY
 Pj+LqraCoUsgGPaDBT4+ayk1Oh6tTW+zZ3Be6S8lKRfHAYB+phRsMUfTv
 GpTxIkQ/tUY3rm3oqskllpdYOs33M2jDFZNUmyIiizAH0P272eZPYeYn6
 jpOoLU7cjQj+M3tnxl7utHKuQWWqF7siP/4ZWfW0qxcVtQlD0pNzjyWhj g==;
X-CSE-ConnectionGUID: uxwCYXpPRCOIy+ZOWWVjkQ==
X-CSE-MsgGUID: Gu7r7kuWQN6rfNflxmRwfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50114334"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="50114334"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 09:06:40 -0800
X-CSE-ConnectionGUID: 4wq4WsTmRC6YfRGpAvYu9A==
X-CSE-MsgGUID: MPbhnUG+TaqaWwRJPTTWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115878730"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 09:06:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 09:06:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 09:06:39 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 09:06:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8hpeqVD/zWDigC84RgieRdOa9Rbv8cXBADV0/jGG7lIQ2osGqyNr0kJCeSjpKvwY8bIvaUqAi03ISJMslHN3MJeI70YlagGa1pd3F8TYiTYC6j4oNHBwxVJUlctI+e4bTe2FkAgXIcAoyjA4mF6aWzJ01P1hOPwL8WLvi0EsAMtbJh7mWdTQs1UAslzf63S3ubemBKjDdpKZGZnJxwbiOW9xNf/fd0o6V8PRe6dPxIaHW/jUKq787a5reG4WUWTyad9NvB/MEJ4zezWNKOAJAtr+hwdgr/R7Yc7ttJWEzwWoa9RCmSXm5McRWIlFP2HE6v+37o4659uZ5dWmX/xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+xkSOGuygtca0JiDySaIhiDFA8l56v2sQUTl09S8T0=;
 b=NF28CtQuRGWqQdLlZGTkshwQFG49VhIFNUeU35Qel1Jj4k5dHlYIbch3Wj+pRPJJaQfm1kLB46xILn9JHlV+kZkm3XXO6U3Wm1b54Xd+Xlhrmhxliqot3pByrme204O5HaeaGetWUKmSeQ2+vEtySyz7tM4YNmYqwZIgAmsmtOnI6XUK5bd8qJtcGnetBvpJSTMm6wLAy+nHMiiiFRdzGIHCCM1+1j+gDjomrldG7zlo+gVRHHC9yD5woBJDNp1aR5X0TFPi4VVE5m1W50ioTRifAwK0ea9/6OrrBWYoHsqfDpdRwUKYm+0TPXg7zZrm18Uxtl+XvHc6fY9/mYKOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 by PH7PR11MB6770.namprd11.prod.outlook.com (2603:10b6:510:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 17:06:36 +0000
Received: from SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f]) by SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 17:06:36 +0000
Date: Thu, 6 Feb 2025 09:06:32 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <Z6TsGM6LD26qIcRY@msatwood-mobl>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
 <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW2PR2101CA0026.namprd21.prod.outlook.com
 (2603:10b6:302:1::39) To SN7PR11MB6728.namprd11.prod.outlook.com
 (2603:10b6:806:264::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6728:EE_|PH7PR11MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: f47a43ef-c5fe-47c6-dabf-08dd46d09d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?empQN0QzUU5YbGttTEFueWN1a0NhaDFEejgzZHdyWWhJZm9LWWZwVEVLbE5R?=
 =?utf-8?B?TkE0TENWejNyVnVjQ2VLeGV4QTFSdmNZU1V0QmluS01ydE1qUCtTdGRiVEw3?=
 =?utf-8?B?blNaOU02WSs1NEJnVWJybzhFdmhjQ2dBdkprNm5LNlRSeWJVRll3MkhIL0hM?=
 =?utf-8?B?TDE4aWhaU3VweXdyQlZNZUxQMkNnRTBDcXI3U3lZV2lKNGEyeEVqUHd6Z3NK?=
 =?utf-8?B?TGxacHlFWHZDZHEzTzZGMW1LK1Q3a1pVTUlWRFhycUdGZEYzTkJHS21wODNO?=
 =?utf-8?B?Q1NEckJNcUQzL0U5bEdMbU1LZStUUGw3a3lac0dwaG1zZnRqK1B4WHluSm5Y?=
 =?utf-8?B?NlNMbnZBOTRTV2VWSnJFZmpaUHJyMHg3d1FHWTFqVkZFVDFuUUxHc1ZMVGxm?=
 =?utf-8?B?MU5KU0V3SFFoaHA2cGdXNEd5RzA2YkZzWGVOS0Y3VTRuamFZZUV1MHJmOUIy?=
 =?utf-8?B?N2JxMFlKbXRpdEkwTS9tajZabHhTY09ZNVVtRXlic0trZGpiWHBxdkpsZVpL?=
 =?utf-8?B?RG9KQXkzQ1BudXh5UWp3TkJmUXQ5Q0VOUWpEZDlZeE5Ld3VSWUtIZEJJNVdF?=
 =?utf-8?B?Nm42RHgzNXh4QnNPVDZ5OTIvd1IyZk1pNFZQY1luck5QRkI0ZmtUN2ZrTVk5?=
 =?utf-8?B?elVqcGtaaDVzdTZEdElWb3hEUi9XSnYzTTYySWZRbVdkbFpnb0hOOGZ6SW1u?=
 =?utf-8?B?T3dvVlZLcU9HQm9wQnJnQWZYYTNPWDZKS093MFpFUUt5TU1xbmxjQTJjNHda?=
 =?utf-8?B?RjhWdk9jS0tCOVVldmM3Z0grNDJiM1d5Nk5mWEtsUEZBQXRvczhVZzdCc216?=
 =?utf-8?B?cVc5WDMzcXNwcm5sVGZNK1psRE1JNTNmZnFnMC83OXlnaTdCUHpPNW9hRkFw?=
 =?utf-8?B?RnNBQU9JZjYvYTB0QkgwZFI0MTRpS0xqNElqc2RCQllZL3c3VDdMWXJtOUd1?=
 =?utf-8?B?YmdUbGVFK0Znd2dTTk14bGFnT2pxcGd1RWh0eDBEdXFFb1FLUUFuRnFRR28x?=
 =?utf-8?B?bnNXMm5qelZpSHFsbFFENVREVE5pdi9DVG5BOStYLzRQRVRRcXo4K3pzT3Ry?=
 =?utf-8?B?a3EyY2xuNUpMVHR6RjJRcVdYei9YR0lvYzZ4akM4OGZpbWljMUdocVRyYXhO?=
 =?utf-8?B?QmtZZXhXcm1TMnFNelBNK2o4VzMzUXVXWHpFRGM5VEVLL083Q1h5N2ljNy9X?=
 =?utf-8?B?Y2hUcm10ZVNCQ0J3TGxGdVZYNlVFU2hvREwxVDh2Qk5yZlprMkt2bW5EeGFE?=
 =?utf-8?B?am9JdkZNRE9wdUxMSzhtcXhzNEhPUFN5TlV3cGVtYTlCWmRUaDd0cnprb2Nl?=
 =?utf-8?B?RjlHZHdUaEFlRGw4Mm1lTEUrT21IdVh0dVU1L1dMSzlHcVZRRWpWZGdsVVkr?=
 =?utf-8?B?UllRb1pNVXdEaEpMWmNkSzlwOGJVRXBZYjk0N1lEQTZZMHUxRitVREh3aG0y?=
 =?utf-8?B?dHdDek1RTTNrNFduNEs0VitmTVVKL3hPNVJ5MTBkZjBNMnA0QUZtOE1DVnNh?=
 =?utf-8?B?NEViQXJVeGRRRHpad2diWCs3WXpsMW9UUVVkaUtrT21paHJDMEhmcmFtTzhY?=
 =?utf-8?B?OFlMWXd1dnl5MUZ2ZG1mdWJpMDRnelRjN0Y3L2NwWFBNa2k5NHp4Vm9iM1N3?=
 =?utf-8?B?MGEzTXB6YWpxR3BwWjB1NUxQdzBMZXVaWnVmR3lZL0lyQlNnNThXVklWY3ZM?=
 =?utf-8?B?RTBTZkFsWGlEN3lNNU13MW4wZThZL0V1aHpMbWp0bCtNSXNHc0VGaTZ4VFJw?=
 =?utf-8?B?eFdNSTl4bFk4YmtwZ2pXR3RNdUdvd2gyc1d6R1haNHFqTzVmWFJlbXE1N3FV?=
 =?utf-8?B?aUgxRDJjY2ozemJwNlJCSnhGTTBtSTg2SjUrRWt4R294YW03cHdQaGZzVWVw?=
 =?utf-8?Q?Psm8Hwjazlq4d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0ZKV2ZOczRiODBCRnVERUJ3TGtlNG9NazYxOGhxV1AyNGFyVk9vYTlxbHJN?=
 =?utf-8?B?QUNXSVBmaDl3c1NBVkNCZitodnl4WTBaRGNWREkzZnNWdCt6QXUySlRJTXpE?=
 =?utf-8?B?VUxnRFZYcHQzVjg4RDJ0WEtnZkZaQy91eHdYbEhpb3MvR3ZKMm8xSVkvUmlS?=
 =?utf-8?B?Y2NpZmhlVXZtZXRzRGZBZUJVOVpQbXo0Y0h4VTg3dTZmeTlNMW8wbTBtQzNK?=
 =?utf-8?B?VG51MGFwRldHUjBLZ1NwSkFCZ0lRQTMxenBFMHVwZXVQVnZIMTNWZHZRd1VF?=
 =?utf-8?B?UVEyUTdFUGNYU0tEV0N2NjRiMjNTenowaUU5ZUZrMGZHeGlENmFKbVdBdGcw?=
 =?utf-8?B?VmFvREdvNWVDTkgrbUFsS3B3bmY5NytHSEs5VzhlS2twTkdtaTIvUEViajU5?=
 =?utf-8?B?TVdPOCtGNmtack92MUlWYVUzUjBEMHhaZCtxN3IrSkh0U2FvZHFPdTdmbW80?=
 =?utf-8?B?elZxUU9lTUhSbytPMnNnaDFSdzBJRlBlSit0bk1YbktieFg5ZXNLcVZFTkhE?=
 =?utf-8?B?R2FkTXhDRXU1V0g5cWR0WUdEbGtKaEtiRnJDWGFxdHFac3RweDRzeUNiLzBj?=
 =?utf-8?B?eHptSXJhV0Q1eHBVTUgyVU1PTUYwOFdYL3JaRVU0Q2xjZy8zWkVsLzkyZFMr?=
 =?utf-8?B?SjFsRnlMT0JjTjNJaldlU05YMWtvVHR2R0paN1UrWkI0cXZlb1d0R2NoNnFR?=
 =?utf-8?B?V0M1Z2hmSXVSN1ptK21qclFLYk5vWTBsNzN3Y3FObGxJa0pOaENQcnZlOFBK?=
 =?utf-8?B?cjU5Z2lnRUhmTVZRbXpLWnR0eUFReFZRRFZVa3ZlTlQyTnRkS1liUEtNdXZX?=
 =?utf-8?B?K1BSLzRYbnpDMjFZbXRNWFRtbkE3WlJJeEtNd3B5bSttQnluMjQrVHMyR2pG?=
 =?utf-8?B?bTZ6a0tEaGh3TTNPY1ozbVU5WUdHL29XNUExWTdPdHVvNGVQZU8xSjdPTmlo?=
 =?utf-8?B?VG9YWFE5V2FHd1REVWpxcGhwUzk5MHdaakxSQkZJZmJ0NW94djkxOWdMWFFW?=
 =?utf-8?B?a1ZJV1FtQ1hRMzFPQ2JDNXBnQ2diZzN1TjJ2VThCTzg5LzFaOWY1OG1wMXYx?=
 =?utf-8?B?V05ZNnZQNlh4STVHYlMrNDFmbXFJYUpWa2RzblNBSmRBY3dOWmZqTkxTcjlu?=
 =?utf-8?B?dWd6UHIycjBvZ1V3MW51ZGxDQUZsRHJnYjZpQm82VnVxdk5ZaVI4WDJkSm5y?=
 =?utf-8?B?dlY5cTRRS0ZLTFI4VHJ0QXBnTEtobVpua1FRK0c5ayt6YlBVeStSWjdBUTBQ?=
 =?utf-8?B?aE0vUmg0U2FORmNZMnJOTGQ2NlNQWDJPeTRuRG9LLzExcGJEb0c4U3dHbDIw?=
 =?utf-8?B?RWJzQjZxRndQR01yL2R3UnBKcWp6S2lhYStLaWJEUlRqdXdHM0t3cEMwaGha?=
 =?utf-8?B?dGlGUHhsNmpyNEI1UzJiZURieHd0L3ZRL0hkdW5BNHg2NzVkeEJxSWdpSjl6?=
 =?utf-8?B?MStCd2kzVzNqalF4dm1OaG44TmkwOUxObDYzck1zTjh0c1pCejF1RTlYdjNS?=
 =?utf-8?B?KzFOK0RTNVJCZlUwUzZjcDdMZGxWRFE1ZTlSZmRNQkF5UU5Oc0l5WjE4anhX?=
 =?utf-8?B?UHlkRHdWRVhCOExnU0J4eXVFWTRwZlgvUkM0Y00veXRYakp5UXMxSnRaQWlv?=
 =?utf-8?B?NC9jcW1mZWNZTTU0Zm9KdU9zcUxrazMrWjZGbHExZlhxRlpnekdYd3MwZm00?=
 =?utf-8?B?bzRDNzlySnR2MEJkSjk4TEpEeEhlRFlGdTdBYWVBZGZIaFpycmZVb2JyN2JO?=
 =?utf-8?B?eEJLckFZUDZzNTVDM2NoMWUwa0RvM1F3OFpHUTd6elBPSUt6MGNFOFpZSWhl?=
 =?utf-8?B?dm40YnlVNDBTOTFlUmMvbk1FNk9iai9PejA1RHpyWjk0TVVNYnZHQzNvVHMz?=
 =?utf-8?B?dlUwSnQyd1FHVEQyMHZIL216VWlBT05KZ1lnbENZR3B4QjMvZ3EwKzBnRG56?=
 =?utf-8?B?aWVwaUNuTnkxVms3N0ExSHpmY3FmdTE1dFl5SklZRHBTT0U0WFB6WGtNMjZY?=
 =?utf-8?B?ejBIR0F6WXBKNUtrZC9RTGYrQ0hxWGs5TVUrT0hVZHVUNUxNT0tqUU80WUkr?=
 =?utf-8?B?aVFnUkpoZGZ5RThhaGVkVGltVmRXc0t1UVlKdldFcmpNSDhFMUZiUmhMNVR6?=
 =?utf-8?B?K3dFQkRXTElVTkVNaENLaThvZmNKTlRHelFuczRKU01qc0k4VnBZWkpYQnl4?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f47a43ef-c5fe-47c6-dabf-08dd46d09d02
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 17:06:35.9334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuVkPnw792yM/Ja7tJYssROzA6Qv6upfPsqNNTNtfDsO+bkM3g8Ym45SkOJhuacVKoUxVKau6kT2GkJQnSSjhO+4m7QKWmzUMh7zbAGe/sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6770
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

On Wed, Feb 05, 2025 at 03:30:55PM -0800, Matt Roper wrote:
> On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> > There have been several changes to pciids upstream that need to be
> > sync'd into igt.
> > 
> > Sync with the following kernel commits:
> > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > ranges")
> > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> 
> The updates below look correct (they match the kernel header), but the
> commit message here is confusing.  IGT updates to this file generally
> specify which actual kernel commit you're synchronizing against; none of
> the four listed above match the content you've copied here because there
> are additional changes not present in those.
Because there are now several out of sync next branches, saying as
of this commit idea was not working. Hence this approach.

MattA
> 
> 
> Matt
> 
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 47 insertions(+), 15 deletions(-)
> > 
> > diff --git a/lib/pciids.h b/lib/pciids.h
> > index 23f349f65..4736ea525 100644
> > --- a/lib/pciids.h
> > +++ b/lib/pciids.h
> > @@ -717,37 +717,66 @@
> >  	MACRO__(0xA7AB, ## __VA_ARGS__)
> >  
> >  /* DG2 */
> > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > -	MACRO__(0x5690, ## __VA_ARGS__), \
> > -	MACRO__(0x5691, ## __VA_ARGS__), \
> > -	MACRO__(0x5692, ## __VA_ARGS__), \
> > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> >  	MACRO__(0x56A0, ## __VA_ARGS__), \
> >  	MACRO__(0x56A1, ## __VA_ARGS__), \
> > -	MACRO__(0x56A2, ## __VA_ARGS__), \
> > +	MACRO__(0x56A2, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> >  	MACRO__(0x56BE, ## __VA_ARGS__), \
> >  	MACRO__(0x56BF, ## __VA_ARGS__)
> >  
> > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > -	MACRO__(0x5693, ## __VA_ARGS__), \
> > -	MACRO__(0x5694, ## __VA_ARGS__), \
> > -	MACRO__(0x5695, ## __VA_ARGS__), \
> > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > +	MACRO__(0x5690, ## __VA_ARGS__), \
> > +	MACRO__(0x5691, ## __VA_ARGS__), \
> > +	MACRO__(0x5692, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> >  	MACRO__(0x56A5, ## __VA_ARGS__), \
> >  	MACRO__(0x56A6, ## __VA_ARGS__), \
> >  	MACRO__(0x56B0, ## __VA_ARGS__), \
> > -	MACRO__(0x56B1, ## __VA_ARGS__), \
> > +	MACRO__(0x56B1, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> >  	MACRO__(0x56BA, ## __VA_ARGS__), \
> >  	MACRO__(0x56BB, ## __VA_ARGS__), \
> >  	MACRO__(0x56BC, ## __VA_ARGS__), \
> >  	MACRO__(0x56BD, ## __VA_ARGS__)
> >  
> > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > -	MACRO__(0x5696, ## __VA_ARGS__), \
> > -	MACRO__(0x5697, ## __VA_ARGS__), \
> > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > +	MACRO__(0x5693, ## __VA_ARGS__), \
> > +	MACRO__(0x5694, ## __VA_ARGS__), \
> > +	MACRO__(0x5695, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> >  	MACRO__(0x56A3, ## __VA_ARGS__), \
> >  	MACRO__(0x56A4, ## __VA_ARGS__), \
> >  	MACRO__(0x56B2, ## __VA_ARGS__), \
> >  	MACRO__(0x56B3, ## __VA_ARGS__)
> >  
> > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > +	MACRO__(0x5696, ## __VA_ARGS__), \
> > +	MACRO__(0x5697, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > +
> >  #define INTEL_DG2_IDS(MACRO__, ...) \
> >  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> >  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > @@ -782,9 +811,12 @@
> >  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> >  
> >  /* MTL */
> > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> >  	MACRO__(0x7D40, ## __VA_ARGS__), \
> > -	MACRO__(0x7D45, ## __VA_ARGS__), \
> > +	MACRO__(0x7D45, ## __VA_ARGS__)
> > +
> > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> >  	MACRO__(0x7D55, ## __VA_ARGS__), \
> >  	MACRO__(0x7D60, ## __VA_ARGS__), \
> >  	MACRO__(0x7DD5, ## __VA_ARGS__)
> > -- 
> > 2.45.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
