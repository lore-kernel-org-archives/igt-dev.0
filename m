Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C103D6ED0E
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1074110E3FC;
	Thu, 21 Nov 2024 12:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJ4iOwIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7455F10E3FB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732190563; x=1763726563;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EPgJ0V5UZhNETmECYA4E56NBIUR1ncsVwyPSmYrbHNI=;
 b=nJ4iOwIF5bQuIuoyWtxoiQ48E/4PIFpYY81/yCobuUAK63LYe9ZtTqLO
 0B6uyLkjfj35UQNN+DphKDVgjIEx1qmRPphleEQ6dFyttuNX65RWh+50r
 uVJlfAUn7xXXq5S4fPVsseZ0a7BsA7Up7KVAs/L7/BV5JNeUTFrICWubj
 xexxWoHC2xIKHB5aQqFFa/txFpRfGOwJg2PF8FRLWInEyrxRvdOpIMGs9
 pi7QE8NUTOjMXQ/7kmAXYvwpNKz63UePVIlGE4E66CDTDro0gg5Gebymd
 PCK4W0HVCb5NOEC7x7M7ubO36sptzI0B+I6F0dAzIIxVRuE5PEq+jqvzo Q==;
X-CSE-ConnectionGUID: TzeVR6SOTk6JLi0GhFBniQ==
X-CSE-MsgGUID: hnnSIlAcRm+J+o1Qy/r4FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32433215"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32433215"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:02:43 -0800
X-CSE-ConnectionGUID: /XP/jdCpRZSdMUiPO3HiWQ==
X-CSE-MsgGUID: 8cT+nymgQPGEGvuPnD956w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="121183753"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:02:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:02:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:02:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:02:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2EVZXoW+sDCBJKgNBXHiaMsfnK5E6j39IyPo5AXEeUQ1puMJDqydFIr2zX5tHjN+IbSEY4v8ZZspYp6E0nTnzTLewg00MBfUqbOZJaBBlcMzzDrZaydUWLGJKCTKKjhCM41fHNYdJhJuVmw2FytRheQTGTl7JbZnEl6oiccbCjHmQyFvm4odevXYSja7uZ7unH98IfKNbPTWZco7F7vHt9pD/YSq8BIV43eAlICWmWmu1Zz2MeL0TCBKB12z7tMCyOV52Ei5fCREgX897GGmczN3nyXqpIiTpYHpbD+DbFR4mwjWc8B8Xm076uSw1+51gMGMcCqpnLkXnnLHhtJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlJ9RmATSzxlylZD2Ksc0mwJPaOtVXclZ+q+kKhm4nk=;
 b=ZZ0GkQCBMp2HeFn1WMHuqDAMkaC3Fa8n1pJK9YeTtebgOSw3xpPPnogNk6CUqh4AEwcqwI3A5l3L/sPZc6DeSRfzluHDHVeLrzrhfWOso0cJbRCkrzoRb4Mt5VTORtSKjFi35oZl57vAo3oeqO7tOoHUoV43ZrTJUwqdJvJ2TPrH/9h1Q8sUmUdyhQXKEs5NWv0s68eLX/R+r4su9yel6BoT6LbhycWbNVHnc9o7LGiFEWYjUn2AYjBgbUw82069S29F8ciGTrL+TVM6YwUkpD+YQaI0v7g80AsVqvPtrd/9Fsp9WENVX5oKMY64PgumVS02s34qAXBLCi3weaxzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 12:02:25 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 12:02:25 +0000
Message-ID: <7064ce58-7612-4bad-b92b-b672516db265@intel.com>
Date: Thu, 21 Nov 2024 14:01:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/gppgu_shader: Add write to ppgtt offset
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-2-gwan-gyeong.mun@intel.com>
 <64ec9c9e-e5ee-4aad-bc21-d280fdc4bd54@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <64ec9c9e-e5ee-4aad-bc21-d280fdc4bd54@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0016.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::10) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0d5e25-d601-4ed2-a116-08dd0a245cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVVrTlRHa2ZKb1Irc0Z4WTZvc0tWZ2o1SUU2eW5KUG1vSGJsNnZKczBXWVF2?=
 =?utf-8?B?cUpsWVlsZ3NmMzNrQ2FCNW1ZWEw0YWkwNXAvR3E4Q3BGZ0plNkJLRXA0Y2VN?=
 =?utf-8?B?czhsM09wNXNoTnZaTU1HZDJFVm5hNzJSbUVERFBCSWR0SmZpODE2eVdmb1cv?=
 =?utf-8?B?Z01rVTdkRE01WHE1UFA4OUhDVnhrZ1ZGZXhoQ3ZnZjlSTWU2UjdXVFFpcnhN?=
 =?utf-8?B?MW9KMnNIZExJTE9GMHNPN0dNL0VhbnBpNWNDbHJSSmVtdi8zbUI5SzNFVDVE?=
 =?utf-8?B?MlVIbXIvV0RDNi9IR3ViU045TVNqbk96d2Y0NkVCZWFLV2lrY0xQVzQ3Q0Jr?=
 =?utf-8?B?M0NkdmV1dE1ncXF1VmZEVmJOb0RTVkNLWEpQMGVXaUJzYnV4V2tFdE9FR2k2?=
 =?utf-8?B?NlJ0THdvaHRVeEZLWEY0RG9WUGhqMzJ0QlVYVGV1Tmdna1dPdnpYekJQOEE2?=
 =?utf-8?B?UkE2UFg5K2xjaG0zNER1N3ZHei9iK3NDNHlsa0NFQXdnL2RyRTBZQVFKYzBM?=
 =?utf-8?B?WXNuVnR0MEFkVUYrZmgyTFVvT2Y3eU9Wc1lFcjlIMkFrVzI5bFRIVVhFNmdK?=
 =?utf-8?B?YXU1SXd0OW0yQTRZMFlFeFM5VGJ5OGtkUmxkSjhxM3hPRzYxSVVUYlF6OFZT?=
 =?utf-8?B?R1JodXVuQlEvbXNsN095SGpqMHRJSThSLzQxSmZucTNMaVBJVmhISmszK05k?=
 =?utf-8?B?S1IzNVRzZjRsK1l1cUJwTGYyMldRZ1J5MUFYL3VGN0hiK2hsQ3pXR1liakhS?=
 =?utf-8?B?V0tQM2t6Tm1pYWZJZCt4enMySG9LOE4yRVNiMXVzVmpMTm9nb3N6Sml4Mm1p?=
 =?utf-8?B?M1NNZlF3cDIydWhXdDY5YkowWDF4V3BMOGFrMnpiUk5YY1BHdnl6V2UzcEdp?=
 =?utf-8?B?clZaa0dQRWVsdmtrenFjaUk2RVBWOTk1RG9iUVloRkFtMzJKd1hIUm4vN1dI?=
 =?utf-8?B?ZWt3a1lRVXhzekJZeGkzNDNtZ0drYlh5VFY5b0l1a0p6WUdKaDFveTRLN25y?=
 =?utf-8?B?czZmOFc5MFJRdWtKeVMzNlc3TnZlVnd5bnU2ano5MDBGOTlLeXRudUp2eiti?=
 =?utf-8?B?c1RBZ2J2MHVtbnJTUzFacDlRb09zaDJMMThXNzk4MlV2Z1oxUkt5UGZyYmhT?=
 =?utf-8?B?a3hzbXZEOUN0dVNBZmtmT0xJaVc4U2Z3OHhaS2tuK1MyYk1Oc3lxeEFzbTBT?=
 =?utf-8?B?cDVid1AxQWxHM2p1a0MxQnNjMHNaT0ZwdVRrc2NZOG1oSU5aSGV6dDZ3WkZ5?=
 =?utf-8?B?d3o3V0EzaG95VUZ6MlpJRUprT0V3WkJmSUlpNUZYa09UY1BzR2IrQTlRenVI?=
 =?utf-8?B?bjQyS3ViTDQ5ZmFDMURBZE0ySCtEUFR0eFQrQzZsQ21VWUlBcUtubnpKTzU0?=
 =?utf-8?B?Uk9JeFljUXlkUGo0ODZGYVo0NXhBd3cvLy9NRW9WUEJHcWFLVks2SXQzUjhN?=
 =?utf-8?B?YkV6WkNwRFV3enZpYnQ3QUFRV1BoU3hVZ3RhbWo3eHp4VkhudEVWQnF1cDY0?=
 =?utf-8?B?M3k4VUlwb1NTdkN3Tm1FTEJvVlgrNE90UGluQmpKeXJpa1BzbWVJaHBTeDYx?=
 =?utf-8?B?SW5uR2dNVEFpSG5UakJvSTFOTExHcjluL2NFdXNtWHQwT2hwT1IvRjNEN0pj?=
 =?utf-8?B?aHYzWWF1Y3JrVUN0dnVNeHFtQjdpeXpHU1N1SVpKMFYwS0gxbUlRQ296WVE1?=
 =?utf-8?B?ZEhtbndUQVFiZms1Q1NKbVNWTmhBUG0zNnlscnh6RVZHRDZvWEZMYWdKTGxi?=
 =?utf-8?Q?emWhlGJQ168315v9MjyTE+7MwN8INBYR3IuHlum?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk1JclJtVjYxUUlzRG1KSzI4Ukp1T21ETU5DWFlWbnVFNHBuNTd2dkk0Qlg4?=
 =?utf-8?B?VTBkMkJobWJWZjlrMjdwMGc3RCtjQkVOZGpuVm1mZWd6RVdnQ2Q5SzNuem0r?=
 =?utf-8?B?bjBLUmliK3UxclhuNmJxVGZ2ak9oUjdPK3B6bGI3cEVqelZCY1NmV2lwVXpH?=
 =?utf-8?B?UHVVQlFUQkk1cnQxd0UrSVcwM1Y2QXZpTEhCZjNQRUFtcFEza3BERldMUE5n?=
 =?utf-8?B?ekpWdDlWd25FYWNuTjdOcEJ1WE55b2x2NWpCMk03UUpVZmF0ZTdudkp0blc3?=
 =?utf-8?B?elhyKzU0NnZaQ295OW1VNjZINFpqbHFsVnVYT05wblNsS0szbW8wU1dnNUp3?=
 =?utf-8?B?aWtvK1VVM0JCVzhvam9JZ0tIVlhreDBPMnZuc2NZQ0t1aUFrbzFMR0tYeUpt?=
 =?utf-8?B?NFppY0ZyNXF1eVpKd2l5NnVRMXIyQ0Nwb0MzSHlyN1hBcGo5c0R0cEJFcS9E?=
 =?utf-8?B?cUhjR1NCYnNkazZRb1JYZzdmc293V1IwRU5GYXR2OWVjWTRHb3JMOE5YRHhI?=
 =?utf-8?B?V0FxN01UZXpSN2l2MERYb0diRlkvRHZFcGFFNlhxSnlGK25ucTg1QXlpcmQx?=
 =?utf-8?B?b1Z5MC9vQmhBV29BYWhBNDRwYTNub1Vwc0ZmM3U3RzgyZXRCWWQyRjVxeG5S?=
 =?utf-8?B?SVBEMWNsRmo2K3J5OHMyZWF5bUY0UEY4UkZ4SGFNeW9VT3RldHBpT3lVT3Y0?=
 =?utf-8?B?bm9PbVE4RG1zQnRXclc2SEZaM00yS1ZLZjhhV1FCOU9GUDdpdzZYOUZyS3g2?=
 =?utf-8?B?TGM5eFlJaWh6QmhpN0RzTkpQYnVtWEdhTVpFUkZzK05uVVBCUlN1TzJNV2hZ?=
 =?utf-8?B?U3lzekxvWWRPWUUrTnJzNTJhT1pmbzBHR09Ub2xoVVJKWUF1RS9nT09hSm15?=
 =?utf-8?B?WkxjSVQyNTVnME45a29SZ3NjVFN0RXhZdGxDTU42R2R4THMxanFCN2dPc1Z5?=
 =?utf-8?B?SzVnRGkzYVg0Ni9oS1FZTnNCTkVMK2RVdzBNOXNONjhXbzZlQVR1WHF5Y2JD?=
 =?utf-8?B?WklFRWorb1d5UnBwbVcwQnFOcWhzUXkxNm42NzBRQS9jMVRXVTRLVFY4cER1?=
 =?utf-8?B?cVZOKzgvWS9ydFVsZ3lBRTlXMFpOekRwZ2ZPelFIU256aExmOFdKN3prZ2Rv?=
 =?utf-8?B?TnlNS0pzYVkyaTNzZWNjQ21CS0d0WTNLZ1JoTkdKR1I1bzVrOFFuWjRES0o0?=
 =?utf-8?B?QklOSGlLNkdxYW9kYkRvaWhLOHB4ejE4cnRuMkh0NDNoODViWkNVR2trT0gz?=
 =?utf-8?B?ZHBSSkhXNlBOVGtubFJUSmlOdytBYUNoZ1I3UTJLQXNpOGVPUDdlWDZtd1VL?=
 =?utf-8?B?NmJGSGExNVprOUNVazZtNVRsbHUyVG1CRDRCdmtaWWtWZUczVWtZUFpmUVdv?=
 =?utf-8?B?OGpvcEpHc3QwUURWcTB1Wm9ueVpoam9KK2dwT3pQc2hES0p5aEZkWCt4YTVI?=
 =?utf-8?B?a3BjaWZaUmNuNzZReFkraDhYeWdQazVsU2VqdGlZVG1XZkNwREgwUk1mR1d2?=
 =?utf-8?B?OW1VWW5lZTZYaEcybGxEK1YvQnhTdzc0bVVxeWk4YVpXOWNDMm1YVlplWFJr?=
 =?utf-8?B?aWE3RzFuQ3NvaEVGV1Uxa3ozTXdaWnpuUG5ieStDa3d5VGxRTVUvcnE5dHRM?=
 =?utf-8?B?Q1RJN2VHL0ZkampGLzNCbFhGdFRLNVZ0SDdOdVBOOUJPZ3lJRFkwTDZ0Skly?=
 =?utf-8?B?TFBIcUxyajU5Qk5oSW4vZFBuQXRpc1N5bFhTUExUNERXdXROSkhUQ2FhSys3?=
 =?utf-8?B?bTJsTFlhSUNWRHdHUm1QQ1BtRjIxOXFvQzJ0SURKUFlyRWljSFZJSnNUc0Nl?=
 =?utf-8?B?ZzRMMTkvcXZkNFQxK0c0cVRtOTQrT2FNNmhOeXFTbHphbUxMMFhIL1dZeHE2?=
 =?utf-8?B?T0orWVFYUWhnbEhoM1ZrU2hmUXFyYWZwUjlSeklpMHdjY3BzNFFzckVBWC9F?=
 =?utf-8?B?NktUamJhT21Gdlc3cDMxWVdnUHBSSC9hYVpmT1FqRHVuYk5BK1dkTjdxeGFr?=
 =?utf-8?B?WXNOZWxRejZIWDN0NlROWHg5VFJxU2Q4eGFHbnp0VkovVmxZZG9VZWVJcGRt?=
 =?utf-8?B?QlYwVHF1Q1pzd2JNNEhyOTN5cXV6UmtybWsrWThOSWZrc05Cc2MxdkZSRGRt?=
 =?utf-8?B?ZG9KZ3dRK0pjVitFWEtxdzhzRGVOUVgrQ3ZoTmVaTkRWRXlyWkd0cnRPMFNB?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0d5e25-d601-4ed2-a116-08dd0a245cff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 12:02:25.3229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eW1kkcuNIFqGlYBN2W8T7aNj5g1oq5+pdJv2ZzoP7DqnV73nJbUpU+RJIce/sIMlCqsNu2+5GWcX5q6k7yHAs4vkYLcsCtt7ZyZBIdVMrZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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



On 11/18/24 3:00 PM, Hajda, Andrzej wrote:
> W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
>> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>> Create a function that adds the capacity to fill an oword at a given
>> ppgtt offset with a dword value.  Xe2 does this with an Untyped 2D Block
>> Array Store operation, though older platforms used to do this with a
>> Media Write Block, so both means are supported.
>>
>> Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 109 ++++++++++++++++++++++++++++++++++++
>>   lib/gpgpu_shader.h          |   2 +
>>   lib/iga64_generated_codes.c |  81 ++++++++++++++++++++++++++-
>>   3 files changed, 191 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 4e1b8d5e9..7a2f0d28d 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -652,6 +652,115 @@ void gpgpu_shader__write_dword(struct 
>> gpgpu_shader *shdr, uint32_t value,
>>       ", 2, y_offset, 3, value, value, value, value);
>>   }
>> +/**
>> + * gpgpu_shader__write_offset:
>> + * @shdr: shader to be modified
>> + * @ppgtt_offset: write target virtual address
>> + * @value: dword to be written
>> + *
>> + * Fill oword at @ppgtt with dword stored in @value.
>> + *
>> + * Note: for the write to succeed, the address specified by 
>> @ppgtt_offset has
>> + * to be bound. Otherwise a page fault will be triggered.
>> + */
>> +void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t 
>> ppgtt_offset,
>> +                uint32_t value)
> 
> The name is somehow misleading, maybe gpgpu_shader__fill_a64_4dw? 
> Anything better?
> 
I will update the function names more clearly and send the patch as 
version 2.
candidate name: gpgpu_shader__write_a64_dword() and 
gpgpu_shader__read_a64_dword
>> +{
>> +    uint64_t offset = CANONICAL(ppgtt_offset);
>> +    igt_assert_f((offset & 0xf) == 0, "Offset must be aligned to 
>> oword!\n");
>> +
>> +    emit_iga64_code(shdr, write_offset, "                    \n\
>> +#if GEN_VER < 2000 // Media Block Write                        \n\
>> +(W)    mov (8|M0)        r30.0<1>:ud    0x0:ud                \n\
>> +    // canonical address                            \n\
>> +(W)    mov (1|M0)        r30.0<1>:ud    ARG(0):ud            \n\
>> +(W)    mov (1|M0)        r30.1<1>:ud    ARG(1):ud            \n\
>> +    // written value                            \n\
>> +(W)    mov (1|M0)        r31.0<1>:ud    ARG(2):ud            \n\
>> +(W)    mov (1|M0)        r31.1<1>:ud    ARG(3):ud            \n\
>> +(W)    mov (1|M0)        r31.2<1>:ud    ARG(4):ud            \n\
>> +(W)    mov (1|M0)        r31.3<1>:ud    ARG(5):ud            \n\
> 
> It could be replaced by "mov (4) r31.0<1>:ud ARG(2):ud", and then 
> removed duplicated arguments ARGS(3-5).
> 
I will remove the shader code that is not currently in use and remove 
the duplicate code on next version
>> +    // owblock write                            \n\
>> +(W)    send.dc1 (16|M0)    null    r30    r31    0x0    0x20d40ff    \n\
>> +    // owblock read, to block the thread until the write is 
>> materialized    \n\
>> +(W)    send.dc1 (16|M0)    r32    r30    null    0x0    0x21500ff    \n\
>> +#else // Unyped 2D Block Store                            \n\
>> +// Instruction_Store2DBlock                            \n\
>> +// bspec: 63981                                    \n\
>> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies 
>> both        \n\
>> +//    the block parameters and the 2D Surface parameters.            \n\
>> +// src1 data payload format is selected by Data Size.                \n\
>> +// Untyped2DBLOCKAddressPayload                            \n\
>> +// bspec: 63986                                    \n\
>> +// [243:240] Array Length: 0 (length is 1)                    \n\
>> +// [239:232] Block Height: 0 (height is 1)                    \n\
>> +// [231:224] Block Width: 0xf (width is 16)                    \n\
>> +// [223:192] Block Start Y: 0                            \n\
>> +// [191:160] Block Start X: 0                            \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 
>> bytes)            \n\
>> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)                
>> \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 
>> bytes)            \n\
>> +// [63:0] Untyped 2D Surface Base Address                    \n\
>> +// initialize register                                \n\
>> +(W)    mov (8)            r30.0<1>:uq    0x0:uq                \n\
>> +// [0:31] Untyped 2D Surface Base Address low                    \n\
>> +(W)    mov (1)            r30.0<1>:ud    ARG(0):ud            \n\
>> +// [32:63] Untyped 2D Surface Base Address high                    \n\
>> +(W)    mov (1)            r30.1<1>:ud ARG(1):ud                \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f                    \n\
>> +//       (Width minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)         r30.2<1>:ud    0x3f:ud                \n\
>> +// [127:96] Untyped 2D Surface Height: 0x0                    \n\
>> +//        (Height minus 1 (in number of data elements) of            \n\
>> +//        the Untyped 2D surface, it represents 1)                \n\
>> +(W)    mov (1)         r30.3<1>:ud    0x0:ud                \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f                    \n\
>> +//         (Pitch minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)            r30.4<1>:ud    0x3f:ud                \n\
>> +// [231:224] Block Width: 0xf (15)                        \n\
>> +//         (Specifies the width minus 1 (in number of data elements) 
>> for this    \n\
>> +//         rectangular region, it represents 16)                \n\
>> +// Block width (encoded_value + 1) must be a multiple of DW (4 
>> bytes).        \n\
>> +// [239:232] Block Height: 0                            \n\
>> +//         (Specifies the height minus 1 (in number of data elements) 
>> for    \n\
>> +//         this rectangular region, it represents 1)                \n\
>> +// [243:240] Array Length: 0                            \n\
>> +//         (Specifies Array Length minus 1 for Load2DBlockArray 
>> messages,    \n\
>> +//         must be zero for 2D Block Store messages, it represents 
>> 1)        \n\
>> +(W)    mov (1)            r30.7<1>:ud    0xf:ud                \n\
>> +// src1 data payload size                            \n\
>> +// Block Height x Block Width x Data size / GRF Register 
>> size            \n\
>> +//    => 1 x 16 x 32bit / 512bit = 1                        \n\
>> +// data payload size is 1                            \n\
>> +(W)    mov (8)            r31.0<1>:uq    0x0:uq                \n\
>> +(W)    mov (1|M0)        r31.0<1>:ud     ARG(2):ud            \n\
>> +(W)    mov (1|M0)        r31.1<1>:ud    ARG(3):ud            \n\
>> +(W)    mov (1|M0)        r31.2<1>:ud    ARG(4):ud            \n\
>> +(W)    mov (1|M0)        r31.3<1>:ud    ARG(5):ud            \n\
>> +// send.ugm Untyped 2D Block Array Store                    \n\
>> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc                \n\
>> +// Execution Mask restriction: SIMT1                        \n\
>> +//                                        \n\
>> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D 
>> Block)    \n\
>> +// bspec: 67780                                    \n\
>> +// 0x0 =>                                    \n\
>> +// [32:22] Global Y_offset: 0                            \n\
>> +// [21:12] Global X_offset: 0                            \n\
>> +//                                        \n\
>> +// Message Descriptor                                \n\
>> +// bspec: 63981                                    \n\
>> +// 0x2020407 =>                                    \n\
>> +// [30:29] Address Type: 0 (FLAT)                        \n\
>> +// [28:25] Src0 Length: 1                            \n\
>> +// [24:20] Dest Length: 0                            \n\
>> +// [19:16] Cache : 2 (L1UC_L3UC)                        \n\
>> +// [11:9] Data Size: 2 (D32)                            \n\
>> +// [5:0] Store Operation: 7                            \n\
>> +(W)    send.ugm (1)        null    r30    r31:1    0x0    
>> 0x2020407    \n\
>> +#endif                                        \n\
>> +    ", offset & 0xffffffff, offset >> 32, value, value, value, value);
> 
> with above change, and proper macros line above becomes:
> , lower_32_bits(offset), upper_32_bits(offset), value);
> 
>> +}
>> +
>>   /**
>>    * gpgpu_shader__clear_exception:
>>    * @shdr: shader to be modified
>> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
>> index c7c21c115..355b128b5 100644
>> --- a/lib/gpgpu_shader.h
>> +++ b/lib/gpgpu_shader.h
>> @@ -83,6 +83,8 @@ void gpgpu_shader__write_aip(struct gpgpu_shader 
>> *shdr, uint32_t y_offset);
>>   void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t 
>> value);
>>   void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t 
>> value,
>>                      uint32_t y_offset);
>> +void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t 
>> ppgtt_offset,
>> +                uint32_t value);
>>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, 
>> uint32_t dw, uint32_t x_offset,
>>                         uint32_t y_offset, uint32_t mask, uint32_t 
>> value);
>>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index 6638be07b..b23613ac4 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   #include "gpgpu_shader.h"
>> -#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
>> +#define MD5_SUM_IGA64_ASMS 4fcde43dedb9d3212f1d85b5b180b0c1
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -323,6 +323,85 @@ struct iga64_template const 
>> iga64_code_clear_exception[] = {
>>       }}
>>   };
>> +struct iga64_template const iga64_code_write_offset[] = {
>> +    { .gen_ver = 2000, .size = 64, .code = (const uint32_t []) {
>> +        0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e354220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> +        0x800c0061, 0x1f054330, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
>> +        0x80000061, 0x1f154220, 0x00000000, 0xc0ded003,
>> +        0x80000061, 0x1f254220, 0x00000000, 0xc0ded004,
>> +        0x80000061, 0x1f354220, 0x00000000, 0xc0ded005,
>> +        0x80032031, 0x00000000, 0xf80e1e0c, 0x00801f0c,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
>> +        0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
>> +        0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>> +        0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
>> +        0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
>> +        0x80001d01, 0x00010000, 0x00000000, 0x00000000,
>> +        0x80044031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
>> +        0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
>> +        0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
>> +        0x80000061, 0x1f154220, 0x00000000, 0xc0ded003,
>> +        0x80000061, 0x1f254220, 0x00000000, 0xc0ded004,
>> +        0x80000061, 0x1f354220, 0x00000000, 0xc0ded005,
>> +        0x8013a031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
>> +        0x8010c131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
>> +        0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
>> +        0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>> +        0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
>> +        0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
>> +        0x80001d01, 0x00010000, 0x00000000, 0x00000000,
>> +        0x80044031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
>> +        0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
>> +        0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
>> +        0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>> +        0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
>> +        0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
>> +        0x8004d031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
>> +        0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> +    }}
>> +};
>> +
>>   struct iga64_template const iga64_code_media_block_write[] = {
>>       { .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>>           0x80100061, 0x04054220, 0x00000000, 0x00000000,
> 

