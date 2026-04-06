Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A98F46C4E
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 16:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CD110E283;
	Mon,  6 Apr 2026 16:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bu/LViy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996A010E283
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775493288; x=1807029288;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=psNwu++qwJlo1K02iGP2W6HCtklV1t8Nrhb0GygLN7M=;
 b=bu/LViy667DDuf0hr+fy8jFwmTbHWR5XAfbAcgt1TnEvJcoHksPbTa8j
 47UUHyRQ+n2VCml8SLBPWVm4EeE+5M9+CaQoQSukzQvaPti5Wek/mt89p
 SSUWBsnjM0NPnWewxLz8XSupo61IHNSoEvgF8EYlTV+mGMsVSuezPaIo3
 kYZea3kVATD04Jy1L38vO8j5BHKy4bNBJ+KVdeyLu+3laHqDEHH+cTTIU
 1AblwmT1YrPAe5UskR8AHkbT24QC1GrLX+ioAZlOKrIWUjChCD18Gwurv
 HwfNWcQoKVyewN6QgCl1bADPU8ZG6ZkeYhl+Vue1WgmCyzctd3kLM2EOv w==;
X-CSE-ConnectionGUID: eQgYLmC+Th6hQhD8M7asww==
X-CSE-MsgGUID: jT1otpcuTemxaRG2XpQ8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76323375"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208,217";a="76323375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 09:34:48 -0700
X-CSE-ConnectionGUID: Yd9MWbtJRaaI8rPs7hhWXA==
X-CSE-MsgGUID: ccDplAF5Tv2M6HHEjcOp9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
 d="scan'208,217";a="227822797"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 09:34:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 09:34:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 09:34:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 09:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4czHKPy1T25iUOV6aSJrK6axtDdClWd5wdudM9p39cqMg2LWeeqUeAU49gEusK1wwizdwWLTldeShfqOP9KhDk8ek4IyftCmpCuF3shDHIFIGox0A1h/d7Vziwt1mVsSiNBMyTvwGUPdAfTZZSygMJo9iK7Vi6YHAo4AoK4lvXhI9BRHS29VxyYwGREgxa70w98bbV2UQpSFjhlTkRgokhPYXL9ZgqBBItH07Dek7CtsrYI+VgQ0Gd2J+iYMHIpgMdYGMOp+qIWTiRaaGVtpoQ0qlHI4HG6P+b97MykwfkyHQ4lb6Ov5kUUj0x1PtnLUAsjURQ9cVtOAiOhSZaj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xf2OLHu4RLWFPEflvnkmmYMjt70h5s/2wWxW5Skhr5M=;
 b=Ilmsr1rEjYVNCdAPA4q2pyPteX12RZe3BZt7Z5X3i9f3zyzFLeDnuMb5gVq0O9lxb/jiX/nwYLFER39xST542Zx1OAmUdZjImVh37epXp/xa8Pa2682imcnogZYgGBylwwFvsDnfSYCmmHfzdK/aDWnFwALY8IZp/Ol9peqtT59PzlQf404+1rz2tsRAUrld5lcdEaJEWPgYIAb6hjpHAjXjyd48idzcWoQoIN+W1Qian+Gbr7QajbuFu7klAoqGSPvJMUvlL+f4/nYs+gx8conxwBfdhhd2NYY7g/0IeClJ0EC1/lLFf3J1l6IyyWKSbAIYsyHW/aVNHP3OYWs4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 16:34:43 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 16:34:43 +0000
Content-Type: multipart/alternative;
 boundary="------------JYUdJJDykwOkzr5EglfAR9kf"
Message-ID: <13484d88-3cd6-429d-a083-b7af1fd93aac@intel.com>
Date: Mon, 6 Apr 2026 22:04:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: tools/gputop: Fix zero output when stdout is not a terminal
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
 <14383743-685c-4d61-9c58-b1b563f588ab@intel.com>
 <PH7PR11MB82525EF1740193ACABD30E52895DA@PH7PR11MB8252.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <PH7PR11MB82525EF1740193ACABD30E52895DA@PH7PR11MB8252.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: c04094d5-216e-4607-0069-08de93fa6801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: uAm3BORiiinarwhU+WT+TILMVx2S6QRqUgkOKIU0v8ZqOMV8uNNXS0lYnBLMlKc/j+8O8Ypd+26UblC10lm0etFYxYNyabv2AMrUCHHr7BZ1i/CDHKF6HKVjtibDATanAMSzSRMrcCi88rMTDR8oynghrTkeOGXxzuagDa84vvNMYHXJDBFuLkIGVU8k1IlYbu3ftnArdysijNXnGKrjhkYuDBmgIrqBny1ttrmWd/Xng0niHo+rARBD0YpYHzZzFplAd+j/aV0viW1aXmbVgzyOjFdHrIVHOWyM5vh4GPydQBjXx0GPb45LjLD7EcTNmqEs8DKgpRVC1tmTMEvz17tQp0hM0TMHZInIEZdWRZGyWEax7RtrYtxyV+5/e+r6FL7RPdjdYi55iRE1bSYnyc6RCAeLI0Q1XduxvewFm96vMIXKdXDkwU41qDlfatlTeTdUQwzaGeAL6je/xFuRGE8obzdIpDFCQUu2iFkVbuGVWp1E8grKN8Hp5ACGpNb/kDytkU3FXXAr+Cc4Wv1tHCZXrx5WdJYKkGkyJTxyzivbdmOf4TSt8ccfPafPpCzjauVGtw+yiapHL+5ctYTVgOBKRdQoNZWRZZqzWycUZwG2lOox2P2lcOa+2aA+1DgEL4QYEu2hLxF9r2yP2HauUCnt++1IM31IhCpf+lbcSiRwFy+jlCfhv9+IjmycukFScQo3O+PkccTJxVzdhaficxKb7i+nKB18ErJvqyRo6E4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFaWEpDVXRaTEc1allBVU9GT0JBR1I5Ky9Sc05nNHZrR1ZGdHRjNnY3TzM1?=
 =?utf-8?B?Yk9qQVlPKzQvN05XQzZGeUVGSk14N29aSFNoR3lwTFRnUEpqcHVvUU81RVpu?=
 =?utf-8?B?NThuOUJzY2lBRFNjVlBkZ01HTktZeEhVQzJtZWxUeVJuLytScnRrM1k2eFdH?=
 =?utf-8?B?RUFJZ2ptVFJiVWlvWHpjVDdNOWRycExnczBBQWljMU9jSW56TForL2MxQUJu?=
 =?utf-8?B?K29nV2pCRFNDTG1aWVlZdjMvUGZ3dW5KdndVWkNLYk1xTnhWNGkxcFZEemdy?=
 =?utf-8?B?T045TEtVb2lOaXZpV0lOVHRnOEVpTHJ5T3g3QmNYRkN3VFFQeFAxbjJObmJM?=
 =?utf-8?B?aFpPc0haaFIwTjF4aUpSWkFEM3VzdDRKV1dEWWVqN3p3VjZYeDc1TjFscVBn?=
 =?utf-8?B?QWV2Wk1nOUtuSkw2WWxZLzZVSnZ1bnRiSnBCM3c0WEFDZG9JclRkdlVsa0hs?=
 =?utf-8?B?V1lzeEwzRjBxT1dZVm00Zk9Md3IyWXNrUXBVT2dUZWxUWmZ2R05KT21zMStj?=
 =?utf-8?B?bVUzZ0Y2bEVIZm1ZNWh0dmhrMXdxWWJVa254M29ONU1ET3YyRHdYRWVrNERG?=
 =?utf-8?B?aDFkVFA3L2NqWFdqdURGRGQxYTdsSG83SUZtS3YrWHJQOXBlVzVlYVR6dTgy?=
 =?utf-8?B?UkhjUURrWEV1K3lHcFFyTExKempOVXNoaVpPeVFyc0U3K2dXVEdMVVdVR2po?=
 =?utf-8?B?bGpVdER3MG1ZWWFrYWdiZ1lkenZhZkltMG9UcGVXRFYzSG5QTUlFc09JYXpq?=
 =?utf-8?B?NFZ4Tk1SYTNoR2dCUmo1VDNMM2U2VFVBZmt6OHhHcEt3QStUMXBVYXUyRFFt?=
 =?utf-8?B?RTVRdGplTktrejdSVnArWE14Ulkzbm5OcjZhKytyc3g3WkFqaFpTZmQvTFFq?=
 =?utf-8?B?M3pja1BoOXZPZEl6TUx6czl3TWxERzQrSTdweDhyakE4Z1Bkb0RyR0tjQ2o2?=
 =?utf-8?B?Rzh2Y1VKVG1SNGxYRzlDMS9DSmJYMFB1ZXJBUWIrSnQxQnFtaVdaUmJyZ1Bs?=
 =?utf-8?B?a3lNbmZIQmxpWjBYM1RtSzZkdDFseGE3cDZYbEVmZVpVVVRtdHE2UXBBa2xU?=
 =?utf-8?B?MTF6bW9RNXM1OEEyWHJGMkVKaXQ3R2thWkpQMEE5SDR6V2FOeDJQRWtmRk9a?=
 =?utf-8?B?UTliME1jS3NXdjFnL2U1cDJLQ3hSSy9maUUrT3BnTUNVVW5Cai9nclZSd25V?=
 =?utf-8?B?N0hvM1RLYWZJN0R0NzNOS2phOW5CcEFFTUtJZ01PSFFzWHJNdy9Nc3pBUEgw?=
 =?utf-8?B?UExLRlNyQldIMEY0aENhKzFXTC9LM3RjRGd2STB5V3l2cm1WcjdTT3JWbWh1?=
 =?utf-8?B?eG5jYmw3bytheUtWcWFSRGh5T1BEQ0dJVDhMVVVQenFLNkRIZ1FmWkZIMkNW?=
 =?utf-8?B?VkdkZHRGb0pva0hHNkhnSlo0bno1Zk5IZTBoRTZxS3BDNWhySUp0ejdRcmFz?=
 =?utf-8?B?cjMrUWZrMWdtWHFlNFMwTitBN3JnN3ZTNERYaTVkRGZRN2NOaFJ2eGlPM0R5?=
 =?utf-8?B?dkV5UWZiS2l0WC8wVy9sNWF6OE51MmxHQWxKVmU1SlZqbVNDcy9xZDk0OWpS?=
 =?utf-8?B?a0U5Z25OZXJxcStRMHlVSFA4ekt5eVM3WTJpL3ZFemVpZGZrYjkrMXFPVEkw?=
 =?utf-8?B?NlNnTmhLeE1raFpoUWt5bFhMQURlcUxlUWxEZk9hZUtITjNtbVBJRG91ZXgr?=
 =?utf-8?B?c29DazVsZCtmMlhvTWdwZXVudmhRdkZJbXRhN2h6L0s1a3dMV2dqUk1ZSit4?=
 =?utf-8?B?SzVjYk93VGNiNnNTRXY5N2luK0F3b01uSUF4UlJyQUNWblcvMUowS2Vrbyt1?=
 =?utf-8?B?WWxhMHRtWnpQT0VpRnlWdzNCMUYxTjRkQVJKSEtkSFZBTzN4L2s5cUZQWkIy?=
 =?utf-8?B?MVBNazA2YmFCazJpNEsxVnAwMlRoN3pya2NoUzZVOGFLa2NwQk95NmlER3Nt?=
 =?utf-8?B?ZFpLbTlEWk1WR2pzbEQ5Mlh0RmIzay8vQ0xyOENZL1graFhvRmNKTVdIY0xz?=
 =?utf-8?B?SWpIMG9uSjJQdWhYeHhoOUJqVlE1Y3R2YnI1T013bzFVNUNqZzgwdG9WbElO?=
 =?utf-8?B?bHoreVJQelVOKzVpUDVKK1ptcHRBcS8rSnNZdWFuc3NmclJWRHAzQ3M1U2cz?=
 =?utf-8?B?SFEvaHdPbmtYWiswWnFJTnFhOWFvdlhYS3I5cmxmYnpHWk5kN2VtQnZ6aGpj?=
 =?utf-8?B?T1JoWEU4Q29Qa2FVMExRelZhazk4N0swVGd1QjVjd2x1M2k3SythbE1vUlcz?=
 =?utf-8?B?Tm5PSWc3TkZIMWNZWE1kbG5kRVdoTFF2eDh3emtRVFF1blZ5SG5sUGFKc1gw?=
 =?utf-8?B?TkRQUE5mL0R2SGZaUi81RG9MaFJOUUswRXZWYWZRWWpzOHpXaTUwYWVIN1ZR?=
 =?utf-8?Q?ReWjdr138fLRai28=3D?=
X-Exchange-RoutingPolicyChecked: U9MIruksiIfgXnMBp3tFy+LzgrSA4QP3dt8RVOD3DzkF0FDqKRjxwLnlhF/X8Y6KsWA73opjD96oXomWNIbHuoe7/fmQz9sx+vp3B5J4git0BiCOXZfUM3RT3n1TlhupNpG1EVWeH8aKxbPSwX+L5c+3UHaalopexzDK3g/OyU9+2M5LVuMOEUzP0dXLXi+B+hJrmLZJCWFQKK7Zus21hvSUL2EXurikKDc8QsHlEDrt7FXAmGdY4ufLPPBSyWFf/1CkF/2UVG4O6BIimOsHc5v0Emxe872BihDRnJW+l1T6PgHNfnCyNGJMJ9ImP9uyhU45vT6qr1YkqwJut8SmpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c04094d5-216e-4607-0069-08de93fa6801
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 16:34:43.2632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1tPWAK63jMUBHwnAqbLBScKlTITa/8uK/+0Egu7/8H/aN25S5LWy0JiQZdmKUjKV3J39nZzOBdWbSyfAXAnYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
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

--------------JYUdJJDykwOkzr5EglfAR9kf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vidya,

On 06-04-2026 11:11, Srinivas, Vidya wrote:
>
>> -----Original Message-----
>> From: Purkait, Soham<soham.purkait@intel.com>
>> Sent: 06 April 2026 10:27
>> To: Srinivas, Vidya<vidya.srinivas@intel.com>;igt-dev@lists.freedesktop.org;
>> Konieczny, Kamil<kamil.konieczny@intel.com>
>> Subject: Re: tools/gputop: Fix zero output when stdout is not a terminal
>>
>> Hi Vidya,
>>
>> On 02-04-2026 19:15, Vidya Srinivas wrote:
>>> When gputop output is redirected to a file or pipe, such as:
>>>
>>>     gputop -n 5 -d 1 > results.txt
>> Isn’t only stdout (fd 1) redirected to the file here?
>>
>> I guess some thing like "echo test | ./gputop" would be returning the default
>> value (-1 in this case) for con_h.
> Hello,
>
> Many thanks for the review.
> I will update the patch like this. Should be okay?
>
> if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) == -1 &&
>      ioctl(STDIN_FILENO, TIOCGWINSZ, &ws) == -1 &&
>      ioctl(STDERR_FILENO, TIOCGWINSZ, &ws) == -1) {

I assume it's better to keep this : "if (ioctl(0, TIOCGWINSZ, &ws) == 
-1)" as is. As it won't make any  issue if the gputop output is 
redirected to any file or so (which only involve stdout).  The 
expression  will only be true when stdin is not a terminal, may be 
during running gputop in a ci.
And Its better to assign the default values to con_w and con_h in main. 
(please see below)

>      ws.ws_col = 80;
>      ws.ws_row = 50;
> }
>
> Regards
> Vidya
>
>>>     gputop -n 3 -d 2 | grep rcs
>>>
>>> ioctl(0, TIOCGWINSZ) fails with -1 since stdin is not a terminal.
>>> update_console_size() then returns without setting *w and *h, leaving
>>> con_w and con_h at their initial value of -1.
>>>
>>> The main display loop uses 'if (lines >= con_h) break' to limit output
>>> to the terminal height. With con_h = -1, the condition (0 >= -1) is
>>> immediately true on the very first line, causing all client output to
>>> be silently suppressed. The result is that gputop produces only ANSI
>>> clear- screen escape sequences and zero actual data.
>>>
>>> This affects anyone using gputop in automation, CI pipelines, or any
>>> non-interactive context on Linux or Android where output is redirected
>>> or piped.
>>>
>>> Fix this by falling back to a default console size of 80x50 when the
>>> ioctl fails, consistent with the existing fallback for serial consoles
>>> (where ws_col and ws_row are both 0).
>>>
>>> Signed-off-by: Vidya Srinivas<vidya.srinivas@intel.com>
>>> Reviewed-by: Kamil Konieczny<kamil.konieczny@linux.intel.com>
>>> ---
>>>    tools/gputop.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/gputop.c b/tools/gputop.c index
>>> 9b2e8cb6f..112ec5ddb 100644
>>> --- a/tools/gputop.c
>>> +++ b/tools/gputop.c
>>> @@ -505,8 +505,11 @@ static void update_console_size(int *w, int *h)
>>>    {
>>>    	struct winsize ws = {};
>>>
>>> -	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
>>> +	if (ioctl(0, TIOCGWINSZ, &ws) == -1) {
>>> +		*w = 80;
>>> +		*h = 50;

Imho instead of setting the values (*w = 80;*h = 50) here , it's better 
to initialize these as default values in main as "int con_w = 80, con_h 
= 50;"

Thanks, Soham

>> How about assigning the values during initialization in the main function ?
>>
>> eg : int con_w = 80, con_h = 50;
>>
>> Thanks,
>> Soham
>>
>>>    		return;
>>> +	}
>>>
>>>    	*w = ws.ws_col;
>>>    	*h = ws.ws_row;
--------------JYUdJJDykwOkzr5EglfAR9kf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Vidya,</p>
    <div class="moz-cite-prefix">On 06-04-2026 11:11, Srinivas, Vidya
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH7PR11MB82525EF1740193ACABD30E52895DA@PH7PR11MB8252.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Purkait, Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
Sent: 06 April 2026 10:27
To: Srinivas, Vidya <a class="moz-txt-link-rfc2396E" href="mailto:vidya.srinivas@intel.com">&lt;vidya.srinivas@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>;
Konieczny, Kamil <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@intel.com">&lt;kamil.konieczny@intel.com&gt;</a>
Subject: Re: tools/gputop: Fix zero output when stdout is not a terminal

Hi Vidya,

On 02-04-2026 19:15, Vidya Srinivas wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">When gputop output is redirected to a file or pipe, such as:

   gputop -n 5 -d 1 &gt; results.txt
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Isn’t only stdout (fd 1) redirected to the file here?

I guess some thing like &quot;echo test | ./gputop&quot; would be returning the default
value (-1 in this case) for con_h.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hello,

Many thanks for the review.
I will update the patch like this. Should be okay?

if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &amp;ws) == -1 &amp;&amp;
    ioctl(STDIN_FILENO, TIOCGWINSZ, &amp;ws) == -1 &amp;&amp;
    ioctl(STDERR_FILENO, TIOCGWINSZ, &amp;ws) == -1) {</pre>
    </blockquote>
    <p>I assume it's better to keep this : &quot;if (ioctl(0, TIOCGWINSZ,
      &amp;ws) == -1)&quot; as is. As it won't make any&nbsp; issue if the gputop
      output is redirected to any file or so (which only involve
      stdout).&nbsp; The expression&nbsp; will only be true when stdin is not a
      terminal, may be during running gputop in a ci.<br>
      And Its better to assign the default values to con_w and con_h in
      main. (please see below)</p>
    <blockquote type="cite" cite="mid:PH7PR11MB82525EF1740193ACABD30E52895DA@PH7PR11MB8252.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
    ws.ws_col = 80;
    ws.ws_row = 50;
}

Regards
Vidya

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">   gputop -n 3 -d 2 | grep rcs

ioctl(0, TIOCGWINSZ) fails with -1 since stdin is not a terminal.
update_console_size() then returns without setting *w and *h, leaving
con_w and con_h at their initial value of -1.

The main display loop uses 'if (lines &gt;= con_h) break' to limit output
to the terminal height. With con_h = -1, the condition (0 &gt;= -1) is
immediately true on the very first line, causing all client output to
be silently suppressed. The result is that gputop produces only ANSI
clear- screen escape sequences and zero actual data.

This affects anyone using gputop in automation, CI pipelines, or any
non-interactive context on Linux or Android where output is redirected
or piped.

Fix this by falling back to a default console size of 80x50 when the
ioctl fails, consistent with the existing fallback for serial consoles
(where ws_col and ws_row are both 0).

Signed-off-by: Vidya Srinivas <a class="moz-txt-link-rfc2396E" href="mailto:vidya.srinivas@intel.com">&lt;vidya.srinivas@intel.com&gt;</a>
Reviewed-by: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
---
  tools/gputop.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/gputop.c b/tools/gputop.c index
9b2e8cb6f..112ec5ddb 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -505,8 +505,11 @@ static void update_console_size(int *w, int *h)
  {
  	struct winsize ws = {};

-	if (ioctl(0, TIOCGWINSZ, &amp;ws) == -1)
+	if (ioctl(0, TIOCGWINSZ, &amp;ws) == -1) {
+		*w = 80;
+		*h = 50;</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>&nbsp;<span style="white-space: pre-wrap">Imho </span>instead of
      setting the values (<span style="white-space: pre-wrap">*w = 80;*h = 50) here ,  it's better to initialize these as default values in main as &quot;int con_w = 80, con_h = 50;&quot; </span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Soham</span></p>
    <blockquote type="cite" cite="mid:PH7PR11MB82525EF1740193ACABD30E52895DA@PH7PR11MB8252.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">How about assigning the values during initialization in the main function ?

eg : int con_w = 80, con_h = 50;

Thanks,
Soham

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  		return;
+	}

  	*w = ws.ws_col;
  	*h = ws.ws_row;
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------JYUdJJDykwOkzr5EglfAR9kf--
