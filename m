Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90693C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 08:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0BD10E1C5;
	Fri, 31 Jul 2026 08:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tt9XFOFb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF6A10E1C5
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785486388; x=1817022388;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0f4uY+bWsQ4sfniM0vp55NJvkiL2TyKVUaxHhojNUoc=;
 b=Tt9XFOFbdBdbVOsOqII75FWNDNwf+2C9KaOv4Ovuzuop3KYTtx1IdL6w
 yC8lh0gDpvUatMm1FTjIlyOJWjVu36sS1UWrS7Saw61nutPEogXOXk0Wa
 BRdldOIq5QOsVt0Oq/rTmAd01Y6At+kja0nT0T0n/34bBQ8zgH9djRVR6
 YkfFzqoeph6RY8mkwinao3fvOiDi/sUNE8dcVJOvlZoXAExfwK/PW2QXe
 KiBOnZnwwwbQ4laKLjkU3EAXY/4VGCsmxVQbDKObB65fjYBNysxi0OUGJ
 ZjAkStOJMi8CCPXLR8tKjW4GR5Yowk1DRvGOPozVrw/v/KNS5n1YGVTgf w==;
X-CSE-ConnectionGUID: mp87UP96SpGkvNuLhJpWUQ==
X-CSE-MsgGUID: PSkTqqnpRdq29sMFexK14A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86060950"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="86060950"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:26:26 -0700
X-CSE-ConnectionGUID: /rFoJWEoRnGGNy+rF+NIVw==
X-CSE-MsgGUID: PPlSy3DjQnK1zNCQMBvp4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="254207840"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:26:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:26:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 01:26:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQz/uqlDsLug+P3PiSrLcDyQTk9tNt8KziAxuZlNhEurZC4Fhw4EWDDVu7g0KbEgP/ncvJKdvEeD/VcHX2Z8rWBST40a8sOaWjshcdsRuxuJeIXdwHrDkCDgCWFUXsFRd/fVcoZY3shas/RQg7dBGJVMB6IWbU7LcBMtamQe3xq1fbyWrTkFqOFEslA7dpikkwsCBvY5Fzsir1pGTdF7d4XHnhRULZdOJ5uu8CN4zTNZ6yOD68DpQmHVlV60E/qSyouo1VaDm6pMUQanvpKXSN2EmgDS68jYl6IVnsbw0bHBsS8fQJyLvudDAkI/lAQHaCXi5kLLnZgyzBmaQ8x6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keqJaTquDYVsXiDYp6Yrcc041uvdvq4NECLN7TgPr6M=;
 b=FQEg94LOiVeEb35EzPkrQiGdKdmamVwgHnHO/InaLg+dCI8p2Scb60bUciXMp3XIh2YistfmrRHbOU2rOlVu+Z2yI3J4ePg7d9IJPEreyoVY1pFTucgAM9W7okW9iv7errpxggMMdNa4m7oKtn3aJmANphA13j+mNJ4Qps9TkeFmOx5vFzUwJwepmXz84qOAOgcIkudxQ0T/PKcxWLAI8TYSU6Q0iWmipTzeb0oXWHHjjwxR8FxviNTDMxs5vuz6ChyervZwBSuLjiB+XBQrZ171Kzq8x2Atq/Q4Lvw8yEC3AoPohy0EPtyfqKS1pHZSqD7bnQeR8sEDYKaGcdo83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:26:17 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:26:17 +0000
Message-ID: <7f271137-41a9-4389-848e-344d4c1d769a@intel.com>
Date: Fri, 31 Jul 2026 13:56:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] test/kms_colorop_helper: only check if a
 given enum value exist
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
References: <20260602211259.898147-1-mwen@igalia.com>
 <20260602211259.898147-3-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260602211259.898147-3-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 225c8ac2-a285-4af0-c67d-08deeedd6424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|4143699003|11063799006|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: km01LRyr0f7KufUSgtGF4xFVr9+If3nP5zzhI6042reqzn+lkhYNUCzCwl0Hb8HV3wCqIR1IHV0FfpycwQv6z8eIUK+m6o38A7yY7UiqNQm1CegE5vhKncK2pLeJAkEnUR5tLvDmiJqaRB6gFafPylF/oIRvbIZeDjfCXleguiicAr0C4UPZY8Fj6Jv2EkNRPSJqHDf3bzXi4EyYDK8M12rXAAEEJ/L/gHJk6K0gl261Jx6Tt+pX1FM5gCW6eSxf+QIjp/kYEv9vLROB9bqv3buaum9p4w/kMghh8izpQjgxRdI+R22oJOdAb4MLn0LUTSe0Z++1Fz82LrQB5/fLl3G0idzdbzc9o1fH6ivXwPVb+oWRW2xsTHjtNL9CS40wcFl7pQe5mxL1gb4n2WkRrwRe/ZLv8LJIclx+Kf/yYo9rCHsaJ10Iz/CErmgJxonLBdhQpssHGEasGJjX5vMAUOSP9JazKzvggGywA+hWzxx531AcpFPBTgUislC3VGC1RN0m6xb/CQBuVnIyvFuw7a53Yd4fwaMBtMT1rHw1Ypx1q5uQw51uF0aMt9PjXF45Pe6wdtMEylj34TuuMOjSLjZO08LAvqmV5qtNCDUD2BGZDbIeVw8W0jx4CRSaZa1Nt+kp3l/X09MmGVMbTw/VpoJ8gu8SuVR/MtCaHKZV518=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(3023799007)(10067099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmorZFdDbWhJVWFya0p4aTRqU3RrbnNxbml3Z25EWVowTjhmc1VVbllrWnEv?=
 =?utf-8?B?bDZKTXNXM3ozY2UwTnY3YkdtdzV0Uk85cXJlVmFwM09PMU91K20yaHJJWHBz?=
 =?utf-8?B?QWhjeitNbkt5RlFVYUR3VThYZnpTa0xJd2lrUmlLaDZQVkZZVnh0R3ExK0pt?=
 =?utf-8?B?bmxtOS9MSTNKbUNVNUxhK2VadnNZeENkNnByTDZmUkR5WDdGdVV6M0xGUVhU?=
 =?utf-8?B?ejU4S2RPSjVpWnRIY0MwaFFEU3R4c0cwRlY5Y0ZvWk5iWmJTdWRsUU9Obkg1?=
 =?utf-8?B?WUw0U2RQWGJPMngyQzNkeS9NMWF0emJ4b2JmSksvS0JucmNZcElOWGFNdWtE?=
 =?utf-8?B?aGhBNU13VnYycE4vcVU0QllmeWlVTFlaYjNUQ3pnZGU3RnVXK0NjNXhKSjhD?=
 =?utf-8?B?MVlSSHN6MTRLb2htU1BMaWxpbW44TXhOWE5Sc3BpQW9Oc3BzeFUyOGhYdWdZ?=
 =?utf-8?B?U1ZQb0FYWSt4VXAwUS9INldWb3k5OHEyclFHQ2phWUZ5MUltdzZEYzczazN1?=
 =?utf-8?B?N3cvL0RJc3FRaUpPRkloVlJpK1BobHU3bE9ueHBIQWk0Q0VPNXJhTm5vNXNz?=
 =?utf-8?B?NDVXbmxzaCsrUE1FSUJZaHhFU0w2UWRVNFFFTEYxeHVYNUVlVE92d25FMmNE?=
 =?utf-8?B?MUdZYUFlY3o3TWwrQUhZajRVSis1cWkrMDBSWUVKT214bmtTVFJzVHBDeXUx?=
 =?utf-8?B?SHl4MTYrTHM1T05mWm5zb0JjTmhNUHpVMDR5Nmt3dHhLd0wyKzArRXdPSXNR?=
 =?utf-8?B?d1lETmUzOUhjM21sNTJFamdpN2hpalFBcTVLSmJIcDRzcnR4c3dVVFRyUTlh?=
 =?utf-8?B?bnZvNW5SYkpoSThXWG01OUFTMksvZEdpRkNtV0lLWHEvQjlUcWRJMUttUWFz?=
 =?utf-8?B?Q096cE5KbVNiTENrSG9wNWNzMmVHZ2VmcWwvN2ZoZHVTQm1GSVorZnltcVly?=
 =?utf-8?B?YUVSdEVpd3FHYjJZQVpvb21HV250UGVKSlZlWkVpV0Y3T2FPaGNRSDdtMnBq?=
 =?utf-8?B?YXVML1htZWR0RjhMbkRnc2hNa1FzczlhUG9nb1JNZm8yeXh5MGs1aDh2amdi?=
 =?utf-8?B?SEVVMDI1b1djRmNVUkhDbE5GdnAxcWx5QndxdU04WGRFNFVvblZ4SmJVSHdR?=
 =?utf-8?B?K3NFVEx6cm1yMUNUZHBkdnZpRHRSMzc3UGxaTkkwaDNKMldSMTZMQy9NYkNG?=
 =?utf-8?B?VUdRZElpcVZqejZDN05FNkRJWnBnMjBKa1Fud21vWTB5dVF5MnJXNTR3amxm?=
 =?utf-8?B?a2c0NnBUeVJPb1RGdm40aGl6a3lxbnZhaUtMTjZrOGJveE9DVXRKeVJ3TFVX?=
 =?utf-8?B?aklsUHB6MmVIZUFac25OZUQ0ci9oNGwrbFBZUHd2d0xoWnNoYmM3ckVuSDlm?=
 =?utf-8?B?d0NWRnVFTGQ2cXJQRG1IanZPRWRycmJBSi9MUnJveVJEYlAxZTNKVzNkeGN3?=
 =?utf-8?B?VzJnN2V6aDJIUlZvVWtSOWVkTDU1UFV3NC9CQUdJdDNPYVA3SWFGTlNHWDJr?=
 =?utf-8?B?S2R5L1RNcFhBOVQ4RnFrN2hBdWVRVktDWVcvbHBhVXhhK0x5RUsrd0xnZ1JI?=
 =?utf-8?B?Q2I3WE81dERlRk1pTThTMUhFcTdEdTJmdEV5Vm1NZm9uQ3NUS2VFRmJHZ0pT?=
 =?utf-8?B?d2kvcTdYanpLR0Z4bzROMStITEZSZ29rQXJYS0tLMVk5N3ExbnF6cmRKbUo2?=
 =?utf-8?B?ZzY0Wm93Z2tSWklHTE1aUXNFNm0wVTVQRTc4aWRMbFlSN09GS2ZsOG5LV0x2?=
 =?utf-8?B?QU5YZVBaVGJtdFJBR0piK3FvWGhzbDNMVmhtUzBNa3REUGtFNmc3NlROaEt2?=
 =?utf-8?B?cXBMUHcvcVNQZmRjRStzUm1sMU1kYXZFUlovMkU0bWhHUWxTc2EzajRiaDFw?=
 =?utf-8?B?MFQxN0V5VE9lQVVpeEVKbEZyYlZuMER2dUJ1VklCRzhHWTNzQ0Y1YzVuaTcw?=
 =?utf-8?B?UUJPU0RGRDV0NmNGZ2VJSFpmN205NmIyUmoxa3lidUs5NFNUcjFoTUk0NENU?=
 =?utf-8?B?MzYySWFkYkFpY3R3ZmZZU3EvNERXTlg1NlZDR0hDQTZXci9kY0loRFN5aEtO?=
 =?utf-8?B?TUxQcmE5TlhSQS9ZVnAvaWF3aHhhMWJrRTNxRnhmN3dabXRjR0VmS0RienFs?=
 =?utf-8?B?N2ppUStlQW9qTTUzWFNjSkdDY2Y2QnZZS1ZVOTRPNDlrSDJzWlkxZjU1SWw2?=
 =?utf-8?B?TXdkb1B3VC9nak1BSDhvU1JRWTVuNWFWc3BmdHJQdFNhbFlFcDFIaUpwTEJJ?=
 =?utf-8?B?eDRkNWZqYjBIdDVSNjRtbVUwaG0yT3kwY05qdmlCT3I3N2dLNXlUQzRGNUoz?=
 =?utf-8?B?U0ZvejA5ZXRibktoVjNDa0VUTUV1SjhtUHZwK0ZyU3dtRTE0WG84djJGNmUr?=
 =?utf-8?Q?ls/5ACIlTet/dhf4=3D?=
X-Exchange-RoutingPolicyChecked: FzZ5YrReFzHkNbQDbDpwtZ99FtBrmW1LAhI7e+Cz7E/36Hd6YOU7psyjUe1nafalPgru1fsYgaM/GkGnmBeZoZUKZRiHxOh9qhx+/B3ycirs52QjWH8xjSgmQE6AYbepvEcwaNnovxEdiq8KTIYZmkPORwY30+2CQRnzWsqhJPjG7iLJOvdd1GkdT8MuEQw7fFjnkw+dreI87Q5OoZpZn/il9IU7U1aQuT7vHc3N68a7EsrHN1ih2pHcxaJNKOUjaEEi4/aH2T5T53YOPbJ4eseeLud+Eec/19cugshnTT4KyAkv72LJjKfmyNr359tkBXgWdfe0Hyehb3O/dNXo7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 225c8ac2-a285-4af0-c67d-08deeedd6424
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:26:17.1451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvRHphrmyyLXH9Bc3449jMNFOKgKVQtbgkQCICGDuOiDcakmjP/PV9w+7raCBPUKVIV9gnPlL3sAC12v6hc37PK2y5t+NxKnHP+uSlFiT8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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



On 6/3/2026 2:36 AM, Melissa Wen wrote:
> Don't trigger unnecessary colorop property changes to just probe that a
> prop enum exists and can be apply. Make can_use_colorop() read-only.
> 
> Assisted-by: Claude:claude-opus-4-7
> Tested-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   lib/igt_kms.c              | 26 ++++++++++++++++++++++++++
>   lib/igt_kms.h              |  4 ++++
>   tests/kms_colorop_helper.c |  4 +++-
>   3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d46f15c01..ef27feb89 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4502,6 +4502,32 @@ igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_pr
>   	igt_colorop_set_prop_changed(colorop, prop);
>   }
>   
> +/**
> + * igt_colorop_has_prop_enum_value:
> + * @colorop: Target colorop.
> + * @prop: Enum property to check.
> + * @val: Enum value (as string) to look up.
> + *
> + * Read-only counterpart to igt_colorop_try_prop_enum(): returns whether
> + * @colorop's @prop accepts the enum value @val, without setting it or
> + * marking @prop as changed in IGT's cache.
> + *
> + * Returns: true if @val is a valid value of the enum @prop on @colorop.
> + */
> +bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
> +				     enum igt_atomic_colorop_properties prop,
> +				     const char *val)
> +{
> +	igt_display_t *display = colorop->plane->crtc->display;
> +	uint64_t uval;
> +
> +	igt_assert(colorop->props[prop]);
> +
> +	return igt_mode_object_get_prop_enum_value(display->drm_fd,
> +						   colorop->props[prop],
> +						   val, &uval);
> +}
> +
>   /**
>    * igt_colorop_try_prop_enum:
>    * @colorop: Target colorop.
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c2a3099de..f080bd09c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -954,6 +954,10 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
>   	} while (0)
>   
>   
> +extern  bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,

extra space between extern and bool.

Otherwise LGTM,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +					     enum igt_atomic_colorop_properties prop,
> +					     const char *val);
> +
>   extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
>   				      enum igt_atomic_colorop_properties prop,
>   				      const char *val);
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index aaee4e567..5b79fe789 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -205,7 +205,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>   	switch (desired->type) {
>   	case KMS_COLOROP_ENUMERATED_LUT1D:
>   		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
> -		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
> +		    igt_colorop_has_prop_enum_value(colorop,
> +						    IGT_COLOROP_CURVE_1D_TYPE,
> +						    kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
>   			return true;
>   		return false;
>   	case KMS_COLOROP_CTM_3X4:

