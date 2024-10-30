Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AA6D5CCB2
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 14:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607410E7A6;
	Wed, 30 Oct 2024 14:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIoL0q5l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0510E7A6
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730298294; x=1761834294;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=BC1ARBW+4AENMCEfHM1RhYPM1nSLUQdcpMlkYdMOdD4=;
 b=NIoL0q5lPaxQxmta1+sWI8KF4HvxAK6RE7SBgugdTuO45kna9XwplBwH
 vfJyHce8d2SVb46vWRG7cDuAFJiSB448JzwA8sBcstU2HosuxDbdjRJbv
 oDH2co7gxY8ESe3Lkj1SWTppN4NIabrA2OB4yfdWsDBnPKGXtAFTCCaON
 MEqA5vAibscvaa2TbM6WAqE874zQ5B6oI1K5jQMslMBaaRbYdhHittI1S
 WlFzbZwryq/HW73fb/XxZCBlaYig3/pjvK8ZRzPb2NRgfIBHdVATrohPI
 N1ei7kFJb0ZUcD7Fxbo0OWTKolWuolBlQe7tjjrNkykiGMA1cNBNvJH5K A==;
X-CSE-ConnectionGUID: zrGYf64aQeGOYVxJpSmd6w==
X-CSE-MsgGUID: XVO/ikTKR0Spdu6A2Ib6Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41102767"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="41102767"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 07:24:53 -0700
X-CSE-ConnectionGUID: g+OJ2b4RQvSWSE3/DHnXxw==
X-CSE-MsgGUID: Kd6oNI68TN+zlAHTrmNBqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208,217";a="86882212"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 07:24:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 07:24:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 07:24:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 07:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofcsKTUHXRNbP/AgMMYiERFCi8iE5knuo3zrHjQ2Alq6BIuH32G3TA3DPbutbIqM1t7v80c5WCucyArjFfHSHblZ3FoKQ1O9i/2vWPxkbHqKiqzS+FLyqtiltMIqIvwrDyuNJTQ8XAa1KQ7KFUz9yy57Xv3FmPQAbwMGrgFp0Bwv9htGDwuR/l5qRbhM4pxJtUiZrBTJdNabGh5h+AdhOlhJtGLN5GgfC9arE3gkSfyL5MXZiR+PH39Q85JyATNu2V46/QTx1x6cFpaOWfjV+yzr6SCIqPLxHjzygPhGq1HZIOpTjxbUvr5i8NeuHYR/O+9UwubQbRFS4vixSWCMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8vwGzmC34NDQXZS1IKbPBF/RmgXNp/Au01+9kO9Aoo=;
 b=m6tHXP6a9zBTxeBVrrKnvMdmzFgPCwNl1tvZqGfNl53PL3CwZ2X65Cy9q3q/Y5C1bFPeYdRZCaEO/m25NV9ZqZ0F0G4+TPYwpwf4uaI2pMPBEwPBpAhBlZnXRAUbrDwBgoucEuUieZiIRJqravuzbZXQWpCylscmLB7FLj3xbGUJUbDlsKKH/xWxWD2c8vKCMGLr580JCSTuW6yWLP/SDAq9ZpV2N/NsiRQOzAD+lltCYJHcFBlH5Y3BhmUf4WZ4mBKj4WU3svOqnDuC/Ebhun46rBh3W1aB2PbKscjy6m+N0Eo+HbKFlbJ8gywSPvV2az32qbrOlmc5MT4T1ZTdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 14:24:40 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%5]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 14:24:40 +0000
Content-Type: multipart/alternative;
 boundary="------------xPioTlxn6Xki0R003gP9UEnk"
Message-ID: <cc55b868-9a05-48df-a9a5-6bb2639e8286@intel.com>
Date: Wed, 30 Oct 2024 19:54:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_psr: Check sink status only when wanted
To: <igt-dev@lists.freedesktop.org>
References: <20241030065827.2392745-1-jouni.hogander@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20241030065827.2392745-1-jouni.hogander@intel.com>
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f9e76d-05a3-4461-fd1e-08dcf8ee9725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aG1XOTVhMnFnanVRSC92TkRsLzA4cTFJSGZQYVYyRXRNdTNaWnJ1VVRFZk5E?=
 =?utf-8?B?bFFEZDNPTWJLSXZidUFjb2ZLUDB1MXJOWWtSMmFFVy84WVY4aVQ0NDZIdHdy?=
 =?utf-8?B?dHA4bElUa3hQQUxIVm1hR2U3aW1BK01rcGs4REFjMkNiSVZUYlB6cklDQ0lO?=
 =?utf-8?B?ZHRRT0VZR1VmR3B0b3BlNTF4TjdmL2VrSGZqY2x1ZllmMVZZSDl6ZEkrL08z?=
 =?utf-8?B?alJEeUltVEE0cU9CWW5pRW1ZbE9mS2RoWHlrRmZzN2VieThOMVYvUWNJOGxo?=
 =?utf-8?B?QjFwdXpSa0llYjJka05FVkRXZHhCeFBWb0trZmRyWW9XZlpML2hYN0wwVkRa?=
 =?utf-8?B?M243cEVCdTY0NkpBTVpqSHIrMkhXd21kTTk3Nk00QTZFTE1aeWFUTHNySUV3?=
 =?utf-8?B?U1NsMWR4enNaN0xCTmt4aVJzTXNwMEE5QXpHczZ5aHpodzBzM0RDS1FyTmx1?=
 =?utf-8?B?TnNqbm9zVVkvYk9SVnFUSk0xNloxbkJZZ0d5VGNyT2x3Sy83clhIMG8wSTAv?=
 =?utf-8?B?WWkwUm9PcmUzb1dlaEdyWVRLemZ1TXk5R0FnYUgzNXhFN01nUS9EdWhOWjUv?=
 =?utf-8?B?aURNc0liaEVWYjJUeEtCRnpuY2ZNWUZ6eTZnVWhWam1aQmhRd3Q3S3ZsQUUz?=
 =?utf-8?B?cG1maTFxQy8xK0paVzNoT2NQam1XVW1pa0k0djZzQXJ6UmJuMnZDanJkV0pN?=
 =?utf-8?B?UFVTV2d2QkxxUmhQV3UzUE9oL0VLNHg0V3J0cjEyT0RNMWZnVHpIalZIelJX?=
 =?utf-8?B?V1VJYjBZYXBNd0tJNWpwN013dDBrR0NTcGtFcFBjcEdrWk05RFB3Wmg0aUVs?=
 =?utf-8?B?V2xVWkV5ZFV3R3I2ZTYyaVlLcUVsYkRhYlpoYTlYRHFWQnlULy85QVBWRG1Z?=
 =?utf-8?B?bXBYbG41QUhiWGdQdUo3eHZ0czBXY0t3R2l3V1JpS3kzaXFvRkhESGhjM1BC?=
 =?utf-8?B?M1NuR1d2QXRuazdqVHNvQWRaa3ZTeDh4QzNWUUhuamorL3VZQittK054blg3?=
 =?utf-8?B?MlhaM1Z2MUUvUlJBTkhkKytMQ25pbkpYNk5MMmVjQncvSnRLemJuQUllWWUy?=
 =?utf-8?B?cVFFQlp3S3hpbVhEVzFac3BDQVk0SXF1NlVjMHhHRHRlYU5rNDEzMzV4YjNF?=
 =?utf-8?B?Rk1KNnA2NE5leU40OWZJUFRNdGhaSVdmUWJXWDN2ZDVhWlA4ZmxZMlRCS0NH?=
 =?utf-8?B?MHFqQnpZNWVzeWFjMEQ4V3VRYkRvUTJpanhNcXU4amZzd1p4eCtLc2hxa29r?=
 =?utf-8?B?OVZFcUtHMjNubThRRld4Ty9VUEhTWWk2L0tlRk1PcWNkb0xqQ3ZSNk95cVB5?=
 =?utf-8?B?US9DZXVJZjVocFhhVFRBMTE2cERoWVRlUnJoN0Uyd0FLR3JPdCtuNkVvdEpu?=
 =?utf-8?B?eklQblJIQXdiSEpaVnZoUUhWdVZUWVNCWFU1aHFXQUJaU2E0TmJiczdsTDJT?=
 =?utf-8?B?T045MXFlcjlSNUs5am1xRkRtK1dJMUJ1dml3T2VBd2ZEZUlPSHpSdWtDcXVQ?=
 =?utf-8?B?WUJSTWYwY3VjWGlNQjdUd3M1WTdtbGRNV2FWMWFzU284Zk95SC90ZHBIanNs?=
 =?utf-8?B?RnJqWit0eTJNN3VFNEN2ODZsU29vNVdmZURmMFBFOThsR05jRStUWDlYUlp4?=
 =?utf-8?B?YkJtbzRTWGd6KzVsdTFkWTB5OHBmS2Y0VWpCQWp5S3E0N2dZRFRlUENNNFJk?=
 =?utf-8?B?RlhRK2pPUlJTYnJ0T0Y0M2tTTFVMT3JQSkM1STdnckhiN1NPRzZuSmlRZ0da?=
 =?utf-8?Q?wf48vKB8+dxvoj6vs4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUZVbE04MUdrbXJUVzVIRjlrb01CWkxmVzBEc1c4VFdYeEEvSit1OERkOGdH?=
 =?utf-8?B?OWRPVmpqTkJqdW96YjhMTmpnN0ZTUFdkbXpmK2t1RkhZU0FmQXg5NHlWZkJk?=
 =?utf-8?B?MjlpRlR1OTl5bHdnNjJTVFVKQmdhSVFUNXFtTjNJSGJYOFM4TlVDVTZuWFFy?=
 =?utf-8?B?RkhCVVFrbDRneEdGU0tjTDYreU14L01jK3BROGd5bkpOcXpDMUJZQTBmOXVp?=
 =?utf-8?B?S2o0UE1nQ1UrcVpMTzBxV1VmSlNRdWg0Z0cwakU4eFMvd0V1Z3ZtNGY2eWpp?=
 =?utf-8?B?VDJqR3grNndNbzA5WldtME9YSlRmdkdHMHhZN3JkNFRyN1UwbVNud25Bc2w5?=
 =?utf-8?B?aGh3ZHFjTkJrbWxEOHgwenB4QU5FZjR6eFhvdXN2YUk2WDJSYjdMZjJsTUFF?=
 =?utf-8?B?MnNVazV1WFNFZXNma2loMnRWMGxwaXhRc2s5WmZuOTI2ZUVWb0JSSHU0WGtT?=
 =?utf-8?B?TjBKSVNVWTVnUmg5cGljenUwbzFYcFlWbkxVcmc0bzQxVi92aVVHd1ovcXFN?=
 =?utf-8?B?SGh5L1QzL0hjUlJEUHFkc09mWG9lK3VYcGhidldQYTF2eGhyV1pCZ0p3UTRN?=
 =?utf-8?B?cTF1Q0JiVEM5RDVaUWZ2bjd0bFNUYW1VYzhsQVVxQ0hJN29pZ2cvSGhSZVdk?=
 =?utf-8?B?blVZa1NhVHYwcWZpUXV3bWVNeGtZV25kbDZPRExqMGtzbXA1YTdsaTRrLzZW?=
 =?utf-8?B?ZnJ1eERVTHUxeWgvb3EzY1NwZGRONlJwL2cxaVhhVDRBY0hab3UvNDM1VkNP?=
 =?utf-8?B?YzZmL0ZiZlBYRUJDQXJXSTNKWUFNaWRmK2dyditYOVVMazZ2QlpoT290aFRZ?=
 =?utf-8?B?dHVuaU04Q2hkeEpXVG85Y2s5eVIzajUybTRhVm16TmhURFZEdjNxeldVVXFE?=
 =?utf-8?B?aFc1d2s1QkdaV2JCdnNoZTN4cTVVeE9vMDdGUEVCa2RyWFl1amtVcVV2WkdK?=
 =?utf-8?B?d2owVmNxS2FkZG1hUjVhM3VBWFQvUnkwZ0dDTjVKTFIzQXBaZGF5aklJdWxm?=
 =?utf-8?B?Z0tveFQxU0k0UVZrZVRSdFRvemhBck5ZVDIyNWJNSUFGRDFReTFUZnlPbDVy?=
 =?utf-8?B?ekhERkloTGtjMkNHcUl4eml6ZnRBSGw2MTBoS0R1UFk1Mnpub1krZE44TlRR?=
 =?utf-8?B?cUdGbnlUSW0vNFpQTGdqR1BubDVwSm1jZ0pScDVnRlVtQzRYck55R1o2TWps?=
 =?utf-8?B?TEZTUnJ2RFVNNTF5OEJKdTNmaWswT1lnc1czN0hXQ0lUTWdrRGpRL3NHYitU?=
 =?utf-8?B?RmVoVllPc0t6bFF2dy9GOGNpMm1qekJLREFMWEYzNDV0ZXdCWk9kdmw2WW0r?=
 =?utf-8?B?N1JCbGx5aVF3K0pjbmh0WUFhVHE3U2tEU1BPMlJIc0xHS0lUMURPaXI0NHU4?=
 =?utf-8?B?V2txTm5Ma3dLQlU3bElWRml2VGRwUTVEN0tFZ1JxTW5Ta3dOWEFuTG9wSEFG?=
 =?utf-8?B?akNGa1I0RTlUN0xzTWZkelpZYStydHl3T2dnYXlrajE4dUV3OXUzaXlpa3h5?=
 =?utf-8?B?WU1tRjk0aVZ6WjVJUStnRTZLVy9ucHNHKy8wU0hsOTZZTGd4Nkp1dGNCWlRp?=
 =?utf-8?B?a3JRQXBqYzVMRVVvUU9kMFJ2OWF3d2xHWW5PTFlDRzVHV1k2bHB6MzhIUTM0?=
 =?utf-8?B?VTlxUVlwNHljQkl6MjllVVlpWTROL05vVldDcllzN0ZkVDhHOU56UC9UTjBz?=
 =?utf-8?B?QWZkc3pGUUVQT1luRFE4MHIzUEhzeWVpUFI3cnowOFVYUjZoYTNRbGY1eGh4?=
 =?utf-8?B?QWdaWWZKQVJNNzl4cWdoT01sVEVzVjZydTlGM0wwSXMzSmNFWEQ3aGdFQ1pX?=
 =?utf-8?B?VEhyc3BWQ1MvbWtCbXN5MmZ1Z0FzRDZydHN0VmFiTkNKdU5RK0FXY3dORWpQ?=
 =?utf-8?B?aEJ1RlJZK3ZSTXNrZHpBdFdZUHJ2OFFrYjFZMXJXajVzaGY2ZWN2Y0l4anV2?=
 =?utf-8?B?dzZYZTc2VU85REVySmpkMDNsK3dDdWFvVEpicEhHbm1TSjVtTzVMTFpiSWtv?=
 =?utf-8?B?Q1FVOXJacTZEQWtXc2FzZjR3RExSRFphaXZRbmYxd2trTmNUM3hEREU1SXVW?=
 =?utf-8?B?V3hPaXM4dHNTcGdOOXNCSmFzeWJYSXNtamk1VTAyRGJmenNSbzVQSnZ5Wm95?=
 =?utf-8?B?bkwzTDY2blpyQk9YWm9wQUQ5MWpBZ1k2UjNkOVBGR3N1R2pZZmhOZ1hkalFY?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f9e76d-05a3-4461-fd1e-08dcf8ee9725
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 14:24:40.5286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiWp2k2POOJt5P2rF2T7wWIB90fIGAuuGEhvvPtEfbGe7wtQhS42s+lcgxvw0rGvI+4MZikDYCYfv5i/kc3xCYi44I9+n8uxLxr32EOMRiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
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

--------------xPioTlxn6Xki0R003gP9UEnk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jouni,

On 10/30/2024 12:28 PM, Jouni Högander wrote:
> Checking sink PSR status seems to be causing problems as it is performed
> by reading dcpd status registers over AUX channel.
>
> Generally having still possibility to check also sink status is a good idea
> -> disable them by default and enabled if environment variable
> IGT_PSR_SINK_STATUS_CHECKS is set.
>
> Signed-off-by: Jouni Högander<jouni.hogander@intel.com>
> ---
>   lib/igt_psr.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 0eb002633..83c21e6ba 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -79,13 +79,21 @@ bool early_transport_check(int debugfs_fd)
>   	return strstr(buf, "enabled (Early Transport)");
>   }
>   
> +static bool sink_status_checks(void)
> +{
> +	const char *env;
> +
> +	env = getenv("IGT_PSR_SINK_STATUS_CHECKS");
> +
> +	return env && atoi(env);
> +}
> +
>   static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
>   {
>   	char debugfs_file[128] = {0};
>   	char buf[PSR_STATUS_MAX_LEN];
>   	drmModeConnector *c;
>   	const char *state;
> -	const char *env;
>   	bool active;
>   	int ret;
>   
> @@ -116,8 +124,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>   
>   	active = strstr(buf, state);
>   
> -	env = getenv("IGT_PANEL_REPLAY_IGNORE_SINK_STATUS");
> -	if (active && output && (!env || !atoi(env))) {
> +	if (active && output && sink_status_checks()) {
>   		active = psr_active_sink_check(debugfs_fd, output);
>   		igt_assert_f(active, "PSR sink/source state mismatch\n");
>   	}
> @@ -351,6 +358,9 @@ void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
>   	char buf[PSR_STATUS_MAX_LEN];
>   	int ret;
>   
> +	if (!sink_status_checks())
> +		return;
> +
>   	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
>   	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>   				      sizeof(buf));

LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------xPioTlxn6Xki0R003gP9UEnk
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jouni,<br>
    </p>
    <div class="moz-cite-prefix">On 10/30/2024 12:28 PM, Jouni Högander
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241030065827.2392745-1-jouni.hogander@intel.com">
      <pre wrap="" class="moz-quote-pre">Checking sink PSR status seems to be causing problems as it is performed
by reading dcpd status registers over AUX channel.

Generally having still possibility to check also sink status is a good idea
-&gt; disable them by default and enabled if environment variable
IGT_PSR_SINK_STATUS_CHECKS is set.

Signed-off-by: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
---
 lib/igt_psr.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 0eb002633..83c21e6ba 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -79,13 +79,21 @@ bool early_transport_check(int debugfs_fd)
 	return strstr(buf, &quot;enabled (Early Transport)&quot;);
 }
 
+static bool sink_status_checks(void)
+{
+	const char *env;
+
+	env = getenv(&quot;IGT_PSR_SINK_STATUS_CHECKS&quot;);
+
+	return env &amp;&amp; atoi(env);
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
 	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
 	drmModeConnector *c;
 	const char *state;
-	const char *env;
 	bool active;
 	int ret;
 
@@ -116,8 +124,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	active = strstr(buf, state);
 
-	env = getenv(&quot;IGT_PANEL_REPLAY_IGNORE_SINK_STATUS&quot;);
-	if (active &amp;&amp; output &amp;&amp; (!env || !atoi(env))) {
+	if (active &amp;&amp; output &amp;&amp; sink_status_checks()) {
 		active = psr_active_sink_check(debugfs_fd, output);
 		igt_assert_f(active, &quot;PSR sink/source state mismatch\n&quot;);
 	}
@@ -351,6 +358,9 @@ void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
 	char buf[PSR_STATUS_MAX_LEN];
 	int ret;
 
+	if (!sink_status_checks())
+		return;
+
 	sprintf(debugfs_file, &quot;%s/i915_psr_sink_status&quot;, output-&gt;name);
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				      sizeof(buf));</pre>
    </blockquote>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">LGTM,
<span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></pre>
    <blockquote type="cite" cite="mid:20241030065827.2392745-1-jouni.hogander@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------xPioTlxn6Xki0R003gP9UEnk--
