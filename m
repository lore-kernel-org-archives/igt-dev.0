Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556EECCD185
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064A110E2BC;
	Fri, 10 Oct 2025 22:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HctDAVlZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF8910E2BC
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135515; x=1791671515;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gh2zVR7lL3waDk5aAOlklfC5Pq+DNmeRTCFERszmD5c=;
 b=HctDAVlZVW+Ag6ns6fheV7HnMGM/rHjGzcMA2SVDGvaGdY7h72gsLHFi
 9GNkBdq5ggxwhAGwaWXhhgz7sNNAT7O5xCUmxy+Y/aWY2dBZ/USgm5tbj
 vEWQDrGk4jkcjtw0KNJW2XQ4hS+4zjXfR8ZWpm1D1C5D2Q57R2ZaNp2YE
 St7JAYohb9uBvXKfCfXbKsGHWelWMjEw8PMMVqFqh8as3XXyGszaDyyJE
 pcwhhEZDc+Pe2bj9FBKoULd5qdmBoHZAK5SP4pit5+iV6ShLX2eGRtjzH
 odBxu74Bcuuu2mN2jMFDzuX8CG05NfbiMTsgq4p79grxEKZ6OQlFFXHcN w==;
X-CSE-ConnectionGUID: fhRlFZZETkqubp4t8H/OTQ==
X-CSE-MsgGUID: hT0lSCEWTb+dpIeaQDPyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73045148"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="73045148"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:31:55 -0700
X-CSE-ConnectionGUID: rNhqiqthRO2xSotGE1geXA==
X-CSE-MsgGUID: rdFDGss0TEitDOmDPvc8lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="181094200"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:31:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:31:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:31:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSr/i807/inInUjQf0U0TxTXUtVa3FQD0q/Mzt2wCHQLiW93nIw56bmYZCeCwpaKGh+BUyuWLxBiyizpENEypnbzW9aULn+mG6+K15YDI9333ozRVARSHjq4dexEoj6HsHBrv5OZVdGPttmbV6NFKeq1JJmMrfT4N4DOxujRuth2OrEa+JAzDbBV/DDP/nGCRhszyv8KSx7/81Kk7TcsS0mEQvQJ55TwSswe0hkaUDrjdSAn3RTo3EVnDrMn2CIqyNFaWUxs13ZWS2gtMt7rOOGFv2LttnHX2mYkLu+rKT3ml9m5NH+SX7dSLaJ+eWxhK1i1BxKCxCBdmXPDivO9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FnnUslfuRNeJzGOjPKF+1Uo1TIy1GdRHFBKBeNAtPM=;
 b=mSaqTfzM2pvWiwsqGnDiodWosGECckfn949ECd5b9nYZh8MbdPGU7+H4ycOXQRz1meb+6m8H81KfHiBeOkORFv+m2lOXv0UwnsaZ/EfLk2KTBgzIpKYjMHYJHvjQcJ3OCcqrfEgw+nmHDp2zYUtBxTlfvFUiVL0fQWa2Gg1w9nfEByHE1ZZZOzuNUgxGIs+xla9M39ZAosElLtO6uc5Vt09PwA5BzjdUsu1cQ9ydDsVVH5TU66lnWOJdAJLxUx/NcqiMHRFVku2zBDxfbeuOBDMwnc1FT+UdNniRcLKtH2V05gW49GvZkTNtrXy4fJHOS6zqPS6L8hlSpPVb8DWo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:31:53 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:31:52 +0000
Date: Fri, 10 Oct 2025 15:31:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 16/18] tests/intel/xe_oa: Run
 test_oa_unit_exclusive_stream on multiple OA units
Message-ID: <aOmJVuWXE2lTFMxr@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-17-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-17-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:303:b8::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb40f46-e548-4166-01fb-08de084ccf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEI0ZU0rWDE3dW1kdzNqMUM2VGRyZ0gyZFMwb1JnZTFtckJSdXBWelZQL0Jj?=
 =?utf-8?B?VDNUdC9SeUIwZEhBKzM0bjFGMlVsbGVsZnRYRy9GUjhVUFJyOXZlZVJtWThQ?=
 =?utf-8?B?QkUvajJzRlhJNVVQKzdXU3VCQi9JVWhUSUswdGt5OUtVQnJXZlhPbFlpclNB?=
 =?utf-8?B?ZmJRMVpSd2lkeFI0SlJEOG03SEpQYmRSU3dNNDNaWnAvSDJRcHNHcGVBVFUv?=
 =?utf-8?B?L2EySWhBOUVDaWRiSkcwRTdnL2ZON1pPYXViWVFJR3lSK0ZVVVVxUlduVjMy?=
 =?utf-8?B?aEJFUlFkNDEwajJqbTF5RnNuS0NRaERwak1jYWg1NkJEb3A2eUpmTndPSk5P?=
 =?utf-8?B?cDlzUnQwYmlMVzZDMytDVVlLZkozTEF4Q3JCa1Fpd1ZmRGU2SStkemlaaGd1?=
 =?utf-8?B?c0h3NHVkSlIyWnl6Qjlhai9WaWpNNGtja3ozYnk1dmh5Rk5iNFZEME51d3JI?=
 =?utf-8?B?OUM1Y3QzbFFWaVZpMFQxNjRCalBtUFBZSUV3WFE4dXUzQU5DSVR3Y054NTcr?=
 =?utf-8?B?dTRaSlc0Y2xHS2xKZG92czhONHF4QlgxSndFUzRuak9rclFBTHJWUitmVStn?=
 =?utf-8?B?SndOMlhsU2VXWkg1b2hId0ZkeFo1TDFvTFRFM25RZWxpNHpPWG1XZ2VNWC8z?=
 =?utf-8?B?VmZlOEMvMWpGOXZRb2JtaTdUeXdIVWtOUnkyZGVJYTdYNkxjSEhEbjJ0dGxD?=
 =?utf-8?B?QXhYSmxoNUphSUNaa3FGZ1NrU3VTcEY0a3krLzA1d0lxUnY5S3NhWGJoSTVH?=
 =?utf-8?B?VWxPVi9NTUJrd2JtNXJqSi9mNHE3RWw3bWJkZFUvSk8vMlp1UHdqSDFCcmxX?=
 =?utf-8?B?ZDk5ZVp0dGNickdIRnYrYXdic0pmc0tvMm5tNEVGbC9ZajdKeGc4aDkvdGFG?=
 =?utf-8?B?NHJSQklBN0ZVZHBMN2RTZW4xN214Q25FQmlHVnRrMkJUU1JWRFV4cUtSZWRk?=
 =?utf-8?B?UUJDS2Q1MEhPdncvK09oK1o5SHhkS09tNno2a2V2KzlJbmJsc1dRNStWbHpZ?=
 =?utf-8?B?cjZhRkZSYnFpeUdSdWU1TjIxT3hmWjRhVjhETXlIclpaR2xpWnRyUGNBQzNO?=
 =?utf-8?B?dnVrTmQxM3ZFVnBnc3pCZGJ1cU1KaHVVOVBCZEtEYzNQVjZGNWhkem5XOUJv?=
 =?utf-8?B?NVNLOU10WmdsZ1NybkRPaENkV3hxTUNBdmJhMnBqQmJSc0t5R1BTZHlWT1RV?=
 =?utf-8?B?TktRd1I1dGFQdHFrN2RPSmJFUFl5OFM5RG9QUXZIeGJoQ05MUU1uZXR0aWdV?=
 =?utf-8?B?QVZJeDhET3dIQ3h0MWwxbDI1WmVXOGxFWGVmei9sUnFHMDdlVmNMQ3M3OWEv?=
 =?utf-8?B?QnRUTjVwaXpoQ3dMUUUycEJMTnNtZ0VTUE1Bem9lNkN3MHlZU1Z4czhtODRo?=
 =?utf-8?B?M3dxRkRmZHVMRmdjdWxnR0NLb2pUNlJVYkI3VFM5SU5va2tSWU1YOG03Vk1D?=
 =?utf-8?B?dWkvMjIwdmpZRDNFOW5FRTNVUHY5WkVvS1QwV0JCOVg3eWV6ZTZIRWx1QnFJ?=
 =?utf-8?B?dUtmMnhnTmIxKzFSWVdDUDMrWjVqMDZELzA3OExkMXAxVDYyN2J4TUt2ZU1a?=
 =?utf-8?B?a1Qzdit6MkdZTEM4OUM1dE5qTFMwMlJvb2NkY3RRdWNibWhjNittN2NLakpV?=
 =?utf-8?B?b1hYQklNVGovQ0NXZmpGZU1sNXZYYVpXdG8vVE1lZHRXS0RORTBOTlAwRjk2?=
 =?utf-8?B?ekRjcXgzclhXR2UzdUlhRG05TjRiNS82RlBOT2RmS3lsSmxub0thT0x5aVBE?=
 =?utf-8?B?dEFENzBmWERKZjFoRW8rQXlESmpHcmI5TWtESm5zczRmdlVWc2FuTVc1MnN6?=
 =?utf-8?B?YXc5YlAwbXlLUEoxaGoxWHhlTUR0Q0ZkV2d5ZUhidmJaRHAweVV3V2p2OGxv?=
 =?utf-8?B?QzZYdjkrdGlWWWtDRlNxcjA2emZ2YmFDRGsxZHd3RFUxZFExME5tS0Q4VXlT?=
 =?utf-8?Q?dGVr1ADs2dlQOwvTDjVJbpSfdkwmtx3z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODlQTWxoQ3dad0c5VGhlTjcwQjlnN3lzSlREd1N5dmZkbUdVc3Rrb2IyK3RB?=
 =?utf-8?B?T1piL0dRcmluQ01yMiswaGVmejduV3NiTTl1QVN1cHhRZi8zdk1TcllIaHl2?=
 =?utf-8?B?REJraE5oWFlVUEpzY1VESHMwZHFtdDRQbVJ0bEloazBmTkM5YjM5U2RJcFQw?=
 =?utf-8?B?MmRUNjkzdiszZy8rZXZ6NXNRL2xnWkxnYTBCalhPNzV5NVd1RHFNM2RZZElC?=
 =?utf-8?B?OFNNcVNiN3BBZ210SVFsMStLUVgzOTlUdXgwUjBaVTdPK1FKV0IyczM0MENL?=
 =?utf-8?B?SGhpQlo3U284NHVuRUU3ZC94TzJKWTJIaEc1Ukl6RWNTazRnVkdzWGo0dDFp?=
 =?utf-8?B?bUd3TjUxQjFLT0Fnbk9QbDhQaUFhYXEvOExEaTJLWmY2NVZSTTFoZjJ5bllh?=
 =?utf-8?B?dWE5cjV1ekIyZy9lK0xYK2VWNnBuRnRlaHhHVXRxVGNRZUN3WENYQUIvNUlz?=
 =?utf-8?B?VWdTMWZrZ0g5SlpZMEdjVUx4enF2WUpkOWdFRjZ0a3NpYlRsbkU4STY2b1VB?=
 =?utf-8?B?R01hUllIZDZOV2U3aFpHQlhkQ1pBY3BSQ01hYzlzVDRJMFYvVk5heGVRTE1h?=
 =?utf-8?B?N3ZoZktVY3UzNGpYV2tPbGRpUGZ6L1BsUDRvKy9YSWtsZ1dOZWIvaHluVzdJ?=
 =?utf-8?B?ZnEzWmFFRER6dnQzYnROcWpGZnZreGFSWDE0a3B2WVQ0QWdKNVJZcHRUb0NH?=
 =?utf-8?B?SFk0K205WjVneU1XMmh4dHdRclF4SzNSeTZOay9hYWN1dEprTW42QVowWHFK?=
 =?utf-8?B?bGZzOHN5dDI1TnFON2V0cmNPU1hFNzJCc0l2Q2tvdEFrcXBmV1F5Zkw0Kys5?=
 =?utf-8?B?QjFHOWxRdUJOaytMMFJKN0hkb1ZWTTErelNrV3cvbU9SRXZ2am1Sc2FsMC93?=
 =?utf-8?B?S1Z5SzZNb3JvQ2tveHp0enJheVduK083b1haVzZzTDB4a2UzU1JXbXFrdWNr?=
 =?utf-8?B?Z1RMRVlXMitPMjZlWUgrSmlKRzhwUVVINk9TSkQ5aE5rLzdJZDRQQ2oyWjBh?=
 =?utf-8?B?LzdvZ0tNRjdOYzM0cjlJYkpqTEthVm9EMStLN2NKQTdYTXp2VnpadVBkVlM4?=
 =?utf-8?B?K2dLdlY2dkV1UENzUUpKLzlWZG51ZXZPQVlRZkd3dmtpOW5scUxFcjhSSEhY?=
 =?utf-8?B?ZW1vTnRMMXNIR1ltUFRHdGZSTGhkZTB2a0ZLV1FuVzhBMEw1Ymc1b09ReVI0?=
 =?utf-8?B?cWhEQ3BmdkFBaXdydmZPRFJSN3I4ZUNlL1Z5dGwrb2NJbG5xdzVUTkRqRjRE?=
 =?utf-8?B?a09qdjQ0czYwRENrcUQzT21lNWdreG5SbS8vY2lsVzgwOWxzL0QyVnhZdVRr?=
 =?utf-8?B?MGpYN296RUJybjhNWW4vQ1hLVW91b2srZ3dqSmV3NzZ3aU96L0pKS0kzR00w?=
 =?utf-8?B?UDA1eGcrdGJpSXRrTkpMTzlBaFZkckd0Mlc5ZmhJamdpZVhBeWtyZjZMK2dm?=
 =?utf-8?B?T0E5UEl5bEJHVktLb3ZUeWlnTWxIbklLQ205VHV0bktqMXJGcFUzTlkzU1pt?=
 =?utf-8?B?eVZQcVdYNmZoN09tZTJJY0ZDQ3B3T2FYNTlISE0vTWZPSWVOVnQ3b09KNE5B?=
 =?utf-8?B?Q1AwSE40dVJuU3VrbENUdWtWWVFNd2VMb3hoQnBVTXBpM29OMVZ3ZFNnOC9j?=
 =?utf-8?B?Q2dnV3V6NHNldFJQM3VIT0s2amhjRDBCRUhRV3ZJamdtT2tjYW5Edkh5ODNB?=
 =?utf-8?B?WElUbSt1SEFFeFNPS1NoOW1HeDNTbUN3dmhLYVRleFZBZlZrelRkVzVxNVNJ?=
 =?utf-8?B?NzM1eEtvS1BzMWVNdzNIbnFZYUsrakM1UFFZOFBzcys4Z3dyMktVTEpjMTND?=
 =?utf-8?B?aFhhUEZ2N1lGVGtaOEFFQ2pKMjZrNjd1L2g1M3VQaG5uSHVoRXpLYTUra0FT?=
 =?utf-8?B?czdKMDlPTUxmWXVwTk0rc3lLTWxTall1Vk80c2VtUWRWOXgrY0wrM2RoNmpw?=
 =?utf-8?B?TTFwRHlNaURXVjFucjYvcExlSktoUThQNTE5MjJIWG1RQkxwZ2dZMmwvdkl0?=
 =?utf-8?B?ZnEzM3VzQ3R0OUxmMGR6NnQzRUFmMEtKaDc3cmRPN2R3Y0l1Z0JnNmZIak1h?=
 =?utf-8?B?eDhzck1TdlN0QWo2ZkRiQ0QyZWE2TDN3MzFTWUJTaWNzeFU2cGpqSVV0YlRz?=
 =?utf-8?B?d0t3YkVBUUtNdTZHZzBUL0VSaWFNSkZBRTFTeFIwbzl6NVpPWmdkSWljQWJV?=
 =?utf-8?Q?nNqaLp2816vl+jpSqDXCNtk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb40f46-e548-4166-01fb-08de084ccf95
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:31:52.7499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPzMKlJeHbYbBZuIoYrI8fLuPz5jPxrl3QGPE4GyXUxIDGq/ZRqTCYahCtX8p2TIH3S7jnE5FvvKGIfJpHRSEGXEOxY18VzVpgrQe+4wpck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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

On Wed, Oct 08, 2025 at 02:18:03PM -0700, Ashutosh Dixit wrote:
>Change test_oa_unit_exclusive_stream to run simultaneously on all OA units
>which have an hwe. Also removed unused code now that all tests are
>converted to use OA units rather than hwe's.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 86 ++++++---------------------------------------
> 1 file changed, 10 insertions(+), 76 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 75142e610d..2d956286d2 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -385,48 +385,6 @@ static struct intel_xe_perf_metric_set *oa_unit_metric_set(struct drm_xe_oa_unit
>
> 	return test_set;
> }
>-
>-static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
>-{
>-	const char *test_set_name = NULL;
>-	struct intel_xe_perf_metric_set *metric_set_iter;
>-	struct intel_xe_perf_metric_set *test_set = NULL;
>-
>-	if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
>-	    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
>-		test_set_name = "TestOa";
>-	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
>-		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
>-		 HAS_OAM(devid))
>-		test_set_name = "MediaSet1";
>-	else
>-		igt_assert(!"reached");
>-
>-	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
>-		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
>-			test_set = metric_set_iter;
>-			break;
>-		}
>-	}
>-
>-	igt_assert(test_set);
>-
>-	/*
>-	 * configuration was loaded in init_sys_info() ->
>-	 * intel_xe_perf_load_perf_configs(), and test_set->perf_oa_metrics_set
>-	 * should point to metric id returned by the config add ioctl. 0 is
>-	 * invalid.
>-	 */
>-	igt_assert_neq_u64(test_set->perf_oa_metrics_set, 0);
>-
>-	igt_debug("engine %d:%d - %s metric set UUID = %s\n",
>-		  hwe->engine_class,
>-		  hwe->engine_instance,
>-		  test_set->symbol_name,
>-		  test_set->hw_config_guid);
>-
>-	return test_set;
>-}
> #define default_test_set oa_unit_metric_set(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG))
>
> static void set_fd_flags(int fd, int flags)
>@@ -4293,8 +4251,8 @@ static void
> test_oa_unit_exclusive_stream(bool exponent)
> {
> 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>+	struct drm_xe_engine_class_instance *hwe;
> 	struct drm_xe_oa_unit *oau;
>-	u8 *poau = (u8 *)&qoa->oa_units[0];
> 	uint64_t properties[] = {
> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -4315,12 +4273,12 @@ test_oa_unit_exclusive_stream(bool exponent)
>
> 	/* for each oa unit, open one random perf stream with sample OA */
> 	for (i = 0; i < qoa->num_oa_units; i++) {
>-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
>+		oau = oa_unit_by_id(drm_fd, i);
>+		hwe = oa_unit_engine(oau);
>
>-		oau = (struct drm_xe_oa_unit *)poau;
>-		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>+		if (!hwe)
> 			continue;
>-		test_set = metric_set(hwe);
>+		test_set = oa_unit_metric_set(oau);
>
> 		igt_debug("opening OA buffer with c:i %d:%d\n",
> 			  hwe->engine_class, hwe->engine_instance);
>@@ -4336,7 +4294,6 @@ test_oa_unit_exclusive_stream(bool exponent)
> 		properties[9] = hwe->engine_instance;
> 		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
> 		igt_assert(perf_fd[i] >= 0);
>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
> 	}
>
> 	/* Xe KMD holds reference to the exec_q's so they shouldn't be really destroyed */
>@@ -4345,15 +4302,15 @@ test_oa_unit_exclusive_stream(bool exponent)
> 			xe_exec_queue_destroy(drm_fd, exec_q[i]);
>
> 	/* for each oa unit make sure no other streams can be opened */
>-	poau = (u8 *)&qoa->oa_units[0];
> 	for (i = 0; i < qoa->num_oa_units; i++) {
>-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
> 		int err;
>
>-		oau = (struct drm_xe_oa_unit *)poau;
>-		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>+		oau = oa_unit_by_id(drm_fd, i);
>+		hwe = oa_unit_engine(oau);
>+
>+		if (!hwe)
> 			continue;
>-		test_set = metric_set(hwe);
>+		test_set = oa_unit_metric_set(oau);
>
> 		igt_debug("try with exp with c:i %d:%d\n",
> 			  hwe->engine_class, hwe->engine_instance);
>@@ -4376,7 +4333,6 @@ test_oa_unit_exclusive_stream(bool exponent)
> 		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
> 		igt_assert_lt(err, 0);
> 		igt_assert(errno == EBUSY || errno == ENODEV);
>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
> 	}
>
> 	for (i = 0; i < qoa->num_oa_units; i++) {
>@@ -4957,28 +4913,6 @@ exit:
> 	oa_sync_free(&osync);
> }
>
>-#define __for_one_hwe_in_each_oa_unit(hwe) \
>-	for (int m = 0; !m || hwe; m++) \
>-		for_each_if(hwe = oa_unit_engine(oa_unit_by_id(drm_fd, m))) \
>-			igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
>-				      hwe->engine_instance)
>-
>-/* Only OAG (not OAM) is currently supported */
>-#define __for_one_hwe_in_oag(hwe) \
>-	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
>-		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
>-			      hwe->engine_instance)
>-
>-#define __for_one_hwe_in_oag_w_arg(hwe, str) \
>-	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
>-		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
>-			      hwe->engine_instance, str)
>-
>-#define __for_one_render_engine(hwe) \
>-	hwe = &xe_find_engine_by_class(drm_fd, DRM_XE_ENGINE_CLASS_RENDER)->instance; \
>-	igt_require_f(hwe, "no render engine\n"); \
>-	igt_dynamic_f("rcs-%d", hwe->engine_instance)
>-
> #define __for_oa_unit_by_type(k) \
> 	if ((oau = oa_unit_by_type(drm_fd, k))) \
> 		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
>-- 
>2.48.1
>
