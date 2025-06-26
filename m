Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFEFC7EE30
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 20:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629FE89023;
	Thu, 26 Jun 2025 20:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCtqrdR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C2389023
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750970694; x=1782506694;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=kwBkmx0k/STPjxim5Bk0GlLMPQpVl2MpbzsLiUQGv+4=;
 b=SCtqrdR+wNciCjg4Dw7oAlsbs+xbqhzxfIZW+ADDcxGLLMU9VJX6+ch/
 OTbaJnCJZin7FaHMU5XIw4Zg8BbXbIjRM1lrShHEfdnQE6LUO9R2d46cQ
 fhoKSmqmqC/JU1aCeDGgM/tBdBMM9Qmn0109rampkfFdLfM+DBWBVksl3
 GEz0aftC5kbXxjXh1xVNy4AdcLYCY1hTFD7XSSC5/Frg5E7rdENVz8Aaz
 u0QHIsYpfhMyOeLXcuaZCXiXW40zTF0o+UqFpNnEve20Lp+/P8jV2edQj
 QnkSAk6jdoi45eKMm1OH0Ue8R2torNFxXjJQXH/ON3cwgH/TGhhuBgngD Q==;
X-CSE-ConnectionGUID: W2Fi933uRJ60mCYhbFM2VA==
X-CSE-MsgGUID: MZvygahfQW+ur/NlxMPYGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70712709"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="70712709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:44:54 -0700
X-CSE-ConnectionGUID: E+c47Q1ARe+t2xMlM+PRfQ==
X-CSE-MsgGUID: 2UBDCzSoRlW9bQMWpCehQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152721070"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:44:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:44:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 13:44:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.73)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:44:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Geth/a9Qj1AF2hinTzLFRxfFU/gy0uHIeh/AiALXedMbJXVpyFR7uJ1PRtPZpDPmHeSl93ayB6dBsbF1bEzkHyA23qK9NKzjz3fQd3HOYtVx+3Z66S5LcijV1YvjhU1G7WH1Pc2plX3zV52WYZPJa6eqdLjmlnLmRdTegCntPgWkWGv72BSQIZQoisTtqlDV0q7WVvyKnn20rsTwKdkhHG0ypnFyJ8E5GIV+HqPuQtIII7mo8wDRmgsRSukFor+OhyYgrZ3jGHcPTv6HN9PHsbvcAXjFd2A0lOMu3fyiGoi7WggqK1utukf2x7vDqRfKGBolaeRKOIb7xBdOWL9PVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHFkN615DyhEu9HxLbu5BWK/oVYjPD7/ZhsR3Bskys4=;
 b=eoEJGmNmlkRIRCsPFcKTWCDuwvb9gqx7XsGHwcfJzmdktwpzyZF8c/4seHFoqdF5tOrB6HKsuFrsW7Ygzh8WSJh2GGVWdgdmqs475Ds65w4UKcfu3C+Mp6bFytT4GJazErRBk4sGmQ+y6d8p9z6YUYcsoN0N7aqkwTmOqEN8pPZNyMirn/R7EWo5HfEYbiD04wNX/ECs5Hhg/2k1DQrpSMjnv6nYQ+VtNK0ZWMwt3+a3IBZg1G5EE2vZwTTMJyAIpXpGRz/Mn1MFT8NuSt7M9THpBreYgV1RAmpoyAlgcgKx56Zm74x1R0HaII+xSySYzqhuYMqE4qiXs78Rlh7xtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 20:44:51 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Thu, 26 Jun 2025
 20:44:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250626203400.114823-1-peter.senna@linux.intel.com>
References: <20250626203400.114823-1-peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t] runner/settings: Fix while loop
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 26 Jun 2025 17:44:48 -0300
Message-ID: <175097068821.1321576.6357263109464342524@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0380.namprd04.prod.outlook.com
 (2603:10b6:303:81::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 060ea8d5-ef59-4dce-2dfa-08ddb4f24c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFZmNGQxcTRPMSt4RHh1ekh4WngvRFdINnlWR1hIQXNpYjZ3ZkJBY1ZyWkpW?=
 =?utf-8?B?Q3dmVFlyRlU0VFdQY1BjT3NSUWZIOGlKSnlnT3VjMFFoMXJBUk55YkRaTnZU?=
 =?utf-8?B?dTB2RU5PbjZyNE4wNTlDdVc5ekhLeHN6cVd1VjhuNzlNUWpJZGI0SWZ3VStP?=
 =?utf-8?B?QUV1NHlnQXVhQk1jYVlMcU9RTHVMUkJOeDNhd2xKSUxKdDhNeXlSR29LVmp0?=
 =?utf-8?B?djc3MUlKVEV1ZGptalY2cFZ3VmdwRzJFL0tWeG1tVmZwQjl3c0xhdzFJMi9V?=
 =?utf-8?B?ZmVtRE9kb0ZJVE1LTnJGR0xILytvakNNZENaUUZZaXRpa0VWNldqVENtWmdH?=
 =?utf-8?B?TU9LNGFxK2ZXckJ0OEtkcmlmK2VHK2F4cFF6RTBQRlcyb2FqMW1XalF1UVN6?=
 =?utf-8?B?MGFYTXUxcEdiKzhLQkhDbEZzbCt3VUdkTGdQcGVIaExOUEFFcllhVHJGczNl?=
 =?utf-8?B?aHh4Ty8wTWg3dlBkWWpWTnVKUUpaRlZFZ0NkZzhjdThybzBtaWVtOUhwWDhs?=
 =?utf-8?B?K05rNENRd3FYOVE2eG9xWXRNdkFES1p3eFNtdnZBNFllRTJQblRIamdrR0dF?=
 =?utf-8?B?VHlKdUhLYnFxWVhxcjEzVkpXUURLUFpuTGtWSURIN3hqQ2JJZVE1YnRZcmZi?=
 =?utf-8?B?SU1JaWViVnpNSytUWVBSYkYyazZVODh0S2tQZnlUek8zb0RpOUZDNkZpTDl3?=
 =?utf-8?B?WFlhb0NudnNJR0FqMUdXRWFFYUNXdnA5K2NCWXE2aWJLUlFFVzBtOGxJOVcr?=
 =?utf-8?B?cjQyamlsYjZoTXBRY1lBK0JORUI1QjgwcFJpU21wdExIYlJ4VitPYkJvdkJw?=
 =?utf-8?B?Mk41WitSekdva01IY29vQ3U1TENiMitoZ05BT29VaVdjZ0VuWDVaWklCZ2FU?=
 =?utf-8?B?MVhTdWJpS3VqVW1rSFdpZDU1TFZ0ZHF4U0JUZkQ5ZDhDVnpNVlppUnV4aVE2?=
 =?utf-8?B?L3VleE5ZeFdMWEVuNHhkMDREK3Z6aUhYTnJCb0FOT0FYa3ZET3Q4Wm1hM2RQ?=
 =?utf-8?B?VTNyZzkzbFpFeEZMc0ttb2RMWjFvaXNaSGppZ3ROZDFwY0xIY0dzQTNOTmRJ?=
 =?utf-8?B?cVJlVFUxY2ozRUl0T2tmdGMrRUVOR2RUdlJZM1g4OVkwUkZwUmN3NGhsUElo?=
 =?utf-8?B?NWdPeUE5K0szK1pLVFFkWklUSWVjc1hVYkhqQlNjSDgzdnJwTmZIa0U5OEdH?=
 =?utf-8?B?eTNwVVRFeWpDWS9iam41RkQ1VzRWTjFBYnpCaHFnL05Mb3BqbTY2V1lHS1RJ?=
 =?utf-8?B?V2p0U0t0YXBXMDVsME1ReUl5SXNLcUpFSFU2U2xualowK0szZi9EUTRFeGNC?=
 =?utf-8?B?cGZzR1BzNXJVa0xlcVRySm1rdG4rYld4VmlqMXFzaElSNEV1V0R5cCtYZXlv?=
 =?utf-8?B?Q2tJTUk5NDJJMnRFcWkyZ2ZYMnBqK1ZDVGVIZDBXeTFOdTBiTHJ1TVFscjBu?=
 =?utf-8?B?b29RT3FXcHczdkM0NCtmNHJ0Ykg0UHRpN2FVZGxhUHc5VGpqcWEyamJQRlUz?=
 =?utf-8?B?R3RXaTM0V2Z1UXBVTzJLdjE3c2VubTllZmNYQXhkYVBDTWpEOTRkdW80SHlo?=
 =?utf-8?B?aDFKVm4ydFlROHh0YUJ1NlZaSnFIWkNia09lMUNQVGZVeW5DZ0IzWUNmRzls?=
 =?utf-8?B?bkl0MDlxTnVGYzh3eGRZOHpWYUFPbjQydEx3ZVlQbXZYVEdOY2s3bFdvYk5C?=
 =?utf-8?B?OEM2YjZSTlhHZTVkb1FOR0oxTTdYMVFRdkpyOG5PeWx0QjVEczZpWk55WWlX?=
 =?utf-8?B?Sm9WNlJBbDk2NWlWa1JLNC9tRDJTanAxbmdJbGxoSVVHeGh4dU1mbnBRK2NS?=
 =?utf-8?B?WnFObUcyRDdLQy9kcGgxVGM3T29iTWxGVTE4UlBBeUh4d1J0ZDh1U0YxUzBF?=
 =?utf-8?B?TXBmbHVja29DUnVRNm9xbTFKM1RTUFluWVArOHFJR1VqM21PK1cyQ2trZEFt?=
 =?utf-8?Q?Dz4Qm/+tlwA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXRnNjRRbnI1SjZpcklnVmJMdFNNcjN4TU5nbFNmdW5PM0h2NG53NVE5Q0FP?=
 =?utf-8?B?cUF5ZUI1bTJxdVJFZFRNdFRKVWFoZG1xWXVGY2pySUFRaWVEaVRKbW56SXhM?=
 =?utf-8?B?T0FZZzdobGh1REVUSFk2S2RSMjZkSHZyYlc2cHRKRkxOdDRTemVDaVdQcWhs?=
 =?utf-8?B?NUNKK2IvT1laaG1UaWo4UFMzektRN1pvTDdiUUhsa1l4NitJdlBRSGJCRnU5?=
 =?utf-8?B?aCtFZjdZRjVlc3lycHRES2w2Q0R1UDhjckZuS3JCL0VETlZkT2piKytId0d3?=
 =?utf-8?B?U0t2MXpMQTJBdXN3WWRTN2U5OUNNdXdDOEpSL1VQWTIwVVVwcGdPUHNyMWRY?=
 =?utf-8?B?VG5EaG1tbkE1SDZmdlBlZ2RveHNuMTFTSmdGVDNaT01Pem5YVGhUVU9ha2kx?=
 =?utf-8?B?aFJneEZabzBuQ3I2RHhWYlNuOG9GeTNnTGZZQzc3MGs1cGZTTlpSRWxacFcz?=
 =?utf-8?B?bzhlRE44TXNZZ1NndnJpak9GaVBldjg2aFoxK0F6NWJCRU9JNmhlNTdjVW1j?=
 =?utf-8?B?c1pwczJPZ1lSREZrMmxNalk1OHB3a1NIcWxJNHd4ZW91RllEV1F1WGhianh1?=
 =?utf-8?B?WmNqVzJyTjk3amE3S2tISi8yRkJJTFZGdHlSYy9TNjBScWRNMTgzdUkwMEdh?=
 =?utf-8?B?STduSnd2QlBTZHg1ZU5KTG9BRzB1bFlva0lBSTJSZlF4NkVxMXRnV2J4L3U3?=
 =?utf-8?B?SjVtQVB4QngwRmpBYUYxQytMNm9iUS9nMW0vZzFrN1dBNmdZOGI0NGx1ZmxK?=
 =?utf-8?B?MTV3WTR0YkhJaWhwcTVqSWpVdFN0TTJoeVhjNEZtUVROa0VVempxR3VrZWVQ?=
 =?utf-8?B?WHF5cll3UFdRTXlyRVJJejNReWE0V1JVWUlrcVppVnRrNHpjdDhRN0IwbmRL?=
 =?utf-8?B?SUlrMVZKSlkxY1NHOVByOEdiWC92U3lYdDhraUFLZmhxSDZ5ZjdxT2xCV1hO?=
 =?utf-8?B?bU9qWTRSdkxPMHFzQ2ZINDFJQzBoOE1Pc3ZRbDhlT0IrZHhEQUE5Ui85MW9X?=
 =?utf-8?B?enZmNktWVzhGTWluTmhORVNtZGpneFM3cEhnbm1VcXlJaDVBOEJmNlpSQWZC?=
 =?utf-8?B?Z0lTcm9Gb0g5OTZjQm00WCs2ajR3YitlNzhaZ2orbkxuUzZkWFhNZGtIK25r?=
 =?utf-8?B?WTRFcnMza1lqY2x2MDdRVEhVL202eUR4S0lvNkYxWTduMFgxeWIyc1pXa1pM?=
 =?utf-8?B?amN2UW5QakxsNmIya0hsY1hPUkpiMUtYTkZKM1FsVG16VFU3Z0JVakorSUZp?=
 =?utf-8?B?N3ROd0JlL0lhQWVrQXNMWXRicVJYYVBEd1lPL29IZTBzdFZ6ZEo3Wk9KMzVt?=
 =?utf-8?B?ZnFJaTRGTUhCTThka1E0Wlk3eHU2eVh4bTFxVlVtaE4xMzlGdzJ5QkJ1dlIz?=
 =?utf-8?B?c0JLR2hERVhVYVRPY09wN0puVnlsTitXN1RoektSOWxUbS9YVlNIeDRKeWJp?=
 =?utf-8?B?MlBpamRIZUVSSld3WUVpRmc4YzZ6WVpBMkNvcGFhbjJ0WkhJYURSSEJxMk0x?=
 =?utf-8?B?blE4RFQvZFpmcjVpKzRYRlY0QzlZdkJzZzNYZGpROFFwS29Xc0tFdVhzZGhH?=
 =?utf-8?B?dWE5ZkdSUnNRVURFL1RNbG1Yb2hodTlnN0xnRDg4cXRHZzA1WWZSdjE2TzV6?=
 =?utf-8?B?TW9IQXd2eFRvcDAwcWRNcXFjNkQzRTJLQ2oyYTVqY3NkQ2ZrbWF6d3BBSWNl?=
 =?utf-8?B?cEhYZjlQN0laTHozVER6SXBzeDBBb2lSZHNFZGZmb2MvcE5aVEtmeXhEd2c0?=
 =?utf-8?B?WXp1WmJMenNuRFJXUm1qMFIxWVV0bTE0Y2Nic3BDV05FenhFeDNUNXdhYktL?=
 =?utf-8?B?ZjR0dndzRUVoaThiZmxQZTFOTksrRndSTHZyUWxSN2FFVk96WklUNjBVWkFG?=
 =?utf-8?B?TGoxMTJJZlAyeU9IT3AwQTREZzQzVURQbTBSY05lN0YzVUVpZlBOU1FWbnVy?=
 =?utf-8?B?ZmFBc3gzMFcrejMyU281b2tsL1ZwRWpJWWxaekl6YUl6dXIvMDlGelZROFN1?=
 =?utf-8?B?TS84cGxoSHVwZTRBTlBZNE1pdGtUY1ZxbndnV1FUSFF4N1dSeHpobHY2TzZk?=
 =?utf-8?B?ZnJoTjdDalF0djNuNjNBM05pTDA5YWo1VmhPUE5ocGl5M3lXT0ZUWmZiMkRS?=
 =?utf-8?B?NUZpbnNoNTBGenpSeXdRaHVkSzNNME80eTdBYmhYZ29nZyt1bUt6cWxGSG1M?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 060ea8d5-ef59-4dce-2dfa-08ddb4f24c0b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 20:44:50.8783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O628AuIpPMFxzNh1kzRmLIaqXxwxRfrXRKCskbUP2es6ZqO7BwuSWjdvXc42D4fCTG/EbSG1RTXisl3zYb2+sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
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

Quoting Peter Senna Tschudin (2025-06-26 17:34:00-03:00)
>Passing a large argument to the --hook option caused igt_runner to
>crash.  Valgrind identified an issue in read_hook_strs_from_file(),
>which this patch addresses.
>
>A typo in parenthesis placement caused the assignment of 0 or 1 to
>line_length, not the actual line length, because !=3D -1 was evaluated
>before assignment.
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

And... :facepalm:

Thanks for catching this!

--
Gustavo Sousa

>---
> runner/settings.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index a7d5dbc97..4bd925934 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -1458,7 +1458,7 @@ static bool read_hook_strs_from_file(struct igt_vec =
*hook_strs, FILE *f)
>=20
>         buf =3D malloc(buf_capacity);
>=20
>-        while ((line_length =3D getline(&line, &line_size, f) !=3D -1)) {
>+        while ((line_length =3D getline(&line, &line_size, f)) !=3D -1) {
>                 char *s =3D line;
>=20
>                 if (buf_len =3D=3D 0) {
>--=20
>2.43.0
>
