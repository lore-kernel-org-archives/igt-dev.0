Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B4ACD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 08:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E6510E0A1;
	Wed, 13 May 2026 08:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIySd0Kv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D47E10E0A1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778660833; x=1810196833;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=HnyLOtiI1oTO5IiCdb1Alc4R7qwmEfVosWDIKhj6qIY=;
 b=IIySd0KvFcz0hGqw4tjnDdASFQRvdc7N4MdbQLzLINwemUsdmbbsv5SO
 hTdYs+D2vx7+5KCbTcQUm/ew9wB9mawzSD7UYi+K41NBrlTVljZWMGYBI
 KQmRXNTxQ6TDsUYch2SwucuaQMzk+B0d62BFuhGjnDUPQ/+ojh2feQr4y
 UgpjPeUhK6ywzZc+Cuv69HSMNNWU3JMBusnXda/ACsKOtRqz+kChgpoO9
 vYppLdZYNhvP9VIZFmu6mSi2ycbC9G2Rnjp+pmIcgl0BmlTNYs4tJhRyh
 umsmcBniR5g7Aw62C3xd8GPRfO7DYOTlEhZ/X6FrjicebVKjvSqhl3qc9 Q==;
X-CSE-ConnectionGUID: lInDK2A3TMCgzOTaPHbM4A==
X-CSE-MsgGUID: q2oVJ7uwSqyW/3gZXnMb+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79438730"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208,217";a="79438730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:27:13 -0700
X-CSE-ConnectionGUID: /kNHgFVPQqqqKthpWcy/LA==
X-CSE-MsgGUID: G5rP5YHJTDOsU7ujRQATvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
 d="scan'208,217";a="234953512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:27:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:27:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 01:27:12 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:27:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMAkxiVY5Lym8WBuhTykKz8HnpYh5nlQOdX6rC3HDVbUkUol/MJwnduLO9CsL8e47rLv0ZgtyzpBH0pmT/xBcJq9HLTgfek+oHjzvVlNZA5pTkovTXBNQ6ZFhmZ7fP0ktEIBx/MsqyZKKb0KALuxlZpNvlHMgVhm7TP6GaBBRd3pealJxEcrRFx7hkNaWWq5tsU9RDnWtoQEGS5F+oEiSyx9HEewqxXmYgPaM/s/ghKwBtBzH7h0lVsIICu5ZvtCxp/CRimF7garVkvQ2N9m5NLBQW2R7TO9WaRfiNmr1SSotQpgAtDkDV/5mbFb2uCNuxjBIW2cQOoYRiNaq1qb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcvsxWyfBHjJzJ6or0lcySa81B6V9auZM1gdsKDkpc8=;
 b=SVtx4rBdxCnYAPPtqXs7q/f08aREGGMMO2fawsF7QJBW8oxtWKTf5ulWZm+EyoygBkDJbLWVHFSBtZVZz/muyPWMtiqxrhyAu2rL9suxaLYH2aiOnhdDISsP446ZtniOvVrV/e3/aNootwgM0pstqLK/8jZkJJTAzTx2hB62vmEJiWQsrNVIOZhzHEgAgyVZR/1Nys000q+DBlYlpGs6EKKD0gZUSja+k1BTG+2K6BTe1zKXA/zGaE1AAJw15FMM6vE4WuyJCtZP3WyMsReY7pVUMDrhH8V1PJ3zkwKfmznEYlL2TqFwL/5CuYPV53Xbem/ZJ8mHl7aRPKuAAGXOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 08:27:09 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:27:09 +0000
Content-Type: multipart/alternative;
 boundary="------------xKevOX4Mkf2U0HpUHIyDOc05"
Message-ID: <53c51d4f-7a8a-421f-80a4-45cb7a3efcd3@intel.com>
Date: Wed, 13 May 2026 13:57:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 6/7] tests/intel/kms_pm_dc: Add new test for
 DC3CO recovery after DC6
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <mohammed.thasleem@intel.com>
References: <20260511171820.461666-1-jeevan.b@intel.com>
 <20260511171820.461666-7-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260511171820.461666-7-jeevan.b@intel.com>
X-ClientProxiedBy: MA5P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::16) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CH3PR11MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 0518821f-5bfa-4533-e6cf-08deb0c96c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|18002099003|22082099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 3SkSub+On8/3aTqiQC08ass+2KDMhBVSujg/7iW0jpVy+IzpsqA627D4YVxBWCqkneb5jMJovQhG4SGCaUMJqzQ/h10V6HjQOEuGqaTRbmS3MSaAQDWJIfLG6sm1rnSkkzCsk3A0CFlCIlOYez/EefJTBDLzwT9p8eJKyx5VP+rsQ95so2+OM3D+C2NjIBph5Ls8kdNUe+O8lCzDtQUwqs6asT0Sfo3T8sStPHXPuKaZVl+YT3zVDnH1OuqEhRp20fp398+/h3AMw82xh5IpxcbYc4VLBYjHuP0/x61fzcQU2f1F3ccZ5gNdTUJQch8uR9EUIIt9UZLmaq4SgnTemCk8pYQJ7lh1R24y1z8ANlUqY2593Kw5r41ZpU/vQ4qSl2LOaco3cNYedK0uLEQ8+d+ESjEZksZMXx6MwBpWw3BpFDYlEeErsWwOc+7vnyQh7RnocWWNaXSPZv6ofrCh/a8CQyRTh87R7TIe6ecDWJN4krE3K1/pmjkbpSNCsiyYhWSHrYi5281oRVq7UjR3tBCgdo4EV5373IHqpUSwh22vaWpPK165fKAzKi75Dp6ZxV8jvju8mH9Jy0I+aXflK9aZ8UY1eEv3nxyMSJcfn6/k/uShzAhbbOchExlI8f8LhoWnoAziCnJ6l2M4JFqDJ2+4MxjFbaU29ZWRJ5xmsuBF1zjZic2k2AWIqfpmYgoH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(18002099003)(22082099003)(3023799003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pEYm8zMkZkaXB6bXJjbG45R1VtNHdCZVg1TnZwOWVlMUNGWXlxYzZkb2hM?=
 =?utf-8?B?THBHM1dOejllNnRhN09ZeFl6Ni93cnBRUWNXME9DQ1FGSHF4bnVtZ2lDd0FH?=
 =?utf-8?B?QzlweUJTV0xUTXNodTd1dTl0K3AzaFZkcUlzOVA1c0swblFFdHIzdEMwcjI0?=
 =?utf-8?B?WnVRVGEwYjZMZnQ3eUtMbFFaRmZqdmJ1WkZ1TTlrdkpTWnhoYmdzNjk5TmtL?=
 =?utf-8?B?YldOU0VCbXIwNWNuUjJoUlNLdVZNNGhJd1JzWUNhenZQMi9qWFpPc0JsUm56?=
 =?utf-8?B?SkdWOWh3V3pvOXBlUDVvTElZb0lUMzMvVUtmZ1ZwbFR1cGdSZTZsSFRybXNO?=
 =?utf-8?B?QUZZenduVmdhdHFjTkhMOU80S0hxMjVldDIxWEE4TUNJUm5zOFcxNllZREx0?=
 =?utf-8?B?RHM4N2dMWGVmWlBxVWpIUXZuN3dPTTMzR2NhaFB3VElkVTNRMU16ZHNVNDho?=
 =?utf-8?B?TDlRWElGR1liRUpxYU5acXdad3J1RCt3ekRacExYNE1pNEtPMVBlZ3Y2SEsv?=
 =?utf-8?B?bEZicGw3QVorYm1ub1hONG1adkpYNmJjMkpZenhQamF4Wmk4K1BqT0k2SUto?=
 =?utf-8?B?R0dUVSsvdnJMMDc2WENTRTJweWI0Qk1SM2lmNlk5TjA0Y2Y4aGR6RE41eUlZ?=
 =?utf-8?B?VDZWSWh0QmVNQWV5VEF1WE9GMXlHcThwSVpBR1lkNDZ6YXd2L1hZZ0VCTmgw?=
 =?utf-8?B?Q2F0aTBsQkYvbVpjeTJwOE0zL1B5RHdMZWhFWDhRWk9CYU1wZXArUEswdUdz?=
 =?utf-8?B?NS9NbUcxMXVJek1PVG1hRkw0L1dtaE1lejc0THhUOGZHZmNpU1BneDkvM05k?=
 =?utf-8?B?MWcvZnlQOFh2d0QwWFBydEFiT05YWXZGeUZyZXNVWDFNOURUMnEyZWJ3Zlpn?=
 =?utf-8?B?Q1J1OWdGbEtIUmJlZFdXaTZKeCtCVXo5emgwUVN5QVAvU3BMeVBIaUg1RHVY?=
 =?utf-8?B?ZjRLY2dUQk1jVmV3V0lkK0R4SUMwUVpKS0RFYUxGYVVKUVdlS0NIUG9WaWM4?=
 =?utf-8?B?VTkxcDBFMDM0aFB5ekhRN3hZUTlkQ1R1U0FBQnZYaFNIMzhBbXg3MGpYRHNr?=
 =?utf-8?B?Q1lxbnRWditrbEczb3lNeUx1SWl2RndXMkVEd005OGM5Wk1zTmc1VmxyclV1?=
 =?utf-8?B?NHBWejU3dVFrRGVhcjFlYk1pVGNiMjEwVUJjMjFuN1Z1Zm94emNCejNaWXVu?=
 =?utf-8?B?akJuYmd6ZFF6NkIzWUM5b21ENGlXdWVKOG15aHRPdkFtbnBPUWlpejNHak16?=
 =?utf-8?B?UGlRRDlUd2V6cW9qNGwxei9hNVgweHJIbXozRzBCa1oySjZTWlJFenVDUVA0?=
 =?utf-8?B?QWRQeVp3T1NtOVZHeG96R29XY3hCU1dGNkNXeDZ6ZTJDZ1gyNGZqRnRQdG4z?=
 =?utf-8?B?bU5mTmFMWFVBT29SWmxrbzh5aDhVSDgvVlAveHlMQ3BjMUlzWnJlT3lDdXVr?=
 =?utf-8?B?S1dFN1llWGpMRnU1YmhwcXlZRzhQNWFoNitwN2d5eWI0aThaNkpZRVU4UGhK?=
 =?utf-8?B?UjVZbHZOVlg2M2R3MUhDNytnTm9VazZzSFB6c0hMaVdmVG15ZWYxa3pQTjl4?=
 =?utf-8?B?RnFIWjZkZXdFYS9yeHcwSituTHAza0RobjU1RVNZU1lZWE5aKzFLdCs0L1Br?=
 =?utf-8?B?V0w3UFprcTZhU203eG8yVHhpUEtHcWhXSU5QTHVVZzVSbGJ5NFZyaW04SlUr?=
 =?utf-8?B?R2VtR2hKcXBHNTNYbkFPNkRhYXlVOGVuVjBnL2xGdE91aTNKM2pXcmN1ZnlD?=
 =?utf-8?B?NXYzc3kxejNkaWxSY1JXZm9Fd3RTUHozWGNzYklHWTVRNnNkczM0ZjdsRnF6?=
 =?utf-8?B?dmI4eWo4VXZkOEtIUGtWSTJjRWlFRlVoUGFRbE5WQ0h3TUZack55RklRdkFi?=
 =?utf-8?B?MXE4TlRFLzM4bExsMFhOMmdXMklpMDVOWVg5SU45ZjZIQzZEeVJWSGJMUGh1?=
 =?utf-8?B?VlZCdDJVdUFSNE5UOVNsZ1JodDdyZU1zeW11SmRuNzlEeHpzdm1jYUhzWW5Q?=
 =?utf-8?B?eVBDbTA5bzNSUWVMMk8yS2dNbFh6NmVWN0Y3blpwRjExR2FNd3ljU0d6dURj?=
 =?utf-8?B?eVdoN2diSXJETTRJRzFoZWh4MDRiQ0FjOHowTklGQ1FMTzg3SGI1YTROK0Fs?=
 =?utf-8?B?ZTYxbm5WK0IwRFlYSTBUSzFRL2F5NENheUxkOG9UNEJWL3l6TC9JV3NxVWZm?=
 =?utf-8?B?U3hrVllHbFEyVG9URTJEcnhKZUpWWGJmSzEzMzVZNmw2U1A5WklFSENqdmVJ?=
 =?utf-8?B?OENIUWc1MGFyc25hSVZZMzdScVdBMjBuMFZqTUZFQ1dxb2ZtYzNqRjFacjhl?=
 =?utf-8?B?Zk9PbTA3blFDNFpXd3p0SGZ4bk5sM1MvaHAxN1FaVmp1Z2JWOXNkSUpxcVox?=
 =?utf-8?Q?4tv2pHJlMy4w29Hk=3D?=
X-Exchange-RoutingPolicyChecked: OaMPKrBvUKRzKYs2cUtNOopPM2yyrz3qBv7ycZpXbSFhl9/x/D16Xs/mraLHRoHWec3xO/DxBs4oJJ9k+1wbKu39n8X28XnMlz/cRmacq0pSh1K65dImWndFdzxOBrtUxGHl4r8NzzTex7RcTEocJHpu9uILT+0nmWbjJP5BppuxAbodr7sMzP0/rpPk8Q9ZYx9GJhQmgvAqyRZPfJ/EAVvSkxMgnlWfSezMJ6XGfD0bQBDDo4OXB74+he2tZVQM2aZ2PEOJcmGgdp9VgGGTVhaRudwvxl99tYekxeC5qdZFI8DHE68Akom5LUcd/uBWY8osQV/DzlLuv4nw2q0Xcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0518821f-5bfa-4533-e6cf-08deb0c96c94
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:27:09.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhi9FvGQCn3+xapjZ21pSnOaisMhtLIx1+FefgspAsMXAOah5sZh2+ms7F3FhGaxqoGEKscEhrOm+2+0wdf3X4pNQImc5Ajl7OiizN8tF6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
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

--------------xKevOX4Mkf2U0HpUHIyDOc05
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan,

On 5/11/2026 10:48 PM, Jeevan B wrote:
> Adds a test to verify DC3CO continues to function properly
> after a DC6 power cycle.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 65 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 22ae51b51..6d2bd0ee1 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -55,6 +55,11 @@
>    * Description: Verify that DC3CO entry does not cause frame drops and successfully
>    * 		enters the power state
>    *
> + * SUBTEST: dc3co-after-dc6
> + * Description: Verify DC3CO entry is still functional after a DC6 entry and
> + *              exit cycle, ensuring DC3CO is not broken by deeper power state
> + *              transitions.
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -629,6 +634,42 @@ static int has_panels_without_dc_support(igt_display_t *display)
>   	return external_panel;
>   }
>   
> +static void test_dc3co_after_dc6(data_t *data, enum psr_mode mode)
> +{
> +	uint32_t dc6_prev_cnt;
> +
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
> +
> +	setup_output(data);
> +
> +	/* Enable PSR2/PR */
> +	data->op_psr_mode = mode;
This needs to be above setup_output(data);
> +	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
> +	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
> +		      "%s is not enabled\n",
> +		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
> +
> +	/* Trigger a DC6 cycle */
> +	dc6_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
> +	setup_dc_dpms(data);
> +	dpms_off(data);
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC6, dc6_prev_cnt);
> +	dpms_on(data);
> +	cleanup_dc_dpms(data);
This dpms and DC6 cycle you can use existing function test_dc_state_dpms().
> +
> +	/* Re-enable PSR2/PR after DC6 exit */
> +	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
Is psr not restored after dpms. If it restore automatically this is not 
required.
> +	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
> +		      "%s not re-enabled after DC6 exit\n",
> +		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
> +
> +	/* Verify DC3CO still works after DC6 */
> +	setup_videoplayback(data);
> +	check_dc3co_with_videoplayback_like_load(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_deep_pkgc_state(data_t *data)
>   {
>   	unsigned int pre_val = 0, cur_val = 0;
> @@ -799,6 +840,30 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
> +		     "and exit cycle");
> +	igt_subtest_with_dynamic("dc3co-after-dc6") {
> +		igt_dynamic("psr2") {
> +			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +						     PSR_MODE_2, NULL));
> +			igt_require_f(IS_TIGERLAKE(data.devid) ||
> +				      intel_display_ver(data.devid) >= 35,
> +				      "Platform does not support DC3CO with PSR2\n");
> +			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +				      "PC8+ residencies not supported\n");
> +			test_dc3co_after_dc6(&data, PSR_MODE_2);
> +		}
> +		igt_dynamic("pr") {
> +			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +						     PR_MODE, NULL));
> +			igt_require_f(intel_display_ver(data.devid) >= 35,
> +				      "Platform does not support DC3CO with Panel Replay\n");
> +			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +				      "PC8+ residencies not supported\n");
> +			test_dc3co_after_dc6(&data, PR_MODE);
> +		}
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
--------------xKevOX4Mkf2U0HpUHIyDOc05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 5/11/2026 10:48 PM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260511171820.461666-7-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Adds a test to verify DC3CO continues to function properly
after a DC6 power cycle.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/intel/kms_pm_dc.c | 65 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 22ae51b51..6d2bd0ee1 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -55,6 +55,11 @@
  * Description: Verify that DC3CO entry does not cause frame drops and successfully
  * 		enters the power state
  *
+ * SUBTEST: dc3co-after-dc6
+ * Description: Verify DC3CO entry is still functional after a DC6 entry and
+ *              exit cycle, ensuring DC3CO is not broken by deeper power state
+ *              transitions.
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -629,6 +634,42 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
+static void test_dc3co_after_dc6(data_t *data, enum psr_mode mode)
+{
+	uint32_t dc6_prev_cnt;
+
+	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC6);
+
+	setup_output(data);
+
+	/* Enable PSR2/PR */
+	data-&gt;op_psr_mode = mode;</pre>
    </blockquote>
    This needs to be above&nbsp;<span style="white-space: pre-wrap">setup_output(data);</span>
    <blockquote type="cite" cite="mid:20260511171820.461666-7-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-&gt;op_psr_mode, NULL);
+	igt_require_f(psr_wait_entry(data-&gt;debugfs_fd, data-&gt;op_psr_mode, NULL),
+		      &quot;%s is not enabled\n&quot;,
+		      mode == PSR_MODE_2 ? &quot;PSR2&quot; : &quot;Panel Replay&quot;);
+
+	/* Trigger a DC6 cycle */
+	dc6_prev_cnt = igt_read_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC6);
+	setup_dc_dpms(data);
+	dpms_off(data);
+	assert_dc_counter(data, IGT_INTEL_CHECK_DC6, dc6_prev_cnt);
+	dpms_on(data);
+	cleanup_dc_dpms(data);</pre>
    </blockquote>
    This dpms and DC6 cycle you can use existing function
    test_dc_state_dpms().&nbsp;
    <blockquote type="cite" cite="mid:20260511171820.461666-7-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	/* Re-enable PSR2/PR after DC6 exit */
+	psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-&gt;op_psr_mode, NULL);</pre>
    </blockquote>
    Is psr not restored after dpms. If it restore automatically this is
    not required.&nbsp;
    <blockquote type="cite" cite="mid:20260511171820.461666-7-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_require_f(psr_wait_entry(data-&gt;debugfs_fd, data-&gt;op_psr_mode, NULL),
+		      &quot;%s not re-enabled after DC6 exit\n&quot;,
+		      mode == PSR_MODE_2 ? &quot;PSR2&quot; : &quot;Panel Replay&quot;);
+
+	/* Verify DC3CO still works after DC6 */
+	setup_videoplayback(data);
+	check_dc3co_with_videoplayback_like_load(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
@@ -799,6 +840,30 @@ int igt_main()
 		}
 	}
 
+	igt_describe(&quot;Verify DC3CO entry is still functional after a DC6 entry &quot;
+		     &quot;and exit cycle&quot;);
+	igt_subtest_with_dynamic(&quot;dc3co-after-dc6&quot;) {
+		igt_dynamic(&quot;psr2&quot;) {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PSR_MODE_2, NULL));
+			igt_require_f(IS_TIGERLAKE(data.devid) ||
+				      intel_display_ver(data.devid) &gt;= 35,
+				      &quot;Platform does not support DC3CO with PSR2\n&quot;);
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      &quot;PC8+ residencies not supported\n&quot;);
+			test_dc3co_after_dc6(&amp;data, PSR_MODE_2);
+		}
+		igt_dynamic(&quot;pr&quot;) {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PR_MODE, NULL));
+			igt_require_f(intel_display_ver(data.devid) &gt;= 35,
+				      &quot;Platform does not support DC3CO with Panel Replay\n&quot;);
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      &quot;PC8+ residencies not supported\n&quot;);
+			test_dc3co_after_dc6(&amp;data, PR_MODE);
+		}
+	}
+
 	igt_describe(&quot;This test validates display engine entry to DC5 state &quot;
 		     &quot;while PSR is active&quot;);
 	igt_subtest(&quot;dc5-psr&quot;) {
</pre>
    </blockquote>
  </body>
</html>

--------------xKevOX4Mkf2U0HpUHIyDOc05--
