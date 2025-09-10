Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC00CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 04:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6147810E83C;
	Wed, 10 Sep 2025 04:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQPWZqt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509D910E83C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 04:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757480053; x=1789016053;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ohGBbDYYnq4X966YYrxMk+Ig98fksn/MurGNPhJTJRg=;
 b=QQPWZqt/rEK/KDB/QiRBKw6CDG6qUkFxV6yC/YSI8TxrXvf48SfhZSdJ
 p7MJ+tVweEfmlP+eyPMVayh3mpv0W+3o4NAUKWCXCsjjH5/FjflVsDKb7
 C+RxqGDoCaVIDyjlAh0FjpEIoqJ+JtRUWvJqpe3SokCVJNlKkyc8jdjwx
 9mYUkUYtzDB2WNnTDDGAvSmWkdqKy/sq91rqVxtugEMN17doxpubSZsEG
 LRkJFz700GfxR4cScV+vPiO8fB1HMkH3USgv+R4+pCGo1/2txwrDy+ZPc
 tyfb+x/jS9b7XdPKefgEjOujA0v1NIEJU7kDD1Ko6x1hI54tMi5G0mFmo g==;
X-CSE-ConnectionGUID: k69kGDA4RlSPo8h6IAu9UA==
X-CSE-MsgGUID: 4oOjWgfLTx25U/bxEeoSUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58999111"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208,217";a="58999111"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:54:13 -0700
X-CSE-ConnectionGUID: gGwNhLiSQ9qsoD/Q+f6qlQ==
X-CSE-MsgGUID: XUJjDIl2SCSJ8vktlvCNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
 d="scan'208,217";a="173727186"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:54:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:54:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 21:54:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:54:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ub+9JmWNY2G5s29orWU2F+jNLHxh/5N5iEOcBmTMCEGqC1WQ+hovcyGaPvFKJidR5tGYwwyLD9MqfyOwavxO7oLBCzHrtWF6LEEAzaywbMRLJKRVw4egjprUfKDhFDeXpTN+y7g9DTswXnoN1ekmGgfMMXwPhpJ1uUnnaqNhEkd/iPaJ3LxIOo6SGpwlxlORZiP49lU6t4cCmx81IDKMSgGOtftwZ4te6zRS2jHcSTGfI58FtqL1HoJXtZiaCroaF92751AFEsLpKE9ZHyTn/AgMFcC+DcKMfE7rUvwx9Y4q+G2aIR+TXlqkQqc9kNLjL7G5BdQ5UdNxC6vmWYVqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fL4xFb2iuPVlS39mO+XMI4l2/K0M7fB3puX0Hs0lPYw=;
 b=QDhaoZIWFYiZSkGpF7wlm3I2BhMoKaeLoSP8d/crylEpsli2vc2g0zaypzlDeLrR3nd1ygLktDH3AfhHceenkUsfUiXFX8IGpPCp+f7Xj741RFVW1hg8nopU7tuvkSXuQp5IYKb5V8oWa86UvwBJ9nbHq5TahQ6+3d0zfs+oOY1OEgdjke5hi3YSdbAxM59h2x6YyyPgoew00rZ715wX+2kxot6Cwy4JBwAovMyyRg4dFioP4ptRtypQYddxsTGjE4jwNfsSNN7RWL7hQs67ZzVRzxokk2i1guO0PT780Z69P5uOLC9deE2saWK5bH4p58gw/S15ibt4SwVnetUV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 04:54:01 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 04:54:01 +0000
Content-Type: multipart/alternative;
 boundary="------------HbStvPY9533ud6Ve7OEpk0G0"
Message-ID: <b69582a6-f0c0-4dbb-87b8-eb95773aa2a4@intel.com>
Date: Wed, 10 Sep 2025 10:23:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
To: <pravalika.gurram@intel.com>, <igt-dev@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>
References: <20250909070039.1099371-1-pravalika.gurram@intel.com>
 <20250909070039.1099371-3-pravalika.gurram@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20250909070039.1099371-3-pravalika.gurram@intel.com>
X-ClientProxiedBy: PN4PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::8) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 899d717b-3591-4650-e3e7-08ddf0260f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vkc0OWsyOGREV2RLMktUSWpSZDBVSiszNCtSNndtREVTMFhJVzdCT05IcTM1?=
 =?utf-8?B?QS8zMXVDdnRLVUNSOHFiYmh1dnRZRzZCUFdhemhCc2V4eDZZbC9kS1lEa1Vn?=
 =?utf-8?B?MzFTZFBENWliSjB2UVdqekQvelFnVkpxODd5YVUxVFlybDQ4REpCaklBUXA2?=
 =?utf-8?B?ZU1xUWNkdXZJM0NmYTZveFljOWVwU25GbUNVc3lLRklOSk53RHBQZVNrRjk2?=
 =?utf-8?B?b3UzdTllc01FU0xJaDR0Z05FTURQL1dxeU5CM3ZVMXlPNGR0WmlmNnM1TGNN?=
 =?utf-8?B?VGxMMDlTbUVqTWRxakVPRFFNV21XUENTMnVCSFFLZ1pyanpzdEhwV0JnV01V?=
 =?utf-8?B?aUxQeE9zeWd2Vzh1R21YNDJmU2FqckJBbkt4M0x0TjlEUk1mZVdRT0w5bGZC?=
 =?utf-8?B?MFkwcXQzUjlKL0ZyK1l0OVIrdHRHb28wUjFpZWsxdm56M1JuOEZ6ZEhBQWhM?=
 =?utf-8?B?UDBsdVIwZHhZRnErUFBINTFoeVBOdkdVc001RWFYSnhJcG9oTHBHUmppaHp4?=
 =?utf-8?B?VEFlNUhiVElXbDhhU1FvMVBoTVE1eElRekpjb0xtS0xrcFdDakhvWXVlRGpT?=
 =?utf-8?B?ci9TVXRnVm10aU1mSHk5OGhXcTdPTGNXejhTMGxmU2NiSWQ3cGJrNzkyQ1R2?=
 =?utf-8?B?VEg0VjNXVDBJR2Q2TzVNY2ZQUlh6cUN5eTM2TEpVaHd6SnluNDhHNjc3YnRQ?=
 =?utf-8?B?MkRFRnpqMkJOcWVGcWNXZFQxUG5GR0VVdCtNcVc1WmxjazgrTjk4ZFBHckI2?=
 =?utf-8?B?VFVCRWE5QTRoRTNLV29ZNzF2U29pTE9saWF3dUp4aGZrQVd2K3dTWTdmS01N?=
 =?utf-8?B?L0JzYmNGTlF6SGdWUmIrNHRQdEVDY3Q4YVo1eWxKUjNCQTV2Y1hLcW9NWDM0?=
 =?utf-8?B?Q2FYbHpoWStuVVllUFJFWXpjT21ZT09TNy9IdHhZaWhJS2VzeHQ0RGR2dmx0?=
 =?utf-8?B?TVZTczZZU0MzWm1SemtRNmh2TVp4NWsvRGovcUt2YVNONlZvaW9UQkFHeGZk?=
 =?utf-8?B?M3hyZUpiTVFtUXVJd3RwTkZoOVdvZWd2L1NxK3h5UXN0enI1OUlwcGI1SGw2?=
 =?utf-8?B?SHIvaDNhY3pCeWk2UHQwOG5KQTlOYXp4MTc3NEo1OHB5Z2VxZVNZSlZzLzlv?=
 =?utf-8?B?OHJSOWRKSkluWnZwOEVPL1pVOGl0L1BwMTFybDJiQ05ncUZsRk1oRkpXVm9h?=
 =?utf-8?B?ZGZ3c1JGRThTcnBIS3pDUXpQYkt5NHgzWFF5dG9SRkhQN0lXdDJ2eDRBdnd6?=
 =?utf-8?B?ekhRTWFtMjRBbi9pdjFVTGRGVE5hTkNsa1ZiR3MraVBPOUFiWG15L0VYRFg0?=
 =?utf-8?B?TTRQbW1XUk9VbW9QMGVlYlM2cS9kRk9ublc2eEQ2Vm0zZmpBM1RSM2x0OXlv?=
 =?utf-8?B?VzkyVnJyVkNpMXdISkRKUnI0UW9xYktPR2JSd014RzlaVERCQlVEVU9BQlRk?=
 =?utf-8?B?cndYb0hRR2E4WWJRWDVKR3RZZDRDTGNMeUFzVEMxM2xxSmVmdmgzT05kNkpT?=
 =?utf-8?B?TG8zRWpOaHpveHBoV05VbnJGM0c1Q1pRdFVMM1JVaCtNWkhOU1phRXlvVlV5?=
 =?utf-8?B?R1lXMjJLSlZ3UXJ4ajc3ZE5nQ1F6bTF1T0pVa2J4am42M3FVT00zY0NTMmQy?=
 =?utf-8?B?N1BPbmhKM0VzcC9HTXJUSGNscXJqU3hMenBqZWo5dEExL2hMc3NCK3J5bnJp?=
 =?utf-8?B?bGtXd3B1cGtOTnZRY3MremdhbTJQWE1JdlQyUTRsQjVLUzBMck53VW1nQUpC?=
 =?utf-8?B?Z1VYU3lWejBLOEYvdUFEOVQ1anJ2RHVsSXJvbnhqZHFRdytwM25mM25UY2l3?=
 =?utf-8?B?V3Noa3BzTU5DVHNTYy9NT3ExUXU4aXYxVzZDSU5OMjhNeURaWDA0Viszb0VC?=
 =?utf-8?B?UmFDRjBRR3FIOUJOVzhFNVBzRDQxdU9WT2hYNEc4T2pOYkxKSVVMN3ZDeHRI?=
 =?utf-8?Q?pnVxOkE3wS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk5pM21sMEhPOTAzWXlWOFdPbDZHa0MvdHR1ZTI0ZUI3T0dEMHBwUTF2TjdU?=
 =?utf-8?B?eFFmTUFTMVN2UnpXQllLM0w1UndvUER6VGhRVEdwUnQwWVRsdGM2WENzNWc3?=
 =?utf-8?B?SVhQR1NtdmVDanY5OXpscHcyUXQ5Qk1mVllsOVA5UGRCU0VWSGNibFVicExP?=
 =?utf-8?B?dElGL1ozVG1EK21SMGNVU29rd3graUdZQ3UxbU5OZVMvemlGZjdPWWdPVjJV?=
 =?utf-8?B?MExzSzBYOXl1cGZoRklFanVGNjh1aTdaNzNDOS9IUHR3OEJha0JXR1BqZHJL?=
 =?utf-8?B?cjk5SGVlZ3l4K1M4TXcyeG9vSDFsU2VMbmhoTENuckVDaDExdm5ESU8raFdl?=
 =?utf-8?B?K2RsaEF3TTZ0MzlkWDdsUkVOUGZtMUREVkdLcG82NlB5ZHljSE8zYUhWUjRn?=
 =?utf-8?B?aVgzRXJVUmVYYUxDcHNpQkVxdHFPT0hTTWQrWDBzM01ERmo0enNHcmNreGRs?=
 =?utf-8?B?d2JrRVlZMjVXdW5JdmxlQ21VRlhORlNsaEdiMzJYTlBwNnhKbXBUSWs1YjhX?=
 =?utf-8?B?QjhRTHpsMGUzMGt6ckdwQnBPbGVoc2VDWTNqbTFIOGFKNGJUZkJSTGIvZmRp?=
 =?utf-8?B?TGhRU1ZYSy9HV1FzZWIyYTYrT2o4dC9GSFlqVERoQlRDdG5wTmJvcW9aNlFm?=
 =?utf-8?B?OGNBeTUrZExyS3dZMWxOblAvdmtpL0lyamtXTG9CNGtrT1hSS0ttMFZYNE94?=
 =?utf-8?B?Z0Jma3N2anRLbFZuR0ZDaU5kdEt5K216L3VhWWlxVVd4LzlVdlJUR0VsZndT?=
 =?utf-8?B?ODNwQU1qT1N2cGQveUwvTldYZzJDVlFBZ3VkOHhCTWR3RVpZYys0TUN6dm1s?=
 =?utf-8?B?TTE2QUNGQnhHaUlaNnpCRFY4S3JuZ2FPUUsybmhHcWpsSlk3QzdLcVMwUVZO?=
 =?utf-8?B?QVdSbE81dlljZEYwODJMZTlYVlFXNkJVcEZiZlVJVk1zUjA2dEVqYzc5Vk8w?=
 =?utf-8?B?akIrcFpXeTN6aGtxVzJ4L0YvcDNIWTFXYVAycXdyZFdDMTZ2U2YxVEFaMWh1?=
 =?utf-8?B?L3NrNE9ITVJPRzI0d2xpbm84eTR4ZFkyYVc0MzlEV21uM25JZ0NHS3pCQkVG?=
 =?utf-8?B?em1rWVVCUXZvU3NMalNab3l1Ukl3OTdTdlNlZTdsOERvZndRYW83RGVDWE4w?=
 =?utf-8?B?UVZ5d3BvdjUzbzRwTmhVWW5QZG0yT0RDNktlWTBiL092TktkWDRoS2tFKzB5?=
 =?utf-8?B?Q3MvUFFmNmgwNlpSSFBWOWRDUWwwOUdzVjdRRmhsdk9LQzE3VVp5dzduQ2Vs?=
 =?utf-8?B?VDVOWER6UFc2QVVZMnNINUR2Q0RiY2U5ZzhGV29QR3BDeE0xaHNjMCtETGhG?=
 =?utf-8?B?T3NJakxxTXFmU1k2bFY2NUlFczh3bHFEdVRkYUptSDBTZU9td3hiSCthOUk2?=
 =?utf-8?B?aGx4K1kwMXV2ZE1BQ2pVWFhTcTUwbDFreVJwZklCTW1tTVg3YzdjN2daUlRi?=
 =?utf-8?B?SHZYZUNSeU91YmM0TG9zV0Y0SDBYbkxXNW5ZbkhTUGZPUjY5TG5NNHhtSW5h?=
 =?utf-8?B?QzIzMllSV3YxR1ZWdjN6RkphdlF2OVFWazJWUXdOT1VzUEJHaFJEek94ZlJX?=
 =?utf-8?B?RDBMeTh1SkdLTnoxdFhIVFJ5dWhZSDFZcmJ1dDArMEU2cm5Ocjc2dFpuWFZS?=
 =?utf-8?B?SjA0eVhMVmpYYlRNZ3dCaU1Va1E3a2Fzd242MXBPZXBsSC9oYXhrREFqTVZr?=
 =?utf-8?B?UU1SQTBBb1R4T1NpUWw0RUtEcVRyWGVudElDeFZiRlBOekN1QkRzemVUNFNZ?=
 =?utf-8?B?VmNLTFk0aU10ZTBnM3pSN2EwbUx2aFNwWWtyQ3FzUmRwR3dVMC9ZMzNScTRH?=
 =?utf-8?B?ZmgwWFdxemZPN21JNXBkRlo3OTJWTXhwSkZmcjhvbDh1bzVkMW9sRjJpTE91?=
 =?utf-8?B?ZUR0bk9nMFpndlg4UEs5RWUwQ3hGLytsVEVuU0Y4eDA5NkJCVFkvZ09jTFNV?=
 =?utf-8?B?dXpkdVR3VWl1Q05qZ3BhTGdlVzR3TkR5SC9pTFZFdkxzejBNYmN2c09YdVdB?=
 =?utf-8?B?R1pUNVFHZnltMGdjeDdRUU13UE8zc0Z3YkswbWt1Q0trSFplQTBRcE9acGoy?=
 =?utf-8?B?U2J4S1hmZFhoUzRFTkxIcUovWk9QUzVRcGhtUzYyeklHK2xXb1FIQXIxSmty?=
 =?utf-8?B?K0RsTjJ6eVlFb0o1K1FtWjlDU0g4MCtFZjFLOXRVbmdTaUovUnQ4eGZLZkpo?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 899d717b-3591-4650-e3e7-08ddf0260f0f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:54:01.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeck8XgPfb3UcvsUKAjhr5XqWP6JVgskyJYsarQnrIQdRksYIsvYaQXWqFvtaE/Lmjdl7rwSo3raPsBWEfHQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

--------------HbStvPY9533ud6Ve7OEpk0G0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/2025 12:30 PM, pravalika.gurram@intel.com wrote:
> From: Pravalika Gurram<pravalika.gurram@intel.com>
>
> Add pat-index-madvise test to verify setting different
> pat_index values for multiple VMAs. This test uses
> madvise to set various pat_index values and
> verifies that different PAT values can be assigned to multiple VMAs as expected.
>
> Signed-off-by: Pravalika Gurram<pravalika.gurram@intel.com>
> ---
>   lib/xe/xe_ioctl.c                      |  26 ++--
>   lib/xe/xe_ioctl.h                      |   2 +-
>   tests/intel/xe_exec_system_allocator.c | 194 +++++++++++++++++++++----
>   3 files changed, 182 insertions(+), 40 deletions(-)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 62e9fe9eb..d2a809849 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -79,20 +79,21 @@ int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>   }
>   
>   /**
> - * xe_vm_print_mem_attr_values_in_range:
> + * xe_vm_get_mem_attr_values_in_range:
>    * @fd: xe device fd
>    * @vm: vm_id of the virtual range
>    * @start: start of the virtual address range
>    * @range: size of the virtual address range
> + * @num_ranges: number of vma ranges
>    *
>    * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for different
> - * memory ranges from KMD. prints memory attributes as returned by KMD for
> + * memory ranges from KMD. return memory attributes as returned by KMD for
>    * atomic, prefrred loc and pat index types.
>    *
> - * Returns 0 for success or error for failure
> + * Returns struct drm_xe_mem_range_attr for success or error for failure
>    */
>   
> -int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range)
> +struct drm_xe_mem_range_attr* xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range, uint32_t *num_ranges)
>   {
>   	void *ptr_start, *ptr;
>   	int err;
> @@ -108,12 +109,15 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
>   	igt_debug("mem_attr_values_in_range called start = %"PRIu64"\n range = %"PRIu64"\n",
>   		  start, range);
>   
> +	if (num_ranges)
> +		*num_ranges = 0;
This condition is not required. You are checking if (num_ranges) which 
is passed as reference and holds address, so every time this will be 
called. You might need this variable to store something returned from KMD
> +
>   	err  = xe_vm_number_vmas_in_range(fd, &query);
>   	if (err || !query.num_mem_ranges || !query.sizeof_mem_range_attr) {
>   		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
>   		igt_debug("vmas_in_range err = %d query.num_mem_ranges = %u query.sizeof_mem_range_attr=%lld\n",
>   			  err, query.num_mem_ranges, query.sizeof_mem_range_attr);
> -		return err;
> +		return NULL;

why NULL is returned? If ioctl fails it gives error code which should be 
checked in caller function otherwise caller will not know whether issue 
was from ioctl or other. In caller function condition can be generic 
like if (error) then some

error/warning messages or some action. Normally for success 0 is returned

>   	}
>   
>   	/* Allocate buffer for the memory region attributes */
> @@ -121,14 +125,16 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
>   	ptr_start = ptr;
>   
>   	if (!ptr)
> -		return -ENOMEM;
> +		return NULL;

why NULL is returned? ptr is pointer and memory allocated for it, If 
memory is not available it'll hold NULL which is checked in condition if 
(!ptr) and it should return -ENOMEM and error return can be checked in 
caller function.

>   
>   	err = xe_vm_vma_attrs(fd, &query, ptr);
>   	if (err) {
>   		igt_warn("ioctl failed for vma_attrs err = %d\n", err);
> -		return err;
> +		free(ptr_start);
> +		return NULL;
>   	}
>   
> +	ptr = ptr_start; // Reset pointer for iteration
>   	/* Iterate over the returned memory region attributes */
>   	for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
>   		struct drm_xe_mem_range_attr *mem_attrs = (struct drm_xe_mem_range_attr *)ptr;
> @@ -144,8 +150,10 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
>   		ptr += query.sizeof_mem_range_attr;
>   	}
>   
> -	free(ptr_start);
> -	return 0;
> +	if (num_ranges)
> +		*num_ranges = query.num_mem_ranges;
The condition check if (num_ranges) not required. You are assigning 
return from KMD into *num_ranges which can be done without condition.
> +
> +	return (struct drm_xe_mem_range_attr *)ptr_start;
Are we using return ptr_start (drm_xe_mem_range_attr *) in caller 
function? If for debug purpose or information purpose struct 
drm_xe_mem_range_attr* is required then create generic in lib only so 
that it can be reused further.
>   }
>   
>   uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index a1df810de..a41c48db7 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -106,5 +106,5 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
>   int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
>   int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>   		    struct drm_xe_mem_range_attr *mem_attr);
> -int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range);
> +struct drm_xe_mem_range_attr* xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range, uint32_t *num_ranges);
>   #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index f61a4ebf4..ea5c01e63 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -515,6 +515,46 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>    * SUBTEST: madvise-atomic-inc
>    * Description: Tests madvise atomic operations
>    * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-max-pat-index-multi-vma
> + * Description: Tests madvise max pat index multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-max-pat-index-single-vma
> + * Description: Test madvise with max pat index single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-comp-single-vma
> + * Description: Tests madvise with uc-comp single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-comp-multi-vma
> + * Description: Tests madvise with uc-comp multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-multi-vma
> + * Description: Tests madvise with uc multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-uc-single-vma
> + * Description: Tests madvise with uc single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wb-multi-vma
> + * Description: Tests madvise with wb multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wb-single-vma
> + * Description: Tests madvise with wb single operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wt-multi-vma
> + * Description: Tests madvise with wt multi operations
> + * Test category: functionality test
> + *
> + * SUBTEST: pat-index-madvise-pat-idx-wt-single-vma
> + * Description: Tests madvise with wt single operations
> + * Test category: functionality test
>    */
>   
>   static void
> @@ -861,6 +901,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   #define PREFETCH_SAME_ATTR		(0x1ull << 39)
>   #define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
>   #define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
> +#define MADVISE_PAT_INDEX		(0x1ull << 42)
> +#define MADVISE_SINGLE_OP		(0x1ull << 43)
> +#define MADVISE_PAT_MULTI_VMA		(0x1ull << 44)
> +
>   
>   #define N_MULTI_FAULT		4
>   
> @@ -1127,11 +1171,10 @@ static void
>   xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		size_t bo_size, struct drm_xe_engine_class_instance *eci,
>   		uint64_t addr, unsigned long long flags,
> -		struct drm_xe_sync *sync)
> +		struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
>   {
>   	uint32_t bo_flags, bo = 0;
>   
> -
>   	if (flags & MADVISE_ATOMIC_DEVICE)
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_DEVICE);
> @@ -1203,32 +1246,76 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
>   				DRM_XE_ATOMIC_GLOBAL);
>   	}
> +
> +	if (flags & MADVISE_PAT_INDEX) {
> +		if (flags & MADVISE_SINGLE_OP) {

MADVISE_SINGLE_OP flag not required. Whole logic can be put under if 
(flags & MADVISE_PAT_INDEX)

> +			uint32_t num_ranges;
> +			struct drm_xe_mem_range_attr *mem_attrs;
add newline and call if (bo_size)
> +			if (bo_size)
> +				bo_size = ALIGN(bo_size, SZ_4K);
add newline
> +			if (flags & MADVISE_MULTI_VMA) {
> +				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size, bo_size/2, pat_value(fd));
> +				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, pat_value(fd));
> +				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2, bo_size/4, pat_value(fd));
> +
Extra newline not required
> +			} else {
> +				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, pat_value(fd));
> +			}
No need to opening and closing brackets in else condition as it's single 
instruction
> +
> +			mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +			if (!mem_attrs) {
> +				igt_debug("Failed to get memory attributes\n");
> +				return;
> +			}
> +
> +			for (uint32_t i = 0; i < num_ranges; i++) {
> +				igt_debug("Processing mem_attr[%d]: start=0x%llx, end=0x%llx pat_index = %d\n",
> +						i, mem_attrs[i].start, mem_attrs[i].end, mem_attrs[i].pat_index.val);
> +				igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
> +			}
put newline and call free().
> +			free(mem_attrs);
> +		}
> +
> +	}
> +
extra newline not required. Indentation required
> +
>   }
>   
>   static void
>   madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		unsigned long long flags, struct test_exec_data *data)
>   {
> -	uint32_t val;
> +	struct drm_xe_mem_range_attr *mem_attrs;
> +	uint32_t num_ranges;
>   
>   	if (flags & PREFETCH_SPLIT_VMA) {
>   		bo_size = ALIGN(bo_size, SZ_4K);
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> -
> -		igt_debug("num_vmas before madvise = %d\n", val);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);

num_ranges assigned query.num_mem_ranges after return from KMD but it's 
never used in code. If number of memory ranges is required to be print 
then it can be done from lib

using query.num_mem_ranges. Same for below num_ranges usage.

> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
> -		igt_debug("num_vmas after madvise= %d\n", val);
>   	} else if (flags & PREFETCH_SAME_ATTR) {
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_GLOBAL);
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
>   				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> @@ -1239,7 +1326,11 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_GLOBAL);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   
>   		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
>   				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> @@ -1247,8 +1338,13 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>   				DRM_XE_ATOMIC_DEVICE);
>   
> -		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
> +		if (!mem_attrs) {
> +			printf("Failed to get memory attributes\n");
> +			return;
> +		}
>   	}
> +	free(mem_attrs);
>   }
Where mem_attr pointer is used? Mentioned above
>   
>   static void
> @@ -1274,7 +1370,7 @@ static void
>   test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	  int n_exec_queues, int n_execs, size_t bo_size,
>   	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned long long flags)
> +	  unsigned long long flags, uint8_t (*pat_value)(int))
>   {
>   	uint64_t addr;
>   	struct drm_xe_sync sync[1] = {
> @@ -1406,7 +1502,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	addr = to_user_pointer(data);
>   
>   	if (flags & MADVISE_OP)
> -		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
> +		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync, pat_value);
>   
>   	if (flags & BO_UNMAP) {
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1527,7 +1623,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			next_data = aligned_alloc_type.ptr;
>   			igt_assert(next_data);
>   
> -			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
> +			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync, pat_value);
>   			__aligned_partial_free(&aligned_alloc_type);
>   
>   			b = 0;
> @@ -1861,6 +1957,7 @@ cleanup:
>   		else if (!alloc)
>   			free(data);
>   	}
Remove newline and call if (free_vm). Should match from previous
> +
>   	if (free_vm)
>   		xe_vm_destroy(fd, vm);
>   }
> @@ -1893,7 +1990,7 @@ static void *thread(void *data)
>   
>   	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
>   		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> -		  t->flags | THREADS);
> +		  t->flags | THREADS, NULL);
>   
>   	return NULL;
>   }
> @@ -2011,7 +2108,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
>   
>   	fd = drm_open_driver(DRIVER_XE);
>   	test_exec(fd, hwe, n_exec_queues, n_execs,
> -		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
> +		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES, NULL);
>   	drm_close_driver(fd);
>   
>   	close(map_fd);
> @@ -2108,6 +2205,12 @@ struct section {
>   	unsigned long long flags;
>   };
>   
> +struct pat_section {
> +	const char *name;
> +	uint8_t (*fn)(int);
> +	unsigned long long flags;
> +};

You can reuse available section structure and can add function pointer 
as it's new member. same section you can reiterate to call PAT tests like

for (const struct section *s = intel_get_pat_idx_functions; s->name; s++)

> +
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -2238,6 +2341,31 @@ igt_main
>   		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
>   		{ NULL },
>   	};
> +
> +	const struct pat_section intel_get_pat_idx_functions[] = {
> +		{"madvise-pat-idx-wb-single-vma", intel_get_pat_idx_wb,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
> +		{"madvise-pat-idx-wb-multi-vma", intel_get_pat_idx_wb,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
> +		{"madvise-pat-idx-wt-single-vma", intel_get_pat_idx_wt,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
> +		{"madvise-pat-idx-wt-multi-vma", intel_get_pat_idx_wt,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
> +		{"madvise-pat-idx-uc-single-vma", intel_get_pat_idx_uc,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
> +		{"madvise-pat-idx-uc-multi-vma", intel_get_pat_idx_uc,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
> +		{"madvise-pat-idx-uc-comp-single-vma", intel_get_pat_idx_uc_comp,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
> +		{"madvise-pat-idx-uc-comp-multi-vma", intel_get_pat_idx_uc_comp,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
> +		{"madvise-max-pat-index-single-vma", intel_get_max_pat_index,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
> +		{"madvise-max-pat-index-multi-vma", intel_get_max_pat_index,
> +			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
> +		{ NULL },
> +	};
> +
Instead creating new structure reuse existing section struct like const 
struct pat_section intel_get_pat_idx_functions[] = {<tests>, flags};
MADVISE_SINGLE_OP flags not required. It creates confusion thinking 
there might be MULTI_OP as well.
>   	int fd;
>   
>   	igt_fixture {
> @@ -2255,52 +2383,52 @@ igt_main
>   		igt_subtest_f("once-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("once-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("twice-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("twice-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-stride-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-execqueues-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-large-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-64k-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("many-large-execqueues-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   
>   		igt_subtest_f("threads-many-%s", s->name)
>   			threads(fd, 1, 128, 0, 0, s->flags, false);
> @@ -2351,13 +2479,13 @@ igt_main
>   	igt_subtest_f("prefetch-benchmark")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> -				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> +				  NULL, PREFETCH | PREFETCH_BENCHMARK, NULL);
>   
>   	igt_subtest_f("prefetch-sys-benchmark")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
>   				  NULL, PREFETCH | PREFETCH_BENCHMARK |
> -				  PREFETCH_SYS_BENCHMARK);
> +				  PREFETCH_SYS_BENCHMARK, NULL);
>   
>   	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
>   		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> @@ -2377,7 +2505,7 @@ igt_main
>   	igt_subtest_f("fault")
>   		xe_for_each_engine(fd, hwe)
>   			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
> -				  FAULT);
> +				  FAULT, NULL);
>   
>   	for (const struct section *s = psections; s->name; s++) {
>   		igt_subtest_f("partial-%s", s->name)
> @@ -2438,10 +2566,16 @@ igt_main
>   		igt_subtest_f("madvise-%s", s->name) {
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> -					  NULL, s->flags);
> +					  NULL, s->flags, NULL);
>   		}
>   	}
>   
> +	for (const struct pat_section *s = intel_get_pat_idx_functions; s->name; s++) {
> +		igt_subtest_f("pat-index-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
> +	}
> +
>   	igt_subtest("compute")
>   		xe_for_each_engine(fd, hwe)
>   			test_compute(fd, hwe, SZ_2M);
--------------HbStvPY9533ud6Ve7OEpk0G0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/9/2025 12:30 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:pravalika.gurram@intel.com">pravalika.gurram@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Pravalika Gurram <a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com">&lt;pravalika.gurram@intel.com&gt;</a>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned to multiple VMAs as expected.

Signed-off-by: Pravalika Gurram <a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com">&lt;pravalika.gurram@intel.com&gt;</a>
---
 lib/xe/xe_ioctl.c                      |  26 ++--
 lib/xe/xe_ioctl.h                      |   2 +-
 tests/intel/xe_exec_system_allocator.c | 194 +++++++++++++++++++++----
 3 files changed, 182 insertions(+), 40 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 62e9fe9eb..d2a809849 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -79,20 +79,21 @@ int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 }
 
 /**
- * xe_vm_print_mem_attr_values_in_range:
+ * xe_vm_get_mem_attr_values_in_range:
  * @fd: xe device fd
  * @vm: vm_id of the virtual range
  * @start: start of the virtual address range
  * @range: size of the virtual address range
+ * @num_ranges: number of vma ranges
  *
  * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for different
- * memory ranges from KMD. prints memory attributes as returned by KMD for
+ * memory ranges from KMD. return memory attributes as returned by KMD for
  * atomic, prefrred loc and pat index types.
  *
- * Returns 0 for success or error for failure
+ * Returns struct drm_xe_mem_range_attr for success or error for failure
  */
 
-int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range)
+struct drm_xe_mem_range_attr* xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range, uint32_t *num_ranges)
 {
 	void *ptr_start, *ptr;
 	int err;
@@ -108,12 +109,15 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
 	igt_debug(&quot;mem_attr_values_in_range called start = %&quot;PRIu64&quot;\n range = %&quot;PRIu64&quot;\n&quot;,
 		  start, range);
 
+	if (num_ranges)
+		*num_ranges = 0;</pre>
    </blockquote>
    This condition is not required. You are checking if (num_ranges)
    which is passed as reference and holds address, so every time this
    will be called. You might need this variable to store something
    returned from KMD
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	err  = xe_vm_number_vmas_in_range(fd, &amp;query);
 	if (err || !query.num_mem_ranges || !query.sizeof_mem_range_attr) {
 		igt_warn(&quot;ioctl failed for xe_vm_number_vmas_in_range\n&quot;);
 		igt_debug(&quot;vmas_in_range err = %d query.num_mem_ranges = %u query.sizeof_mem_range_attr=%lld\n&quot;,
 			  err, query.num_mem_ranges, query.sizeof_mem_range_attr);
-		return err;
+		return NULL;</pre>
    </blockquote>
    <p>why NULL is returned? If ioctl fails it gives error code which
      should be checked in caller function otherwise caller will not
      know whether issue was from ioctl or other. In caller function
      condition can be generic like if (error) then some</p>
    <p>error/warning messages or some action. Normally for success 0 is
      returned</p>
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 
 	/* Allocate buffer for the memory region attributes */
@@ -121,14 +125,16 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
 	ptr_start = ptr;
 
 	if (!ptr)
-		return -ENOMEM;
+		return NULL;</pre>
    </blockquote>
    <p>why NULL is returned? ptr is pointer and memory allocated for it,
      If memory is not available it'll hold NULL which is checked in
      condition if (!ptr) and it should return -ENOMEM and error return
      can be checked in caller function.&nbsp;</p>
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	err = xe_vm_vma_attrs(fd, &amp;query, ptr);
 	if (err) {
 		igt_warn(&quot;ioctl failed for vma_attrs err = %d\n&quot;, err);
-		return err;
+		free(ptr_start);
+		return NULL;
 	}
 
+	ptr = ptr_start; // Reset pointer for iteration
 	/* Iterate over the returned memory region attributes */
 	for (unsigned int i = 0; i &lt; query.num_mem_ranges; ++i) {
 		struct drm_xe_mem_range_attr *mem_attrs = (struct drm_xe_mem_range_attr *)ptr;
@@ -144,8 +150,10 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
 		ptr += query.sizeof_mem_range_attr;
 	}
 
-	free(ptr_start);
-	return 0;
+	if (num_ranges)
+		*num_ranges = query.num_mem_ranges;</pre>
    </blockquote>
    The condition check if (num_ranges) not required. You are assigning
    return from KMD into *num_ranges which can be done without
    condition.
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	return (struct drm_xe_mem_range_attr *)ptr_start;</pre>
    </blockquote>
    Are we using return ptr_start (drm_xe_mem_range_attr *) in caller
    function? If for debug purpose or information purpose struct
    drm_xe_mem_range_attr* is required then create generic in lib only
    so that it can be reused further.
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
 }
 
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index a1df810de..a41c48db7 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -106,5 +106,5 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
 int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
 int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 		    struct drm_xe_mem_range_attr *mem_attr);
-int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range);
+struct drm_xe_mem_range_attr* xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range, uint32_t *num_ranges);
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index f61a4ebf4..ea5c01e63 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -515,6 +515,46 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
  * SUBTEST: madvise-atomic-inc
  * Description: Tests madvise atomic operations
  * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-max-pat-index-multi-vma
+ * Description: Tests madvise max pat index multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-max-pat-index-single-vma
+ * Description: Test madvise with max pat index single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-comp-single-vma
+ * Description: Tests madvise with uc-comp single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-comp-multi-vma
+ * Description: Tests madvise with uc-comp multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-multi-vma
+ * Description: Tests madvise with uc multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-single-vma
+ * Description: Tests madvise with uc single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wb-multi-vma
+ * Description: Tests madvise with wb multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wb-single-vma
+ * Description: Tests madvise with wb single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wt-multi-vma
+ * Description: Tests madvise with wt multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wt-single-vma
+ * Description: Tests madvise with wt single operations
+ * Test category: functionality test
  */
 
 static void
@@ -861,6 +901,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define PREFETCH_SAME_ATTR		(0x1ull &lt;&lt; 39)
 #define PREFERRED_LOC_ATOMIC_UND	(0x1ull &lt;&lt; 40)
 #define MADVISE_ATOMIC_DEVICE		(0x1ull &lt;&lt; 41)
+#define MADVISE_PAT_INDEX		(0x1ull &lt;&lt; 42)
+#define MADVISE_SINGLE_OP		(0x1ull &lt;&lt; 43)
+#define MADVISE_PAT_MULTI_VMA		(0x1ull &lt;&lt; 44)
+
 
 #define N_MULTI_FAULT		4
 
@@ -1127,11 +1171,10 @@ static void
 xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		size_t bo_size, struct drm_xe_engine_class_instance *eci,
 		uint64_t addr, unsigned long long flags,
-		struct drm_xe_sync *sync)
+		struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
 {
 	uint32_t bo_flags, bo = 0;
 
-
 	if (flags &amp; MADVISE_ATOMIC_DEVICE)
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 				DRM_XE_ATOMIC_DEVICE);
@@ -1203,32 +1246,76 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
 				DRM_XE_ATOMIC_GLOBAL);
 	}
+
+	if (flags &amp; MADVISE_PAT_INDEX) {
+		if (flags &amp; MADVISE_SINGLE_OP) {</pre>
    </blockquote>
    <p>MADVISE_SINGLE_OP flag not required. Whole logic can be put under
      if (flags &amp; MADVISE_PAT_INDEX)</p>
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			uint32_t num_ranges;
+			struct drm_xe_mem_range_attr *mem_attrs;</pre>
    </blockquote>
    add newline and call if (bo_size)
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			if (bo_size)
+				bo_size = ALIGN(bo_size, SZ_4K);</pre>
    </blockquote>
    add newline
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			if (flags &amp; MADVISE_MULTI_VMA) {
+				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size, bo_size/2, pat_value(fd));
+				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, pat_value(fd));
+				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2, bo_size/4, pat_value(fd));
+</pre>
    </blockquote>
    Extra newline not required
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			} else {
+				xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, pat_value(fd));
+			}</pre>
    </blockquote>
    No need to opening and closing brackets in else condition as it's
    single instruction
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+			mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &amp;num_ranges);
+			if (!mem_attrs) {
+				igt_debug(&quot;Failed to get memory attributes\n&quot;);
+				return;
+			}
+
+			for (uint32_t i = 0; i &lt; num_ranges; i++) {
+				igt_debug(&quot;Processing mem_attr[%d]: start=0x%llx, end=0x%llx pat_index = %d\n&quot;,
+						i, mem_attrs[i].start, mem_attrs[i].end, mem_attrs[i].pat_index.val);
+				igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
+			}</pre>
    </blockquote>
    put newline and call free().
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			free(mem_attrs);
+		}
+
+	}
+</pre>
    </blockquote>
    extra newline not required. Indentation required
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 }
 
 static void
 madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		unsigned long long flags, struct test_exec_data *data)
 {
-	uint32_t val;
+	struct drm_xe_mem_range_attr *mem_attrs;
+	uint32_t num_ranges;
 
 	if (flags &amp; PREFETCH_SPLIT_VMA) {
 		bo_size = ALIGN(bo_size, SZ_4K);
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
-
-		igt_debug(&quot;num_vmas before madvise = %d\n&quot;, val);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &amp;num_ranges);</pre>
    </blockquote>
    <p>num_ranges assigned query.num_mem_ranges after return from KMD
      but it's never used in code. If number of memory ranges is
      required to be print then it can be done from lib</p>
    <p>using query.num_mem_ranges. Same for below num_ranges usage.</p>
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (!mem_attrs) {
+			printf(&quot;Failed to get memory attributes\n&quot;);
+			return;
+		}
 
 		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &amp;num_ranges);
+		if (!mem_attrs) {
+			printf(&quot;Failed to get memory attributes\n&quot;);
+			return;
+		}
 
-		igt_debug(&quot;num_vmas after madvise= %d\n&quot;, val);
 	} else if (flags &amp; PREFETCH_SAME_ATTR) {
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 				DRM_XE_ATOMIC_GLOBAL);
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &amp;num_ranges);
+		if (!mem_attrs) {
+			printf(&quot;Failed to get memory attributes\n&quot;);
+			return;
+		}
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
@@ -1239,7 +1326,11 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 				DRM_XE_ATOMIC_GLOBAL);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &amp;num_ranges);
+		if (!mem_attrs) {
+			printf(&quot;Failed to get memory attributes\n&quot;);
+			return;
+		}
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
@@ -1247,8 +1338,13 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 				DRM_XE_ATOMIC_DEVICE);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &amp;num_ranges);
+		if (!mem_attrs) {
+			printf(&quot;Failed to get memory attributes\n&quot;);
+			return;
+		}
 	}
+	free(mem_attrs);
 }</pre>
    </blockquote>
    Where mem_attr pointer is used? Mentioned above
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 static void
@@ -1274,7 +1370,7 @@ static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
 	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
-	  unsigned long long flags)
+	  unsigned long long flags, uint8_t (*pat_value)(int))
 {
 	uint64_t addr;
 	struct drm_xe_sync sync[1] = {
@@ -1406,7 +1502,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	addr = to_user_pointer(data);
 
 	if (flags &amp; MADVISE_OP)
-		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
+		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync, pat_value);
 
 	if (flags &amp; BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
@@ -1527,7 +1623,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			next_data = aligned_alloc_type.ptr;
 			igt_assert(next_data);
 
-			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
+			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync, pat_value);
 			__aligned_partial_free(&amp;aligned_alloc_type);
 
 			b = 0;
@@ -1861,6 +1957,7 @@ cleanup:
 		else if (!alloc)
 			free(data);
 	}</pre>
    </blockquote>
    Remove newline and call if (free_vm). Should match from previous
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	if (free_vm)
 		xe_vm_destroy(fd, vm);
 }
@@ -1893,7 +1990,7 @@ static void *thread(void *data)
 
 	test_exec(t-&gt;fd, t-&gt;eci, t-&gt;n_exec_queues, t-&gt;n_execs,
 		  t-&gt;bo_size, t-&gt;stride, t-&gt;vm, t-&gt;alloc, t-&gt;barrier,
-		  t-&gt;flags | THREADS);
+		  t-&gt;flags | THREADS, NULL);
 
 	return NULL;
 }
@@ -2011,7 +2108,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
 
 	fd = drm_open_driver(DRIVER_XE);
 	test_exec(fd, hwe, n_exec_queues, n_execs,
-		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
+		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES, NULL);
 	drm_close_driver(fd);
 
 	close(map_fd);
@@ -2108,6 +2205,12 @@ struct section {
 	unsigned long long flags;
 };
 
+struct pat_section {
+	const char *name;
+	uint8_t (*fn)(int);
+	unsigned long long flags;
+};</pre>
    </blockquote>
    <p>You can reuse available section structure and can add function
      pointer as it's new member. same section you can reiterate to call
      PAT tests like</p>
    <p>for (const struct section *s = intel_get_pat_idx_functions;
      s-&gt;name; s++)</p>
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -2238,6 +2341,31 @@ igt_main
 		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
 		{ NULL },
 	};
+
+	const struct pat_section intel_get_pat_idx_functions[] = {
+		{&quot;madvise-pat-idx-wb-single-vma&quot;, intel_get_pat_idx_wb,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
+		{&quot;madvise-pat-idx-wb-multi-vma&quot;, intel_get_pat_idx_wb,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
+		{&quot;madvise-pat-idx-wt-single-vma&quot;, intel_get_pat_idx_wt,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
+		{&quot;madvise-pat-idx-wt-multi-vma&quot;, intel_get_pat_idx_wt,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
+		{&quot;madvise-pat-idx-uc-single-vma&quot;, intel_get_pat_idx_uc,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
+		{&quot;madvise-pat-idx-uc-multi-vma&quot;, intel_get_pat_idx_uc,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
+		{&quot;madvise-pat-idx-uc-comp-single-vma&quot;, intel_get_pat_idx_uc_comp,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
+		{&quot;madvise-pat-idx-uc-comp-multi-vma&quot;, intel_get_pat_idx_uc_comp,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
+		{&quot;madvise-max-pat-index-single-vma&quot;, intel_get_max_pat_index,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP },
+		{&quot;madvise-max-pat-index-multi-vma&quot;, intel_get_max_pat_index,
+			MADVISE_OP | MADVISE_PAT_INDEX | MADVISE_SINGLE_OP | MADVISE_MULTI_VMA },
+		{ NULL },
+	};
+</pre>
    </blockquote>
    Instead creating new structure reuse existing section struct like
    const struct pat_section intel_get_pat_idx_functions[] =
    {&lt;tests&gt;, flags};<br>
    <span style="white-space: pre-wrap">MADVISE_SINGLE_OP flags not required. It creates confusion thinking there might be MULTI_OP as well.</span>
    <blockquote type="cite" cite="mid:20250909070039.1099371-3-pravalika.gurram@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	int fd;
 
 	igt_fixture {
@@ -2255,52 +2383,52 @@ igt_main
 		igt_subtest_f(&quot;once-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;once-large-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;twice-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;twice-large-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;many-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;many-stride-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;many-execqueues-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;many-large-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;many-64k-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;many-large-execqueues-%s&quot;, s-&gt;name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 
 		igt_subtest_f(&quot;threads-many-%s&quot;, s-&gt;name)
 			threads(fd, 1, 128, 0, 0, s-&gt;flags, false);
@@ -2351,13 +2479,13 @@ igt_main
 	igt_subtest_f(&quot;prefetch-benchmark&quot;)
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
-				  NULL, PREFETCH | PREFETCH_BENCHMARK);
+				  NULL, PREFETCH | PREFETCH_BENCHMARK, NULL);
 
 	igt_subtest_f(&quot;prefetch-sys-benchmark&quot;)
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
 				  NULL, PREFETCH | PREFETCH_BENCHMARK |
-				  PREFETCH_SYS_BENCHMARK);
+				  PREFETCH_SYS_BENCHMARK, NULL);
 
 	igt_subtest(&quot;threads-shared-vm-shared-alloc-many-stride-malloc&quot;)
 		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
@@ -2377,7 +2505,7 @@ igt_main
 	igt_subtest_f(&quot;fault&quot;)
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
-				  FAULT);
+				  FAULT, NULL);
 
 	for (const struct section *s = psections; s-&gt;name; s++) {
 		igt_subtest_f(&quot;partial-%s&quot;, s-&gt;name)
@@ -2438,10 +2566,16 @@ igt_main
 		igt_subtest_f(&quot;madvise-%s&quot;, s-&gt;name) {
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
-					  NULL, s-&gt;flags);
+					  NULL, s-&gt;flags, NULL);
 		}
 	}
 
+	for (const struct pat_section *s = intel_get_pat_idx_functions; s-&gt;name; s++) {
+		igt_subtest_f(&quot;pat-index-%s&quot;, s-&gt;name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s-&gt;flags, s-&gt;fn);
+	}
+
 	igt_subtest(&quot;compute&quot;)
 		xe_for_each_engine(fd, hwe)
 			test_compute(fd, hwe, SZ_2M);
</pre>
    </blockquote>
  </body>
</html>

--------------HbStvPY9533ud6Ve7OEpk0G0--
