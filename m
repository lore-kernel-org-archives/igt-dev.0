Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E24C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 14:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D41910E619;
	Thu, 20 Mar 2025 14:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lY0pOXnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05D10E3A8
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742479407; x=1774015407;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uol77vvvpAv/J9q9StCsRm7k6JPPsiXpz4fviCD+aII=;
 b=lY0pOXnR7Y18ch+ww70O9Rw4dPp3ChMcmdHP4UvkNsdqT4kjQ4yPqHV9
 HeOtQ7zAj1jTagdhyUnyJ1ckBL6eQdp9zZ/4a7EJktobdCiV8n/633/C5
 77VfKEHxxXJXR2JJ5dffDvZfeLOAr4NUDQReqOvqk5nkDZ7jyWQHDHlir
 562uObFxiHZSSCvAM3/CZRBbJFcuq2FhrOIM6mltid1EOpkAN1ZlRBjcd
 gHOeqahkMFXTeon+savqxJ0Khohj9D++l9mrtb/OiDfESKmXWFhO5oB/H
 Q0C6xNeb9IdeJbcKc/gaINbENaK981FxgIxzqXnt7VhHB0bPtxKrBBbyK Q==;
X-CSE-ConnectionGUID: lksEraleR5iXLH2uv7ILmg==
X-CSE-MsgGUID: UWuG2+cWTHCRrHzDBcDOXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54343989"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="54343989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:03:25 -0700
X-CSE-ConnectionGUID: olZGxTRaR6mQ7730NBiehw==
X-CSE-MsgGUID: vgB1ybFoQ9qBYhHnVW6mjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="127794164"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:03:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 07:03:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 07:03:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 07:03:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yk6cvNjojntjEeVCaKDx15O0ZPiJ6nZxT3EOkK68PnKDJ9vclYTsFkbttzy51uzPj1bO8Bbb9Z8m+kuTPWUJe9zrQNDpq6slUTw4JY3EL+RdfrG4jeVA0g4FC9zE1uS76pKBsPZjnpmwLoQltIMYcnmyGDfZ4wHCrYRSzeSPw4OKm6Gum1xo6jM8JWM3w4MeV0x/2CM7wooIDgAdsnXdm0MtwHIwPT4+BnSmJXvSEJuG0jozT4s5iKhmKPPBAiGR1Z+b18OVCTBFtVQic7AKAyIp3clLBEBn2Khtp+q+DJdSy1PXloV0CtCUM6C8ulMctjZ4levRFKE1lz4jvrPweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTXUlPoBZh5MbGLN0phmsl/M9NZbl5+njgKte2z25uE=;
 b=qWG6sPJE5eHobO/yBhMJKlKOfsYDJPH7FzGyb7GX2ZhHhCejFExjJsL2/wQ4TBANJLYgvbZ2pE2eL7daT6vGLk/jjAWfYMk2BPqXY9x8isNwlGHC+6K9FCGadx5OqGwGuyeM9+FmdtWnLT1WHqc9TTB0cGhgGYpbfnNOUE4It8pz1q/jazgJoLAa8Ra7lYwn4FoxGXQq1Q8rrcf8wR2qE4KT7QVfs4ttl4u0a7rV4h4nxEdjK/vtGHXj94UrKwV28jl36mA/7bBBR/XafRto8ohV+wVbx6EkgDP9qna20bvM+ipslB4OW/QXaTXMBxUYv/gWR7Jv95n0DBq2V56nBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 20 Mar
 2025 14:03:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 14:03:21 +0000
Message-ID: <3104e8b9-904a-4824-856a-a8a44213ba88@intel.com>
Date: Thu, 20 Mar 2025 19:33:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] scripts/test_list: Do not stop the build process in
 the case of test documantion problem
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <kamil.konieczny@intel.com>,
 <swati2.sharma@intel.com>, <jari.tahvanainen@intel.com>
References: <20250315040805.699431-1-karthik.b.s@intel.com>
 <20250317170151.a2ly2entrdk5fdvu@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250317170151.a2ly2entrdk5fdvu@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d29c0e8-8fd5-4cdd-f9e3-08dd67b7f935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlcwZ2tDb0Y5akRhb0hsc3RscC9CdUpGWTR2RTNGQWlGTk5PSWVETDQ5ZFB4?=
 =?utf-8?B?bDE1RDlqUWh1TDBOUFdaUDU4SDZhbTIyMmF1cTd4ZGMwOTFpOGlqZ2V0SGx5?=
 =?utf-8?B?a0o4Y3l2M3FsZHM5M2x5UitPNnNXQXRDSUUwMHFIVVhNQnlDdVE5bU1GZ2Q5?=
 =?utf-8?B?K0ZybEI0ei9TVHN3L0tLSDl5MWswaGlLWGJTd0h6emdBWVAzdTEzaVpjM0Jp?=
 =?utf-8?B?WVpvcjBPZlJNaXFTME9yelU2Z0FZMXFnSTlXQjZ3bmd3d1FaeHpZME5jQlk4?=
 =?utf-8?B?YTVDNFBYWnVRYWR4by9pdE5ZV2dTOUQ3c2dGY2ZyNmdRZHhIN3hiL2s1VE56?=
 =?utf-8?B?RXJyWUk2ZFNuaUpOS1lBbkxVUW50dHpIVDNmMUppNUZNYXhwV2dxbnZkd2cv?=
 =?utf-8?B?NjBuc25YWUhQRlY5VXBtY3UydGdHelhuRS80QWRRNnJ3TEVFQmE5YnNKSHVm?=
 =?utf-8?B?dFRBT0hDaStvN0NyZUNmL2pXbDhFYjJraTFJbE0yN1JZMTFrWWVIdHoydlk5?=
 =?utf-8?B?SHRucVlKT0RCRnBoeCtlYlA5Y3ZpdGNuZjFwOHlCQkp3TkN4VEhQUnlTS3Bv?=
 =?utf-8?B?K3pOUGRTWm1aaVowemdiVk1zVkN3Yk9jVzd5aVQ2a3ZjLy9OTGFhUThHSUVB?=
 =?utf-8?B?N0wwT2Y0QzVTWDlEdWZueXZwdCthdkZINzRUOXFjQ1pGcjlwdDk2UjRHUjdQ?=
 =?utf-8?B?L3JnaTQxMlY2YkpoNHJlc3ZLd1J2cWJPMW9wRy9BWWNTREVsRm90Y1lESEpi?=
 =?utf-8?B?dDg4NW8wd3hLcUR0RXBHdlMzMmR4SFV1YWYyV1R5MHFWZkFoUTlLY0pKM0x5?=
 =?utf-8?B?Sk1aS0M1d1ZyaUNZNE1YeFFjcnJxTkdWNDZPbDVUa24wTFdnYjdSUG1UZFpn?=
 =?utf-8?B?d2hHQUw3Q2w0bFRhU2JHQzBnQmZ2Q2x2dTVQQWc1Ym5LTnNUbEc2dTZTZGY1?=
 =?utf-8?B?RXJDMWtJd1QzL0RkUitnUWU2STF4RVJLVGUwODJZRTB6OTBvanV4dVNEN2VO?=
 =?utf-8?B?UGV2dk1nc3grdkxUdjlTNzlpWVl2M05mdWhreDBaQWhlYURUd3ZMT2ExL25Y?=
 =?utf-8?B?T2lqSWNZZ0hsNVJpeHEzc01CQ3dsN1RZbno5T01Rb0hidUQrWFVuQ2RjaWd0?=
 =?utf-8?B?cXc3bVZoY0lHSXFJTDg0TE1PRUJPREV0VXNldklDWDAwS1NJODRZaTRVU3Ax?=
 =?utf-8?B?Ymo1bTNHelpZZVBNcXppZzAzdWE4SmxZOURTeEdGUTI1QW9LYm9oMjZuZjlS?=
 =?utf-8?B?am5JcFI4QkpDM2R4bjdVeVd4S08vaGwveDgvbjY5cm9hdFJzdVJTTEtnUFVz?=
 =?utf-8?B?YUZHektZRDVLSDBWYlBvT3BaODh2MWo1eUx3d1BaeXU5ZjRSQ2ZNUHBIU2Fw?=
 =?utf-8?B?WDh3d0RKcEJKNFg1dW5rQnF4dEdMMU1zb2o0bWZqSlFNeGJEWDh3d011STcv?=
 =?utf-8?B?V2M2dHFBb3lncHpmM01Ub2RLUzZ4Zk8rcDlWWnJTUEZiQW1VZmEwTEVoZElL?=
 =?utf-8?B?YVdEajFMSnR2T25lUUdMaStRemVlWVVkYVFRaE5Bb3RheHIvZGtBN1pFRlpO?=
 =?utf-8?B?SEFlemNkU0swNkJENk8rYUFOMzdDWFhCMFUwYzc4UnVCcGx6SmhhV3ZrdGh2?=
 =?utf-8?B?Skp0aGtyckZURFAwVXJzM2hNc09qcFYraExJc3BJRmhpQ3UwOVluRG0yLzdr?=
 =?utf-8?B?OEdZYUVtZ1VMSk80MGdtd1lKU2ZHSG5PTFY1eWdGK2NUaTcrTVRvSEFYTVRM?=
 =?utf-8?B?T2hGbUt6Zkt3VTA5TXd1NWhEdnVmMFVleW41UFkxY0c0a1VTWkpXYllFQy8w?=
 =?utf-8?B?MFlaVzhWWFRsc2pnam5qbTQ2TmhqSSs5UVN2VVE4MHZSNU1KTHlYL1dvUXdy?=
 =?utf-8?Q?qvmnjSFYYYrst?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGdqU1JyMlNacGxMa29Qd1cyRGI3bHpsVUl3TTJ4ZitVeWs0RjQwdmE5VjRL?=
 =?utf-8?B?NllISEVYNEpmSXNUR0pwb0tHZHJkM0p6bXdrd1RvcEt0NDNxbW9pbTVHTWVk?=
 =?utf-8?B?QUwzSEN0TitXTTFTZEpkb2hWSllvcXE3MWJyUTdVTHNTK1ZHN0czT25vbVRI?=
 =?utf-8?B?bE14ZEIwTjZSL21veEw4eDBKWkVxV2pDS01yOEpkY3NkT1JSRlBreU93bkQz?=
 =?utf-8?B?SWZHRmE1VmtSeFZFK1hRVWFTUWZzaWVGSUkrWXlZaEFhOFo2TUh5em4wdkJm?=
 =?utf-8?B?NWdZUFZ5RUNSSVI2SGdVSmdCWDBhNnZzQTloNklnbmROWDVZM0RQd3V5OGgx?=
 =?utf-8?B?YWJFT2tBaG1GZGVGZG9RT0QwRVFhbWUyQjEreFpnMklIdGYxaEd1dUYvQ2lE?=
 =?utf-8?B?cGJWeHRzWDFFcG03VFZWS1k4SjhDYldXMXNRK3Z4Z3U0anV2MVQ4bmVhcnlE?=
 =?utf-8?B?WVFEUzJYUURHQ0xmd1RzWmhXWnBkWnErWjNXeCtrVDMwVHZNUXRSNHBDQ0JX?=
 =?utf-8?B?MytLWW1JL0JNNzZhWDJObDV4cy9JQ293TXlJY0g3UU43eEFZdis4SzY2WU5X?=
 =?utf-8?B?QnU0bzdHZVJSTVd5WnplK01YTmZGTHFYM1hDSElIdEsrTWdUZzlBNlUvTzcy?=
 =?utf-8?B?TllRUTROTXlqa2I1YlNnejNXRHFQM1YrUTVVQ0JGL25ZWGFRQXl6UTJLNE1n?=
 =?utf-8?B?NlhOQldJOUQ2czhBUlZxc0RQczdyTlFndzFmVDFadncydXBKZVZDRDhLa0Vl?=
 =?utf-8?B?ZHZudGtzNGl1RFZjeVVsdFQ0UTE5T1RzdmVGRlcyNmFaaUU4dTRIbzA1TFJX?=
 =?utf-8?B?RVZpZGhzY2N0TnFaV1FqRlFacVVIUVFyVWkvRmxFNjd5OUx3dTJCVGcxWFFU?=
 =?utf-8?B?enozRTNBZGlQQ2ZSazB2RTRscmFGMnRBRENQcEtJLzJYN1FVWFlWWWxQQVZu?=
 =?utf-8?B?ZloxaUJXaGFJUG9hNnc5S2gzek1xRlM5N0l1M0oxSzJZeEdnR0hORHhNMC9I?=
 =?utf-8?B?dU04YUZsTHVpRURjODVFbEdiaUc3RklrMlpNa3Y2blZHTEFVQjk3eSt2VVNw?=
 =?utf-8?B?dGM0QzA4alhjWXQ5RDRVSjU4RzhUSGVEalZYcEZGT3V4K0ZLZ3lNeDN0M1hx?=
 =?utf-8?B?eTkvaDlCU0ZBY3V0cDkvcXJBMHJ2c09nam5Wc2Jab0cySlBCMXhOT2I1bGs5?=
 =?utf-8?B?MXZseFo3Si9TM01saHlValJ2QzMzQ2txOVNIWVRFTnF5NDRQTmZ6ZkdBNzZz?=
 =?utf-8?B?RlpURVNOMGE3TGtrSnhoR1hVRGRaNnByajUyVzNTaENndnIrOXJGT28wS0xk?=
 =?utf-8?B?MVhrS0tRM0RURDVyamY3RzhQNXJWbjYxdWQ4SkdYcWc1REpmU0tZL1FJWGVu?=
 =?utf-8?B?Z28ybGI3QnNEd1BQQzE3MXE2SE9XS01mOHNvdTlqNkxEY240UStFYWtPcFVo?=
 =?utf-8?B?eFdaNlQyQlZJY1cxUUYrdjFZSzMzQThhbUhZUGVia2hxV2NBUjdtOTd1anRn?=
 =?utf-8?B?Z05nQ1J3YjhhYkJXSjhPLzQxOE4yL3FvNGJHbXJpU1AxZlpXdTNRd3oxcHNS?=
 =?utf-8?B?c1RvWFdXaWlXMk5vVVVFYkxLanYrbDU1cTF6TGFPWk54R2xkekJGQlEvRitl?=
 =?utf-8?B?UXdBNkxvRmNsaGh0SXU5VjE5Sk1JbVh5RW01QkpIMks1azVGUlpKVHhlRDNW?=
 =?utf-8?B?SnZ1MU9KYUZ3UXdBMW1PY1hGUzc1TFg4Y1o2L0hQeXFQeWFsSHZURHVaYWJu?=
 =?utf-8?B?YmFla1AvdGNlTUdJWG81N3BNVjZ3TWN5aERVUlg1RE5FTGduRzYxVi9NYjRU?=
 =?utf-8?B?M0JtZU4vVW43d1gvbCtlSVFzN0o5TTIzZmMxSVlWemhIN20zN0RYTXp1Wjlm?=
 =?utf-8?B?VW16NkFQM3hXUExJM3pVTlp3YzkvcE1iL1ZoSzRnT3pkbSthTUFOZVRRWHV0?=
 =?utf-8?B?YkJXZ0tDZUhVbjNuaUc1UGthc0k4UFJ5MVJGcmNjbmQ4QzZsN2pnMS91ZXd3?=
 =?utf-8?B?akx6VVkwUEpGZWd4dXhQajVuRWNJbmc5aGk4a1d4RlozSzBkTnFhY3JvQ3ow?=
 =?utf-8?B?dG5kNDJ2K2tzMUdUNUFVRWVLT3RJMlcwcHhwbHdSLzdZTVcyL01JV2RPK1cr?=
 =?utf-8?Q?MdWSdDOW8B/dsZ7sFIXDPkCBn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d29c0e8-8fd5-4cdd-f9e3-08dd67b7f935
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 14:03:21.8645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jTIshI0DAJ+1mrp7iOpwKHodaHVAkEhn0aSOr6+uJm9mvhw3reesGzjmF6iG5d1KfO3M0+4yNCxMgX67471qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
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

Thank you for the review.

On 3/17/2025 10:31 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-03-15 at 09:38:05 +0530, Karthik B S wrote:
>
> please make subject shorter, like:
>
> [PATCH i-g-t] scripts/test_list: Do not stop the build if documentation fails
Sure will make this update.
>
>> Current approach stops whole build process on a case that there is mistake
>> on documentation. Let's have entry on logs instead and continue.
>>
>> Small fix also related multiline data e.g. on Description part.
>>
>> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   scripts/test_list.py | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/test_list.py b/scripts/test_list.py
>> index 867d28400..93a35ca71 100644
>> --- a/scripts/test_list.py
>> +++ b/scripts/test_list.py
>> @@ -1399,7 +1399,7 @@ class TestList:
>>   
>>                   # Handle multi-line field contents
>>                   if current_field:
>> -                    match = re.match(r'\s+(.*)', file_line)
>> +                    match = re.match(r'(.*)', file_line)
>>                       if match:
>>                           if handle_section == 'test':
>>                               dic = self.doc[current_test]
>> @@ -1408,7 +1408,7 @@ class TestList:
>>   
>>                           if dic[current_field] != '':
>>                               dic[current_field] += " "
>> -                        dic[current_field] += match.group(1)
>> +                        dic[current_field] += match.group(1).strip()
>>                           continue
>>   
>>                   # Handle multi-line argument contents
>> @@ -1427,7 +1427,7 @@ class TestList:
>>                       continue
>>   
>>                   file_line.rstrip(r"\n")
>> -                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
>> +                printf(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
> As now it is not error change it to Warning:

Sure, will change this.

Thanks,
Karthik.B.S
>
> With this
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>>                            (config_origin, file_line))
>>   
>>       def show_subtests(self, sort_field):
>> -- 
>> 2.43.0
>>
