Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E411CA5FE2
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 06:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD8F10EB9F;
	Mon,  5 Oct 2026 06:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jhmy5rjn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62B10EB7F
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791183076; x=1822719076;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TE5wAT09QGkv9OiOGgMpuE9EiMqNrCWQP4GvXNg2rFI=;
 b=Jhmy5rjnfcSs9+ozYMZChF+kc+2/UTD7BVet4V32jaHJr9o4/K+a/vO8
 mXrJADbbKH+ebG05aKV6m8eIJ2vmQrDct+0yjbq3ltzuxOzaS/yhTN/X2
 Smln7wHiEiVJkH7bDlZSvPlrl6X7M92Zd+OJjzWVsJwcpx+xQuULdDpFQ
 3yNz+OvCEHwpq87AaJ8yzAlnWF4ka7YJUTGak4WL65fCTu8uKACAaAgL0
 ypAWrJoQD9OJNsTDRx3jBKoEZFnUwO3ZWNkEDuzfLnE+w8zsWVwb1WAKX
 n8ZNAAReUd9M6mu0F1V/0jLpJViJZZw8hC+4JOWbLbKCSPP+gQgkWTP2V g==;
X-CSE-ConnectionGUID: gI+VG2zWSsqmVHWDKmMvaQ==
X-CSE-MsgGUID: QxrzXwbNR4W7as5MM44MAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102363172"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="102363172"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:51:16 -0700
X-CSE-ConnectionGUID: u8AZcwq5Re6dDbjVUzDO5w==
X-CSE-MsgGUID: H9l6EEdDSxueo0qnqasVoA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:51:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:51:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:51:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhlww2wwjtO+1z6a81FrceMjr/0JtgyuTxU2v2rJC0yz62JxEP5N228iy0C3AEpP2fkfHJK2Orwhko1m1UFMjaFhywvstOuXLRCfz/dlMCHZmgqdRSf06T/oFxqqpXEbdknbEjktOqvlfJaB6rAxc1OSr1kqii+cxCKlIL0DlChyjua5lJ3PWCsObevJ+3hk7C/XzGYB+VRHqUW1y3nPfARKDCDKGLHP92OHetGFyungNjmpz94t0rs0FvvsOxyZw0WDXmrQiXGt5e2T9AS+8Nlq5W/DslivA+C91/Q79gDdX/HAyGgUMRRF7at7EpA6IKbDQBS/W3/zPO2y4AGxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRos8yVxRKXcvRlk3JHHrOwXy5sNoW8qYNEqASrhGC4=;
 b=H98o7ARsMXug3IcjvK8/UvoBRz8LYeNTjDlxxYelFK+dlV+pgozfAvIiwVihrWon7u3P1iloFr/RMhrdY9Hatg/gNad2lPTlW0Jw6cYv+xNfh48uXfk48zkNsOX3NStZ18KGYAfyubCa39B7JS7jq+CHeqo0Q9gokaeAkW1VQPWXOIOJig99xPRPdBYH6vptcGs9zBX9HVU9F+CCAR2Tk+oGQTfWejoyoi3KeFsTFIwURZH+iw9LXcBSNGNMM9CQ1vP2kWJ1Y6OOwX5Z2qDIPBdrEx7G6xAg/M/3NhMN4RHwrovAfa/CQf8Vgy+QdsuEidMY43z7Hbkxmw2/KioBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 5 Oct
 2026 06:51:13 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 06:51:13 +0000
Message-ID: <6d9ae8a7-4aa4-4c08-94ca-ebb248d0c029@intel.com>
Date: Mon, 5 Oct 2026 12:21:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/pciids: sync with kernel commit 682b943f1547
To: <himanshu.girotra@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261005063943.2638847-1-himanshu.girotra@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <20261005063943.2638847-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::16) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0d8472-62f2-4175-77bc-08df22ad0bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mVnflBIrx1UYTw9MmgWoR5nfwUhfYdtPwW1mpxyPH6oILqHBOqbq73zi5jpJeNn5CIj48gX4DKfiHeOI2/qQfEO+G0WZ6D+bWWG/xFQ7/mDIwxVZh4m5ymqF3yEjUkplTh4Quns2y4ptNz3/bVm8cMgmPoE16get8HnPP10BPILCvprXltGzSZJe8nWGxkH1T8TqTJLl09L4nL/cSUmq5kx8bJ4vQP8VHHp7QQJ15JzMOOtSqloemE/yFnuWoiL0I7VnEVoD3lfXYwNOA/4NasyxFR+vjD+DFOW/ZfObYk9ZpycNlK5jsx05xP+VAK1FBbqZS5NidykMPnbxw9jOzuNnsxIAqbtkthM46A3yWsGYzXzAAjiCOCT/uE7vQvrwHzdFF3jS7OuMAShMJo84+QB1UAu/Z64/CNGNG0uTd0KZsa81GMZPMGng6nFSKs3IUe7va4gcdSZUvU2o0VX4VtL8GX7Y3rPVgpXbmOuRI3FqDjHWhH/QUm8nulKHHYqIMlFQ7L3Pht7yWEUGRkrhWpUqHHMcLNOawEkXQyPONy34Q9Hig5O0lFd5gxu/5UkGra28vI/ToyRTemkIjHo9D789aCMz97eI2PB7wmxuBbEViYl7TYfE0fBtHELUURd5mnKArI+w4VJxs95Tf1ROib5XkdPCqyqcK7Ry8B+lKrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0I1aVVEQVhuajdCMVp3dzV2RW93YWlYRVhoVHNRSzZkZ1hTNXA2ck5vVStR?=
 =?utf-8?B?RjIrSCs1aTE5SmhtQUhoUzl6WXJGOXZxU1MzVHhTdjcwdEdKZk5ZZ24rRm8r?=
 =?utf-8?B?MS85ZkFjWEc3a0xxZzlFd3dBR2NpOS9tYm1IaW44Ynk2U2hBOWRDbi9UK1Q3?=
 =?utf-8?B?QjFOVTBoVVpIOU9FSEdEcXVzdTg2dno0c0RrZ05ObjFHVUpiNVN3VURvQUZP?=
 =?utf-8?B?eGNYTzRObXd6VHFDRzcwQlZNZVR2NjVKNUpoRXM1ZVNaUWhUTEhQMVdQOTh3?=
 =?utf-8?B?TjBJT215a2NHdFM5b2sxWkVmZDNvK2NRdzBXMmk0TUtZRWlNcm1YRHZXR0hu?=
 =?utf-8?B?SXVnbDdEN0h2Tk50NFo4WGZuOXV0ZzQvTnJ6N3VhNDFNQXJ5eFdCUW9YbDhm?=
 =?utf-8?B?S2xUd2pTN1ZiUHJWRTNiUVdpV2Uxbnh6OGp6SWMzS3d0TWl5Rjl5QVZ6RkEx?=
 =?utf-8?B?QlVGTmVpN1pIWlljc3hHVHJMTkFMY1NvcnBkaEVQRUY3Ym0yeFMxMFlaYXBm?=
 =?utf-8?B?Q0pKcnVySzk4ZExtRDE5STd6TWJ1ZTVFN1NaY3dzS2JEMjlNVElZd0FGMk1N?=
 =?utf-8?B?TFNWWitUZGhmTHNmR1hJNWNhSnNxTEFsMS83bFVVRzhMekRHUU5PUUd5dHA3?=
 =?utf-8?B?ZzRRY2ZNRmRhVjNvUEtmT28wLzg3L295WU9ic1FSLzI0UmVWaFFOSnZVeFFr?=
 =?utf-8?B?YS9NR3VmYW9IQXJiL1krODJvNURsY0xDaEZBSmNza09NN0VFVEpnaXloZnpQ?=
 =?utf-8?B?ZXY0RExncXNzQzlsS2FtYmRoNWhaYklWb2ZmZlNDdFlJSUpPVnhqbWphMmpC?=
 =?utf-8?B?NWpvSlJXQmFmaW5UTG5McFFDRkgvaXQxekFmaTVJQmZFNkNGMElQakRBaUlB?=
 =?utf-8?B?RzE4WXgza0lZZjBTdTNISHdmY1dnWDloeUFaWnlubnFpVDdka3FxMmFHV2ZX?=
 =?utf-8?B?NzIxeHZvN1VHOENwUGFMRmhYVVNrZTBKNHA3UnMrNERGTExGYVdKMXM3Uzda?=
 =?utf-8?B?R0NpUHZabUpTY3prcmNqNDVvekQ3ekY1cG5zZ2hrTnVRYTE0bGFyTG9xbW1U?=
 =?utf-8?B?U1VDUWhlbFlEZjZBMnZjTCs5RnVBUXVISFlOZ3I2ZkEvOUxKZ1FFcUh2cXFQ?=
 =?utf-8?B?WThCS1JaTXkxejZVblJVZkhyb3lYbkZlTUoyTnZBTWJFdW40Uk9Dd2hORDU4?=
 =?utf-8?B?V2RiSFNZd2FucW4xZDYwMzNzdGJDRjVMVzZIYWg1VFpYS0dCUUN1OHVWTjBj?=
 =?utf-8?B?U3BsaFowc3FLVGVFdGZaRVAxRVdSd2MvcVJuZWdpbGRPS0p3NityNXhpdlI1?=
 =?utf-8?B?cnduS1FjMktMWjJZTmFTUVNnd0xoNXdOdGQwUE05Nkd6NlJGUDR1bTJvZmk4?=
 =?utf-8?B?SytCRzYwNC85ejhiZ05IRmF2Q2tYTHU5dEs4R0xpK1gzeU94KzQwRUdFckxR?=
 =?utf-8?B?YlJpRlI3bmg4UDczKzNGMmVuVTZ2OHNsdi9WUDVldFphVWVVcENUWUJDOG04?=
 =?utf-8?B?QlR5dkhYZCthSDRydW1BR1hSNHEyTktoK2xkakZIK0pwZlFHUVZxeC94akps?=
 =?utf-8?B?UjF0TUVQV3drS3pGa25aSDJHUVBvWlpONk9kQ1RCSEdZQ2JZdERTeDk5WEJG?=
 =?utf-8?B?enlYdzl3V29kMVduUEwzVnAzcnBDRThYV3B6UEFYWm5xQzVZa1l0Z3lBdnF1?=
 =?utf-8?B?U0duT0NoSnhWQ3dqRmlybVZzZEY1OEw5OG9BRW83YnZ4UmpLRUMxblV4d0VT?=
 =?utf-8?B?Y2Z6TlI3RjZacjNtWGFCelNCY0wyWmZqeVBBWlVQU2kwT0RXL201MjdoT1FE?=
 =?utf-8?B?UW81bk1MQ0dYandXTjBmeEFXQnVvYS9OZW1UUGdwVENlQXRNRm1Ed3IrTEQ0?=
 =?utf-8?B?c3d2YzRjdGFLS0xEbGRpZm9rRXROd0l0clVudHB4QWJXNytUVFQxcll5dVJZ?=
 =?utf-8?B?VURKNHdKVDFWVU5IWGxyazF0cCtZY3lKSU1VeWt3dmVycVlPamZiZ3NHTnpo?=
 =?utf-8?B?YWt1S0JLQk1qSVVialJPN0ZiUEtWYlREb3Qzd3FCaThFVnpINmFxMVJ5aVZN?=
 =?utf-8?B?d1l2YUZKYk1XVTRVQ2QxVmdyc0V3U29PMzI0YzJJYlBZYmx5UE5XRzFaSnhP?=
 =?utf-8?B?ZXF6clkzWEVCRTd5NkpxNlUxMkdtRnhsNmJwVzMzdGNEalJUL1JNWGNEc2Rs?=
 =?utf-8?B?elYyNXBwczBZTVhtcFZ4TEsyejFGU1ZQa1VvN0RTOHBPbXdhb1I4eTcxazlr?=
 =?utf-8?B?WEZNQlJDcE9XNTZPQ3pzZGFWZ0RiUVM5d2FkTEdCVUhDMWZUVU8rVkc3YjdP?=
 =?utf-8?B?YjFXdSs0RFFjazR3VzVvUng1K0tWZ0c4T0dSL2RsMjNCWGhDTFNMQT09?=
X-Exchange-RoutingPolicyChecked: ANoVonVm5u7dRIR+woLF+FeoCOdoZPPq+mrK1Bv4ROOptTrr1yiSzQw7sCxW0fQXFTJWmLgKur0j+R4OSocXEOCsxHRh/0TjhLiyGPsMtVmDLmG7BHvrPup2+NMHdAlbDjjHX9r5ogEnruOnbkqeGBe687ccGaFQCHdNpm1qHw9kW64W8czHghgtPpWv+tQVyvzOcSBKvpRaRnGu5cxkeC8d7CKRaObriFiyYqCmP+EP/z3vj1iBjOXSDukgG9BtwArruPnRDjKoerH6uqNJ11RTCbAOT+R8Yl7pfFXZDT6v18tz906m5ojEedXGaTeAB5lqHmOaJyLRMKirTqm5nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0d8472-62f2-4175-77bc-08df22ad0bae
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 06:51:13.3982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHD5rw4cBfGex2QlQ3pM3+C3LoLg8ccPTSCSt1oGcGS+dqwB3do+wmsqx1Uc4rvADpbvvC+nAv/NNbe7VCKA4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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


On 05-Oct-26 12:09 PM, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>
> Synchronize PCI IDs with drm-next kernel up to 682b943f1547,

Maybe s/drm-next/drm-xe-next here?

Other than this LGTM,
Reviewed-by: Varun Gupta <varun.gupta@intel.com>

> which includes the following changes:
>
> commit 682b943f1547 ("drm/xe/cri: Add new PCI ID")
> commit aee2d33da882 ("drm/xe/ptl: Add a new PTL PCI ID")
> commit ca24e8d9fa48 ("drm/xe/nvls: Update PCI IDs")
>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   lib/pciids.h | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index e32ef7634..a21609207 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -880,6 +880,7 @@
>   	MACRO__(0xB08F, ## __VA_ARGS__), \
>   	MACRO__(0xB090, ## __VA_ARGS__), \
>   	MACRO__(0xB0A0, ## __VA_ARGS__), \
> +	MACRO__(0xB0A1, ## __VA_ARGS__), \
>   	MACRO__(0xB0B0, ## __VA_ARGS__)
>   
>   /* WCL */
> @@ -893,8 +894,9 @@
>   	MACRO__(0xD741, ## __VA_ARGS__), \
>   	MACRO__(0xD742, ## __VA_ARGS__), \
>   	MACRO__(0xD743, ## __VA_ARGS__), \
> -	MACRO__(0xD744, ## __VA_ARGS__), \
> -	MACRO__(0xD745, ## __VA_ARGS__)
> +	MACRO__(0xD745, ## __VA_ARGS__), \
> +	MACRO__(0xD74A, ## __VA_ARGS__), \
> +	MACRO__(0xD74B, ## __VA_ARGS__)
>   
>   /* CRI */
>   #define INTEL_CRI_IDS(MACRO__, ...) \
> @@ -902,7 +904,8 @@
>   	MACRO__(0x674D, ## __VA_ARGS__), \
>   	MACRO__(0x674E, ## __VA_ARGS__), \
>   	MACRO__(0x674F, ## __VA_ARGS__), \
> -	MACRO__(0x6750, ## __VA_ARGS__)
> +	MACRO__(0x6750, ## __VA_ARGS__), \
> +	MACRO__(0x6751, ## __VA_ARGS__)
>   
>   /* NVL-P */
>   #define INTEL_NVLP_IDS(MACRO__, ...) \
