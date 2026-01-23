Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88AED72348
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 08:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572A210EA59;
	Fri, 23 Jan 2026 08:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ewivy03F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445E510EA59
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769155872; x=1800691872;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pmg3Vjp4iSNWhIzfQJXJrzk2KFQfZLtUu4ejsjwMzPk=;
 b=Ewivy03FCSjxCVDUpPHi1JwfXJHyLRG3ciSZx27Or33F+I77XWic+qnF
 jYWnNLfiC9T39qJRBk9p0l+LcbhBW3KgGFfaWNnnvyuqkCJ95UUmRrRHE
 oHCmpKOUVFJQ0W/7lPy6j72SNMjc0iGN+oHemPUzhEYf1phS3linn2y2L
 9tdT7a3nQYsel+7jZ67/863yfcLVOmFXyXk9L2r9kVOrzPsWV/gEFg6mm
 zsBu/abnofPm0VVhey7i+q2vsfJGMb3vWxaIxwtTGrWFJAq+diny3pAvC
 hzd6akmVMMPfkVfQm7HXU8vUrA1u47zLdeU7KJvq5b0YXK9CSZouAgVkQ w==;
X-CSE-ConnectionGUID: tEVQDOd0SZGhCKTR94DCXQ==
X-CSE-MsgGUID: mwj+WqodSmiLD7TvgPVH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81519672"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81519672"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 00:11:11 -0800
X-CSE-ConnectionGUID: 4a6Uh52ESGmLJipiFs8A6Q==
X-CSE-MsgGUID: cUpPi/gPSxqXpPLeHo0hug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206576497"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 00:11:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 00:11:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 00:11:09 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 00:11:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfnwwtH5bELrMU7yOJRKKcDkoBoDUh5qwExHof4Ku2tcg4V6m+sIt+sJPEVftDIpG/H6xOL/PNuap/ItTMjbs63Mw1ZssoONUj008R+hNQZtE3ceIL+b+j0T672uIgJv/34ttTz3Ga0ZC6f+ptUAYiVksg0T8x9400PrB2M5+0Iq0FaRqfSHNVyUg0Dy8HX8iU1Z1V9zJ4zbcceetXoFyId9wteqnXmLj2caaK0YQPk4MNpEV3zhgHlVvlsPfNoL4358g7fFxwhZpi36SDkKD/mqM/yPtVUBxOGElA4XX1bOMaTrLdzqsbesedr1allDabmciH7lZ4+6YX0L+W5V7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LL+bjmrrZRhFJm5dXB3ZOM84lkmMPZze2v4m6jOIqyk=;
 b=RbdmC8CZMpSLW7wh1i1RdiJuvujqtnNCl8KNjsH9cCFrzOGXaoQ3nF1KA/871E0JkCwcU5hVTz10rvxaA1FcJq2obQ8vD5GjY9YHkY+uuEQkFkUGstZ4Sj6tbTOJFZ9v3E5jOrF/VPZDJ9Edf2eJZeh6mN7Xllovb+A6bVFBf+G8H3Ro3GQEL+3szdgjtI5Y6YVOuriNS8pJ0c9Eak34hJVGD3PIe/KPsMy+59PiwbgrUtjOnu2v0pylN7SiN/Xvd2FM1o9keAKSU4/S7hUazwvHUoV4tw1QkTs857r15ptYoEqentYqDu8O6W4gy1m23Trhu2eBodbzmX8fO2UBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 23 Jan
 2026 08:11:07 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:11:07 +0000
Message-ID: <0e28508a-cd40-4024-a121-26117839f559@intel.com>
Date: Fri, 23 Jan 2026 13:41:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 1/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260122125424.45139-1-sobin.thomas@intel.com>
 <20260122125424.45139-2-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260122125424.45139-2-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef5c3cf-9fdd-4df1-448c-08de5a56f61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTZ3MElSNFJGcFN1OUx5cHlHb0tkNElGNEpmSGp1TnFSTUkrMlFnejlrSlJu?=
 =?utf-8?B?V3JGd1JhRElxWjFBSG1YZnZHTGFMWHljQjFuNDZPTlkrbFRPeitJRkRaVXZ3?=
 =?utf-8?B?U09WRWFIdGJoaEtDQXM1ZVFoNkI4UTJOMnhPSi9CM3RyOHpUR3lRci9qY29V?=
 =?utf-8?B?cXI5QkhkeUtvV0ZtK2EvQTd6eEx0VURrOHdGc1VRK281eVpDU0VhOEhWL0xZ?=
 =?utf-8?B?c0J4Mjc4MjBqcG5ycDJoRS9seDZoWk4wRGJCdlJIeVhTd00xMzRwMkRpc1pi?=
 =?utf-8?B?MWQwaFhKQ3cwbi91WHZRNENOY0Nudnk1Y1hEU3B0aVEzNDQ1RitmZzFwOUhV?=
 =?utf-8?B?SnJZMzJPZ1JtZGhwbnM1dGQ0TXZtWld2KzlVZ2tpS3crRk8wK003SCtoUHYv?=
 =?utf-8?B?Q2p1N0daenJQSHpzQ0dZN0dJMUg0NlcrY0JIc21VWlhDeHF2Nno1cXJ4aWtT?=
 =?utf-8?B?NGdNSzgvMFU1MStyZHlBZDAyMjhCbHFnOXdCKzkybkNFZmdqRDkxbTFKNHdl?=
 =?utf-8?B?TTdmVEpRU0c0RTNnTTdiUjhsRDBwUWZvSEh6RDZoeGt1WTluamx5ZlhodUtR?=
 =?utf-8?B?dXc3blZqdWxtdFhnYlhnZnlBQ254U2ZOQTF1UEtva3dEUmQwU3pVWjcwQVVL?=
 =?utf-8?B?cHVubkVXeTlBSWhlWnJjZ2Y1T2N3RWtQRUs2UkNqTkdZMC9ZV3JPMnBQbk5T?=
 =?utf-8?B?aHhYM1YvREYycjJPYVJJZGZNY3JxYzJWQ3Y1aTcra0NvRVlQYjZ2RlRkQks0?=
 =?utf-8?B?ZE1sSjRNclhzVWc4ckdYbnZrS3JCUWRqQVJFS1p6OC9TaENUMmJnMkVUVHVa?=
 =?utf-8?B?enpGTlB4cFZDQnhzODEyeFlCbnIza1p3MUw1d1cvOUZ5UGk3ZDZHdEpWeDZz?=
 =?utf-8?B?L2ZFNTErWDhJZjdBZ3JuVE8vNGpzVlYwbFR4NnRXQ3FXM2ZIRG8raVlqM3k3?=
 =?utf-8?B?RWdOTlY3VnhtQU0zL24zU2dCbnp0VVlKOVVlY251SDB3NGhoMmN0TGpsMWsz?=
 =?utf-8?B?TUFFck9ZZUthRWR3bHNkbU9lR0ZFdzZjc0ZNNFRmQ2JIWmZMMHRWazl4RFoy?=
 =?utf-8?B?REFYS08rOEdKR3R4QjN2ZzBFV09meUp5RVY2YXQycW5PQlh5eXFacWFlN3N3?=
 =?utf-8?B?dzJTZG1sWm5qT0ZLRHoyV2ZUZWUrd00wODZBL2QwZnVJU25BSFhSSjJBcjdJ?=
 =?utf-8?B?N0tZSm9tM0xYZlRjRlJaNGIxTUpXWHBjM0hPQWs1akpCRjFFWUt4dzFsYkRn?=
 =?utf-8?B?TjgwQjNEaGtLMXhVRlZYZ2ZHcFpyY3ZQUCtpbGVmcnIyMEJmRDA2OWlPbnV0?=
 =?utf-8?B?SWxPMC9Cd0JMRjlZbVlTVlR6UjhrV0dtT1M3UlBhZ1k5NExFUmxFbnFzVGdm?=
 =?utf-8?B?SWExVC95WjE3Y1JPNk5GYmZUNmhlaGtUWkd6NFlhaEQ2akdxMDVoVTVjMWo3?=
 =?utf-8?B?WTFwZC9FSnk1MzI4ZHlpejFURXh1Y2hiS20rNlZrVG01NGlsK0RDYWd6TjRs?=
 =?utf-8?B?TEFjeGYvMHQ4VXNQNHBscTBDa3NwOEV3RWR4c2o3QjNuN01DMlBXY1dJTFd2?=
 =?utf-8?B?dTYrNEM1VUxhV1pEQTM0UFY5b0JFMVlyaTgrdGFPaFlNbTdwV0cyNDBieUN6?=
 =?utf-8?B?SWhYWU45YWVNQ3ZJTjlvcnRJUnlIM0JxZmVZemMxbmh0Zk94RSt2YXBzeEVl?=
 =?utf-8?B?Z1VjY0xoalJwNFo2a2FmMktoTDQxemdHZDNRWjM2bklpSkd5aExaNThlSE9k?=
 =?utf-8?B?TXFTNjZjbUFOQ2w4OVp2QlF5TlhnU2M2REdpQ3lTdXZWeXMrbXF1UTExQ09w?=
 =?utf-8?B?d2NpQ01TM3RYTjIvT1ZSMytYSlgxbXdCWlU0SEZPSFF4bU1qNmRYZS85YU9v?=
 =?utf-8?B?NUF6ZkloZUtFOFhPNW9jeU9oQ204MGltWEFLSXlnaThnREtzdXYwblBTanJO?=
 =?utf-8?B?dnQwOWdvaW1uRTRRUk1JUXZ4ZVFVdjhEaFVydWEwelFuNXE3dHZ0QmxjSVgr?=
 =?utf-8?B?eDVGaWZjR1dBZ1I0ZG5Kd0JUeFMrc1VxQzgrOURBK1JUYU1Da2dkNDQreUZ3?=
 =?utf-8?B?allBMC9mYmdCZkdzcHM5MWV5eUdDRGlBb2QrZzQzTm5qY2lIL0UwYmsyREFy?=
 =?utf-8?Q?Ub1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXRGNUx2dzFLbWxUM2NXYVZTcUtoWnJ0UEdXZFk0Y3dCaUdwU3prQW1LdEhZ?=
 =?utf-8?B?clArc3FMM3RKWktGNDM5OVZsZXZkZ3BwOGNVRUxNeE9OOTB2T1ZoaUV1em9O?=
 =?utf-8?B?VDk1cmNwdFRQWjFabEJiM1Voc3JSdWxLZTdjRlNBMkh2UExiQjYxZW5DeVBY?=
 =?utf-8?B?a2o1QjFhK3IwcjlTakdpRG8yZHRjV0RNZU9kaUxyRGdtM3FjcWlMbEY0ZVZX?=
 =?utf-8?B?bi83aWRpYWxpbUtXMUlzMnc5ZmJ6dWR4UHhTMHZmZVEvd0lzbVpFMmZDMTc3?=
 =?utf-8?B?b2RpRDZyRUNVNG1RNmxoZytEVi9nbHhCOVBCdWVNUkErWFA2NSt0aFRoVDYy?=
 =?utf-8?B?ZlhKMTJhVytVQ3htc0JFYmJNa2toclM5bVNrZmJIRDhWR2YvSi8vQ0J4RzZY?=
 =?utf-8?B?dW5rNGN6NUl1dmdpSTk5d2dockNxREJrcjRIZGdyV1UzdVBqQm9jcGIvQUZI?=
 =?utf-8?B?cHRuTW8zc05RZjZ3NVExT3dISVpGQXFKQVh6S2NWMDVVNmp1MUxidGtaT0I3?=
 =?utf-8?B?b0diUmJWNTU0VEZUSzZKaFYvSTJCOGNoZGpsN2pKQWZ6bWVQWjFrK2dNWjgw?=
 =?utf-8?B?VXBnVUd2ZTM3cFBEem1FQ0FvazlGOFYvcUxtY2x5cHRCeTdmak1qK1NaZloy?=
 =?utf-8?B?R1VpYkV1MFdCcWRCL2pmMk9uaUlQSVZ3bXV5SnRzMFFhM214TG42NUVFbTRM?=
 =?utf-8?B?TERsbkdGYVkzcG93M2RyK285TUk1SThyVFp2aml5RHg3dThnUEVUeG53VGdz?=
 =?utf-8?B?Q1lPUWhQVzIrRWhiUHh0YzhSUGxIbnBvTTlZLytJYkgxc05paFovVTlNa3du?=
 =?utf-8?B?Z2lWKzR1WFZQcFArQ3F6WGFDZjZvNVZSOGVHTW9pcFRxakdZcm1PTFE1U2M2?=
 =?utf-8?B?bERjcFBKM2hmRVBwb01CbkFWeTVmcTErMmNLU0xmLzBUb3dTelhreEgxN0JC?=
 =?utf-8?B?R29sSStGc2JncDlCUHVreHdVN0djc1BiUUdYZldCKzBQMnUyMVF2LzYxL1NH?=
 =?utf-8?B?NCs5eUM5VWNOSFRNd2EvYkRwdmxDK0s2ZkNNNlZXbFlIY2dSell5V1M0WW9W?=
 =?utf-8?B?UVVTR2R3RXdXZnZZa3FtUlNKcWg0Rk8ySE5MN0trTE9UUklUSERWeXM3ODd2?=
 =?utf-8?B?cVkwYVhUL1ZGWmQ5bi9haitMUTJQaTVKV2ZQL0J1VGNtLzdVeW9qcUVyTmNw?=
 =?utf-8?B?ODB4TitHMXFubTFEbTBBZEhndEZIaTl2b2hjNjBFWDYvNUo1TlcxL2hKazND?=
 =?utf-8?B?L0tWV1ZtREdzQXYyNFRJUUY1SUpWc044MnY0c3VzdWdFLzl1S0NvV3RUd3Y3?=
 =?utf-8?B?VDB6OE1SVGNhSk50cFpVMWxrNjArVnZPTkltYjAvL1JsdVovdWtHa3FsOG1C?=
 =?utf-8?B?YWg1dE13eGpxeXU1bGpUelJjSU1Zc0V6cVYzeHM4VFp6ZEQwbDdQWDVXYXdV?=
 =?utf-8?B?dEt0WkFCL2RiTWUya1JVemIrVldPQWJ6KzF4MGxUVDhsczhJN1lzRGJ3WVRN?=
 =?utf-8?B?MnRPWjFSOHMzUGp1MUUzYm0ySGNWZDdYd1J6bmVaTnJsc05UcElBWHNpMysr?=
 =?utf-8?B?TXo4VWRTaE5WQ3N4VVpxUHVRZ3Fxc0I2Q3pYR3JJRktVK1BwZGtpOG13T0Fy?=
 =?utf-8?B?SncwbEp6RDRoTTIzZWxTWWMydEVESUJFT052OXhQVHFXZTVTdEZoR2szSWxl?=
 =?utf-8?B?dlpicGZRU21LU21HYXNudGFTelZlYk9UbmN4Q3psSE1qTS9pdFBCTUVVUWxq?=
 =?utf-8?B?bTYyYmxpclRjYWxVeGR3dHNCT3ExeVVTR3pqeVBldXlKM1padEY3K25hUGxu?=
 =?utf-8?B?WGVWSmtHamFRZUFYZ1ZyWVA5NFZWZWZHUW5sZFFKRWlwSlgzQkVMMWIrVmU3?=
 =?utf-8?B?UmtaRGpTdFBpV2l5cWN6cHFSMC9kK21BTm9vNm9LR2srV0s5Zi8rOUFkMnpB?=
 =?utf-8?B?dlVJcS81QWNxTkd2M21BNnIyMnBQdFZyQXpIekpiWDFVY0Y3KzBGWmtUMElv?=
 =?utf-8?B?NlNRdDVyRHdCV1RkWkVRWWR0N25uOWZodkI3cS9zK3FRT0pkZlZqRmllYkt4?=
 =?utf-8?B?Zm9LNGZ2bUp5eTY1clpJMklJRTRFTDdWK3V4ZkFwZ1NvVW1BWkY3ZkFXdEFs?=
 =?utf-8?B?V205aFNGLzZWVldwV0tOcGRlZkhtdW5FV29YdWlVbm5JZElZYjNyWlpVYTNw?=
 =?utf-8?B?NDlveUhSK2xQYXAyVklaRWsySVZlRVhjY01OMURydkp0WmRKNU91WGJvc3Rj?=
 =?utf-8?B?aFpsSHNuZDF4S1VxMElyRitRN2RWNllEVFJrMjVkR3FIaXJNL3pMS2IwZUpV?=
 =?utf-8?B?Ui9RSHpQSmJlNEhFL2pIejNxMUhCaW9lVllHT3o0bEhtdnZkQWtoMnVWekl3?=
 =?utf-8?Q?0+lhvx2yFUpnqYzQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef5c3cf-9fdd-4df1-448c-08de5a56f61f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:11:07.7209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWXAMqP5Y2YvCcIxNVISHtsuNX9BSuG80z2ICaL8y7mP99wNYZs1ieYZW7IDzGMGLtwlN6vQO79BysvPLO9jjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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


On 1/22/2026 6:24 PM, Sobin Thomas wrote:
> The existing tests in xe_evict focus on system-wide memory allocation
> across multiple processes. However, enhanced coverage for VRAM
> overcommit handling in different VM modes was not there.
>
> This change adds three new tests to verify VM overcommit handling.
>
>   test_evict_oom(): Allocates BOs aggressively in a loop until
>   VRAM overcommit occurs testing LR mode error handling.
>
>   test_vm_nonfault_mode_overcommit() verifies that non-fault mode VMs
>   properly reject overcommit attempts.
>
>   test_vm_fault_mode_overcommit() validates that fault-mode VMs can
>   handle memory pressure gracefully by touching pages to trigger page
>   faults.
>
> v3:
> - Addressed review comments from Nishit on the error handling.
> - Replaced igt_info with igt_debug and igt_warn
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_evict.c | 310 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 310 insertions(+)
>
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 2350487c8..136ec4e09 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -1,4 +1,5 @@
>   // SPDX-License-Identifier: MIT
> +//
>   /*
>    * Copyright © 2021 Intel Corporation
>    */
> @@ -29,6 +30,7 @@
>   #define COMPUTE_THREAD		(0x1 << 4)
>   #define EXTERNAL_OBJ		(0x1 << 5)
>   #define BIND_EXEC_QUEUE		(0x1 << 6)
> +#define USER_FENCE_VALUE    0xdeadbeefdeadbeefull
>   
>   static void
>   test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> @@ -210,6 +212,252 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>   	drm_close_driver(fd);
>   }
>   
> +static int
> +test_evict_oom(int fd, struct drm_xe_engine_class_instance *eci,
> +	       int n_exec_queues, int n_execs, uint64_t system_size,
> +	       size_t bo_size, unsigned long flags)
> +{
> +	uint32_t vm;
> +	uint32_t bind_exec_queues[1] = { 0 };
> +	uint64_t addr = 0x100000000;
> +	uint64_t total_alloc_size;
> +	int bind_err = 0;
> +	uint32_t *bo;
> +	int i;
> +	const size_t min_map_size = 4096;  /* Add constant with proper type */
> +
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +
> +	/* Calculate total allocation size - now for full n_execs */
> +	total_alloc_size = (uint64_t)n_execs * bo_size;
> +
> +	if (system_size < (total_alloc_size / 4)) {
> +		igt_warn("Insufficient memory to run OOM test safely\n");
> +		return -ENOMEM;
> +	}
> +	if (total_alloc_size > system_size) {
> +		int safe_n_execs = system_size / bo_size;
> +
> +		safe_n_execs = ALIGN_DOWN(safe_n_execs, 4);
> +		if (safe_n_execs < 4) {
> +			igt_warn("Not enough memory to run OOM test\n");
> +			return -ENOMEM;
> +		}
> +		igt_warn("Reducing n_execs from %d to %d to fit in available memory\n",
> +			 n_execs, safe_n_execs);
> +		n_execs = safe_n_execs;
> +		total_alloc_size = (uint64_t)n_execs * bo_size;
> +	}
> +	igt_debug("OOM test: n_execs=%d, bo_size=%llu MB, total_alloc=%llu MB, available=%llu MB\n",
> +		  n_execs, (unsigned long long)(bo_size >> 20),
> +		  (unsigned long long)(total_alloc_size >> 20),
> +		  (unsigned long long)(system_size >> 20));
> +
> +	/* Allocate array for n_execs BOs */
> +	bo = calloc(n_execs, sizeof(*bo));
> +	igt_assert(bo);
> +
> +	fd = drm_reopen_driver(fd);
why drm_reopen_driver()? Already fd is passed from calling function 
which can be used here/
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
> +
> +	igt_debug("\n n_execs = %d, bo_size = %zu\n", n_execs, bo_size);
> +
> +	/* Try to allocate and bind more than available memory */
> +	for (i = 0; i < n_execs; i++) {
> +		uint32_t __bo;
> +		struct {
> +		uint64_t vm_sync;
> +		} *data;
> +		int create_ret;
> +		size_t map_size;  /* Use size_t for map size */
> +
> +		/* Use __xe_bo_create to handle allocation failures gracefully */
> +		create_ret = __xe_bo_create(fd, 0, bo_size, vram_memory(fd, eci->gt_id),
> +					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +					    NULL, &__bo);
> +		if (create_ret) {
> +			igt_warn("BO create failed at iteration %d with error %d (%s)\n",
> +				 i, create_ret, strerror(-create_ret));
> +			break;
> +		}
> +
> +		bo[i] = __bo;
> +
> +		/* Calculate map size with same types */
> +		map_size = sizeof(*data) > min_map_size ? sizeof(*data) : min_map_size;
> +		data = xe_bo_map(fd, __bo, map_size);
> +		sync[0].addr = to_user_pointer(&data->vm_sync);
> +		bind_err = __xe_vm_bind(fd, vm, bind_exec_queues[0], __bo, 0, addr,
> +					bo_size, DRM_XE_VM_BIND_OP_MAP, 0, sync,
> +					1, 0, 0, 0);
> +		/* Attempt bind - should eventually fail with -ENOSPC or -ENOMEM */
> +		if (bind_err) {
> +			bind_err = -errno;
> +			igt_warn("Bind failed at iteration %d with error %d (%s)\n",
> +				 i, -bind_err, strerror(-bind_err));
> +			munmap(data, map_size);
> +			gem_close(fd, __bo);
> +			bo[i] = 0;
> +			break;
> +		}
> +
> +		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
> +			       bind_exec_queues[0], 20 * NSEC_PER_SEC);
> +
> +		/* Unmap with the same size we used for mapping */
> +		munmap(data, map_size);
> +		addr += bo_size;
> +	}
> +
> +	/* Cleanup allocated BOs - iterate through all n_execs */
> +	for (int j = 0; j < n_execs; j++) {
> +		if (bo[j])
> +			gem_close(fd, bo[j]);
> +	}
> +
> +	xe_exec_queue_destroy(fd, bind_exec_queues[0]);
> +	xe_vm_destroy(fd, vm);
> +	drm_close_driver(fd);
> +	free(bo);
> +
> +	return bind_err;
> +}
> +
> +static unsigned int oom_working_set(uint64_t vram_size, uint64_t system_size,
> +				    uint64_t bo_size)
> +{
> +	uint64_t target_allocation;
> +	unsigned int set_size;
> +
> +	/*
> +	 * For VRAM eviction testing, we want to allocate MORE than VRAM size
> +	 * to force eviction to system memory. Target 150-200% of VRAM.
> +	 * The BOs are created with VRAM placement, so they'll initially go to VRAM
> +	 * and then get evicted to system when VRAM fills up.
> +	 */
> +	target_allocation = (vram_size * 150) / 100;  /* 150% of VRAM */
> +
> +	/* But ensure we don't exceed available system memory */
> +	if (target_allocation > (system_size * 80) / 100) {
> +		target_allocation = (system_size * 80) / 100;
> +		igt_debug("Limited by system memory: reducing target from %llu MB to %llu MB\n",
> +			  (unsigned long long)((vram_size * 150 / 100) >> 20),
> +			  (unsigned long long)(target_allocation >> 20));
> +	}
> +
> +	set_size = target_allocation / bo_size;
> +
> +	igt_debug("VRAM stress calculation: vram_size=%" PRIu64 " MB, system=%" PRIu64
> +		  "MB, target_alloc=%" PRIu64 " MB (%.1f%% of VRAM), bo_size=%"
> +		  PRIu64 " MB, set_size=%u\n",
> +		  (uint64_t)(vram_size >> 20), (uint64_t)(system_size >> 20),
> +		  (uint64_t)(target_allocation >> 20),
> +		  (double)(target_allocation * 100) / vram_size,
> +		  (uint64_t)(bo_size >> 20), set_size);
> +
> +	return ALIGN_DOWN(set_size, 4);
> +}
> +
> +static void
> +test_vm_nonfault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> +				 uint64_t system_size, uint64_t vram_size,
> +				 uint64_t overcommit_multiplier)
> +{
> +	uint32_t bo;
> +	uint64_t overcommit_size;
> +	uint32_t vm;
> +	int ret, cret;
> +
> +	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
> +
> +	/* Limit overcommit to available memory to avoid OOM killer */
> +	if (overcommit_size > system_size) {
> +		igt_info("Limiting overcommit size from %llu MB to %llu MB (available)\n",
> +			 (unsigned long long)(overcommit_size >> 20),
> +			 (unsigned long long)(system_size >> 20));
> +		overcommit_size = ALIGN(system_size, 4096);
> +	}
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	cret = __xe_bo_create(fd, vm, overcommit_size,
> +			      vram_memory(fd, eci->gt_id) | system_memory(fd),
> +			      0, NULL, &bo);
why both vram and system_memory? I think we are verifying overcommit 
using vram.
> +	if (cret) {
> +		igt_assert_f(errno == E2BIG || errno == ENOMEM || errno == ENOSPC,
> +			     "xe_bo_create failed with unexpected errno=%d (%s)\n",
> +			     errno, strerror(errno));
> +		xe_vm_destroy(fd, vm);
> +		return;
> +	}
> +
> +	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0,
> +			   overcommit_size, DRM_XE_VM_BIND_OP_MAP, 0,
> +			   NULL, 0, 0, 0, 0);
> +	igt_assert_f(ret == -ENOMEM || ret == -ENOSPC,
> +		     "Expected bind to fail with -ENOMEM/-ENOSPC, got %d\n", ret);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +static void test_vm_fault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> +					  uint64_t available_mem, uint64_t vram_size,
> +					  uint64_t overcommit_multiplier)
better use system_size as available_mem can refer both VRAM or System Mem.
> +{
> +	uint64_t overcommit_size;
> +	uint32_t vm;
> +	uint32_t bo;
> +	uint64_t *ptr;
> +	int create_ret;
> +
> +	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
> +
> +	/* Limit overcommit to available memory to avoid OOM killer */
> +	if (overcommit_size > available_mem) {
> +		igt_info("Limiting overcommit size from %llu MB to %llu MB (available)\n",
> +			 (unsigned long long)(overcommit_size >> 20),
> +			 (unsigned long long)(available_mem >> 20));
> +		overcommit_size = ALIGN(available_mem, 4096);
> +	}
> +
> +	igt_debug("Fault mode overcommit test: size=%llu MB, vram=%llu MB\n",
> +		  (unsigned long long)(overcommit_size >> 20),
> +		  (unsigned long long)(vram_size >> 20));
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	igt_assert(vm);
> +
> +	create_ret = __xe_bo_create(fd, 0, overcommit_size,
> +				    vram_memory(fd, eci->gt_id) | system_memory(fd),
> +				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				    NULL, &bo);
Same comment as above for non_fault_mode()
> +	if (create_ret) {
> +		xe_vm_destroy(fd, vm);
> +		igt_assert_f(create_ret != 0, "xe_bo_create failed with unexpected error %d\n",
> +			     create_ret);
> +		return;
> +	}
> +
> +	ptr = xe_bo_map(fd, bo, overcommit_size);
> +	igt_assert(ptr);
> +	/* Touch first page */
> +	memset(ptr, 0xAA, 4096);
> +
> +	/* Touch sparse pages to test fault handling - limit to avoid OOM */
> +	for (uint64_t off = 0; off < overcommit_size; off += 4096)
> +		((char *)ptr)[off] = 0xBB;
This will do system migration. GPU should be involved for execution. 
Through Batch buffer we can achieve whether overcommit size is 
accessible or not
> +
> +	igt_info("Fault mode overcommit test completed successfully\n");
> +
> +	munmap(ptr, overcommit_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   static void
>   test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>   	      int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
> @@ -665,7 +913,29 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>    * @beng-threads-large:		bind exec_queue threads large
>    *
>    */
> +/**
> + * SUBTEST: evict-vm-nonfault-overcommit
> + * Description: VM non-fault mode overcommit test - expects bind failure
> + * Test category: functionality test
> + * Feature: VM bind
> + */
>   
> +/**
> + * SUBTEST: evict-vm-fault-overcommit
> + * Description: VM fault mode overcommit test - touch pages to trigger faults
> + * Test category: functionality test
> + * Feature: VM bind, fault mode
> + */
> +/**
> + * SUBTEST: evict-%s
> + * Description: %arg[1] out-of-memory evict test - expects graceful failure
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @oom-graceful:       OOM graceful failure with small BOs
> + * @oom-graceful-large: OOM graceful failure with large BOs
> + */
>   /*
>    * Table driven test that attempts to cover all possible scenarios of eviction
>    * (small / large objects, compute mode vs non-compute VMs, external BO or BOs
> @@ -730,6 +1000,17 @@ int igt_main()
>   			MULTI_VM },
>   		{ NULL },
>   	};
> +	const struct section_oom {
> +		const char *name;
> +		int n_exec_queues;
> +		int mul;
> +		int div;
> +		unsigned int flags;
> +} sections_oom[] = {
> +	{ "oom-graceful", 1, 1, 128, BIND_EXEC_QUEUE },
> +	{ "oom-graceful-large", 1, 1, 16, BIND_EXEC_QUEUE },
> +	{ NULL },
> +};
>   	const struct section_threads {
>   		const char *name;
>   		int n_threads;
> @@ -836,6 +1117,14 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_subtest("evict-vm-nonfault-overcommit") {
> +		test_vm_nonfault_mode_overcommit(fd, hwe, system_size, vram_size, 2);
> +	}
> +
> +	igt_subtest("evict-vm-fault-overcommit") {
> +		test_vm_fault_mode_overcommit(fd, hwe, system_size, vram_size, 2);
> +	}
> +
>   	for (const struct section_cm *s = sections_cm; s->name; s++) {
>   		igt_subtest_f("evict-%s", s->name) {
>   			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
> @@ -862,6 +1151,27 @@ int igt_main()
>   				min(ws, s->n_execs), bo_size, s->flags);
>   		}
>   	}
> +	for (const struct section_oom *s = sections_oom; s->name; s++) {
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
> +			int n_execs = oom_working_set(vram_size, system_size, bo_size);
> +			int ret;
> +
> +			igt_debug("OOM test: n_execs %d, bo_size %" PRIu64 " MiB\n",
> +				  n_execs, bo_size >> 20);
> +
> +			ret = test_evict_oom(fd, hwe, s->n_exec_queues, n_execs,
> +					     system_size, bo_size, s->flags);
> +
> +			/* Accept success or graceful OOM errors */
> +			igt_assert(ret == 0 || ret == -ENOSPC || ret == -ENOMEM);
> +			if (ret != 0)
> +				igt_debug("Test passed: Got expected error %d (%s)\n",
> +					  ret, strerror(-ret));
ret !=0 means anything other than zero if returned it'll say test 
passed. What if driver returns -ENOENT, -EINVAL, -ENODATA or erros other 
than ENOSPC and ENOMEM? All the time it'll say Test passed
> +			else
> +				igt_debug("Test passed: All allocations and binds succeeded\n");
> +	}
> +}
>   
>   	igt_fixture()
>   		drm_close_driver(fd);
Let's wait for inputs from @Hellstrom, Thomas.
