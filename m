Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10DDE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 10:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD0B10E0DF;
	Tue, 10 Dec 2024 10:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kP95sX6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778F810E0DF
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 10:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733825545; x=1765361545;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QYt8cm9Ch1X6AIQBnJU6A1evi+T+dwOwXQfIShnWFDk=;
 b=kP95sX6RlPAxwXmzFalby2azyeffDPIE3XAqH9ssrWVIMyiinTGhDfgb
 ob+PGpTPiXw717g/fBsMo4bKS5J6ugWpRnKxX5uJ7/+hcWJYvTa3alzNi
 uBWECokkPPyxLu6pf9oci6EiS74Cjh4zkR59/hMcG4kovIKqvsv0OzbOs
 Hpoy0DlzLKYpzFjZN98su2jrM0YJh3oYI2U7naPNnoUZHre+NOPx/Uv0T
 SJzH32ED5x75kvwccovPM9NKew/gtHaA9a9/+LDD6Gdnne7jAFN3961Nr
 BVoY8pD6qCh3rbrceCvfD8SM9E2QyKXcjAg0VaXG0aZilRYs+LopI/Fj5 g==;
X-CSE-ConnectionGUID: fi0urIKkTtWlA8/4NzUqRQ==
X-CSE-MsgGUID: ESAM9Ki8Q3iqlv++WSZowA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37847145"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="37847145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 02:12:24 -0800
X-CSE-ConnectionGUID: Qhjef2zQTPmau21GDycGEw==
X-CSE-MsgGUID: oRnA/n09S+2Ii68jtjpFPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="126259326"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 02:12:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 02:12:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 02:12:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 02:12:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dreq5W0iDbWR1mfFFv+JBYA3XJUb/gRObUEdOTtMsP0miQbnpyb0F2jqO9jJtq0uf23Y2TL2q5O4pguzNkV2xcqconDdBuiIfanKQBL5C1mAUIEdVdpO0TLSRF3S1DjRe5QRYZOXtNm54RpjDlBGEfAhDFxbIjShVZhK2TT4oBBo2E4Y03rvgmWQJHM2TObjyhbIfoE8U9VkZNzpo95T731B1ezmpRdha0RRDT7Mb5zxgl9igwQSJc6vNyhlmZyKtDLxcGQE6UKvvGKpdjPFkECxAkNNpS+K/w2cdKj3j2dCF+vRbbPVzRnp7jkweT01fVkMy5FlzzGfjuY29m71DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4/5E4XdnnwD5OK0/1d7PJgJulrjRGYgon/8z0YrwxM=;
 b=IYWJshcZbUoStOgUQJagGl6Gx760eF3yssSSl+T46zmbTthKs6by1UwhAu9KK32j4Rx/CVCbOYeYVXRAsl0Anbgf5eLEISesqbuWZSrln95thylnW5pB4fON9MSde393Jal7T5Sr9EK86+QyPCc6uO4u0n23r24LrcMj7AMmHGmzB8xOLPdFkllVH11tZDKsbwLIBqmy9sYRglc/sI9uzq3eI2psBw8X6HGwb0bM9vmqa5laVIxznLG7UVPItYcgOnGm1xUbDKuQmlZfv3J8mO9EJEnRJcNUvW/aTxyx6NekYicJmv/Q8UyVQ/UyhpMZFo9RtrTGK3zJzuRTWqrnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by SN7PR11MB6826.namprd11.prod.outlook.com (2603:10b6:806:2a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Tue, 10 Dec
 2024 10:12:13 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 10:12:13 +0000
Date: Tue, 10 Dec 2024 11:11:59 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>, <chris.p.wilson@intel.com>
CC: <krzysztof.karas@intel.com>, <eugene.kobyak@intel.com>
Subject: [PATCH I-G-T v4] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DBBPR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::36) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|SN7PR11MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 955cb836-ef0b-428f-9f67-08dd19031db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTNlVGVwZ1NRWUUzTU82ZWNDMENXcWkxV3RhelN2RnlhTmMxWXpJcXIxdDBT?=
 =?utf-8?B?bkprRDVsendVZzBubnNUbUQyaWpMeUZkQ1lNWjRqdnlEblhwN1M5UlNYbVJB?=
 =?utf-8?B?ZXprOFA3b0VoOXBXSFUrVUtzaWZzNWdSOVpJcHA3MlZiRmNmbWswUE94WnRi?=
 =?utf-8?B?cGcvREZwY1FEY3J6cGpmeEU0ZlMwWVRhbjRwZUhteWRhL2NYd3p1dUZzVjBh?=
 =?utf-8?B?a2w3ZnZHOC9reVovM2NkUXIyei9IZzQzQnNlVEtvNkt5dkFLbXY4UmVBbFdw?=
 =?utf-8?B?dWpDZXIxY1E3T25LQ01hTTRPZ083ZEM4eHBVTG5lMU1jTXRSN29mM1d1MDEr?=
 =?utf-8?B?K3c2dS81UE9CSGt5dGlZRVJwYnM3OFd4eVVCYVoxWWxxZVRGR09ndmZIRXBT?=
 =?utf-8?B?TUd3TEp3T2lwTUtseUV2NFVXUmpYVjBvUG93QkdBbVY3aXV1TWUrM2RWYTJv?=
 =?utf-8?B?cWorUHpoMEI4R1hTZVVLYWpIMXRKME1xS0JST0lzMU92RTBYb2JqaXlWR29X?=
 =?utf-8?B?WWxMSU03aW9LRGZlQ1dyb1hsQURNelhPRkpnT1BnenlyRk5TaktZMEg3aDZC?=
 =?utf-8?B?K0JUY1k0SldNODAzVmUxODBRUHpZRU9JMEV1TkJrREpFVHMrTWtKbFpUZWw1?=
 =?utf-8?B?cUZqZm0ySThYWWNwbWRRblNDbklHWlVEN29FcVA1bzdkSXdHaUI3d1VRZFlP?=
 =?utf-8?B?cHMwWmhvemRzaEpOWE9zWjczSWFYc1JPaVdDeHNpMm9KbUQyei9ONTNKZHM5?=
 =?utf-8?B?NlRBRERNMWxVR3R1WjBUUFRtbnlidVZSd3AxalFpMElvM3BtME5Wci9zaDBM?=
 =?utf-8?B?b0V4N2liL293dHBCVDVpWmtYTVF6aklQYzNTQlpBTXQ3bjQzUDlyUnJSOVh3?=
 =?utf-8?B?Z0poRXIrWDE2M0RWUS8rbVRJY1pNU1JnR1MyNlVJOExUM2NDTmZHaFJrWExk?=
 =?utf-8?B?UFBCNGxJcUgxcGhrTlp1YjZRTVI4SlRFZXR5dEdWcnNpaVZLVFdkMytiWDN4?=
 =?utf-8?B?dUZKNWl5R09TUHV2WjArSDdDbmVhRERFVVhMcHJiWG0zQmJ0KzRhTHRtQmw0?=
 =?utf-8?B?amVCYlVaNEQvVUVtd2I5S1A3RlNTZnF3Z0RTeWhYY3NKSnNRV25lcjVVd0F3?=
 =?utf-8?B?Sk9WYkh1WWZnU1g3QlhEOWFKMWEwVjY1SXVHV2hpYTB0RU1YMFp3MXNzTWNm?=
 =?utf-8?B?SWdyTS9UaXpYNnRwQy9LNXBRK1Yyb3BXcjJYaUx2cy9weWhRWDJhb3ZMdmVY?=
 =?utf-8?B?U2M3T05adlJBeWUvblNvN0piaGpLWCtCeForMWRQM213L1Y0N05ybjN0YlRP?=
 =?utf-8?B?ZDZXazdNeWIrTlUxRmhuRGJzS3d1Nm16c3U4ZkpGM1VPS2FRWXFrZmFHeFJp?=
 =?utf-8?B?NGNiU1hNL1R5UWNWRTBvRXgzWkpEYW1mNXJneGt4ZHdYQUVlMXZEb0Y4WVpP?=
 =?utf-8?B?LzR2c29mblNIM2xkSFlTWEtiSndGUW4vVDh3SHJvZklQdmkrMVRsVytwUHNL?=
 =?utf-8?B?K2Rya1IxSnhhSkxVUFp6aWxDQlp6T1VBQnpjWFRSemNXcTJxczRMUkpHbkd1?=
 =?utf-8?B?NEVrWHBDZFJ6bkY3TVFmYlVFeXdia0ZOZ0VPQW1aQ2tjL0hHNTA1NjNnVEw2?=
 =?utf-8?B?UXVscGtuVlM4VlpiTHpXKytBT3pqY29qZ0xodDF1ZUp5N3ljUDBsREJpWEJQ?=
 =?utf-8?B?aS9yZEFKWUp1YVlGVlVrUDJxaFVMNGxyazU1ai93Ymh1d3hZR2UxcnZZd0hz?=
 =?utf-8?B?bXVGZ2lxMnRNays2a1R0bm9KQjcrSXZTeldFUzhTRVRtYUZlZ3dnOGFxc3Js?=
 =?utf-8?B?aUNKdjRBMVVPbXA0eHNzUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MksrSlRNdzc1ajVzdHVMZEQzMEM0VmdOWTZhaCtHa3NxL0ZydHZKZU5KMWVW?=
 =?utf-8?B?eEFnZ2lteUVHSHdtRm56TTdQN3IrMXJuMVNOM1d5Nm56Q3VkMUNLQ1pVRHRX?=
 =?utf-8?B?ZjExNUplYjRmOXUyQWlLU0pPeDFLbkxJV2xsVGlYTitKR3hDTytuaHVCUm1W?=
 =?utf-8?B?dWtrUmRIKy9nenB1UlFuRklmZTJXSGNIa1BnK3NRb3ZmbGp2ankveGdIWkNM?=
 =?utf-8?B?VWEyNWt4VTNVajM0bEJ0aWJ0TzJjZjRXeldjSk9Cd3FsUTYvWXlSaWc3Vlls?=
 =?utf-8?B?SFg4dm8vaG1vcjV4Mis5NjE1bzNMYmU5TjJ5ZXdJTThxam8xZmFjOCtaUFcw?=
 =?utf-8?B?Q0NHRFovZ1hHdDMybFZxZGozZ25Cd3NONzFrdWI1VHA5VTQxOXlQemppUnh0?=
 =?utf-8?B?OERhYlR3RzlNUktVeU1ldmtTSEFpWWhTaUFmS0dCRUkxY0xBSmVmazg5S3Jv?=
 =?utf-8?B?MkFPYVljbHd4VGlmaDBSTFM5ZXdnYy95Y1RyQjFHL2xlVUFmREdVdGphZ21E?=
 =?utf-8?B?UFVlVnk0Qi8wSzlGcEp6S25uUURYMzhndlUxMDNYTTZQRmhGdHhmZ0FwWmRa?=
 =?utf-8?B?TmVNekpjN05oeTFVOHBQUWxiTEozcGVlalRxQXk2cXVVdzJrSytGeVJ0N0JH?=
 =?utf-8?B?eVlGaTRxaU1TTVQ2eGw5aUsxd255QzZLUGNkZGVFNjNKTnpDVi82ekNWajFB?=
 =?utf-8?B?S3ZESXF1Z2ZrUy9KMWozNXoyV0Fjb3RFTEYxMkhjSnNYc21RNnhjRmIwNlNX?=
 =?utf-8?B?QXhFdXZ0dmtCMG5xSUNhNFB5elVMb1RXOUszVUV3QVJPYmtENW1wMjEzejBX?=
 =?utf-8?B?ZzRDOU9hT2oyb1hFTVBoZldoWi94K0tGWXdRQ0wrRm42Mi9KTGozc1ptdDQ0?=
 =?utf-8?B?bUEvREtyUFpPUUd5cytrZ2d4ZC95akNZOHhwQllmb3JhdlY0ekVlS1BqNjhh?=
 =?utf-8?B?SWgwN3N3ZitzU1VJQmc1OFFmRDFzV1NISlNTbUExQzFoZ0dhQXN0SHZmUGh4?=
 =?utf-8?B?NTM5QTYzS25xdk1jK25xd3pBZWViakFQbWFTVFIwQ1dnRDdJclAxTFlwUUNu?=
 =?utf-8?B?NUpnY1kvZGM0czdjM2NMYmVlQnJLczNlRXlWNjUzSVQzdEFSaW42WWZoMEhJ?=
 =?utf-8?B?ejFYL20zWmhQLzVUQWxFRVpaSll5TzRJOEExWDhsSmpwY1VkcTQzcTBKbC9l?=
 =?utf-8?B?ZHBCYlJ5MEF1T3NHSG01Zy9JK0ZBZmxKTTZ6aVc3djAvQlErVlZ1cndLdmlB?=
 =?utf-8?B?a2lNcFZqeGlWWnQ3MkpWSnoxVUxGWlFtOE9la0VxVkVYQzlHemhOMkFsWDRX?=
 =?utf-8?B?ODgxWkd2T2dRdkdRc1V5MDNsdHdQL255OWQ4WG9jbm1rVzZsV2h6akh5Y0ZY?=
 =?utf-8?B?eTFhNG1qYzNxZ3BVbW1LK1VmcmJocFhWc1lzLzJzTmszcG11TkV3ZWhBVEVE?=
 =?utf-8?B?RVliVHkzNlpKRlBEMktoZGo3TTMvTllCa0NCc3JkRFJIWEtqcThUWEI1dVRn?=
 =?utf-8?B?MWdQTFhWZkQ0dythT0pGQWlYWisxc2E4YTd4WmRBVzF2Zk9BWDl1ZFZ2YTND?=
 =?utf-8?B?UlRtd2Y3eHEySGNMcStrdHEra0M0MDZIYmpNVnA2VU45OVd2KytWaUZ0UW1a?=
 =?utf-8?B?SXNQSThncWk1UHdWb0N4N1FBOXpqZjJkZk9aZkZaTFlPRnI3MzF6dGE3RmtR?=
 =?utf-8?B?SE4yYkxMUVFIU2Zmc3pJSDJCN2Y2T3dUVU9jT1MrWEhLVUR5dm9jMUtGQ2g2?=
 =?utf-8?B?Q3lxeVBjK3Y3SnFpTEVpZDNIbXJsekYxRWJkQyswZHRUaDNVR3JTNWhwUmlY?=
 =?utf-8?B?bFBKajZDdDA3WGNSbC9TMktwWS8yTDFnWjFUUWRvZ2JYKzFlOUlNeXpzSGJE?=
 =?utf-8?B?ZGErSXRJZjY2YmtwcTZCRjNiaEoyeWFJMm5RUFE3NnI2UG40TEozR0k5cUQ0?=
 =?utf-8?B?S2JhUVhqTTlYT1lwSGxjTSs0S2ZoU3k3YzNXd2R1MG1qU3dtWEMzSG9WSkdI?=
 =?utf-8?B?MWY5OXNvZWVIR2VPb2JkTWx1bEdPam9DankyRzRhbTA3TG9qS1E2ekI2R05U?=
 =?utf-8?B?VmZuR3VJYU8xcXRSYkxDcElSVmwyemZXQURjZ3F6eUx5eTBCblZJb1JVTERt?=
 =?utf-8?B?S0tZN2FXOS9RN0hWMndLOTRnNjE0R0R6bENtWkFRUm5QK0J3N3JZbEVHa1Zu?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 955cb836-ef0b-428f-9f67-08dd19031db2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 10:12:13.1438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHc6lR18b+F/S/Ba8F09w1c7gt2AA642MpUfFlg6qRASLMasSeTQNfGEcRyCYFnWFBknu57TdzRFRrwDReCtii/qxCtLsPsiZ5MIrRtor0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6826
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

Apply workaround when running background spins in hangman test.
Disable rcs0 and ccs0 engine background spin.

v4: Change bcs to rcs and disable them always in the background

Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
---
 tests/intel/i915_hangman.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index a556eec53..7e973ab49 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
 #define ERR_FENCE_END  3
 #define ERR_FENCE_STAT 4
 
+static bool is_rcs_ccs(const struct intel_execution_engine2 *e)
+{
+	return e->class == I915_ENGINE_CLASS_COMPUTE ||
+	       e->class == I915_ENGINE_CLASS_RENDER;
+}
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
@@ -388,6 +394,10 @@ test_engine_hang(const intel_ctx_t *ctx,
 	 */
 	num_ctx = 0;
 	for_each_ctx_engine(device, ctx, other) {
+		/* Wa_14014494547:DG2 */
+		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other))
+			continue;
+
 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
 		context_unban(device, local_ctx[num_ctx]->id);
 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
-- 
2.47.1

