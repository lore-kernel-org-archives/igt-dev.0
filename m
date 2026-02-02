Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEB0E73140
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 07:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BF310E262;
	Mon,  2 Feb 2026 07:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHoWmjhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FB510E262
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770019125; x=1801555125;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3aGJ4lgV3JqrR9E2cdz5u144D+HhqHuSrTZ/4cMqIaA=;
 b=OHoWmjhfjTsWO9+7aW3pX3tVyIWXvK9EhKdu69M9+H8IdjA+CYYXzbar
 hBPPsOE1JUZPhcZasGG8WVXVq9sP2Tnb2oFngWwdKMTgPO5oTI0H+h1HN
 zGuWGZhOtN06+9XqxphZ5JeC7vYpDuOnDYYdJ9DJPXTp43lFhdHpl3RoW
 JNEsyvIOU+Uv3EulzXtPKaYjAAtj7GpRDIOsXmFTzKjIHwkL8KS3/w++x
 PURxOMcBHLD+SAr9bkRb60Jn3H/rkNPQ4j59S9xz+Na2wilW1UwJyJ0P6
 xyaiVuXr73ioHZ3d06tbVvs0WJeOSfnyV8tKGf2K9MXAyZaZScNctxzyX A==;
X-CSE-ConnectionGUID: uaE1FXXkT6ys8Pj6JNH3Yg==
X-CSE-MsgGUID: cUw8zIRrTVuk/vVTtuyG9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81910630"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="81910630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 23:58:44 -0800
X-CSE-ConnectionGUID: KM97r6OERIqbR5r2ptYBhA==
X-CSE-MsgGUID: emK9nMcQRHOouFnUUShH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214380863"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 23:58:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 23:58:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 23:58:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 23:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVf0F0lYNALff9ScIeBVHojpW1xmpINBzLsFvIG8768RSSZ9EfRDTPyNxO9h3aiOsdUFjiK3DsayA/59VJ4NfuUNiYQoUxDo12PE15hq2tW5o5eQpOu9pW3OBW57/zJ6l4Fyetoc0uBdpj1lcdJFEa6C9MH4xXwuBmPxDax0l56lXSdQYKhqb8vaFk3f9lva7B+TWCP5YQJeCqGZa7ak+D0RtGShmOrwsXmEDjqg/72fBDHB+JEovUpJL+jJjpoAjonD2dla51/F6Wtzg2whNXU9xWe4JP4tSEAkjZpV0dv91aLYoVq1mClzhC3SwK1t7KE/q8MNpvTDBMXnUhtViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hppN4mIwuveJhEwOaZkYY+XCHa5La76Akq2dTk80FBk=;
 b=RMcTOBy1iFWZWA6oUQqkvUgnUGMeW4X4361szqAgEvfVpCnQAWra943h09msuK2/gEfyT5ddm7vsDdnxhMgV87/vWRd2mZCdT1VBaAbiOhqXV47Z5VIMfpT5pPoRGaWWOT9x5YJhapVDVkQqDnqtmGFeDFU9gP0zugi9NGdQhfFjJbtr4fIolz/mBOEtu7vuvYcQaaLhrquTEXqcQ3CA4iOKjDkpS6iXx37zSY/MH41foIajo7AXipp1uyRC5n5PmogenzJFmtEzCQ7IMCFUFoCFj0qOVmuLVe+JTfwAH0EzIWEJR19txlWlwKlGETb9vV35kwgGWOhYjVCGX8dDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 07:58:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 07:58:35 +0000
Message-ID: <a902e00d-fef9-4147-8166-1cda4e079c71@intel.com>
Date: Mon, 2 Feb 2026 13:28:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/hwmon: Check temperature limit in
 hwmon-read
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260130103553.1935825-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260130103553.1935825-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0139.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c9dffc-0b50-4b93-53d8-08de6230ddcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWdZeUJxRWZjTEY2cEtIazhQbjd0d1FLdVhLRCsrVGQ2cEJmOE1xYVpPWi9w?=
 =?utf-8?B?dU1Dd2lYeHdHNDhOdi8vM0t5RDlJdkUySklqaFBCNFFDSUV3b0dqTEZBaWdG?=
 =?utf-8?B?M1l1YUp0WTk5a1NjWW9Oemw4alo5ZGxrL3YwUm1hRmpqb1MzNnRLdFp5QlZK?=
 =?utf-8?B?UG45a0pobUdmVDNDTkpBVzJ0VzJUcXV0eEJrVHZydm5WR2IyRHdpbFN1Mk5Q?=
 =?utf-8?B?MGwweDZvbzBLekQ5eGNJWHpodkhvUjdKK3pERG41STd2b2FJbFlSV0VNNG9D?=
 =?utf-8?B?NVA2MTBxUlZERUZuYzFwc2JRWmx3TlFZVTBXYk5HbTQ0NFgyN1o2QXExZUpU?=
 =?utf-8?B?SjVmREJkdk1tT2t5bE1CcnJoMGNmOG1FRWRvRm1UTnAzN2lUek1xVFFEQlht?=
 =?utf-8?B?MVJCNmd1WWxPVDRTcmxKQ1NMKy9tRlg1QVFzUUc4NFJ3T3poOHJJUDRjMWRw?=
 =?utf-8?B?Q2t0K0prd1g3UmlrTUhldHpyZzVyeklXQnF4enZTRC90ZVZXaVFsd044SDYr?=
 =?utf-8?B?dkJJZk1vT0lNZ0h3encwWjJCUi93YXZHY0VpT0d4aHlTWDc3RzJueS9STlVo?=
 =?utf-8?B?SEwwWGNoOG1zK1V1SWUwekZCSVRhbXZyU2JlaEk2RDA5MUhLVVFHV08vdkZU?=
 =?utf-8?B?eCtLUmlxaDNJRlJQaDYrS01hZ3F2R0Q2MUwramJRUmtTK2M3eVl3dVdrcCtT?=
 =?utf-8?B?YnpTUXVBKzNkWTArWEowbjgrM3V6K0M0OHhNUGsvYVNLSHRaNjZtRUxrTDZZ?=
 =?utf-8?B?d0hSWVUxMmZCRXFOdG1OMC9PRE52MWhhM2lYVnJ2b1ZJV0V3bDlVUVRjb1JJ?=
 =?utf-8?B?Z29WcjRvMzFjcnNVK3VUeGZOVzJJdnFRWjN1N1duSnpabnptejd2SlU5b1dx?=
 =?utf-8?B?QzZwaTlhWGJHbitBeUhMUUZmeXh1ZkY3a1pyaStWVU80QzRTWGtOU1BjRnd0?=
 =?utf-8?B?bmVoVEVEQXd2QVV3SzNDM2cvNDhpRUhsVWpPdkJORUJzcVZWL1A5ZDZDVVdn?=
 =?utf-8?B?ckRFWCtWV3h4RjZLYjc4enRzOTZpaHdtRVo0Y0lEUHFCMDk4V0JZdUhmUXNn?=
 =?utf-8?B?VlZQS3dxUEVFUmI0bDRZMk1WdC9HdVNrekxtcmhUeXZCT28rZGtPNTJRNUd3?=
 =?utf-8?B?QXRta2x6K214a080QkdpVm53bm1uVjZ4U21nT1JReHBQdnF3bzErcUFpK0li?=
 =?utf-8?B?dThjaXdMbXkwU3dxUTlEcDJnN0piY0g4bzZRWk5sMWpHM2xndFIvOWRlUHpv?=
 =?utf-8?B?T3FsRlBLM1RRUm4vR0QzR0lNMnZaT1FkOFBETDVTZE10L21YMkw0RHJEWmpQ?=
 =?utf-8?B?UjBOTXg4RjZ1SUZqaVBORnVtMmpNNGl3ditoeGc2aEVvRUozQ09tWllXT2NN?=
 =?utf-8?B?em9GdXpKNXlNV2liNVVMSDhpNnRMMVI0aThFbWtVTWdYMWYyREdwclQ1TDNo?=
 =?utf-8?B?T2hGMENRTnVhZDhPWUd0TG02N2UyM01NQlVhcmR2RHhSUlJUclRTZktIOEo0?=
 =?utf-8?B?MVBIQkpZSzIwUWptZEF0QWhsUHJ1SHhwUjFlMmxVUFVscXE4OUNOTlhpK1M2?=
 =?utf-8?B?aHJMdUl3T3luMHFPdHFhNm43VjVSY3Zabmo0SG5VaDVyeG0rM3JoOERWaFQw?=
 =?utf-8?B?blJCdE1kdHdRdXlCalBXaDZqanU4aUFZTEtraHJQdlpHMGVNWVAyL0FPVjdE?=
 =?utf-8?B?b2FKcnZ6Nms1U0hSeGVjZThBcEZ2bkc5S0pLS2s2K0FPOTA5N2JGK1Ara3Ir?=
 =?utf-8?B?VXlnbEFzVXhVQWpUUVhtN3N2VE1CdGJFODl6SE44WHgzWGxwNDRHUmRoeUp0?=
 =?utf-8?B?aHVoc0U4eS80ZHNFN1I0TmUzSkVOcUN1NWZSUGtDem1XVk9YT0ZIMmUyWUtP?=
 =?utf-8?B?NVVqYlhRbXV4c2F3bTF1c25zaVZJeTFINGV1TUVDYWR5NVVHcnFKdkJyZVZj?=
 =?utf-8?B?Y1lBaFk0aCtGbFM5MHAzUUl5dW9GOGtJSTVDS295WDZxaEI3VTVWVC9wS1JY?=
 =?utf-8?B?cmFjTjNmZDJBMjcyQVZZelBsbGpjUHpieWdoeHhlaWJPUWlBckcrcFZJM09N?=
 =?utf-8?B?SURxZFA0SW90MU9EbkVoZDhQaUR0YkZrQkdGbGMwVEtXVGE2bjhxcm9RaU9O?=
 =?utf-8?Q?Ff7Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnVoVG1jVWluckRCZmJMK3JWSGpyUDBaM3N6YmRLSVlQNllOMHpwRk5XUHFQ?=
 =?utf-8?B?SW00S3QvNTlyM1FESEYwMUVIdmpSNVM0cG5pL09vYjBlQjlzOGowa0dibW1M?=
 =?utf-8?B?Q0NvOWtPSWVwcCtBaEl4Y095WlMxY1pwaHN3aTNWT3l0NUZwV2FVMDNUeGFX?=
 =?utf-8?B?ZXVFcjFnK3dPdDVLVzh6M2tFQ3V5RElYWVc4UkxqL1NFREVsY1l2cGRpcXpV?=
 =?utf-8?B?RjE1cG45YVpXOXAxYmhxdCtiTmVkdkNuVDlNNFQ3cjhkcWg5Q1JEbVpxRW9T?=
 =?utf-8?B?K2NJNkxFOWt6MlAzZTJqVE1VVDlMQzNBdnF2SW80cDdkT3poeEYwQ0xtaE1E?=
 =?utf-8?B?MFdoVUJUUm5vNmx0OEdPVWhEOGZpbFpDWlcxYmczclVPN1JuLzhoaXF4SmJn?=
 =?utf-8?B?Z3FCVC9uU3h0YUk1OWFXWkhMdTZlWHJ1aGVPNk51Mmh2ZGFKVEdyUjFRK0lC?=
 =?utf-8?B?dE1kTG1reFZJVWJuSjI5MHhaazl3Y3NWQmwrVzFzQ1g5UVVEMEFoSEU2ZGFr?=
 =?utf-8?B?VDREYXBVRjY5WmR4SnZBdFNBaTJzc1plYzM1aFRPUHNwY1c0QXM3S2Zsa1o5?=
 =?utf-8?B?QTk4bDZpQ3p5MGNpRFJuN3pPWXdXdmNTOWlJanEzSlRwejhBZ0svdnM4eXJu?=
 =?utf-8?B?RFB5QnV0b09xbThrWEF5NE9GSG9TazFaTFhTM0ZjUHNySk16Mk9PcG83bmly?=
 =?utf-8?B?VFNlQUpNL1dTVWwxK3dnL2xxZ2dyalp1UFdUUmsrM1A2cmFIa2JabmFKaUJ6?=
 =?utf-8?B?dFVrRG1qS0JCUFYzTGl1ZnBCQ2ppaU5URVQ4eVJmc3F1SDlvdUZEb2pjMm5q?=
 =?utf-8?B?a3Bxb1dBaHpLTHBxVklNR3JXS0xBV2hNUnBOcG9NZ0RzMHdFeHRsRW9jUUZw?=
 =?utf-8?B?NWRDSWdLQ2FMdXhDWUErTFlZWGtDK0Nrd0wxUWl3RVZVSTgwZ0cvZ2NsbjVo?=
 =?utf-8?B?eW1jSW1kR0lxUFVXNThrdDRxV3hhWVY2ZytwU1Jhd1FoWnRhdnNNSkVFd0JE?=
 =?utf-8?B?U2NjTzNMQXpQY2w1eCtQWUtnMWp2R3E5SXF4N29tWEZXTkdMMnBIbkRpUENp?=
 =?utf-8?B?UWZUWTA5VnhIa1hDRXNrSDg4Yys0amR5YmRFdUtCT0YzdGdFQVB6VGIwRnh5?=
 =?utf-8?B?dlV2SmdTSVNWam1wNVZtSHo0a0tJR21hNmZyWG5SVDYxaS9rUE9TUVlucCtw?=
 =?utf-8?B?cEhKOGJYdENab0dLV2I5ZFhzMTFweVpCdnY2WU5jUy9aeXpMcEt0QTVsRWNn?=
 =?utf-8?B?Ym1VOXhQK3dtUFJ5VS9vS3NvTHFEWG52UmRlcHc5N2F4VkJMa3Qvc0tXdzZn?=
 =?utf-8?B?WHFJZzhxWGg2U09MSWQ5N0x1TWc3UWtzNVlrRHAwaHZUbmZFeWdVT25rNVhr?=
 =?utf-8?B?S1JjVzFjYTVhNk1LVmVlQTRRUFFFTHNaNGZBRXZld1Z3T2pPRGVYdk1oRytJ?=
 =?utf-8?B?MVk0LzU1dzdWWEtmVWk2Uk56KzdHWXJCa2JOc2k1Z3FnZXJSalFNRVNBdWUv?=
 =?utf-8?B?bzB1cHhDeEFSOGRVcHBLZmJZd2NPY0tHWFhwcGVHT2ZMemlwejZ6dWtRemFH?=
 =?utf-8?B?RGRsTXljcldyeGpINlpjSUhIMVU4VVFsTFYvb05JQTJ3b0tkeEdkMVVCYnR2?=
 =?utf-8?B?czBXbzk1UEJVS1hOSzcyWXRKbkVJUzkzeElzT25TOHdjM3g5RVpwU21QV01O?=
 =?utf-8?B?ZWtzZk40Z2hSdUs4NGlUbkxZR3l1VGJjMW1xRzNzSlZCWXJyeHM4dmFQamln?=
 =?utf-8?B?L2RBc0J0aFlKMW1UVHVTaklTUFVJOHdsRmphVy9PSnhzaU4wVWxvMjkzSTk1?=
 =?utf-8?B?citmS2pPZStkRlpSOFFWSWlTL2NzTHJUSGZsbW16WDdRUWxsNUR1d0NRZjE4?=
 =?utf-8?B?UVdxV0gvQWJBb2dSOVlaV3J2MG80ZEQ3K01hbThkNXJmaGIzblVOSTNHN0FE?=
 =?utf-8?B?N1F3Q0RsdjF3cGJQTUxGcFFiTVNFM0tYV0xjaGYxeFJrL0ZvbVd1Myt1dXJG?=
 =?utf-8?B?ZmpXZHBIVlhGTFlyQitDVkVHTTlYUEMwM3FRMzhWcEs5c2ZuZHV0d0g3Nmxj?=
 =?utf-8?B?VklwY2J2RkpMblZrcUduSTBJdUZlcU5PVXU2MkxxQUdFenpSS29MejRwbjU3?=
 =?utf-8?B?Z21JMjBFUC8zdnRCT0JkeHc2UDEwbVVvS1FoV0NZRGhHU3BXdi9jT2NGSXNi?=
 =?utf-8?B?bWVxQ0NnOTV4aHFueGcxMDE2Vng0WUI1T3k3ZCtKS1hBd0hXVVNKWUNtS3Js?=
 =?utf-8?B?eUxxWDhOSWRlOHBndFByZm9wK2tWRkZ5RVBGOFJqVjg1Y1hCSzJES21aODhL?=
 =?utf-8?B?NSt0N2o1aHgwdXV6ZE9wSFh1RkVZRkJ1L0tZVGxDb2R6dyt2cEQ4dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c9dffc-0b50-4b93-53d8-08de6230ddcb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 07:58:35.5255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM2tiM9Qm2zvCX9NiN3bxsbrCK2xLgiEAJw0Plw6V+FDr7e9CkPHgUcKHKeq0/IiyLkOREt8Q5//My2M+zxqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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

Hi Karthik

On 1/30/2026 4:05 PM, Karthik Poosa wrote:
> Improve hwmon-read test to check if current temperature
> is above critical temperature limit in hwmon-read test.
> This will help identify any thermal issues with the
> setups during test runs.
> 
> v2:
>   - Address review comments. (Mallesh)
>   - Call check_if_temp_valid() only for temperature hwmon entries.
> 
> v3:
>   - Correct the API name check_if_temp_valid() referenced
>     in the v2 commit message. (Mallesh)
>   - Use int32_t for temperature values in check_if_temp_valid().
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/intel_hwmon.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index 103ae69cd..f185c1ca3 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -26,6 +26,27 @@
>   
>   IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>   
> +static void check_if_temp_valid(int hwm, char *sysfs_name)
> +{
> +	int32_t cur_temp = 0, limit = 0;
> +	char str[32] = {0};
> +	uint8_t ch = 0;
> +
> +	/* Get the channel number and sysfs entry suffix. */
> +	igt_assert(sscanf(sysfs_name, "temp%hhu_%s", &ch, str) == 2);

Is this format specifier correct?

> +
> +	/* If entry is tempX_input, check if it exceeds tempX_crit. */
> +	if (!strncmp("input", str, 5)) {
> +		sprintf(str, "temp%hhu_crit", ch);

snprintf?

> +		if (!faccessat(hwm, str, R_OK, 0)) {
> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, "%d", &cur_temp));
> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
> +			igt_debug("current temp = %d limit = %d\n", cur_temp, limit);

assert should print values. Do we need debug?

Thanks
Riana

> +			igt_assert_f(cur_temp <= limit, "current temperature exceeds limit!\n");
> +		}
> +	}
> +}
> +
>   static void hwmon_read(int hwm)
>   {
>   	struct dirent *de;
> @@ -43,6 +64,9 @@ static void hwmon_read(int hwm)
>   		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
>   		igt_debug("'%s': %s\n", de->d_name, val);
>   
> +		if (!strncmp(de->d_name, "temp", 4))
> +			check_if_temp_valid(hwm, de->d_name);
> +
>   	}
>   	closedir(dir);
>   }

