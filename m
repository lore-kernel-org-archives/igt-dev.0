Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3193C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 05:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7332A10E97A;
	Thu, 17 Apr 2025 05:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5WWn6M8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6127310E97A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744868557; x=1776404557;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FDsitG2KKhz9wa4kfZJl2dS77vl004GS9BEqDlDyCoI=;
 b=V5WWn6M8Vb60GTf1tRFj6izUWz9cBRo5F9g3pMC6wS82NyHQKbCd9jgd
 BXthpSv8IJ3/AWFjue/sKKHgyiaUZ1Haq+mPcaqFNeEP0EzmmDTrhIcyp
 FzPgy4JODxTscHeeFexqWWKH02av5MUbOpz6GGew6ddQrrCia2MMFunrX
 EqohEBR8rtRbG7th07aKWMRH7gnR910zhcOBZibE1VDqY1B7KbxCYTbNX
 zSSMPzepYtca+fdSLqF7c55nkZ48VbqmnVPfKomyTYyw3vrmXWnfbpb+O
 36rSWmh4sgCxkcWllxgNq4wFNbuyvu1tQQqdxq3zdFuPjfAFrsYsCQwe2 g==;
X-CSE-ConnectionGUID: KF0Zk4uJRmKPWp1pu7d4SQ==
X-CSE-MsgGUID: mtPKnQWvSq+YEAuKPN5E+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="34055181"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="34055181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:42:37 -0700
X-CSE-ConnectionGUID: rlRyedHVSyC1HwkkMH7aEQ==
X-CSE-MsgGUID: xdoU56jmSP+5ZQOmgdENlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131010277"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:42:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 22:42:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 22:42:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 22:42:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPgRstk0JEgQIqQE1QhFJzxdL2OOMxKggLD6AbUWTPKh+2+e8ffSxL0COltUCVYwi9upVgYS0K/bmDcdvj69dK9urxu/JAGQtUlhO7ZXYzCqxHVpG/U4gf30MybcX2zsnXERV1yKwQ+HUJ78PUrfnv+Wmr1g/kejJcn32JHkE+6pw/IeO5XVRM1k8PDDk9MyUaDcKXN37PR5PxA9nraFASBv0bNr4MNm9WJhXvQ87z2Q93lz8cFf2oA/ngr1rDt83fjwBFdkkpdxslqflc31IIXhezbmKIJOoshsGuay5lOC9BoG8I4T3wV3njASmKCvMkniebn50W0copYibUrimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdim11SJ3OYUUBGrjewdJcKV/zl3RieAdfduSl1z4ew=;
 b=byJu50OEgtMDBRPRKuH0AUbyaMsWzdU+3xA+DBzcu1QC3aUdhr4VovXfhgYv1kxEYIwexVX4cfZnbx88siklYfiD2g8XsT0VBmpQ6XnBXMnJVLhLo/NY6Bwhn4D2NtIjuJsjbe86IZ0uYpLo/VwHtSh2sCT1/51GgKJlWiyA/l5atxSQvLIXFoI1YrBdDObNNQXM1mILPc1q5G2MQ6Z+tbWK1JqDCt2OTuge9SadtfR+IrRejrecqtO69Jlbc/HYXxDm+DE+hGgwceQkHLcxvW5KLLkhpae7nU0rWnRGK4xeZzzgCSF+VFvme6Fzm8bESBP0N5paHv+BvGSfAM7O5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPFE9E88246B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Thu, 17 Apr
 2025 05:41:54 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 05:41:54 +0000
Message-ID: <740538e0-c4f9-45e9-953a-319326bc11ed@intel.com>
Date: Thu, 17 Apr 2025 11:11:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] Revert "tests/kms_display_modes: Skip test if
 joiner display is connected"
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20250403104149.2033579-1-jeevan.b@intel.com>
 <20250403104149.2033579-3-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250403104149.2033579-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPFE9E88246B:EE_
X-MS-Office365-Filtering-Correlation-Id: d8360dd5-b20c-45d6-47e6-08dd7d728ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1BYeXg4ZklOd3pxUDFwSWtVRkJ0K3Z2K001b2tRTm9nZDZycytLK1AwQnd4?=
 =?utf-8?B?YkJHRXdXRDFkaklPOW8vdVBTYXpnRG5heG5KWnhJdVhjV1VadGlNYTNBelJX?=
 =?utf-8?B?L2FjdGlHaUhKdnd0VjJyVHFwNmNMejdVbjlkRitaaXM1NmFDZVpsOW1GdFI5?=
 =?utf-8?B?Q1JrRzMwNFd0TFgzdm1SOC9YUHN2RGZNMnB1Q3dzNHh1cFpLVmRvY2JjR01l?=
 =?utf-8?B?Zlk0TjNvY2lTVERKRTd2TWNINTdiK3lmaDJYODZKb2MrRkdsK1hGK08xblVo?=
 =?utf-8?B?bUpoeFZ5VHhSZ0d2NzJQd1ZxQlpKaVhMdHdCQmRYMDRmNFozcGFJNzNqV0Rm?=
 =?utf-8?B?QjZOUkNSV05mL0xEQkkxcHdnV1B5eG0zRWZUZFpVRkFVRGRQTk8vSUNuZXV0?=
 =?utf-8?B?WkdacEswRXJSem9DQVFnSWJ2Y2dGYUNHMXI0MXp3NVlXcW8vZlJSM1lWQmUx?=
 =?utf-8?B?UmRxMkhhd3BHTWRVNXB4TzhkQm5xU2FCQmdzS0hkY3NOMjlRWDhzQzJaMXVt?=
 =?utf-8?B?QXVUVUZZMFZjWWpGa0Y0emVHaklyaGd3YjJ5R2oxd3FHWlF1MlRpa2x2S1N4?=
 =?utf-8?B?ZkQ3RTJZVTZtU0hHV3VNSUtxVStXdzViWCtrSy9QOHh3aTdJREo0UjZaMDdJ?=
 =?utf-8?B?ck1VN2NIRkFvbTBxemt2QklnM3BXNTVMdmFheXQxaHdvbDh6V3ppeFhZNzBE?=
 =?utf-8?B?bGlOYUVvdHIyN21kajkwWldScTRDWWJPVncyUk9wcm1xSUs2RzNsS0twSUhT?=
 =?utf-8?B?Q1VJTjFVZldJbXVMd0c4OHQ2MkcwYXZsOEhzdXk4dEpEOXNVS05aY0l1VGRK?=
 =?utf-8?B?dFI3YlB0TEpsM05SNXZtdWVpQ2VLZ0MxcXl2UGJsdFRaYzQrYUVoZ2xHOVRt?=
 =?utf-8?B?alFVYzAzU2ViY2NvRk5Bd1JWMlFMQWFLcUtqRjBQcXJhdllSeFpaWkgwYWNQ?=
 =?utf-8?B?VFI4UGNZMUpXVmxYcmpDY3V0ZkprckU2b0pQTXZuL0NieFFuSmxPeW8rTkUy?=
 =?utf-8?B?VEVnUXIxSzFCbHV2bVJER3pReGdYOWhqakVMditIWW5rcnRnQjAxSyszNnl0?=
 =?utf-8?B?QndEa0tGVDJWZmVDc1dhQk16cnFtb2kyWHhvbGZwSTU5SEs1WGJzM1lEY1Uw?=
 =?utf-8?B?UEY0ckcwWmtUK21kdGhVLzREVjlPcHRTWFJNZmhtS1RiR2VZaHoyc2I3Ry9P?=
 =?utf-8?B?NjBmTFE4aG5lVzhQR25yTndiTWkxaWlCTU5KMCtITStsVlN2cGxPSFFwVWlT?=
 =?utf-8?B?ZnplNk9mR1REU1pGQTZkY015Qkc1TGVKVDZnTUtZckRubys4Vmpsejh1U1dq?=
 =?utf-8?B?Q3JIZm43ZlRkdVNLeTd0ODhEeWlTcmxpMklJNm1hNHFzbmtvSHpXZFRCQXhh?=
 =?utf-8?B?NmdmbFhHYnN6VUl3eXhyWHFxcjIvbU9lRDFEbFVlMWd4S0FJaEx1RVlOa0Jh?=
 =?utf-8?B?MTBPRERrK0s1d2pObzl4cDdRYnhNSCtxejMzdFFUMExTSWpDaFNpbi9Va2FC?=
 =?utf-8?B?REx2aHB6TGY5QnlJMEc4VmNHR0lTVEd5NkpYbTlrbEh1bmJNN1JsQTFpQW1F?=
 =?utf-8?B?TzBPQWY5SlBLTFJwY3dkMVJnSEhXRFBDdExETzUxZTB2Rk5ac0FVakxuV25T?=
 =?utf-8?B?VW9PUGkrM29CVndYc1YxTVdTSlRKNUhoVWhWWklSVTFTSHZ5Y2JRcm9VcTJl?=
 =?utf-8?B?RW5vR21iWHNrSFlIU3h4UGMwYTN5MjZNR3NkeDR2UVh5UVNMN09zckJiaEk5?=
 =?utf-8?B?ckdLTUZKcDNoNkN6UG9LUHYxSTJGcUc4MnkyeHVXdUpnZ0k2ZEhHR3c2TDNU?=
 =?utf-8?B?a25TSTJSNUROS2NxYXYrR2taT1BwTmpMREVwWkZWQlh2Z0ZTbWZ4Qm1YTldB?=
 =?utf-8?B?MEhWTkZQYXBCR3dmblhwL3RqeFdJZTY1ZTg1UmloSFFENHlwWEVCL2gxZ2Fr?=
 =?utf-8?Q?IszB50pcqrg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNKOHgrRTcvTlBNN3dMM0xKUGFTbXlHeHBLNjMwck1DR05VR3dLLyt1b0hS?=
 =?utf-8?B?ZDE0eU1kNFl2QjZ1MEF2bTVHODlNY1F2d3JENFRCU1N2YkNFSlRaZUpCWEl3?=
 =?utf-8?B?RlNpemdVTGZGVys1NG9iMGJLYjhzR2pSdHJTdUNiQ2FnWWtJb1RkbnJCekZr?=
 =?utf-8?B?UWtCSUtETGVzeHFHcEd1OE0yUmZTWjRhZ1BkUDEybFFGcUdXVmxmN2lmQWZ1?=
 =?utf-8?B?S2hTNjBubk5Ib2JsVVZMZ3pSbUZWcFArU3F2dVV1VC9ta21rVFRLZTZTYVpq?=
 =?utf-8?B?bmoyN1VhVXlybmJSZDh4N2Zya0ZnWDBiK3ZiWmNGL1lVaUNHeXhlZjhlOVpi?=
 =?utf-8?B?c2ZSVEJsMGlOU3RIV0I3N2RoOUd2ZHk5VS9FZFN5MFhJNXpkTytCNitLQ3Ax?=
 =?utf-8?B?WTY3RmtZSXJ3dWJnMjJpU3J2THhRTWVHZ1dsekMyUXZKZjJTT0lSczI1dVIy?=
 =?utf-8?B?YURhdjhjM2tTWCt4TEFqS0VmQmRDTmk5Z2UwRzBCYmQ2L3pNQitLWFhrVXVk?=
 =?utf-8?B?d0ZHeWk0UG1sRWVqODF4MXQzWXRaNXRPM2ltYnYwMU9hTmR6R0RMVGYveTVw?=
 =?utf-8?B?WVBQcDRUdW9uYTNaVHpRUlRoT3Q1eDJCRytVQWs1Zi9UY2pEVmxBN3lCalIy?=
 =?utf-8?B?T3o3MUFMb01LUzJYbmZyYW5jb2RkMXE1UVRGTFZsOUNZcmIvNW1aZmpySFZx?=
 =?utf-8?B?b3hqaFlMYW9rRmV5aVpQU0FaSHNTdlhmV1YvSFBBVTJxbHpNV25QTld5Q1dm?=
 =?utf-8?B?K0NRNGJkSi9JeHZPeHdxNVB5ZjZYVGZZczZ3elluNlJ0c2hlSWRBK0E1MG1p?=
 =?utf-8?B?WTVWL2F0UVdPemdXV0ZUSXpiMkpWWlFjTjZWeGJEOFErTEpzamFSQ0c3Qmdx?=
 =?utf-8?B?eEJTZGpoMkxEczBETk9nQnJxZnRDWFBmRHB3MGltcGcycGdtVitBYWZKV0FW?=
 =?utf-8?B?SEVFMi9TejkzUHZDYmxkalFRUkUxVnN3OWw4Y21hQVJNTU50N01NdXE2Mk05?=
 =?utf-8?B?QzB3N24xT2JwQ0hyZEtSY3ZSb0ZhTmgxc09GbnNQYjFId2xoTGE1Q0ZLVm4x?=
 =?utf-8?B?TTNScHlQdXNUNXJWUFlTVW52Sk0wa0ZScDlEdWdDY3hzc0plaU1QTXhTNWw1?=
 =?utf-8?B?RHEveEhJdlo5T3ZKSGUrRjZvb3h6RUZKNGViY0gwQzhvNEZSanRFUEs3Tm9S?=
 =?utf-8?B?ek0ycXRtamFtQjJuTmsvakZDR1p1WWY3WjRYQ3BMNEZtNUtZVnVNR3BiSmJ0?=
 =?utf-8?B?WklObWhIcGJRSlFjZW05TFNDeFQwaU9QMkRkR3BZWjdvbDkrUThzTVFobGM1?=
 =?utf-8?B?V0hSMUs0RlhxS052NW5vU3NlZUd3cCtjT0d1M2M2bmNWckJYdVN6WkpJUUlZ?=
 =?utf-8?B?NVNDb29xUWF0c1M4ajhMQ0NkQVNvNnJxbU1IQ2hXcmFBK1RBU1NLanNDSmts?=
 =?utf-8?B?QjNqNnZLbmtmQTNVd25BQ3A0OFNSMVpXTEh2MHEwVlAzUXExMG1JTEd4OGsx?=
 =?utf-8?B?Y0ZxLzNNd28vMzVJazdUYjQrZ0g5YktPVnBXdGU4ZTRjZWhLSkdaZzE5b2hW?=
 =?utf-8?B?TUJiY0FxVEx3QUhvRDFiNmJWYnkzV1M4SjRONXJiS1JweHNpSnBEdXRDeGx0?=
 =?utf-8?B?aEkyTGpsYXVhY1VvZjRQT0tDb2ZqMGdEWmZoNjBVb3c0Ym5ORTdYZ2V4T2Zu?=
 =?utf-8?B?Q2pLRUNtT0xUcGxJN3Q3K3pXbjZPZzFleHU0OSs4YW4vNm44S1VPckk2b3BH?=
 =?utf-8?B?dmVvcy90ZjhaUWF2OWR6YUZpaWtYMnhYVklJN0JvRVYzcTNHUjR6TzBPZnhm?=
 =?utf-8?B?cVBMOW95SWFhOThUM0xuRFNRKy9CQkpHbzRmaXZDQjFja3pmRGRHUUlHdUU2?=
 =?utf-8?B?M3grZXk3MnFuc0h0MktycTE0R2hmM1J0NngvRzFheEx4UGR6V3NxWlVCR0NZ?=
 =?utf-8?B?bTNNcEU3ZWhzVFo3Y3VXeDhBNzJSNmovLzBVcFkwbm4wamg3Z21aS0ROWHZX?=
 =?utf-8?B?enNRZlpZMytEbEZyWVdxZzRvZW8zM2QzWHdqcHNXTnFXOXl4UVdLVWJvUWxK?=
 =?utf-8?B?eHd3V1FxRThwUzh4WXJhQ0NHVFk2YjNDYkZDR2xqcERyTG9CMkt2UHFTN01w?=
 =?utf-8?Q?Y3gRDBS3EHgWKPE8djgQdDPYx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8360dd5-b20c-45d6-47e6-08dd7d728ef7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 05:41:53.9091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf2ozqtEkRzGb9F7UtkEmVP2b67K33qHZzw09rUWWX1VOgCnG/P3Iyvi/uaA03KtlGRnWu3wtJlOi2Iy21mlbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9E88246B
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


On 4/3/2025 4:11 PM, Jeevan B wrote:
> bigjoiner realted checks should be handled in igt_check_bigjoiner_support
> which is now added so removing the checks which is no more valid.

Nit: Although the commit message conveys the required info, please make 
it more readable.

With this,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> This reverts commit 5f7cde6a98783c97649bdb3879bc016b3bf38297
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 588820170..d53b83a86 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -184,11 +184,6 @@ static void run_extendedmode_test(data_t *data) {
>   	for_each_pipe(display, pipe1) {
>   		for_each_valid_output_on_pipe(display, pipe1, output1) {
>   
> -			if (is_joiner_mode(data->drm_fd, output1)) {
> -				igt_info("Skipping joiner output %s", output1->name);
> -				continue;
> -			}
> -
>   			for_each_pipe(display, pipe2) {
>   				if (pipe1 == pipe2)
>   					continue;
> @@ -238,10 +233,6 @@ igt_main
>   		igt_display_require_output(&data.display);
>   
>   		for_each_connected_output(&data.display, output) {
> -			if (is_joiner_mode(data.drm_fd, output)) {
> -				igt_info("Skipping joiner output %s", output->name);
> -				continue;
> -			}
>   			data.mst_output[count++] = output;
>   			if (output_is_dp_mst(&data, output, dp_mst_outputs))
>   				dp_mst_outputs++;
