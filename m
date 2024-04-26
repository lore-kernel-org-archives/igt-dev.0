Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C35C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 13:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAE910E18C;
	Fri, 26 Apr 2024 13:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtS+5CVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF5010E18C
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714137517; x=1745673517;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YoQQ3H78/J+EK33dB3YwxZTPa9Wh0x0K5vo76e4vE4g=;
 b=UtS+5CVhyv4W+nMs2gEUBAri04DMbcWWMxOGW7TpkSY8rxYdn3mBFcK3
 Zx0x9yC6MlhHRFGeOTrrXwsT/qZa6c6LtrYRyhTR+n7OoO2jYpqa2Zcch
 gnFYoxsIY94R0L2FiXtW8FGczc3oOv6vagNggt+8CVJaYO5zekdWYOA9g
 OXcz+FIuTr4hg7g1aFSlmrhMAmoC6gR8GUqpcRdGqe9ACfwfh6xGsbdkj
 d5m+CUY0MqdgjlXfzaGqjmCapmDOPVquDWulm4nVryDqERgXnOPsGJuzo
 AIwqgr5xTlaT8dRI5dK6oLSii3TW9JKJApS2fK4flFvw0akrl5cHnmUD9 A==;
X-CSE-ConnectionGUID: L+WyJXouSR2vInKeRFElgA==
X-CSE-MsgGUID: Oh67fn0HQC+CqKacMH1XwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="35258567"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="35258567"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:18:36 -0700
X-CSE-ConnectionGUID: Ars56fWnRr+iZVe3DyEJxQ==
X-CSE-MsgGUID: U5sVmO/iR1uRkaue815Hpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="48647687"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 06:18:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 06:18:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 06:18:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 06:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSzFWoLts+ZspXofMhw+QQ/mEaqjtkrwOkXFruUFOuUG5ZwMwBYk5BT27FAaWB8zRKR0Dbutt2upAMplQLUsbv95AFtsLDrYQuPXo4qnsy1aPYBBqz9EQDkd7ZGGpqdwBsgRK4B0GTAIYEz/8Wwouc+6tdOm1A2tnp1OQ7KYsBD4hkZwsUieZLrfZew9ytMo5NrcBpGaAwS/yjnqJWd+TbOS5miAAOTqNvj/0PfbwwsJkekPtNV/if76DKbDStOf0SVLy2eOJDGhz+hg2XhgapfCkpOWXBAVeeHjkKf6PSR0iz1OGjiWhgByI58zEqnpgXK3CgdHb+qLoP2I7AtIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFgGg/7rKP0ndGaVJVxP3748C2RbQFH44bxokZIYZJw=;
 b=IKsR8r5LLwjxtiCinMMU3pCWuDwhliKpm2Bf1K9bIetRs3a2ZaV8FNQAATsauhAp8JxWv4lF91hYS3X4aFfkjR0+ktFfXLRIrgWSanEnfMD6kD/wcoRPpJ3NqkO3XIQmXwsZzsAPBuGsvyBpo73SYyuHpReS2mo2GtVVOv0G74G7b6o6tn9as3dp8IuNrED8u3Z8+cOYGoo8ohYCIFu0aXCOz/KNEUGmAx1/i258Qd6yvC7u8KXN8sBuZ4oUh44KKEfYnEQhQs7OEbb2dkM2Ro365ocKPC0DgHMM+Ytq/eg/SpAxOCHE64oXDMYdQU1mdEs8mi+OS2UO7fil0bqN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 13:18:30 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 13:18:30 +0000
Message-ID: <8c4fc09e-0a19-4dd9-a6d2-b9feb764002a@intel.com>
Date: Fri, 26 Apr 2024 15:18:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 08/10] lib/intel_cmds_info: Introduce render
 tilings
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-9-zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426090117.78060-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0200.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::25) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|IA1PR11MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: e14c4b30-44cb-48f1-99bb-08dc65f35d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG96ZXF0Smxic3h5YXk2Nm0zamtLSWxFZVZxUlNlWElkdnM1NTBob0srVWtO?=
 =?utf-8?B?amtHd1F4R1ppS0ZOdnFPeFUxRTN0V1czTTN1ODF3RjY4Z0ZURWRnNmcwaWF4?=
 =?utf-8?B?VDNoU0NSL3Q1c1VTT01WMGhwY04zVkZ6YUpkb1hlbW53SDJNQ3Nzd1pEREk1?=
 =?utf-8?B?emJaUzJuelp6SzhSL0JTai9GL3dHM1c2emxHYVF4Q0s1L2NtQ3l4N0s2Zlp6?=
 =?utf-8?B?djBtdlhTNVk0c1kwR1o0Z0FLNnFxbjlqMytaMzdycG52bm1TeTBJQWtsQzU2?=
 =?utf-8?B?RTJUQUpza21ZRUVENitCSlRYRG9GeUw2RGZVU2FIdmk1RDJsczF0ZWI2VElL?=
 =?utf-8?B?di9vUjdUR2ZGVkJCVVNpYXJ0Y1dmWnVCakdSNC90V3NRTXU5VSt6cGh1cXpZ?=
 =?utf-8?B?MlkxMStiMm50RWEwTmVMSHRiZWxYVkIzUktkVTNEb2dRNVovZjNvVXNJdnlv?=
 =?utf-8?B?YlJFYkdDU0NXUnFEWUFFY3NqQm9DbXE1WjBOanNabEhjVCtzanY1Y1hWSE9N?=
 =?utf-8?B?b0pnb1RKeHlDc3B2R2xZd2UzUHR4ZkozYVY5YmJTTjFxTU1wOU5GVHlYVWRw?=
 =?utf-8?B?ZTZOMzNVdlI1S1ZpSncvdUFKb1cyQUdUNXhXTm1HS1pYMWtrbmtkc1N2elp4?=
 =?utf-8?B?UzFQMk5IaGU3STdCVkdFaExFaEdHWkFkUCtWaVdJcXMwUXh5TzF4eUVmbXJU?=
 =?utf-8?B?a3NVZlA1L1RLQkRnVERnTXQrQVdEZWZiM1BaYmxidjNwK3J5MTB6WDd3TnZx?=
 =?utf-8?B?cFJNZkh1cWV6ejdUUVJzMW9LZG1CR3ZrQ1N1NmFMYXRHdVJpSWRCNExKeTls?=
 =?utf-8?B?dnJxU1lpZUdXSkVaNm5FZFl0MmxUd1JBZmFrbHZ0Z0l1c2p0TERsa2ppSEZn?=
 =?utf-8?B?SHRxWnJjQVdUQW9PTmswTGJJRUkySmlaVW8rcFJrWVRlc3o4cDBBYUtvMmgz?=
 =?utf-8?B?MVMzNHR4ZFhZQ0xwRElvaTRHSytlM3VxNWpRdGE1VkZ4ZmdCTVBtNXNwYzU5?=
 =?utf-8?B?UHU5TnhqZE1ONHUrVGM0MFlqTkFKR2t0cmI3dnkxRG53b2lsR1BqQyt5ejNT?=
 =?utf-8?B?eFpUa3dGTWNpcmhqN1ZkWHpNVzZyWVFJYTQxdHZwTlZrdVJtVVlzS0JUOGhU?=
 =?utf-8?B?SXVyVVVlQW1BcGxaeFAyNHEyNFVEWWdXeUpqeHFldXJlL043cTM3Q2t0b1hL?=
 =?utf-8?B?S1lwbmgzQUhaUStrOS9LcW5zaHZNeC9RVGNBeFJyQUhkWjlLWjdOejdLdVJE?=
 =?utf-8?B?NkhsZk9PTjRnVDdORkxhK2RIdEpLdi8zVHVzNlJSU0l1NlBlVTRuekYwQ2RN?=
 =?utf-8?B?ZGw0NkpYSlp6d0pEekxCL1hTeFN2Z1ZrbjU0MHU4alpYcHl3QmdvTm0rY1px?=
 =?utf-8?B?dVo2U2VmbnJ5bFk1ZHVXQUJJQlpmelRudTlrOTN0OGo5K3A1YXFyV0dFWkVx?=
 =?utf-8?B?UklPR2NKT05GbStrbDlRcGc3MzN1elRLY0lKNjFLOGhYN0ZNRkM5RWtOSGs0?=
 =?utf-8?B?dDVWV2ZJNlBGbzl1cjZQbWZIdEF6RkMrcHRqMm9zQmR2Znp6YnkwMmFCNTUv?=
 =?utf-8?B?ZGVmdXlWR3p5N2EwTC9SeVBQZnNYL2lWZXZtVlJVeGZxSjhJdFhDS3dQNUVK?=
 =?utf-8?B?T1JESUpvUjc0VWg4bXA5R2RxWnZOM1BqY2NNVS9pZzFjY09Bd2Vzd1NxeXZz?=
 =?utf-8?B?MGcrdHQ3UWNEeFFPWko3c0drSVQzWEJxdjJNSUZ5cDJHdG1iTVBJWW5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2xMczh3REtxVzkwSmFQbTlmbWh0RDRUWTJQemJIYjN1dWRTT0cvQ0VvU2VG?=
 =?utf-8?B?THJydnptd05EQmU1a1ZabmVOUlRGM2hNaWpzN1N2Z1JwQlZ6OTVNQTlCUW5q?=
 =?utf-8?B?dnIrMHNuOUtJOVVWUDgwSXRzRHR3QkhBbHdOdEtMbmZwRi9xRmNIdnRDREd1?=
 =?utf-8?B?d3o1cUdWdU4yQ2srRzVEZ3dGTHVLNFVvUFZ0THdaSWl1bmx4M0h1bk1WdFh6?=
 =?utf-8?B?SEM4Zm4yMmVxK3FneHpOWmVHV3B0S2YzYXp0aDhhcTUwWUM5ODRJdnkxLzV2?=
 =?utf-8?B?QjAzUWRjZmpTaVhscy9Gbk5lNmlJNHBNSGgveW1JTVZRSmd2aXN1Sm9PV0hY?=
 =?utf-8?B?ekVaVXFSZ2NTYWw5YlgvYXRGamRRcm9jcG84YkdkVGRVYlBBdUVQSTZMVndY?=
 =?utf-8?B?MGllTEVYMHd1VWdvN3NiMGRqK2NYTDRRYUtQd0ltazJTZGt5d1FKWmxXc0U3?=
 =?utf-8?B?WmR2ZWV0MTJSNVBkTThCTHl0b2lUam9hVkdianFiV0ZOeTZSd2hsUzhGd0pD?=
 =?utf-8?B?WmJ0aVZYVHFMZHU0U0RxSnhPMVc0ai9qVjdBNlVrTTRVNisxNUp5cTRjOFZ6?=
 =?utf-8?B?bWFwSnNLMklWSlhkRy9XVWwzTEJxZituUWpNTDlDcTc5QVNiWGd4UmlCc3Bv?=
 =?utf-8?B?ZC82VmhpTit3QXAwckcrbVdJN0w4M0lOa3FxZ0pkK1dvSU1jaXRRZGtXYTZp?=
 =?utf-8?B?eUNiVVZqWjlJVlZMMjZzK1U4T3NOaUZPRWsvb1owM3I0ZW1oUEo1aGYwbHRm?=
 =?utf-8?B?MEdSMTdnQ1drcGYwbm4rK3gxWTJjUVQ4MENyV0s2aXZGQW1JSWV5elZIK1hU?=
 =?utf-8?B?RmpiVDdZVzU3Mk5nM3lkUFVueHJLTndUeHZtV0Uvbyt6N2l6QkZKQVlzMmda?=
 =?utf-8?B?WVVZRE9xbEVFTEVVNFdGNDVNdCtOTlBOWXJMNWNjcjRRZHVLRnlOVGJhdEZ1?=
 =?utf-8?B?SVgrYkFhU2RMVHJxUTRBUWFLVnRHWEwxUG5Deks5a3ZPdDZHeFpSMFVPcTAw?=
 =?utf-8?B?VFNLSWw3T0xFais1VFdkSlQ4a0hJa05iZ3JXWDFoeTVZTUtxQlo4UUYwOGJs?=
 =?utf-8?B?b29rbnJGcVdyRXFMclJxeno5Rmlhdi81ZnBsb0QwT0k2YjN3QnVtKzB1bDZ1?=
 =?utf-8?B?ZXlYQkNUVVRtdXowdVM2S3J6V20wZit3akxQaEdJMGZPNzcxWER2VXViU1Ur?=
 =?utf-8?B?NFZGODB5aFVZZDVPeEU5ZzNuUmZyTXVVVTAxaUd2T1lDSzh3c3p2alk3UXhn?=
 =?utf-8?B?c3JuNTlwMzk3Q0orYytCQkhJWmFNUWxoM0hGaDZRR0RTbklZeW93LzM5bU1F?=
 =?utf-8?B?TUJ4MHJsaGVMR1lxYXpVUGtCNm9tR3E4NitFWHdzT0ZsVGEveWVTWUE0dDZJ?=
 =?utf-8?B?VXFCK09JSTM0QnBmNENzNTRkUE4xRngwa3MrWTdnbVE1TTYzMnBOK1UzVzhW?=
 =?utf-8?B?N0RWTzJCYXNIY0t6QnYwVlZmVEJjMk83N0NVUFhUQytzNmVoQXZtMmE0Zklx?=
 =?utf-8?B?WnFSaHpMbG42ZzBRNkxKOGpGa1lRWExHN25zTkxRcFFTL1ozeTBQcmZQWTBO?=
 =?utf-8?B?NWRqTEExZ0szd1pObzBVMXpTWmRxSDFnaWd6RzVCc00rNGhTMGdQeFFTK3RK?=
 =?utf-8?B?Ujg4MDA5VmJXTUFpWVFmcWlzVlFCQytOVFFrVXlPZEV2R1FTdWhtd0JuVTlV?=
 =?utf-8?B?d3hKUHV0OTJJZ3dJMWpuUlFBZUV6NmZnRjRrZk5FdlZNY2FZbzlsY01Ba2sy?=
 =?utf-8?B?clJ5VUpvb3NwN21EMktXUnhsNlhrOTFmUERqUVlhaWJURGhxSEpkR0FXaEJh?=
 =?utf-8?B?clVCSE5OM25BV2s2RnhLQS9OS3Bya2Y5MlBRcW94NktQZzJOdCtLSnRiREx0?=
 =?utf-8?B?UFFZRjVHSENxNE5NbVVwOC9JdW51L3VZMTVmbTBRUW94OHdUSjQ3U1pzTGcw?=
 =?utf-8?B?ZWtjQzBlL1dVbDJCbUNZbXNpdzlaci9nYlpVMWtUOHoxSkF5WGhLRzlGSmVZ?=
 =?utf-8?B?cFlXR0wvUEJJbTQ0UzJLN2x0N1gyUEY0MTc3c1lLSDBlT0JRUXRVOWJPd1RT?=
 =?utf-8?B?RllBS08rMUYvbE4wbEQvNGpZSS9uZTltc0NoakZVUnlIMFcrOWNaNmRmdGVt?=
 =?utf-8?B?YXdET3JXTEpaLzAxc0FwUWN4dE9MS2tjZEFEN0pYODEyc2F5RlhqeERIeTRR?=
 =?utf-8?B?Q0kxQ2RDVTVDZS9oV0d1cmRkTWwyakYxTC9oWjdrY0xzeTZVVmwvcVFXY3lR?=
 =?utf-8?B?RzIrSk5tdTNCaklBdGh6NGs4aVV3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e14c4b30-44cb-48f1-99bb-08dc65f35d54
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 13:18:29.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyOJLPaGPY7+BeuJk5yhIGhMUBEONxa1OAeyTpaBmvcYvhx94B1H2jIu1YmuSaWNmTVHFcsT473OO0prBNOkwa4WhqhXw2yFh1GoeJBMWec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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


On 26.04.2024 11:01, Zbigniew Kempczyński wrote:> +struct 
render_tiling_info {
> +	uint32_t supported_tiling;
> +	uint32_t supported_compressed_tiling;
> +};
> +
>   struct intel_cmds_info {
>   	struct blt_cmd_info const *blt_cmds[__BLT_MAX_CMD];
> +	struct render_tiling_info const *render_tilings;

These two structs should share the naming convention, as they describe
the same thing but for two different copy operations.

There are two ways about it -- either rename blt_cmd_info to
blt_tiling_info in a separate patch or make the render one to be
something like render_cmd_info.

All the best,
Karolina

>   };
>   
>   extern const struct intel_cmds_info pre_gen6_cmds_info;
