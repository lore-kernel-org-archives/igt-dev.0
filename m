Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FE3CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 13:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B25A10E133;
	Fri, 22 Aug 2025 13:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuNcf0nG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C73410E133
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755870255; x=1787406255;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WNFHvHewVHspZLrEuc3L9fa+XeCfETYGrdDFWHbhaBY=;
 b=YuNcf0nGepns7NeN/DYStVApX5SMUkNnK8No4Npg/L6SDvIB0zsSSyKm
 4XmF1OLiJmiWl79klU+h61Nc8bSjHFRmh/h1EL8bP9rF9gmee0c0PSfPi
 /uNXkbIEqvz2rcL+Hu/amqsgfZFareFfFnbdFj0TaSJDEo1cMCYZQH8qx
 5jxxMochbHA8yzWLZrUbXHjb/m3SAd0Is5BnDm1+JpcMluq802gJo4BNp
 /r24gA+vMZEr5ziZENFjI2cIZcJM8RyBWbgUQLcFsZfd1Ye8UIrSoQfVB
 22LQ8YCKh/0UYSYTHdpf9E6s44zyjIBNVrhQL2y8JOX3nmGAEdFf4TPpG Q==;
X-CSE-ConnectionGUID: QkLEfL9JTi+aIcfKiuhRjg==
X-CSE-MsgGUID: WSPkqCULR5m4B6HgSrLeQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58127504"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58127504"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:44:14 -0700
X-CSE-ConnectionGUID: hOFKsagBQve2wHSBwtyJjw==
X-CSE-MsgGUID: EVjRG4GISFusaXLSSHQXKQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:44:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 06:44:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 06:44:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 06:44:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjJ/4NJgtrKSlaeXXptfw8uOiRuOlZF2D5a7J+MG2saHLbalAtXttlsC0Je4OMJK5Sv75IK+t04r4w6z1EYKTTy5XA7+jFHslS4eIiaHN8ThXmsybPhdA01I/5WI5iihlrSjYt2HQw5ygtr2PMuzYEfpiS10eZnHhyIer9aGb2yiCOLQSL3fRLUbFMqXQKX616br2zC11SCfhe/FPxgKi5ALYgCP201ys/tjJHAqu2LZPLcwbq1GWK5rQKwd2U4WHWFG6ov2zghraRJNJszjiuyCRlEQfHA013b1Gk7XVbLLPmmJPJbLHV0Cng1vw/4c8KN6xmXEgK8DvTP/E9KS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7erg8C46qJujNmPLvpPqPRVfaO2Qr7UXT1/B8Q6ltDc=;
 b=q960zOabP7vM9cB/ZaesCsMIBa+wrMzzF2MbJ1+Vtb3yQarzx0MXGH0Dskil5aR1CODc0wQEu5nI7fvK98lrpag1+oq90Ed+h8ZgZDYbBOfSLUpDAj9WREQSNSI55B0XTT8ByUqjjccQPM3T1rJxPYa9fw6pzu2Cr4WROp8k19I9Ze0hm0wrIDN2+9PO2VNl4fBg4eVtP8XaCkqwVpk8UMxQvol37n9sUttnKXKJ5VQcM423fCsA30swaqf8tFmu4a+a/PYeMESw8SLnQW7CWLJ+F+ytof+BicT0JRgVw9Mnpg8iuec0Na5EDFhwtgpMl7/5tKuqOfHYjy4iMtRzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH3PPF10E309DEE.namprd11.prod.outlook.com (2603:10b6:518:1::d08)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 13:44:10 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 13:44:10 +0000
Message-ID: <f77e940f-83fb-45a2-813b-8cbf565590ba@intel.com>
Date: Fri, 22 Aug 2025 15:44:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/3] tests/intel/xe_sriov_scheduling: Compute
 throughput from completion timestamps
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
 <20250819165045.467613-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250819165045.467613-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0087.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::16) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH3PPF10E309DEE:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc00167-ca53-4bc9-76db-08dde181f933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qjd3d25pdzZZVGIrOVdwa0tvaFpGdmRjR1R4NVZxdVJiTzQ2MFBaNEdvRExJ?=
 =?utf-8?B?Q21oOFk1bmNHeDZQYmtLUXgzdE1SaFNQSmJzbUNDcEhRR2hmQlJobTdJNEJ1?=
 =?utf-8?B?NXJEalhNdnlTdVVxQk4wWmViUTVuc094YVhGSnQ5RExEMng5UEUxSmZGdi9E?=
 =?utf-8?B?WkpHc3BvQTFlNWpudzdoYmVORk9CbVBDTDlyY0R1TW9YS0JyU0hEUkZ4Vm1C?=
 =?utf-8?B?ZHgwMHZTZUNNdzN5bDBlQXBTS00wREg5b1BxM2owOXhGb1N6OWlNbWtkcHkr?=
 =?utf-8?B?Rm1jcGhqYm04Tk9nYTlhSjVNTTVMcnh5WUl3d2drQmRRMGtocnNLZG9aZnlv?=
 =?utf-8?B?WUFkcjhxK2VLUG5hYUJGdnkwWWthNkZwSFg5VzJNdFJBV0dtdGRESFZEYlY0?=
 =?utf-8?B?dFllWnZDeENhYjhpVjNPbVVySXdxSTlDN2Fmd3RDQ3JGLzExVVYzK3VJdHdz?=
 =?utf-8?B?VlNyZGtEK1R2VTdwOUg3Yk9KU2lPcnVJQi9DU01jMnVJV0JCcWZQWkZxb2ZX?=
 =?utf-8?B?TktyUDNoLytEemVjNUhPWnhlVU5GanBpbGhmNTYrSUZONFNFUVBrWlpZM200?=
 =?utf-8?B?UFRtLzBCV2pEZmdJc2t3TEx0ZXd5bUkwWTZwWk44NU5kUlZWZDk4ZnhTQ0lq?=
 =?utf-8?B?aUJGVi90aHlPZUNNZ0dIRVR4a1N6dlJJMzFaNVQrRGpBMVE1cTFxRzlML0hW?=
 =?utf-8?B?bzdPejVQYm90V0xCbHBudWlmZWJrU3dGbTlsSTNIbVJUY2tZNy9ITTFpNkNu?=
 =?utf-8?B?T1NvcEFKeW5JMnVGajlXZ0kzSDNpbWsvTXFaWGR6bTlGVWo1aS9ZM095TjNa?=
 =?utf-8?B?djFLSjQxejdvNS96TUFVcjNDWHpadnVuemp4cWJLbnYrYy95ZFBvSUZsSTBj?=
 =?utf-8?B?bDRGYzkzS1FOdmZkVWd5aHVSQ1FvWHFlN24yWGxwL1ZhdW9JQUZBSENucjlJ?=
 =?utf-8?B?T1hWTTNNTVB4WHRsaXFhWDBsMEdkMFJza2RCcnA5QTdEWEpxZTNoeGhQMUtj?=
 =?utf-8?B?M3hvV3FWZENQMTIyV2p4K3BTWXAyTG9BVmkwRFNuL0xJdWo0WXVrNEhhcFFt?=
 =?utf-8?B?UGxjeHhld2xuam81aCtBa1JDQS9mNGkrUHpoVUNWcXUrT2pGSVg5cnZ0czB1?=
 =?utf-8?B?V1lISjNjeGJEOUk0azdpclZMdzdNcHNrU1lOVlkyYjR1R2RuSHFWSzlJNTc1?=
 =?utf-8?B?OU5tNGJNaWZvd1NFUGlEK1c2d3U3U1Z3NmZ5Yy9GN21CREZzdjVsWnhHdnBa?=
 =?utf-8?B?MDFIQlRJNTYwdDQrS1ZZeVdPVFJ0Z09TMEtOMWhIdnRwKytUZ1NUZkNBT3Nx?=
 =?utf-8?B?K2MvNHRGRERGMkFuaUNxckNmWjJ6OGJOOVkvMjBVWk5RL0tmMEZZSzVYaEpW?=
 =?utf-8?B?N1B1a05CRDR6SGVxbnpQYWt6OS85S0UzUGVDR1c4amFmbnBxb3dySlg3TWJL?=
 =?utf-8?B?a2s3NndZRjZkektvRGtWZE5GUUFMaFJ0c01QQkRJNjM5VWZiZFV0Rk5LV0Qz?=
 =?utf-8?B?OHhVQnRwODluMnJ0TFFGSUM2OGozQmRhK0YzQjUvYWFFMGh2V1JBS04yWEpE?=
 =?utf-8?B?VW53dHQ5bi9ncC92VGlZMFhoYjg2U2lrVXJscHpMVnJTRktscDE2NFkwbHdN?=
 =?utf-8?B?bkQvb0Q1ZC9QMVpBRHVTVExkOGdPS0NmVXZhdFBVVi9kM05jY2VQaEYyOWU0?=
 =?utf-8?B?K29RR0I2NnBpcmdiUjVKSDI5QXRuYVJEMGQrU2NCcSsrRC9JRXBNWW9Md3Ns?=
 =?utf-8?B?NzN0aW0yWVNXT0V2OFdLSVhsKzRmWVFqMDdNb1RUWjMwTzhTQkhyRkhWR2RM?=
 =?utf-8?B?MXNRa3NqVEZFc21NaHp3QW5QdmNHelRKU2szUHFSR3JIeTFMSHZUeTRad3o1?=
 =?utf-8?B?bXFicDJiWEt3MUREQTVhVXlMWU8wK2hENFNEVHVEcjNYazhRWTdYT2xVUXBR?=
 =?utf-8?Q?Qhw4BX1LEm8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBPZ1RnNVpVUVVGWEFCOTJRVzFUUkpaTFRaYWFjNkcyalFpK2x4VzdtNnpr?=
 =?utf-8?B?dWtHckJxcnNUWmFsa3c0QTJqZ3cvY2U4cDZsU2tqRkZYamR2TkQ5bDkrTzdF?=
 =?utf-8?B?bnhaa2g3cC9USWRoQWhnS1JYNEZGTUhDeEgyaHBZNm9kYkx0U0J4OXNSRXNl?=
 =?utf-8?B?aEJPRGp1aHltRFlhaHJ1ekxUMnRzZ2tNc0xhRmxvVmZhaW13cFVQNWJpRzlZ?=
 =?utf-8?B?SEZQNXVQbm5SM3UwVTJ5NGVKUG1mNE5jMHR2UWhranR2SjVDdkU1OTBndUxG?=
 =?utf-8?B?VnhKQlpOYk1TSXoweElVek0yMUh1eFViQnlSUFdManBZQ3dHUFd1TlY2RzJF?=
 =?utf-8?B?Q3NmWDBYVjVZZ0ZiVDJHNTM5VE5uYWZnblM5U0xpaStPaGdlbG1SSGtpbGtl?=
 =?utf-8?B?QncrWXVsMG5NU3FRMGlDZTc3QjdGeitFZERrUFZNRnlwdFp4RzVtQ2d2VVUy?=
 =?utf-8?B?S01WQTJWV0pOODRDejhReEJYWENBRW15R2tVVkVXOW11T29EOUo1ako1TUp4?=
 =?utf-8?B?YVlacGdCM3grL09KRHdCSFlXSzg2NlJZdHRnK3ltdDcvZlczZWRPV00wZkw4?=
 =?utf-8?B?VDdsY2dkNnViUXlHbkZoNDUvaGoxTUtIdlNCcHNwM1FydXU0SWNtckloNWwv?=
 =?utf-8?B?ZnJRNGRWV0c0K2Q2VGtvaGNjRXJHZVp6S01TV21RUE5hd2dhRlNTQWhvdXpM?=
 =?utf-8?B?L09aMUFyVTRSRCtqV0NQd3JmanRqODEvZkowL3Q2U2J6enV0ZlpENXlBR2tu?=
 =?utf-8?B?R0x1TnhGeGF2WThqQjM5YlNqbFVwRWdSZTk2dkx6UDFFNDBhMFZpTmJLcmdJ?=
 =?utf-8?B?M2tvQkJ4V1hUYWZlek5CaFdFZ1hwZFNadS8yRjFaQ2tESFhSZmJjM3lBZCtB?=
 =?utf-8?B?Z2s4RVYwaHp1TW9ZS0RudzBnWGNpSVk3R2p2RERBOS9waU5yS2lJbXQvV2ps?=
 =?utf-8?B?RTBzUWxoeEVmY1BuenB4MGxHUVNndHRSQTNSbkdCQnNtenZvQ3RkaHI1UmRk?=
 =?utf-8?B?cnVTeVJVdlJDSTQ0M3d3K29ZVGhSRzdCSXFKdjJSQ1pqeXlucU9meHpWVWI0?=
 =?utf-8?B?Rk9ENzdqbW9IK3JZQWY5TDFpK0U1Vi9jRDZzQ1I2ZVRQcytkcFM1VFFra0kw?=
 =?utf-8?B?T1R3UktKeTdWUWFMOFZJajFhUHNSSnhEcXpGd1crS1lod29jbTEyL3IvcXl2?=
 =?utf-8?B?TVRTQkV0cEwxMWFxTVFZeHl3QVdWczErZmhSNEN5M3NEY29ZdElSQjhsZ2Jo?=
 =?utf-8?B?cUFWSkJ5eDNRaE5jb2g2OXdYN0VsOTVPOEMxVnJlOEJaeFJxUndzeUh4Smlz?=
 =?utf-8?B?Z2FSSXBrNEJGN0hrS0l3UTNRSCtLMW1zdDczaE5jVDhLM1Mxa29VRysweXJk?=
 =?utf-8?B?NUJXY2puWElCMTZmWlhzbU1IeWI4Y2dvTnFtaWpXOEltWkxSb3M0UFVCTGRL?=
 =?utf-8?B?TmxSaGI1UU52eUh0SStBNFBoYzJZSXZpQ1VBN1dVeWIvWW5Hb2MwaWhINjBu?=
 =?utf-8?B?WHlodDBJTEhocmUxQ0tzRjN6UjQwVVVmcXd4MDdnOUJwTCt1aFBKV2t4MTJi?=
 =?utf-8?B?Y3RPcFRTNVZCcEFKcVNMN3hXdlk4cEhGNEJOWURRQWlMMFpIa3hhNmxoT0sv?=
 =?utf-8?B?clBubi85YXVDVTYyWkVxK0IwSFhVWnMxTHdlSmcrNHBuQnpDNmR6ZDk3TzRz?=
 =?utf-8?B?bEhnRUlCNjRGMThOTm40bDlhR2kwWmNLamNvVmRTZHFtYkh2TUZ1ditRQVE5?=
 =?utf-8?B?QzFPQ3RiRWdvQy9ORVlSa1YvWlN1aitLaHNPcWhXTjNsVzdTSS9ZYUNKeTY0?=
 =?utf-8?B?UFliNnAvZFNBTUR6c3dxWGxrMGxmZWRPM05OazdHd2xYNUJCTEcvYWlkZ0JP?=
 =?utf-8?B?dG1JRkdBSlhxb05vWUZBUVNXT0VpUGZWMCsrNUdiQXp6UWljZmZuRStWc1U5?=
 =?utf-8?B?Ymo1enlUTmRiZm5OMmtyc3U2RmNnaXZnTHRHRGdBRVNydlo0dzdBUTd2VE1x?=
 =?utf-8?B?bml2U0Ewc0RWS24rZFA3N21Wei9ockhQN2ppdmtmNG85VVcrKzdnZkpMcXBo?=
 =?utf-8?B?ZkYreWhlcmdFM3JuYjhMbnprOERtVGs4djdmeTZlbThwUTFVZWxuYlhRdEVn?=
 =?utf-8?B?YTRDdEM2MVExM2ZSYlhLYTEwWWJhcXR2M285SjVQWE0zbk5SSXd4YkVFVmFs?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc00167-ca53-4bc9-76db-08dde181f933
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 13:44:10.6460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hog2p+BeBsJ5MV33Kyny9xBiehgsRM9Ni+QfkgywIqFKaBaqpvvNSNaP87e0aPNTm3r+rozdwHeIMDoBEYz6Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
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


On 8/19/2025 18:50, Marcin Bernatowicz wrote:
> Make throughput comparisons robust under overlap/prefill and CPU jitter
> by basing the window on actual completion times rather than thread timing.
>
> - Record per-sample complete_ts[] and per-slot submit_ts[].
> - Build the common window from completions: [max(first), min(last)].
> - Compute throughput as count/window within that window.
> - Push durations as submit->completion (complete_ts − submit_ts) and
> print "mean submit->signal latency".
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 65 ++++++++++++++++++-------------
>   1 file changed, 37 insertions(+), 28 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 28a2b6e26..97263cbd2 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -39,6 +39,7 @@ struct subm_stats {
>   	igt_stats_t samples;
>   	uint64_t start_timestamp;
>   	uint64_t end_timestamp;
> +	uint64_t *complete_ts; /* absolute completion timestamps (ns) */
>   	unsigned int num_early_finish;
>   	unsigned int concurrent_execs;
>   	double concurrent_rate;
> @@ -54,13 +55,14 @@ struct subm {
>   	uint32_t vm;
>   	struct drm_xe_engine_class_instance hwe;
>   	uint32_t exec_queue_id;
> -	/* K slots (K BOs / addresses / mapped spinners / done fences) */
> +	/* K slots (K BOs / addresses / mapped spinners / done fences / submit timestamps) */
>   	unsigned int slots;
>   	uint64_t *addr;
>   	uint32_t *bo;
>   	size_t bo_size;
>   	struct xe_spin **spin;
>   	uint32_t *done_fence;
> +	uint64_t *submit_ts;
>   	struct drm_xe_sync sync[1];
>   	struct drm_xe_exec exec;
>   };
> @@ -101,8 +103,9 @@ static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
>   	s->bo = calloc(s->slots, sizeof(*s->bo));
>   	s->spin = calloc(s->slots, sizeof(*s->spin));
>   	s->done_fence = calloc(s->slots, sizeof(*s->done_fence));
> +	s->submit_ts = calloc(s->slots, sizeof(*s->submit_ts));
>   
> -	igt_assert(s->addr && s->bo && s->spin && s->done_fence);
> +	igt_assert(s->addr && s->bo && s->spin && s->done_fence && s->submit_ts);
>   
>   	base = addr ? addr : 0x1a0000;
>   	stride = ALIGN(s->bo_size, 0x10000);
> @@ -137,6 +140,7 @@ static void subm_fini(struct subm *s)
>   	free(s->bo);
>   	free(s->spin);
>   	free(s->done_fence);
> +	free(s->submit_ts);
>   }
>   
>   static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
> @@ -158,6 +162,7 @@ static void subm_wait_slot(struct subm *s, unsigned int slot, uint64_t abs_timeo
>   
>   static void subm_exec_slot(struct subm *s, unsigned int slot)
>   {
> +	struct timespec tv;
>   	int nsync = 0;
>   
>   	syncobj_reset(s->fd, &s->done_fence[slot], 1);
> @@ -169,6 +174,8 @@ static void subm_exec_slot(struct subm *s, unsigned int slot)
>   	s->exec.num_syncs = nsync;
>   	s->exec.syncs = to_user_pointer(&s->sync[0]);
>   	s->exec.address = s->addr[slot];
> +	igt_gettime(&tv);
> +	s->submit_ts[slot] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC + (uint64_t)tv.tv_nsec;
>   	xe_exec(s->fd, &s->exec);
>   }
>   
> @@ -214,9 +221,11 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   	for (i = 0; i < s->work.repeats; ++i) {
>   		unsigned int slot = i % inflight;
>   
> -		igt_gettime(&tv);
>   		subm_wait_slot(s, slot, INT64_MAX);
> -		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
> +		igt_gettime(&tv);
> +		stats->complete_ts[i] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC +
> +					(uint64_t)tv.tv_nsec;
> +		igt_stats_push(&stats->samples, stats->complete_ts[i] - s->submit_ts[slot]);
>   
>   		if (!subm_is_work_complete(s, slot)) {
>   			stats->num_early_finish++;
> @@ -386,16 +395,22 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   	struct subm_stats *stats;
>   	uint64_t common_start = 0;
>   	uint64_t common_end = UINT64_MAX;
> +	uint64_t first_ts, last_ts;
>   
> -	/* Find the common time frame */
> +	/* Find common window from completion timestamps */
>   	for (i = 0; i < ndata; i++) {
>   		stats = &data[i].stats;
>   
> -		if (stats->start_timestamp > common_start)
> -			common_start = stats->start_timestamp;
> +		if (!stats->samples.n_values)
> +			continue;
> +
> +		first_ts = stats->complete_ts[0];
> +		last_ts = stats->complete_ts[stats->samples.n_values - 1];
>   
> -		if (stats->end_timestamp < common_end)
> -			common_end = stats->end_timestamp;
> +		if (first_ts > common_start)
> +			common_start = first_ts;
> +		if (last_ts < common_end)
> +			common_end = last_ts;
>   	}
>   
>   	igt_info("common time frame: [%" PRIu64 ";%" PRIu64 "] %.2fms\n",
> @@ -406,8 +421,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   
>   	/* Compute concurrent_rate for each sample set within the common time frame */
>   	for (i = 0; i < ndata; i++) {
> -		uint64_t total_samples_duration = 0;
> -		uint64_t samples_duration_in_common_frame = 0;
> +		const double window_s = (common_end - common_start) * 1e-9;
>   
>   		stats = &data[i].stats;
>   		stats->concurrent_execs = 0;
> @@ -415,29 +429,20 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   		stats->concurrent_mean = 0.0;
>   
>   		for (j = 0; j < stats->samples.n_values; j++) {
> -			uint64_t sample_start = stats->start_timestamp + total_samples_duration;
> -			uint64_t sample_end = sample_start + stats->samples.values_u64[j];
> +			uint64_t cts = stats->complete_ts[j];
>   
> -			if (sample_start >= common_start &&
> -			    sample_end <= common_end) {
> +			if (cts >= common_start && cts <= common_end) {
>   				stats->concurrent_execs++;
> -				samples_duration_in_common_frame +=
> -					stats->samples.values_u64[j];
> +				stats->concurrent_mean += stats->samples.values_u64[j];
>   			}
> -
> -			total_samples_duration += stats->samples.values_u64[j];
>   		}
>   
> -		stats->concurrent_rate = samples_duration_in_common_frame ?
> -				     (double)stats->concurrent_execs /
> -					     (samples_duration_in_common_frame *
> -					      1e-9) :
> -				     0.0;
> +		stats->concurrent_rate = (window_s > 0.0) ?
> +					 ((double)stats->concurrent_execs / window_s) : 0.0;
>   		stats->concurrent_mean = stats->concurrent_execs ?
> -				      (double)samples_duration_in_common_frame /
> -					      stats->concurrent_execs :
> -				      0.0;
> -		igt_info("[%s] Throughput = %.4f execs/s mean duration=%.4fms nsamples=%d\n",
> +					 (double)stats->concurrent_mean /
> +					 stats->concurrent_execs : 0.0;
> +		igt_info("[%s] Throughput = %.4f execs/s mean submit->signal latency=%.4fms nsamples=%d\n",
>   			 data[i].subm.id, stats->concurrent_rate, stats->concurrent_mean * 1e-6,
>   			 stats->concurrent_execs);
>   	}
> @@ -667,6 +672,8 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   					.repeats = job_sched_params.num_repeats });
>   		igt_stats_init_with_size(&set->data[n].stats.samples,
>   					 set->data[n].subm.work.repeats);
> +		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
> +							sizeof(uint64_t));

missing free() in subm_set_free_data ?

>   		if (set->sync_method == SYNC_BARRIER)
>   			set->data[n].barrier = &set->barrier;
>   	}
> @@ -762,6 +769,8 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   					.repeats = MIN_NUM_REPEATS });
>   		igt_stats_init_with_size(&set->data[n].stats.samples,
>   					 set->data[n].subm.work.repeats);
> +		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
> +							sizeof(uint64_t));
>   		if (set->sync_method == SYNC_BARRIER)
>   			set->data[n].barrier = &set->barrier;
>   	}
