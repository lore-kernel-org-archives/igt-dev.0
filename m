Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837D6106F30F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 10:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A0210EA82;
	Thu, 26 Mar 2026 10:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZtIet9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F3F10EA9A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774519222; x=1806055222;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cB5zVqrF/QSMU6NUuJ0HDkWubC8St7JdKodAmeLeOcI=;
 b=nZtIet9NNGw6JELEBTX8vNtqJWQSLGVTeyV3GW6GSg9815vRDVQ0NxsE
 CdCe1zA9R+og3B1pQWyVQvfprDTJD95m6K1xuhshp6sPgF/z3Ug8BHMBC
 vkGUlyvV6OU+NfVfHE6kZ8k1VFPKXhm6kJuRKIjziSfge6n26T4z8A7Nr
 IOkTaS8oeNvbPigqj//VJRM+gLqo0dgWltAQZqwRV8IlP/Jrt8b1wOA/t
 uGlLmmmMrUNhaAl/E673+gwNoLczgBppuZI2DrAS1+Zy7kaPmx7VKGN88
 rKQuDtNodgpiPTjnng2iAQLi9WUrfqSHQ+t+JF5A/UzaQTf1FIOeEtUF9 w==;
X-CSE-ConnectionGUID: ywIsykZeTzKJSN2fcGWkoA==
X-CSE-MsgGUID: 6zzVtOPLTnWZL62ZBU66Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75767054"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75767054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 03:00:22 -0700
X-CSE-ConnectionGUID: +p6RLwBgQSCLF1wQEkrB4w==
X-CSE-MsgGUID: Aj3C+87DSFC53cFwkRTZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="229895683"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 03:00:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 03:00:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 03:00:20 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 03:00:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUSWsqDPTFkXSN9mNv8QGRo0bimY0Fxng+nH737YaT1LQGWI9qqZ2zEKFDDGEaz5dwpQ9izJdwCCE+o5aHrxffpbSclWZF9h+yhkHD8NOxicsRkcWEj16XSqhRcgagyGdBAQFxEqGXf+fNSUJxVk19piRm/TF+6Gq9FDjZvY0LGShzwliVMQBEeAgD+huIjlBDy+SxHDfWBY4zwFWkDEHfRyuhikbso0qpfPgyWqZyb+jkZSkArU8U99OGBqMdJzEjliSYN3d2Q80ae2ewwT21Z8X/qlxvf68yNgV9B+3Z6fKUDM/LxPvGzx0sAcjCj+gEP0rKcaX5Xqy6uLdfN0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j7dHLWnRvDQEojeUAstWogu+0miumqeM/H6k/ppxTw=;
 b=Oq5f0sDHgj9SdyaEquIVNFBZwrwX4Vwd7dgRg9B6gcpI//N8eixw+Rg26un8Cja77OsQIry8paQnBh/RF2qh/qxsVLbcE3D0rAnaxUiinYMOG40nqbHVuKWB+0m2HdlRZWVkxhlQhJ+ETb5AWHkGKCV3+Bi+RQ3DIGqd3qHFQ012/4yzY4yFOFcX479rdWWr4TVVlsAKmZ6u9ud5oNkuF5ucxUdnw9wcFTIkwYBG8d6Vc1PDJHW5Qji+oaZxxg7pS+2TRY3pncgmQcYI/JJo9gEwXE8B4LoO3JXXy/GzoJabeUy1lpZD9tQ9ZHLNWTt/2b6wEawnYPi/vYmiP7bqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 10:00:18 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 10:00:17 +0000
Message-ID: <0fd0f19a-3f33-4d89-8b50-2be59b3a1cd1@intel.com>
Date: Thu, 26 Mar 2026 15:30:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 5/5] intel-ci: Add *-planes-random chamelium test
 to Xe blocklist
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Mohammed Bilal <mohammed.bilal@intel.com>
References: <20260326090417.864673-1-sowmiya.s@intel.com>
 <20260326090417.864673-6-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260326090417.864673-6-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9d8d3c-9558-4834-f2a4-08de8b1e7bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 31HdObDJLFwSCExoepzfReKFc5wQTgDgGUsMGH6tzcCMKR0zyDfe6rCGOX5Ub8npoHpBUBGGUpS8JVcXZ/09Zlol5mQ9vEftNHqYFVVKeQ/PfDH0V8WjxNFy2vVC19DsnJ9XuQWlm+okZd8qUHbcfwbKrsGVCBBBKTnqIZkTg3uvg1WTmCbm4fYJsbU7XdgZMDAgSHUtSpKwVE1ObUnEvcClWCoqON/ULZl0Qotgne/xFs+04nQCxlu+qgUQyIBZ1opiNLtSTs8QqTDElLBSYIWhzLEGyI/Odrh9NOKAIPGOot+bwnjASylRrwlZRAL13igj1GU+/1Q58HFB0aZVF4WwgOBERVu2yzcw3TP3eMMuGxOeYFBER3UEpwFGYmw06imkMCHHslQ6SGMdJfmmdqdW1KZyoz74nuSN9iYoTU89KM6IGQLDMp7BcgqWLn4qCM5VHbQpIv4EECx6PrjWIVMt2BxLiotmYT2WKdG/lism/fdnVl6Ht31U0+Psh34YwgFMNUYMEYS3nJ4C+gNbu0CSXq4LBYMIzUhQCC3y9CLItfkJtWSiuNkyaY4AGN4SyEHLuUgkt1y3k0kEwIo9O0mm7owvAIiN52edZGP33Wa4spzIaNKogjcor855Blyyttohpv7Hx4Ai7gF7TF/OPfU/JR7h4uIyMI6UmzYrlsq06gMhPFOAR8LwPhLgkpHGf/NbNLmUb8VJ4sFV9clkYB57pcBpNFoxD05/IpHJHRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUtRM0Z4Z0MxRXBDVmxlVFVPR3E0c1RrQ1F1S1gwMXROY1dvd3hsakV0Tzgx?=
 =?utf-8?B?UVhVZWpTZWRTb3Q4NTZMdUx2eGl6cXU3L2JiSEd1RVJMenBBZzN4UktxVmR3?=
 =?utf-8?B?ZXBOdW1TSmNNLzN2NWlEUGxGNDdrSm4zWjZZMTFCaW1Hd2dSUVBudGxmUjdq?=
 =?utf-8?B?K0J3c0FpU2wrWVh1SWpyUExjdk1zZXhGbUVqNHJhQlRXY0srTHJGWHZnL3o3?=
 =?utf-8?B?MURxT1hFdGIrOUUzcE5zQ24rUWNjZUtoYmR4NHZCOUw3TWgxTy9NdGRCb2d2?=
 =?utf-8?B?am1uVnJsaFAwUk5ZME1tOS9zSEQ1QW5lTGQwTnM1V1lETElNWWdIT1JnU3hY?=
 =?utf-8?B?alY1Y0kzZmUzTk9sK2haaHQxOXVmS284UWdMd2xoazhUU3VoN0d3SkFzMlF2?=
 =?utf-8?B?M3ZPU3cyVGdDVzhQeG4xMTlGZXIrWG1xa3E0T2QzNWorQm5PcTRuYXQvU2M4?=
 =?utf-8?B?cEJ1RG8ySm02RFdCbjIxemc5U0RJWWZxSG80cktNNUZhY3NhaHV2OWpacDZI?=
 =?utf-8?B?aFcvdnFvZC9rbC9POEpaamVHRE5CKzVPVXhXUTJUYlJLdlpqUk0wbmNIQlNM?=
 =?utf-8?B?Y1liT1g2YnJhRmpOcHUyU1doRG4zRUxWOVIrcU5HS2x1MERGVDYvV3IwV0R1?=
 =?utf-8?B?aUJBQU9tZmc1T3JYQUlDN0MwazNsYjk3R1lDTHZTQUJVNzdTV0trMzUwczkr?=
 =?utf-8?B?amtMTUs1WUpOMHMvV21WeTlrQ0x0ek5TVllCTFZBemQ4ekRGbWxITHYzcFZX?=
 =?utf-8?B?L0ZJM2lWb0tiVTNXeTEzaE1mVDBaS0IzSlVJbEpjRWNtWUduZVkwRWx3enNu?=
 =?utf-8?B?YnBtQW83bDB2L0QwLzVuN1JUQml2WVRUeC8wdjRacEZiZHFQcU1zZHVEWEs5?=
 =?utf-8?B?dTFwSmNtclJoMHBWU3ZMMTBNRlBlSk4yOW5raVUrdDlWN3dSakQzT1ZaOEs0?=
 =?utf-8?B?MUJxY28yRk9iVG1MNmwxYkZySVZkTWo0N0NwMHZUUzg4Z1orMDZrUlRpVjRz?=
 =?utf-8?B?bFVVdnJia0FNbzQrOEZoZGFaVlFqVm1PU2MreXNudzFJU0VOMUlLTURUYWFF?=
 =?utf-8?B?SDhFUjVXVjM4U3RMSzB1T3N3YnYvSHZpSlNwd1ZFZzBaQ0RJeFBSSjRha3RC?=
 =?utf-8?B?alpEelNUeHF6bHpZSjFVWVVjelQ4aTFLRGdXQUtxQVRMOFRqamVGMzRGZy8x?=
 =?utf-8?B?ajg2SjBxYmdmMUVNVDIwaW5kODNLQ2RPMEluVmNCV21Gc0Y3L0M5SWlPVjkx?=
 =?utf-8?B?MVdmeXdDc1YwYlVlWHFoazE5MjMvMEhDaVhod2pWUHZxN2s0akUxeDVTYTZi?=
 =?utf-8?B?c3RGVFArcnp4Z3N0NGorUzNENmhrMlpvc0dZQ1BoZ0hjV00rbCt5TTNFU1M4?=
 =?utf-8?B?SGR0UHdnZkc3VGdqWWowazl0S1dFcnhTMEducTUyUkVpZWIxK0NqK2NETXVT?=
 =?utf-8?B?OHVyeEpCSS96WmxrbG5TaDhEaXFwK2xjWTlBUEw2TGYxTmFRTjB5OVdWZklk?=
 =?utf-8?B?aWJSTTkvOE5URmlLQXBIbklmWkJwMTA2S1hmdU9ESWJ1MElUaVd5djI4ZFNm?=
 =?utf-8?B?b3gvWXNHdDE1QTdaSzIvclNNSmdPSVhQQVRYdllMK200K0xSWFZ0Qk9Pd0Vz?=
 =?utf-8?B?d1YvMHBIU0pjNjc4LzdQMVdBekVtMjdpVlJUMyszczJhS3l4c3g3MmRDcjNt?=
 =?utf-8?B?T0tRMEhjUEx5MHoxQkJTZE4zaGpuWkNjYWJMNlRkaU9hLzNKR2FwVVNiV3Zp?=
 =?utf-8?B?YmNSVG9OU2xOd0U3SnRaSm1pSXBsaUZ2WmxaZHVYdWt0cDFWcDMzc0R4MHZn?=
 =?utf-8?B?WXdQYjF4WGJ2YUF6aHdyR1RCSUMyVVltaUZXL2FhdGQ4TkNybXNoZkpZSEtB?=
 =?utf-8?B?SmpkZmFXRXlhdHQzVGIvSmJEMVVjbWR3djgvZG1vYi93TkcyOXRkSURRbWFm?=
 =?utf-8?B?RXR6SUJiWXBGeWtyRndOVmczNDVUZ1MxV2lVaUE3SE0yakNXemVCd1o0bFBa?=
 =?utf-8?B?cC9RSG1qQ0c4T3QxRW1kUENQUktCazFNMk9ETkRsQkZNQUV6QXR1dFIxWndn?=
 =?utf-8?B?TUlqbnBxQmhCZVpTZnA1NFp3RG1Kcng2T0MxTGx2aTZ5aU42TFVTYlJ5WnNT?=
 =?utf-8?B?Ui91aGtzWHZPbUJzemoySmRvODQyaE1oWkpXTWtGOEd2d3M4dkF3cTFZekV2?=
 =?utf-8?B?K3JscVBsM1FtV1QxMVVSZUttWlRNNzRiM1I1Y2JXTlZQR2tvMWpBb2tZYmNw?=
 =?utf-8?B?dm43ZlYrbUtwVzBPanNHM2R5SEwwM1JCWnJabGkzcmd6TWE3dEF4VENQVndK?=
 =?utf-8?B?anBpR21LWDlLd1d4bDNPUEJTazQzWmI2eHlNbUFIYXVDWkx3SWc2dz09?=
X-Exchange-RoutingPolicyChecked: atBiFMwH0qF5jmd8hdp7JkEuAX9oMWvlIv/7XlnkcEe2gaFeWYf0GFm70Nr4kvEbnMJiMTFKTrahJgo2V3cM4/nNlCJlO32NMzjaI5tXFAktEeAR1q0TAXMzw1ibqeQuMNzcU+2DNv43mdiCYkFBTvrYKe3aDynb3xcCldD+pugpZjMI5fkCI99insyXCDToM2S4rWqkP6BWO0U4UY6L2pmb4me0pqk7H5i3eOVpn63aHFoR8x9tMAt7jO/JWDl1oOEH24pmBcNmXRpq8sQfWJhix2k/vujgR1z0mDrwN7wRtm4bjOASY4WYrZIKzEQ686S43MH5bZPRVEyOStZ2OQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9d8d3c-9558-4834-f2a4-08de8b1e7bb9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 10:00:17.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmtG48k2EQL+GmxLbm48O7hi+2kbFB7YPZyctIQqSm9HC1RcLHEV1nibK6mKXxssGUTzmNlbOQT94AIXiq6ONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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

Hi Sowmiya

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 26-03-2026 02:34 pm, Sowmiya S wrote:
> From: Mohammed Bilal <mohammed.bilal@intel.com>
>
> Tests are exhaustive and pick random configurations, results are
> non-deterministic on each run.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 80a0ee904..80cc98608 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -132,3 +132,14 @@ igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
>   # driver does not support VGA connector types.
>   ##################################################################
>   igt@kms_chamelium.*@.*vga.*
> +###############################################
> +# Tends to generate invalid configurations
> +# using CCS planes or configurations that
> +# exceed HW capabilities resulting in sporadic
> +# failure with -EINVAL.
> +#
> +# Maintaining extra constraints for Intel's HW
> +# is too costly in comparison to the value
> +# provided.
> +###############################################
> +igt@kms_chamelium_frames@hdmi-.*-planes-random
