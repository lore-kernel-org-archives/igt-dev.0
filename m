Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDEDC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 10:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85F10E0CA;
	Tue, 28 May 2024 10:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zd84W6JQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D09F10E0CA
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716891178; x=1748427178;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yXHk1r6tnR6cbvonvujenAW1fS0E3abZezgTVgiRMKM=;
 b=Zd84W6JQcYQZYy+xFXjc1yMaV/nkw77IYnvWI83bJuI8EE6z9ra2FtOZ
 qjsgFMqZUQdUZQ4bSp6ntAq0rjWRaaO6tBr17UZffcyjiFFZdMUCsPnLC
 NeDqzPfoYG8KSln9P4DLX0G9uMuO0OLZjilDgk7b71vKTj39JFOAzZACT
 hqEF0pK9UnqvxSzuo++23qI/u3QmHv6TGy4nDQ3dqFTW9iyWazEENyRFE
 0iqqPA5KqVq3xMLo2eYpno9pTHNmbLpda8Bbuy95FwpRycWCA2iCwqlR9
 FbdhYnoHIHATKhKzQVHc8OiuWI+xXzhFKWQaUgJUfwzmu3i400y/n4PhP A==;
X-CSE-ConnectionGUID: b+hOAg5TQ/ivO5Ugx6rEtA==
X-CSE-MsgGUID: HaWtANL9RASmh+8pOv8r6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23890760"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="23890760"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:12:58 -0700
X-CSE-ConnectionGUID: R7rHk3j3R+KP2iNth47iPA==
X-CSE-MsgGUID: y0rZrmtFRAyiq6twEzwk7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="65858601"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 03:12:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 03:12:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 03:12:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 03:12:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 03:12:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOznLvwkndDvvgc5fxfwjTe5mnsol35tT48CQf3yYpXJoMoQVLRWf11BMYFn/9duLHxIOOavp6mjzB8FUtC8ZcL5pvYn/VGNdfvbxeeYISG7LXNr7fVqLWP2EQ7+PKQlKW82YjOOZGhDJE+9XH4SQoxKoIdN2NGZ6zPbVpRo+BNYs+4m4XYObR5dImBxfrhM7xMQ7jTaB/O6wgErROSGnP0/v1glI47tHv69aVpVgQWRNR9HKevxIouV1PSxtKD5ZRZQKJ74HBntZESowLp0K3MyO8AW8a7t7C7QRexcVbkReV74jAmSW7fnxMAbteNEZpYnzfslkPC+mQ4omRMY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOvtYtJ7/djIASvry0YAUKpO0pvIATFq/9p4NFhMAqo=;
 b=KU1nnmRUuePDbVqrnq8CQ8JgjHRg2b9NuLL3fJvpyWiqfsXWWbPluubqgZ1O9pj/l4MUWT6cXM7CMKzh609WxevS4q+nBWLtNQ5x8MmrgfJfOw+gNNY14x9LihUWY9Sxh1BJC3PlrY20kti42Xwajh2h2Mi+YAnYNeKg/ph8JwB0zEbyajr303+iprcIG92bf+IWJxIWz9sk1NhQ8rAI4rXU94wg4H5aNwBRdkMADUyD21B/06LLAK0iDqUV/zox3e8BdJNEDT4xd2UEpNWkLPagKbjjZsfAGYNac32hGLI+/XGumZJEPKA78Akh/RIYVenvvF/EUunBwWACrEdcQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.28; Tue, 28 May 2024 10:12:54 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 10:12:54 +0000
Message-ID: <a426bccb-ada0-4a61-af2f-8ae4f2e9147b@intel.com>
Date: Tue, 28 May 2024 15:42:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate
 the deep sleep state during extended vblank
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>
References: <20240528100944.561032-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240528100944.561032-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: b761858c-68ff-4938-c09d-08dc7efebd70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eS96SUY1NzJodmcwbWtjL0JhSnZLcmhsWmJxYWZJdlY1SXB6UUV5eEl4V0RB?=
 =?utf-8?B?d29yWFNYWUFsbWZpakdtL1ZMRFJLbWVYZVEveEw0NUxiUU5HSHk4aVdWTHpW?=
 =?utf-8?B?ckZZUHZQcmwvRUZTcXJHdWxqazMweFBCbFlYci9RLytDVzdMYzdadzlnV0d1?=
 =?utf-8?B?Zjd5NkRmei9nTGthZ0hyZnd3R2sxazNwaWgxWURienVLb045TWxWb000bVQx?=
 =?utf-8?B?UlBGM0hobG1zOTQ1TjJmK1FqM1JTbm81WDdFUU1jVjYvaUFMSnYzU0tadElr?=
 =?utf-8?B?aUlwbkNzeVYzWFVqZkdNdHdmT0FHK3lMSnZSYlVRZGtjRjBvdmpKTnZwNDdX?=
 =?utf-8?B?ZXF2cVYzaVV6cFgxcjJOaG5aU0RvRmJBMmxVcmFGcXVJc3M2RXNBREFOMWEw?=
 =?utf-8?B?Zk85SytyZGtCN3ZCMnhQRVoyRml1QzcvVkJDRzZkV0g4S2xDT1VYaDJtR3Zw?=
 =?utf-8?B?S01DS1piS01panhUZHM3RjdOVTlWcHFreXlNaFlJSWZ3MmdqUy9LYkIzRGxK?=
 =?utf-8?B?WE90TlZpY0oxUXB6MWlodnI0dVkra0pueVhvdmVOVFVrYkRJNTRpazJOeHI3?=
 =?utf-8?B?QnBZZnF1UlFYdzlWWDdvUnJTVTBwODdhWC9Kc3krc1RsNHc0Nkw4VUU5dFh0?=
 =?utf-8?B?NWtTekszRmZGaUNjOVRSSGVoZzZhbERsblpjZHg5V1JqbHU4UXQxZkpXUnl0?=
 =?utf-8?B?akFBVTJWOVpmV093djd1cWdOa1gvc0hoZktVQTNxaERTeEw5aVltTEVqU2xy?=
 =?utf-8?B?dlVseUhvejFpOUppMkhtaUN5eUhzWW5JSlI3UmNRTHpPbXgxWHI2NWlpb2pv?=
 =?utf-8?B?Y0Vta0tEWURpNG9LTDNocVZjcVVKUE9IVW9aOHRWaFJCQ0tBbFVta3VwbUZN?=
 =?utf-8?B?MFpCMWJxOURNZ1ZTT2ZtOGZyTUo5WG9vV3Z5RTk3eUFqeSt5QnFmTDVCSkhh?=
 =?utf-8?B?Rjd0eXREVTRHZ1FyZ2JhcGdIQnRlRk5BMU15UDdocWh6d1djaVNyTGswai84?=
 =?utf-8?B?amRlZ0xUeGppL1hsdHg4MlBEcTBFeFNyRWRLQS9lMHQ2Qjdtci9QcG8vdlZE?=
 =?utf-8?B?UVFKSThPVW8xamJWbHltWWU4b2VTMTc2T2R1SytRdUNDUU1lTFBzWmNqVEtz?=
 =?utf-8?B?ZnF5YmsxeW53Uy8rWHlKV01kZnhlTUdGUWsxR0E5VkNIT0FaN1R0MXBEZFcx?=
 =?utf-8?B?RDJWLzRUbkZjdzZkNTNxNDdoc3RsTnBDdkpOSS9OU21ueU9ybENKSWlUT084?=
 =?utf-8?B?cmx1UTc3SGJ3bnZjR0tIYUpBVmpjY1JYMlVBSUpNekVYRmxmYktLZkF3VEhs?=
 =?utf-8?B?RitITnNwdzQvT1VZWHF4TVMvdVhnSW15YkMzYnlzR0FpNXBtdTViUk1XNHNX?=
 =?utf-8?B?SDRtWFBLSTRYMjRKS3ZjTkdSWCtxUmNkWDJBNzZpQVFVZllRZzVya0JoT3d0?=
 =?utf-8?B?N1pmWUgzQ05HVDB5bTUzeFVmamowaDc0bFNNV0g1R3ZDbWh0bGx4dHJnQysv?=
 =?utf-8?B?RnlGa09HYkVaa21iNFo0WkpCajVjZjloTjR3dktlY0YwL1o3TXdxeG5MWGFp?=
 =?utf-8?B?QUFGcXBzS2hmODVEaUhUcktyWkIxTFNXTGlNRDljSXZDWU5XcERTYzN2ZDd6?=
 =?utf-8?B?TWRIRTNMRGV0VEp4MnZtM0E0L3JvZi9zcVE0WWwwN0RteGgrd3E5RGFIZTVW?=
 =?utf-8?B?QnBnMXpqMzRFN3dmZ3JNdmpYTXhGQUlwWGUycWQrb2Yvc0xiVlFXN0RBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpUVmtLdjVmTE1pZC9tcklrWWFnSm8xMnFSNDlsVS9PcnRqb2xKby9DK2gx?=
 =?utf-8?B?TTZ1Um9lMkRmY0dhQVdoUm1VaXFBMnpESGgyZ25wVDU5WWdBYS92WHI4RTZT?=
 =?utf-8?B?SHgrRGtFTHFmcHc2Vk82dXYzOS9CeEZlRmJSTENTQk96RC9ZL1ArbU50VFpp?=
 =?utf-8?B?NGljSGJRb21BandBZzMrV05Bcmk4dE1YQzBLMVk3SmVTZUtHL2k1UEljTk1m?=
 =?utf-8?B?VVR4cjVCZnVCalQ1SjRPRk84UTQ3cjJVcnNDYnNEU3lyOXJlRUZONkI4R3Ey?=
 =?utf-8?B?SHU5bjh4elM5VGZ0QVA0RjNNSUZ0c2ZidHBiYWpPNkJWS0h3dUhmWDdZR1o3?=
 =?utf-8?B?UlBTbjExU1Y0WDNUbit2NzRrQWNyazFjL3Rpejh0Tm1qSVJDZ0xOQWtYWVRZ?=
 =?utf-8?B?UGpJTDFveTRQbGFETjBYWktqQjVrNUtvU2hRZjVrcVM5bWxGY08rQnA1N3B4?=
 =?utf-8?B?Q1JOTHBjc2YzNmJ5UTYyV1oyRFJ5L2p0aGVOa1ZPRUg5ek81TlNUNWNLNWwy?=
 =?utf-8?B?SXptbWZLY1EyZW1EM2t5UFpFRDJkVmNZOXRwdDczYzRpMUwxcERIUUd3eXVV?=
 =?utf-8?B?cFRiMHE0dWFBT211T1hPa1p6YWVSMVZBblRtWk1BdThsa3pGOG00VFVRMFBF?=
 =?utf-8?B?Z0EwODA5Uko3VnFwaHVHVnUwRi9YdkJVVjA0cThudk44Wk11b3hIMzFXM2U5?=
 =?utf-8?B?VllmdTc1cHZXUnVXLzJIcm9FejRFM0FwNnhhMngwNzVoUHE3Rm5zUzdwTDJX?=
 =?utf-8?B?aWlGdHp5WDJ6MFkvR01sY01paUZEM3luYlF5ai9RUmRBTWViSDFZcGJjSXVO?=
 =?utf-8?B?Qk9KOHpKUnB6R0RmaS9TUC9RdDgyMGY1amx4b242d2lZRjB5dk1UaFBHNXZU?=
 =?utf-8?B?NGJWYi9PNU1oVlRzYlMzOXpEeCswek84ZUdrbURTODVQcE8weGxUV1ZlMjg5?=
 =?utf-8?B?UlppcGRLcnZUYS9USzY3VUhLUzNZOG9xZnF2L0ZJZEk1Mm9UdkR6cWlLYVRl?=
 =?utf-8?B?Mkl0N1d5dVhUSVFiemQ4WldNMWN3NEE3N1ZlQzd0dXRMUnR0VUVCMWdPZzFj?=
 =?utf-8?B?NW83OGlqdGpNQnN3TXZPV1QrcDhMMlBwQ0hLVHEvOGFMeURwNmJPV0hickpo?=
 =?utf-8?B?dnNuY0l3QUwzQTVyN21VbExDLzV2UnRKRnc0bzlCeWtXS0U4OXdvVTRVQlB1?=
 =?utf-8?B?dmlwVFNlZzI0R3psL3RuNmpaaGNsOGhsa0JoNHF0cFZsZ1VKUFJnMWhtclda?=
 =?utf-8?B?c1pFZVRjSEI1V0ZOa0VlZTh0MnhnYXpYMHBPMlFmSWhaVzdLdGNodzQrS09o?=
 =?utf-8?B?YU1TVW9jdENkMFNaVUwrcFpjMlFKTFlHYUNheGtORm9CTitmSGtPeVpDS1Rv?=
 =?utf-8?B?bk1NWG9CV2JITHU0bEdRT1ZKWllGbDFtTFZMSVBsT1lMKzRZZ3ltb1ArZE8y?=
 =?utf-8?B?QWVPRFZTOGVBczM0YTVIQkhLVE1JRjFGeExtSmdMalkzTmgrdVBaNG1wMXgz?=
 =?utf-8?B?a0ZxL3NIN3h1MFdwSzVTNytjVmVreTVOZmJGRzFxV0s1SUp2MnJJelZnWTFr?=
 =?utf-8?B?ZnFzdU5oRjVFdlh4NlRWZGRJcVZjbU01OGl2K1JnSlA5NWFVOXVNYXg3OS9w?=
 =?utf-8?B?NEFkTWY1b085UDY0WExiRG42UDk2a1Arc21IWWxySDAwSjdpQzZFdXpJS0Jq?=
 =?utf-8?B?MkJZTkw0d1hVOGNCUTNETWQ3a0doSXk1eXNUM3NUaGkzR0RFTUM4NUJSakVN?=
 =?utf-8?B?MHNpT3k0NERoYkVzMWdNYXpWT0JuVHlhYy9MVndDQ2ZKNHRkRzRzTTBXZTk0?=
 =?utf-8?B?N2hDVHBFSDZ0SXZIREtQZlo5allvcFRxd1g4ZWJ2VjhHRXV4Wm5USFYzQnVX?=
 =?utf-8?B?cFJhYlZ1Y2ZFSkI4cVdKU3NyalBKa2FzaC95bXhDTU1QcFdvaEVCWmM4RDhm?=
 =?utf-8?B?OVZQVE5tR0p0SzJEMGVyT0dPQ2tMSUlGSlFqcE9rS3BEUFBjY1l3TWJSMUR6?=
 =?utf-8?B?RDRZK05hSC9FR2EzODRhemtuazI1RXRUbUNLZXk5VDhDZHBObnpCM3Y2Yytk?=
 =?utf-8?B?YllEa2pwMllja0VMMHFzdEwwT292K08yWFIyamRuVkRaK3RyUTRUSUI2YTM1?=
 =?utf-8?B?ZGhYZG9KWkNxRDl6NDE4OWs1OTkvSTBQeTcvVjBrYW54dUVES1JRWmw3RFNa?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b761858c-68ff-4938-c09d-08dc7efebd70
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 10:12:54.8234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlzGP1glrnP5aafSCNLp59/uKO532uH8PW7WaEDf4ZIc/PCRpWhvpZTnFvbiqxgfbtJMv6S2b6/AaksBUYT4ck1gP1Z5wZZSwh+dRf+zeYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
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

Hi Jeevan,

On 28-05-2024 03:39 pm, Jeevan B wrote:
> Add a new test to validate deep sleep states during extended vblank
> scenarios, where two frames are committed simultaneously for a given
> time with reduced refresh rate.
> v2: dealy of one frame added to simulate extended vblank.
>      remove vrr related debug checks.
> v3: fix typo and add define. (Suraj)
> v4: fix structure and add skip if no vrr monitor found. (Bhanu)
> v5: remove redundant code and correct delay logic. (Bhanu)
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 72 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 7766d34d7..7ce1b7051 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -76,6 +76,10 @@
>    *
>    * SUBTEST: dc9-dpms
>    * Description: This test validates display engine entry to DC9 state
> + *
> + * SUBTEST: deep-pkgc
> + * Description: This test validates display engine entry to PKGC10 state for extended vblank
> + * Functionality: pm_dc
>    */
>   
>   /* DC State Flags */
> @@ -89,6 +93,7 @@
>   #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>   #define KMS_POLL_DISABLE 0
>   #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
> +#define MSECS (1000000ul)
>   
>   IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>   
> @@ -584,6 +589,64 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>   	return get_dc_counter(str);
>   }
>   
> +static void test_deep_pkgc_state(data_t *data)
> +{
> +	unsigned int pre_val = 0, cur_val = 0;
> +	time_t start = time(NULL), duration = 2, delay;
> +	enum pipe pipe;
> +	bool pkgc_flag = false;
> +	bool vrr_supported = false, flip = true;
> +
> +	igt_display_t *display = &data->display;
> +	igt_plane_t *primary;
> +	igt_output_t *output = NULL;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		/* Check VRR capabilities before setting up */
> +		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> +		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> +			vrr_supported = true;
> +			break;
> +		}
> +	}
> +
> +	/* Skip the test if no VRR capable output is found */
> +	if (!vrr_supported)
> +		igt_skip("No VRR capable output found, skipping the test.\n");
> +
> +	igt_display_reset(display);
> +
> +	if (output) {

Do we really need this check? if vrr_supported check is pass means there 
is a valid output available.

Apart from that, overall patch looks good to me. You can use my R-b 
after addressing above comment.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +		igt_output_set_pipe(output, pipe);
> +
> +		data->output = output;
> +		data->mode = igt_output_get_mode(output);
> +		setup_videoplayback(data);
> +
> +		primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +		pre_val = read_pkgc_counter(data->debugfs_root_fd);
> +		delay = 1 * (MSECS / (data->mode->vrefresh - 10));
> +
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +
> +		while (time(NULL) - start < duration) {
> +			flip = !flip;
> +			igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
> +			igt_display_commit(&data->display);
> +
> +			cur_val = read_pkgc_counter(data->debugfs_root_fd);
> +			if (cur_val > pre_val) {
> +				pkgc_flag = true;
> +				break;
> +			}
> +			usleep(delay);
> +		}
> +	}
> +	cleanup_dc3co_fbs(data);
> +	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
> +}
> +
>   static void test_pkgc_state_dpms(data_t *data)
>   {
>   	unsigned int timeout_sec = 6;
> @@ -687,6 +750,15 @@ igt_main
>   			test_dc_state_psr(&data, CHECK_DC6);
>   	}
>   
> +	igt_describe("This test validates display engine entry to PKGC10 state "
> +		     "during extended vblank");
> +	igt_subtest("deep-pkgc") {
> +		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +			      "PC8+ residencies not supported\n");
> +		igt_require(intel_display_ver(data.devid) >= 20);
> +		test_deep_pkgc_state(&data);
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while all connectors's DPMS property set to OFF");
>   	igt_subtest("dc5-dpms") {
