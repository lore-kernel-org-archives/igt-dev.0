Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795B7CDDE69
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 09:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3609810E253;
	Thu, 24 Oct 2024 09:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sx+NNfSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4345910E253
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729763549; x=1761299549;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=G+1a4pBGYuywfiuUpE9c4zQddOeW05Lj7za6myh1GGk=;
 b=Sx+NNfSbLh3QCFS37ArC21CSuxG7gHwcASWSyaiX4aQlHVoIdF/Wg9Ku
 DMIRGQ0iPmMzZeEv07baGqYDp65CorfgJxJY8CJQyNniHvK/HLXXhiQa6
 4F5sQ0T/16tSmPtf+pqciXMFaKudbEST2MkZGGQ0OcKSZUwbWvwOlTtrb
 GcanneIM4QqqvP+myGe66nMnj0rvffF9RkcpAxXjgpiy99ZTKQjI6Ubmr
 HOcSaSNqZ0Obzy+GqQkk8vRwkvR+T/LZjKFeONNMSg7FYj7+zIGmyqthK
 raGSXAX8D69q1j6CeLjUzxyTXTaYRuVW7s3JM4dRaWFSkFZqfnV48ZSop A==;
X-CSE-ConnectionGUID: OOXuqVmZReSxKJQ4ZjRqmA==
X-CSE-MsgGUID: D84M3+qxROyDrbqq9b2hnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51929222"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="51929222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:52:29 -0700
X-CSE-ConnectionGUID: v+aZWA7+R6Cljb7rPX2ODw==
X-CSE-MsgGUID: t+ple48bSmuZKk6/ae+cyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208,217";a="80472349"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 02:52:23 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 02:52:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 02:52:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 02:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrEZtPHu31EY+lI0bRuIvuxeVJKQFzmNWauFnvbovGfjmdScHr3IHxJjmuzLxoTDg1sfqoWkdQkzb8zBgMNlwXWfClTuT65gJJ+EnkE7eC/IQ7eNjREIGzlpBKdt9qLV6E/10+AA5eHF+MN4XXpXsxG0Q+po+KKkCc4ad+NF5e72GDM3mQRzjVFbARq0HhdRafozrAKTdRG7Rb8faL8alv12wGaATJKdVszucOepXO2fy2hkbioESPxnXHwbrapIRBBWz7j9IqEkXNq+2FiCkpAUcMYaQGIoVHJtivv0FRmlBuXdzHiKsxzkG49gjmRijy5P6slctJLni3vUjCUPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3CTvJG7sIR6JmAdBKqEJszPk9PZifG4+DXhpGffskg=;
 b=AytZZMpaG7YgIt8ZHGoba14fG3STyuDqzUR9RW9QnoSPwnGiDgPLoR9iylQNhJ+lzkFXpJAgtl728fUDfc+8WnjFxKgAHLGHF0LEfyCTpGyLUqvhuf+tzQ/wwMixmuPIc3ToZhHdxxhIzHEJx8SA3ZCuTPUQH9fEfEyKNcZhyLZ0mt7pS++30fRO1Dcd6dPCRkLSyknnFhNOY+dfT0xMTcGSGOLblLL3hDN0eTofnmzaMAF7fUgJZ2hpgeWyhO26/058/N96gZLsqnU1Wz1lJwNgTYsvgF3A9g+15xyQEh0K+dAiDDq72nwpO0cJH9GfB1DWBNXwHoqS6VnBqu7m9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 09:52:18 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 09:52:18 +0000
Content-Type: multipart/alternative;
 boundary="------------TZspZgd0VKx34hBYV6mIFN3I"
Message-ID: <899cd60b-3d40-48e9-93c2-b3553c2acd81@intel.com>
Date: Thu, 24 Oct 2024 15:22:11 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/xe=3A_Add?=
 =?UTF-8?Q?_tests_to_validate_GT_coarse_power_gating_status_and_toggle_coars?=
 =?UTF-8?Q?e_power_gating_states_=28rev10=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20241023104604.2145733-1-sk.anirban@intel.com>
 <172968332162.1323365.13297960437456912187@2413ebb6fbb6>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <172968332162.1323365.13297960437456912187@2413ebb6fbb6>
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab1b36c-c641-4aaa-d424-08dcf4118bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1FObXB3WXhDZGtoeXBvdFMyVHRiQXpJTisrUnFBVTZzNUhxNjR3ZnZBMnpM?=
 =?utf-8?B?aVZMaVVuVUJRZUo2YnF5azBxRWtuek9uZ0NIWGZ4azcyeHo0RXN0Wi9sb0Rw?=
 =?utf-8?B?R0JhSjVaS3FDZmRjVXBkQ3pqbDJmVlIwTkcvbG1PeGdmUXVIT3QwU2xnNjhk?=
 =?utf-8?B?NGpobS8wbVVyemg5TWZZaWFDR0hzZVU5c3h3dFJhRC8yRFAxQWtTYWxJZjZL?=
 =?utf-8?B?NmMvV0cxMTNGZVl2OG8vdG15RWRCeHZtYUhYdXZnRWdBcG82YTlyZ0hrUUdI?=
 =?utf-8?B?YUd4T3NQS0JuWGtLZWNuR3RtcHc4ejYvQmViSllKREs1clVKR2VRQ3lVNlNG?=
 =?utf-8?B?VWFuOEsxS0pWY3dIYjFCU1BmVTc5eWd5Q3FLSXRMa1BwQXZ0SE1rM3d5NWFO?=
 =?utf-8?B?dEhTSDZQZ3NyS2d6anVGcXdtNFNPN09PVFNWZlp5Z3JRdHJhVExDZHJhMFRI?=
 =?utf-8?B?TllkZUV0L0g0WHl5aWNBOXNGMVhiSW54RGhCb3JjcDBkMk15MTR4d2RCL3RZ?=
 =?utf-8?B?SzJiSnZXSUNJODMwK2d2d1ZFSk9XOTRiSG03T2JnY0w3d0xKRHV1dE80bjli?=
 =?utf-8?B?RHkzemVnTkRoN3NEQjUvelY2M1cwaXk3UUcrMFF5Wjd5RkVmM0l0TlRjaDJ4?=
 =?utf-8?B?ZHJneG83cE8rTVRIWFFSRnpaMjFWbGdUUHRFQ2dVc3NLM1FwL3VjaFVSSzh3?=
 =?utf-8?B?VW1ZVWdOblpZcU5TVm5xd29RQzIvYWtkOUNIZnJYOEJST1lQdHhiRlpqeWhj?=
 =?utf-8?B?emVRbWNPb0l1c2YwYm9YOHpHQXJtODdxeGhvZGlrTnJ3YmNYSEc4NmhTbU1v?=
 =?utf-8?B?TitqcHY4U1N6cEF0QXZkTGtYU3Q2b2tTQlVWT2FFbndFNU1OSjdpS2FtR3pY?=
 =?utf-8?B?aTRYNFZYMS9lUWluSzA4OEZ6RzBNd2JnNXRZdUNJaEg2OEZuYTR1a2NkYVp0?=
 =?utf-8?B?VkVyZTl5SzlsNkNhNm9HTjJySXpiSU8yTit1eXhGVElrTS94aDZyckM1eDgy?=
 =?utf-8?B?bnhoRXB1SDlBQkhtK1loK0h1M293TENHZld2b3lVUkhEZ3ozN0hzUXJJUkRh?=
 =?utf-8?B?emxuSE5CaElTRUhIMnU4eUVKU2lMRnFCM0pRRlFqQ0Y3cWtQd21rUG1JKzIw?=
 =?utf-8?B?OUJJM0hYTEZFak40V3NHMHFXYjNndkp2R3FPUm9BbDcrdFRJMkR3d2xUdGxo?=
 =?utf-8?B?SldITGZpd3M5S0RGZzUzYldlTk5JSVJmNERyckptSHVOQ3F6VU8yK1RVU0cx?=
 =?utf-8?B?QkltSkFtc1JnTzhBUHFoN3IwdmVnTlQ1NXdlcVlCNUZsd3RUMkRzZDFBUXBi?=
 =?utf-8?B?R01LditQSWxRTzlyaEMra2NpcVRWbzhJWHZqbzU4TEFHTCt3c2pJWmtYMmVu?=
 =?utf-8?B?UkVNN2JPMXg3d1h5ZDRGNzkyZ3QrZmp5WTl4SXdobWtpQVUwMTZ3U1gvai9E?=
 =?utf-8?B?MjBlNXNDNytVT1g3eG9vSzlnOGc3MWtPMUI0Y2NOZUVjWG53V0hQZ2hJcWRz?=
 =?utf-8?B?TWpRRGZRaXVEVmErMGZGZmtjc1IwM050R0d2c0VncndmbU03OHJBS1FVMTR2?=
 =?utf-8?B?MmJpaS9XQ2ZuYUg0TXhsalpVNVFlU09pSEhFYnhFME00cVhRZ25kbWo2bm1X?=
 =?utf-8?B?bncyK2FwZTFpblhmNFRRcFBWZ0pQRnNrby9jZEdiVXdBdUNFd1JKdENSRzF1?=
 =?utf-8?B?V3o2emwwRmpGWWJpUHYyNjNsTGtRSittTTJ1UGwxaEJPWjFPZGV2cjJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emxCTm9SeGhGdmd4VEZwZnZqaEtrNFpTMEp4Q0t3akNJVk5MSm0zZEdBUnlD?=
 =?utf-8?B?M0I2VEtpWDJLdk45RVBLRGxuY080TG1UUWdKekQ4SVRJVXBtanNGY0JhZHd1?=
 =?utf-8?B?VmRWNmNBQ0M3VHRUYzFKbXhFYkswSHVEZTNJQ1cxSzhiUzNRWCtsaXpGMllu?=
 =?utf-8?B?aG5ydDkwaWJjeTR1K1NDaVhhSmkySkVNcitkWkliRkx0dmd2RXpOU1FnM0pZ?=
 =?utf-8?B?VGU3dmlyM3ZhMStFZjZiWE9DTXdYNW5wY0NhaGtDTkwzVVp2Y1VVTXRQSjhU?=
 =?utf-8?B?Rjg4RTRWMy9UU3dhRit4QnkzU1pYZU5weENhUFRzanBMUGI0SXc2aWNhd1gx?=
 =?utf-8?B?bENJQmtlSDNaNzVwTmZnOUF0ZnllSEpKdzcyZVpNdkFrRFB1TVR0ODJETzZK?=
 =?utf-8?B?R0J5OXVLKzJUZ2xxcnhTbWpFNTBjSGRVclVISG5Selh4VU5yOWRDU25sSlQx?=
 =?utf-8?B?S0tiRjc3ZVNLYTdTeW5yVnYyeWZRTE50VmxnSjNIeW4xd0xxelMxUlZoajRy?=
 =?utf-8?B?Z291bWNBd2VKc051S2gzRjdDV3BZZ1IyaE81Mk9HSWFsaG5XOHRRbk9qaVN0?=
 =?utf-8?B?S1FTZ1hJeVNqU1RpVUZKb2JiZFM2VEd1UGJnVlAzUytPaEVoWVJpQTlLcUVo?=
 =?utf-8?B?OFdvTm5kWDdZWHFQbjk3Ri9UK1ErbXpOMjJqQ0ZlczJjMHg0NDc4eXRWbDRC?=
 =?utf-8?B?Y0NCTFNZMXJTYktxYUM4K0VVSEdWMUxrTmVqRndBZ2laQWpURG94SXFaS3lr?=
 =?utf-8?B?TW1wZVp2QjBZUzc1RVpSYXhXTFkvQlVnaUF0WWJ2cHpBZzFUTmRVTCs4aE1w?=
 =?utf-8?B?U3NZS3BWSHE3TGJwVlFhV2R0V1ZPL0RUTnk3dG9FYW1UN05PMVV0YU11dTFJ?=
 =?utf-8?B?aXNkNG9uS1B5WkRIb0l4cUo0VkVrZVl2L01seERtMGVZWXdMZm9Tb3JTRGFU?=
 =?utf-8?B?SThEWjB1NW1rTDN4c2sxdnZjMDdrdnR5dlpsdnM1MmxnMldVamh1MDgvMWJ4?=
 =?utf-8?B?SGFPWGZYcW5rdlBLQTlyUlVpZzczZmk1dkk4NS9vMW0zQ1d2MFArT2I4QmFE?=
 =?utf-8?B?WGw1NUZUOHhHMDNuL3VFcDZrL1owSHJtRGdaK20vQ1h1YmM3Z3IydDFOeHpa?=
 =?utf-8?B?ZHFyZkhzTFQreEVtMWVwU0h1K0hhWUFpK2ZZMVZJNDRJUU9uaStKcUtUWmUr?=
 =?utf-8?B?WVduZ2pRUy8wVy8rZ1RiUTYrZTFXZFRYZHMwQUJtZnYzYllmRWxYRmFjazdx?=
 =?utf-8?B?VGlxb1FQU0QrY1RGTjUza1JCZ2tvY2g5UVJqRzhBajJjVGdmQkdSOEN1SDh6?=
 =?utf-8?B?eGJGaEZPU1oyRVRQWjFuc3VtblQySHZGb05EdzhaQ2F3czFpMklyTDJUTHVV?=
 =?utf-8?B?akpxZTFIdmVEZk5sSm9yZUQ3M3I4RDFnTGV5S2hBQWlBYm0xSG5Sc2xPVXBO?=
 =?utf-8?B?UkNNNGtPcTcrZFVJdVgxUnpzYUNxYUFYelNUN1VwWmFudGdBbVFWL1E0OHFZ?=
 =?utf-8?B?ZXo4eUQzR0x1RzEzN0dCTXNIaWE2K2JHWkllUUYzZ0YwWHcvb2JqUGFja3Vh?=
 =?utf-8?B?S3VDNTRDMVExUnlQSG1BRWdCOEExemxnWkt3SHBqTDZyN0N1bmhTeWFPZ1NX?=
 =?utf-8?B?YnkrNE1EdVNxak5VWENxSGF0amc2WE9wVjBVTVlNZEJxRDR2MEV3azFhU2VI?=
 =?utf-8?B?d3p3bjhTVU5WZWc2alYzaGd0Z08vK3E4ajhkUG5sU2YweW5oT3Zxc1pTZlpU?=
 =?utf-8?B?ZGJmTm1Sc2tnYW5rbm1maFVIRlJ5cmZxM1M5QkVrNlpsTUMrWm1hODBnOUN6?=
 =?utf-8?B?SVIzV3g2SWNNWDg4Ky9wUytIWWdvUGlVaHh4OGV0OU5GdzJ4QjgycWZyUDRy?=
 =?utf-8?B?WEIzWVVQVkhCNDRnQjlqMDluV3F2S3VBWEh5NnM2blA5T1kycW5ZZXk4U2Vo?=
 =?utf-8?B?ZzROWlhYUHFJY1pGM2psQlE5bTdQM2tQNTQ5dTFUUy9EZDRhNUc1RE93T0tF?=
 =?utf-8?B?bGJXVGxUbXkyQmZ4Vitjc2tuTGUrRzVXbVN2TWI4R0ZLYXhDSDZVQk5jeXBu?=
 =?utf-8?B?Z1FFQzJnRk5POFZ6TWNuNzFCYzhRM1IyMkJMd2tnZGRFN3Y4K3VHOWdLU0ds?=
 =?utf-8?Q?v4zV+kX1bs5bHbEjd935FfAkP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab1b36c-c641-4aaa-d424-08dcf4118bfc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:52:18.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRJtXG7eTdVFt8s1B5qscaPh50jVvwsyy33+Tp2sQ+f6TVoBJmQyxQW66qG519ngsws57bdmnnzSGoom0pa6Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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

--------------TZspZgd0VKx34hBYV6mIFN3I
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These skips are expected.


Thanks,

Anirban

On 23-10-2024 17:05, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe: Add tests to validate GT coarse power gating 
> status and toggle coarse power gating states (rev10)
> *URL:* 	https://patchwork.freedesktop.org/series/139808/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/index.html
>
>
>   CI Bug Log - changes from XEIGT_8082_BAT -> XEIGTPW_11966_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11966_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11966_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (9 -> 9)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11966_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_pm_residency@cpg-basic (NEW):
>
>       o bat-lnl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-lnl-2/igt@xe_pm_residency@cpg-basic.html>
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-atsm-2/igt@xe_pm_residency@cpg-basic.html>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-lnl-1/igt@xe_pm_residency@cpg-basic.html>
>  *
>
>     {igt@xe_pm_residency@cpg-gt-toggle} (NEW):
>
>       o bat-adlp-vf: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-adlp-vf/igt@xe_pm_residency@cpg-gt-toggle.html>
>         +1 other test skip
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-pvc-2/igt@xe_pm_residency@cpg-gt-toggle.html>
>         +1 other test skip
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8082_BAT and 
> XEIGTPW_11966_BAT:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@xe_pm_residency@cpg-basic:
>
>       o Statuses : 4 pass(s) 5 skip(s)
>       o Exec time: [0.0, 6.25] s
>  *
>
>     igt@xe_pm_residency@cpg-gt-toggle:
>
>       o Statuses : 7 pass(s) 2 skip(s)
>       o Exec time: [0.0, 1.00] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_11966_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_addfb_basic@bad-pitch-0:
>
>       o bat-adlp-7: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html>
>         (Intel XE#2496
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html>
>         +31 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@basic:
>
>       o bat-adlp-7: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>
>       o bat-bmg-2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         (Intel XE#2874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874> /
>         Intel XE#2998
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         +1 other test pass
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8082 -> IGTPW_11966
>
> IGTPW_11966: 4f68709d9cfb120ea8208ce01d7b62f0460fbeb1 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: 
> beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
>
--------------TZspZgd0VKx34hBYV6mIFN3I
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These skips are expected.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Anirban<br>
    </p>
    <div class="moz-cite-prefix">On 23-10-2024 17:05, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172968332162.1323365.13297960437456912187@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe: Add tests to validate GT coarse power gating
              status and toggle coarse power gating states (rev10)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/139808/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/139808/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8082_BAT -&gt;
        XEIGTPW_11966_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_11966_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_11966_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (9 -&gt; 9)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_11966_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_pm_residency@cpg-basic (NEW):</p>
          <ul>
            <li>bat-lnl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-lnl-2/igt@xe_pm_residency@cpg-basic.html" moz-do-not-send="true">SKIP</a></li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-atsm-2/igt@xe_pm_residency@cpg-basic.html" moz-do-not-send="true">SKIP</a></li>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-lnl-1/igt@xe_pm_residency@cpg-basic.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@xe_pm_residency@cpg-gt-toggle} (NEW):</p>
          <ul>
            <li>bat-adlp-vf: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-adlp-vf/igt@xe_pm_residency@cpg-gt-toggle.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-pvc-2/igt@xe_pm_residency@cpg-gt-toggle.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8082_BAT and
        XEIGTPW_11966_BAT:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@xe_pm_residency@cpg-basic:</p>
          <ul>
            <li>Statuses : 4 pass(s) 5 skip(s)</li>
            <li>Exec time: [0.0, 6.25] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@cpg-gt-toggle:</p>
          <ul>
            <li>Statuses : 7 pass(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 1.00] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_11966_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@bad-pitch-0:</p>
          <ul>
            <li>bat-adlp-7: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496" moz-do-not-send="true">Intel XE#2496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html" moz-do-not-send="true">PASS</a> +31 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@basic:</p>
          <ul>
            <li>bat-adlp-7: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
          <ul>
            <li>bat-bmg-2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874" moz-do-not-send="true">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998" moz-do-not-send="true">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11966/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8082 -&gt; IGTPW_11966</li>
      </ul>
      <p>IGTPW_11966: 4f68709d9cfb120ea8208ce01d7b62f0460fbeb1 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52:
        beaeaccd284ba3b69b6dbfdc18bb89441fc99a52</p>
    </blockquote>
  </body>
</html>

--------------TZspZgd0VKx34hBYV6mIFN3I--
