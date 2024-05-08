Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0771BC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 18:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3FC10EB2D;
	Wed,  8 May 2024 18:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hU51fCNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B3E10EB2D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715194087; x=1746730087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UoXY2apRpsepjzk4bIBZZvQueVeqwIeO9lNpXaphkOg=;
 b=hU51fCNWrVgtqlnv+V802vm2CT71Kgf48JQDsf2KLgIaJsiRugjYZnjn
 xhNnuN5WgnR913bu9BQpRXaPpWH2uNmaEr6lRpphyXN7S90evj2SiSDus
 wyxM0Pp5RSxx5i8hum3HdcNyMVYn6LovaGlEp2G/erv3UPyG7klLtD38C
 z2v26ds5dLeXDJ96+cKOLc3x9I9IFR2K5v2aU+G6h/ufWnPvPmb9NiPEO
 q8+iFhsPkeIgJDp3foOpK7lp2I7YNQze7IMsffpdotusqBQEj6Qb9mDQO
 Zu/i7tM+RBbWQeS+EGzQ6wGnMoY1Leu9cNhuW+eldz7BAxrwHJMA1aeMe Q==;
X-CSE-ConnectionGUID: 5lUnse3MQw6+kkBW+GBvfw==
X-CSE-MsgGUID: 8MmPAG8sQF+j67q7kpMIQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21748974"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21748974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 11:48:05 -0700
X-CSE-ConnectionGUID: jROrXBgCSfe81VoHVhu3Ig==
X-CSE-MsgGUID: 0QDZWmh/TH+KNAjTMb1FVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29066230"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 11:48:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:48:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 11:48:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 11:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lV/UtFE6yP+t+f0GcJPZMg+xvhLod86piVXhHiBYWxidF3FmUKzRgTIRaOA36WUL19NGVXHK44ciTlOuoo2EvyLpe55xgaDKuOWNU/WIYO8bDYeXzUOfwdjbFXS/W8RgcBmsTUnngEbMrr0lXMuAwKUSXYv+5gabh6XKMBeLWFNK2JjN/A4fn5VXmw+rT4xbWDg/3g0NbV8PuDGBvEqn21rIwyBFJJzWR+9rfyHLOalPt9/BquCtymaIw3wDqDU6Sfn4BWgBbK9FYWBKAIvPfIHbZBr6mS8pGcOFTDWrC8ZgkWHKAvW02cAGyHoVEc6d3vcbs5jhFIeglh4Ajx3dyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+WpERW5CgSEV0Sn2pP2Z0a+sbCBnVAp5wqpaX7/IbA=;
 b=UbNHxdbDHA4lKIu3R7sC09uKH12X20hiZcfLt4ulC8AUG45YvO36fDlQ54dZiHec+qmpSfsXVZHLyTqOaQl70buWPWu33mVu2BGpnZgpjhhwNUR8kTNlQuZDffDtSBVb45JEJIBdDtJ4vzko0ro62qkUq9H7pVdemOgeJWENbQUwCuFsLr/Qzy+a81AgJGYPHHkpMe7fVOWLG3I2vFEi2KAFj4jHQXJLaTnlA6pEvuHTIN5SOoju9gdcK6aaMknyS+qGhTqvVd2zs9Kq0a0oDaKNz+ovCIFBkXvmhsn3BjSiCpuhOtkrNAu2DfVStUqk41tAT9vQfXV0aQCG+xWLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 18:48:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 18:48:02 +0000
Date: Wed, 8 May 2024 11:48:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 10/13] lib/igt_drm_clients: Record drm-cycles
Message-ID: <ZjvI4B2NCeZOnPlf@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee6b095-9f2e-470a-de38-08dc6f8f637c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmM3UlcycnkrNno4dkVrMGlmNW9RdXJGakxydzl0Mmd4d2Q3SE1VZWs0aGNq?=
 =?utf-8?B?Rmsxb21UdjlNcWFyVUVlWWNEK2ZKbUQ2WG9ORlpwZm53VWZVZlNsMzd5Vmo5?=
 =?utf-8?B?amx1L29PZ2FZYlE3VGpYV1VzWXhtZGpwUVhhMHg4M2t6UldQSi9IaUI0T0pq?=
 =?utf-8?B?ODFhbmZtQ3VRMktiSiswNjlmelNxUndKbUg2eWdmYTY0WHZLU3hBY1VzbExP?=
 =?utf-8?B?YVZ0ZHBHTHJwQ2syM0N0UEVzdTkxQm0vK2tiREhIU0ZtVm1MQjZOc1VQaUNW?=
 =?utf-8?B?OENVVkpRQnZCL2krMGs0U001cUpmOGhmSjRoK3F1bWNBeDlUUWw4N3BRUkx2?=
 =?utf-8?B?VGdUQWg5cDJRS1JRd1ZSZXE1dlp6VmRFeURFQ1dkcVFkTEJVaURpY0U0UENN?=
 =?utf-8?B?WW9xY3IwS1lJWEFPc2JHcWZRZ0xuanM2MC9HM0JvYnd0RytoTk5MZmJUNHVr?=
 =?utf-8?B?Y01hYnkvWTc2V0xHbVVOclYrVk1QaW00MHQ1SytNQ1QzSDJOelY4ZVFFTE4x?=
 =?utf-8?B?OVVHMDM2NDJRbEdQd3RaZmZIbW5JRHk5YURyd0ViRU40MDR3UlAvalc0TjJo?=
 =?utf-8?B?VWJOb3ZyV1JHeTRxTms3STBxYnlhUTBiMWNxRnhJSkNlNUw2ZGVOVVdTMTBl?=
 =?utf-8?B?NUtMcEY3bTdwMms2WVl2SmFSSVphVTdDU2ZMTHlZMmpweXNMMnVubjBDVXRZ?=
 =?utf-8?B?OVhUaW9EcEp3T0tHMlhBVVJkZGhJWWtIZlF3MnVwLzZIcHphN3ZOZlRZVmMz?=
 =?utf-8?B?SXFQVnBQdE1DYjYveFI5UStSQW8vclQvaG1HM0Z4Ky9FRmt0dzVUYVBZaWM1?=
 =?utf-8?B?TmVsa2kzelFBRnF1aS9kTkd0eU14Sm5IVHRRbmpPd2RkbWIzV0dGSlVJSlpV?=
 =?utf-8?B?YmFQU0gzRXZlTVZkUDZoKzUzM0g5cVlTY3o3azU3ckU3MWlKV1JxZ0tJYUY4?=
 =?utf-8?B?Um9sYWJRWlpPWWxmM0ZDajVVQnlVSzNPUTMveEZmRW55S3NuM2oxK0psZVZm?=
 =?utf-8?B?Q2wyZGdReUpSLzZ3RDlxN3k3N3FCYzcrNmltbWFkelRRa3VsdjNCS0lyakx4?=
 =?utf-8?B?ZHJnSU05WGNXR2MyOG4vaEhWK2QveFNYWkFLb3k0Q1p0ZWpPVGJ1akJDQWs0?=
 =?utf-8?B?SGJXdnJ3WUREMnpZOWNCNkFPc3d6QklJMVg2ejVMTTF2bnBXQXlCY1J2NlRu?=
 =?utf-8?B?dHNZN3kzRlZvU0V2SnJkeEU3cjNIVjRLT2tETS9BSXo3bG8rMi9tSGo0RW1V?=
 =?utf-8?B?Q0tTUitBY1hxWHcrNDVBR1ArNmZVTnhwK1pwNHJncXdyT3NrQUtFN0R3TXps?=
 =?utf-8?B?MjhObis0b3UxUWxYOUNmeEhyYlNkdUZyNnpEd084K1BMU2hVMzA0NjFOVFd3?=
 =?utf-8?B?THFRUmM4Ti84bTh5dE1EaVdlUEdWNHlvSFBVcHd0by90OXlqM3IrYTBMeGh3?=
 =?utf-8?B?bkYxbDVYTjZhaUdBZEM5bURWL01nUlNhWlpqRlpxUUc2dnJscHJJZFpJMnoy?=
 =?utf-8?B?R1JQd3Rndk8zTWJTVUxhNFBnbmZPczVvN0JUKzFvdlY5SXBPcjA3TUZSMk1n?=
 =?utf-8?B?RVpwK0xxcjF2dFdweVVwS0kxVm5TVGlIRGRTYzVmNXRBMm4vN2tLcDI5aXRC?=
 =?utf-8?B?RUZuOEhrS3ZyRXhuVHgyazhITGV5dzc4MmlFTHBZMkVtUTZVUFFLd2YrQkFv?=
 =?utf-8?B?UTFzSENkeDhFNnVTb1p4YlhqV210SnhtNmt4RE1oaWcxTEJKZzZFZTNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnRtKzVMcCtvT3F3OEM1dlJDeFVmNnJ1QkwxQVRNQ0t6a21hUE9ycHkrYkpy?=
 =?utf-8?B?dVRXM0hxTDljVDZ3TGEzb2VOZXlSMFdQNEpoRG9DR1FDQTFVT1ZSdjBJbWF0?=
 =?utf-8?B?T3Q4eXhBaHRlMDQzTnQyVWY5RzhWR0l0ZEdxQy9UZjJWODVzS2c1MlFJZHZV?=
 =?utf-8?B?d0Z6TkExQjZIODJtWGFJYlpEbGt2Ymx0QmVYY3BxUzczVWpVcWQ5TlFrazIy?=
 =?utf-8?B?Z3hyd2xyc2Qxd2lFcjNsdGM4dzZqT2J0eHNUZnhvcW90SXRzcHlvSWNIUmN4?=
 =?utf-8?B?a2RsRTRRTFRYNG5jQUJoYVR3Q0J4cmdWdjBaWTF3b1d5TTdpM1BBSGZFSEky?=
 =?utf-8?B?bVFKQ3dzK3pLRXpOQ1BWUEhxK0xkR3lPbHord3ZWaXNtTG00cEN0alFIbG5O?=
 =?utf-8?B?dkg5cnJYR2F5TFEvcHpVRC9FbVNUN3B5SWliRytqdnV3bzFaZnhqTEwydHlh?=
 =?utf-8?B?QW9ySDZKaVRaZnQwM2tYSmgwZXdDOXZSbUdUdTVXcWwvYnoyaFlWNXZaV3JS?=
 =?utf-8?B?RkNDdGNMektBczJ1TUcwcG5TZER0ZEdKZXJ2WXc1OW9pYkpKL3FUMVdsVEtN?=
 =?utf-8?B?ZmFHemJwRSs4eUhTSUdNbWY5L0sycWpCdy85NUdkK3ZTVFpkaC9NemxVMTd0?=
 =?utf-8?B?TmZuOUx4V0Rsa3BJQU0yNHB6b245UnBXREs1bTRDeHRncWFtVXd5VUhzVVpn?=
 =?utf-8?B?TDRSMXhmSW8xa3FuWTY3SHhrWHYySXRKYW5pQS9OTVl6Um11R1NjQUZQQWt3?=
 =?utf-8?B?RFRycFFmeXRBYldoZXlKZjc3bTNBQU55NDhvSTM1a1YwL1R0T3JVVkZlbTN2?=
 =?utf-8?B?R1FlN2tLNVVHOXU1NndDYWdZRy8rUDR4Vzd0bXp1bm1uT1dwWCtnOWZ0SVQv?=
 =?utf-8?B?YVJybHlEemUxSDFKNXNVdWhsTUJYNVdXUmFJMHRZTWdzenc3ekwwRnJLZzZ1?=
 =?utf-8?B?N0dyelZ5VGZEdE10WXZkSjJ1NEdJOS95aFNjNDE1V3FKcDBBSG10ZGpQc2Ns?=
 =?utf-8?B?dWJMTXdYVFBxOFVrRUxzZExheWg5a1pDMDRqOTRoazNvK2JRR0FIdDdlUkEy?=
 =?utf-8?B?d2szdTFvalRycWdEeWFHV3h0ckR1SGNNT3JoRVlFSFdndUNrQWJlU1ZJS2RU?=
 =?utf-8?B?WDRnUTFPWmJPekVIUTZSQnltVlVxTEQ2ZUVuQlBFclZ4SHl5emJyMGJ0SHVS?=
 =?utf-8?B?dkg1aDBKQTRmWEVRdytPbXJFYlhxcUJ6cmVDcWdtZXZUR2kwMksyM3psZVU1?=
 =?utf-8?B?ZmhvSFVHbzBRMlB5K0g2bjVILzVlaHFoVnZkOGRGNDltYXpyQlhvVFNJd1JM?=
 =?utf-8?B?WFhTbWUvY210M2NEWDh1bGc5NTNJeHVVWW9NSWVSTnkzZm9FbXcwc3p3ZlIr?=
 =?utf-8?B?NHNZRkVWN29zTGI1VzNFWWwxZi9KSmY4RUl2Z0liQUI0WEM4M0dpUWJ2cEV6?=
 =?utf-8?B?eDR0cGdDSUFmWmtTcWZtYzc5VG9OM3dPNUZkS2I0K2ZGSjl0emFvRUMwRE53?=
 =?utf-8?B?VjJsM0NORWpRbFdyU1F6VDJUdWZ0ZE9seERQemhrZWtHcXBPck9ORzJPcjVS?=
 =?utf-8?B?T05SSktITDNPNyt6Mmo3M2hLVGlFM2w3MVRhS25vcHBRRld5dFFkK01xTUR0?=
 =?utf-8?B?bDBJMDM5V3BtNWlTMXNqNXF5ZFdhbHZyS04vWGdSNmFBOE5yM3RjMUhoNVpL?=
 =?utf-8?B?b0w5VHF3dzFSMmkrcEtaT3NDNGFuMGErNUZEZzJSdDZJYkhnMW84VDdidWJB?=
 =?utf-8?B?aGg3MVVUYStiaVBFcEdYby9nY0g3aUJCa1F0dG13NENtbFlDTjIwSlVILzdm?=
 =?utf-8?B?VXBJbVJuZmxhOGZPb2xxZlBaWmx1Q0VkeVlVbzJ3VjExZHFTc2p1MDdlaXhX?=
 =?utf-8?B?OFBxU1FNR2pjdG12NUJuNkhwQkxkZzQwQUQ0ZktWL29IYzZsYkNReVNrY0R5?=
 =?utf-8?B?bDdFUzEvV25jbXBJRzJXUHRRUUVPcW5QZlRVZmpPVEdYU0d3TE9GeHFtYUpv?=
 =?utf-8?B?VkFBNnJ1Y2lOQS8rand1NXBaTzEzQVlKNTNUckF0M1dnU01aOVIxa0RiY3ps?=
 =?utf-8?B?VjJ6b0QwdFhMY0d0VDY0eUNwYUd0OUl5WitTSTdhSWpKQW1WTk93YW4vck53?=
 =?utf-8?B?ZW1Tck9PWVd4Uk00bXp0S2twL2tXWHl4QlUyS3hONmtVTEJ2NWllODNzY2pF?=
 =?utf-8?Q?14zaH3kBuk5W2/oQm6inhP0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee6b095-9f2e-470a-de38-08dc6f8f637c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 18:48:02.2336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVKorpn7DkE6kHsre0QaBozMGFC63wcY3q9gEqORDSleo9U4bRZawMBtlAOmJkx9wD7hN/mtP3S3MQlgKBcXDY0ZRm1FxMnIhhmoyLmVzMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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

On Fri, May 03, 2024 at 11:46:40PM -0700, Lucas De Marchi wrote:
>Record drm-cycles and delta between 2 sample updates, just like done
>with engine time. This also duplicates the utilization_mask so it's
>available to the next layer.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_clients.c | 30 ++++++++++++++++++++++--------
> lib/igt_drm_clients.h | 10 ++++++++++
> 2 files changed, 32 insertions(+), 8 deletions(-)
>
>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>index 91d71a7bd..fbbb763f7 100644
>--- a/lib/igt_drm_clients.c
>+++ b/lib/igt_drm_clients.c
>@@ -105,18 +105,32 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>
> 	c->agg_delta_engine_time = 0;
> 	c->total_engine_time = 0;
>+	c->agg_delta_cycles = 0;
>+	c->total_cycles = 0;
>
> 	for (i = 0; i <= c->engines->max_engine_id; i++) {
> 		assert(i < ARRAY_SIZE(info->engine_time));
>+		assert(i < ARRAY_SIZE(info->cycles));

2 asserts to check i may be a bit much. Optionally, the second assert 
could just ensure (at compile time, if possible) that the array sizes 
are same for cycles and engine_time.

Either ways, this is 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>+
>+		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_ENGINE_TIME &&
>+		    info->engine_time[i] >= c->utilization[i].last_engine_time) {
>+			c->utilization_mask |= IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME;
>+			c->total_engine_time += info->engine_time[i];
>+			c->utilization[i].delta_engine_time =
>+				info->engine_time[i] - c->utilization[i].last_engine_time;
>+			c->agg_delta_engine_time += c->utilization[i].delta_engine_time;
>+			c->utilization[i].last_engine_time = info->engine_time[i];
>+		}
>
>-		if (info->engine_time[i] < c->utilization[i].last_engine_time)
>-			continue; /* It will catch up soon. */
>-
>-		c->total_engine_time += info->engine_time[i];
>-		c->utilization[i].delta_engine_time =
>-			info->engine_time[i] - c->utilization[i].last_engine_time;
>-		c->agg_delta_engine_time += c->utilization[i].delta_engine_time;
>-		c->utilization[i].last_engine_time = info->engine_time[i];
>+		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES &&
>+		    info->cycles[i] >= c->utilization[i].last_cycles) {
>+			c->utilization_mask |= IGT_DRM_CLIENT_UTILIZATION_CYCLES;
>+			c->total_cycles += info->cycles[i];
>+			c->utilization[i].delta_cycles =
>+				info->cycles[i] - c->utilization[i].last_cycles;
>+			c->agg_delta_cycles += c->utilization[i].delta_cycles;
>+			c->utilization[i].last_cycles = info->cycles[i];
>+		}
> 	}
>
> 	/* Memory regions */
>diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>index d44daa6dc..514c09e71 100644
>--- a/lib/igt_drm_clients.h
>+++ b/lib/igt_drm_clients.h
>@@ -33,6 +33,11 @@ enum igt_drm_client_status {
> 	IGT_DRM_CLIENT_PROBE
> };
>
>+enum igt_drm_client_utilization_type {
>+	IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME	= 1U << 0,
>+	IGT_DRM_CLIENT_UTILIZATION_CYCLES	= 1U << 1,
>+};
>+
> struct igt_drm_client_engines {
> 	unsigned int num_engines; /* Number of discovered active engines. */
> 	unsigned int max_engine_id; /* Largest engine index discovered.
>@@ -64,11 +69,16 @@ struct igt_drm_client {
> 	char print_name[24]; /* Name without any non-printable characters. */
> 	unsigned int samples; /* Count of times scanning updated this client. */
>
>+	uint32_t utilization_mask; /* mask of enum igt_drm_client_utilization_type */
> 	unsigned long total_engine_time; /* Aggregate of @utilization.agg_delta_engine_time, i.e. engine time on all engines since client start. */
> 	unsigned long agg_delta_engine_time; /* Aggregate of @utilization.delta_engine_time, i.e. engine time on all engines since previous scan. */
>+	unsigned long total_cycles; /* Aggregate of @utilization.agg_delta_cycles, i.e. engine time on all engines since client start. */
>+	unsigned long agg_delta_cycles; /* Aggregate of @utilization.delta_cycles, i.e. engine time on all engines since previous scan. */
> 	struct igt_drm_client_utilization {
> 		unsigned long delta_engine_time; /* Engine time data, relative to previous scan. */
>+		unsigned long delta_cycles; /* Engine cycles data, relative to previous scan. */
> 		uint64_t last_engine_time; /* Engine time data as parsed from fdinfo. */
>+		uint64_t last_cycles; /* Engine cycles data as parsed from fdinfo. */
> 	} *utilization; /* Array of engine utilization */
>
> 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
>-- 
>2.43.0
>
