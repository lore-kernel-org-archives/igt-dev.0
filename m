Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4226ACCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 20:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC98D10E23A;
	Tue, 14 Oct 2025 20:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsAs52up";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C706F10E23A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760474441; x=1792010441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jMBWfyZwYwJQeLPu5k0bfcwZSHrVNQ20MvQ9r1ypdJY=;
 b=YsAs52upvrTYzw2E0sfjGeKB5ioDV5fR5TTvchrd2FNf58SLXw38BnF6
 83qGxvidwTWIKEytEekIUiTPGYhg6Zbg4KGFfC6Hew8Y0ZUSzWsrsxNEl
 2QSrR1kjlv4feH/d9WB+ogf1MpVOT5xpDxJwugFxmvfmt68uzkHJlI0T/
 0xRAy+ogU1IVDpPDnHRyTwXriB7O7pVvr+Vj+ze1+RBRO3YDlu8xeIsqm
 h+hNEU+n5L4psQtTF5iORqlaHI4hDauTmmvx/6iXjW4eKAqvmr2uPUXWl
 i7IZyCupqqUeUT9yXRYndpOMauu33tb9lhduk2yeWBlNYp7fhdhxd/y+K w==;
X-CSE-ConnectionGUID: MA3Ws16SRpikXfOZ5XJqfA==
X-CSE-MsgGUID: KSWLRohmTHWf1z3WHih5+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66501182"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="66501182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 13:40:40 -0700
X-CSE-ConnectionGUID: Ys75xx/iTS2BmkSQTuSq/A==
X-CSE-MsgGUID: yk4slsGxQV6SzlASkNm6HQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 13:40:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 13:40:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 13:40:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 13:40:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAJGrwmXvOViGlkGnrjk5vXt7AsQ3pf7hs6SrHmPvjiGMI8lqByNeme7qdqO5d9VD0aISjniVdn6+fEdms2lnc0ykFCZ9FTdhZwhXqci/mywxemZb5eQUAY7QxWpwLoct8rEdJFgEb0Um/SBUJgqX6w+QdpLE1iqJd0RxoywzYcRAISSsEZAPzJHGpm1dqQSAhWLcbn6lJ6hoVzbJAIwyQf1OjvQ8rS7TEd8m9rfrSPGmbyZjf93Tt5zUc8DLxazydznZtyLuO4ylQNM0WBF6KompLZiD4gsWAnrOGfBtpXpBNEx/NVwO/LSuh9zV2kpHlJ8oxJ9eJp0b/Xuagr/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjows35JSTogRXbxrk+xXG1f6glY5t5YVyNvWh3CWRs=;
 b=QUOuDsW2WMSKavjoZIaBVQrh9HJenmtcahl40s4VkJcZiyLa84R/tLYe0pUjeHsfVTFs9Ca5qCd6T0wcE67asrBjY5DRB4keyhN4zhBLvWf5znO3SqFmBV9+BpUvtNaN6pDcazcHPFNXd+tLV8uhEHpw4Np1zAt9SW0fwM+TyfqetuxcvOk5Hg4nd8GuTUP6KEBlmvxBSFTA2ky/muCgDgu2Wqj+pQzPKTXZOQcYZSqBwu3r1u7rs8fu6jQaXT0DraZRHddTueTN4GT0+LBglmKXTqun/Op7PYiV7nSy8W/U+ALFUkuw07bQuCqw5Cwa1q7/baseLp1W85zV0Sc6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 20:40:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 20:40:33 +0000
Date: Tue, 14 Oct 2025 13:40:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 06/18] tests/intel/xe_oa: Add for_each_oa_unit
Message-ID: <aO61PkJXLK21AZv9@soc-5CG1426VCC.clients.intel.com>
References: <20251013203042.925115-1-ashutosh.dixit@intel.com>
 <20251013203042.925115-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251013203042.925115-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: afd67e62-07cf-48c2-7b09-08de0b61ebb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dld3VGZERTFWcXV1eWlYUTNwbHlDR3hTVFJGMm9iQnROY2syV3ZrNlZ2YmVi?=
 =?utf-8?B?T0xNQWFzSXFHVzlaa1JGS2M2NWx5SlZ2Sjd1NE5GSUtySVRnMEJnM0o3bDhS?=
 =?utf-8?B?dzNRSHZhbVVoSkt1elY3RTFRZnVsNERqbjN5REN6Uk1KU09XZzFoQ1BwMGNz?=
 =?utf-8?B?ZjJsNVhKczdIMXhiVXZKcHE5NHljODcxRjJjVUVzdEh0eDA5ZnVYZ1FFVjNZ?=
 =?utf-8?B?dDY3ZGhoVmEvZjNjekxaQlpQdUU5NzNhZGZNb01OWFp4emN2L1dDdWlCZm1h?=
 =?utf-8?B?azY3V2c1MjRyenJaUzJGNUkzR005bnM2VEs0bWxJUmQ0VWdlaFkzTnc5REc1?=
 =?utf-8?B?MEJqUW5zY3JUbmxGT0xkbEkwMXk2L3BxaE1vUjB1ZG5lWXVQbkw2aUhqV2dh?=
 =?utf-8?B?eHcyaWppbE5SRVpRVUlTUVFucG5Lb00xTjJKMkFmby9PdUY0MTF6NnJhNjU4?=
 =?utf-8?B?ME1FRUFhS01aeVM2aFh0VmlqYTU2QTRaajJGY3NoT3krcG9GWlZpbnAvS0tM?=
 =?utf-8?B?cnIwSFJZRXh3cERhK0p0L2I3d3krVW9RV1JoT01aV3RYcW92L0VURzVjL3pn?=
 =?utf-8?B?amg1Mm9udVFUV1pWMDZidG92SU5WOEhVU2FwZE1HV0lIVnBLcnkvbGw1SXl6?=
 =?utf-8?B?UDNWWEFwOEhSZnVPSUw0R1VvcVRRSHlRZnR3Y0gvV3pBM3d0Mlg3R0xRMmlY?=
 =?utf-8?B?b3BzNUI0aEhmR1BIOCtneDJjaG9PR0JNMDhnaTZ6SE9jRUZuK0o5UjRQOCsx?=
 =?utf-8?B?REJ4aEc3aURTTCtOSmtpNVdjQWZGMmt1cFF4alJiaUNFM1VCK08zSGpISHlZ?=
 =?utf-8?B?TzkxaG1tYVR2VFk1aEc2dW9WVlE5OThabGNGYlJnQ3BCUTZMRWVLbXJHV1Zu?=
 =?utf-8?B?MCs0RzZzR1lybTVjaVE4dnRvcUJSOXE5U0dNT2ZaUW1xaGkrVFZZMTFrUFR3?=
 =?utf-8?B?VUFFRU1xNDdBS3pneUtYUngzeHduSS9oTzJoR3UxRnUzK2k3WmM1Mm5EMG80?=
 =?utf-8?B?dDNpZ2xDR01aN1hqUTVOVVRPQkFRaFloQk5PWWc0QTRtYkNOS3RZZ3lVUTRo?=
 =?utf-8?B?ZjNaS1IzVjFKbG5zM0RXS0xUQi9TalVYeXVWeWFmMW10ZlhuYnRoWTFRVk5q?=
 =?utf-8?B?QWZ4U0dFK245ZWpKTmQxZkZ2cWVReUN4Z2NZTEJCL1phU1owZFRrZGk3RnRQ?=
 =?utf-8?B?ZExvbUphREhjdUg0MHJHTWxMcWlHSHFzMHhVSTltc0l5MUlnbTd0UDcrdDMy?=
 =?utf-8?B?Rmp3eGx2bnRmY1JnSVM1VU1zVjFiVXhKQmxkQjlvbVFHZ0dST2pHVzR6N0tF?=
 =?utf-8?B?NHhTd3BZb1lDRDFQT0JaYnJQSUNGM2JNaG5zck92QmxLNTZtSG15MmNKTDFo?=
 =?utf-8?B?bDMxZE5QWXBoTDJCU1gzZVZGWVd2S09Kb0NlNnB2a3gzcFVvMTlyeFEySDV5?=
 =?utf-8?B?dENpbURSSmk1Rk1oV1FSMlRiQ2xJNzdGZk5tdWZxOXRTZVJxak9jWjg4UHFM?=
 =?utf-8?B?aXc2dmR2dUR5UXY0NzJLNFZUUEFYTGZqdDVKOTBubTVXdzVVbFZWVjdYYXNP?=
 =?utf-8?B?RjViSVg5L1Zud1FIUjJnTUlMMmhwY3NjS2I1YnByM1JCd21GQzVObTFjTUhX?=
 =?utf-8?B?SWNtZ3FGL3VNRGVGTC9mVEIzUWJDQ25JZXZUQ0NGV3c3cEJ5NHJzNisxZVR1?=
 =?utf-8?B?YXJNL29ZMDdEeUo3d1NxZDhjSkdrRWlVdEdFSFg4UGhDQmFSb01KbGdZQ1Fv?=
 =?utf-8?B?ZTdBZGxUMEU0aSt0d3p5cVpmSzJIczZBU0hMZHZaUkprNmJpSGVOWTFMM0Iz?=
 =?utf-8?B?N054ekR6RmxSRmpoZDZ3YXA4VytORWZ2Z09hL3FrSGo4Y3VNMFRBd1I2U2oy?=
 =?utf-8?B?b093MVd6S29PMk9OS2hOZ2dwZWYvN1ZQckw5TGNSOHBLUVczZmVXNWNtalV2?=
 =?utf-8?Q?XWEdFIduRSc4y+kv0cCRvkTLBv82C9Fp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1VFTEU5Q1c2b2JKQjBnQ0ZLRVI4bjlPVE5rMzJsSkFOT1FJcUNzYUhBdFNi?=
 =?utf-8?B?SFRhYnllYVhiRG55SEEyK3M5bFU4cWhhUlZrM3JCMFdVMkZPcUVVMVI5MkZG?=
 =?utf-8?B?YzhaTU1TR1BOUUZhK00zUjBsMkMzSU9TSXlDdlRzSHVCS29MY3BER2p4dHVx?=
 =?utf-8?B?N1ZUS0RGV1VRN0V4N2tSUFgxUVM1S3Q4SWVPTktXUFh5VHJwSXFzZjN2aExB?=
 =?utf-8?B?YzVIQjBlYVdVMVpZcWdkUWdLakZsVTd5MHdacjRkNE5jc0VLSGhkaVEyWkdE?=
 =?utf-8?B?UXZod0hHTzg5Y2JHYUZPcUsvTjFoQm1UemJCeS9EeXhJVmNkaS9oZm5FbVBM?=
 =?utf-8?B?MWVCeC9peFNQNUg0MGM0b1Y5ME9MdHVpWjNLcTBKRlo2b244MUZ2MEtwSWhR?=
 =?utf-8?B?TTlqZ0xQeWJadnJSaElzSk15VUZvaHh5ZVlQVmFiZEs2cUdEUUFBaUMycVc1?=
 =?utf-8?B?dVpxSElGNlFpd3B2QWs4VnREN0MwdnFobG8rNEFNSlpzSm9zREE5NmtwT2Rw?=
 =?utf-8?B?cFpDZUErNjZiSkRvUXpxcUVHYW9WUW95LzEzNW9uV3VTendqd2htSm9nMXR0?=
 =?utf-8?B?M203MGNGTFpVejJTeGxBQ2p3UUxiWC84R3ZEcks2VkdoRmJwdGVxYlc2UVNN?=
 =?utf-8?B?dTdpVFp6elRZNjY3L3Awb2hVKzdudHVZa0lXYWtkNk9DZ2c2N3kxK0hiZXJZ?=
 =?utf-8?B?OGx6anQ0eFplZFQzaHlBYTQ0K2ZnNW1PZ09HeUdOQ1dOaDB3eGRrOStKZHgr?=
 =?utf-8?B?MXo0cG1mRUNMQmxyNXhHQ2p5ejR1QnIvOWdsSDAwNG5rNTNIeHhEbTZSbjhN?=
 =?utf-8?B?M0V0N3JGQXNLTWsvUGZqdzRydzVteWE0TlFLUVl0VXk4VFJmTXZxL2NvOVM3?=
 =?utf-8?B?b3djUHdFdUpBRDhyOWJqei9jNk1DeDYxU2txU29JYUlzVExmNGNUTjVwWHJr?=
 =?utf-8?B?bDhQTGtNdVZnckZack9PVVZNZDZKUUdIUEVkcUdJc2lSUklMbjRrK29DaG53?=
 =?utf-8?B?dldXZkxvNEdHQ3Y3R0QwRDErWklVSTNHYXFDSXVIc3lIRFJiREdVcHJ4N05V?=
 =?utf-8?B?OXVzZkxkQlBudFJmT1hQSXJrT0ZZQmlCOU16ZGNZY3VSem5kOGxpR1pISnZR?=
 =?utf-8?B?dmUzOWdKcTcvWEZCS1NKUE9LbDZiYjRmZG4vVVMzL09wMGVGU0tvNE14ZmVL?=
 =?utf-8?B?UlVMSUhCS3hpSmg0WXBZWjZGL0dxOVIxUXFiVDRBWURNMHU3VEdiRURSQ2wy?=
 =?utf-8?B?dlZKYllTRVFyK2s0bll2eDhBVjZzaVFuYU8wN05ybHFPTnNTZU9jRFVFL0xT?=
 =?utf-8?B?ajNhLzBkUnc5YmZHNUZhY0RLMGsxMFRESVZ6SnJOOTIxRjNUQ213a1craEZ1?=
 =?utf-8?B?ckRRQzNteWNvUE9OTGhFTlNtV2wvbENRVFRZRUwvT0tsWUNMUS9oN3BEaUdK?=
 =?utf-8?B?U0tRNlhIT1hrdi9tL05FQUwveFNYbzN6RkJjY0ZOUG1TOXdvNW1OUEJ3RXhL?=
 =?utf-8?B?Q2VYNWVqSUQvSGxBU0psMnp3Q1JOQlk4bHhBNzd5OWM0ZjhNeUhVSSt3a0h2?=
 =?utf-8?B?aS9ONkJiMEw2Y1EyZWlMZTVQNjRBSXJSQzFlQ3JjYlVrSXhYOGU5WmZoYys2?=
 =?utf-8?B?U2Ztd0xscGovbDA1eEN0VG42RXNuRVY2VzJBS2dWMlFCL1JXWTY3YUtwM2w1?=
 =?utf-8?B?LzJOcVo3UXQ2RHU4S29rcnI5MUpSTEpWUk1IQTBjL2tnQ3hwdmpnSW1uYkxN?=
 =?utf-8?B?K21zdEJqaEx0NktHbXFKam5obEVkd0hKUm91N20yc0VWcjZYN2tjd3BtNlFV?=
 =?utf-8?B?Y3FlbUNLM2xQNUEyaWwzR1o2RDB5emV2M09CS1Yzbnc0RmJjSGNIZVMxL0xT?=
 =?utf-8?B?ZmlRWlpoTWlJZTl2TldVUUVVVDVaeGNVUFE2YUt2Q2d0Z2NLcU8wdnNlZHB2?=
 =?utf-8?B?Q0szS2dBZHBXcHlRdFE4VFJRMnhlc0NnOUlFMnRYeVJCc2I3RzRCelg0aWho?=
 =?utf-8?B?dEJKS25MTXh1VUdJTlNNRHZ4NXVpc3Jxdk1qOWVRKzZEVTFjNnliNGVHQUQ5?=
 =?utf-8?B?VDN5WnZaV1BoTndXa3JUS2wyV01zTXpkK3RSZEpHVUlUbkx3eHh0aGh5Uzc4?=
 =?utf-8?B?TnU0UUJiOFpMQkYxQjdwWTVFV1BrazBqWVBTcktiaFpYcGw0ZGR0ZnVMTHR2?=
 =?utf-8?Q?b+K/OtsHi8JjwyvNzzo0n1Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afd67e62-07cf-48c2-7b09-08de0b61ebb5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 20:40:32.9473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MHpVHgkWt7goa3J8Cf6X5ZdcJ0rHNTSmDjk57qmJQ6BFf0pX9IV175PrWzFwTWhSuDgUCeW1qGfRZz8f3YTv250wYgD1ANCwkn2orKix+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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

On Mon, Oct 13, 2025 at 01:30:29PM -0700, Ashutosh Dixit wrote:
>Add a for_each_oa_unit iterator, which eliminates code duplication when
>iterating over OA units obtained from OA unit query.
>
>v2: Only retain oau argument for for_each_oa_unit() (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 35 +++++++++++++++++++++++------------
> 1 file changed, 23 insertions(+), 12 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index a4aeaf2c70..8e73182700 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -477,18 +477,34 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit
> 	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
> }
>
>+static int __first_and_num_oa_units(struct drm_xe_oa_unit **oau)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>+
>+	*oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
>+
>+	return qoa->num_oa_units;
>+}
>+
>+static struct drm_xe_oa_unit *__next_oa_unit(struct drm_xe_oa_unit *oau)
>+{
>+	u8 *poau = (u8 *)oau;
>+
>+	return (struct drm_xe_oa_unit *)(poau + sizeof(*oau) +
>+					 oau->num_engines * sizeof(oau->eci[0]));
>+}
>+
>+#define for_each_oa_unit(oau) \
>+	for (int _i = 0, _num_oa_units = __first_and_num_oa_units(&oau); \
>+	     _i < _num_oa_units; oau = __next_oa_unit(oau), _i++)
>+
> static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int id)
> {
>-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
> 	struct drm_xe_oa_unit *oau;
>-	u8 *poau;
>
>-	poau = (u8 *)&qoa->oa_units[0];
>-	for (int i = 0; i < qoa->num_oa_units; i++) {
>-		oau = (struct drm_xe_oa_unit *)poau;
>+	for_each_oa_unit(oau) {
> 		if (oau->oa_unit_id == id)
> 			return oau;
>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
> 	}
>
> 	return NULL;
>@@ -496,16 +512,11 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int id)
>
> static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
> {
>-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
> 	struct drm_xe_oa_unit *oau;
>-	u8 *poau;
>
>-	poau = (u8 *)&qoa->oa_units[0];
>-	for (int i = 0; i < qoa->num_oa_units; i++) {
>-		oau = (struct drm_xe_oa_unit *)poau;
>+	for_each_oa_unit(oau) {
> 		if (oau->oa_unit_type == t)
> 			return oau;
>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
> 	}
>
> 	return NULL;
>-- 
>2.48.1
>
