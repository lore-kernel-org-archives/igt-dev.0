Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63A8C3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 11:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6287510E193;
	Wed,  7 May 2025 11:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMrVNTPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32D810E193
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746617256; x=1778153256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A9yHDA/yAz+mrY9lkuovTwE3E8rWCN63P5FvAJjNg+4=;
 b=gMrVNTPB77JZ6+eLaeOMTUKiOKnCMidovuZx8+9ku8KfOug1+YgdpaM6
 tymCnzbgKOtUyPrmi4xKpBsHLfeIFFEcu/6A23hDkoTrt7VDvAPncBwTF
 z15vO7dLyLIRLNcGkuZTspWURbLrYcW7+4P9Lj7d50ClD8pC9pAbTi7zv
 tAfz43Mwum7NIifSVvW6qCLcAmEzUhTDuwtar3arq1gCD8cMIU8TdV1Q0
 ehUCHEOhyE7g4VxYTC4d4b8S+mtpnQQnRceSoekwtDgOMUo8e2Vx41Ed2
 0x06gTkNjv0kh1ikss5xGoCz2QD39VRv78as/CJzt1m0KlXY0ol7UcdrE g==;
X-CSE-ConnectionGUID: dh2oRBc1Sc2iNpB+kryWZg==
X-CSE-MsgGUID: U0HwOr3RTK6dFiURNeAa3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48455405"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48455405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 04:27:35 -0700
X-CSE-ConnectionGUID: 9zLPEB2hSTmM1a4djE9TBg==
X-CSE-MsgGUID: i6rfCHKyQ+mUdijcXGDEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135947219"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 04:27:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 04:27:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 04:27:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 04:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmmM0qqlgUtcGBXnHUJz2SI9mocH6Lc6IlgWwwG+ZQWknJqWMFGNCf70/YjU2fnzPBNkhNMSK4WB/UfoTjHo+2RwGWTCWoNiNc1rUKdqLMpeDT1nDSlRK1PAOwWLuobJMxH/u8Gpoy3AO+yQfVUAeyg9W+4YpdMmX+7ttR0FlEV5xTj6Y3b8Wzt07wiNHnvFxmtwNDvAL/YKjP1fWCqQAdZamHznlA2paJXTZlLr/RVWzsYaW6VUgtCcRBTFUBNzl1Wf3p1JeADOWmnvU3JbK4TL0SiCf6O4VL4jA2Kyvr/7pA3vmpNHA4oRnXVoiU1Lx5SQ5TiGEosOxqdw40XhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZslzHJZ+r2FAU+nSLvwN33963B3rxHJMVo82xIghXM=;
 b=hveS8fwoGvh2RwF8AAbcecZX2pnB2eRy9b1Ps2jyWjUIJbEsSz5RkCrTjosDIyEiDfD7auqv4Bs3+mmKKEH0yPothKHx5dQDteaP1+OhJYIuYRW41GQ0rLiN02tuA9mkyzGUO7VWaFO6jpR/SPpU9qeblw3up2aFicxyFgyHuLmEJkth9rQeZDLATdi7pvQ2emqTpur7cRkYLozic/zwFc2njU0RnyLUDOLusApyp9HOHXhr+myg5qw+BeYke8W2AE4sJgxtFDGKCc6+EBF6z0JfD81Av3RMx6/TVDawicRQMH7Wf4Wt7xxekZ8+/WZxSsVDg2dg17Lu7zWAHvdk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 11:27:28 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%7]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 11:27:28 +0000
Message-ID: <6130e370-ea03-4652-b42c-f49cc97705e0@intel.com>
Date: Wed, 7 May 2025 16:57:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve
 peak frequency
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250422063135.2502377-1-sk.anirban@intel.com>
 <20250422063135.2502377-2-sk.anirban@intel.com>
 <5e507a20-03ea-4197-ac8f-d388cb9e2d30@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <5e507a20-03ea-4197-ac8f-d388cb9e2d30@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 6078661a-4de9-4f47-b463-08dd8d5a25ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXJFdmQ2SFZLclpIK0Vva2JtY3hPQzZTN2JSOFdRTnZyT09GdVMwYjlxTzdr?=
 =?utf-8?B?OUQ3VDV4bUYxbDcxVTZFVmZIWWR1SlJvYlcyR0cxRHgvU1pzM0ZIRGNqNkhH?=
 =?utf-8?B?VDlrTWF4Qkw3clcxOUxTWndNWE54V0lFM1JPemNUVlB1T3RxVzJrRi9HbFZz?=
 =?utf-8?B?WTZ2NEdyaFNVUkNsV3ppZGt0K3dIeXpmc0ovRGVwYTZvZ2VSbmZHRXI2VW51?=
 =?utf-8?B?THZ4V3YzOVNtOHdOdTY0eldYSnBqRnFzWEFGRFlCYXpvYzcwVG8rZjBTUlJo?=
 =?utf-8?B?UVI4QlplNzBOZzFOa3FESHhZVjU0SWwwRUtiSUc4R2JLZmlmKytpR1dGaUk3?=
 =?utf-8?B?YzdORHJ0R2tlU2d6R3F1dmdmazI4NzMrSmp2dXcwVWhHRHh2ejZqeHN4dVJz?=
 =?utf-8?B?a01Vb3VIWitPYnpzSjErM1luYS9HOEdVME8renFPMWFDMnB3UFlTR2dLYkJ0?=
 =?utf-8?B?WHErblYwZ01mUVlMVmFjQVBCNUlBQnpWWGpoQW50cUdrcDMzK2FRYVBrRTc5?=
 =?utf-8?B?UysvbjZ1c1Y5MGhocmNWcG5OTERHR21yMXFkU2NUenpCSlBOSmtCeU5FUTM2?=
 =?utf-8?B?RVJ0cWMrenZoQ01SeTN5RWRxMDByNmdaTDNzWDl0MjA1MDNBQzRleEdUSzl3?=
 =?utf-8?B?SjZSUGlLTmZQaEtPWmRLbnRLSG5NeHE1QUg5QkVrVmxlN2sxb2pZTmlUazBV?=
 =?utf-8?B?bkg1N0VCUWQ4Z2M3dHREVUF6Q2RvbDhzUHY4c2JoK0N1UzkxcnduK1dWdGJz?=
 =?utf-8?B?RmZ2bmtrT2JyQ1MrQVZvRTVpd0duUGZib0h4ek1lcUpQb0wrWGxkby9OTCtF?=
 =?utf-8?B?WmpFZkppeW9VdjNZTzNiKzYycU1qazdTRnpIWXdnQmJTdnl5U3E0R1lpM3Q2?=
 =?utf-8?B?b29OOWZVYTVOaTdHbVEyNW9sUDNva3BrTEFkR1pqNVBOZ2hHanU2aU5ieGhC?=
 =?utf-8?B?bEI0aVhwalJXdFhieDRVeEdIQU1ELzQwUnp6OXF5QzBlNGE2cXFab1dVdXdu?=
 =?utf-8?B?bWZxMGt3TDRzczZWK0FVeHZpR0lWdzVROXhIUjJlZUZvTTdXakxYVGJwaDlT?=
 =?utf-8?B?c0hoWjd6aURZUlowRnlEU1BuWS9nUTFIK2tWNUk4QjU2UUxMRmltQTh3Wk44?=
 =?utf-8?B?TGMzV25waDMrcG9vek40TWdKRGZoelJpWWhzbjFibmdkS245Tmkwd3owY1hl?=
 =?utf-8?B?UGt2MG9KbzRJTExWZTM4SE9ObGJDSWh0NWhOMWIvZTdEOTlaSjZnNWhPcEhl?=
 =?utf-8?B?RE9lRWFRNkJXMXNqS3diRU9aelE5UGZJOTJxamN1MmJ2U2lyaEdHSFRaSTI2?=
 =?utf-8?B?QWprN1Z1L0NZWWF2TEtpY3JqcUJmbGpKU2d1TG5RYjdibmV1M0s0bmloR0NL?=
 =?utf-8?B?NHZxZGlFMEJ6dW5OQ09USWJMRkcwWStqeEkxSFdYVFFGMmJyK2N3Z05BRE1H?=
 =?utf-8?B?bmQzTmdGLzRIQ3pZZVR0aFB6WnVROEEvdDQ4bmZ2TnBVOTdSbWp2NkZjVEw3?=
 =?utf-8?B?dmI2Vk5HdndXbU5rK25ub3hqQ0hVaFZvZ2FDSTlieDJmR2tTV1hqTUF4KzF1?=
 =?utf-8?B?aTN5U1h0QlZ2VXgzV0JmZVZsWk9aZ2VVdThHTmJzZ252aTBJWVlOUkZqcmM1?=
 =?utf-8?B?WUJiNTF0YTF2SHJUZFp6UGNBVGsyL2tMK0sweDVSOWNNd0tlQ1FTYnhuVlBF?=
 =?utf-8?B?WCtla0dVaUw3TUlZTWQ0NndnSHdBNE1ZV0RJRVgycDN5YW1Hbm5ScWVJOWhn?=
 =?utf-8?B?UkxWY3UxR2p0aGV0YWw4RnU4a2c3MEJKMjVIbHdtb1NCaFNZRGxBc0RnYTlB?=
 =?utf-8?B?WHlRYWFqTmtSSGFFNDMxWFRQN21TT3kzZGVCSCtUS2RnZUxQM2dKZk9vaEVw?=
 =?utf-8?B?aXlNRm4zb21mZnU1MGpmOWZFVkVmN3Z2L3o4N0VPdUIxN0dqSlNKRk9EZEha?=
 =?utf-8?Q?BwKYaIug3Dk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEs5cnhGTzJIQ1d6NFFiZGhaSzhKcnNabVdhQTdLRk8rWDdtZFJHOUhBWnhN?=
 =?utf-8?B?VXl4eXcwOTdHRmxRb3Z5aExMMktzK1RyNm1PV2hNbkFoT3pJTHRqQnE5U0xu?=
 =?utf-8?B?dW1CRXllZGJqd2djZk8xOHE2bEdDQm5Jb0ZWbGZldklPY1FydEplbXBkYS96?=
 =?utf-8?B?M2VtVnBvUHhWdmF2enc0OGZFWlRocE1sdHlkRE1iTWRFc0dtZnJTTTVrL2lh?=
 =?utf-8?B?N2hIZEZ5ZzI4RXQ3VFVJbzhHejJDSzFhYTZzK1d0RHRXVVN2azNGK3oraE14?=
 =?utf-8?B?QXdOajBuYlN3Ym9mTm9tOFJ4VnlpR210eHo4TUJNWGJQTkNxS1k0UFBwVDJS?=
 =?utf-8?B?emVWR3F5S0tpU3Y4NkIwc0hHbFJUMkY1ei9YVmRJLzhDc1hQY3F3TnZzVCtQ?=
 =?utf-8?B?Njk5RDBRaGgrSUNEckVnTGZQbUxkYjlnU05wMkpFbm94ZkhrWFhyNXNBeWpH?=
 =?utf-8?B?WFR0eFByRm5BUDYwTXRmTkRzS1NuOE9pNFNTaFY2MlVTdWN1OXRhZmNWNFUx?=
 =?utf-8?B?bHBKaERFUmpMd1NlL2pkelIza2RyK2ZzaW9xSHdEOXpNWFFHMmdFNTEvZEYr?=
 =?utf-8?B?bzZLSk95cmxWNzVQSCtENHVTMjA4QjVRTUxwWVRYTFU2V1preFhWcGxiQzEz?=
 =?utf-8?B?V1kyQXB3aWJYeERnSGlRZ09MNWQ4UGhTbjMxNFlYanNDTEJUeXExY3RXZncw?=
 =?utf-8?B?Yi9PRkl1cStTWjRpaHBnUGg2ZXpBNE5sVlZ4RlZEY2ZNYW9DcXlHZVdHdUo1?=
 =?utf-8?B?cVlLdGtnYUVmeU82MzM5d1Z6dXpZeWRicWFwRTB6V1RCQkgwY3pONTZyc2NQ?=
 =?utf-8?B?MHNhQ0NWbkRKSjBPcDdZb1l2dGhtRlQyNksrL3o2Y3FOdk5HbkRrSEk5Y1lh?=
 =?utf-8?B?NE94bXBoQ01TRmNBa1BTb21ZZ05OL0JtcktGNmhrUmdRWmw5NWNMSm11WTRo?=
 =?utf-8?B?Q0pKWFFCNzFMd0x1bG5uT0tWOUx5ajhSdzNhN25yV3BRQjFYY3pMaS9jZjYw?=
 =?utf-8?B?RkJEZUZFbmQxVkpBa01MZHQ4QXBZRllmMzFtbEdVRUJJb1hFZGIybmw3YkdN?=
 =?utf-8?B?TWRnWHg5YnQ0MkswTmV3ZHk5SDViUWJuSFF5SGRydnJEbDdUWFV2M29TMFdU?=
 =?utf-8?B?L2xKc1JtNmxiZ0w3QWVVS0FCUzRmbU9pVm8raWxaNnY4RnlPS1piZkJFd21x?=
 =?utf-8?B?ZEFzL2FNNkgwNDJCOU15UTJpeGg0ajFXa1FuSk5YNDVhKzBSVGVybjFlRUpq?=
 =?utf-8?B?dVJWSnpTVms2eXF6N0tUaHc3U3JEa1Foc2NRbkNVa1Q3Y3hPc05qbWoyOGpa?=
 =?utf-8?B?dWdGY0FGR1NxdXgxY21vODNjUXNSVitKS1M1eVlHYU82ZW54U3JURTFjWXBL?=
 =?utf-8?B?em1TOGZKOUZTa3Y3VysrRFo2TU5XUW1QbUxXQmllQ2pGN0YwTU5CRGI0YjR5?=
 =?utf-8?B?UWQxdnhyblBhR3I0RmtacEY1M2hCYXlueWxJS2dod25uRzBkbnc5eHR1ZEdI?=
 =?utf-8?B?UmJ6dlE2cUw2aFhtQmFqK2xZMHdzWDJJaXlTcGY1NnkwM2FyNGNMcGlUd2hH?=
 =?utf-8?B?MWJXanNMRmJ1K2RoM2hla2dpZ0hLeDNvaFZ1Z2lmNXl6YUxDY0VhVmV6NjFX?=
 =?utf-8?B?cm9wblVRNVV5R2RKeEJKVmpBbnJyWWs5aUNDbEpTekY2WVVpYkdyNUlxa2lw?=
 =?utf-8?B?MStLQmxUWVpQa1VXRmJDakJRVFY5c2ZZY1lLNE5KQkVKRmpFdmpFSDFsL05y?=
 =?utf-8?B?K1Fkclp6NnM1ZndwODJvYncwVUhsV1VsaW9YWkdNN2V2L2VvNmZuNW1ZNWxX?=
 =?utf-8?B?VDIvTDZUeXowVkw2NTErTGJrUG5rc1JBZnJVaDdsN0dDUWVLMnlVUnVmNWVN?=
 =?utf-8?B?WUxla3pDa0Z4azhOdTZmMm9WRi9PaVE4U0FxRWxQRmNYVGlTclJ6K3pxbG5J?=
 =?utf-8?B?Yk9zMWlvaVMyS2I3aEp6VFU5K290ZUgrSW1ucFo0QXo2cUJSYzlvT0k4Q2Jr?=
 =?utf-8?B?ZGd0TTIwbU50c0pTNWIwWVFGQ01wS1FGYjF5TW9RTWtFekpZT3pSaGw3V3Qz?=
 =?utf-8?B?RE14T0ZTWjN1VHNHampad3JhYytvaldvZW56R2pBM1JVVXRyUGlZSVB6VDFF?=
 =?utf-8?Q?YcSwbOJOCcAcRzGHUwhbq/iSP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6078661a-4de9-4f47-b463-08dd8d5a25ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 11:27:28.0528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KR+K4yO1iXZuVqiX9XbhN023cnfwVe67QQgpajh0gN2MAn5IKSNAYk7KQ/dttl8VO/fTe1JEcHOC/PGw9WEPKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
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

Hi,

On 07-05-2025 16:20, Riana Tauro wrote:
> Hi Anirban
>
> On 4/22/2025 12:01 PM, sk.anirban@intel.com wrote:
>> From: Sk Anirban <sk.anirban@intel.com>
>>
>> Leverage IGT spinner to trigger frequency scaling and
>> set RPS minimum frequency to RP0 for achieving peak frequency.
>> This method replaces the existing waitboost mechanism used
>> to reach maximum frequency.
>>
>> v2:
>>   - Disable power consumption check for dgfx
>>
>> v3:
>>   - Implement igt exit handler
>>
>> v4:
>>   - Cosmetic changes (Riana)
>>
>> v5:
>>   - Limit the power consumption test to GT0 only
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/i915_pm_rc6_residency.c | 141 +++++++++++++++++++---------
>>   1 file changed, 96 insertions(+), 45 deletions(-)
>>
>> diff --git a/tests/intel/i915_pm_rc6_residency.c 
>> b/tests/intel/i915_pm_rc6_residency.c
>> index c9128481d..1b447f83c 100644
>> --- a/tests/intel/i915_pm_rc6_residency.c
>> +++ b/tests/intel/i915_pm_rc6_residency.c
>> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>>       return false;
>>   }
>>   -static uint32_t batch_create(int fd)
>> -{
>> -    const uint32_t bbe = MI_BATCH_BUFFER_END;
>> -    uint32_t handle;
>> -
>> -    handle = gem_create(fd, 4096);
>> -    gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>> -
>> -    return handle;
>> -}
>> -
>>   static int open_pmu(int i915, uint64_t config)
>>   {
>>       int fd;
>> @@ -286,45 +275,83 @@ static int open_pmu(int i915, uint64_t config)
>>       return fd;
>>   }
>>   -#define WAITBOOST 0x1
>> +#define FREQUENT_BOOST 0x1
>>   #define ONCE 0x2
>>     static void sighandler(int sig)
>>   {
>>   }
>>   -static void bg_load(int i915, uint32_t ctx_id, uint64_t 
>> engine_flags, unsigned int flags, unsigned long *ctl)
>> +static uint32_t get_freq(int dirfd, uint8_t id)
>> +{
>> +    uint32_t val;
>> +
>> +    igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
>> +
>> +    return val;
>> +}
>> +
>> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
>> +{
>> +    return igt_sysfs_rps_printf(dirfd, id, "%u", val);
>> +}
>> +
>> +uint32_t *stash_min;
>> +int i915 = -1;
>> +
>> +static void restore_freq(int sig)
>> +{
>> +    int gt_num;
>> +    int dirfd;
>> +
>> +    for_each_sysfs_gt_dirfd(i915, dirfd, gt_num) {
>> +        igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, 
>> stash_min[gt_num]));
>> +    }
>> +}
>> +
>> +static void bg_load(const intel_ctx_t *ctx, int dirfd, uint64_t 
>> engine_flags,
>> +            unsigned int flags, unsigned long *ctl, unsigned int gt)
>>   {
>>       const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) 
>> >= 8;
>> -    struct drm_i915_gem_exec_object2 obj = {
>> -        .handle = batch_create(i915),
>> -    };
>> -    struct drm_i915_gem_execbuffer2 execbuf = {
>> -        .buffers_ptr = to_user_pointer(&obj),
>> -        .buffer_count = 1,
>> -        .flags = engine_flags,
>> -        .rsvd1 = ctx_id,
>> -    };
>>       struct sigaction act = {
>>           .sa_handler = sighandler
>>       };
>> +    int64_t timeout = 1;
>> +    uint64_t ahnd;
>> +    int rp0;
>>   +    ahnd = get_reloc_ahnd(i915, ctx->id);
>> +    rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>       sigaction(SIGINT, &act, NULL);
>>       do {
>>           uint64_t submit, wait, elapsed;
>>           struct timespec tv = {};
>> +        igt_spin_t *spin;
>>             igt_nsec_elapsed(&tv);
>> -
>> -        gem_execbuf(i915, &execbuf);
>> +        spin = igt_spin_new(i915,
>> +                    .ahnd = ahnd,
>> +                    .ctx = ctx,
>> +                    .engine = engine_flags);
>>           submit = igt_nsec_elapsed(&tv);
>> -        if (flags & WAITBOOST) {
>> -            gem_sync(i915, obj.handle);
>> +        if (flags & FREQUENT_BOOST) {
>> +            /* Set MIN freq to RP0 to achieve the peak freq */
>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>> +            gem_wait(i915, spin->handle, &timeout);
>> +
>> +            /* Restore the MIN freq back to default */
>> +            igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, 
>> stash_min[gt]));
>> +            igt_spin_end(spin);
>> +            igt_spin_free(i915, spin);
>> +            gem_quiescent_gpu(i915);
>>               if (flags & ONCE)
>> -                flags &= ~WAITBOOST;
>> +                flags &= ~FREQUENT_BOOST;
>>           } else  {
>> -            while (gem_bo_busy(i915, obj.handle))
>> -                usleep(0);
>> +            igt_assert(gem_bo_busy(i915, spin->handle));
>> +            igt_spin_end(spin);
>> +            igt_spin_free(i915, spin);
>> +            gem_quiescent_gpu(i915);
>>           }
>>           wait = igt_nsec_elapsed(&tv);
>>   @@ -350,6 +377,7 @@ static void bg_load(int i915, uint32_t ctx_id, 
>> uint64_t engine_flags, unsigned i
>>           /* aim for ~1% busy */
>>           usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>>       } while (!READ_ONCE(*ctl));
>> +    put_ahnd(ahnd);
>>   }
>>     static void kill_children(int sig)
>> @@ -361,25 +389,29 @@ static void kill_children(int sig)
>>       signal(sig, old);
>>   }
>>   -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, 
>> unsigned int gt)
>> +static void rc6_idle(const intel_ctx_t *ctx, uint64_t flags, 
>> unsigned int gt)
>>   {
>> -    const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>> +    const int64_t duration_ns = 2 * SLEEP_DURATION * 
>> (int64_t)NSEC_PER_SEC;
>>       const int tolerance = 20; /* Some RC6 is better than none! */
>>       const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>> +    int num_gts = igt_sysfs_get_num_gt(i915);
>>       struct {
>>           const char *name;
>>           unsigned int flags;
>>           double power;
>>       } phases[] = {
>> +        { "once", FREQUENT_BOOST | ONCE },
>>           { "normal", 0 },
>> -        { "boost", WAITBOOST },
>> -        { "once", WAITBOOST | ONCE },
>> +        { "boost", FREQUENT_BOOST }
>>       };
>> +    int dirfd = igt_sysfs_gt_open(i915, gt);
>>       struct power_sample sample[2];
>>       unsigned long slept, cycles;
>>       unsigned long *done;
>>       uint64_t rc6, ts[2];
>>       struct igt_power gpu;
>> +    int sysfs_dirfd;
>> +    int gt_num;
>>       int fd;
>>         fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
>> @@ -407,12 +439,25 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags, unsigned int gt)
>>         assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>>   +    if (gt) {
>> +        close(fd);
>> +        close(dirfd);
>> +        igt_power_close(&gpu);
>> +        return;
>> +    }
> Why? Can't you just run the entire test for primary gt only?
No, in the same test we are checking the used energy while idle for both 
the GTs.
>
>> +
>>       done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>>   +    stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
>> +    for_each_sysfs_gt_dirfd(i915, sysfs_dirfd, gt_num) {
>> +        stash_min[gt_num] = get_freq(sysfs_dirfd, RPS_MIN_FREQ_MHZ);
>> +        igt_pm_ignore_slpc_efficient_freq(i915, sysfs_dirfd, true);
>> +    }
>
> Why for all gts? you are skipping if gt >=1.
I will fix this.
>
>> +
>>       for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>>           memset(done, 0, 2 * sizeof(*done));
>>           igt_fork(child, 1) /* Setup up a very light load */
>> -            bg_load(i915, ctx_id, flags, phases[p].flags, done);
>> +            bg_load(ctx, dirfd, flags, phases[p].flags, done, gt);
>>             igt_power_get_energy(&gpu, &sample[0]);
>>           cycles = -READ_ONCE(done[1]);
>> @@ -451,19 +496,21 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags, unsigned int gt)
>>         munmap(done, 4096);
>>       close(fd);
>> +    close(dirfd);
>> +    close(sysfs_dirfd);
> This is not necessary. for_each_sysfs_gt_dirfd already closes it
Sure, I will fix this.
>
>>         igt_power_close(&gpu);
>>   -    if (phases[1].power - phases[0].power > 10) {
>> -        igt_assert_f(2 * phases[2].power - phases[0].power <= 
>> phases[1].power,
>> +    if (phases[2].power - phases[1].power > 20 && 
>> !gem_has_lmem(i915)) {
>> +        igt_assert_f(2 * phases[0].power - phases[1].power <= 
>> phases[2].power,
>>                    "Exceeded energy expectations for single busy wait 
>> load\n"
>>                    "Used %.1fmW, min %.1fmW, max %.1fmW, expected 
>> less than %.1fmW\n",
>> -                 phases[2].power, phases[0].power, phases[1].power,
>> -                 phases[0].power + (phases[1].power - 
>> phases[0].power) / 2);
>> +                 phases[0].power, phases[1].power, phases[2].power,
>> +                 phases[1].power + (phases[2].power - 
>> phases[1].power) / 2);
>>       }
>>   }
>>   -static void rc6_fence(int i915, unsigned int gt)
>> +static void rc6_fence(unsigned int gt)
>>   {
>>       const int64_t duration_ns = SLEEP_DURATION * 
>> (int64_t)NSEC_PER_SEC;
>>       const int tolerance = 20; /* Some RC6 is better than none! */
>> @@ -557,7 +604,7 @@ static void rc6_fence(int i915, unsigned int gt)
>>       close(fd);
>>   }
>>   -static unsigned int rc6_enabled_mask(int i915, int dirfd)
>> +static unsigned int rc6_enabled_mask(int dirfd)
>>   {
>>       igt_require(has_rc6_residency(dirfd, RC6_RESIDENCY_MS));
>>   @@ -570,13 +617,14 @@ static unsigned int rc6_enabled_mask(int 
>> i915, int dirfd)
>>     igt_main
>>   {
>> -    int i915 = -1;
>>       unsigned int dirfd, gt;
>>       const intel_ctx_t *ctx;
>>         /* Use drm_open_driver to verify device existence */
>>       igt_fixture {
>>           i915 = drm_open_driver(DRIVER_INTEL);
>> +        intel_allocator_multiprocess_start();
>> +        igt_install_exit_handler(restore_freq);
> These are required only for rc6-idle? If yes, move it inside the 
> igt_subtest
>
> Same for intel_allocator_multiprocess_stop
yes, those are for only rc6-idle, I will make the necessary changes.
>
> Thanks
> Riana
>
>
>>       }
>>         igt_subtest_with_dynamic("rc6-idle") {
>> @@ -590,20 +638,23 @@ igt_main
>>               for_each_ctx_engine(i915, ctx, e) {
>>                   if (e->instance == 0) {
>>                       igt_dynamic_f("gt%u-%s", gt, e->name)
>> -                        rc6_idle(i915, ctx->id, e->flags, gt);
>> +                        rc6_idle(ctx, e->flags, gt);
>>                   }
>>               }
>>               intel_ctx_destroy(i915, ctx);
>>           }
>>       }
>>   +    igt_fixture
>> +        intel_allocator_multiprocess_stop();
>> +
>>       igt_subtest_with_dynamic("rc6-fence") {
>>           igt_require_gem(i915);
>>           gem_quiescent_gpu(i915);
>>             i915_for_each_gt(i915, dirfd, gt)
>>               igt_dynamic_f("gt%u", gt)
>> -                rc6_fence(i915, gt);
>> +                rc6_fence(gt);
>>       }
>>         igt_subtest_group {
>> @@ -621,7 +672,7 @@ igt_main
>>                   igt_dynamic_f("gt%u", gt) {
>>                       struct residencies res;
>>   -                    rc6_enabled = rc6_enabled_mask(i915, dirfd);
>> +                    rc6_enabled = rc6_enabled_mask(dirfd);
>>                       igt_require(rc6_enabled & RC6_ENABLED);
>>                         measure_residencies(devid, dirfd, 
>> rc6_enabled, &res);
>> @@ -635,7 +686,7 @@ igt_main
>>                 igt_require(IS_VALLEYVIEW(devid) || 
>> IS_CHERRYVIEW(devid));
>>   -            rc6_enabled = rc6_enabled_mask(i915, sysfs);
>> +            rc6_enabled = rc6_enabled_mask(sysfs);
>>               igt_require(rc6_enabled & RC6_ENABLED);
>>                 measure_residencies(devid, sysfs, rc6_enabled, &res);
>
Thanks,
Anirban

