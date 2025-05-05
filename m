Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0CC369C2
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 04:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8973E10E268;
	Mon,  5 May 2025 04:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9ZKZpcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CAE10E255
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 04:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746419119; x=1777955119;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ufhShGknYF0uuabb4oCcX5TsvoTQ6t5QqHsTcMFQNb0=;
 b=R9ZKZpcN56UL4Ta8elMyB9yXXbv3tUyTllp85rsuiFBl3ExccJGtcksO
 UmL49vCfRFH740DoCY0y99G2IwM9Orvyz0tCq8ugLaq9WQA7uzeKw8gh8
 /CujqN21K/mJb6uLF/EDw1ch1HFTnvVMTTxL2Op0LzIim8vqtcawRLAa/
 3OwyF7RJCMm3P7jwiJpeFJaM2ZtlzoFN6LbdBurNenJvc7WVW+WPfPlGb
 ONrHAD6f7FqnPLeCKiLwyGxnLHsbQ3ll33Azj4BHD6/yAXNCc639Y5xss
 LDOrCGyQDDkyp2MFagPaOKZfFr+XCZrGVXqiuzy3iJEmnk8tAh/bVX1XE A==;
X-CSE-ConnectionGUID: F7/kolZtRbaIxcij/n6ckA==
X-CSE-MsgGUID: ZCS4yB1bQgGbsFxW1fITkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="58672666"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="58672666"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 21:25:19 -0700
X-CSE-ConnectionGUID: bDH8JEBERhSZiHmroXxkFQ==
X-CSE-MsgGUID: 3aJh5w1nQkmpO80F7/ojfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135648371"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 21:25:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 4 May 2025 21:25:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 4 May 2025 21:25:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 4 May 2025 21:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLH/2CGmU9UvFKNY8BpKkx7lb91cSvoZ4i0fkMQCWsL1+oVypBNPYCz7Sjg8Id7uo1pgy97eN4RLTma1YpwnbAKUaU5tcQ6c+CsQfFiKCvT2JiWizpQ9zrtzBfIvbksZFe6wtcmttKhYb54zUOZTSUfw/FveMuiVi8g6qe0npcLDuYV/zc0r49xrBMkAqAr/4FFqaOKgYz5GiqeCY9FifFLVVuTA0UoOhXZrdrrkoU/As2j61aTDBs285AXZOZ0Cf5S8738tdnAYwo6jxUEVP/bWUtBs3g3fqyo/mYiDwIhLVYsUJ7Fj3GolMYDwTff5SPglngDo9uFgZ1eCq24TXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRXhZGh7m+1hh929TjPxRO6jHwZhxBOAb2Z/ubQlCYw=;
 b=tMUlnAFqs4HOQ5j9cHAbh9Z4QsKiaUUfh/9mRt5t3uPWTBJY8Gv1P8WZuzw2o1BLljC66arUOB/wtSonjOvDhfGp9acW74Up+ec8AbOWcRLN/A/FC6ggNRH7dYxHHDOc8OJCuAnVGaXEND8cPsB1bOnqOoCIVMNVApXL1GnBDm5RB5lW8KT0WLy/eNcUMn8PO0Fspn1Ja13GH3tc4/f9QPzSTzdpLsIg05zCM471F48DrVbjPrVRvZbdUPRKq1in9UBKmUv2tY72qlONkmDs2JgqAVDjNeNvhD6X7cGw7bYz7ByQu0nLPlIdS5w86WmV7kugeBuoAj0URQnybjG/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 04:25:14 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 04:25:08 +0000
Message-ID: <d9708ab6-ba31-49e8-831c-7383aa645650@intel.com>
Date: Mon, 5 May 2025 09:55:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250430094655.3926900-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250430094655.3926900-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: c76bdd26-7182-4059-4401-08dd8b8cd11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y211U2xUQVo0VE5RZUxtQjFrMk82ZlhXVk5wbDd1MUdqNS9zOTNqSmFaUHNu?=
 =?utf-8?B?ZjhSQjQ1SmFYcW1jeThaaGp5ZzhrcXBKL2ZoY3laL0kwUzhEZVdWanRBVnpy?=
 =?utf-8?B?UVhwTFFrd0lVSS90RXhyY3E1TnYzSndmUmQ4S1Q2bjZtb3RhUXZteGwvYkoz?=
 =?utf-8?B?cnN5QVo5dGdzV3RleEIyNVJ5a3FjaU81UUkwMERVVEhER2s4T2Vsd3hKUmpl?=
 =?utf-8?B?a0JxaGlhUWhJL05pY1VJaEM2MFJ3UHlCdnNtMDNqUjdCSWdlRUk3ZGpFKzU0?=
 =?utf-8?B?ZmxlR3JLbXloVHRmYXF1UDZEdk83SjlrcnlqTHZ1bmkwU1JyVjVhd0JONWk0?=
 =?utf-8?B?eDdYY0VWT1JXR3V3QlJLajBJeGxUdXc2QitQQnZJOStuSERNTFY4Z2JKL1dJ?=
 =?utf-8?B?bXU0S0FISUo2OVQvRTZkdUo2aFNxT2ZIRmpwY0tZREdsTHA4dEFoUmRSaTEy?=
 =?utf-8?B?OXJrYklhdCt6Vnh4WE9yemFjandDSEVTbUtPVFduVUJMUjhXT3VrNWN5SGhW?=
 =?utf-8?B?QVE4a1ROZkowWVYvWU8ybnUwa2ZNWElTK0wwdFQ3V2JNWG91ZnJ3YVpLVlhC?=
 =?utf-8?B?bDBBKzY1cjhiL0FTQmxMdkxLUkNxdjU0cU1lblhMbmYzazhGbUcxOXc3NW1Y?=
 =?utf-8?B?TllrMTBrMDZPRTRHM0o4dUNqRnpoTFUzV0d6QzRMcEJFTjZaSFJ4L2NVTFlm?=
 =?utf-8?B?MWdMc05WeWl5cGlSZXZoUmI1S2c1QVRTdysyYTRyNmgzRmpZYys2MTlCTzV4?=
 =?utf-8?B?SFZlZ1FtSzZrb1IwY0x3WmZqeEM1M0VnaXRrN2U1NVVTMnFoc0czL1NxTzEy?=
 =?utf-8?B?SVBMaUFqK1N6RFV0K1F2cERDZE9CNDdiT1ZSdUFpeWlOeHpGMHk5ZG1yaS9B?=
 =?utf-8?B?MFk5TmxxZFNOUENwRStSNElQWjNYTlYvdXFFU05QTllmbUZrNEFrcDh2QkhT?=
 =?utf-8?B?WWliaXNYR1pqY0ttQ3FJUEo4U0p3eC9raDYyWHduMC9RSFdmd21OKzRUeFpG?=
 =?utf-8?B?a3Bvc2VLS1JGT1RiNTJ4NEhaL0JldlhjcUFQUEJ1RjBqOVNWSHM5dHpFK2hj?=
 =?utf-8?B?dVVsbE4zRzJHbmZjOVlGdG5rQ2hEalV6bjdTNGNCTkY4UHhBVk0wa0Q5NVpl?=
 =?utf-8?B?OVI4c2NsY2pFVGc5dlZxdWhaZCtlWlVMVnJyWWlPRG40dkFlQ0htcW1YS2xx?=
 =?utf-8?B?VlkwZi9nRkxCMVN2eU0vTExBOWVjaWdmY3psTkljZWRienpVSktScSs3N1JW?=
 =?utf-8?B?T09tczBSVlRBdldTUEVkQVc5VUlSczFFMGN6VmVyOXNsMFdiSkt5QlNTODBr?=
 =?utf-8?B?ejZBSlo1MDZKeU5zTXdISjRWRFBaQUFEWnZEc08vT2dhZ3JtbzRDbFo2Rk83?=
 =?utf-8?B?U3RFQmxxd3B4V0p5ZldZMnRXUVo2M0NXNzQvZlZPQ1VkMFA4dnFHNWFoTGdk?=
 =?utf-8?B?ZFVxS3grV282SEhYM05LOUEveU1xb3dsQWRkQmhOWWtScEwzTitPK1FwQk9u?=
 =?utf-8?B?Y0o1RU13WWtZUUlNTENuTWtRZGI0N0JoOGFWN2RPY01XVlh3QWNsS2d6ci84?=
 =?utf-8?B?VVNLdElEaFM3WTBCQzFvdmM3V1A3Um5EcEorc2RBSnBTL1VObW50dVoxc1BP?=
 =?utf-8?B?enRwVzlNSXdGMzc3N2NBRk1leEh0VElVekRQOE9PNDdEU2piRktLbmRmOFRD?=
 =?utf-8?B?ZHFUQ1RjMW5GaDVJR1hZQkdKSjVrV2VNV25DVHAzUjdNWi9WSjF2UVBKTW03?=
 =?utf-8?B?RmM1dFhxNXhYcTVIOE41aFdiaHFtYXIxWlNOdmFBc2lrTUZRejZMOWtxNng2?=
 =?utf-8?Q?qtPbJt3T+Dt0fmIavdpYubXEyCdA/la5VZzSg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDRYMkQ5STBqMTZDWGlFR1ViN2xUalRJMEZudUVmeW16aHpETVFubUN5aEpX?=
 =?utf-8?B?NGlyaFZWM1lTaDBQZU5EVFNYdFdnZHE0b1NnbXBXbHJnRFRwQ3A1NTNheUFJ?=
 =?utf-8?B?WHpxcXVMb252OXJ0SzlQUHg3VFRUS2Zob0ZqR21hWEN2R2ZXNmczRnBzei9H?=
 =?utf-8?B?QWJpZHpZVVlJNzFuY2lENVE4T1JRNmRrUWc4dGN0TlBROVhDUExWRVJ0UnN5?=
 =?utf-8?B?cVYwWkp0UU5EdjJWK2hyZEhTRW1YL09pdGc4b1hCVmpaeXVMRE9XR0Y2YWVo?=
 =?utf-8?B?a2YyRGx0WktMV0NhOG90NWJlTCsyeFRaMk5CbDFJY255WUdDTVhERWg2b3Za?=
 =?utf-8?B?T1BtWStzTnZleFhNelptZGxCbG9KMkZRWlFWNzdGNHlicWxKNEdhNld6Nk03?=
 =?utf-8?B?WVQ1cVBmZHBZSWtOTE44Y0I0djNlejJZb1hSL1NlaWFFRkhlS203NXRFVmNn?=
 =?utf-8?B?ZXkvNXJEcU1ya3ErTFNPYWpQRzJkMm02YU1SZ3VmQ2JlNDdiMXRvcmx5Y2pO?=
 =?utf-8?B?YXZBY0F3OFR1WkR6Rk45VnZEam1SS2VUYVNLS0JlZGNnQnFwZ1YvNkh3OUZ0?=
 =?utf-8?B?Nlg4anBCd1Z3MWhMSXlTdDBISGJka3dxNVNQeVJ2eEhZTVE0VjhaVTJkZTV4?=
 =?utf-8?B?OVZLNGVmcWJ5MTVZbEtkQklXWW41QnY3MDNsWEVwdE9WdnZaa1BzUnp5ajlq?=
 =?utf-8?B?UW1pWTUvRUYya2ZGK29yOVI1a0JaaHd0UWFoUXVUc1JJdW9RSy9rbG5Rd3gx?=
 =?utf-8?B?VXN4VVhKZ3hHWFIvSjc3SG5kSVVKdHVROVdFMXoybVJMall3b3dLbmN3UnFt?=
 =?utf-8?B?TmVtZXhUY1pKTmdZTEtoTTJrRnNHdnlNbXAreG1odVJ6dVlDSmNtbkU3Wmgy?=
 =?utf-8?B?TTNNUEQxN0tUMExLdDRGTkVBTjBwTTVmZmJoM002dUFoRGdqbmhMUi9COXow?=
 =?utf-8?B?b2JraTFmT3F3Zk9ZK1JqY2l6ZDBXLzZ3VU9VRURhUmpVdUliRkpVN082SDFk?=
 =?utf-8?B?bysrakxjWEpmSFUrUDE2UUVXSDVCWHo4MlNyRjRUU21NWS80KzlBdDdjT0JP?=
 =?utf-8?B?VFJLc2dLQURoc3BvLzEzR2Z4REVQZi94VWtnWmpnTnFiVkUzbFNPeFRFWFFp?=
 =?utf-8?B?TGtrTlhDc2l0dTFXangwcVV1Y1MzaVFuMDZUMUo0VkRuYzVzWHFacWFBb0xM?=
 =?utf-8?B?V0ZQSU0wU0NveG5Rckl2OUJUU3lySGYzdWx6TGZFL0ZNS2lNaFhENlNTL0hl?=
 =?utf-8?B?WDRqbzdkaFdDbTN0Vm13b3h5YWpLdzVGdlozKzBvbnBoR25yZDNiNWR4RC9r?=
 =?utf-8?B?QW0yL2RkYzlTb2gvSldCOUJ2czNnSWFiNzVVTkkyUEpMS3JNQUtLZmxKRzBJ?=
 =?utf-8?B?WGhZUlpoajBkR091ZSszYWhpd1NzM2VPa0NrbzFTdTZ5YmFoWDVYZTZoMlBL?=
 =?utf-8?B?cnV2NGprUDhrbDN0Uzl0OVNrYzAyZlVMYjNTOTVlQmNtYzlLcnFJOWMvekJE?=
 =?utf-8?B?azh2YjM5Sk83aFFsamdNYmRxcnNmYjlsR1NrYVo0eDB3Sml5amdRQ3Z3SDdz?=
 =?utf-8?B?MGh2OE4zMmhXc2ltS29GRFVzNHFMVytkYzkzb213V2tmNDNZYUJrdDltTGRB?=
 =?utf-8?B?bXRNOFB5TnpsT0VBNUNrQmdmTXdsWEtnR1VIZzhvcGxMZFgzM3pvd2pRWjBw?=
 =?utf-8?B?YmlzY3REV0haV3RyM2s1U3dwVzlOQjFQUlE2aXdNUXZVd3Fvd1F6elVoZjYy?=
 =?utf-8?B?YmJWQ3ZFZUprakNpVFNQN1ZuVGoyN3AxcXBFcVpKQTRFTXJmOFo1Yis0bXhR?=
 =?utf-8?B?dWJVQ3U0cGhnTFlKVTRpS3lhRWswVnB2RlIxcmc0N2Fuc2ZTMzhDczZYc3R2?=
 =?utf-8?B?SG8zQzVuamNYTlFRK2VpbXVualg5cTliSjRDZjd4SDRVTWlsK3hWMUprWHFZ?=
 =?utf-8?B?U2loLzFEZmYrcmtzR1BKTk9hNitiUURiclRJNE92M2J3dGtHdE1vY0hnc1I5?=
 =?utf-8?B?VUhEOE8rWjcwSEFPdjd6d3JDUXorTW9ORG5hRU1BNlo3L010Q0RONURCNVZB?=
 =?utf-8?B?QTFwSURmNGR2MC9aMG5Fd0VhbmVadXVpeVRWbTNaelBnSlhSK0x3SHYzVVRu?=
 =?utf-8?B?ak5SaWRZOXZTVllHK25BbXk2WGRjTWdwUUlZcGU2SjE1UzU2NC9yZG5ldExN?=
 =?utf-8?Q?RgxbJRsUhD8ZEiPMcccq59A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76bdd26-7182-4059-4401-08dd8b8cd11c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 04:25:08.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwOn39HRsRWNLnwO46o4AvJ5mpMAjr7mehM3A5zmdyTH8Temum1zduTV6dZWfo/CFYFlY/ZVdZbyvjizMwc44Gw2Olva4pBqMtpC+EHiz+hPLtP7dJ8jaS+3A5JvW7GP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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

Hi Jeevan,

On 30-04-2025 15:16, Jeevan B wrote:
> Instead of checking only the current modes, find a combination of
> modes in the MST topology that can be accommodated within the
> available link bandwidth.
> 
> v2: move fit_modes_in_bw to lib/igt_kms
> v3: update tag from fixes to closes
> v4: remove igt_assert from fit_modes_in_bw call.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> ---
>   lib/igt_kms.c                           | 30 +++++++++++++++++++++++++
>   lib/igt_kms.h                           |  1 +
>   tests/intel/kms_dp_link_training.c      | 24 +-------------------
>   tests/intel/kms_dp_linktrain_fallback.c | 18 +--------------
>   tests/kms_display_modes.c               |  4 ++++
>   5 files changed, 37 insertions(+), 40 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f3bc481f2..7c7738844 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5046,6 +5046,36 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
>   	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, 0);
>   }
>   
> +/*
> + * fit_modes_in_bw :
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Tries atomic TEST_ONLY commit; if it fails, overrides
> + * output modes to fit bandwidth.
> + *
> + * Returns: true if a valid mode combination is found or the commit succeeds,
> + * false otherwise.
> + */
> +bool fit_modes_in_bw(igt_display_t *display)
> +{
> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret != 0) {
> +		bool found;
> +
> +		found = igt_override_all_active_output_modes_to_fit_bw(display);
> +		if (!found) {
> +			igt_debug("No valid mode combo found for modeset\n");
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>   /**
>    * igt_pipe_refresh:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0381c82ad..fe01eaf3f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1226,6 +1226,7 @@ void igt_require_pipe(igt_display_t *display,
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
> +bool fit_modes_in_bw(igt_display_t *display);
>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
> diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
> index 9e9b1e6db..0152b7401 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -140,28 +140,6 @@ static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
>   	}
>   }
>   
> -/*
> - * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
> - * output modes to fit bandwidth.
> - */
> -static bool fit_modes_in_bw(data_t *data)
> -{
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> -					    NULL);
> -	if (ret != 0) {
> -		bool found;
> -
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found, "No valid mode combo found for modeset\n");
> -	}
> -
> -	return true;
> -}
> -
>   static void do_modeset(data_t *data, bool mst)
>   {
>   	uint32_t master_pipes_mask = 0;
> @@ -204,7 +182,7 @@ static void do_modeset(data_t *data, bool mst)
>   						  "Unable to assign pipes for outputs\n");
>   
>   	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
> -	fit_modes_in_bw(data);
> +	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes in bw\n");
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 6a872efd2..64f21ec6f 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -151,22 +151,6 @@ static void set_connector_link_status_good(data_t *data, igt_output_t *outputs[]
>   							  DRM_MODE_LINK_STATUS_GOOD);
>   }
>   
> -static bool fit_modes_in_bw(data_t *data)
> -{
> -	bool found;
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	if (ret != 0) {
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found,
> -			      "No valid mode combo found for modeset\n");
> -	}
> -	return true;
> -}
> -
>   static bool validate_modeset_for_outputs(data_t *data,
>   					igt_output_t *outputs[],
>   					int *output_count,
> @@ -176,7 +160,7 @@ static bool validate_modeset_for_outputs(data_t *data,
>   {
>   	igt_require_f(*output_count > 0, "Require at least 1 output\n");
>   	setup_pipe_on_outputs(data, outputs, output_count);
> -	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
> +	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes in bw\n");
>   	setup_modeset_on_outputs(data, outputs,
>   				 output_count,
>   				 mode, fb, primary);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index d53b83a86..19df03e92 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
>   	mode[0] = igt_output_get_mode(output1);
>   	mode[1] = igt_output_get_mode(output2);
>   
> +	igt_assert_f(fit_modes_in_bw(display), "Unable to fit modes in bw\n");
> +
>   	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
>   	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
>   
> @@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
> +	igt_assert_f(fit_modes_in_bw(display), "Unable to fit modes in bw\n");
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
> @@ -158,6 +161,7 @@ static void run_extendedmode_basic(data_t *data,
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
>   	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_assert_f(fit_modes_in_bw(display), "Unable to fit modes in bw\n");
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	/*Compare CRC*/

