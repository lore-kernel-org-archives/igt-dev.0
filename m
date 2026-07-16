Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02251C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EE310E730;
	Thu, 16 Jul 2026 07:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIa8j1a1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4C810E724
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784187686; x=1815723686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5x5qflzN2eI2fQhNea303hzqtXDYLIdpfBv5+VG59gs=;
 b=HIa8j1a1iBcMYRwgk5rn6qeaQgt3fhctf4di8+qEihbFV9CH5AvZvBA7
 5H0QKw2Gd3VgQ1GrqGUHhKCjlVQyDYb5x9puad9mPPMZnsDtEqX+CaVaQ
 mPgSRgmscbpewCm2wGUcQkWc33H6F4SW7A3TLiiZc6JAPHWpkzpeB5U6x
 KMe0pmjC4f20vcoPG+CIlbazdeVpbbksEjIdpZwRBChalTAqO2aHPJoOa
 hlgxr8Gn3i3ylcTjx1T6l4Id4JFpQ2LvP5TdcfS/BH2TKyY58Y+YHr6vK
 UbUqTOrACE1sK6DSpMwN/AEEPjYEMb+Eqlje90XS43Hn7iz4Jv/3FzFk4 A==;
X-CSE-ConnectionGUID: 6Qd5W/jKRy+/1bhhBGcv6g==
X-CSE-MsgGUID: zb7lPr04RJC0wg+7fFzhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="85038938"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="85038938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:41:26 -0700
X-CSE-ConnectionGUID: YZ2XYvwuQAivEWFkki2RlQ==
X-CSE-MsgGUID: 37aUDlwbQmitQ0fYkJWS4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="286501359"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:41:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:41:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:41:25 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc1earjxzjEgDpR5wIrRiiaC910/8182bRmAG89p7X4xzhNB0v+3oYox45r0VBo+0cE5dt4Uv5DHjnx/uTynMtsDTm9zKvS5dPvIQV9UXWwT36XJ8Pke5e3jLNtVJSwjXhX/MDysiQhxNuDaKpgR4oRU2RrBhmRH9R8Ylg83/v2asDX7XbtNcY2BLggIZ2+XAWCYQuiPYnsX6lMaKv9EY4EXKjuVZrJcEi+1WiIo9zubFyVuBtm2JmsWP/mFuLM6kjS9jhvYoQrKE0lylS/dFw005unsA31mjiBEAMTLHE5tz2VLYxbxQMPzn1xS4qBx8dIuoiO85m/8jfRtHDkdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fqrALLpMAaWsQoeNGMZhhsx6WYr1MY1bUU6v9joeUs=;
 b=PpfQf6KCinC+r3A/YwA4wBYX1fDHCLV2r7ppJFcertiPnbWKLTlOMjwGObRvBlYZWnbzzLd/B6hlKCB5GbPa7Kw6WJgmMNowfdjwkXwsW+lH13hgKEgEeSZoQTv/9Dd3fTyodY69/cNguZgktsAckHtL1n09p6JYrjD/pc2TmDtI0SD0T7bKUjOuTBxJmLoBKnrTA4b54gQE7XlOn1p0wXklw6f2rlSdjOZY6aYHoKpMDyZvmOLcTuuoqP46YRgBxU4r7gDX1Th1NYIIhOVPuImLblEal25X26/SUwMDJ4+XmxA2P2iPtAoUFxORT6J7ebDDuMeiWfqtMb3RXCV6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 07:41:23 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 07:41:23 +0000
Message-ID: <4ea22e8a-8753-462d-8bcb-6f49aaabc7d9@intel.com>
Date: Thu, 16 Jul 2026 13:11:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 10/12] tests/intel/kms_fbcon_fbt: find the
 correct fbc status of a pipe
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-11-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-11-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MN2PR11MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: 8615015d-8bcd-4b43-92d1-08dee30da292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3+JTQYxZ8Y692g7h9rHjEL8SWRJ5iT2+sjNJbp6EUcQlI42qMt5jrDN8cjg5az0PtUfg4NMRmAkps6N9jvFsSMtv98S4QH4teTyMxZxWItS6pvaEj9bQl4TFTh80Mna0pJdZNUwakx3/Jpv9mjUPM6Sz9ZOmqsc6FvpkJCoVgeZvvUl0uuiXIhVz2D67IgbEoc+8fzrc/A95xO9UuKqEDi912pKrjOc2GmjC4tI/joU5CQ8qccfTmN/XX+ao80PHNn3prEGjpiUb5Shj/kjpjDIQxH5ns/X9G1uwWtOjWUuGPITHYwTEqbzVheFr4ROs1xnn/izzveGOQjuxXoP5hB9sG3rMzIYcEZ+o2Nb9wgBXgCxdMoQyWcf1uyz9sg8OaUmcYLXhONahv76stS9yGY6HA9MMyhaKC6JOQAAthwZOOSFEO4ERIYwm+ObyzAhqgmHoRgIF9/tajIyeJL0gRstV660cPcJDLu/2N2BP+YkT0bSyWiZSsDJGjUxOcklw7uJ+bo2bvcqLZ/PZSrq22csoa92pK7jhiC+1pexVZmz7dP1DjOsDBnnB78qD2dzZojdx+wt5KL7N/okQ4d2gevyg4t6D5yncQYTKD2vKm+2RNrCnxnxyaEPLiNNv4ISU2RUATZYZ8X6/n+pHfpLaZaTvLRkMd1CLRbMJp9Ioz9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1h5RUpPcUdpWFRkZmJXS00wb1F4WFduRXNmYUVIQklrUDdNWXdiVjZwTnpF?=
 =?utf-8?B?eVNmQUdRd2l3NTRhMWw4NUdXaVBybFYzWXE3azlzdkNwVEU3bU4wb0k1NEp4?=
 =?utf-8?B?dHdxclJrbHV2Q1VHWUhpYlJNRmx6YlhYL3dRVG5MYW5sclVzK3hNQWVKK09i?=
 =?utf-8?B?N2xFSWg0YzhRV2lxT2UzZTMzREhVSGFDYzVWb3ZaK1BxM3VjVlRFV1F0RFRX?=
 =?utf-8?B?ZEVSc2ZubkR4ZGxBd0I2Q2dsY0NoMXBNZnl6TlBNQjdTb0thdTUrblhIYTll?=
 =?utf-8?B?ZHhrTWNucFFROGZwMU9NeG9mODN1cEdhNW1CbGVmQXI2ZFNuWDU0TXpGMjdw?=
 =?utf-8?B?dk1iay9FeTYzZ2dZaGhRNHRGcDNybmVTSHhMRnBiUzJJOVdYdERuYllZejFt?=
 =?utf-8?B?VVZCSk0wVmM5YVlIYnJna0YwOE1ZUk9lT3ViRXI1SnNBZFFNQzUybVl4dkU2?=
 =?utf-8?B?MS9nZXlHam1rOW8yZWROc3V2SG5sQklZTWdKNXBvb1hYajRIYXNUQzl0enRm?=
 =?utf-8?B?bmUvR01QWVYzaDNCUGdQMTR3dlFacEFwbW14MXAwOVNmV05MWTh6U0xacDhx?=
 =?utf-8?B?VjVZRFprdDdObzV4Q2JwTWd5YnByemZsV29wblpuU3R0bHZudjRPMVpGS3hC?=
 =?utf-8?B?a25tbzFnTTZ5cTZwYXdOZHZxa1ZNRDlIZ0VrNnY0Rm4wRmVDcnVRR04xM1dW?=
 =?utf-8?B?Q3cwVHp4dHRWUmJtbVBudDIzZkdWbk56b2czWE0yOW1yaGY5N2JUYU53RW5v?=
 =?utf-8?B?RnZzV2ZrdVM5b2MrWkVXdmJyUHQreFpHQUltZThsdUpJSXFOK2hCM2t6elFs?=
 =?utf-8?B?bnc0ZmZwUUF5dHozd2tlZldRYnB0dVRzUVNKZkc5eUVvdEhLS1djY09ma0xv?=
 =?utf-8?B?UDBmT0FZa3IyQURYZk5pRVRJYVZqbitYZW1tZzVYZGlhRzBtTUhjZ3l5Wno0?=
 =?utf-8?B?ckU0cG94cjVZOFh0bG1qU0FxaTh6enAzdjIxZHRaOXFNa1NPZFg0Wi8zdXlE?=
 =?utf-8?B?M0E2QVduK2E4SVUvdmU3UkM5dEJ5YUxoREJWQnVmeVZwRXFSSzA4TTR0aWVx?=
 =?utf-8?B?WHE5Yk5sMnVhWjZaTis2MXROMXZ6L0ppWWthQ1BhTmlnY3hJNE51Q25PZ3ln?=
 =?utf-8?B?c3FVWlp1akFFWVloRTdObWlzM0M2NURPVW1NWlZ5OWdoU1lBMHFQbkZ1QkhV?=
 =?utf-8?B?WU41ajlLZWZUU2ZWMmdiMktKREMveWVTd1M2aG5tYWtLSEVVZHg5WjlseGJB?=
 =?utf-8?B?THFYWHBVKy9YUDdIL3I4dEdjZ1krZGx2TWl4WXlXL2FPUEhYd0FxZitDQWpE?=
 =?utf-8?B?cGRORWR6d0h4SnZUOTRyTndVVDU5cXRQMC9NUzl1QVE2V3o0WUZrM29wZG9i?=
 =?utf-8?B?RFFCQnd2c0M0REJhQVhTbWlWaC9DSmJtZlNoUkFZajJYZStwSUZlK21YQm4v?=
 =?utf-8?B?RVlIZytxV1E4WHJuNjJVV0tkK0JvT241dnZjRlJtdG1ZYlgyaWx4UDMwSlVW?=
 =?utf-8?B?dVExaitkYW1kNkM0TVdlVzRJaTYxWU1WUXFBNVJzZTJjT2VSWjBpcERDREww?=
 =?utf-8?B?RUJFYzM3OVEzcENlRldyK0F5cDdRU0UxbDI2WjNxN3F5UG1PVXFVZmw0RGEv?=
 =?utf-8?B?elpCekIwU2NDZTdQVU9HYmQxYktBTHhwcDRZTUh5ZEhSTlkzOEJFeTJlWVJm?=
 =?utf-8?B?YWR0c1Vic0VHYjNwUXJSaTNobkVLd3EwWmNBUEJnR2xsV1J4dDZEVWtwMklp?=
 =?utf-8?B?eVhxSTRvZWJLMXhQWThDdDNmcXkvNU9nZUpoV2hvOGd1ZWF3WEFpT0pUWTZS?=
 =?utf-8?B?NTVtcFNDTlJrcWdKZEUzQ0g1SmZSQ0I2dGV3WlJuWHB6bVpIUElpVjNYOWVj?=
 =?utf-8?B?TjVrVnBRZHg5MnMwT1ljQjROTDNqYkVWOGxrNWhkaFhYeHBoNE9DZHRBOWxl?=
 =?utf-8?B?b3BLd0ROOXVRSCswSnRDZ0N2aEZjYmxDNFZud2IvYk9TVFJId3M2ck0zRjVH?=
 =?utf-8?B?S2RuWEdodEI2bnFvcVcyMVdsVlhVS0dVRC84TExWbll3c1ZnS2NKZ3pZOGNX?=
 =?utf-8?B?V0NiREZUdHJEck1MY05NRVM2MUpCU24yZEtzQXJEMEVtdmhtSEpCUmlxQ0ZO?=
 =?utf-8?B?OHZ1MmQzU1I5WkVKelZ0ajdJTTc1eTA4dm5oRDhrdVBGT05xZmRoR005ajlo?=
 =?utf-8?B?MTRrT1d3OGYweEVITDFad1dPWCs3NDFZaStXeGkrL2t6UzIvOVhTeVZwSFd1?=
 =?utf-8?B?ak02Yk5YV3Y2OHVBSzRsV2tBazd6aTZ2eHY0TW5XQUs2WkJvSEp2Qy9ramQ3?=
 =?utf-8?B?alQ2dGxSem5oeXZuKzQ3YmRkVFVpYUNGRkhCZTRkTHpJWk1uTzQ2bS9OdkJw?=
 =?utf-8?Q?fyZhqLCcN1JeU7MQ=3D?=
X-Exchange-RoutingPolicyChecked: mLJMLK7F60pTGRFs78y/dwpEMesZ8qUcfw/HEbWwBgHEdDfxz/tyZ0g+iohl47JQaXseaVytDWZxXEoYLaTGpRkKkFHvWpNhNvqMo79gy8ZmRcO4ZUuwAlreLj9Kff2jPaGOvZwPsxRv5fDmbKX3kSpCLV+41KY/jwjk7xpwT3B6Cwc3XH9xKeBM3RALQoFa24/7XBNMRdeztmDZ72jSfk8dTXsttr8QMNyfmuxj2xlKozDP+fSCXwLX3seZL8LqpxAkHxFeGiNSlIVmrvcS9ezQlhHl4b8dpttZTCwOHx0MRJZzzddjpdL1dyV/b4Jmo/oSasNoJx+zsCWQWLwp3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8615015d-8bcd-4b43-92d1-08dee30da292
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:41:23.7608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpF6YN1FJtdvKQ7V8xi9fn7GgyDSbyWb6NEpgRu3gBToDI53GTr4IAzlvqbRqZxXl/8nSzhVoDkJ0ryVqKMX14omrZmfWyW0ySGSdk/Q/JlXKdKNJ7hCp4gkrvssGN0c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
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



On 02-06-2026 02:14, Vinod Govindapillai wrote:
> Use the right function for access the fbc status from crtc debugfs
> entry.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_fbcon_fbt.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 96136f8ff..fdd8515cc 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -83,12 +83,9 @@ static void wait_user(const char *msg)
>   static bool fbc_supported_on_chipset(struct drm_info *drm)
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
> -	int ret;
>   
> -	ret = igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status",
> -				      buf, sizeof(buf));
> -	if (ret < 0)
> -		return false;
> +	intel_fbc_get_status_crtc_index(drm->fd, drm->crtc_index, buf,
> +					sizeof(buf));
>   
>   	return !strstr(buf, "FBC unsupported on this chipset\n") &&
>   		!strstr(buf, "stolen memory not initialised\n");
> @@ -103,8 +100,9 @@ static void fbc_print_status(struct drm_info *drm)
>   {
>   	static char buf[FBC_STATUS_BUF_LEN];
>   
> -	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
> -				sizeof(buf));
> +	intel_fbc_get_status_crtc_index(drm->fd, drm->crtc_index, buf,
> +					sizeof(buf));
> +
>   	igt_debug("FBC status: %s\n", buf);
>   }
>   
> @@ -112,8 +110,9 @@ static bool fbc_check_status(struct drm_info *drm, bool enabled)
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
>   
> -	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
> -				sizeof(buf));
> +	intel_fbc_get_status_crtc_index(drm->fd, drm->crtc_index, buf,
> +					sizeof(buf));
> +
>   	if (enabled)
>   		return strstr(buf, "FBC enabled\n");
>   	else

