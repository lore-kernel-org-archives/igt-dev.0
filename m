Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F0C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 04:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC19210E110;
	Tue, 11 Feb 2025 04:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlQO/Bu0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8131410E110
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 04:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739246682; x=1770782682;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ka4HoqNpW+PE3IoqyxVyFHfAPEa5XRDk5Rxl/+Q2F9U=;
 b=DlQO/Bu0oDVx75/2+7vFYE3uKUSunAzM+xfAC4rl9i0RmvIlRhCyLNL1
 dKEUvdRNKqONQBujN12EzZZdlypQT9H/qm87Sy4Scuh7b/NlwymKgZ0G+
 wEJSsJUKWBfIStcEl6JfHCoBgSu6zYEeukexXtNkfHQ4/xnUKOdulFUMG
 +RnqPb60pycykECQi7P/PtqKJAKJuDYlc1i07mqGIn7No1XfwRSZbQine
 jo1J00We5nN4rLQ7n5PBEXqwPMCrAyLUwLMobed5eMDAucQ+qzMmO4iiB
 m4D+3UFbEr/ooUG2nWnWJFK+2rOpsVmOXQi39mfI3WSOF7lD+3N/BvM6H A==;
X-CSE-ConnectionGUID: eGbHh3O5QBSPDXpI/zZd4Q==
X-CSE-MsgGUID: YZEgOJNbRf+dzmkRh8O60A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65209221"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="65209221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 20:03:44 -0800
X-CSE-ConnectionGUID: FDRvBrTSRDy74MBFxMEciw==
X-CSE-MsgGUID: 8gvTkCsCTw2qbMvi7fl6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="117470091"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 20:03:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 20:03:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 20:03:42 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 20:03:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGxOJJI+wUPRsdr26ZP0IV0KWE8zl/8nlqL6Vo6oTo3xwbDRrfmbbSGLR9+UU2Gg+qyrvMgnLLJ1wIDrupxsgXXnYnVC4JPTFMjfZ7aFjfLPOmjYbzG+jzq8rg8DjHCUKDHzx3/51nMj67OxGiHDR3e7KDNYcjC6aAVkEovMbOKsLUO1RQf5qV5PvIvARuvWZyJnxfYfmCZ1xSQEKxA6S8s/L/icu+DPoPkw2GlYsKfjBzwAp7WfD8TAUWFiVhKwqNQhhqBXHKJXpPf4M30tKRwQ2XTkNN8z9RYPVfpYLx5dIS35mBHA4yn814ewKPlSHoG6Kno+D5Y0cWavLBcXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kXM9Y6RjsVzRCS3nJJNiWndttB6tU+1jd3gFElJbAM=;
 b=X50frdY8+/vJ17GqZsb9eNPbWAWLMwMerCy+MPtl/Cw3Us6Ma54+9sOxFY6uTNc3ry2Ob5co5V5PdcZVFVkoXBGswHdnzBn1b/ddLkelGXJKOZ+Lkjni22/qRjX+ETeAI4upUfExiNzOxPqqExTxPiJEDD8qD4/Zzmcv0nOflbLe+2YuWeZp78/wdF6VM0PlUCoaXgYdn4zNigU6831ejopequxYLx5IJK42kMdIvTVsDFzi2bvUPInYJZ1eC+kEqSdXXoHwteJtz/istzD22hFd9G3LhYK24mxUI93etmY+5HbwgqweL1lw8Nm+awouKWDO0KRHyffVCi+V8/F3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 04:03:20 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 04:03:20 +0000
Message-ID: <37b90ff4-afa4-4494-9e37-76054d5780b8@intel.com>
Date: Tue, 11 Feb 2025 09:33:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/6] tests/intel/kms_dp_linktrain_fallback: reuse
 from mst helper lib
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
 <20250210185606.1327892-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250210185606.1327892-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY5PR11MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: c98b0575-c4db-4417-8bcf-08dd4a510582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEJzMkk1Wk5CazZJcGhoWG5mUENDRktZaDV3emFGdEFjWWZlMldWK0FSVGpl?=
 =?utf-8?B?cnB1S3laQjY3bVhFN0Qxa0JoOVVoa0dSNnR6Rjc2bDR0TVE4S1VkNmZHcnFF?=
 =?utf-8?B?LzFlOW9DcnIrQS9qMzFwNDh2anFHZEs4RVFqZ0RXaCtJWXI1RTBOckJwV3Ns?=
 =?utf-8?B?ZXV2VHNCVjN3VGZPc05FZ3gveTdCM3dnK2FNR2VtS2VrTmYvaU5ncFppNFA4?=
 =?utf-8?B?WnE0S2kxTnhtaTdIU1AzYzB0N1VOVktYUmRrT096L1Fhd2EyV1ZPcnE4aVdO?=
 =?utf-8?B?aXdKSSs2MDNOMmNZSXVTTVk5N0ZIcGIzRFY4aFE2U25ZYUZ2WXJlRERkdkFX?=
 =?utf-8?B?dk5LYnhkcUl0TERtakVyV1JjNzlMa3g5djBkRCs1ZXBZRlYyM3llbTk3Rysv?=
 =?utf-8?B?M0QrSFZFWnBFQVN0VjRhYmVIM21oQjFPNUJqak5MZ2JJdVVHUUhXNTAraUg3?=
 =?utf-8?B?cFN2eWpDYmVpVU1oUkdmZ2FESk1XMlJYNGR5NnVIdlVhT2dGaDV4WjREbW9P?=
 =?utf-8?B?aWd5Y0dydjdhN1JpUnM3U2FwRTdjenlKZTV2clB2WE0yUElRR2JxckwzVHFx?=
 =?utf-8?B?SkRmVFV6NmUwZFQraFNSZUtVNFlUWnJuOXJSeTA2V3VZN3ZBMzVwZmJWbmY5?=
 =?utf-8?B?RVNiWE1MZDZBWDEza2hiTjBxSitreE40a0Irck1OQ0NSUk5ZalR0T2ZtRks0?=
 =?utf-8?B?RlIxM2lxd2gwYUtyVHduUGtMcjVFMzZ0Y2xGRHBwd2g0SWZrV0YrUEZMaEZm?=
 =?utf-8?B?M01BVG4wUDdPeVhsdFltaG93YVdyZUJ4MjRSTytXNTJJZ0Q5N0tsZW9ZV0M2?=
 =?utf-8?B?UVJkcFEzTW9RT1d2RUxsVGZZWVJxSkM5UnVoYUR6N1dkWHFXRzRHR20xTDlz?=
 =?utf-8?B?eWNaeDVzNFpoT3FPYjhGaVQ2WTF4Z1N6VHhGUHFlZHc4YnRPai9GNXJOTEpy?=
 =?utf-8?B?NnZncVNLNkF1TWxQa0pJcnNWNE9POU9CUThueVNnbGhhL3U5dmNTdU5UL0pt?=
 =?utf-8?B?WU8wTDczaWIwU3hIZnRDdFlEV3ZkZmVtSjlSaGpZR1VMdUxyaWdsQkF0WWRv?=
 =?utf-8?B?VVQ4VUozVXE4dUVyVWZoZE0randWTGNaQ29DOFZpMUViWS8vSFYrbHZnM2gr?=
 =?utf-8?B?T2pDclZGRHdlcGJGbS9aditYZ2ppcnVaVmU2dVhZYlN4VVNoRGVKSUVYMG8z?=
 =?utf-8?B?S3hSbEZCS2RPQnBGT1ZPaTd0ZGd5ZkZrOFFsbHV4VGJwZ1hxaFh2d0tBakY4?=
 =?utf-8?B?UkFSWEZhR2pHL2VYdmRhWU8wUlRPNHV2TEdTZ1oyVTZvajJwUU5uRlYzOVJ4?=
 =?utf-8?B?SVNFNFZ1dEVxOVBtTHhHU2ZudWFhak5ESThaR3FCWWdQZnFScmNIcjhsRzZL?=
 =?utf-8?B?OENHVlBYaHk0MTVGV0dtb1NjMVJxTXNkRmZyUDR4LzhTbzYxR2p2U2V1MlV4?=
 =?utf-8?B?SEhaYWJkUEc3dlk1Sm5oNFpMTHlDUm5hV0xKU29CZmM2aittbWxRWE9kUGM4?=
 =?utf-8?B?ZTRhTEpiS0g0aExPYXhZUFZwSGFvTzhUaUJQb2YyMlpkcXNDSUNyTDY2V1dF?=
 =?utf-8?B?SUk1ZTJHNlJvb3Z4RVVkRGw5dkhUVkdaS0FlcGpZc1FtcUVCR3VoV2JrWllk?=
 =?utf-8?B?anRzbkZIbFBnL1g4a00vdUYyaWUyQ3NjTWx1VDBqamtBbDVEbU1QT1pPcTV6?=
 =?utf-8?B?TVgvd0J5UFRTQVJacTBRcUp1blNuRmFHd0RubTRIa1RnNDl0eEgzMmk5TlFJ?=
 =?utf-8?B?cUVZRmV5UE9Lc1haYzNDVkFuUDFrN0F2cFJYRy9RWUdBVlFJODdtZWV3WDJM?=
 =?utf-8?B?dklndHRJNS9UR1lZUVY4RkNyYXhPODRCMUxzeXlSUTFKVEdTVXpoVDI5dFRZ?=
 =?utf-8?Q?92ON+rlwf8AHf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGM0bVEwVkZubS8vRWg0TkFIamxiaENZQzJsdDdGRER5Z1VIa1J0L25udXFz?=
 =?utf-8?B?UlN5WkdYdjhUL3EvRkVQcGVrV3JyNGJOZnpVTU1QU2ZGOEJxSDNkcksxV0VK?=
 =?utf-8?B?Zy9TM2JEMlF4ZUxib3J4bmxhVGIzU2FJbGhhVWlOSW5YdjBsQzRkZGtBVnVu?=
 =?utf-8?B?M0lET1l2L0ltRkUxVlh2L3JOaVkvVzhpalp1YWEyRlcvTEpXcFNjdDhaM3c1?=
 =?utf-8?B?R2RIMGMrQnEwZDVicXRDTkpNY2hpRTIveTNLN3hPV0JJOWlrQ1NXTk5xWDlJ?=
 =?utf-8?B?aEZiUGU2dUdieGhMVTRDMVpZKytXWUFaZjhuL3pNdUdwQm5TOVBuZU9ZRXFX?=
 =?utf-8?B?YUdtRnJ0eUZGZmVRWEVlTXU2dnU0MTZxbmMwQ0hzYUlYbGlKQXdPOExxTFk1?=
 =?utf-8?B?dkF2OVFTSHk0Y2dTNHBqYVlyVXhvTGZWc0t6dGRVRU9GOC95MUVTTEk5VExj?=
 =?utf-8?B?UllabGZiTU5IYU1yYTJLbEZ4ZUpwZTVQb05yYmJQbjNkdElYTzZrdWorYXd4?=
 =?utf-8?B?WVF1UGdxS0Q5aVdmWmhLOElmSDRoNDZoMjJYZnBDeE9TQm9Nd2hBSUc0ZVlT?=
 =?utf-8?B?NHlWN1FQQzJCbHQwSmZsbHhSUUJyT1VLTjhwT3V6akN6Rno3dURWK0M3MHFE?=
 =?utf-8?B?WTY2VmM0a0QwMHBzRy9PQ3o5bk9hZStkbGFvSEtVaU1JeHBkRldEV0h2THNP?=
 =?utf-8?B?VkJ0MmpMUG15Yk12b1dSWmlvdVVUbWNtMWNaenc2R3RwVjYwemQ2Qk83am5x?=
 =?utf-8?B?ckl5ellSZmNkWkV0VVUwcDVyYW9YUGFPd09Pa2M0RUgxV3hlV2pMVGhoVTlV?=
 =?utf-8?B?R3BaYkdKNkc5eUtka1ZVT1VoWW8yQjNCaWFnV254UWUzWTQwdk1rbnozYTFO?=
 =?utf-8?B?UEQxR0VNQnlGSGZvVGRrd25xUmpvVW95NEJaUXgrVEtDU0NvcDNLOGlDcHky?=
 =?utf-8?B?ZkhFYytxRkNmWGVwZGVERk5xcDlocEpQcmtaVEVjVWhabmtBcFBoVi90SFU3?=
 =?utf-8?B?cDI2d1NMaUNvV3lpRkxxQTRJS3pjelhGVTJ3YWNzVjVybFp4Y2p3M2Z0eUFl?=
 =?utf-8?B?cW4wVC9ZblRzNFNjN3RicEp0dzFsV1RSV09pWUJpc2xvdjVnK29STFExMFR1?=
 =?utf-8?B?WXdJT1lBZFE4dG1HaXN1QjI5cTFJbVNBaE9xRDlMSnA2ZlVHM0hjL2lYdUlW?=
 =?utf-8?B?RXVCdUpQbXYyZEJSdm9sVFY5UGJjY3pobno3eW9WNVZKUzc3OVFLZHBlbzRC?=
 =?utf-8?B?SFM1cXUwcjdReVMxcklpVDNvMitUOFpKajVCaHc2YTEyWnZPSDZjU2FvTWYz?=
 =?utf-8?B?ejhGT2pCbUJjZjJQeUVzZTJDRkRxQ2QwMDBMNnhMUmkwMEE4M1ExTG9xVE5k?=
 =?utf-8?B?bkxOcnpWc0FXZ25vamk4WGRvNm5HK0xDVkY1cmdVK1pZY1loU1ZxVWNOSzB6?=
 =?utf-8?B?ZmI5WFowRkRzdVdzclRaUTVieTRLUUZNcmJrY0xFdXFjS2RYOEpyQWRKVnY4?=
 =?utf-8?B?RXkzZ2NMQnVXMVphNTlISDRvS0JvRFN3RTVsZ2R0Y3MyRURVaTZqejh0OTBr?=
 =?utf-8?B?UFBvMVBhYVRZdkdmenhuWFNDRnBpcyttUTFPNGMrczVrZkxDTFVLUWpETnVp?=
 =?utf-8?B?aU5lWDVpbkk2VDFlbFRqMVkydXQ4OTFMM2tTOTRSTVMvMXZzTXk3NU5nRDBG?=
 =?utf-8?B?bHFXazZRYTB2STdYOWZhY21tRlpYaHlwS0twc0E4ZGtESENqTW1kRnh2Z0dQ?=
 =?utf-8?B?bHE2SHBBbTFlbW8rRTNnNXNRVHBSa1RxQjlTdTh5TnRoM2xDOFlvNC8wL00r?=
 =?utf-8?B?ajdNMXovczAzSU83dU0zQWI1YkVVWG5tYWxjUGpNaDhFMlU2MXRXZEJsQU9j?=
 =?utf-8?B?NittbzZoNlJwTkhINTJuTENmTlBLaEw4OUFwcWM3Y1cvK3k5WGxkTEFlK1Fm?=
 =?utf-8?B?eGNpTkprVFJ4WVlTZENLaGxLdVVjWHJWUjNBUEVlWCtubU43ZFBSK0tCYXEx?=
 =?utf-8?B?akFQa0I3OVVDblNmd21UY3d6d29LU2puQ2V1U2NNbTQ4SnlKdTk4THcyb0xN?=
 =?utf-8?B?SGd4VmJmdUQrV2hkZzh0TWZ2RWl1WmczTUpMK2dqZlpHS0JQS0xoSFcyVWhv?=
 =?utf-8?B?TXlkbFB6T1V0eUR2bFNSaWR2Yzl5UU55QitHOTdacndMU2UzK0Q3WjJTT0JX?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c98b0575-c4db-4417-8bcf-08dd4a510582
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 04:03:20.5712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snOuHwP2hkdrUmB3U6PrLEW2S24x1sxDNVqRJ3krAu63eidjawpzUhjfgBU5L8jQUG4mSkv1b0tvlOF7DtIrDr74RklYn7TBf63z58VmEaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6392
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


On 2/11/2025 12:26 AM, Kunal Joshi wrote:
> Start using igt_find_all_mst_output_in_topology from the helper
> instead.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 28 ++++---------------------
>   tests/meson.build                       |  1 +
>   2 files changed, 5 insertions(+), 24 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 415005774..95aa7eee4 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>   #include <sys/types.h>
>   #include "igt_sysfs.h"
>   #include "igt.h"
> +#include "kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
> @@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	output_root_id = igt_get_dp_mst_connector_id(output);
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(&data->display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -		root_id = igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] = connector_output;
> -	}
> -}
> -

IMO, first make changes to this function in this file to return error 
code and use it in the caller in this function.

In next patch simply move the function (renaming it to 
igt_find_all_mst_output_in_topology) in a new file.

Then it will be easier to verify (using git show --color-moved) that 
only function movement has happened, and there is no change functionally.

Regards,

Ankit

>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
>   {
> @@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display, data->output,
> +							mst_output, output_count) == 0,
> +							"Unable to find mst outputs\n");
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..a6f6ad560 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,7 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
