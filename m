Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E34C5B567
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 07:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA4210EE85;
	Wed, 12 Aug 2026 07:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ydko+YUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D035C10E18A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786519249; x=1818055249;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=rc3dlKtmG+vhcFwG6deB+HGe+NPKrcJSehqMSkTpb4k=;
 b=Ydko+YUUB+SlkNQmBsLL60JgCqxwaRdpqdWOUCfcJF6eAny04DEqEpg7
 2Ur6O7vs0zHEFUOH5Vg99aLRf/mGM0+rVNqul/1Su1ZXgeeJXAdv4ehoW
 ui7kVIwP9eZF1mMwGYr0aPmam+zBNAP/tnMMz8l0JfQ3nehSCIJD4H7/p
 iKQvTiQo/NKbIxsX/4yMvJ4sEBSJaaonh6NY4CRbHUF20bh+04grIA3PO
 xjVTkSSrlqNVmIw92DPe1gSmH8mcIOpVUAdlpq/Yu3eGYIBN8d4WBAQyh
 Oz8O/zlqJaqQZoSD292r96KF37dvigmE9fjbvNyvY1OhW4si2LU6dzV55 Q==;
X-CSE-ConnectionGUID: II3AaKp2S0mvsK5k4qnjtg==
X-CSE-MsgGUID: td82rJV2R7eZWmPy8pRugQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90939866"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208,217";a="90939866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 00:20:48 -0700
X-CSE-ConnectionGUID: KiFRxzBcTzaEbUSPQk0kMQ==
X-CSE-MsgGUID: K1zqCWdiS6SpLHpDmFqvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
 d="scan'208,217";a="267059459"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 00:20:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:20:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 00:20:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:20:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckjod5p4IMQtEWwIvASLX8jxOxIVS6HowMVXuQvas32Y2olh68suY0238g/UtE+Kn3fNGIx8O1hgOW4MEYLJtbuuLBGCLqalli81LZ77t8CjGqx1l6FrlN6ZCrQ5OIKFangmWZsau3JdaqhUSBRHwYQDAHC4DOdO0xLigPbA/YLAVIIb2bVuJ6kTr0ebOy5C0bsnrVYc1WhvlRXa1yGCgfaLSSCebFYGZhID5Eda9tBZpmM8DqPynYchtQ8zLHVeaB6Hoba7FFp64gm7+u111dBiOsddnCbnJoNVS2IAY1tON0aXMeQ/vO+tpeXfgqKrSrA4rQQjGgCqq2BJ7f4VSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELeR2daHkbWunEVwo8rF52LXJUjE/Cr9QlwN9lyhEtM=;
 b=XTPtQ9AkBGPsiWtyA1NZVoc8Zi2wZjZ3kC/ozH+8cpkvmAu0dKDb0WR+0vYEhRiCBcJfNGdTQfU1wCXsfpvpKsOL7SbTSGYTmgTU3C4gu0S46qSHQAAdrtasF0wGogP1N9wQLF+suRoo28i1RQ2VHk8APIyouCTqS3HTOkrK342FGNz61UjPSCrBOFnYe1iCyC2/GheSrQ5LvKMs72FfrZKw4KUXV5cwOCr2GcDSNVQcKXB0HgM4KvReC/tCdW5AB1p8FVU9t3DrH5Q7y7s8GkJZ86VVyexXz2j67NEMMg97WOVr7JiISSfE70d3FFLpLq1iW3uU3y93z571xzWHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 07:20:40 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:20:40 +0000
Content-Type: multipart/alternative;
 boundary="------------0pzM5l92EERRoOAPmAPuByIa"
Message-ID: <c743212c-6e46-4edf-906a-ab5431575241@intel.com>
Date: Wed, 12 Aug 2026 12:50:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_vrr: add CMRR fixed and video mode
 subtests
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
References: <20260810191800.1076781-1-ramanaidu.naladala@intel.com>
 <20260810191800.1076781-3-ramanaidu.naladala@intel.com>
 <IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0364.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::14) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CO1PR11MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcb1401-5764-4b69-6a2e-08def84236bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|6133799003|4143699003|10067099003|3023799007|18002099003|22082099003|18092099006|8096899003;
X-Microsoft-Antispam-Message-Info: 8i+v1hGLZutctdyaEjnHJWbUMEP6MyDtTvw4Fzo4ld6jrNpO86PG3oj8ufpp7iY6Lg4T4Qik7NwCt+1QK1OUkoUgWThUDLvOSM3QFLkf7qc1nNeTGFeIW6SA/VozdJz7NVbQVesYwB24z/eXM9JYcCDYzLw+h6kenrW/XkcgqDTwlRxS487T1Ilw7ROd28mbY7GDN/e3ov7ZWuakinuSXh1jAKnULGkLTs1UF3WxuKtbKUkeDPMJ2geqez4ZN7OVlj9VIkvGLJRLXypoQfUA1e2oSjUIICOOEDFa2h3t0mbmv95XGlHimWIWVZ2QV64PiKWXduPIdlnzsHiXdXeqLlaS9FADld4lr/Z90G4XfqPRBJdMTTH8m99Zv79HNHkdqvU/fO9dcE1ELew8YxdUBjfNf48nHdwaX8AzjCuB60tGsND6zoW2RW0qu+woEVzHgP1Qg5y7fV/4a38VdHSr/BDSo1mS/q01u96rsnCWTEvzNcOXXEEGIadoGSAyAWHlTPdz7Mm40CJFneWRYLPSYg94TXiUkzpMuoMGCStLJiDRYSSiHbhFkUIU37uD/yoK63pLHgiz6Cqja7Hf1ELQgHJ8ssIujtDrGKs8S47HJjLyYpSA/K4ftdMESpEn9nDUCvmcAEcQQWqNrSUsNIqgkNpqQkRfrD7QKd4f2dYRGI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(6133799003)(4143699003)(10067099003)(3023799007)(18002099003)(22082099003)(18092099006)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXZnOFd1bXNGSXJST2JwWUdZbG9zZ2VwN1pCZFg3VGNZYlVHSUxqcFRsaU5r?=
 =?utf-8?B?TEl3ZFNtQWNzWnRvSmNwMEJKOW85WGVqUmJPODJtL05YUUJmQjZwNyt0VmpE?=
 =?utf-8?B?Q0ZUaThmSGY1SEFzYTIrcVpoOTdoM0hFVTJiYzNXUHZuT1JyWXVOSDNDUm1k?=
 =?utf-8?B?cXVDbE5ZY1NwY2FPODA4OEtHSzFObitVc2s0QjRBM3R4MmtqOFZFY1Y0bWwv?=
 =?utf-8?B?eVErcTFCamJXVkdsYXNPQ2dvbmZVeFArR2pGQXptOEtuSXN3aCtMdGtETEpy?=
 =?utf-8?B?cDZ5eVl1YTY2ZG1YTTRBdWFYOVBkQ2hwc3AydFd6WU9yMjAxV2FzWE5POUt3?=
 =?utf-8?B?b04vRFVIeUpZMUd0NzBKWmVHVTlkNm9LcEJZcStpQmJPVkVIM2hua0tNMk8r?=
 =?utf-8?B?TFUxUVpnZEpNM1FsbUJvYnoxczdkY0J2clM1WnpmQ0NQdUxiQkQ0R0hlWEx4?=
 =?utf-8?B?ajF2ZDBKMTNHNFU5NllBU2JrUC9oV0JNR3RHRkFDc3JXRWdoSHl6K2JDV1c2?=
 =?utf-8?B?RjJuT2hISURGek03Q1pERXpkeEdCUEtWMzlhOW55OW1QSGtZSlJkdGEydjZ3?=
 =?utf-8?B?Y01hd1hkSGtiN0gxbGRlYW1nb3hmUVhtcms5ekhoWFFCMldId2NqaVlnZVhs?=
 =?utf-8?B?Y2FJbFlLRkgxdFJqMC92TEU0L00yVWgwUTVReVdFU3RQdURXV0plcWo3blds?=
 =?utf-8?B?VG1IWmQ4KzAyVkhvYlZYQk1GQTFlbjBFU0RkSHB6aEZ0bXFJb1ZQaTZRZ3hF?=
 =?utf-8?B?OFVnbVdXUVJYRkR4L3FmbXpMbFZscUxSLy9VYUk3WGZNQm12NVV4d3kyNlEz?=
 =?utf-8?B?U2lGWXRMdFVhRG85OGRXN2t2SEYvSHJKVGtVRnVDMmN4amIxR2lCR0VnK1pC?=
 =?utf-8?B?aE9ZY0N4WW56cXU3emFOU3VmMnoyMG5rS2FldmtmcjBndHdGczU2Zk5uVGFu?=
 =?utf-8?B?UUZSc1N0YmM5ZmZFdVB1UlVhTXFHUlJyc2twc3hWR3dSZzhvNGhzd2drUytJ?=
 =?utf-8?B?VDcwNVErWXNPYURuVVIzUEh4aDYyWnpOSElyQ0dwVi9nMmN1VHN5Z1p1dEtn?=
 =?utf-8?B?QW1iQURGdXNJcTlVVUhlNmdLdUUvRXJqS1R5eW1yREszTklqaWhMVUxSS1NQ?=
 =?utf-8?B?VFFJYmpwRk9sRFpETyttL1BZck9IdXJPK2NZeVZsUU0zcTZxVkVQamNGWjhI?=
 =?utf-8?B?NkxteE41aWFzK0ZGRmRSZjUxNU1NU2JXRGszZnpaZEtYazBrLytlYnd4ZTgw?=
 =?utf-8?B?UFp1SnRCNElJcU1wVkJsMVgzcUN6U2h6QkZDWEE5dGsrUDRJaEErc0N5dTBL?=
 =?utf-8?B?eC9DQzRqWURQR0NMMjJXZnNhTW51eTZtOGwzZ09UakZCV2UvcERScytJWEZM?=
 =?utf-8?B?dTMvM3k3RmVWSTFhdkVEay9hVXpnNmNzWVlDZFl5Y1NGcmNYZm91UWpXcG40?=
 =?utf-8?B?ekh1cUFHQnBFTE40T3BzY1p2QnZ0VTBOZUVXMDNvdVNLVDFneXYzWTJWVmty?=
 =?utf-8?B?YmRnaHJKNHhSK2twZ3VST3pWem1nbnFMdDlxbTdRMzQreG5mZWN2RG9FaHln?=
 =?utf-8?B?MGs3MFl0eUdlSWFYS0VlVDNCUjdQaHl4Nkczb2VxWWpkeTdxNTk0SGlLcHk1?=
 =?utf-8?B?QUhobXpjWUIyRE1LaGlYRnYxUWdvaXNYS1VGODJnalRYT0VlZEk0b3RSRGZM?=
 =?utf-8?B?ditEa3ZXS3BrenBTclV2bkp1OE1JaVdseTRzY3l0dHJleXFQMWlXSmNJTnhj?=
 =?utf-8?B?SkhncTNBMDl0d3ppZFBNTUV1RDY1TXVaQ3V0LytZT3VDY1A1TDZJamhsZU45?=
 =?utf-8?B?a3A3RXpBYndUc1owV3Z0QkhBSloyUGNmdVdqU2ZGSHM2SXorYUNUOVVqdUgw?=
 =?utf-8?B?aGVIQjhPYitub0JYUWRYbjZzVEZmYlgyWmJib0ZpQ2ppTE5CdTFyUHg1Zm1j?=
 =?utf-8?B?MGQ3TTB1ejAzOHpjU1VOUXdPSlljZjNZamtBQjVsaEFuMjB1dVVDZVlTV1pN?=
 =?utf-8?B?SS9OUHlOUHpzRHI3clN6cFJ0YlFqUFVzbFN0dTJOZCs0c1AzUWZHZzNscFhJ?=
 =?utf-8?B?eGdnbGtnVEtUWnVUWnVJREZIdVczNERJQ3VYbWRvRC9YczJSWTNMTUdkVXla?=
 =?utf-8?B?WEpwanFiQklYa3JleUpZNHBxbVlDL1RtckZmdVNjaHltVmNmdEsyVjcrbWZo?=
 =?utf-8?B?RTczVHRNMFBHaFlmalZmbkozVGt0aDZLSDJLVkR3bUd0Z1BtMlhhanF5M2U5?=
 =?utf-8?B?cWRKWCtqc2puUGZsdmlxLzZpZ29PKzNSRmlLeWZTa2tnTHZQT3Fta1FCZEJr?=
 =?utf-8?B?RHo4dXc1K0RvUW5BcDdPT1dqN2JLMEgyekh4RWZDcFdmMHU4MWI1YzRBRkU4?=
 =?utf-8?Q?F7W5rLx2AbTl98DI=3D?=
X-Exchange-RoutingPolicyChecked: NAi+iNBEfxSUvVwEnrFxei3JYGv63QPwqwjMxOEdryTX11UgT56N/ODYOXeRlF4wqiY96Bdxfz3w+YJuYOeeO8e+EJ/SlOaRkV7vOH4emfdbeCW1JOMysy+iB7K/IfRrTk2LnYYXEIqB7m+UYF6EgNIXbqghAsXobeWHwhm0weAZUA3uEJ4us7bH1VjkJqcrQJIUZEwln/EGiT+KDxbFw2UrOxWs4kWqIALNBm3nXP/kwbH0Ny9dveRvuOoJeFpYMiAYFWsooKEhcj8reMsU6sNEQwNvl7voG5IAU8XM9NIkF3Prra0hNr2e5RcUo9W/Yp22NWOrAVp1PUK1kN/LDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcb1401-5764-4b69-6a2e-08def84236bc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:20:40.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDmMQNFyFctBTsDIb8O9mZXK3RqR53aTZT6vzAbTUsUVFBkC1hgtMIPLv2tr+7DDoklp94968PhckEHGroOSnaNy+S5yFZKWftt6vzEt3lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
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

--------------0pzM5l92EERRoOAPmAPuByIa
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mitul,

Thanks for the feedback.

On 8/11/2026 11:01 AM, Golani, Mitulkumar Ajitkumar wrote:
>
>> -----Original Message-----
>> From: Naladala, Ramanaidu<ramanaidu.naladala@intel.com>
>> Sent: 11 August 2026 00:48
>> To:igt-dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar<chaitanya.kumar.borah@intel.com>; Golani,
>> Mitulkumar Ajitkumar<mitulkumar.ajitkumar.golani@intel.com>; Naladala,
>> Ramanaidu<ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v2 2/2] tests/kms_vrr: add CMRR fixed and video mode
>> subtests
>>
>> Add test coverage to validate Content Match Refresh Rate (CMRR) behavior
>> across both fixed and video timing display modes.
>>
>> This introduces a shared helper library to support refresh-rate mode selection
>> and parsing, along with two new test cases covering fixed-mode and video-
>> mode scenarios.
>>
>> The new tests measure actual display refresh timing during CMRR operation
>> and compare it against the expected target rate to verify correctness. Video
>> mode coverage validates behavior across standard video timing rates, while
>> fixed mode coverage targets display modes that fall outside the standard
>> video timing set.
>>
>> Each test cycles through the relevant refresh configurations, applying and
>> resetting the appropriate settings between measurement passes to ensure
>> consistent and isolated test results.
>>
>> v2: Fix test issue.
>>
>> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 194
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 194 insertions(+)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 27f18e8d0..102998498
>> 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -32,6 +32,7 @@
>>   #include "igt_pm.h"
>>   #include "igt_psr.h"
>>   #include "i915/intel_drrs.h"
>> +#include "igt_vrr.h"
>>   #include "sw_sync.h"
>>   #include <fcntl.h>
>>   #include <signal.h>
>> @@ -80,6 +81,12 @@
>>    *
>>    * SUBTEST: lobf-dc3co
>>    * Description: Test DC3CO entry during LOBF.
>> + *
>> + * SUBTEST: cmrr-fixed-mode
>> + * Description:
> Add description
Sure. I will address in next revision.
>
>> + *
>> + * SUBTEST: cmrr-video-mode
>> + * Description:
>>    */
>>
>>   #define NSECS_PER_SEC (1000000000ull)
>> @@ -103,6 +110,8 @@ enum {
>>   	TEST_LINK_OFF = 1 << 10,
>>   	TEST_NEGATIVE = 1 << 11,
>>   	TEST_FORCE_RR = 1 << 12,
>> +	TEST_CMRR_FIXED_MODE = 1 << 13,
>> +	TEST_CMRR_VIDEO_MODE = 1 << 14, }; enum { @@ -580,6 +589,177 @@ flip_and_measure(data_t *data, 
>> igt_output_t *output, return 0; } +static +uint64_t 
>> wait_next_vblank_ts_ns(data_t *data, igt_crtc_t *crtc) { + union 
>> drm_wait_vblank vbl = {}; + + vbl.request.type = DRM_VBLANK_RELATIVE 
>> | igt_crtc_get_vbl_flag(crtc); + vbl.request.sequence = 1; + 
>> do_or_die(igt_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK,
>> &vbl));
>> +
>> +	return vbl.reply.tval_sec * NSECS_PER_SEC + vbl.reply.tval_usec *
>> +1000ull; }
>> +
>> +static void
>> +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
>> +			   uint32_t vrefresh, uint32_t cmrr_mode) {
>> +	uint32_t i;
>> +	bool front = false;
>> +	uint64_t last_vblank_ns, vblank_ns;
>> +	uint32_t err_frames = 0;
>> +	uint64_t frame_times_ns[TARGET_RR_SAMP_COUNT];
>> +	uint64_t exp_time_ns;
>> +	uint64_t total_frame_time_ns = 0;
>> +	uint64_t avg_frame_time_ns;
>> +	float avg_refresh_rate;
>> +	float expected_rr;
>> +
>> +	exp_time_ns = igt_kms_frame_time_from_vrefresh(vrefresh);
>> +
>> +	do_flip(data, &data->fb[0]);
>> +	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
>> +	last_vblank_ns = wait_next_vblank_ts_ns(data, crtc);
>> +
>> +	for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
>> +		front = !front;
>> +
>> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
>> +		vblank_ns = wait_next_vblank_ts_ns(data, crtc);
>> +		(void)get_kernel_event_ns(data,
>> DRM_EVENT_FLIP_COMPLETE);
>> +
>> +		frame_times_ns[i] = vblank_ns - last_vblank_ns;
>> +
>> +		if (frame_times_ns[i] > (exp_time_ns + (exp_time_ns / 2))) {
>> +			err_frames++;
>> +			last_vblank_ns = vblank_ns;
>> +			continue;
>> +		}
>> +
>> +		last_vblank_ns = vblank_ns;
>> +		total_frame_time_ns += frame_times_ns[i];
>> +	}
>> +
>> +	avg_frame_time_ns = total_frame_time_ns /
>> (TARGET_RR_SAMP_COUNT - err_frames);
> Guard TARGET_RR_SAMP_COUNT - err_frames == 0 before dividing.
Sure. I will address in next revision.
>
>> +	avg_refresh_rate = (float)NSECS_PER_SEC / (float)avg_frame_time_ns;
>> +
>> +	if (cmrr_mode == CMRR_VIDEO_MODE) {
>> +		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
>> +			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
>> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
>> +			     "CMRR refresh rate mismatch: "
>> +			     "measured avg_rr = %.3f Hz, "
>> +			     "expected_rr = %.3f Hz\n",
>> +			     avg_refresh_rate, expected_rr);
> The flat tolerance can fall below vblank-timestamp resolution at high refresh (≥ ~180 Hz), risking false negatives, and contradicts the rate-bucketed tolerance_table already in this file. Derive tolerance from the rate (and state the measurement-precision rationale).
For CMRR, the expectation is to use the smallest possible tolerance. I 
verified this with a 240 Hz refresh rate and did not observe any 
precision issues.
>
>> +	}
>> +
>> +	if (cmrr_mode == CMRR_NON_VIDEO_MODE) {
>> +		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
>> +			      (double)CMRR_DENOMINATOR;
>> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
>> +			     "CMRR refresh rate mismatch: "
>> +			     "measured avg_rr = %.3f Hz, "
>> +			     "expected_rr = %.3f Hz\n",
>> +			     avg_refresh_rate, expected_rr);
>> +	}
>> +
>> +	if (cmrr_mode == CMRR_DISABLE) {
>> +		expected_rr = (float)vrefresh;
>> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
>> +			     "CMRR refresh rate mismatch: "
>> +			     "measured avg_rr = %.3f Hz, "
>> +			     "expected_rr = %.3f Hz\n",
>> +			     avg_refresh_rate, expected_rr);
>> +	}
>> +
>> +	igt_info("Average RR (Hz): %.2f , Expected RR (Hz): %.2f, error frames
>> = %d\n",
>> +		 avg_refresh_rate, expected_rr, err_frames); }
>> +
>> +static
>> +void test_cmrr(data_t *data, igt_crtc_t *crtc,
>> +	       igt_output_t *output, uint32_t flags) {
>> +	uint32_t found;
>> +	double rr_from_mode;
>> +	drmModeModeInfo mode;
>> +	drmModeConnectorPtr connector;
>> +	int j;
> On platforms without intel_vrr_target_refresh_rate, igt_target_rr_debugfs_write asserts. Probe the node and igt_require CMRR support in a fixture/skip path so unsupported hardware skips cleanly.
sure. i will address in next revision.
>
>> +
>> +	prepare_test(data, output, crtc);
>> +	set_vrr_on_crtc(data, crtc, true, false);
>> +
>> +	if (flags == TEST_CMRR_VIDEO_MODE) {
> Use bitmask check flags & TEST_* instead of flags == TEST_* to follow the existing convention and keep this logic correct if multiple flags are combined in future.
sure. i will address in next revision.
>
>> +		for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
>> +			found =
>> igt_vrr_get_mode_with_video_timeing(output,
>> +
>> 	igt_vrr_standard_video_timing_fps[j],
>> +							&mode);
>> +			if (found) {
>> +				rr_from_mode =
>> igt_vrr_mode_line_refresh_hz(&mode);
>> +				igt_output_override_mode(output, &mode);
>> +				igt_info("Override mode:");
>> +				kmstest_dump_mode(&mode);
>> +				igt_display_commit2(&data->display,
>> COMMIT_ATOMIC);
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +
>> CMRR_NUMERATOR,
>> +
>> CMRR_VIDEO_MODE_DENOMINATOR);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   mode.vrefresh,
>> +
>> CMRR_VIDEO_MODE);
>> +
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +							    0, 0);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   rr_from_mode,
>> +							   CMRR_DISABLE);
> rr_from_mode (double) is passed into the uint32_t vrefresh parameter and the CMRR_DISABLE branch then compares against (float)vrefresh. For any non-integer native rate the expected value is truncated (e.g. 60.05→60, 59.94→59) while the tolerance is 0.02 Hz, so the disable check fails deterministically on exactly the modes the test selects. Pass the expected rate as a float/double end-to-end and compare against the real native rr_from_mode.
Sure. i will fix them in next rev.
>
>> +			}
>> +		}
>> +	}
>> +
>> +	if (flags == TEST_CMRR_FIXED_MODE) {
>> +		found = 0;
>> +		connector = output->config.connector;
>> +		for (j = 0; j < connector->count_modes; j++) {
>> +			mode = connector->modes[j];
>> +			rr_from_mode =
>> igt_vrr_mode_line_refresh_hz(&mode);
>> +
>> +			if (rr_from_mode - mode.vrefresh > 0.04) {
>> +				found = 1;
>> +				igt_output_override_mode(output, &mode);
>> +				igt_info("Override mode:");
>> +				kmstest_dump_mode(&mode);
>> +				igt_display_commit2(&data->display,
>> COMMIT_ATOMIC);
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +
>> CMRR_NUMERATOR,
>> +
>> CMRR_DENOMINATOR);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   mode.vrefresh,
>> +
>> CMRR_NON_VIDEO_MODE);
>> +
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +							    0, 0);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   rr_from_mode,
>> +							   CMRR_DISABLE);
>> +			}
>> +		}
>> +		igt_require_f(found, "No non-video-timing mode found.\n");
>> +	}
>> +}
>> +
>>   /* Basic VRR flip functionality test - enable, measure, disable, measure */
>> static void  test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output, @@
>> -1147,6 +1327,20 @@ int igt_main_args("drs:", long_opts, help_str,
>> opt_handler, &data)
>>   		}
>>   	}
>>
>> +	igt_subtest_group() {
>> +		igt_fixture()
>> +			igt_require_intel(data.drm_fd);
>> +
>> +		igt_describe("Test to validate CMRR in fixed mode.");
>> +		igt_subtest_with_dynamic("cmrr-fixed-mode") {
>> +			run_vrr_test(&data, test_cmrr,
>> TEST_CMRR_FIXED_MODE);
>> +		}
>> +
>> +		igt_describe("Test to validate CMRR in video mode.");
>> +		igt_subtest_with_dynamic("cmrr-video-mode") {
>> +			run_vrr_test(&data, test_cmrr,
>> TEST_CMRR_VIDEO_MODE);
>> +		}
>> +	}
>>   	igt_fixture() {
>>   		close(data.debugfs_fd);
>>   		igt_display_fini(&data.display);
>> --
>> 2.43.0
--------------0pzM5l92EERRoOAPmAPuByIa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Mitul,</p>
    <p>Thanks for the feedback.&nbsp;</p>
    <div class="moz-cite-prefix">On 8/11/2026 11:01 AM, Golani,
      Mitulkumar Ajitkumar wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Naladala, Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Sent: 11 August 2026 00:48
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Borah, Chaitanya Kumar <a class="moz-txt-link-rfc2396E" href="mailto:chaitanya.kumar.borah@intel.com">&lt;chaitanya.kumar.borah@intel.com&gt;</a>; Golani,
Mitulkumar Ajitkumar <a class="moz-txt-link-rfc2396E" href="mailto:mitulkumar.ajitkumar.golani@intel.com">&lt;mitulkumar.ajitkumar.golani@intel.com&gt;</a>; Naladala,
Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Subject: [PATCH i-g-t v2 2/2] tests/kms_vrr: add CMRR fixed and video mode
subtests

Add test coverage to validate Content Match Refresh Rate (CMRR) behavior
across both fixed and video timing display modes.

This introduces a shared helper library to support refresh-rate mode selection
and parsing, along with two new test cases covering fixed-mode and video-
mode scenarios.

The new tests measure actual display refresh timing during CMRR operation
and compare it against the expected target rate to verify correctness. Video
mode coverage validates behavior across standard video timing rates, while
fixed mode coverage targets display modes that fall outside the standard
video timing set.

Each test cycles through the relevant refresh configurations, applying and
resetting the appropriate settings between measurement passes to ensure
consistent and isolated test results.

v2: Fix test issue.

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
---
 tests/kms_vrr.c | 194
++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 27f18e8d0..102998498
100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -32,6 +32,7 @@
 #include &quot;igt_pm.h&quot;
 #include &quot;igt_psr.h&quot;
 #include &quot;i915/intel_drrs.h&quot;
+#include &quot;igt_vrr.h&quot;
 #include &quot;sw_sync.h&quot;
 #include &lt;fcntl.h&gt;
 #include &lt;signal.h&gt;
@@ -80,6 +81,12 @@
  *
  * SUBTEST: lobf-dc3co
  * Description: Test DC3CO entry during LOBF.
+ *
+ * SUBTEST: cmrr-fixed-mode
+ * Description:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Add description</pre>
    </blockquote>
    Sure. I will address in next revision.
    <blockquote type="cite" cite="mid:IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *
+ * SUBTEST: cmrr-video-mode
+ * Description:
  */

 #define NSECS_PER_SEC (1000000000ull)
@@ -103,6 +110,8 @@ enum {
 	TEST_LINK_OFF = 1 &lt;&lt; 10,
 	TEST_NEGATIVE = 1 &lt;&lt; 11,
 	TEST_FORCE_RR = 1 &lt;&lt; 12,
+	TEST_CMRR_FIXED_MODE = 1 &lt;&lt; 13,
+	TEST_CMRR_VIDEO_MODE = 1 &lt;<a class="moz-txt-link-rfc2396E" href="mailto:14,};enum{@@-580,6+589,177@@flip_and_measure(data_t*data,igt_output_t*output,return0;}+static+uint64_twait_next_vblank_ts_ns(data_t*data,igt_crtc_t*crtc){+uniondrm_wait_vblankvbl={};++vbl.request.type=DRM_VBLANK_RELATIVE|igt_crtc_get_vbl_flag(crtc);+vbl.request.sequence=1;+do_or_die(igt_ioctl(data-">&lt; 14,
 };

 enum {
@@ -580,6 +589,177 @@ flip_and_measure(data_t *data, igt_output_t
*output,
 	return 0;
 }

+static
+uint64_t wait_next_vblank_ts_ns(data_t *data, igt_crtc_t *crtc) {
+	union drm_wait_vblank vbl = {};
+
+	vbl.request.type = DRM_VBLANK_RELATIVE |
igt_crtc_get_vbl_flag(crtc);
+	vbl.request.sequence = 1;
+	do_or_die(igt_ioctl(data-&gt;</a>drm_fd, DRM_IOCTL_WAIT_VBLANK,
&amp;vbl));
+
+	return vbl.reply.tval_sec * NSECS_PER_SEC + vbl.reply.tval_usec *
+1000ull; }
+
+static void
+flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
+			   uint32_t vrefresh, uint32_t cmrr_mode) {
+	uint32_t i;
+	bool front = false;
+	uint64_t last_vblank_ns, vblank_ns;
+	uint32_t err_frames = 0;
+	uint64_t frame_times_ns[TARGET_RR_SAMP_COUNT];
+	uint64_t exp_time_ns;
+	uint64_t total_frame_time_ns = 0;
+	uint64_t avg_frame_time_ns;
+	float avg_refresh_rate;
+	float expected_rr;
+
+	exp_time_ns = igt_kms_frame_time_from_vrefresh(vrefresh);
+
+	do_flip(data, &amp;data-&gt;fb[0]);
+	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+	last_vblank_ns = wait_next_vblank_ts_ns(data, crtc);
+
+	for (i = 0; i &lt; TARGET_RR_SAMP_COUNT; i++) {
+		front = !front;
+
+		do_flip(data, front ? &amp;data-&gt;fb[1] : &amp;data-&gt;fb[0]);
+		vblank_ns = wait_next_vblank_ts_ns(data, crtc);
+		(void)get_kernel_event_ns(data,
DRM_EVENT_FLIP_COMPLETE);
+
+		frame_times_ns[i] = vblank_ns - last_vblank_ns;
+
+		if (frame_times_ns[i] &gt; (exp_time_ns + (exp_time_ns / 2))) {
+			err_frames++;
+			last_vblank_ns = vblank_ns;
+			continue;
+		}
+
+		last_vblank_ns = vblank_ns;
+		total_frame_time_ns += frame_times_ns[i];
+	}
+
+	avg_frame_time_ns = total_frame_time_ns /
(TARGET_RR_SAMP_COUNT - err_frames);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Guard TARGET_RR_SAMP_COUNT - err_frames == 0 before dividing.</pre>
    </blockquote>
    Sure. I will address in next revision.
    <blockquote type="cite" cite="mid:IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	avg_refresh_rate = (float)NSECS_PER_SEC / (float)avg_frame_time_ns;
+
+	if (cmrr_mode == CMRR_VIDEO_MODE) {
+		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
+			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
+		igt_assert_f(fabs(avg_refresh_rate - expected_rr) &lt;= 0.02,
+			     &quot;CMRR refresh rate mismatch: &quot;
+			     &quot;measured avg_rr = %.3f Hz, &quot;
+			     &quot;expected_rr = %.3f Hz\n&quot;,
+			     avg_refresh_rate, expected_rr);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The flat tolerance can fall below vblank-timestamp resolution at high refresh (≥ ~180 Hz), risking false negatives, and contradicts the rate-bucketed tolerance_table already in this file. Derive tolerance from the rate (and state the measurement-precision rationale).</pre>
    </blockquote>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">For
      CMRR, the expectation is to use the smallest possible tolerance. I
      verified this with a 240 Hz refresh rate and did not observe any
      precision issues.</div>
    <blockquote type="cite" cite="mid:IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	}
+
+	if (cmrr_mode == CMRR_NON_VIDEO_MODE) {
+		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
+			      (double)CMRR_DENOMINATOR;
+		igt_assert_f(fabs(avg_refresh_rate - expected_rr) &lt;= 0.02,
+			     &quot;CMRR refresh rate mismatch: &quot;
+			     &quot;measured avg_rr = %.3f Hz, &quot;
+			     &quot;expected_rr = %.3f Hz\n&quot;,
+			     avg_refresh_rate, expected_rr);
+	}
+
+	if (cmrr_mode == CMRR_DISABLE) {
+		expected_rr = (float)vrefresh;
+		igt_assert_f(fabs(avg_refresh_rate - expected_rr) &lt;= 0.02,
+			     &quot;CMRR refresh rate mismatch: &quot;
+			     &quot;measured avg_rr = %.3f Hz, &quot;
+			     &quot;expected_rr = %.3f Hz\n&quot;,
+			     avg_refresh_rate, expected_rr);
+	}
+
+	igt_info(&quot;Average RR (Hz): %.2f , Expected RR (Hz): %.2f, error frames
= %d\n&quot;,
+		 avg_refresh_rate, expected_rr, err_frames); }
+
+static
+void test_cmrr(data_t *data, igt_crtc_t *crtc,
+	       igt_output_t *output, uint32_t flags) {
+	uint32_t found;
+	double rr_from_mode;
+	drmModeModeInfo mode;
+	drmModeConnectorPtr connector;
+	int j;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
On platforms without intel_vrr_target_refresh_rate, igt_target_rr_debugfs_write asserts. Probe the node and igt_require CMRR support in a fixture/skip path so unsupported hardware skips cleanly.</pre>
    </blockquote>
    sure. i will address in next revision.
    <blockquote type="cite" cite="mid:IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	prepare_test(data, output, crtc);
+	set_vrr_on_crtc(data, crtc, true, false);
+
+	if (flags == TEST_CMRR_VIDEO_MODE) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Use bitmask check flags &amp; TEST_* instead of flags == TEST_* to follow the existing convention and keep this logic correct if multiple flags are combined in future.</pre>
    </blockquote>
    sure. i will address in next revision.
    <blockquote type="cite" cite="mid:IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		for (j = 0; j &lt; igt_vrr_standard_video_timing_fps_count; j++) {
+			found =
igt_vrr_get_mode_with_video_timeing(output,
+
	igt_vrr_standard_video_timing_fps[j],
+							&amp;mode);
+			if (found) {
+				rr_from_mode =
igt_vrr_mode_line_refresh_hz(&amp;mode);
+				igt_output_override_mode(output, &amp;mode);
+				igt_info(&quot;Override mode:&quot;);
+				kmstest_dump_mode(&amp;mode);
+				igt_display_commit2(&amp;data-&gt;display,
COMMIT_ATOMIC);
+				igt_target_rr_debugfs_write(data-&gt;drm_fd,
+							    crtc-&gt;crtc_index,
+							    mode.vrefresh,
+
CMRR_NUMERATOR,
+
CMRR_VIDEO_MODE_DENOMINATOR);
+
+				flip_and_measure_target_rr(data, crtc,
+							   mode.vrefresh,
+
CMRR_VIDEO_MODE);
+
+				igt_target_rr_debugfs_write(data-&gt;drm_fd,
+							    crtc-&gt;crtc_index,
+							    mode.vrefresh,
+							    0, 0);
+
+				flip_and_measure_target_rr(data, crtc,
+							   rr_from_mode,
+							   CMRR_DISABLE);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
rr_from_mode (double) is passed into the uint32_t vrefresh parameter and the CMRR_DISABLE branch then compares against (float)vrefresh. For any non-integer native rate the expected value is truncated (e.g. 60.05→60, 59.94→59) while the tolerance is 0.02 Hz, so the disable check fails deterministically on exactly the modes the test selects. Pass the expected rate as a float/double end-to-end and compare against the real native rr_from_mode.</pre>
    </blockquote>
    Sure. i will fix them in next rev.&nbsp;
    <blockquote type="cite" cite="mid:IA1PR11MB63487B4703088EC110ED9D40B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			}
+		}
+	}
+
+	if (flags == TEST_CMRR_FIXED_MODE) {
+		found = 0;
+		connector = output-&gt;config.connector;
+		for (j = 0; j &lt; connector-&gt;count_modes; j++) {
+			mode = connector-&gt;modes[j];
+			rr_from_mode =
igt_vrr_mode_line_refresh_hz(&amp;mode);
+
+			if (rr_from_mode - mode.vrefresh &gt; 0.04) {
+				found = 1;
+				igt_output_override_mode(output, &amp;mode);
+				igt_info(&quot;Override mode:&quot;);
+				kmstest_dump_mode(&amp;mode);
+				igt_display_commit2(&amp;data-&gt;display,
COMMIT_ATOMIC);
+				igt_target_rr_debugfs_write(data-&gt;drm_fd,
+							    crtc-&gt;crtc_index,
+							    mode.vrefresh,
+
CMRR_NUMERATOR,
+
CMRR_DENOMINATOR);
+
+				flip_and_measure_target_rr(data, crtc,
+							   mode.vrefresh,
+
CMRR_NON_VIDEO_MODE);
+
+				igt_target_rr_debugfs_write(data-&gt;drm_fd,
+							    crtc-&gt;crtc_index,
+							    mode.vrefresh,
+							    0, 0);
+
+				flip_and_measure_target_rr(data, crtc,
+							   rr_from_mode,
+							   CMRR_DISABLE);
+			}
+		}
+		igt_require_f(found, &quot;No non-video-timing mode found.\n&quot;);
+	}
+}
+
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
static void  test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output, @@
-1147,6 +1327,20 @@ int igt_main_args(&quot;drs:&quot;, long_opts, help_str,
opt_handler, &amp;data)
 		}
 	}

+	igt_subtest_group() {
+		igt_fixture()
+			igt_require_intel(data.drm_fd);
+
+		igt_describe(&quot;Test to validate CMRR in fixed mode.&quot;);
+		igt_subtest_with_dynamic(&quot;cmrr-fixed-mode&quot;) {
+			run_vrr_test(&amp;data, test_cmrr,
TEST_CMRR_FIXED_MODE);
+		}
+
+		igt_describe(&quot;Test to validate CMRR in video mode.&quot;);
+		igt_subtest_with_dynamic(&quot;cmrr-video-mode&quot;) {
+			run_vrr_test(&amp;data, test_cmrr,
TEST_CMRR_VIDEO_MODE);
+		}
+	}
 	igt_fixture() {
 		close(data.debugfs_fd);
 		igt_display_fini(&amp;data.display);
--
2.43.0
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------0pzM5l92EERRoOAPmAPuByIa--
