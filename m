Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED4CC5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 22:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719BA10E7C6;
	Wed,  4 Jun 2025 22:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WW57khCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850B210E7C6
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 22:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749075875; x=1780611875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UGZa/k2NtzVTLeTrsn8EIVq0JVpxtju5SEvSjj6lc/k=;
 b=WW57khCDcFkmu8qDcNmFmVDD5Vtbsmbg9K20D7wA7giuU4oP8JqP/QGg
 fGTifD/+J9F+QC0SomaOhTaZEOvKC33p/EIhr/pFxgTQ/PD3UtmNjuZdX
 fU5dd7awer4ZUWHSReqS5GPH9xGxHPIUBFAdt+cNTfpug9zdjIAScHAPT
 +Mrk4uaroaVQMMP5DS7r4HzeSJbZMqXkVo456O2cg3w/GX8NuChMWamsZ
 Kigs7feBw+2y7CrRhJuqGjChZ+6I9bafU5qp68dZYqj/rIr8sQr1puMNP
 HiUEIG9vJNkkoHEuIMpB+dcqqrR18CSehfU04n23WG4L34IHXQP7aUQwG w==;
X-CSE-ConnectionGUID: Dnxa/+gxS9OqgcEcoz4p3Q==
X-CSE-MsgGUID: uM2gT8SORnKfbyHc0uvsrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61798475"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="61798475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:24:35 -0700
X-CSE-ConnectionGUID: 2vVE3YloRNeQj5dpJ0uaig==
X-CSE-MsgGUID: 3I1VP1LLRkyXTkC55FJn2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="150594192"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:24:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 15:24:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 15:24:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.49)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 15:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPzsBDBFvp9nT8WAx79le8EKEBKJOtH3AF6RWHoPa7je3hdctKlcm4oUghyyvgxV5MShWI8avpoCZj3O1BSQFDHSmxrXrnChy2Tb+nlOS9nQRMPbS/rDjSn4CLOVEu88SAxeeM0wbRTDcDJ770K5Pf/yQsXUBi15+aQy7Fhc+TOof48xupgsho4sVypPMf9/IIf5VklkMvsjcklBvhDAelpoyNtnJ3GT+9GN0ljlXQVTpI9PN1hr7n7GxlYL24/xf2vHFo8ZKa2cRodfjEnLB67vkuACblXXeTRPhHCh4v1q/xqbC2OZMEbV1Um6uGnqMDFM3vdKOQrb4H5NNJccQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGZa/k2NtzVTLeTrsn8EIVq0JVpxtju5SEvSjj6lc/k=;
 b=taP08iYFczf52BP9IPCEN6CS4KbEJN8YxruE58uj6xYbXVK3lQzavN6Kn/0OJIIH540mK6JZB+i4J6xQ3yFVbC/H9LjtXwOUGgG/0MNCnCEqwXzlJwxnj8Kt9+FB5uDk7FFcNpxcmb6XhnA4hy/RYeDFYGOjAMd7F0lceEincnr7FuvxhsEQu4xFSEXs2mDQBVrxGhr2VarAfF2V/Lyd66ns/32e/+cWg3ZH5uMJjypwast6CzDcVQMIK6Rn42QLdMcuJt82MNyaiF3JDc9nnlT+M6unn9kniwcsa/oaeO/3pMgjLGVUzPLGXID5DaMHZuafx2vdFtAxN4WUf3u9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by IA1PR11MB7822.namprd11.prod.outlook.com (2603:10b6:208:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 22:24:03 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e%7]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 22:24:03 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Zuo,
 Alex" <alex.zuo@intel.com>, "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: RE: [PATCH] tests/intel/xe_vm: Fix assertion of batch buffer size
Thread-Topic: [PATCH] tests/intel/xe_vm: Fix assertion of batch buffer size
Thread-Index: AQHb0PiWt9yZwgiHsk+PVuei6+yi97PwCg6AgAORKtA=
Date: Wed, 4 Jun 2025 22:24:03 +0000
Message-ID: <BL1PR11MB5447B3843B5939BC506B9EDBEA6CA@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20250530001844.703844-1-shuicheng.lin@intel.com>
 <20250602155001.pc7j4tzbkxanrn3p@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250602155001.pc7j4tzbkxanrn3p@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|IA1PR11MB7822:EE_
x-ms-office365-filtering-correlation-id: b8652ffd-93ad-4192-d869-08dda3b68315
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SFhUK3pUbVVyb3F6bXQ3TFdRWW93TWFLQlV6OU1XYzR1RER1dllMSDl1enNU?=
 =?utf-8?B?cWthUkhVWkhpaHF3ZG5FVnd5eHc5bzlRQXhHWThFcXhEK0xwKzBQemdMckdm?=
 =?utf-8?B?UXpPU3F0bWFZSTU4SHlOVzVVMGFKK2hoQjFTZ25GTDFFdEJETUJBR3NUK092?=
 =?utf-8?B?a3NValhKSXQ4Y01VWEoxOE9WRnJzaHJVbmY4ekMreldTdjNqTFJFditvMmdM?=
 =?utf-8?B?aFJNV2FTc0FXeGhjVVNCUkVVbnhlenppbUNJMWNvQ3BDOXA5cWNTUDhyTjNw?=
 =?utf-8?B?NUFId0lVYkwxOWlIeDNUQVMwZ2pqbEJQQ1NvSUhaME0xcWwwYVNoeDN2d2tJ?=
 =?utf-8?B?b3kwSnBsNWgxenNtVzRnZWdXSjkvL3UrUWRhUnMxbTJBVkxnT3BkSEl5MWQ0?=
 =?utf-8?B?M3A1MitGSlRMeDNYdzU5L3lpeVdJR200dFVvd2FMR1hIZVUwc01Lakx5T1Fa?=
 =?utf-8?B?a2NDSjZSbmlaQklZbDdHVHUxcWR4ZkFLa0lia0lQS1lycW9hUXZuc2NROUpx?=
 =?utf-8?B?amtvRWJlcGcxSGdTS3lQZ1BQYi9KVk1JVi9aeXpRNW5YK0lDMW9ZSDNuekho?=
 =?utf-8?B?ZHVvL1NHYThxWG9RWVVXYUp5bjdBelV1aUx6NGlEcnBTRHBIVWJ4Y0tkWlI5?=
 =?utf-8?B?N3hQNG50MjJnSlZma0pUNVZMZ2w2U2J4VUs3RkNWMTBMYlNwZGdrVGxEd01U?=
 =?utf-8?B?RTVob1dDWk1mZUlXcStENFVzUU01YkZ1OFB1Wk5BQVFTMTVoRTlrWU9Memhw?=
 =?utf-8?B?d2tUUnNFTXhVbThrcFUyaDZGL2RLUkhFZm9LMVNTUkcyd0YyVDlVcUJxSDJw?=
 =?utf-8?B?TzZLM0djRTZsREttVnpUWjlNUmxXVEVzUENUV1BqZmZreUprWTh6OGRxbXND?=
 =?utf-8?B?aXBHNXNFbFdoUFNLMHRmL2FOTmJGT3Vmb2pRTk5EZGhFZEI3SW1LMnVyUktR?=
 =?utf-8?B?c1Yyam1jd242dHVVN2VORk96NXB0ZS8ybk5FcXF4dlpvQXIwVjJleGorK3Nm?=
 =?utf-8?B?UFVkU0NjRk12WVJWSmtXb205K01xNDlveGFnaVBkUVVUQUh1SHR6MUNkVmt3?=
 =?utf-8?B?SUMwTVdXaDE3MDRtbkd0bENrdDFhQkVQbFY5WWgwWFpFb1crSTBJY2NraXla?=
 =?utf-8?B?aTB0R28rSklKaUtvVGo3clBWdkF4d1pBK05SMGxMRHFYY1JiOUxjN3pIRlc2?=
 =?utf-8?B?TnhzYzdwYUt0R2RiSEl1MjRnWjlJQ3RCd3hxVzJMbmx5UkFCSTZIc3hzRUo4?=
 =?utf-8?B?dHUvMThPOUEwTFNSM29pN0lUNEMvQmFtYXMyYmxadHQyaFltTnNLZ2lGUEdE?=
 =?utf-8?B?WkdWbjViOG5hbVlrZHl5ckhpMnBwblQ3UVRjTkVuWUtzY2hua2twN0xUL1BN?=
 =?utf-8?B?NTFvemtnQ1VVZGtmeHB0S2R1N3A5SytYNUFBN1VBSWJvblZPWlRLdm5PUmhE?=
 =?utf-8?B?bVlBWkF2TzU5UnhMN3FDRVVSbkNyOW8rN3FBK2VYNXA3c29HWEY0aDh2SUNM?=
 =?utf-8?B?aVY0a2FwTzJNaDhQWHhrZkE2WmhReGJJajM3aHBvN043aTcwQ1BBd0Fobng2?=
 =?utf-8?B?dlkrbnJNeDNyMUJhSVM0aHNMSWFMK2k1SWx2cXp0OS9WM20xa1hUeUhDckxY?=
 =?utf-8?B?MzJUb2RxaXFobWtqTmFENTJybXNFT2dVVVFqNnUzZHpjNm1vdEpaUzVlWm9m?=
 =?utf-8?B?ZzVGWk9rcjU3UUg5QkxjUmY4bVNlVTlPSHRDVFlmYld6Z1U1eTcvVHdmeXR1?=
 =?utf-8?B?RVBJTTJLOGxGWVBxVE9RQWF0aUh3SWxnbk9NaVRqbUZrdGNPVmg4eDFVSU5a?=
 =?utf-8?B?VGJ4ZXlWMlkxK1VJYy90UHhxSzZVQ1hCSjh6eGFNVzlwdVFWaFVuTjhYL3ls?=
 =?utf-8?B?d0RDcnlDRU9oZHkrQlpnU0FZOEZOalpOcWlOVExtOVlPUXlLdWVDTUlBUEVJ?=
 =?utf-8?B?M2FNamJGVG56ZkxCb1NReEg1bU9QVmRHenhaajhJQVZPbUFLeXRiSnBFVHBo?=
 =?utf-8?Q?cuXo3MH7KVPyBF7bhwa1qx4HWfYuPs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmdlV3V0VXAwZHdxa2hubDJWWERBbmRmbVVZRG5XVGlublRNZFdIV2wyVkF1?=
 =?utf-8?B?Qi90VUdoWVZEWVd4WUhGS1pTRGwzUmM2eEY3eElzR2hRb3IvYXQ2MEtaWjlz?=
 =?utf-8?B?Z0VQLzVQY3JPUWxSeDdTYmI1RnJMajFzQmkyRGdWTG5kYUUzdExTdzlQeFI5?=
 =?utf-8?B?em94dDVUUHlMbTFHR2d3OVFScTN3bnRVNVRwUVdneGNQb21mdGlrUERQR3ZG?=
 =?utf-8?B?VS85MjlVbmNiVHg1YUlvWm5ZUDRuYmhUcEtZUlpvWXdPbnJnNG1PY0wwbFdq?=
 =?utf-8?B?Z3J6UG9mWDUvdkJzdEFDR2I5M2g3TE0vVk9CS2g3ZU9uY0NCMVVmQ0xuK0Zi?=
 =?utf-8?B?cUJPSEVDM1JtTnpRQm1wY3N6TnZzNUllYzJ2WkN4N3lVcFBwTk9DVTZyMXEr?=
 =?utf-8?B?amdKSTBzclJLdHpFRU8wOGZoa3lZSzBWaTFlSWhHcG5DU09WR2VxWGUrK1gw?=
 =?utf-8?B?d3hlSHR5YlMxTXkvanJ4clZ5cUh4OEJjbW5kV0pjY3dvdkgwT2pDYW5iQWxo?=
 =?utf-8?B?UDlZNXZxalorVEtHYzVTdGNuS2dYVUhlOVdLVi8xZFJqRFUxcS8wVzRYSnlW?=
 =?utf-8?B?T0ZGSEYrVzJtQWVGSWxhdjdpc0RiZ3lvY0ZHLysvRFYzdDVtQmtMSW4zOWpZ?=
 =?utf-8?B?eXVzdW5OVTdvcVhmQ091NG9YbloyMFd0U1czT3RGZEU2VllkVFBQZ2hLV3JN?=
 =?utf-8?B?azV6K1luYlUzVkV0SGZSVXYyS2d6b0NlL3pCQWIxNDlDZURGN2JQeGdJV2h5?=
 =?utf-8?B?QlY3Z0NOUzlOay9mVmVhT2ZpU1BQSjI3TlcwTHVMRHErWC9hRFdMdlg5ak9u?=
 =?utf-8?B?dlJEUENGY3NxMXprYzA5ektBdmFTVmtWRlMxNDBML2dzbVN6QzQvMjNYemdN?=
 =?utf-8?B?V0E2TnRYenVad0RyaysrNEJHejdQQ0plQkMwOVB1ZlZ2Qkx0WXNFeHVPTGxo?=
 =?utf-8?B?YWlUVlRJeFhuYXJuUmF2UEN0ZXBIUmlaaW9WNDFJTWcvY2lmdTdCS3VIN1Qw?=
 =?utf-8?B?VVBlWnh0OE8yQXlWYkFGTnFMSGtrSFAyTTZDbUVhODI2THljOGVRbkpWdE5M?=
 =?utf-8?B?ajdiUm5wM291M1psMDhKL0JpWUdFUC80QmNyK2d4alpNVVFxOUJOZ29FaFEz?=
 =?utf-8?B?clFxeXpJQ2QzdHE0SWdLc2IyV2lWWlN0TzlQUklHbEZ4d2tqREFPRU1lSDNy?=
 =?utf-8?B?Um5aU0RibFhJbkk0WmdjMjBoaVYwUEIrOGhCS1JvSjZtMkhCNVAxODJlcWlO?=
 =?utf-8?B?ays5TW1RUDlPSmpIaHFRb2RZTXJISDkyd21Yc1FDK0dEZ015OHFxWHVTc3cy?=
 =?utf-8?B?MWVGWXNPZlV5Y2MzVTlyenFiQlV4VHkyRnNzK2NuYWlnaXFtWVJMczFhY1Qv?=
 =?utf-8?B?SzZhckxnVVp5ejU3NFgzTDRFdFRhSlA4bWV5UGtENVVlaldwbytuV3pLUTJI?=
 =?utf-8?B?NytCZmoxYk1OOUtoa0pIekpmTHBKT291Snc4cFdocGxaS0FZUXd2eVJ4R1c3?=
 =?utf-8?B?Z0czcE5NZHdnazNvYlVmNllJRVBGNmx6VUxaUEVQSmM3RGhJdzFyczRteE1m?=
 =?utf-8?B?L2hYR242VCtwajM3TWNxTlE4T0RMVnpaTE9Fa0VKT1NLRmErWG80RTZVcFhs?=
 =?utf-8?B?eDVsV1FRM2FCZ2czUFBCdDc0Y080OFk4aWJEOHRYU1ltcmI1TEtSaHFNUTZD?=
 =?utf-8?B?bHJFUzJZUTJmSjk2a214SndJTGhMWUZjKzc3Wi9oZWVpcWxPSkczRTZTZ2tZ?=
 =?utf-8?B?S3dkU3BobGxna2hTNnRVUHFEYlhNZ1RLRXc0YUl3N1hieXY2UUNCbUpWcWw5?=
 =?utf-8?B?Ukd2NVM5UU0wbzBGNFVucUNjK3Z2d1BTc3dnc0ZhNlJkZWlwOWdrT0ZPdE1u?=
 =?utf-8?B?WHF1ZkFBYWJpaGhwcEg3dUFpTXJ5MEE5NzUzNGZrYTJCRmFnMlVFN0REY2Yz?=
 =?utf-8?B?L0VyZDI0U0c0WHNycEM3dEdZTlA5c1lQeE9PWTR3VGNIK1I0RXp1TkV5eXlm?=
 =?utf-8?B?ZENaNWVTWDBtbkpYVEJRdHdEdHNsTGxWaTNhdmlmMXZzbmFienI4a3ZSR0Fl?=
 =?utf-8?B?bm5FeG4ybGR1ajZxUDRrTWZqZFN3ZVdyVThxZmRyT0UzRkxFcW5oMDJRclkx?=
 =?utf-8?Q?VKPvY0jychPnzgSR+JioOX2mu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8652ffd-93ad-4192-d869-08dda3b68315
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 22:24:03.4610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixRx2rxBqZg+TkyJurEEIbA8kSyU2eqGXlsIdBcxQHvm6fgFe5npHnY6/X8AU1V2cXpFEViQvZzECTKaKAhkyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7822
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

DQoNCk9uIE1vbiwgSnVuZSAyLCAyMDI1IDg6NTAgQU0gS2FtaWwgS29uaWVjem55IHdyb3RlOg0K
PiBIaSBTaHVpY2hlbmcsDQo+IE9uIDIwMjUtMDUtMzAgYXQgMDA6MTg6NDQgKzAwMDAsIFNodWlj
aGVuZyBMaW4gd3JvdGU6DQo+ID4gVGhlIGJhdGNoIGJ1ZmZlciBwb2ludGVyIGlzIGRhdGEgbm90
IGRhdGFbaV0uIENvcnJlY3QgaXQgaW4gdGhlIGFzc2VydGlvbi4NCj4gPiBGaXggYSB3b3JkIHR5
cG8gZXJyb3IuDQo+ID4NCj4gPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlA
bGludXguaW50ZWwuY29tPg0KPiA+IENjOiBBbGV4IFp1byA8YWxleC56dW9AaW50ZWwuY29tPg0K
PiA+IENjOiBab25neWFvIEJhaSA8em9uZ3lhby5iYWlAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiANCj4gT25l
IG1vcmUgbml0LCBwbGVhc2UgcmVwbHkgdG8gQ0kgZmFpbHVyZXMgd2l0aCBDYyBnaXZlbiBpbiBp
dCdzIG1haWxzOg0KPiBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiANCj4g
WW91IGNvdWxkIGxvb2sgaW50byBmZXcgb3RoZXIgc2VyaWVzIGFib3V0IGhvdyB0byBkbyBpdCwg
Zm9yIGV4YW1wbGUgc2VyaWVzDQo+ICdVcGRhdGUgImZvcmNlX3Jlc2V0IiBjb2RlJw0KPiAob3Ig
Y2hlY2sgbWFpbGluZyBsaXN0IGFuZCBzZWFyY2ggb25lcyB3aXRoIHJlcGx5IGZyb20gZmFpbHVy
ZSkNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2lndC1kZXYvODcwZGI4MjQtMDRkMS00
MjQ2LWJjYWItDQo+IGRmZTJiYmQwMjNlZUBpbnRlbC5jb20vDQo+IA0KPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9pZ3QtZGV2LzVmYmIwZjEzLWVlMGItNGRmZi1hNDJkLQ0KPiBjNTc1Mzc1ZmM2
NGVAaW50ZWwuY29tLw0KPiANCj4gTm90ZSBhbHNvIHRoYXQgcmVwbHkgY3V0cyBtYWluIHRleHQg
dG8ga2VlcCBvbmx5IHJlbGV2YW50IHBhcnQuDQoNClRoYW5rcyBmb3IgdGhlIHNoYXJpbmcuIEkg
ZGlkIGNoZWNrIHRoZSBtYWlsIGFuZCBpZ25vcmVkIGl0IHNpbmNlIHRoZSBmYWlsdXJlIGlzIG5v
dCByZWxhdGVkIHRvIG15IHBhdGNoLg0KV2lsbCBmb2xsb3cgeW91ciBzaGFyZWQgZXhhbXBsZXMg
dG8gcmVwbHkgdGhlIG1haWwgdG8gY29uZmlybSB0aGUgcmVzdWx0IHdpdGggbXkgZnV0dXJlIHBh
dGNoZXMuDQoNClNodWljaGVuZw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiAt
LS0NCj4gPiAgdGVzdHMvaW50ZWwveGVfdm0uYyB8IDE0ICsrKysrKystLS0tLS0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfdm0uYyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMgaW5k
ZXgNCj4gPiBiNWJiYTdiN2UuLjk0Y2NhMTNiYSAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRl
bC94ZV92bS5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfdm0uYw0KPiA+IEBAIC0xNzE5LDcg
KzE3MTksNyBAQCB0ZXN0X211bm1hcF9zdHlsZV91bmJpbmQoaW50IGZkLCBzdHJ1Y3QNCj4gZHJt
X3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiA+ICAJYWRkciA9IGJhc2VfYWRkcjsN
Cj4gPg0KPiA+ICAJLyoNCj4gPiAtCSAqIEtpY2sgYSB0aHJlYWQgdG8gd3JpdGUgdGhlIGZpcnN0
IHBhZ2UgY29udGlub3VzbHkgdG8gZW5zdXJlIHdlIGNhbid0DQo+ID4gKwkgKiBLaWNrIGEgdGhy
ZWFkIHRvIHdyaXRlIHRoZSBmaXJzdCBwYWdlIGNvbnRpbnVvdXNseSB0byBlbnN1cmUgd2UNCj4g
PiArY2FuJ3QNCj4gPiAgCSAqIGNhdXNlIGEgZmF1bHQgaWYgYSByZWJpbmQgb2NjdXJzIGR1cmlu
ZyBtdW5tYXAgc3R5bGUgVk0gdW5iaW5kDQo+ID4gIAkgKiAocGFydGlhbCBWTUFzIHVuYm91bmQp
Lg0KPiA+ICAJICovDQo+ID4gQEAgLTE3NTAsNyArMTc1MCw3IEBAIHRlc3RfbXVubWFwX3N0eWxl
X3VuYmluZChpbnQgZmQsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpl
Y2ksDQo+ID4gIAkJZGF0YS0+YmF0Y2hbYisrXSA9IHNkaV9hZGRyID4+IDMyOw0KPiA+ICAJCWRh
dGEtPmJhdGNoW2IrK10gPSAweGMwZmZlZTsNCj4gPiAgCQlkYXRhLT5iYXRjaFtiKytdID0gTUlf
QkFUQ0hfQlVGRkVSX0VORDsNCj4gPiAtCQlpZ3RfYXNzZXJ0KGIgPD0gQVJSQVlfU0laRShkYXRh
W2ldLmJhdGNoKSk7DQo+ID4gKwkJaWd0X2Fzc2VydChiIDw9IEFSUkFZX1NJWkUoZGF0YS0+YmF0
Y2gpKTsNCj4gPg0KPiA+ICAJCXN5bmNbMF0uZmxhZ3MgJj0gfkRSTV9YRV9TWU5DX0ZMQUdfU0lH
TkFMOw0KPiA+ICAJCWlmIChpKQ0KPiA+IEBAIC0xODA3LDcgKzE4MDcsNyBAQCB0cnlfYWdhaW5f
YWZ0ZXJfaW52YWxpZGF0ZToNCj4gPiAgCQkJZGF0YS0+YmF0Y2hbYisrXSA9IHNkaV9hZGRyID4+
IDMyOw0KPiA+ICAJCQlkYXRhLT5iYXRjaFtiKytdID0gMHhjMGZmZWU7DQo+ID4gIAkJCWRhdGEt
PmJhdGNoW2IrK10gPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiA+IC0JCQlpZ3RfYXNzZXJ0KGIg
PD0gQVJSQVlfU0laRShkYXRhW2ldLmJhdGNoKSk7DQo+ID4gKwkJCWlndF9hc3NlcnQoYiA8PSBB
UlJBWV9TSVpFKGRhdGEtPmJhdGNoKSk7DQo+ID4NCj4gPiAgCQkJc3luY1swXS5mbGFncyAmPSB+
RFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+ID4gIAkJCXN5bmNvYmpfcmVzZXQoZmQsICZzeW5j
WzFdLmhhbmRsZSwgMSk7IEBAIC0xODc4LDcNCj4gKzE4NzgsNyBAQA0KPiA+IHRyeV9hZ2Fpbl9h
ZnRlcl9pbnZhbGlkYXRlOg0KPiA+ICAJCWRhdGEtPmJhdGNoW2IrK10gPSBzZGlfYWRkciA+PiAz
MjsNCj4gPiAgCQlkYXRhLT5iYXRjaFtiKytdID0gMHhjMGZmZWU7DQo+ID4gIAkJZGF0YS0+YmF0
Y2hbYisrXSA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7DQo+ID4gLQkJaWd0X2Fzc2VydChiIDw9IEFS
UkFZX1NJWkUoZGF0YVtpXS5iYXRjaCkpOw0KPiA+ICsJCWlndF9hc3NlcnQoYiA8PSBBUlJBWV9T
SVpFKGRhdGEtPmJhdGNoKSk7DQo+ID4NCj4gPiAgCQlzeW5jWzBdLmZsYWdzICY9IH5EUk1fWEVf
U1lOQ19GTEFHX1NJR05BTDsNCj4gPiAgCQlzeW5jb2JqX3Jlc2V0KGZkLCAmc3luY1sxXS5oYW5k
bGUsIDEpOyBAQCAtMjA1Niw3ICsyMDU2LDcgQEANCj4gPiB0ZXN0X21tYXBfc3R5bGVfYmluZChp
bnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ID4gIAkJ
ZGF0YS0+YmF0Y2hbYisrXSA9IHNkaV9hZGRyID4+IDMyOw0KPiA+ICAJCWRhdGEtPmJhdGNoW2Ir
K10gPSAweGMwZmZlZTsNCj4gPiAgCQlkYXRhLT5iYXRjaFtiKytdID0gTUlfQkFUQ0hfQlVGRkVS
X0VORDsNCj4gPiAtCQlpZ3RfYXNzZXJ0KGIgPD0gQVJSQVlfU0laRShkYXRhW2ldLmJhdGNoKSk7
DQo+ID4gKwkJaWd0X2Fzc2VydChiIDw9IEFSUkFZX1NJWkUoZGF0YS0+YmF0Y2gpKTsNCj4gPg0K
PiA+ICAJCXN5bmNbMF0uZmxhZ3MgJj0gfkRSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0KPiA+ICAJ
CWlmIChpKQ0KPiA+IEBAIC0yMTE1LDcgKzIxMTUsNyBAQCB0ZXN0X21tYXBfc3R5bGVfYmluZChp
bnQgZmQsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ID4g
IAkJZGF0YS0+YmF0Y2hbYisrXSA9IHNkaV9hZGRyID4+IDMyOw0KPiA+ICAJCWRhdGEtPmJhdGNo
W2IrK10gPSAweGMwZmZlZTsNCj4gPiAgCQlkYXRhLT5iYXRjaFtiKytdID0gTUlfQkFUQ0hfQlVG
RkVSX0VORDsNCj4gPiAtCQlpZ3RfYXNzZXJ0KGIgPD0gQVJSQVlfU0laRShkYXRhW2ldLmJhdGNo
KSk7DQo+ID4gKwkJaWd0X2Fzc2VydChiIDw9IEFSUkFZX1NJWkUoZGF0YS0+YmF0Y2gpKTsNCj4g
Pg0KPiA+ICAJCWRhdGEgPSBtYXAxICsgaSAqIHBhZ2Vfc2l6ZTsNCj4gPiAgCQliID0gMDsNCj4g
PiBAQCAtMjEyNCw3ICsyMTI0LDcgQEAgdGVzdF9tbWFwX3N0eWxlX2JpbmQoaW50IGZkLCBzdHJ1
Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiA+ICAJCWRhdGEtPmJh
dGNoW2IrK10gPSBzZGlfYWRkciA+PiAzMjsNCj4gPiAgCQlkYXRhLT5iYXRjaFtiKytdID0gMHhj
MGZmZWU7DQo+ID4gIAkJZGF0YS0+YmF0Y2hbYisrXSA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7DQo+
ID4gLQkJaWd0X2Fzc2VydChiIDw9IEFSUkFZX1NJWkUoZGF0YVtpXS5iYXRjaCkpOw0KPiA+ICsJ
CWlndF9hc3NlcnQoYiA8PSBBUlJBWV9TSVpFKGRhdGEtPmJhdGNoKSk7DQo+ID4NCj4gPiAgCQlz
eW5jWzBdLmZsYWdzICY9IH5EUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4gPiAgCQlpZiAoaSkN
Cj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
