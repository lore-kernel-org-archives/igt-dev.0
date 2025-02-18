Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22A2C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 18:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9510E06F;
	Tue, 18 Feb 2025 18:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJThVuzM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FF710E06F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739903901; x=1771439901;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bxakb5jEBdsmNjJNAJvnT7jUe8CDqEcyKbrwhexSUqA=;
 b=MJThVuzMIGjyBIt/ybLI3QjPHEAPynFDgk809U2VNuMkMfuwmKjtjQgQ
 vtvb2rvpPoj3th/jzIR5s/TpWz/88ZSJP8gLMz0jMx5kLXW1BOMT+AksW
 7MD/Tn5hThihi2w1c2N64wP1TUpKZV/niI7xkqIHLDbXlFM6ee96/k0wL
 hF80biH/Jj5kkPU/TWbFPvWNSDdJ8ikPF/B/hQoWZhIhitFKRFYFaELFr
 SUt7DxOVGbrZEBhUOABwrVSbsis3XrhME/OJ/ZOaXHMYtscJiDvDNE3ax
 7bkxHUMG1AJ9j6jaKCQN4rfeT5HDBJ5IjW9kmVtlASan+5hW3y/zUOFPS w==;
X-CSE-ConnectionGUID: bFKciu6wRkKgFseyf2iA1g==
X-CSE-MsgGUID: nc1M6bTYQOmh9JLjDGnnOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65972435"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="65972435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:38:18 -0800
X-CSE-ConnectionGUID: GT1AC+81TdeqRUwhNXZkfw==
X-CSE-MsgGUID: T8i2F1W7Qf+vzcURAEcfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114404769"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:38:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 10:38:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 10:38:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 10:38:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGW0WR16A/2AIVzEYmu5cGV62LwGVOSmORr5JMXZTCNDSMAyuKqtC5GBlIiFH5xK7y1daFshwIohFJ7+yn/kpBriWQdTAwbBW6HLcIf3J2uW6NGmYmBm+/8+YgLI15Yomt9QI7jfGy86Q2Pb5WYrwv/lyVQX3G6w0GSgxESPuSttgMjRfsCXFpE6MfYvW6T56zppepqXDwBOSlXZSo5Az9O0f7e+0L3jRU1LDfBMzYjHma8bk3LVU4z9/cLMfwl+aIsv1tUX5QKQPUVkBTZuPaGhDHhl6p00XEfo32UcNiEavxT+eT0Fs9WDbQEmTR7L8Lv802/xxbb1FLpWuPw5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74OIrLWK0etp4QncmUOyPeD1yhXmrdT9X3woaqpWk68=;
 b=G2ITI9nGlcyAR5aa2ARoekVxoBWgNwwZTqO2CfBx/xjBATov+QRRM7baubPn5Brg4MqsoPDlFzwozSchAIDmQ2qnOdf7wK2woGq5y6WOJ23vxXYIGvs9VHxgfiqQk9W47d2pfhK2U2/Fn8EEsMdDxcV7Ma3m3vacIgoFpwj7yEIFiO3J2S/EMSH/kYmmRDdJOg3WZwt0wYcfyJn5zTkiS+nbArdXZ/QTPIZJNYY8uGy0dohr099VO6OODhyYl9iFhquMuad4TNx6FmRXWdpaqrryk/86MwASoSXyByv9zJ34qFEVVbQDjlvWDPKC4w/D4OmDd15KAvNYLpzZyiY0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 18:38:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 18:38:13 +0000
Date: Tue, 18 Feb 2025 10:38:11 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Some refactor, rewrite and fixes for OA tests
Message-ID: <Z7TTk8Raw5CxwwwD@orsosgc001>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
 <173969315217.2891932.116693029209058418@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173969315217.2891932.116693029209058418@b555e5b46a47>
X-ClientProxiedBy: MW4PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:303:dd::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: abfc7788-a565-4bdc-d0ef-08dd504b66c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWZYQ0xjZ1dCYXVIdTg2YWZhYWpJeDlnNzhNWDJ2T1lNQ0QxQkRlUVFHcFdu?=
 =?utf-8?B?NFZaOHh5UE56ZmVMZTArUThaZjV4clFWRlpQTXVaajh3MndEVytxUVBJb0Jq?=
 =?utf-8?B?Z3JvWWhncWp0cW1HWkcvK2lEaTllcUZjbkV2OFhUZVpSbDVkYTROalNUVVFt?=
 =?utf-8?B?TDJRdHI2aTJFeHJmOFEvMXdCVkQyaW1HdEl2RkVvQzUyWVlPVzl5M3lkMGpa?=
 =?utf-8?B?bjFDMEFyd0IxL0JIL3lJbWR4SndlZDU2VHVjT212MnJBQ09mUTFtem84TGpl?=
 =?utf-8?B?dlJibjNGby9GTWwrNDU1OUZ6MTROVU9GQUU2cVViUFR5S2NabGlzNXY3bTd5?=
 =?utf-8?B?RFdGTDdocW5mVWZWSHduZkROZDBtZ3owZVhPS01wcWVMVlFjQ1NxdlVPSE5z?=
 =?utf-8?B?c3o1SFEzbmFidlpYamsyZ2F2YW1BRkx6T0JIV0VQS21TZUg2MGtpaG1XaW01?=
 =?utf-8?B?TGp2VXJRM3dkRStOZUhPRkQ1cTJQeHZ6VWJjZnRhOEN6RlgrbVJDMWhCc2RU?=
 =?utf-8?B?bU9FdDEyU2x6QlJhNEtEeUFkYjJDOTBmSmI5ZTVoMCtUNWxjOGR6V2JNSnlz?=
 =?utf-8?B?aTcyNkJnWVg2VFYwREVORXlqNkVpSlcvZDZia09sVGl0YWM0SzhBUU9zV3FQ?=
 =?utf-8?B?bDIzclRvV3BjTzZFQkVYTDMxQ1czbW9QN3lHQUNiNzF1aEcrZnp2SUM0SUho?=
 =?utf-8?B?NVNuRzM0OWVOb3h1cFl4ZXNJV1VhYUgwdkFzTkVpbXdKbTA3clFmblBBcytv?=
 =?utf-8?B?Z0gyT2ZGTnIzWDNMenozNXlvUDBOaVFtSDlmc01JeWZMMERZQnZxc2xzeEUw?=
 =?utf-8?B?MmNpTSs2Q1ptY2ZNZHN6Y3dYLzIvOHhqVURCTUJRKzF0dlFwZTFmakZVb3kz?=
 =?utf-8?B?Yzd4ZzBYOWZCVU5ERTl1UVVXMHphV2djNlRJZzZKMlVWc1RxQUM0OUU2TURj?=
 =?utf-8?B?YVZBY2lJOU5PM1B0VXNONHRvRE52SUtqcjVXSmlJanRPNmRqeFR6RUxvMGlF?=
 =?utf-8?B?ODBuR3FjaGJFR2M1Y3c0b3J5MEYvbzI0djBmMzByeEFwaWE2ME5pMFFENlRs?=
 =?utf-8?B?M04ySFE5dGZhekY4ZnFLVGxVcTJXdW0vYTQ4LzRGNXFxUmxoaVBBNUREUmZk?=
 =?utf-8?B?ZW9xcTBya3pZQWN4TWRxQ2ZkS1FaWXVHUjFhcDVlQVd0dzZTeThsek95RDVs?=
 =?utf-8?B?TEJZODROd2hlQTEzbFJSRXdRWjA5ZzYwWFRKZTBTSzdzK1R3SGkreVQrTGdK?=
 =?utf-8?B?aDlZVXhqeUtGT1d0ajRYdEZpR0pDeXg4MFdHbXVhQWRDSjEraE5nU3pFQzBr?=
 =?utf-8?B?R3FNZFZONDlwLyt2Tm1YT1RHUnNHbXV5SFA0WlZhMHBCaWZFVzJNNVJDVVd3?=
 =?utf-8?B?eUY0UXVjaTEzZGZzMmwvcW1jMG9SNmxqMjNkZ0VLN3FJZ05PaFZyL0FsWHZr?=
 =?utf-8?B?SlNlVGRFcnZXU1g1Y0s1OUNLV29mWTEycXdQVHZheUJaTnRrZlRsUTRuQjlL?=
 =?utf-8?B?UVNHdHl6N3BsbnJqUmVTTzBxeWdkUmxLMk9mK2dGTnZIaFFvL2Zid3hXZ2xK?=
 =?utf-8?B?TTF0TEZhdGxpM1RpdkVubVcvUUZ6WWNoQUZmMDk5dnFLMmlackNjMEJhRnVh?=
 =?utf-8?B?WjhlcUVwZDNCUklrQW54NldoQitxQ1dRY1ZjMnNDY003U25Rd1ZsZFJMSEZC?=
 =?utf-8?B?dVQ1cFc2SXJoamhPZkdVS2Q2TmMxbFBXc0pqem5ENUg1bkM3bnM1b2gxV0dq?=
 =?utf-8?Q?2zZp+1RUExyWi6erOP5Rp1Gyh1h2y8PnublbqoM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG9Eb1d6ZTNueVRYajRmOE5PSG1TbnNDOFdGVld4WUdiK2pVRFhnN0ZpUFd1?=
 =?utf-8?B?MllTUGp2czg0VmVtc3VyaWI2aWhjaXppZFVrQzhmWTJnTVNPaG5QSGcvMkVi?=
 =?utf-8?B?bDZ4aXQ1c3M3OW4xY3VCQ1JtOGdKSVNRUGpXRTY4TVJPTHNCZlFTcHVLeVZD?=
 =?utf-8?B?RFNmR09RU0ZPU3lUWU12SFJ1VkVQY2daektycUxBSUtUL0NKUTJZU0g4QnFt?=
 =?utf-8?B?WXNUdU51bk1XUVVFOFo1L0RwZUV4TnVWN1h4RzBWbC9QWVBWbFZkMEx6WXVN?=
 =?utf-8?B?YlFTVjNBc2ZzdVo3NnBodmVOc1l1b1lJRWN5M1V6bm9FZ2hYekt1MzZ3ZWVr?=
 =?utf-8?B?eDZ2VUZWTFFiOFhKeXBKMmQ0elBhVTdwRjZyZWJpa1ExWk9DRXBNczl3bGZT?=
 =?utf-8?B?NVNWRGtJbGs1UjA3dC9lRUp3TGdhZW5ESTZRcDQ5K1E0cGszaDIvWlJ4SDg0?=
 =?utf-8?B?VHh2Y0VURnNPcThaUEhRd293VnZURWdpaDQyNmN6Vy9tMWpheU1tN3VzQ09P?=
 =?utf-8?B?cjkxbEx0YkszOGZPMXhoSktTVGt1dCt4ckVJRVJYQnZEMzdmYWx6NUJkcFJK?=
 =?utf-8?B?V2tSVWptV25OTmwzaU9RNTBNcjNOQTQ2S0FGNG1kUVRJVmpWaENFU2h3TnZX?=
 =?utf-8?B?bjFIMTZiMEszcFdHSnRuL0xFTGF2RldGOGtlWmVQbFpFK2xlOHBnbUxMRldn?=
 =?utf-8?B?c3Azd083UlFHWkk3ZVMzNTM3OE1vOFVEUGZaOUczZm4xRnk3eFgyVUlwNURu?=
 =?utf-8?B?SkxaSElBdTZqY2VxM0RDS2ZIcGI5L2VnSURya0Q0em9wQk9UNC9zcCt4cmRQ?=
 =?utf-8?B?ZFNoSzJvTjJTdXR6Z0xaTzE3cTFleElRTmp2SFM3QmxFUUUrRG5oUzJ3clJn?=
 =?utf-8?B?RWcyQTdtM3NMNHBPazBlcUcrOXdkQzF4NU11UHZMZmE5Njc0d05GanR2OE5H?=
 =?utf-8?B?ay9Zbll4Zytub1hFbnN4bllZcGM4dWI3VVdQcFNYMHZuWldSYWxHU212YXJL?=
 =?utf-8?B?YlZuTlgvVUp2VllZbEFESndYZHMxWDRQVGpNWkxYU1JsK3N2aGI5OE9HNnda?=
 =?utf-8?B?UWJrdUxYK2FQY0pEWU9nMGxSOFVhcnVqQy9ZWm1qaEUwS2doVjE2TktPNXBP?=
 =?utf-8?B?QmhWMDF1WS81V2VRMHVadFpHMklrWnNqOVM5R2U3MDFKa0N2K0NCVHdMSXJK?=
 =?utf-8?B?T1crRzNEU1FGNnVZRTNtcE5uMjNReGQvYUROYWQ1RkRtK1hncCtYYjl6WTQr?=
 =?utf-8?B?Qm8xaldOcFVzeWp1UlRxb0l5a2w3eEZsOVNqTkNDSWlJZXJuak95UURHc3lD?=
 =?utf-8?B?VG1lZzI0UjJVOEhHemF0VmlGSmE5UFdNVWgxaHFxM09uNmtXWS9IOUp4Y1BI?=
 =?utf-8?B?WW1GczE0N09CSDVIU1cyWnEyVkY3aG1MYTdDOTM0TUxuMzRmUDM3bzhJdTRL?=
 =?utf-8?B?UjBRRjFnN2VlOXR2OHMvMFJvYUQ2MWU2QkxxcDRJcGFqQ21wMGtWeFByV0ZD?=
 =?utf-8?B?RCthSXhWWGZ0dnhiU2JQUkRnbXFrbzVCN25oN2lBdGZNN2Z0cmxnQmhCTjJ1?=
 =?utf-8?B?RG1rUHlHQXYrMk5IMVpIQndaSFpFWkd2T1hQS1hQbEpQbEM3MVAxbWVrMUNV?=
 =?utf-8?B?UkNVZ3dXRGcyMHN4K29kUkZSRnNlK1BrbGJqaWFWb3IzZTRsSUtBT294b2kx?=
 =?utf-8?B?bU9VS2xSK3hTZEFkMEl2cVZTcTN5KzFOZWgrWFAyYTUrZFhpTXJWYTl3Q2JU?=
 =?utf-8?B?UjUwaWVldDZKbFIzZVZSYk9EREFqcEpoNWdBQzVxMlZXaktLMGpLeFBiUTZ5?=
 =?utf-8?B?QzVUek5STnlIUm1qVUdQckxCNWFVMmNGNXA3c3lKSDhValRQdzkxeDZ4dlNy?=
 =?utf-8?B?RS9kYnRXYW5tQTlCNmg2eWVzOEdvUmZFeGtvZkNaeWVwdXZZWTRJd3lRMEhD?=
 =?utf-8?B?SkVSdlJPR0Q0SHloVjgvWHJwRkc2dk1zYXNTYTF6SjB2eDRFQ01pMUFFTk1W?=
 =?utf-8?B?cGR5aTdvMml3eXpQM244NHMwTHV3R2NmelhDemdEZXIxVUtKOHVvaC9oZ05o?=
 =?utf-8?B?dWMxdzdFcWMwd0xocDRTWVlxbUxNdEh4MVlBRU1kOUh0RFEwMy9mZGEvcmdH?=
 =?utf-8?B?WnUxUFdJblZYQUNNR2hnYzBzeUJJZTZTSVV5WWRzMytNcy9MUzRzdE5zc1lG?=
 =?utf-8?Q?wAiBeIZvpGCZq36U9LgZUMg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abfc7788-a565-4bdc-d0ef-08dd504b66c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 18:38:13.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERvyYvLCNnTeKAfSV7P+koAdx2SHJ3jSBKRTtPBiMy/Zhtas9YRzHcCXAxGMofgqXkYpz7TKErJCMbr455dPYYkA9ULbsM9bnF+8qq/jRiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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

Hi Ashutosh,

On Sun, Feb 16, 2025 at 08:05:52AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Some refactor, rewrite and fixes for OA tests
>   URL:     [1]https://patchwork.freedesktop.org/series/144916/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12607/index.html
>
>        CI Bug Log - changes from XEIGT_8230_full -> XEIGTPW_12607_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_12607_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12607_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_12607_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>
>          * shard-bmg: NOTRUN -> [3]DMESG-WARN
>
>     * {igt@xe_oa@buffer-size} (NEW):
>
>          * shard-dg2-set2: NOTRUN -> [4]SKIP

Should we enable OA tests for dg2 as well? Your call. If not, then this 
is just an expected skip.

Thanks,
Umesh
>
>    Warnings
>
>     * igt@xe_pm@s4-vm-bind-prefetch:
>
>          * shard-lnl: [5]ABORT ([6]Intel XE#4268) -> [7]ABORT
>
>    Suppressed
>
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>
>     * {igt@kms_pipe_stress@stress-xrgb8888-ytiled}:
>
>          * shard-bmg: NOTRUN -> [8]SKIP
>          * shard-dg2-set2: NOTRUN -> [9]SKIP
>          * shard-lnl: NOTRUN -> [10]SKIP
>
>New tests
>
>   New tests have been introduced between XEIGT_8230_full and
>   XEIGTPW_12607_full:
>
>  New IGT tests (4)
>
>     * igt@xe_oa@buffer-size:
>
>          * Statuses : 2 pass(s) 1 skip(s)
>          * Exec time: [0.0, 2.86] s
>
>     * igt@xe_oa@buffer-size@ccs-0-16m:
>
>          * Statuses : 1 pass(s)
>          * Exec time: [2.80] s
>
>     * igt@xe_oa@buffer-size@rcs-0-2m:
>
>          * Statuses : 1 pass(s)
>          * Exec time: [2.86] s
>
>     * igt@xe_oa@unprivileged-single-ctx-counters@rcs-0:
>
>          * Statuses : 2 pass(s)
>          * Exec time: [0.07, 0.08] s
>
>Known issues
