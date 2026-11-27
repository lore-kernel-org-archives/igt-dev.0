Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5982606A329
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CcYNonqr;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TMP7YXPn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEF41129E5;
	Fri, 27 Nov 2026 10:24:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E49D1129D6
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795775023; x=1827311023;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UmBYFXu0ZNbKn6Oc81z7iZR/947Y65Y3f04VsgGYfDQ=;
 b=CcYNonqr5f+DTdEEpAXf8YRm3WjtFgCguA/3wmBTGqV1wPqqevbyoZqr
 Ir17neTR9Lv2sVjy0xgzvI/Tfekq2Gbf/5xruihqI7ePhxbImuldkNy6d
 qgWhBRJHyOtZMTtbUP/uBd23LyjSx0acO/TMMsV9iudrwzveyjG9InOy3
 d5cIwAS4Q/hfhv2/UF0fe7S6HsDZ6p4ah/ybMWeUcfHFJ/MbZ881jrFnw
 S1nYUiJRMp0JLqfwCGzemJEujPX0so+/ifPjrFKjgSwimVyF2acFNDRwr
 TVZ3rp1N14Uncul39RxR2zK/g9YbdWDXsfxLu3bbps9hgCEll7WsYnIin A==;
X-CSE-ConnectionGUID: vx/VA3/gTGWOwNRpzfwk0A==
X-CSE-MsgGUID: qPyFhBt/RteFTJyEuclTTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4684125"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4684125"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:23:43 -0800
X-CSE-ConnectionGUID: XzCTxaMZTwCAIeezCBx7fg==
X-CSE-MsgGUID: qULNF09nQXyAbSLONxYYKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12238739"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:23:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 02:23:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 02:23:41 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 02:23:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3mJutTQmet0WtJ3AIhjRCbSBl3rTCY78MN/lIhiI3Vxz0IHu4S1GQ3wGLAM3H5r9PeSDvdF5SBUSxDSrTiATlfJqMlSRpkN7ZOfJ6q2bPtUGPUp6bJ0U5CbNbr/iOnyD8En8W36NFGFDlXP6mKCAezcw5XY0jhKXvBUEHIqLEDoULoNOEe4c460W+2SU6QWq4H8kvoI+SzRNrbzJlHQ+F5s6QKjo/gzkv5xpcdTDUU5v+qwVK4II6p89zYYG0zfnWDBvB2lpsJkRs0yK5PmANt/oi5pVBXQB5ekS2OXK3nRJG1lVxP5hLYr2+vTeBXrTrvRpo6j6wj1dCd5zEd+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFBVe7ygaJg6rNoozTpqOcRUYaoxzBiy/3x1S/S//4o=;
 b=fs2BX+Dlv0CiFTkEFgW1HfQTH6zP1/rU7k2/VuWTOXyGvXz3poAaT0Xw45g3PzjhFkFjz94rDdGRA/GjjIQhH8FQFWHK6AujbScJm9iqlPPJbgkwb3jN2DN1QOE7ZIiXNUdyRm6Jq7OGR/YBsZbIthAfNq0XtyReOxWgGhQV1cMKXLRNnVI+1J3cl21hSBTAOeeZq36T7QcQKJgczzeo9MJwgRd6+Zc41WuWIdM8ShnbMpgkK22d8UpOveGjecc0ToMgOyJ/h7SR/yVL1BzBcWjp7+BIxWsb9JQb25HVacU3DnRsRGrUoUMnTD4YLD/vdb6eoXOIDuJS3uKGRXRbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFBVe7ygaJg6rNoozTpqOcRUYaoxzBiy/3x1S/S//4o=;
 b=TMP7YXPnYm5M3kNCxz9XpQ7WeD7Ye8G7fUQwcM1BCarmg6iuhYoytjryjOC7B9QhCxs89NMk8PxI6ojlVzga8Ofygk+oaxRdUXlzicjOB2NsTC9DHT9gBepLD5JYt8ANT6GQPDiu+85ZcaMdR1eZuQxzQB6x/qpErx6j3N3su1Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:23:39 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 10:23:38 +0000
Message-ID: <7b654314-63fc-4d4e-af26-ec5c8b103701@intel.com>
Date: Fri, 27 Nov 2026 15:53:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/i915_pm_rpm: Print reason for
 skipping PC8 subtest
To: Hiresh Kumar Yadav <hiresh.kumar.yadav@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::13) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|DM6PR11MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d7ef26-f7eb-4556-040b-08df4c708089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 3okbQAnUQNAAZlQOWpfoEqYirM5HwR9vRkOp9IgWMpOquxP/XDrACqjbOezkc3rLrNg0MjFcC1eE6vPcEtW/bvsynWzMoegMj4mROkimeMHehp/6uJTM5GuHCeu+vfpAjfx9zkbLfMqbKVFg5AQSxDdOR3RVp5Fh69wjfTESDrskBBDsE1Bd/qn2Blb0xDe9XD/D01J/yDV2KDxT3mrumLIW58EDaEHrSxAozlp1+0HntsyobnXLK6cwrXcU8OeY7iBgGF9h35UpBJtYvNxe0dCr0Ens9tBe5sNKHrlVwtCpQup7BpPu9o8YeZSqjEvBN3+EwROgnX4i29f/ShcbCLoXfwPItuADm/yS7rhgqoiO8XGoB/hbyXUskrmUgzp3gVPEKTqWYemQTOlPb28WT/XoNGnnGHlr/P2ak5sjO5iSp/SbTutt2p1/AJoLKhRC+w1aJBIwhGCnKdJKlU6xwOMCmf1TFYN/5dDqdpvoC+1NyCh6SViVcI3CJsx1BtKT7GuQgIR/OxCIu6B34Ghsg2UiNEX44upjw6rg5a6yfRnqZkbIRukD9A34HxtnQ+PAr9aZL6NZG568hdrX6oSjoyAtA0X3kI5k8MZEcUaG8iSvgGDqzM8ONf5OIv9nJEnmDrwpOC79rk0Ghak8FpKxmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTM0QXFFR3pEVGFFaUpJUUp6aFNjcnlIMXJXM2Y0OFNjc2pvK0o5WUtoWE5v?=
 =?utf-8?B?aUcvSnVvMG4weHUxdEJjUDhxZFpWR3NqNDd4L3B2eEFRcitZVWNuL1A0WVlC?=
 =?utf-8?B?K09JRkJ4V2c3c0hzN0tBeDlTekwrS1lENzd2MnRWNFJIYkxXaGcyQUR1M28z?=
 =?utf-8?B?NmFSSFNjKzVvOURML0hwZm9mbFRENlU1ZWJ5MDdtbjMybUFTZzJ5UUxLbU1I?=
 =?utf-8?B?cjBNWlBTSEUraW9NSjEwUlhta1M1L3Z1RGdUeHFqMEpNWG1sVy9veWl2K1p2?=
 =?utf-8?B?azI0dkJyTkw1UUhFRkZHSW1LRTlxT3oyMXRRcFBJRVFlb01UM0p4MGlEWUMz?=
 =?utf-8?B?eGttUGRqZnNIUFc4eUtSWHFRQzd6MlBxQkkwdkwrVlZTT0dYQ3VMMVU1ZHIv?=
 =?utf-8?B?aVI0WEMrR1RRcHBPaGZwOTdVc1JZazZ6aE4ydmdwNU1Gd0sybjc1SXdsUnNQ?=
 =?utf-8?B?SlE3cGQrM2ExQ2pHb2E2ZTBxQWNNaFhoWFo1ZHlNZ043dlhkejJEc0x0NWto?=
 =?utf-8?B?NEd1Rk0yK01NVWhrL2x5Uk8zU05YQ0VTVDFLeEw4cXFHNk9tblJGZElEdXQv?=
 =?utf-8?B?U2dYcHBEZlQzV241ZXVXRm5TQnhVM3E2TjI4WStlMGNrTVBJeVFneTFlMzdI?=
 =?utf-8?B?QzhwUWJnYVM2MjdjVXJsNmxWZXpzaDdoQ0dOS01Zdnk1cGFtZE5mN1c2L2k5?=
 =?utf-8?B?aHFyU3RBRTRJNEJXWlFoeGUraERRSkdYcERCZmY5aHdqSTh5b0lrRXptYkdy?=
 =?utf-8?B?YmVrRVI2eEJDYWozNWpENDlPbkRKb25lcTlBR0xnaFJYV0gzTVNoUzVIbXlB?=
 =?utf-8?B?dVBNb0xBenF1M2t2bDdjTWtQNXRuc0JtV3RiZTdjcldRU2dIU0lPVmZGMFF1?=
 =?utf-8?B?M2ZSOEFPcGtsZUlXQ0x1YkRPSkt1VWVQWEV2czBEM2dqY1NZU2k4TW05UEVw?=
 =?utf-8?B?aS9JRmVtS21Tc204WFBqMWVnTnRXeVN4RXlhL1N2aktjbnJJdithT2xNY1hE?=
 =?utf-8?B?K1FzWTZRdDlCWURaejkrL2hkZko5SVJpdy96TVl6M0VLN3pRNWdpMFZ3S2I4?=
 =?utf-8?B?Z2VtZ3pVMHFBcGdEQWJPR0l1QUxtQ1BwYld1RDk0M0UvU2EvbEgwVDZRdnFV?=
 =?utf-8?B?RHdnb21jTXJ5eEpwQk41Z1drQ3RqVFR1UEYxZ3I1VCttNk55MVVQNTE5MERW?=
 =?utf-8?B?Qk00UmszMWVzUU1tVzFTREVEV3FwcGdSdG42MUxtT1BROEhtbm43UWVVNHNx?=
 =?utf-8?B?LzMrVXhOZFNVQlBNRkRzK2xpWi8vZTFRSHlVQWpOcC9meHpXeWdEVDJ6YUcy?=
 =?utf-8?B?Q1FzeEMwY1FUQnAzY05zSVlVN1Y3NERlUStHUmJMVDc4eEdzbUxoRGhJV2x6?=
 =?utf-8?B?YVMvYklvdmFGWm9TQVZmbHN0bnRqS2RnWE9vcEpSbjV4SjlJWmpTTWl3WnFQ?=
 =?utf-8?B?dmxadTlmdk1vSUhUZE05aHpiSjRHQVc1TUFSRXRJYlVkN1JBSGtHSUh5THgy?=
 =?utf-8?B?aEhIZG9VOVdWS0pNSnhIQzVaYm55UFhCZXl1ZVFyWGhnUDJreWU0TDJjcy81?=
 =?utf-8?B?dDQ3QThpc3NPRTBSRDZBNkIwV3Rkc3JtbFhCYVJCNzVCa0JyVm9kWXFKczNY?=
 =?utf-8?B?WW9IczVnbVBIby9WdzE2RkdVRnllbWF2bCthbFhwZ0Z3Y1RvOE5hZjVteGlV?=
 =?utf-8?B?UDQ4cGFtMm5lVlRZVk9UTlovaEsyN2lLZks0UkVwQWthMWpKYWNtdWQybldS?=
 =?utf-8?B?allQcGpFQitIS3ZtazNxb1JWUzZuc3pTTHpFQ1J1RURSck1lQklsQkpEVVVk?=
 =?utf-8?B?T01ic0dXbXNUMFBhSEJlNk1WTW9heWorWTZuNGNXZ1kxS3NxTURocHZKWTNB?=
 =?utf-8?B?MHM1UXV6M2Z4Qk8zWGpwRlp3b2FuVGU5VU9lWUhqT0xXTU5QOTc4RlFWZFcv?=
 =?utf-8?B?NllnZGpwcVE3SHU1Y2l0d0s1ZmsrRE03cElMSDhUZWFpdkI0dnMzVllNeURP?=
 =?utf-8?B?OVpaS3ZEdElpVjlBMHY3TVFrMWR3VFpOQjZKRUg4WGFMMVlTNWRHQjllcnd0?=
 =?utf-8?B?UWZhMVVlMTZuVmE0anYvVXlwY0dnWUdaVFVmbGVId2g1S0NZRVlwYWVVc09H?=
 =?utf-8?B?eWxWdGl6TzE5aEtkZTZpRkRGK2N4QWVrdm04NmZRWU8zV05pZjc1ZkdmbEFB?=
 =?utf-8?B?bU1uQStoN1V4YkdHSmx3NDR1MkVMYWx1a2g2LzJ6SU9RZURJekxzOUluQU1a?=
 =?utf-8?B?WW5LK1NuRDRZYzFEQVFBRU9odUxwSlZoY2Z4ZVhrUnNBcXV4UUZYYktBNjF4?=
 =?utf-8?B?UVhCeEkwNVJEdnVxRXZ2QklrTVJyRjdQTEdrbXE3Vm5Fa3JPQ1NPQT09?=
X-Exchange-RoutingPolicyChecked: PT3imxDx5iE2iDKvh0kKzbfRNlLi3xgdCYYbVH1I/+/tbgk64zDAyADE2m5lMGwYNlVKC/hNqhyCOJ0HSyjQRnYC04kXJEoM/oz2dXWeuSAquRlNPyP4e0j8msmWZQOeGpzdfYxwVsX/4kvKNrhvA6H/C9edr2q08ECHf1SMwEkRFyFJ7Psub0Gr1gV0+XwqPnkgOlz6QX1YAKbmq+jsOZbrOV4QPn4/HqMGEHIKu9w/+Y2y3diYdcENL7VcfjH8VN4nyMQcrm6F7Go9WhsA6vSF3ud9v5M7EHFjZWZ1naxu/gk9oPBIW6cQ3QCL1i+tt1OoFZjCYbsSyXhoW5j08g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d7ef26-f7eb-4556-040b-08df4c708089
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:23:38.7671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+wKJsdhbfhA4Hqj4RseBDhQeqr7uPuGmKf1qyONJ/BePN78thtqQcLiVUOM9iGUD56agkdjljs1sdfHIH6wnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Hiresh,

On 11-11-2026 15:37, Hiresh Kumar Yadav wrote:
> gem-execbuf-stress-pc8 skips with only "Test requirement: has_pc8",
> which doesn't tell the user why PC8+ support is unavailable.
>
> Record the specific reason in setup_pc8() (unsupported platform,
> PC8+ residency MSRs not readable, or package C-states limited by
> BIOS) and print it when skipping.
>
> v2:
> - Drop unreachable skip reason (Anirban)
> - Use neutral reason when PC8+ C-states aren't enabled (Anirban)
> - Drop cause when residency MSRs are unreadable (Anirban)
> - Removed printing platform/codename (Anirban)
>
> Signed-off-by: Hiresh Kumar Yadav <hiresh.kumar.yadav@intel.com>
> ---
>   tests/intel/i915_pm_rpm.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index b4da27b21..ee5e51c57 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -131,6 +131,7 @@ enum plane_type {
>   int drm_fd, msr_fd, pc8_status_fd;
>   int debugfs;
>   bool has_runtime_pm, has_pc8;
> +static const char *pc8_skip_reason;
>   struct mode_set_data ms_data;
>   
>   /* Stuff used when creating FBs and mode setting. */
> @@ -222,15 +223,24 @@ static bool supports_pc8_plus_residencies(void)
>   
>   	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC8_RES);
>   	if (rc != sizeof(val))
> -		return false;
> +		goto no_msr;
>   	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC9_RES);
>   	if (rc != sizeof(val))
> -		return false;
> +		goto no_msr;
>   	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC10_RES);
>   	if (rc != sizeof(val))
> +		goto no_msr;
> +
> +	if (!igt_pm_pc8_plus_residencies_enabled(msr_fd)) {
> +		pc8_skip_reason = "PC8+ package C-states not enabled";

In case of MSR_PKG_CST_CONFIG_CONTROL read failure also it will be 
printed, please rephrase the sentence.

Thanks,
Anirban

>   		return false;
> +	}
>   
> -	return igt_pm_pc8_plus_residencies_enabled(msr_fd);
> +	return true;
> +
> +no_msr:
> +	pc8_skip_reason = "PC8/PC9/PC10 residency MSRs not readable";
> +	return false;
>   }
>   
>   static uint64_t get_residency(uint32_t type)
> @@ -550,8 +560,10 @@ static void setup_pc8(void)
>   	has_pc8 = false;
>   
>   	/* Only Haswell supports the PC8 feature. */
> -	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid))
> +	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid)) {
> +		pc8_skip_reason = "PC8+ residency is only supported on Haswell/Broadwell";
>   		return;
> +	}
>   
>   	/* Make sure our Kernel supports MSR and the module is loaded. */
>   	igt_require(modprobe("msr") == 0);
> @@ -1147,7 +1159,7 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
>   	igt_require_gem(drm_fd);
>   
>   	if (wait_flags & WAIT_PC8_RES)
> -		igt_require(has_pc8);
> +		igt_require_f(has_pc8, "%s\n", pc8_skip_reason);
>   
>   	i = 0;
>   	batch_buf[i++] = MI_NOOP;
