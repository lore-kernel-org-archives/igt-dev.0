Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6881EA3C55
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 11:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF7E10E422;
	Thu,  9 Apr 2026 11:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeLLySdK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5594C10E422
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775735222; x=1807271222;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g7ynstJt/CvFMY8mOdC9rM6O9evPADi5vDBQZG+O+n4=;
 b=OeLLySdKPJjgzwGwgcHQtSixJ1/wtiqsalyDqSAGg0jwKLz4ZzI74iAO
 GgmwdyQNKwWQf1K0Peajf7NYQHzzUngAfS5MYSDOCDGnLMsGExOCYzPSC
 yUibqqqPOo99acaZHT/nPVlT9HP/+PLb3Ed2lNKFu4zY5MFrLBweXq0Lj
 wrNCcFBMarByVVBJjKuhgBqJxh1mlmcLpG2yrZcbItO1GSprakfkktGCm
 5Z6joe8JKCo4pH1AadAVaCGo3B0GgW6SS0COhjMIKGwjKjz3/A29x6BQw
 eiKnhZvjFCUuBc/XTM9Z1VgE3o/xGTTttEjS/Sh737N714Wgpk7jzfl3/ g==;
X-CSE-ConnectionGUID: IA0JTlvvQ3qjn+WaeQfL6A==
X-CSE-MsgGUID: pEUE+HrMSN+bp1STHOmbQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87435083"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87435083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 04:47:02 -0700
X-CSE-ConnectionGUID: bfALGOV8TmysK0gXjZ0UEA==
X-CSE-MsgGUID: Q7E5N5jQTmKNwLlbbeEK3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="251879527"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 04:47:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 04:47:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 04:47:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 04:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYvjExnYBT3A1pEYMZbosfYL6KeUrDi36pPhe5YgeRO4YQty7wU7Smapxoxeb9R/tXRemNSt6SEtnQ1vdqKJTZiT2EdtuWrzbyRL8Hga/AKDqV69b8mPuwZsnLOrLZsgmJNoxdFI0DmONSqrna67xs6UwT4ljF4NKULD0Wt2+LhsHYhZ+Ho33BcLEFNDsEWMnIZugfrmNlQJqCxlmPbgwoDKr7Io/Hxk97x9lZQ6WH2v83NagWihOH8YG3B3Yd65NbxaUiy6cAYGc0vmoE2HwyOYKioT/Zj1t9jTi+3DvfcD0ZHEveA29n2JalpbulYdYyXjDC++tnXEokqUlIpbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl/WLnUxW8roOHyHQxpPzZPkIhpnrwUkJcD0cQYpz/s=;
 b=m/0RzNTaku+y7e2mTSK5OyS2MwpHgoC3ZZRFzAGbgUFd6CZ0JXWs3HB6L2WaR7JSPlbrYpkoDHZ6vvFqD7R98QIULlAybx0SFPQpqbqSgcXpBwBjsCqBw2Xzd3WVprw2LRYM7JB4mvNQYGfceqfEysVNcXIKGMO5xYNoeOXDVNOBqkYbf3mvEQns1TwL0v95ROhlkHGmZcegcBGLH2w1dzL3bjVmSIVsOJbcJctn3w4yQEdLW6ESO1Y/vpb3t+xEvJZYdTsX+Ld+O9wljnWQPIXruDhUO7zA9YyY6W2aWZLwyZ7BV8MDregfRHC2CjDcVZ4muRPSveKpfLIqhKoWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SJ1PR11MB6226.namprd11.prod.outlook.com (2603:10b6:a03:45b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 9 Apr
 2026 11:46:54 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%3]) with mapi id 15.20.9769.014; Thu, 9 Apr 2026
 11:46:53 +0000
Date: Thu, 9 Apr 2026 13:46:41 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
Message-ID: <lebova5umd6qiypupwch4wunqut7symicwhhuf3hxaa3x4p3qa@kuervnvpa4yy>
References: <20260407105212.43821-2-krzysztof.niemiec@intel.com>
 <1394b3dddf8d96243a814aa7c722e6894fd8ee89.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394b3dddf8d96243a814aa7c722e6894fd8ee89.camel@linux.intel.com>
X-ClientProxiedBy: VI1PR07CA0148.eurprd07.prod.outlook.com
 (2603:10a6:802:16::35) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SJ1PR11MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dce9758-093d-4bd1-f2e3-08de962db1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: djzZQoz43py8HOwCdZFKHrwY7PaL/IdNAWpzetKpRj5wry10LYynR316mdanqkb55Eth5ql20tPXJ6cPhxdIOXxrqawoBQ59t2QdRag6g5SJfXlQieT45Y6DKyxZUTPyK2XIDpjv78Hax2hx8/NG0CiiKn7eB9uDeXhA8qdcelhGc6b/3SzjMAPMRAdr99WmVBMs4r0pLMtRhJW6HeAKRebDlDcQae81GQZfzG/S2WztNGmoi2nzBpZqcxQr5ZcEjrTcMZEs7J/7QK89yHunxCm6LflqspTpbi8RquJAsrfjVxmhC056MRFX/DZfHBJHWi8E5z+vvAVPRgWI6raFJgo4gmKuqa3yBXFG2CMVxw2Tw2TP2JOLyCu3kN/I4EghYDje9DXvqyV2AfYr1hWv2cc67l81TpV560YlFVnzm+OL0e3ur9phv/JE34s/m6Q55bn6cdh+FcMlMgOQ6v1ta2K42BK0CkoBEd6iArP0+4X4/qU2tw2mAwRhgLY/NypA4KtEL1e4j4oGZnISBER/8QIJ51JCGB2iMSFupOU19dZCqct3O9Og4vTDNUPgpry2KFFxNOQkL1VrY8yY1bocEf3rBXqPB6W8DG8c+32p2KtbL5wX1Jq1IusXPN7OIIrzcwX/DKV+XXIx/UVRGlVE2YZhQOkO0nHDnEIn+0N48DgxXhh6UvprnOFIrwmMwyJnh699oQTRyHI30Lwy1+seoQj7AJsyxJ5dOotTiMM7vY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW16N21NZGhBNVdINzZoY3ZENmNhUmlycGo4b216MFBsNkdFN05kZlZPaEZC?=
 =?utf-8?B?NEhXRVNDT0xDdVNZQWVaUHlzL0V2aDJta1ZyR2hWWk4vdEpLOUpwcWUzQkpP?=
 =?utf-8?B?Q3RjaDZBbmw5Y0tPTFdEejlUVy9BZEQ1V2h3dE5qRHdYNHl3N01zNnFqMXNt?=
 =?utf-8?B?NEVWT0JXbm10TlY0UlIybjJjVWJvaFlZQU1zVHZnallJS3loR1ZkUHVPS1k1?=
 =?utf-8?B?QU03ZHBVQjZNQnZ1L09FTkgxc2I5V3VQdGJkNDdvS0FFMEVjZ3Vjd3drOGdJ?=
 =?utf-8?B?c1YwSFpxUXNHL0VFSTQvbnRTRkozZFVJWHdEdFk3TzYremx5M2pUc1dlYUFC?=
 =?utf-8?B?Uk9zRCtlRmxqK0JRN3ZTVnowWmNhWXBvSjFFbVUyQkN1bGJ1VmVXTEpQRU5H?=
 =?utf-8?B?TkV6UzFnSE50bTBIYWtxampjaC9wUmVnZ0JFdzBFc2hkWFFCNDdlSTBLZ1pw?=
 =?utf-8?B?TE55TFMxcUYySmRmK3QvTWEvNzVxZ3VTNWtrTDR3YkxSMjNPLzkyWUVtRncy?=
 =?utf-8?B?bW5qK01WUEphMWhQOE5zR3c0d2MyMjBCRWJ0dDJQVzdHOHVUNzVKK0tEY0Qy?=
 =?utf-8?B?dkp1WUVWeUw1TDc1QkdYSEpDS3VMcXBkNmg0T1ZRaXY0RE1HM08yaSt3Mm5o?=
 =?utf-8?B?SUc0dVNqQS9sWjlneGZOcUpkeWVTbnJCd3RKOXFJWG1HcmZsb2RVVmFtSW5Y?=
 =?utf-8?B?ZGt0MUNNNlI2eHJUQmd6WEZVVFVqREhZRW50L3JIZStyMHZ0cTNZUDFFeU1o?=
 =?utf-8?B?bEZFUlU1UVJ2aDF5VThXN0N2bVlsWEY0UEc4TWtieEdjUUtrOEh3MmdPVlZw?=
 =?utf-8?B?SlBwM3NPNGtnelFCTWdVOHc3clh4UVpFdEZXY0RlVFdISTVRYlhJZ0RRekJC?=
 =?utf-8?B?dUViTTFOSzZzTGl3YVJkSHV1MFNlcUx6TytBdFVtQm9pNlkwR1pmdVluU0ky?=
 =?utf-8?B?a2xHMHl6RUVsYmFCV2tkTmhGc2N0eUNIT2trMGliQmlMbHZHb2hnS2tNZDFW?=
 =?utf-8?B?bkVIMEVNU3dPemFsSGZwMkZrSkxITTk4Z2twRk5RaFB1b084SFBKRVcxSnhR?=
 =?utf-8?B?YklOaXNycDRtUmJmYnQrY3VDQ0pOQVJnaVhjQUJRaHZiSXFBUGYwTDBQWFRh?=
 =?utf-8?B?U1Z4aC8xalNDTElwOGtWOUoydVBvUDFRSklScXhjVWZSRDVWOWQ4YW9IRUQ0?=
 =?utf-8?B?WHdOYmkxSUE1RVQvSHlwZnJaZ2VpZGV5QzRFVjZvTWlWWVZ4dS8xZHU5d1NB?=
 =?utf-8?B?M2RZM0owRW9LV01razdoQjZDbGpiWjdUSFNEU0tKYkUzRlZoc2Q3endlM0tO?=
 =?utf-8?B?dEpiaVBPK05VOWsxVUJjZlZGWmF3dFltbFluWGlhdlE4b0JNMU8wMWRUUmFs?=
 =?utf-8?B?Um16ZWo0Tnk2Z0JLd1M4V3YycndDeDFMMko2b0tOYTR2QjVSd3VnVEs0Y25F?=
 =?utf-8?B?eStBRmxFcU9PaGFrNGVvYUkxb1BGZ3VVSjJkYVpZM041WkVibzVQWlN4UmdP?=
 =?utf-8?B?NU9UZEJEWEZCQzYzenRrd09MdnE0algveHZ6L0RKUHNMdlphYU05QTNOcmtq?=
 =?utf-8?B?VjJEa25tK0V5cnRuQXBaS0k5MTM4SUw0ZzAzTE95bFo4UndHQ2RnUUFPT2FQ?=
 =?utf-8?B?d0dMNldGZnNhTHIxcVo0ZEhaNVdqbmozbW11UmI4UmRKSEpiK3VMSit5VExh?=
 =?utf-8?B?bGd4NlJ0SnJ6MGpPcFV0WTd0WllBclpCakZrVzJnc0ZpRjJickxsNWtBaUVk?=
 =?utf-8?B?ZHJsUzVwNEJpSmdrVUdPMEZ6UDVtaTRweC9FTUZUVzUvcFJ3N0tXU2wxb283?=
 =?utf-8?B?blBEZmFmSWZ3Zm8xYnk3ZnJNL1c4RU00YTRqdkYzUm9RMVIrVzRiT0o3RHdq?=
 =?utf-8?B?KzdFelRld2NmTU9ZKzErVGh0SFFUTGY2SEFlREdub1c0eW1TekYrSWpNdmR1?=
 =?utf-8?B?Y2tKMG9LaC84MkplYUlUM3VuTnpIVUpzVVc4MldldTNDQWRIWGN1Q3pWd00w?=
 =?utf-8?B?TURtY09OaVlmelB4QW1WOExIMURRRkx0by80VmFjUlJRY3A1R0lFSk83b3Vn?=
 =?utf-8?B?UVZ3S1BDajVGcHRJVFNRd0UxMk4vM0twbXNRcHpLaG5IWDd2TVduYzBZdzRX?=
 =?utf-8?B?NDUrSkgxRkcxN0ZNWXlVd0tQNUhMSFJXQ2JDdG9TUEdXSzZ6NmpmUGxkL2hl?=
 =?utf-8?B?M3phaGV4MXRteVpiZGlZQkkvQVZvb3FLNEMzK2pDWUNMdE5UWHlJS2Zzb2Rp?=
 =?utf-8?B?dTRwTkVuZUNtM1VJTlB1UEtPcmJzSUlCVGZ4L2NmZDlJOFhTSnQwTk9hQWp0?=
 =?utf-8?B?WllKeXpMQ1dPR1ZlOUFiSit4TmpjRU1EYTBzRHQyL1lKdDJaeEEvakhFeFdE?=
 =?utf-8?Q?xkc0B7YyKvQCUhJI=3D?=
X-Exchange-RoutingPolicyChecked: Tj76p2cb7Qo+Az4LmS4PGa7RDfTkNuqmKFbLukn8g4N+LQJJvjPeJ4DPijw69Wwg7LW2Q5Giiwb/fKJfSjaZqUx8Alb4gd4P5909D/1QtrmAHz+eyrRrsT5ub54FIy5uDOd7B2e15h/0i9UTpJHgRvryTkPlTv8KZ127G67sg6X7+A/5UWZTntkuFYF99WUnyutYuNy8Kjv3wD8QsdtJWUvXnn5EXVSTmhvEXdGGQiysem9C7r2UET5fM4l+2pHi/OGzx0xIvaXx0A/wq0/aNA3W+2X5ZD1E/Qq8c23UUjQm7ObEpM2gDnRVm7aFzxvSK9Kh16iwc9c6/UtOiWHGEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dce9758-093d-4bd1-f2e3-08de962db1ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:46:53.6459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HomHiHYnsQN2ZdZA5lWKoOUEAUHsV4RmHNA7c8CHKAS5SKKSvIq+hR6on2hGR/8u7ZdRG1qAlhMcnb/QxzeHUHPFKGxvqJExpGKMz1g9Z5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
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

On 2026-04-07 at 13:42:20 GMT, Janusz Krzysztofik wrote:
> Hi Krzysztof,
> 
> On Tue, 2026-04-07 at 12:52 +0200, Krzysztof Niemiec wrote:
> > The test alters the environment, specifically the gt frequencies, for
> > its duration. Using the legacy interface however makes it impossible for
> > the pre-test state to be restored due to its limitations in multi-gt
> > systems. Use the per-gt interface instead to properly clean up.
> 
> While I think your solution may be correct, your description is not clear 
> enough for me.  How is it possible for the legacy interface to work as 
> expected when altering the environment, but not ant longer when restoring 
> defaults?
> 

The legacy interface can only ever emit a singular value to the GTs (the
same value to all at once), while the per-gt interface allows granular
control.

So, for example, say we have two GTs - gt0 and gt1. You can set the
frequency values (min_freq, max_freq, boost_freq are the ones set by the
test) to those that fall in the range in between RPn and RP0. These
values can be different for different GTs, these are from the test box
I've been testing the patch on:

	root@box:/sys/class/drm/card1# cat gt/gt0/rps_RPn_freq_mhz
	800
	root@box:/sys/class/drm/card1# cat gt/gt1/rps_RPn_freq_mhz
	100

	root@box:/sys/class/drm/card1# cat gt/gt0/rps_RP0_freq_mhz
	2200
	root@box:/sys/class/drm/card1# cat gt/gt1/rps_RP0_freq_mhz
	1300

So gt0 accepts values from the range 800-2200, but gt1 accepts values
from the range 100-1300.

However, the legacy interface reports only one set of these values:

	root@box:/sys/class/drm/card1# cat gt_RPn_freq_mhz
	800
	root@box:/sys/class/drm/card1# cat gt_RP0_freq_mhz
	2200

Now, without the patch, the test looks at the legacy interface's RP0 and
RPn value to alter the environment, showing a range of 800-2200. The
test sets all frequencies to max (so 2200, as read from the legacy
interface). This actually fails silently for gt1 in this example:

	root@box:/sys/class/drm/card1# echo 1300 > gt_min_freq_mhz
	root@box:/sys/class/drm/card1# echo 2200 > gt_min_freq_mhz
	-bash: echo: write error: Invalid argument

(the failure is silent because the test doesn't check for a return value).
gt0 is set properly, gt1 stays at 100. This is because we cannot have
the information for gt1's range of allowed values, since the legacy
interface reports the max of these two. Changing it to the minimum of
the two values will prevent a failure in gt1, but then gt0 will be set
to 1300 while it can be still raised to 2200, so we're not actually
setting the maximum value for it, which the test is trying to do. The
per-gt interface just treats both GTs independently, reading the correct
range for all of them, so this issue doesn't arise.

Then, after the test is finished, the test tries to set the values back
to what RP0 and RPn report. Let's look at the min_freq because this is a
cause for problems in further tests that expect a restored environment.

After test init, as I described earlier, the values for min_freq are
2200 and 100 for gt0 and gt1 respectively. During cleanup, the test reads
RPn from the legacy interface, which is 800, and then sets the min_freq
(using the legacy interface too) to this value. Now, since 800 is both in
the 100-1300 and the 800-2200 range, this will succeed; after this values
for min_freq are 800 and 800 for gt0 and gt1. This is a mismatch with
the original values being 800 and 100 for gt0 and gt1.

Note that reporting 100 from the legacy interface instead won't fix the
problem either, as then min_freq for gt1 would be correctly set to 100,
but setting it for gt0 would fail (100 is not in 800-2200), so the test
would leave the values at 2200 and 100, respectively, still not
restoring the environment properly. This is just impossible to
accomplish using the legacy interface, because it can only ever report a
single value for any of the attributes.

To explain this in detail could be unneccesarily verbose for a git log,
but if you think it's needed, I can include it.

Thanks
Krzysztof

> Thanks,
> Janusz
> 
