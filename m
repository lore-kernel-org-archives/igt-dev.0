Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3DDC35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 07:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED7710E389;
	Tue, 25 Mar 2025 07:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8tXTqAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CA10E38C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742888334; x=1774424334;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SVxLW6d2+9V2xHxLdY+UwcSXxiR5GAx4UraXINj9Iwc=;
 b=d8tXTqAqA5Z1wcWVNv1YLG7pqidcTqeXFG+xPatMWJsVa5DMYj987WNv
 3iYy2Bv6Efg3l8+nFtR4IplRZuHCkECbk3jg9m4HE35rv51Wn9a+KqQj5
 BXhu3/VbHnBddTIwhIGicgwnTn05Ug2JzoR30U/dBCUsFmWtLn96QWlSc
 UYAuzlzirvUKimyB3kHRiT+EAdGpzGTq5aSsX8QwzDwMV80nwveu/xoAv
 bZ8+XcslZIV2eBMbhQT8YlZBFw1kfvWR0Cfjfsgr2e/mvqJio3c0MQiEn
 IY8teLm1sQgf9/E6WK8+pF544nh84qtnCkoBiWXtlvc3RDQtZuU0wJhZx w==;
X-CSE-ConnectionGUID: 6PdP6iKbTuqCOYDtgvv4Rw==
X-CSE-MsgGUID: ZBpZVv5XQRSk4m748vqHvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="31721955"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="31721955"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 00:38:52 -0700
X-CSE-ConnectionGUID: b6KJ7lcNTZyURC/1NbsrmA==
X-CSE-MsgGUID: Of7v1jyHR/GmMwozyreIzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124095215"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 00:38:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 00:38:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 00:38:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 00:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyKkyXaDPPTAsBDfrmCJHQIMoJdQ34x5hjn1KUVpEXjYkPS5URmwh6PHShWN+OIg/SQvgw1AXHwyI/SnTwG+DViVpUgwD9kT0xaVDbaeVFX9+QXr/hF0nFWRBD+C25ReuCBx6f7DfUFSGkJVZsTIcnIHqh7ojWWqduJRpAb1TMr2vfFSOuofDTfzNJLVsB1Bvop73H/6SSxH5JkHkZbbp+BEPWT7KZue9z1nsKcwlOrYjIJn5lPodjocT9ZK7Wq5MPeP7VSk0MJ1EvhDLiQEmGsLJxQpAieTfz2l+fKozmJVFGbyn+p9n/GnXPaNfTLO4S/Bz8lljuKIsuBlEAAU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+yc9HJgfoHn81G/Aawzuze6azEmDBLHHDyz8KJa400=;
 b=qhGZFdD0tRyFGZSbtBtwIjgiVziPno43+fvArE3xD6VHDmFPe/HhjtwIEequKChioOfYjFTOENEZVX1F0yNDatbSn7jBRT8ke/BxhKgHMTCyrtHEg2BWJ6LJg9NXpbuzdFXXrqqpgQW2gRw1R1KkmRloB4i7iTdzzuTkB+spy1GpN5F6dmAEajst1+ozSugXTwV8qaOl7xbm3bBQ4G+J6+BIAln+byIfREsrQALyAx8pYGzhDQwTxWQSl+/WiZYWmjZIdq9zS+1EynLVDRqtVj+2nZiJLPdR0k3m25AiANaOpnYSS6K0eYWJjWI56pMmqOpPbvvDZRtPMY2oCaWXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 07:38:45 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 07:38:45 +0000
Message-ID: <a9b7125c-2f9a-494e-a1ae-eaee7ffa472f@intel.com>
Date: Tue, 25 Mar 2025 13:08:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_addfb_basic: Split tests into subtest
 groups
To: Karthik B S <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <pranay.samala@intel.com>
References: <20250312103008.613087-1-karthik.b.s@intel.com>
 <20250312204328.mvo7qdvryx77vp72@kamilkon-desk.igk.intel.com>
 <17c91321-4885-4649-a8dc-4438b782ae26@intel.com>
 <20250320133006.doxlplrllaxld7f3@kamilkon-desk.igk.intel.com>
 <56606e53-9eac-437b-afdf-4d6958f8d896@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <56606e53-9eac-437b-afdf-4d6958f8d896@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA2PR11MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 0020d90f-527c-4644-f8d5-08dd6b701277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTNCaW4zOERsd2dZQkQ1UjhSSGVFWUpzRkZwRDNwTDVTYURJUlRMb3JjQUww?=
 =?utf-8?B?Mjg2ZmhZU1RvRFFlSkQ2WGZZOW1Xei84Sk9ZYVZ4dzJTL0ZYMXJ1Zm9pcHdw?=
 =?utf-8?B?R29jUEFiU2haSjJNOVBiMHFVaFExeDZ5TlFyVFowcGtKZ2lwd2ZTWnRWWms4?=
 =?utf-8?B?dStVMm9pQ0JaOFRWL2xXeXFrdUNBLzlWaW14cVVZb29NelcvVUtoYU1HNTFT?=
 =?utf-8?B?L08ybXNRZ0l5dmdPZWdxcGNyZjRSNFU5N2ZIVVZVSVg1VC96T2pMak5pN0Q3?=
 =?utf-8?B?VCtlZm1lQ29FTVBLVEhpaWFnMW50TGhJb2VoZTQ5azhCVGtPYnJxOHRsa3o1?=
 =?utf-8?B?bG5RUmNuT1l2cjN4ZzF1ci9GcGFEcnl3Mm56SmhXOGlRb1hZOVhWU3lwczZ3?=
 =?utf-8?B?T3dkeVFBTlBhRE5rVmdwR0xtaTN1RWMyNmNOalVxUDM2QnlLeFozREZ2czEv?=
 =?utf-8?B?OFI0eXB4cXFQWVFUK2RyWm1wMFNWMzF3eXlmUFdvaVFsV1NOYXhTbTIrWWlB?=
 =?utf-8?B?S1RwSld0UnM1MURMM3IvdndTVTBEdGpua1ZVeHdEUDhnbmE4dGFJM1VlRm55?=
 =?utf-8?B?SWdYZWdEK01WRFlFY2hiWkovUldkSmVFN3pFQ0tKRVh4azNnY215YWlxU2NM?=
 =?utf-8?B?cTA5cThCTFhkNlBneGVpb3p5M0M3cThBMFZxcVRvRFlTNEFlU09TSFNvVTJx?=
 =?utf-8?B?RG82TFB6RU1xdjAydmpzWjErM2trSk4xTSsvSmNMU3ZEVWd3K0tYYVl0VElH?=
 =?utf-8?B?YXNlYy80VXRTcTRGN0tmMzdZbnB4SVBoR1dQSTlSVE04ZCtQeitLQUs4Sm9x?=
 =?utf-8?B?Y2pNdWhLaWkwSm1UUWtvRW5GRy9QQm16bHNrSk44SzViYXhvM0o4cjJhd2Jl?=
 =?utf-8?B?Q2gvV3R1YkZocndaa29YZEdxNE1WN1lQQUlxR1BDVTFtOW1taG9OeDU1WWpj?=
 =?utf-8?B?cjl4ZEFXcVZSRm9MOU5VNUl0YjdsYWZ1TDBYRG1IRWJGeE5rRHc0MmRaaTla?=
 =?utf-8?B?MXhJMHFXUUkrR0tPQjBHVGFQM05NMlpsaFBwcHU3dExqN0xkdllpN2x2RVRl?=
 =?utf-8?B?VFM0UFNPNTNWRkplWmY3WmYvUXEwQk9mbHVUWHpwTXNNOEE0Tms5YnpJOUxp?=
 =?utf-8?B?dE5nN1pPZFpTTHhmeTRvaGJmelB6SDdnNHZSTlBhaW1USGVKMEVJUCtjUTRw?=
 =?utf-8?B?N2FiOTI2emd3TVJFZk4rL2xXd3M2M2R0TEd0b1BQRHVidERGdVBxaUVybXhJ?=
 =?utf-8?B?aTNzY0laaGwvbGlTa3gzQmFxM0FuTXRwWExUMFFOdk5hZ0RXdG5GaFNxbG11?=
 =?utf-8?B?TGRWcDFuWkRtMkZZcUZ2eXE1VFZEU1c3ZmhPTmlnalFqbkFUTXZ3RzNXN05h?=
 =?utf-8?B?N2VDaVgveEFDVjZEVWJiR0NPT0NreGNyV2FyMTd2SUUvOXYvT21GNC9UNC9B?=
 =?utf-8?B?Y2JmY1paeTNEanU3M2xMOFlzQ0lTMnZlc2FHM3dxRWRTTnFXN3hjMTRrL2VL?=
 =?utf-8?B?TGNCV2poMTdWL2FKQTBiQ2s1U0ZiL2swSUtUSGtDQXFNNTB3U01uMjhvYm5X?=
 =?utf-8?B?NWZob1I1RW1mMUpEY0xZeVZKdkVLUDJ3d1RJQTNOc3I5V2tWbmNjeW9CdEV6?=
 =?utf-8?B?RDVCUTdJWGkvblgxV0xXZFQvZXVRaDFKbnBNcDMxN2dodXJQSXFJUC9sZkx4?=
 =?utf-8?B?eitmdnJGVnpFTjBWQU5tZW9ROFFJaC91dEJNbjdPNWhveHhxT08yT2w3eHMv?=
 =?utf-8?B?U3FObTBzN3ZveWE3OG9wRXd6NW5UaWNvV2Urbm94Z0tFTURzeUR2QklsWk9X?=
 =?utf-8?B?V0RpQmZ5c1U3NDhCWnpSMGRITmFFK2N2cW1Xdlo1SXdwTWlCcWZUaGFGNnk5?=
 =?utf-8?Q?O6A0fgnAL2uGu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0JzVGNQTDhiQjRXOGlKWitodE1aRVNRTkVHY2lNSzdwWjFyNXhRRWNwdkVU?=
 =?utf-8?B?YTd0WTh6b01jbHA4UEpWZ3dpR2Z3c1pIVWw3NmZRTXVSR3NrS0lpTlNjZzZL?=
 =?utf-8?B?YklHdmpHRFdGRVh0MnNabjNENHkzMXl0T01iMVVnVDZmb1kwWEVIaGdsMUUy?=
 =?utf-8?B?RGdyU3lOTVhLS0h0YmJFS0lqV295NWpHQXlVL0J4QWpxL0VTVHRoQ3VwRnFR?=
 =?utf-8?B?dDFKVmcrNUJqNlJ2REZqcHpuN0VFY201NURCUnVsWVhXUG5ZN0JaU3QrS2VE?=
 =?utf-8?B?UytDY3lERjhSMHFjMGdyYlJqek9ZSkxCRVBWT2FLRUdFRHJZVzQrT0VQY3l0?=
 =?utf-8?B?b3pBdWNFaDZTK2F6L01SVkVnV21kRVVVNmdmd0hVUjJaMmtFWlRJRzJvVHVw?=
 =?utf-8?B?VnlOZ0c3ekhIVHF2dkhYZElVV2s5Vngvdkh6T0ZKWXFkVFZTNDVGcjFwaEtu?=
 =?utf-8?B?RXhwUnA5WU15aGFFcGNmVmVKQ1ZKdy9RVUFyZlc5Nm9HYVBSQm96VGFRUFha?=
 =?utf-8?B?UXMydDFlVVcrL1ZLazAyTzhMOTRmN1ZEbXhmcjRLTy8rbURUYjlHKzVMZ3cv?=
 =?utf-8?B?M0c5cG5VMnVCOXIrelhPSEVTa2NXUnhhT2tFblRNMmdQSUIvelJ4ZEtUV2pN?=
 =?utf-8?B?YlhKY2dQWGNzaUljTjRKYkduMm96UVFRTEdGSXBPMGQ3T3NWMGY2WWM2Zml6?=
 =?utf-8?B?ZTFHcmdPTnc2bVZxNkhyR0k0OGVxbElqeDl5Nlp2VUljMW5PMWxML1FPZFhw?=
 =?utf-8?B?M1d4QlJ2eGRHaEZFNXp6MWJEMU9MVDNUSFVTeDBVNGtPdTMyOGxHcVJCMldq?=
 =?utf-8?B?Nzc4WldNbitiQWpFcVVPa21JNkVOTFA0MWtYN0hmMEpvdjJVVXp2Rk5UenBL?=
 =?utf-8?B?OEU3ZTFQNTYzR2R0bDl3WWxpdmN0ZlcrVnJUSWNDY0c4SE5nNGxibXRpRWZR?=
 =?utf-8?B?dENCZ2dlWWJxUlNYa0Z6ckdWVGdlTVI4aWZxWUhBdXZ3TUpxSWpwTXNOV2V5?=
 =?utf-8?B?dzQ1a0pydDQ4dXN3RTY4QkNnVzRRekxsUVRpNFIyN3dsbkhQVy9CMGNRMWFa?=
 =?utf-8?B?KzYvWlBweVE1bmcyQUZGM1dKYThaWkh6QWdwSy84ZXQ3bWF4RU4ycUVoQko5?=
 =?utf-8?B?djh3RWtiNmNOZGlOK0pvb2FXWVNtZHBHWkFXV1dEWEJtam55TVlMaHdXenpU?=
 =?utf-8?B?S01XbmxTd0R1QlRRaldydmMwY1diSXZaL1JiclRKTnAvRVpCdk5qeklPbVpB?=
 =?utf-8?B?SzNZUE9ObkdjMjlxbDRLSlVqb1FFQmFaeGtlV1JzVXdWdmZnSVBHWFBCUVE1?=
 =?utf-8?B?L01ud0NweXBMTUxqUTY1bUFQUFE3bnVrZXQ5RGtVUWlpcDRGem0rWDVXU3Zz?=
 =?utf-8?B?OEc4blFrdkFIc1oyZ091MGZsQjBmOXpzclpOeWdqSktURmZ6RDNyeDRjSFN1?=
 =?utf-8?B?Y1RaMm5BRGRJbzhJbmhPcjBuT2xFdk1qdXJVSEIvMldxQ0t3WFNsemdPSThO?=
 =?utf-8?B?ZVFRYnpTK2UxbytUMjJlN0FpWlpjYWNpaklCREpvb3NYaFRpTXdZeUNrdG1N?=
 =?utf-8?B?bjFRY3p4d3lJZlBkOThWWllNWU1MMmw5QkZsYmt2KytWR0NSMms5ckNmUG1l?=
 =?utf-8?B?WGhyc0M4Z1k3ZlBYa296TGNOWDd6TStiSzlTL0tnQjZvb0VxWFBtSk1hTWtI?=
 =?utf-8?B?b1ZvVU9BL3k3Z0ZONlh3SU5yb1drREtrWVJHV2M0L0Y2VDZMM1V0YUtxZ2pj?=
 =?utf-8?B?ZTJsOGdwNHNrMHV3WDBIR2JEWDVrSVUvTTJSeFdxZVVXRit5TGhxU0JBc1lz?=
 =?utf-8?B?aFJzRG5YeVJzcXNsWTFNTXBrMkJNNURYR2tNUkVZa1ZUc0R0Z2tLTmRDSUlS?=
 =?utf-8?B?SGs2d05hV3Z5OVlkelF6S3dReThHM0JSNTJqRUdHL0FQQ1pnaFhkUWhoSTkw?=
 =?utf-8?B?WVJ3QnFMN3UwZHhXak1OSkdRMVBpNjVtUGk4UngvOHlKbjM2ZEw4cldHcVF3?=
 =?utf-8?B?RUtaM1dJNHp2TkxnNzFNUEhpc2JPcDAvcytobldZVFpFTjhLeVpwaEZ1dkZB?=
 =?utf-8?B?dkpkdWJYMk9wTGJIRzFNc0JqVlBvREQ2NzA1dWRNQzlkaGJLRXFpN3Nud3B5?=
 =?utf-8?B?a0dpNUY2UWpqWlc0MmlzTFRUcFdtWmIzMU9FQjNDN2pqdVMrY2J5VkRhN0Nv?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0020d90f-527c-4644-f8d5-08dd6b701277
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 07:38:45.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB6Cj7tFS6Y5iQKl/ttKJLBWKpkCbfWGoZRqm3kom3YM1ujx+Vd/J7pAjgitE2bb42bh1XesaaUii7q5ApXH/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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

Hi Karthik,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-03-2025 07:39 pm, Karthik B S wrote:
> Hi Kamil,
>
> On 3/20/2025 7:00 PM, Kamil Konieczny wrote:
>> Hi Karthik,
>> On 2025-03-14 at 15:13:57 +0530, Karthik B S wrote:
>>> Hi Kamil,
>>>
>>> On 3/13/2025 2:13 AM, Kamil Konieczny wrote:
>>>> Hi Karthik,
>>>> On 2025-03-12 at 16:00:08 +0530, Karthik B S wrote:
>>>>> Multiple subtest groups exist in kms_addfb_basic with individual
>>>>> igt_fixutre calls. Split these using igt_subtest_group so that any
>>>>> failure in the fixture of one of the individual subtest groups don't
>>>>> affect the results of subtests in other groups.
>>>>>
>>>>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>>>>> ---
>>>>>    tests/kms_addfb_basic.c | 15 ++++++++++-----
>>>>>    1 file changed, 10 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
>>>>> index e5ff9ea32..268e4e0e4 100644
>>>>> --- a/tests/kms_addfb_basic.c
>>>>> +++ b/tests/kms_addfb_basic.c
>>>>> @@ -989,15 +989,20 @@ igt_main
>>>>>            igt_require(has_addfb2_iface(fd));
>>>>>        }
>>>>> -    invalid_tests(fd);
>>>>> +    igt_subtest_group
>>>>> +        invalid_tests(fd);
>>>>> -    pitch_tests(fd);
>>>>> +    igt_subtest_group
>>>>> +        pitch_tests(fd);
>>>>> -    prop_tests(fd);
>>>>> +    igt_subtest_group
>>>>> +        prop_tests(fd);
>>>>> -    master_tests(fd);
>>>>> +    igt_subtest_group
>>>>> +        master_tests(fd);
>>>>> -    tiling_tests(fd);
>>>>> +    igt_subtest_group
>>>>> +        tiling_tests(fd);
>>>> I looked into those tests and imho this needs a major refactor,
>>>> for example there should not be any igt_assert() in a fixture.
>>>> Generally igt tests works ok for one fixture in begin, last one
>>>> at igt_main() end. When used in-between it becomes more
>>>> complicated to handle cleanup.
>>> Thank you for the review.
>>>
>>> I tried out by inducing an error using an igt_assert(0) within the
>>> igt_fixture of a subtest group and verified that the this change 
>>> handles the
>>> issue by not failing the subtests in other subtest groups. As agreed
>>> offline, will use this as a quick fix to handle failures in the current
>>> design and for the long run will check if there is a way these fb
>>> tests(kms_addfb_basic, kms_getfb) can be redesigned to be more robust.
>>>
>>> Thanks,
>>> Karthik.B.S
>> Yes, after a second reading this could be a first step
>> followed by refactoring later, so as this could improve
>> testing a little this is
>>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Thank you for the rb. Will merge this and then see how overall test 
> can be redesigned for the long run.
>
> Thanks,
> Karthik.B.S
>>
>>>> Regards,
>>>> Kamil
>>>>
>>>>>        igt_subtest_group {
>>>>>            igt_fixture
>>>>> -- 
>>>>> 2.43.0
>>>>>

