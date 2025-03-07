Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3588CC282DE
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 22:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C836E10EC3E;
	Fri,  7 Mar 2025 22:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3wWSCL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5739510EC3E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 22:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741386770; x=1772922770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l7gySxPoiA9I0YohelealfIai/qXu8JEc+wuxzz7vFk=;
 b=m3wWSCL0BDUZJ/kdlo9aNjqMlXwRR4UQXnRzJd3tieMWQZrwxdg5fPi8
 +HvzriBtZIWI235ggyaI83byHUtz7pzNmcFN5LFZpPdRgJqFdlOEz9hW5
 JeHSTSiCYW+EDTpjAX4+Esf/LDeE3exhFNdbP/gi/+uUM84moI+Y7uqEJ
 0TR9TGyfndZqNKNmEggrdu6j8sNgdmOTuGjl5CCOtN2X8Y47yJEheW2s/
 BpFdDwcdpjfz1BHNITk4fO+qYTslS8kjDB+JqOuahuCfdu9tT1NDoNwl3
 k3Gacd3UoGzUEy/uRQlqEB5pP1dj8yPmXJeM6i2btp7BUJk5n6bg0nN3v g==;
X-CSE-ConnectionGUID: /VzOgoBUTySH7NhePkoLTw==
X-CSE-MsgGUID: 1J+QhpV8SwyHrx6rJmh5yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46229916"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="46229916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:32:49 -0800
X-CSE-ConnectionGUID: bgcdp/gTTDKjnEVCZ2/r7Q==
X-CSE-MsgGUID: ZGRVIXKJSO6FhAy+Zubwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124673423"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 14:32:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 14:32:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 14:32:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 14:32:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2Zj32SWHbMAw5rrgLv6lW64cAUrRDNzD/+Exv9vkqLkDtB3RLWWQW/IhOaUynbyS4Z13WX61ezXesnrBjQeP5xynYzjKtiVlBgqW8DqkE2eG0tDUopw09L7/NYJpHDVgc6bIiO6Yvuk9Pgz0os22lLVc4BXsuTIZpZ9mlIw+q8Mr1z9kEyGCIYZSDHyNSMEcqcLEVmjgm3PBAzP8M/Yv6jX7aSZ1P6ELmQAySgHUv//ktQhkqQ0Q5NkVXQQfkkk4d0V62X4ahlu9J68Nv6ksO9J7uXANs/wzp258zdXJs7Qac1SiqdPDjRo5ulMF4+VwNDfH/SvwdT/Riko39dQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV5YkvwRMBrdU7bmz93xnN4okjp2V1TLE0FGm4w/Jy8=;
 b=RIDct4E+N+ld/3VhzbaCnF7HzUIkDBWW1ATw8PCPVgc+0ZXFZ5yWlLiiuEcmh08jJkw5yK/gdFRVw+9FoyuL0P0HK+rz9uEzBDZ6o4QCEV5C/XgjCzBbYpzTpgYqFqdGKxGGSIqjid5hI34bMgH17rZmonmvjcKg7dJl/xSwnPjPD4KNo8blJXwbxGhbb0tSnGCFPXt2+vhpyJIWvlwKVTesr0f42W1c83JRZ5oEspBG3XE1GONZzPHWmOAdgSw9xbQSjiZ1GUkbFmCWKYX644lZKgpl/ONR/8JIG4VtiPjHQmgephUrrolyJ9/QRKWu5U0Wjjt1Pk98fv2beAeLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.23; Fri, 7 Mar
 2025 22:32:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Fri, 7 Mar 2025
 22:32:45 +0000
Date: Fri, 7 Mar 2025 14:32:39 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pmu: Add function engine activity
 test
Message-ID: <Z8t0B1QDdptwOI09@soc-5CG1426VCC.clients.intel.com>
References: <20250304101019.3274493-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250304101019.3274493-1-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:303:6a::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f455c9-834c-4a66-c391-08dd5dc7fb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0ZYdHVEU0U4SS9zVndxQ01Edjdtd0wrU0kxYjJZdncvbGNBVU5IOFNOalhD?=
 =?utf-8?B?NWNEdnB3akszVzQ2T0RSQXl4YzU0ZWE5MmFEVHRqU3NqYzFlajhOWjFnb2xK?=
 =?utf-8?B?RGNsaFZDODNra2wrdXJwYjFub1FUUHFBc0JsNEZqTERPbk9Ia3ZTSVlDYmRS?=
 =?utf-8?B?ZTZIeTkvWjRXVk9jd1BKOGE5aDFVTXk3VDUvU05ubThleElFZ0RqS2h4NGpB?=
 =?utf-8?B?TEtpSWVNazlVS2dYU3pFejNKS1FQY013R25HN20xR2FVdDdNa0JHN0w1NUpu?=
 =?utf-8?B?b1NFQVNFTHk0c3c2SFdXRDR3dFROS09pNEZpc1hHclJFZnhPaG44cThMUzJR?=
 =?utf-8?B?cWtpVmRmZW92QzFxcS9lcVFEZXlWRm1JZURiY2hZeTRWNTBncnJSOE5YOWZF?=
 =?utf-8?B?Wld4aW9Zckh1M1ljR3BtMUw5aVhFK3YxSktFQStLUUtKWkZLcEs5Ym5FbDUy?=
 =?utf-8?B?NVYzUkNCK3c4dUprL1l5UDM4UEkxOVVxWGhnRVBkcmpHR0JKcEZ6L2lLYjgw?=
 =?utf-8?B?QnN2dVR3UU8xc2xGK0psZk1BczlvSlRIbE1PWmhBSXRYczZYaUNQS1ZMbk9n?=
 =?utf-8?B?V1lTVVhxR3ROUExVV0tWa2UraFJ5cHR1dDZON2hNUzI4dHVBdkZGK0w2WHNj?=
 =?utf-8?B?TWRDLzAyeC82RFhyTkkzRzlHN3d6VXhpNVdoVnlIdEd0WlBjVmQ5eTZCdkUy?=
 =?utf-8?B?Y3pXbzVSbkpaQzdHTTNkVm9OOUVNV1lHNmxTQ1dic1FReitNK2FqNnd6ZnZk?=
 =?utf-8?B?VG9zY2EzNTBXNVA1Z3RsaFV6UGx6cllDa2JtU1ZXQWpPb0NKTFRSb2ZPNVEr?=
 =?utf-8?B?SG14bVFKRllzZVFVcEo4NmZEdmF2UlA5WjhVa3hsYzRpdU5oek9DOXZjS3No?=
 =?utf-8?B?amI2VWVKbXNxVHRQVnJ3WFRqK0pOcU5vNmJOQUVVUXNQZDFveDNSWS9JRFdo?=
 =?utf-8?B?NTgrcjNtR0FEVDg3cHkrQWUvenhCbDVYeExPWnZaNVhpeUJlbkxFeXpFTGQw?=
 =?utf-8?B?SEFhME5zZFdCQm41VHBtUWQyc3dFMmt1OGZBV2czWXozbjdYa1pNTU0xUFJq?=
 =?utf-8?B?VUdzaUovN013ai95dDBIWnVRdmpSMFJRM3lINHFjY1dVZUFlUTJlOUN5TjBY?=
 =?utf-8?B?SXgrWmZTeThIRmhwYk5iUlRTT2xSQ2dodUd0T2NaM1VoVW5VS3BZRERsVllk?=
 =?utf-8?B?eVYrcEt6VERKUmhLdmdFay9JVjBjbnpFVDljR2laZDRLbTV3NmpySVB0dFlU?=
 =?utf-8?B?TFg2SjlYNE9jMXMwbHhOU1k0RGRDRFIzUjVTcGM2Tmp4NUd5a3ErSlcxK0I3?=
 =?utf-8?B?RXhtV1pwUkMwRDZmc01xTm1KUGpOeWFVN0N4YkxkMWVtaGxyKzc4cnVzQXRu?=
 =?utf-8?B?QVJWY3RjdUtpeERWdHQ1VmV2cjJVTGVBRUZBamIrR2YrS1JQUURhMlc3Zmd0?=
 =?utf-8?B?dGFKb2NQbTdpbS9NeW9WS28yQjNDTlMyL3hEc1NXOGFKaWdjRUFTRHo5dE5F?=
 =?utf-8?B?dVVjeE95Q2lYclY0U3VPanBLbC95MnF4dHIvRmE0dUFqTnhzNWg2SFBWZHYy?=
 =?utf-8?B?TkNCVy9tdUxybGlvOVB1aGRSdTBFVEdzVTF3T2pNYU16SnoyNmpjdlEydUUw?=
 =?utf-8?B?ay8zays2blNIUjdZNlpTMGdTOEwvRys4ZlpaaVc2U0NyajYxWlllUG9LRzBr?=
 =?utf-8?B?Q2I3N0tNZnZtZ1VZcjhrSllMYlk0Q25kWms3c0VyRFY2bzhVbER1VWVYYXJH?=
 =?utf-8?B?NjUzSzZkZmxVUUhERjI1eWo0Vmx3aVBFTkxwQ3JTN0NSdmVESXRrS1huck4z?=
 =?utf-8?B?V2JVV1N2cDMyYVowRHFXSHplaDMzNjFGSGxwM2cvTGtweEVNdXZWQUJqUlRQ?=
 =?utf-8?Q?tJA9mW4aFHMS5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk16R2Z6QlFLWTVFRVR6Vi8vYW9nM1Fsam5kaFdQR0syYkZXa3Y3UldYbXYy?=
 =?utf-8?B?K2JhZUdoNG1FTXZNL25qY2wyd1RGc2pYRG1lSVIwWmRHYU8zNGc1b3UwQ2tV?=
 =?utf-8?B?TS9NRVpVdlFBTW44QkYzN0NpZlpTYitGRmdUNlh6VFBLdEp1US8raHhnVGdY?=
 =?utf-8?B?L1oyOU1wZlQ5Z2xHYi9iQ2R2dFBtVDYxRzdxYkpwRGVacmxseDlialo1T1dn?=
 =?utf-8?B?TWxTcjNwZFVrUWUwanZCaEJSakd3OEpKZmZaM05IdVNNbGhHbis0Z2dCRWMy?=
 =?utf-8?B?dGZQTTA4bUZ6TDBFVVZMRElxdjgvK3NES3FQOU9VNDN0V1JHdG9rbXh2VjZu?=
 =?utf-8?B?U29hbk9kaEo3cXEvTGVIci9xeUFSdXo1VGE1N3ozdHNIcVpId01lWndyeVlQ?=
 =?utf-8?B?WmRISzJiaFFiVHU2V1JDaVFwbTRDa202SUdQT2hZQ01XUVVSUFRuM0FMMGVw?=
 =?utf-8?B?RnUxVVVab2FxeEZmeFJ2dnVGN3Z5OWVHdmI5eUFRamhXNElPNkdLMVhBK0xK?=
 =?utf-8?B?ZXprYUpzN2JXclc1NUw0cFludUtCUW1aMVlHd2NkMXB5ZjNLaHlFNnRkSTFU?=
 =?utf-8?B?bldqd2lENUs4THZwRmpXc3BNcm04bksvcThMM21SQzFLSkdCWWVwRWo0Mldh?=
 =?utf-8?B?c0NrYUFNWEI5U2xvK1dQaFBzeGNZQnhYemZzRm41UGJncDY5dTNzUldvcnA2?=
 =?utf-8?B?Rm5zNjYyTkdSR3ZGZ3NlYkZLR2RxaWxabTNoQjFaSzFXL0xtV3VqTENBM3ZC?=
 =?utf-8?B?cTFiR1R3TE9ZZnAwTG1UNXRidkczNU1yTENxbmdLWVVrckxWNHdkR3BTaFBI?=
 =?utf-8?B?WGlNSkh3YkZVOVJIV3VEODFDZTZzRXkySkYrN0F6OHdKT3F1ZnJ5R0JBd0pJ?=
 =?utf-8?B?MGdBQW42cmpQTkdFK2h1andiZHNYUENFdE91MHdjVHp3bUl2Q2tSWHFMOUJN?=
 =?utf-8?B?enB2OGZydFh3TkYxOUNZRXJBc2VwYWNpajc0SDVuTXRjL2Ntekh1SkhqbTRj?=
 =?utf-8?B?VHlpRGtmSityNlh3NmtKSGJ4aS9qTlhNYzM4SlM3QXpnUENSR2dNWWFpY1dI?=
 =?utf-8?B?bEhTakkzbEpzYXJ3eHlWK2xoZ3VqZU5YVlhmakdPWGZ5QkJqU3ZxdTVzc0Za?=
 =?utf-8?B?ZVJzZjE5RG80WThpcGcydm4rb01CNDQ4MnkzbEZWTCs2YmZaZFliSkgrSjZB?=
 =?utf-8?B?aWZmSFlPa0UrVHRHQklRdDZYYzdRUkNVdmZmbWphQ0ljbVJnaHRuZ1JXTDVr?=
 =?utf-8?B?MUlYNHZ4OG9TYURHWEhYNElydzFyREY2bkoxU08remI3ZmpoTkQ4clpQUlRr?=
 =?utf-8?B?Um1QcndEaUJPaURFQzZLSUdCVzdtaGc0YnhubG5UMjFwaEZacHVEUDNrK3FI?=
 =?utf-8?B?M25LcGdGUXVvazNjcjA1NklTRW5nM25LVzNicmM1ODhib1Y0WGVSbGFxa28z?=
 =?utf-8?B?WHNKM1FSL3lsd2R0QkNPdy94eWZacno3bERiNUt6SkoxTUdWUmRHK0Z6MDFU?=
 =?utf-8?B?UDZ1VmdQTXgvUjRJOXpUNGdVWUJ3VzN0TTNJV1RQMkJYT09ZSmlxaFNXVEtw?=
 =?utf-8?B?YXRWWmpxV2RKMnBncUsxYkVBVHlpQWNlOGpqcVkwNGlDMUNMaER1dlRzak5T?=
 =?utf-8?B?dUpjelB2TmJWODYxWTlTTzk2ajlrMU55Q2g5VGNLNmdDcXZMTXNlU2ZhV0Fy?=
 =?utf-8?B?bXVRSllqU0tFaHdJWlBTMnJEakNRNUtnTGFTRyt3VzA3UTNHOXJtZkNXdWdu?=
 =?utf-8?B?OEhZbTR0dlR6NUNjaS9rMmdXZlUyQ0gydkZuNnB1UWhJMU1FNlcydXdUNk1k?=
 =?utf-8?B?c3lURUZlSDZxY0gwSGQwSkRSRnJvZzZ2RnNnaGZZKzdGck81SGd4eXdHaXhU?=
 =?utf-8?B?RXJVNG5EK3dQQW5qb0NiQjNkSDQ4T1c1aE9yQjFmVjdYbnVEYUJoQ3FhSWRr?=
 =?utf-8?B?ZkVlT3FOSkFMTkVlSGRhV1IwY1RLRTdZWnZxd0RnZ0xjVEJYTXNpYnhYMGJt?=
 =?utf-8?B?eWFGemhYRjNQb3Mzbk41Vy92VkRrbzJTaHJzTVFXTzIxUy84ZFIwR0M4T3FV?=
 =?utf-8?B?K2lPc2o1Q3hnNHM4a2dGNW9JdHNLaksxVUJ6c0NHdUdOYmJOZVU5L29xelNv?=
 =?utf-8?B?M3VVZXhmUk1RVnJQalZ6MTNzeFNERXAwdEtoUXY4QTZWQjNpeFVYMit0a0RE?=
 =?utf-8?Q?HmLmKydW7mwURgU5s7kuYcE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f455c9-834c-4a66-c391-08dd5dc7fb6e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 22:32:45.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSYBon3zXOkoEzDCObI3GYZuQAGEzKqU8V5PwAWjOvU/86akmXuqCyuVccTPWiUJPnG8C9E6wgWtYJmcpS9FVJ2c3iia4pydgQrwuLQPRgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
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

Hi Riana,

I am numbering the comments so that I can let you know if any are optional.

On Tue, Mar 04, 2025 at 03:40:19PM +0530, Riana Tauro wrote:
>Add a test to validate per-function engine activity by
>running cork on all functions simulatenously
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 89 ++++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 85 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 4584fc7d3..5a93d581a 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -14,6 +14,7 @@
>
> #include "igt.h"
> #include "igt_perf.h"
>+#include "igt_sriov_device.h"
> #include "igt_sysfs.h"
>
> #include "xe/xe_gt.h"
>@@ -106,7 +107,7 @@ static uint64_t add_format_config(const char *xe_device, const char *format, uin
> }
>
> static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
>-				 const char *event)
>+				 int function, const char *event)
> {
> 	char xe_device[100];
> 	uint64_t pmu_config = 0;
>@@ -122,6 +123,9 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
> 		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
> 	}
>
>+	if (function != -1)
>+		pmu_config |= add_format_config(xe_device, "function", function);

(1)
How about just have a new helper that takes in the function parameter:

- Make char xe_device[100] global to this file and initialize it in fixture
- define new helper, something like:

static uint64_t get_event_config_fn(int xe, unsigned int gt,
                                     struct drm_xe_engine_class_instance *eci,
                                     uint32_t function,
                                     const char *event)
{
         return get_event_config(xe, gt, eci, event) |
                add_format_config(xe_device, "function", function);
}

For any counters that are not function specific (rc6 etc.), they can use the old helper.

>+
> 	return pmu_config;
> }
>
>@@ -143,10 +147,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 	uint32_t vm;
> 	int pmu_fd[2];
>
>-	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
>+	config = get_event_config(fd, eci->gt_id, eci, -1, "engine-active-ticks");
> 	pmu_fd[0] = open_group(fd, config, -1);
>
>-	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
>+	config = get_event_config(fd, eci->gt_id, eci, -1, "engine-total-ticks");
> 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>
> 	vm = xe_vm_create(fd, 0, 0);
>@@ -187,6 +191,75 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		igt_assert(!engine_active_ticks);
> }
>
>+/**
>+ * SUBTEST: fn-engine-activity-load
>+ * Description: Test to validate engine activity by running load on all functions simultaneously
>+ */
>+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
>+{
>+	uint64_t config, engine_active_ticks, engine_total_ticks;
>+	int num = num_fns + 1;

(2)
s/num_fns/num_vfs/ everywhere since it truly is number of vfs.

OR

don't rename, but add 1 to num_fns when you call igt_sriov_get_enabled_vfs().

>+	uint64_t after[2 * num], before[2 * num], pmu_fd[2 * num];
>+	struct pmu_function {
>+		struct xe_cork *cork;
>+		uint32_t vm;
>+		int fd;

(3)
why not just include after[2], before[2], pmu_fd[2] inside this struct?

>+	} fn[num];
>+	int i, idx = 0;

If you include everything within the struct, then you can drop idx. Just use 0 and 1 index.
>+
>+	pmu_fd[0] = -1;
>+	for (i = 0; i < num; i++) {
>+		config = get_event_config(fd, eci->gt_id, eci, i, "engine-active-ticks");
>+		pmu_fd[idx] = open_group(fd, config, pmu_fd[0]);
>+
>+		config = get_event_config(fd, eci->gt_id, eci, i, "engine-total-ticks");
>+		pmu_fd[idx + 1] = open_group(fd, config, pmu_fd[0]);
>+
>+		if (i > 0)
>+			fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>+		else
>+			fn[i].fd = fd;
>+
>+		fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>+		fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>+		xe_cork_sync_start(fn[i].fd, fn[i].cork);
>+
>+		idx += 2;
>+	}
>+
>+	pmu_read_multi(pmu_fd[0], 2 * num, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(pmu_fd[0], 2 * num, after);

ok, I see why you haven't included before/after/pmu_fd in the struct. Maybe you
can still include pmu_fd within the struct since you are only passing
pmu_fd[0] to all the calls (which would be fn[0].pmu_fd[0]. That should still
help get rid of idx in the above loop.

>+	idx = 0;
>+	for (i = 0; i < num; i++) {

For this loop you can use a local idx = num * 2;

>+		xe_cork_sync_end(fn[i].fd, fn[i].cork);
>+
>+		engine_active_ticks = after[idx] - before[idx];
>+		engine_total_ticks = after[idx + 1] - before[idx + 1];
>+
>+		igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[idx],
>+			  before[idx], engine_active_ticks);
>+		igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[idx + 1],
>+			  before[idx + 1], engine_total_ticks);

(4) Maybe also print the function num.

>+
>+		if (fn[i].cork)
>+			xe_cork_destroy(fn[i].fd, fn[i].cork);
>+
>+		xe_vm_destroy(fn[i].fd, fn[i].vm);
>+
>+		close(pmu_fd[idx]);
>+		close(pmu_fd[idx + 1]);
>+
>+		if (i > 0)
>+			close(fn[i].fd);
>+
>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+
>+		idx += 2;
>+	}
>+}
>+
> /**
>  * SUBTEST: gt-c6-idle
>  * Description: Basic residency test to validate idle residency
>@@ -201,7 +274,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
> 	uint64_t val;
>
> 	/* Get the PMU config for the gt-c6 event */
>-	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
>+	pmu_config = get_event_config(xe, gt, NULL, -1, "gt-c6-residency");
>
> 	pmu_fd = open_pmu(xe, pmu_config);
>
>@@ -253,6 +326,14 @@ igt_main
> 	test_each_engine("engine-activity-load", fd, eci)
> 		engine_activity(fd, eci, TEST_LOAD);
>
>+	igt_describe("Validate per-function engine activity");
>+	test_each_engine("fn-engine-activity-load", fd, eci) {
>+		int num_fns = igt_sriov_get_enabled_vfs(fd);
>+
>+		igt_require(igt_sriov_is_pf(fd) && num_fns);
>+		engine_activity_fn(fd, eci, num_fns);
>+	}
>+
> 	igt_fixture {
> 		close(fd);
> 	}

 From my end, (3) is optional.

Are you able to configure sched_if_idle? If the results are for a specific sched
policy, then I would add a igt_require in the test.

Thanks,
Umesh


>-- 
>2.47.1
>
