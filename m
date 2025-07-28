Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6947C87FC9
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 13:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E5E10E4FE;
	Mon, 28 Jul 2025 13:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZI7p07U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674EC10E4FE
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753707947; x=1785243947;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=OBJHeFS5jyR8pUo779PmCW2XdEsXG+Yf1oWFUJwvjp0=;
 b=SZI7p07U/mN6lC0iOcIvBdoFy0QbIRkeU6WPYGQzUhiLin1usbBII7bs
 4icuWQLkYCTSf9pv4uhj65mlpC8cEjZiSGVInvYINLiNBjTqtLfQUqX1e
 NoZlhSUw/ceuwFN9u1EFzEnUgTH7tU6HVt/vxp0SHBIsQGlfvZyrriB5d
 Zc2LeqOipeT0uWk1yjNh4tsMs8Nqqlhz/EMFRjiEqjN8SIny0yMdgR1p5
 +RTjkM9bkEUopN/kPIstBrzfDLb1Ki3qNsMLL9DpfBCFcxrEOT1jhNSUv
 /VDvwVhYLhep2qo9pR2/WE3BgB2gI3mqicfS5XypjvRryCLGZL+/kwWHP A==;
X-CSE-ConnectionGUID: l6VGnD2VS6io6riA1YDAsQ==
X-CSE-MsgGUID: ZdrvK2ofR4GH05W1jGJhpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56033503"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208,217";a="56033503"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 06:05:32 -0700
X-CSE-ConnectionGUID: FP2LwXPoSeS2so7W6p6H1A==
X-CSE-MsgGUID: QYatpZV8RBq1yc6CQBn+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
 d="scan'208,217";a="162874156"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 06:05:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 06:05:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 06:05:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 06:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gt0vPX272L7Dn5GARK75dV1kinPsQ6YofiFLDK24y2iLnTEgpwEJNL5XRYVaGMsraSUv4aO4Lz1Pzu9guE75a8P680Z5eFBzghuZBvjzhzsYFTDao7XtPeradGmSoB1xiOCLIi+CCgyCOW2wGyeds0Sjbo2Wwod/rmVZUnSRiW1ZVGjUZKSlY8IoVtzNtm6XWVp9FAV8s4b6cuu4eUVCI9E3VZmFiKmujlbOXwwJz8nRcl1z6wD6F70D0Vl2ISOZH0hSPCw5tvCJLiGTw1DkVtnf1c2477rXqiX5nAbwf/W77eDW+SSq27UgjTuSKK3KfshRoSBijGhskHHbyscWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zd4C3dU0H1xuPBLQr7djAlSdHzhWQotUMDOR7TG2YNM=;
 b=SYq/qP+wu8PEyFFGTUfUFDmWXUfhmWh3kJA+YZd+EobSrvrGPBEO2xbHjYddnY7ENIoKndOyY3HNIc9vQTKM2wIGStGCRBHYaBejglYO8Me5/doP+rdOZMUcClujRq6RjfbVFPvdHg8+2hOITBUBBTut3WU95sRGS1fw0l/TH8r15QPVv7GqY5BvaKP4m0Fj17ce3zICGxPhlc+5QPV+L6W+WhUuf+MO3ZIApCsMeK3vHnPXqxHloTADIhMT8nGa5xPoP7aGhVpbRFDAhMFFiOcs3Iq+yRcr4PO9B1Z7dqwMqMZbZPCowMPu8MXdCWyVpn9Xu1D4RafZxwk8TV2vZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Mon, 28 Jul
 2025 13:04:37 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 13:04:37 +0000
Content-Type: multipart/alternative;
 boundary="------------J9DT0fNHU0uz0MsUiyYRBQoX"
Message-ID: <98f03e96-d5ae-4193-a76c-e8dc2d2877da@intel.com>
Date: Mon, 28 Jul 2025 18:34:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3] tests/intel/xe_pm: Introduce i2c subtests
To: Raag Jadav <raag.jadav@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>, 
 <heikki.krogerus@linux.intel.com>, <lucas.demarchi@intel.com>
References: <20250723121614.159621-1-raag.jadav@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250723121614.159621-1-raag.jadav@intel.com>
X-ClientProxiedBy: MA5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c5ce6d-8a35-4a8d-23e5-08ddcdd74e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R21HS2ZVdlZWMDF2ZVZ4NWo0MnJCdmlSM213NkFjYUhjcitvY2Q5MVFPMjgw?=
 =?utf-8?B?NHpOVXRWVnEvbWNLWHoxSUxiS1ZQV1lIK3U3OG5YRVNrWFFJTWJrMU4rRWJy?=
 =?utf-8?B?WHRHSlpFSk1UZnAybzJ0dGpvVlJUQXArTFlYTWtENFBJcVhWdnpkU1VGSCti?=
 =?utf-8?B?b0pTT29PRU5yNW5UUExheU41M2ttR1MrNzA0dTVsUkN6RHpUSzdPcy9JK1FO?=
 =?utf-8?B?Z0dLS1ZSbU5oUE9vQ1F1Y0FJZHJyVUVnbFdZNTJBb0xJVE9lRkJUWlJUTitR?=
 =?utf-8?B?L3J2RXNZSnVuSEFpVlpZNEJBcE93RGNoaGIzdTd5STlWbGtuZnZXdnN1OTN0?=
 =?utf-8?B?Zll3ck95enE0YS9hdWcxMkVqOTBzdGQ3WXloUVltQXN5MHBBdndsUUJ5dXZu?=
 =?utf-8?B?QUlRSkhmMXpWaVlqaHlsY0UwNGlaR0ZjcWFlY0h4R0tTdnJTVEFoY0ZROWM1?=
 =?utf-8?B?aXVVRXNPNWtpSmEzd0dnWDcyb2VUMzR4NnEvQndKRC83M0E1MjFqUTBabWxK?=
 =?utf-8?B?dzJ6N1dheWJLR1J6TktsdERZdk9WK3g2T2NxTldmN0JTazRtd2l3ME55SlRw?=
 =?utf-8?B?eklwTkV6Y2kwakxkT3NRL3VsU0p6K1o3TWMvdVNNUEFOL3krTjU1TWk3dW12?=
 =?utf-8?B?ejhuV3h4bTczbnFHdlNXUVdHc0VQSFl5STl0SDRLT0NsSVB3Vm9Ub3pOQ1l5?=
 =?utf-8?B?OXB2ZERSK2xtWHlpamsrNkRiS1Z0U0lVTVVCdVJENlZJakpQbEU1c1FUb0Nh?=
 =?utf-8?B?ZS9ON3pVb2hoblRTa3hnV2tRY2dCQzlnUnROWjQ1OTkwdUYzOHBPRWtuQ1Mr?=
 =?utf-8?B?QzZoTllsOGNyTGxPcWl6RnorTVBMSkJWVnN5NnVzL3BBSGZaaklxL1FEazJM?=
 =?utf-8?B?czd6dnJQRElmbzRxd1p1NWJYYzgzWldVeDFobS8yYldJa0dtRTcyaHNYczlh?=
 =?utf-8?B?S2ZnZk5vQVp1VE8vL3NqWHNsNGpGbXk0bkxzL0tXdFBoZ1ZLQkRMWStydllH?=
 =?utf-8?B?TkdjSS9tck5ZNGc2Z0FQVzRoNzV6aGNKK2twZzdVd2duS0o2ajYvVGtIVlJV?=
 =?utf-8?B?MnlnamcvbzYvVEVBYkRNM2JuWnZzTmV4eENLTkVLOWJ2VzRMR3kyNHRlT2M0?=
 =?utf-8?B?M3NSNXhnajdkVDNVS2lFRjJZUHlhUktBZ04yYVpPcWFENDNEYmUzQ0xOWVFI?=
 =?utf-8?B?bzg1ZUlOUnVaSWVGTjZPWmFQWUNzcWRORElJT0E4RlpTaTNtejFUd0duYzNL?=
 =?utf-8?B?NW5DZUJNcmRZU2hlTDF0a2dqT2tITkFOazB1cDhEZHNhelV6c2RmOFJrVmpK?=
 =?utf-8?B?dzhmMkRjQy8vb09CTFQrVkZyUTdZM2JvdjZBdTNoYnQrcEd0elJsNXlZdHZ5?=
 =?utf-8?B?RW5pZTVHY0U5Z1NxWk1RMkRZc3F4c3dUS2tWUFQvc1prUUI5QmdqZWFldnJF?=
 =?utf-8?B?MGlxWHhGQjJUN3JocWJXclg4MEpYcVJZVnFZNFppanVhQW1BMjljdjZqdFM4?=
 =?utf-8?B?allRelg0T1J3MDVhWEFiTXBKMTFBbUlrTTF5a3A2clhCT21QTXZibXNQcSsy?=
 =?utf-8?B?bnd1Sk9ZU0hBQ1RuYno5ZzN5ZzkweGFIaUEzQUJMcmdOM1crU0VITnJ2V2pU?=
 =?utf-8?B?ck1CK1hWNnN1cFZvcmdjTGN5ajRZYzZ3Qm0rNC83LzNETWN1UnhxZFRjWDY4?=
 =?utf-8?B?blcxYXhRcUxjREdYbExvZjVZZ0hBZE91SG5jSEVmS1JSTnV5dFhuYTM2MkhC?=
 =?utf-8?B?a2hKaU95Tk1tdHdVc3B1THRtM3hzUER4RWp4bldIN1VBNEUwN2h3akYxNlFt?=
 =?utf-8?B?bnAxS29OeTF2UnV3RXh2N2FDemNHdXE4bWJYejRSdmlVN291MGFNV0dlaE9Q?=
 =?utf-8?B?bStxeGxuMXFLN1d0L3RNc3Z5bTd5VmtCUFg4ZDl6b0tGa2xRY3Fra3BBRWJv?=
 =?utf-8?Q?3mH6/XBWX+E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDdrSElHRUlIRjU0elU1UGNIYzV3Y3hOamIxaFBpMlBEd08xSUNIK2tLYVlW?=
 =?utf-8?B?cG1GK0lZYzRXQmlVYTdXcGQxVkdESDUxSjZMMTQ0RUR2Kzl2b2svWGJLYmRM?=
 =?utf-8?B?RGdOT0g4WFpRaS8rVGpjb3pDdkFiSnFhVEx2Um9EeFlzQXlSeTJjMmk4eE5l?=
 =?utf-8?B?R2M2N3BTdXk3bzdaNnpWd1hQV0lZSnR6OG40dVBHenFzTVFCNjR1eUpSSTlI?=
 =?utf-8?B?dERyNitBSHowaS9pVTRpajZHaEo3cENBNk5RV0gvQTJtY1NHTlZKdFEycXd0?=
 =?utf-8?B?cUhxdUorR1ZWVkNzZjhxb3RFa2JMZlJKNEJSOEs4UXpkejNwN0FpdEtMbW13?=
 =?utf-8?B?b2xFTUxqNUozaWxwQ3Y1V2ZwR1BMQ1J4RUxFVkVFa2xwejVWRThuMllPVHdD?=
 =?utf-8?B?a2wxcWFoRm8wejVvZU0va1lkU3REblRSc29YRnpyR1FtY3IwcHZoamdoUFU0?=
 =?utf-8?B?MlArdnZYbWx2c3JiZnE3UmtabWN0V3l2amJzYWRJSk4rZDZCY3N2Ulhxa3NV?=
 =?utf-8?B?dGg2NmtHME5YWUhLWDNobFVqa3dHWEZiOVowN2UzbVVUWXZBREZOeXEyV1dh?=
 =?utf-8?B?YVh4RjJYSHdLeTlBVVYyWHpmZlpYUjNVK2cxMTBRQTIydFBRTUZVTTRYRFdM?=
 =?utf-8?B?Wi9TOTl2ZkNRSXBGQldreDZmVVBNaG5UTDZ6aGc3WjRESUlwYWtSNHI4cVlm?=
 =?utf-8?B?WkVvVG1tS3hyTzA2R0p2K1h5QUlLZERmdndpcWlEZmYreXErOG1sWE01QmNS?=
 =?utf-8?B?SS9XbURoajc0VlowRWJUSzVIYytUN0Y4eEJiOWJ3UDJVTUVPV0Q0RG4reWNk?=
 =?utf-8?B?Y2FoWjFZdXZGbmEwbGlHVllZWHI1UE5IWnBORUxESmJCejdhQUFBZWtQcmhs?=
 =?utf-8?B?ZVo4Rkl2aHpHbmo1Q2g4d1BNU0dUZW85NmJWclZiZktxWFFiQm4wNUptc2JR?=
 =?utf-8?B?alFGaE5WaHdjR2JicytIZ216U3ZFWkl6QS9xV3c2Ull4ZWF4RFl1eHNPN3Nm?=
 =?utf-8?B?aHRaZkFXU2xIMU5lRmg4dnp1TzBRaklYL1hwaTFOazJhMDZrMTFJZzBvM2Zk?=
 =?utf-8?B?dmo3RkhSVkluMDVBWWk2R1N5WGtVUXVqWnZTV0Y1Nko4ZWtQRHVmVTN4SFVH?=
 =?utf-8?B?TE9DYmVOTFZia0U4UUlCMWIzaldqUnQzdjdWekxQYVl6QkF5WWUyaW4yU0h5?=
 =?utf-8?B?MkZXZGRQcmh4bFErK2xpNEh0eFF1b2RaZmJrcCs1NUQ4dW9EQ1FqeHVzT0tQ?=
 =?utf-8?B?aGRsVmhqSmQrS1kyYWdxUWd3MjVaZFlBY0xOSGg4bE0rczJiQWVwNklISHVJ?=
 =?utf-8?B?ZGUzZ1UyZmZTblFxRndtMkNqVzJnVnl1Ym1raTlvTXUzdmordHVKMnhuWC91?=
 =?utf-8?B?Q3BzMW91cWFkdjY5LzZsY1RvcUd4VXhjUW1BcmhaZEs5YWRpcm1ZS3hXcjBY?=
 =?utf-8?B?RlRjU3lSUnBwWVRGT1BLeEJCN2MwVGlyc1NkRlY1K05kQnVCaVV4b2VzNzVC?=
 =?utf-8?B?QVVXQnd4WXNJU24xQzErUnhyVE54QTBUZUZXdVBpeXNHQVRpRkNCdE9NRndt?=
 =?utf-8?B?dksva2x1UHdwVEFuWFV5SHhSZWpBL3pvMjg0K2tOQldBNEhoYXQzTFg5bUpL?=
 =?utf-8?B?T2YvYXRldUFJSTd2bU5EY2ZCZ3VQc2lEZDVzTXdDV3lIMDF3Q2hNNkFBZm5R?=
 =?utf-8?B?QS9EU21oUmErbHNxZW44S0FwNHZWNDRQWlZSWkxrU2NQZEVtN2ppN1JGSGZI?=
 =?utf-8?B?SEFoeURHd091RUp2T0dGMEVmTld5aUpzZ3M1ek1BYWxYODloQ09NRVh5c0lR?=
 =?utf-8?B?YldXdTRJN0ZqcEJ2VUF6bTNHeVRBNkhCR3BNMVp5TDRRcFJ6QzhVQ0NlQlRI?=
 =?utf-8?B?S2hLZjY0WHRLUVlLcGNqVkhEbW54c3ZTUlhBZDVyOVA0Y0lOVFpicmNOTjJH?=
 =?utf-8?B?VDVqa011V2hPTHBWbi9CdDhjZ1hUQ1hXY21hUmNDcnVRQWtEclIzL0JJQnBI?=
 =?utf-8?B?RDBPbEp2Y1JNaHdaSUd5U1YyRHV0alVMcmlRVTNhVFZZY2hxbXRGTlBBU0tP?=
 =?utf-8?B?NTFFanF1Ymtvd3RVL3hoaWhlNXp2MS8reGc1amxIWGloV1ozUm9kR1N6bC9k?=
 =?utf-8?Q?qdP6cROVFUy6xDyJBGKb1BkPx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c5ce6d-8a35-4a8d-23e5-08ddcdd74e38
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 13:04:37.4671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RzzboYCahdwkSM2bkEcAJ60b2O0XpqRoUrCXx+KIyxUWL5FN/daenhCeFqbqOR0ZM4cEp3R/JKSmth2xfCx0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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

--------------J9DT0fNHU0uz0MsUiyYRBQoX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 23-07-2025 17:46, Raag Jadav wrote:
> Introduce subtests for i2c adapter which is used to control on-board
> OEM sensors on selected devices. This will test D3hot/D3cold transition
> before and after i2c adapter access for the devices that support it.
>
> v2: Define macros for AMC constants (Lucas)
>      s/index/adapter (Lucas)
> v3: Wait for runtime suspend before ioctl (Anshuman)
>      Make i2c_test() void (Riana)
>      Fix test description (Riana)
>
> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> Reviewed-by: Heikki Krogerus<heikki.krogerus@linux.intel.com>
> ---
>   tests/intel/xe_pm.c | 101 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 101 insertions(+)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 16b5fc686..838b8cb4a 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -11,12 +11,18 @@
>    * Test category: functionality test
>    */
>   
> +#include <dirent.h>
>   #include <limits.h>
>   #include <fcntl.h>
>   #include <string.h>
> +#include <sys/ioctl.h>
> +
> +#include <linux/i2c-dev.h>
> +#include <linux/i2c.h>
>   
>   #include "igt.h"
>   #include "lib/igt_device.h"
> +#include "lib/igt_kmod.h"
>   #include "lib/igt_pm.h"
>   #include "lib/igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
> @@ -38,6 +44,10 @@
>   #define PREFETCH (0x1 << 1)
>   #define UNBIND_ALL (0x1 << 2)
>   
> +/* AMC slave details */
> +#define I2C_AMC_ADDR	0x40
> +#define I2C_AMC_REG	0x00
> +
>   enum mem_op {
>   	READ,
>   	WRITE,
> @@ -779,6 +789,90 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>   	}
>   }
>   
> +static int find_i2c_adapter(device_t device, int sysfs_fd)
> +{
> +	int adapter_fd, i2c_adapter = -1;
> +	struct dirent *dirent;
> +	char adapter[32];
> +	DIR *dir;
> +
> +	/* Make sure the /dev/i2c-* files exist */
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(adapter, sizeof(adapter), "%s.%hu", "device/i2c_designware",
> +		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
> +	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
> +	igt_require_fd(adapter_fd);
> +
> +	dir = fdopendir(adapter_fd);
> +	igt_assert(dir);
> +
> +	/* Find the i2c adapter */
> +	while ((dirent = readdir(dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			break;
> +		}
> +	}
> +
> +	closedir(dir);
> +	close(adapter_fd);
> +	return i2c_adapter;
> +}
> +
> +/**
> + * SUBTEST: %s-i2c
> + * Description:
> + * 	Validate whether the device is able to runtime suspend before and after
> + * 	i2c adapter access.
> + * Functionality: pm-d3
> + * GPU requirements: D3 feature should be supported
> + *
> + * arg[1]:
> + *
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
> + */
> +static void i2c_test(device_t device, int sysfs_fd)
> +{
> +	uint8_t addr = I2C_AMC_ADDR, reg = I2C_AMC_REG, buf;
> +	int i2c_adapter, i2c_fd;
> +	char i2c_dev[16];
> +	struct i2c_msg msgs[] = {
> +		{
> +			.addr = addr,
> +			.flags = 0,
> +			.len = sizeof(reg),
> +			.buf = &reg,
> +		}, {
> +			.addr = addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(buf),
> +			.buf = &buf,
> +		}
> +	};
> +	struct i2c_rdwr_ioctl_data msgset = {
> +		.msgs = msgs,
> +		.nmsgs = ARRAY_SIZE(msgs),
> +	};
> +
> +	i2c_adapter = find_i2c_adapter(device, sysfs_fd);
> +	igt_assert_lte(0, i2c_adapter);
> +
> +	snprintf(i2c_dev, sizeof(i2c_dev), "/dev/i2c-%hd", i2c_adapter);
> +	i2c_fd = open(i2c_dev, O_RDWR);
> +	igt_assert_fd(i2c_fd);
> +
> +	/* Make sure open() doesn't cause runtime resume */
> +	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> +
> +	/* Perform an i2c transaction to trigger adapter wake */
> +	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
> +	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &msgset));
> +
> +	close(i2c_fd);
> +}
> +
>   igt_main
>   {
>   	device_t device;
> @@ -889,6 +983,13 @@ igt_main
>   			cleanup_d3(device);
>   		}
>   
> +		igt_subtest_f("%s-i2c", d->name) {
> +			igt_assert(setup_d3(device, d->state));
> +			i2c_test(device, sysfs_fd);
> +			igt_assert(in_d3(device, d->state));
> +			cleanup_d3(device);
> +		}
> +

Hi Raag,

1. This LGTM.

Acked-by: Karthik Poosa <karthik.poosa@intel.com>

2. Could you add a new sub-test which runs i2c_test, after the system 
suspend and resume cycle, similar to exec-after test ?

If there is any issue with I2C after system suspend/resume, we would 
know with that.

You can add it as a separate patch if you want.

>   		igt_subtest_f("%s-multiple-execs", d->name) {
>   			igt_assert(setup_d3(device, d->state));
>   			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
--------------J9DT0fNHU0uz0MsUiyYRBQoX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-07-2025 17:46, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250723121614.159621-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce subtests for i2c adapter which is used to control on-board
OEM sensors on selected devices. This will test D3hot/D3cold transition
before and after i2c adapter access for the devices that support it.

v2: Define macros for AMC constants (Lucas)
    s/index/adapter (Lucas)
v3: Wait for runtime suspend before ioctl (Anshuman)
    Make i2c_test() void (Riana)
    Fix test description (Riana)

Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
Reviewed-by: Heikki Krogerus <a class="moz-txt-link-rfc2396E" href="mailto:heikki.krogerus@linux.intel.com">&lt;heikki.krogerus@linux.intel.com&gt;</a>
---
 tests/intel/xe_pm.c | 101 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 16b5fc686..838b8cb4a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -11,12 +11,18 @@
  * Test category: functionality test
  */
 
+#include &lt;dirent.h&gt;
 #include &lt;limits.h&gt;
 #include &lt;fcntl.h&gt;
 #include &lt;string.h&gt;
+#include &lt;sys/ioctl.h&gt;
+
+#include &lt;linux/i2c-dev.h&gt;
+#include &lt;linux/i2c.h&gt;
 
 #include &quot;igt.h&quot;
 #include &quot;lib/igt_device.h&quot;
+#include &quot;lib/igt_kmod.h&quot;
 #include &quot;lib/igt_pm.h&quot;
 #include &quot;lib/igt_sysfs.h&quot;
 #include &quot;lib/igt_syncobj.h&quot;
@@ -38,6 +44,10 @@
 #define PREFETCH (0x1 &lt;&lt; 1)
 #define UNBIND_ALL (0x1 &lt;&lt; 2)
 
+/* AMC slave details */
+#define I2C_AMC_ADDR	0x40
+#define I2C_AMC_REG	0x00
+
 enum mem_op {
 	READ,
 	WRITE,
@@ -779,6 +789,90 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
 	}
 }
 
+static int find_i2c_adapter(device_t device, int sysfs_fd)
+{
+	int adapter_fd, i2c_adapter = -1;
+	struct dirent *dirent;
+	char adapter[32];
+	DIR *dir;
+
+	/* Make sure the /dev/i2c-* files exist */
+	igt_require(igt_kmod_load(&quot;i2c-dev&quot;, NULL) == 0);
+
+	snprintf(adapter, sizeof(adapter), &quot;%s.%hu&quot;, &quot;device/i2c_designware&quot;,
+		 (device.pci_xe-&gt;bus &lt;&lt; 8) | (device.pci_xe-&gt;dev));
+	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
+	igt_require_fd(adapter_fd);
+
+	dir = fdopendir(adapter_fd);
+	igt_assert(dir);
+
+	/* Find the i2c adapter */
+	while ((dirent = readdir(dir))) {
+		if (strncmp(dirent-&gt;d_name, &quot;i2c-&quot;, 4) == 0) {
+			sscanf(dirent-&gt;d_name, &quot;i2c-%d&quot;, &amp;i2c_adapter);
+			break;
+		}
+	}
+
+	closedir(dir);
+	close(adapter_fd);
+	return i2c_adapter;
+}
+
+/**
+ * SUBTEST: %s-i2c
+ * Description:
+ * 	Validate whether the device is able to runtime suspend before and after
+ * 	i2c adapter access.
+ * Functionality: pm-d3
+ * GPU requirements: D3 feature should be supported
+ *
+ * arg[1]:
+ *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ */
+static void i2c_test(device_t device, int sysfs_fd)
+{
+	uint8_t addr = I2C_AMC_ADDR, reg = I2C_AMC_REG, buf;
+	int i2c_adapter, i2c_fd;
+	char i2c_dev[16];
+	struct i2c_msg msgs[] = {
+		{
+			.addr = addr,
+			.flags = 0,
+			.len = sizeof(reg),
+			.buf = &amp;reg,
+		}, {
+			.addr = addr,
+			.flags = I2C_M_RD,
+			.len = sizeof(buf),
+			.buf = &amp;buf,
+		}
+	};
+	struct i2c_rdwr_ioctl_data msgset = {
+		.msgs = msgs,
+		.nmsgs = ARRAY_SIZE(msgs),
+	};
+
+	i2c_adapter = find_i2c_adapter(device, sysfs_fd);
+	igt_assert_lte(0, i2c_adapter);
+
+	snprintf(i2c_dev, sizeof(i2c_dev), &quot;/dev/i2c-%hd&quot;, i2c_adapter);
+	i2c_fd = open(i2c_dev, O_RDWR);
+	igt_assert_fd(i2c_fd);
+
+	/* Make sure open() doesn't cause runtime resume */
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+
+	/* Perform an i2c transaction to trigger adapter wake */
+	igt_info(&quot;Accessing slave 0x%hhx on %s\n&quot;, addr, i2c_dev);
+	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &amp;msgset));
+
+	close(i2c_fd);
+}
+
 igt_main
 {
 	device_t device;
@@ -889,6 +983,13 @@ igt_main
 			cleanup_d3(device);
 		}
 
+		igt_subtest_f(&quot;%s-i2c&quot;, d-&gt;name) {
+			igt_assert(setup_d3(device, d-&gt;state));
+			i2c_test(device, sysfs_fd);
+			igt_assert(in_d3(device, d-&gt;state));
+			cleanup_d3(device);
+		}
+</pre>
    </blockquote>
    <p>Hi Raag,</p>
    <p>1. This LGTM.</p>
    <p><span style="font-size:11.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-IN;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">Acked-by: Karthik Poosa &lt;<a href="mailto:karthik.poosa@intel.com" class="moz-txt-link-freetext">karthik.poosa@intel.com</a>&gt;</span></p>
    <p>2. Could you add a new sub-test which runs i2c_test, after the
      system suspend and resume cycle, similar to exec-after test ?</p>
    <p><span data-teams="true">
        <p>If there is any issue with I2C after system suspend/resume,
          we would know with that.</p>
        <p>You can add it as a separate patch if you want.</p>
      </span></p>
    <blockquote type="cite" cite="mid:20250723121614.159621-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		igt_subtest_f(&quot;%s-multiple-execs&quot;, d-&gt;name) {
 			igt_assert(setup_d3(device, d-&gt;state));
 			test_exec(device, 16, 32, NO_SUSPEND, d-&gt;state, 0);
</pre>
    </blockquote>
  </body>
</html>

--------------J9DT0fNHU0uz0MsUiyYRBQoX--
