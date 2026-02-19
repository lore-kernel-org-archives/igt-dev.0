Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EA4E9A02C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 03:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7E910E65D;
	Thu, 19 Feb 2026 03:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QA6J7i3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061AA10E65D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 03:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771470341; x=1803006341;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c3n2wEQA7soWXpWSaC0DLe1k7XMTUVATbXvTk2mE+mY=;
 b=QA6J7i3GaYkshN/dSWh6VMPGgB0sx8FJ85E/mX5QlCXPLwwn25vQMVhS
 VCqUaFiX/7sMr1+e/gP3mAm0k6aGaFCwtxt8rbyJQJuoQg0dik+wY6cUG
 hhJq3/3k3DOdLl+NUzYRK1kfna7pMaMlKzIbc6Ky4xJg8r8PZswl5OzE5
 UGHA0Apnq4fJPqwP2slnXnDJq/VQdrv1JtDD//P4ucZtQqUa/SPDapsbM
 aFCLKDKdXUb+ZHLZwpPANg/DImVxn8d0sUd5ABuV4ULedP9t41B/gEBw5
 5tQ5mOpwWSnLUrKvhRnnATC7oGWRdGZl1BxLVY8ggrGZKUxGB8Vy3s6HB g==;
X-CSE-ConnectionGUID: KAi69J2lRj6c5oXl+h33Jw==
X-CSE-MsgGUID: Ele2dsM0RMyedTDgcFvQmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60130768"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="60130768"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 19:05:41 -0800
X-CSE-ConnectionGUID: Xqxpgpr6RTKfWZsiOCzaIQ==
X-CSE-MsgGUID: DYwaF9hORiO7hgQ+DhzUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="219388780"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 19:05:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 19:05:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 19:05:40 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 19:05:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1rVT/zlDQPEKToHYA9pZLNOj2nK3/rn11FrqX+THPpI4hFYOg4dI5Yc4OkVDlPgkPCgo7KFzhnVVz4hi5HF/94CqoP4bTC3CouSv6+Hx8wLN9ZmDyJ7wAJyeQUuEBfk7t3t9+DWxrRLUg1yAYAEYkoaHDh5DliFSp+1VTW0zu8lna5KXXzwp8o7uOpnSDtFrMFwBnP/Z3mlF2m5dEnN8czxoF38+Q8LW4nwjMtDRU/cayYOED0UnnUBPF/uxPrnTbbSjOnPu8LM0173ptwwmpAtdB9Lhl1D3nlQECn6JTUMeWsfEWMtqwfcBdNEfDCn61O+bCbJ18Hr1UDJJFyafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FwIFfRlSUyVQt5pGSghCZ+p7OHxcckBn44aGnoCY8g=;
 b=FCo9c0FxCS3F2qKUvZTmB4EKLkGQT8axPCi/6129/1vFx9/GdsrvOXWBBvsQS762nMfg3N2fwUXKGo4Lj1NFAg+EOtFNpMLksQwrYt85ZMiSvNvXyptgFvJK13fFIJEPBOgNqVLtN5LXM2XrEd4hklwJRbMJSINbdSYDHgFIySMcoSSTKeyCMleAUjXSL8aJ7Rk3rv6cKYg6e3pBTKR/PF2iFBo+le1Xuyzc478L7Nuhh8udQFJF8wuHxox09BUhJnZyV9MR8lvF+9QHMwVZYh6YrHVeEj4uTP7kGIxOfmJptx+yqQqRQ/v2x3FGs7JMIT0HZt8VS4880dYpbxGVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 03:05:37 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 03:05:37 +0000
Message-ID: <c021816b-3229-4b12-8a45-5ebb719d8048@intel.com>
Date: Thu, 19 Feb 2026 08:35:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_atomic: Read the error msg on
 atomic_ioctl failure
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250822065535.213451-1-arun.r.murthy@intel.com>
 <20260210085333.3250279-1-arun.r.murthy@intel.com>
 <20260218131818.6t72iirnh2cqwxvv@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260218131818.6t72iirnh2cqwxvv@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d019f7-3203-4c28-5581-08de6f63c142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGswQWhQMmc2UEJENUhlOTFIUjRwNWJTYVNsY0tBWnRqZWZTMUFCeHRIUElZ?=
 =?utf-8?B?ekNmQ0RLVnl2T0VKdmV6ZDdscEl2OUtCNzR6SWtLdTBLeGxydGFBZ3RGREdr?=
 =?utf-8?B?VDFsM29NV2VES3pDZEV3T0RSVkgvRmQ4aWNQaEJrTmo0dFJ6OW9keUtTdjJx?=
 =?utf-8?B?YkV0R0Zpb2YxVHk2K0M3QzArZ0VnNzFaZ05WTWtNaWtTY1Nyb01kTlNuaFpq?=
 =?utf-8?B?Wlp2SXNYNU9zWlhKeHFiNm9NSThnS24yUGhFcHNlVFBUZnIreTI4aVcyeDJR?=
 =?utf-8?B?Nlk2YnVPZitSMElKeFZxQzJJYUI1cmhydU1lNGxVQlByczVVd1ptVU1LRlNy?=
 =?utf-8?B?SXRITE1lRlpKZUZCOURzMk56a055bGExU2c4OTFaSnBvVldGYXF6T0NOamhz?=
 =?utf-8?B?MEFNekJaMHlRMlB0d2tDK2xELzBqT0hISzY0YXBJZkF1UzdBemdOUlVNV0VX?=
 =?utf-8?B?eGdYcHNsSWJYMWtNYTVydkxEVHpYbC90dkVtektoSzVmMjQveVNROWlQMUJ3?=
 =?utf-8?B?R0x4NUp1eWdiZmlPVjg1cktrUlA0ak1GYURDdWIydW9LV2l3d2o5NE50Tkdm?=
 =?utf-8?B?M0tsVFZGTVFDekVPd3U0UVlkTG5ycm12WElMZS9KS21NNEVublloWGpWUnYv?=
 =?utf-8?B?TjRqakJtbTBIdmJBR0NJN3NLbHc2enZMZlVSd1NHRmZMNGRwVXJCaWRRVmZp?=
 =?utf-8?B?VXZHTk9tanh2ZHprcmZaNHhIZldtSmIyZjByUWtoRzl0U2s1Rnk3SkJ5anZ6?=
 =?utf-8?B?QUh4VkdtalhCOGpuOWh4RjlQMUNERjFTTjZ5ZUN5azJsR09Td1A1cHZjZm9F?=
 =?utf-8?B?bXdrallnTnlMS3FLd3VvNis5L2NXZnBzSXpSZjFXVlJtbS9SdDE0NVZ0YUIz?=
 =?utf-8?B?c1ZzRDhzbTEwK1JIRHlaY25HVjJOZ1locVo3eDRva1IxQ3ovU29DNFdlV2k1?=
 =?utf-8?B?aXg0cVdmK1FCZzBKZ2VRbkVqdjNCTWh5M0pENlZtU3JkRGdCRk1jZlBWbGt3?=
 =?utf-8?B?MXJKT0p6WXc5cnVQd1VVYTlmNGZSNis3cy9uUUx1UUthUCtlQTdyUml1Q2RV?=
 =?utf-8?B?WDBoRkFXaS9GRW5Wc1VwK3hzb2o0NEFDVC9DYVNoMTFtYzZpV29Ga2VLNGMr?=
 =?utf-8?B?Y1BESXlUTmo0ajg5eUM3Sk9TRXlRNVJkM1NTTlBMSXlsSjJBa01OYmVBbmVt?=
 =?utf-8?B?ZHZYYkloNFYzdjdWdXRhVEp5cGpsenFWQkdqbDhvZGxmZnVZRVRlZ2svclNM?=
 =?utf-8?B?aXVqUnBWRTRoSUw2VWRFdTRDbUJSZEhDcmVIck0wdG13UjFhZXRDL2NqUUtD?=
 =?utf-8?B?NVgrcWthWEZ0b0JSSkdPVlNBZHBEVFpPNG95elR2WlN0WnM1dTk0R3c2TnZp?=
 =?utf-8?B?d1V5YjR2UG5FQVNoM29yTFpsR3l6QVd1OXp3QnJJWmFSMjlPUnlHWm54QzAv?=
 =?utf-8?B?UTI5dUZybVRyYWFYTHdVR1JjQjNubkFXOUgxYnFvajk1K0NnQmY2RkpqTUd0?=
 =?utf-8?B?T21HbkVSWDFXR3VMUkFaanl1eUZZenZ3N2xuUkRtaWF3RStvRXZiYVNUbk5N?=
 =?utf-8?B?MGcveWN4MHk4ckkvTC9LeFNFUmdzbit2SDI0dkZsMmNhSUE5MVRGdFA2TC80?=
 =?utf-8?B?S0xVeCt1dVMrMWRuT3hLQ0NNY3djbWhaT2M0U3g0dUYvQ0wzVEQwQ2x3YnB2?=
 =?utf-8?B?bFdjbk52OVlsQzhZd29lR1RGYmIxRHFnUTVaTU52MFkvS2x0bld5SjRFU2hw?=
 =?utf-8?B?SklNNERmYWFkSWdMV1FsVEZVcnFoTWxpT0lNK09SSDdCczJBaWFKTm9NMU5F?=
 =?utf-8?B?WW5OWnRrMWJOdlY0Wjlwd0VKYVN6QlVBUTNCcDlIcW5FMkhtV3ZqcXYzRHM0?=
 =?utf-8?B?QUxpUU8xOCtqczRCaVk1Tzc4dzFrWEpxWUszcXp0QlQzZ1lVVzQ3QU9YSDJI?=
 =?utf-8?B?Mi9WY3JXSlU3dVZ2cWRLZGYzRklhVGdPVG9oZlRQQnJUTk1zZGU2TjJGeWtt?=
 =?utf-8?B?dHp2UDFXUEI4VU5ncXcrWVloQWlOUWZrSGd3WEZCMTZMNDlwK3g2cGNiNEFC?=
 =?utf-8?Q?0gYC+Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REF6SCtpVWxmMm5PWFdEcmw3cGMwR3dxK1FvRlNzU0d3SUkwRU9XS29oYS91?=
 =?utf-8?B?VDZqUkZpbnFNRmJPMzdSWjVZMk9OWld3N3NRWktlWGFiKy9BUVdvU3RuY2Q0?=
 =?utf-8?B?bGZFVkpubkZQSTc0V0VHckt4L0RwaHZVclljL0pjYnQ5RmZIVUJBZlBIVXZ4?=
 =?utf-8?B?UHFtbHloRkk0bDlhZmxPUEVwWEZMdSt1c3YrNzBMWTdTL3R5UjJRYTVhUG56?=
 =?utf-8?B?azl1cmFVYm90UjFESzY0TW13b0w0Q1ROTTlPWW1hQ2NuVGtDS29yTTRHMC8z?=
 =?utf-8?B?ZCt0M0VOc2grckVEdmYwNEtEQ2NZMjBsY21NamhvMk1ZWDRTeXpnaGRYMmov?=
 =?utf-8?B?bzh3aDNXK2ZhNXZob2oxc01ZUlBkS1hUNW9TS1ZhNktzSmw3R3dxMk0wVmNW?=
 =?utf-8?B?bVVzcHV6ek85NXdvRnR5Zms5eUZpZXV2cjNVWEh0TEd2UFoveWc3dE5MQ3M0?=
 =?utf-8?B?Wk9lckhTNDJEbXV2MVZvOVhKaVhMTTllazA1Y25sQ0UvZkdZWXowais3YVRn?=
 =?utf-8?B?NjRRQzgrNzFEMnFTdWVMQ2NnaDZSMjF6Tm1XbFVSQkpNOFZDVmpYV3dkdits?=
 =?utf-8?B?ZSsrYlJaUE1TZmxSUjg5K01YaUg5U2NNelByUC9OZGJzazgzblEyYStiUUtF?=
 =?utf-8?B?ZTBLeEIvN0k3Q0duRDhDOHVJVDI1eFFNVWN5c0tNUnZybVFTZXZ2M3ZENW1U?=
 =?utf-8?B?dVdjcGxtOGtyaXNtUHpJcmc4M214YWE1V1ZMeU95bktkUHdWSmRhOFRHcnFl?=
 =?utf-8?B?eElqd1o4NDhibWVGeG5rVVliNjMwbjFHU2xuMXphUUtpTTRaWnY0dTg5VDRD?=
 =?utf-8?B?OVFKZ3p6cUNXMXVjMmtDZGJudmNJdDBJYVFaVlFUcGJiUzZCK2xKcHFDdCtT?=
 =?utf-8?B?UnRJbGNuODhqV29sT1ZYUWZJR3l1S1Q4OHkxcEhUUndIZUxDSGFUUW1UN2d4?=
 =?utf-8?B?RVpqYk1lRHFWalFGTXlzSldlMmx4bnJyQm1mb3NnNDA0L0xQOERMeFJYN2R2?=
 =?utf-8?B?dzRxcExtVXkydVdyckhuQ2I3SnJhc1BRQXBxU2c0SVZiSU11K2NZWnl4SlFp?=
 =?utf-8?B?eU0wTUxUVjJkTzcwOWpGTGZhaEZJR1RlSXlDN0xvU3ZSTFhnRm40TkozTXpR?=
 =?utf-8?B?WXFzWjFRVzRwWnhvMHJ4SmkrS2xxbzVCYjIxQmY0NnpVaDN0OVc4dE9EQ2JJ?=
 =?utf-8?B?N2RMRkhWQmNLQW1RVkl6K21oZUg5Z2dDa0FEd2NvcWowa1orUUlVd2NDTm5n?=
 =?utf-8?B?ZExrcE1idE90Z005RGV3MUZqV1UzL1cxaVJHcHBOeWMra1gybHVkOENXelBU?=
 =?utf-8?B?T1k0Z2JCdWVrd241VTRoeHpaekI2NzU1bGIyeGRnNm9hRzRVYUxLcE9TU09w?=
 =?utf-8?B?Z2lvcWdNaFdqRkthZ0dFalc5MDlCRTRlVXdUYXFqOWR0MFc0UzVSMytCejFw?=
 =?utf-8?B?MkRiNkpoWklhN1RTTU5tT3JxOVBzeDM5YlJIMThjb3BlL1NTRTBYYVdxdGRL?=
 =?utf-8?B?WW85eGE3QUc2eWE3VksvK3phaDEzbUV6a0d2VnVENUR2dHJNcWcvbkJkQWhP?=
 =?utf-8?B?RHpoYk16ak15anhHSFhyUStKb3ZJd1NieHVoY1AyekpGdVBPNWF0UXh5N2RV?=
 =?utf-8?B?bXhtdFJIVGNOVG1iWG81RjF3NjRlQndETTNxa0p5MURHa09RRGVCL3UzdXFL?=
 =?utf-8?B?UmpBbWgxdGo4ejRIRTVHWERNUGFmTk1rdzA3Z1QzT01pM2k3ZjFTbUl6REE3?=
 =?utf-8?B?dG1GcklJUVNqMmNicVdFUUtySXFnVmZmS3E5WkVqbGE5bE9BZG81UE5aSzE1?=
 =?utf-8?B?OGdleFJpYitVV200d2NWOGNQcXRZSG1ZQ3JNcEN4TlM1ZC8zMEhLVWVQc1FZ?=
 =?utf-8?B?TGJQZkIzelVSaW1mN04waG03dlh1OEk2N0k2RDViNHJQZ3R4L1NIVi9XQVhY?=
 =?utf-8?B?cHp1YzJDc1lWUlF0SkRpanZnQ1B6ZjMra05sSGdoYTlZK2J5RHhZL2p3eGNn?=
 =?utf-8?B?Q1F6VjJRdTE0cGcvQkFpV3dhbkphV3RmeThiNGl4Q0JkbFppVUJDUWY3eUNj?=
 =?utf-8?B?azBUV1cwc05tbkZnSHQvVTlQS3poblZ5dDRlbHBqWlZ2eXRMdjlwVkxpaWYx?=
 =?utf-8?B?R29FR2tlMXVyMEhmMThmOERqcUVHamEvN3M4MnM2ZHlwOUJ1WElSNTFuTjhu?=
 =?utf-8?B?dWNQK1Vlc1MrMk5JTnNsN0FCODdCeVlVaEFXRUIweVFQK0swOHFhOUs2TlFQ?=
 =?utf-8?B?dlZpcVJmbjRJUUNvc2Y1YnEwZ1JxSy9aOXZrN05mdy9JOEJPUmRPeCtldnow?=
 =?utf-8?B?cHRnVjJEbU0yZmtRMDFwMjdjNWZrQXpGSithYWVpWnJhOVZoNCtEdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d019f7-3203-4c28-5581-08de6f63c142
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 03:05:37.1322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lfcsmi9OiaP+79pbcn1ecA5ONpkI278baD54e7NCf5NymoTBkVn2gFdyUZJzRwG0SRq+CY1zq9P8k4SEcqGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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

Hi Kamil,

     Thanks for the review.
Sorry I forgot to add [DO_NOT_REVIEW] tag for this patch.
This patch was pushed just to get to know the usage from user for 
reviewing the KMD patch.
I will be enhance the test and will push the patch for review.

Thanks and Regards,
Arun R Murthy
--------------------

On 18-02-2026 18:48, Kamil Konieczny wrote:
> Hi Arun,
> On 2026-02-10 at 14:23:33 +0530, Arun R Murthy wrote:
>> On atomic_ioctl failure compare the failure flag with the expected
>> invalid reason and pass if same else fail the test.
>>
>> The corresponding KMD changes are pushed for review @
>> https://patchwork.freedesktop.org/series/152276/
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   tests/kms_atomic.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
>> index fa321cc3c..a609a9f14 100644
>> --- a/tests/kms_atomic.c
>> +++ b/tests/kms_atomic.c
>> @@ -1041,13 +1041,17 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
>>   static void atomic_invalid_params(data_t *data, igt_output_t *output)
>>   {
>>   	struct drm_mode_atomic ioc;
>> +	struct drm_mode_atomic_err_code *err_code;
>>   	uint32_t obj_raw[16]; /* array of objects (sized by count_objs) */
>>   	uint32_t num_props_raw[16]; /* array of num props per obj (ditto) */
>>   	uint32_t props_raw[256]; /* array of props (sum of count_props) */
>>   	uint64_t values_raw[256]; /* array of values for properties (ditto) */
>>   	int i;
>>   
>> +	err_code = malloc(sizeof(struct drm_mode_atomic_err_code));
>> +	memset(err_code, 0, sizeof(struct drm_mode_atomic_err_code));
> Use calloc.
>
>>   	memset(&ioc, 0, sizeof(ioc));
>> +	ioc.reserved = (uintptr_t)err_code;
> It is better using function to_user_pointer()
>
>>   
>>   	/* An empty request should do nothing. */
>>   	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
>> @@ -1076,14 +1080,18 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
>>   	/* Nonsense flags. */
>>   	ioc.flags = 0xdeadbeef;
>>   	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
>> +	if (igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING))
>> +		igt_assert_eq(err_code->failure_code, DRM_MODE_ATOMIC_INVALID_API_USAGE);
>>   
>>   	ioc.flags = 0;
>>   	/* Safety check that flags is reset properly. */
>>   	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
>>   
>>   	/* Reserved/MBZ. */
>> -	ioc.reserved = 1;
>> -	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
>> +	if (!igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING)) {
>> +		ioc.reserved = 1;
>> +		do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
>> +	}
>>   	ioc.reserved = 0;
>>   	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
> Where is free(err_code)?
>
> Regards,
> Kamil
>>   
>> -- 
>> 2.25.1
>>
