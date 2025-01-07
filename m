Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345B8E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 08:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C669D10E3B3;
	Tue,  7 Jan 2025 08:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5ujFGVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099F210E3AD
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736238807; x=1767774807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zk4Fi6hZO3obA4tUmkBkMDfoSFZzPifQfiHhP8KnbFU=;
 b=L5ujFGVcJ80q66V367hUxfLnCkgEzGCUTl+USuvdCrq6Y58G4c0Dh73P
 Qg5cGZC8SDTZQi/HNTPhpdxi8t2rkHK9K2vS0lGvW5qSy0d0sou8PiwnO
 D4YOIT4ShlSux+a2gl02uFQGypPutVRP+XsOoN0VI2A4spwmfYtUQ45cb
 qAlEdidkHLKs0Rm0fSsCVZAVbuOfgvTBRoNGWK+qSIwR/7ZFXpPdncdWx
 9xSpYzIK7yGLG7/V6b8qGZVOww6QTocKOBJApWlF6Y/qVfhjDp/l3uB4C
 YaOF5+EQRRwAWH8ZydnhaNUWmcqYp/bKFpNhIT65LRtZTUHBNfACTVdMv A==;
X-CSE-ConnectionGUID: Pnvyjw5xSFK+7YN0YyZWIA==
X-CSE-MsgGUID: 7jxLglT6RPyU2NHEKFB8Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35705533"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="35705533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 00:33:26 -0800
X-CSE-ConnectionGUID: Y9Y8IRRZQL2cPBf42GDpUQ==
X-CSE-MsgGUID: Z94RY7cmRRCgTqJ+YnT5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107776699"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 00:33:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 00:33:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 00:33:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 00:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+h1HUC2bpzOZ+cd/hgMfcfvkL0yywgJ2TSvwIVA9B8506+bz4Tfhv8xROCR4LT7k9ZbgGHDYpMKpYHSVXubTgNnxRziHiyetaVIK8YGQLV/WCR5q7ey9Qyr1G/Ksw9tE0R8/fjCsBpcUPx935EGjDh7+1rMlEJ0UmH2eyBEYSgiHyX9Yc5GcXMVoP2FelbKlJgy8mgiZFRKm0hL5+jwyyVmimpHBvAm5XWXVg+M3CUp5TLYjQ/1shXfyZNLaBzvFGkSlmFlOCP9M76mofRn8v+Etv66qcbOOU8s4R3UiMr6PvMozAhrx+zMkG0zA2L2TGq0y793c+80rQypzzQfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSodG3KjbI8cF6XmTVblSa+AlgOINTWfTBvoqxoFPwo=;
 b=q60nPTstDz653tPcjI9jvWYISjlp2SmWMqbZzrRxNyXUtGV4yu8IopUzqsiEuH7j7ZuJqWXahLTWr4nJesCMZU5r9IRLyXaWPbMN2gGGzzPhOowR962p+2aeNXQKG0gZWRWWdgvXtjoKzSIqAKxZlIH0kW16Eg0B4wTatHbzdMV1vXcOFfNLqSwf6IVOKWSPNXNLys+4qUIDVONfSbiHziZW4zRoEDAQlrAaefcM6vo/qNKDHNVo/FqtlwVcNGKelkmOK20BtqkhflVXWDKCMwh1TGDzgjHlR0+GxXl8y4SHevU76XcSKA13XnI0iPkStF4GWKDWmJ8TDR+owOW+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB7498.namprd11.prod.outlook.com (2603:10b6:510:276::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 08:33:20 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 08:33:19 +0000
Message-ID: <89a83e9d-c7c2-44f2-9b19-21218aa57902@intel.com>
Date: Tue, 7 Jan 2025 14:03:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: Backup connector modes before
 sorting
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <jeevan.b@intel.com>, <kunal1.joshi@intel.com>, 
 <luca@coelho.fi>
References: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: ecaaea3f-3ed4-4cdd-ef56-08dd2ef5f096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEhqKzlRcFI0Z0tib1grNHJpeHBKREFXdDhQWG54cUlycmtMN1N4NERGaG1t?=
 =?utf-8?B?Rzl5UzI4VE9GMmw0cC92L0pwN2NpTFZPa0JjZ2lRdEk5UEZqSzZPRjhXbDRQ?=
 =?utf-8?B?UXF3emRiVFVlc1V2b01lZmJNQWxOZW1oankrTVFKWUxPakFGcjhHUFRMT0NF?=
 =?utf-8?B?b2wyVHVDNDVyUTh6eEc3Z1BjSkhUWVFSTGFJNjJUUjRxa1YyRFVxY2Zuc2Fa?=
 =?utf-8?B?a25iOG5FYUNpQ0FxQnoxcXVzVmtCYWFRM2ZiVk1lclVNT0ZiUEtKWS9TT3M1?=
 =?utf-8?B?MHlIZ2ZFV1gvMGdDcHVUUVllbE5xRHFPaXJTQTEvbkd1OElUbHpCeGpzV0gz?=
 =?utf-8?B?cmxpZzkwOFRoUzhoaHQzeC9YVm9FVWw5aE10UWVxTnpZM0ZSUHdvM3BBRVVC?=
 =?utf-8?B?WEtZbWxIazBySTZFWmxReGFhRTZTVXZVMkNMSXVrTmxSeFpmdDFRQU1INGVB?=
 =?utf-8?B?RVU5dDY1SEhNMFM2R0d2Vm94QTR6akFaY3ZwcW5uVzNITTBXS2R5bk9WWUp6?=
 =?utf-8?B?UGZabGFHRVpOQ1V6TnVkMDdIbmgzdlRROWdFTXcvdlBQVVBGWjBrVk1rQXEz?=
 =?utf-8?B?N1dxeUpxcEorS3Y4bi9CZ0VuZnQxeFdQdy9uVzF4SS9DS1VUODJzSFlaUjRv?=
 =?utf-8?B?NktwVVFZRHdTZm5KMm9IM21xSERhRUNON09QWFdHdm90eWVQZFdRWWdzeDZF?=
 =?utf-8?B?SkNNNk5NdEtLK2JIOGZwSUNqT3JwZzRJOEViZzBpWkhJaWpRTWJoQXJ5S21U?=
 =?utf-8?B?TngzL2xscjZGNmpwalg4TFo4YXhsMExCYTFmUzlmalNzR1Y3eUxpUE9BWnZS?=
 =?utf-8?B?citLcU5WYlpGckF6c3dEL1BYZkZWbVEvaXF0NzN3NXMrT3lRd01OQVE5cDJM?=
 =?utf-8?B?YzFmWmFtakNzTWgyTzlOeDN1cU1PMHRRcjl5THY2SDgzRFdoOWNNMXhLNzY4?=
 =?utf-8?B?U2M3aERTRndUV3NralRDN1VnWHJUeVh5SEFSaVRHcHg5YXhEbEp5KytwbGx5?=
 =?utf-8?B?eElsYnVyY0ovOU9Ua3FyMlgwSWhPQXVLZFovSzZQYU9sa3pZZ1lnL3dFN1pn?=
 =?utf-8?B?amoxTWdiQUJHMnQ5K25zS0JLVGk4dENxZmJTMXVpaTFpQnpvSXlvdTg5WDRq?=
 =?utf-8?B?TXRTbU42U2xrQnN2SmljYWx5aE1ra1YxUmdHdXRtYXVIeUhOUzA4V25BUWxn?=
 =?utf-8?B?L09ubXhUb1dnUnJsODNVa1dWT0VFbTY2RWlhaUQ2d2Q1RmliRDE2WkZrQk5O?=
 =?utf-8?B?MkJMQUtpN0tkWjB1VzdmekFncWR0dWNKdm1qZkVtbDdnWFNRcnhRUzljOUEw?=
 =?utf-8?B?L0p4Wit3OUpkYVdONnlwOHprZWw2MXNPMVJVZmFWcVpOQ2o5T0ZlelNFM0lX?=
 =?utf-8?B?elJSR1pES2NYVHUvenBnRnRydWRXYUJuMnp1RVZ6TnZRSUdVekdqWllLUE04?=
 =?utf-8?B?d0ZyQUlUbXZuZnZtSnhuUFo3cTFic25FQTVKeFB5TnJ4Yy9PWHpQY2dZdDdY?=
 =?utf-8?B?MVVUbUFxZjMrK3ozUTlsM2x4bjhtZXFPWmJaek9iNHNMVk9ZdDRGanloRHlM?=
 =?utf-8?B?OE5DV2J0YkFreU9yTHhBS2pkK2VTMjNQVE1yNml0QldyZElUZjA5T1FBVWhW?=
 =?utf-8?B?R0MyRDlBUFpxM1RxdEdHa21Ba0J6N1cxRWRUaVlMWTZxS2JNUTgrdVVGQmJV?=
 =?utf-8?B?eWVDZ0JiUEpDdXg5RTJqMnRWSE03Mlp6eFJLdHdxMUF1V29ZNUx2dnFuN2Jz?=
 =?utf-8?B?aEJpaDZoTXBlNHVhSXFJNThGdWVIWEtEUWl1cnQzbDQ2VGNWcmNhUjNGVjhn?=
 =?utf-8?B?MHdBa3pjakRYUnZXbURJdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09xd1hkOUhGRmxjVHFqaTdwajZoNWZtaVN3aUh6aWpPdjVFN2dWSGUvdlFD?=
 =?utf-8?B?MndJbkhiN1dwSG5YM09FcWs4YTBzV2RERnZrZVJLRFcvQkNZMEh3Y01SN3Zx?=
 =?utf-8?B?aWMzWjdibmVCMzdPbTIrYmFqS3JRR0hOa3JrMTkrazZzYkNWQk1vNHpsYm5k?=
 =?utf-8?B?MU15bHlHYXNJVlhJRFBWQnJERGpSeWc0MGZlYStaVWREMGM1RDV2UVFmS0ox?=
 =?utf-8?B?Nk9DYlhFRWg1RlZHTXY1aG1MUUlvUGRtY3NLWExjS2ZFS3o4Z3lOTXFKQ0dW?=
 =?utf-8?B?blFHbENESGRGS1p6dkY4eVhpNkl1NWZLUXVnci9XTnpBNHF2UWdweEZ6VHkr?=
 =?utf-8?B?OUR5YkRtaWRCYVoyRWJ4MEVkRnI1UXdyUk1GV0gxSWJ3VXFQdlZWSEtSZWI1?=
 =?utf-8?B?L2s1RExYNE52UmFFaFVtTGMwOE1GaVJTbkFIVnZNUlRjUjlPUE1UUzFZeEVn?=
 =?utf-8?B?VDhBQmQxUjdrYk9SVE5yUXRueGYrTU43SWdjcmRUaHl2TDN6TDMvd1VIdnpS?=
 =?utf-8?B?VlRrQ1A3ejI2K0dlV05IcG56NUZFb3VCNTJlQXZJdDdyOVB3Y3Y3M01rL3hy?=
 =?utf-8?B?QWNCTHlYMjZRZklZMnFHVkFwbG95TWhPZjNySnFQTEVjeUUwd1JnUUdPck44?=
 =?utf-8?B?SFpHWjJiL25icnlGNlpjUzFPWFpqQXpDQjhHU2s5bWRXNS95STZLU1k0aHFK?=
 =?utf-8?B?UEQybTJabXQ4czV2SHhnQmcySG05RmpjRkp5cUdJNWp1T1dzbUNVcWplMnpp?=
 =?utf-8?B?cnpKOFk3QlQva1BJK0Z6Vm9hZDNkWm5uNlgxbHNGZUdGNVJjMG9rM1EySk4w?=
 =?utf-8?B?QTVCUjRzRlhISTRRS3Bid0ZscCtyWXpEczZqUXJYU0pvQ2xaSjVrblJpVWMr?=
 =?utf-8?B?c24vZ3RVcElQa2ozSEtLai8vcENzd0xmcjBxa3Jma3pWTGtlUG5UbTlaU0FN?=
 =?utf-8?B?cERnUndDZG1sdjRZSjZYVDZuSzM5WnhORUZXNGt4RC9oZ3o2ZEU2Mll4ckp6?=
 =?utf-8?B?Nmx1NmNCRWpsQUdzK2xGUkxJUHgvUWRuOVlrWHJlZERGVmhsN3NSVU05OTgr?=
 =?utf-8?B?M0FFeE5hZ2xJWmRVKzVsUCtqWTlwaUVYZENkNFF2dFRHcC9XU1o4UVNiT2JI?=
 =?utf-8?B?SFdLWGNtaEpWenRXcTlraXh1QmlVN1R3d3BmaG9qc1U3MkFSNmJCOHEvZU5T?=
 =?utf-8?B?d25WaTBCdzVMQ2FqRVJaMXdhTUNhakdyeGhweXA2ZnNSUDkySUp4K0d4clh6?=
 =?utf-8?B?di9vWG9QSWxlUkxLVVBhc0pmeGl5RFNZcWczRGkvM3dtdlh0NEQraW9FeWdj?=
 =?utf-8?B?SlRjQUY0T3poeFNrYTBFMXgzYW8rdDdVeU1oWGU0blVtMWNBZERIdVhnZng1?=
 =?utf-8?B?NDFjQzFFOG11OGhyaURlZldiQ3Y5TjMzbi9RMm4xVjZTbStvT3gvWVdkd0JK?=
 =?utf-8?B?bjQvYStHWkVNQ3A0clVoSTRIUk8yR2FaVFdONUJ4UlAzdDZ2M1VTSzF2MFRi?=
 =?utf-8?B?Q3Vra043WTVkTGowamhuOU9QU2llTUVsLzFJNTlrMVp1YXpZS1B6M204QWp4?=
 =?utf-8?B?SzZoUThSQXJGd2pkVVZjR0VobHlaR25IWmgrYk5Ra2lhbnBIalhXSmNSc2VV?=
 =?utf-8?B?RW1kVWprY0U4OTB1UjJEcmdIK08yTnMxUUNyL3JHZHNQUjFQY3RtRzFwdmVK?=
 =?utf-8?B?VTUwODhKMU1DZlE3SWdsVm5zc2hyVHBsVm9HT2w5bnVlNWFGM2s4ZUFwcVlU?=
 =?utf-8?B?SHQzRU5pR0s3TzJ0VVJsNVFzREdlMlhqdEthZjNkRzZUVDdqVEdZa3VRcElB?=
 =?utf-8?B?YmNaREY1NkdjV3B2alhSTjJUejJZME1BUnUwVHRtc0I5MTIwLzArY2F1V3Bh?=
 =?utf-8?B?bmZTeStZcUU4bEZ0OUQrRWFScHNaZzJyUzVGcXExTlZQMkhDWmhZNDZ4L0o1?=
 =?utf-8?B?WmFWUTg2S3g1Um92VFplZ3dSejNJN1pxUDlabUgzVnlLVGJaMmtrU210M0t4?=
 =?utf-8?B?S1VCOTYxYXVONE85RWhrZWlHZERYMGpubFVGM2p5UlBIQkFsSjlGd1pweEdq?=
 =?utf-8?B?cThrbDFIbDM1ZmJGZ2dqSXlYNHE3N1IyV2ZhMHBJMWlZNlE4cDhwczM2MWVU?=
 =?utf-8?Q?zuvY5543YGfFHWQg7LaPJG6p5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaaea3f-3ed4-4cdd-ef56-08dd2ef5f096
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 08:33:19.8509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiE+SLbHqwqaOADkxbJc8XntuZES34hmljNPz82islq2KI2mpxdyMAWgi2gYkjKOGurZwBPcdpwJU39axHtAAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7498
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


On 1/3/2025 9:03 PM, Santhosh Reddy Guddati wrote:
> Backup connector modes before sorting to ensure the original mode
> is not changed if the joiner is not found.This will skip updating
> connector->mode[0] if joiner is not available.
>
> v2: Dont sort the modes, instead check for the required modes (Luca Coelho)
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a67d17c4f..95e3059f7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6418,14 +6418,13 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   {
>   	bool found = false;
>   
> -	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
> -	if (!found) {
> -		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
> +	for (int i=0; i< connector->count_modes; i++) {
> +		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
> +			*mode = connector->modes[i];
> +			found = true;
> +			break;
> +		}
>   	}
> -	if (found)
> -		*mode = connector->modes[0];
>   	return found;
>   }
>   
> @@ -6462,14 +6461,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   {
>   	bool found = false;
>   
> -	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
> -	if (!found) {
> -		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -		found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		if (igt_ultrajoiner_possible(&connector->modes[i], max_dotclock)) {
> +			*mode = connector->modes[i];
> +			found = true;
> +			break;
> +		}
>   	}
> -	if (found)
> -		*mode = connector->modes[0];
> +
>   	return found;
>   }
>   
