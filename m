Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756CAC36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 19:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0673810E82A;
	Fri, 21 Mar 2025 19:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiIRmX4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD7010E829
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742585478; x=1774121478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bzfSMrd1oek1d8Wh0x+q9cPbLUsBZ6UlRzCiO7yROyk=;
 b=TiIRmX4Edj9YZUGostqNkTedKbfrOxmXKBMNczzLn9jtylgbEMh5svND
 3xZ+XUbHvreThh27TmCNoxQmnULsAjc8xCIcVCMjP15p/H8XsSrrgyEr3
 vI+Iy+Mv2OasMGW6ea9I8i699f4+OprL5u+3s368jEt1pb/23k6oB5Vv4
 /v+ipLM+cP+QrWbSFBeeBiNyhnndBk3h9NbLULQY7Kh4Yawm3w8GArSJj
 Yx3tb5AfGnkf3SV/wA4ImTDSwHtAX0xJjT3aC75HFLy/IKvysf2bZ8UAg
 zCNVSZ5eBq3rPJ1zKrOrp3wfw3LQj11orFl6GZ3quAFSZ6NHIJaoLuwdY g==;
X-CSE-ConnectionGUID: V/Q4X9XLSFeO5RJWvNCoAw==
X-CSE-MsgGUID: xDHbtnqTSACMndzB3Xk61g==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="44052375"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="44052375"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 12:31:14 -0700
X-CSE-ConnectionGUID: pMtu5GW8TXCVyhvgselxtQ==
X-CSE-MsgGUID: R1EE+ZmgSaaNp/l+Eu36AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="128598753"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 12:31:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Mar 2025 12:31:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Mar 2025 12:31:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 12:31:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntAigpPkAON3Zq9NaGStDozRDlJf4VVzfjzRrJwTbFKR1n/xLcQ/nCYh1/1Oca9f8u3pTZum3u3WKcJJc8HayQyVcPVYC5hLn8qf7Znx1itIxzoii12k59jqD9Px/ipT1ah92XIvghZtwNgGAQyJ6rclFWU9hXpQvvsAMRAxYxrJmibOh6sZtvTJL3nSx+cOW7GKePlv/wR7Ry5fJ1ilsK2PZ15y218ORNIheWS3DE7ca0doB3bDdN3CidBPV1FfljQTrcO+v0uiGL1USf/jqCS9hUZxUkSptgIINNz8+SVZHrtA7hqaj77ohQue+Cq+HR7oj25zcX8klwl8zbKZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUaM4FmehbHU1FPDgEiip52aznDBwE9Ozv8ux19kE0I=;
 b=szWW0QQ9BU9xhhNJksz+InFlAt4ZyVwmsKeYPn+ZI+GemlA7bpN3+oldJ6ICP2KyNKEcvpCDzhgxtjLraUUipcf2P0gWVB3WNVmSEnFGetoRaaHwWLBXFrwcl5br2e5Wib6dUL3HyltEWdxgzGJv+QE2We/Q1GDw6IeWoTM8M7l169Zohl/YtdEKckD8tCrwJo76UjAxr1b85C8USHtScHA6t+8DqnplsMVcND51tQA0vM0c2L4LyljOrXYizF4PidYPXoYh7DnUCawZGrTj2NNT6kjdy5hLqFKYAn576Vp3vtWOhNDU0zKZMnth+B1PewTxlBisaM/zj1+FKeJI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 19:30:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 19:30:42 +0000
Date: Fri, 21 Mar 2025 12:30:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t v3 1/3] tests/intel/xe_pmu: move xe perf device to
 fixture
Message-ID: <Z92+Xz7cTVbj5u+Y@soc-5CG1426VCC.clients.intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250321110958.3557106-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:303:86::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4d0292-adfd-4964-5fa8-08dd68aede20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?empwMWZFcUhLUkVzWkV1SFFZVCsxRVp3OVZhRndDZDVZS3Z2UE80ajFydXNL?=
 =?utf-8?B?QWNFVEUxLy8yMGZMSThIY1BlNzQ3STJleGV0NjJYNkpPYU9EaUQyMWRiNnpJ?=
 =?utf-8?B?U2NrR0JHbVp0T2VNci9xVzZqZ2EzNjZMNWRrc3JiczBqSEJzR3pPQW42WW1V?=
 =?utf-8?B?TjI0WkpyRTBpVXFUckZzNWNpdkZaMzBJVjF4dXlFV3l4MTRtd0gxZlRFV0tS?=
 =?utf-8?B?N1RSVzRsTkg0dm96U2ZWWnBTejZBSEhMcnNJTGJ0QUVJMkRTai9KOWdQWXp3?=
 =?utf-8?B?QmlsdmpPNVVud3J4YWgzcVlENGk0dGx1WTVmMFpBZUdRTzlRN3pyeWRHMjU3?=
 =?utf-8?B?WGhPeVRIVUtoNjZ0SFpaVXJRRlpCRktkSWJSTHY3clNqMEFXSkZuUVRMV0VN?=
 =?utf-8?B?L2RvVlBpMGFiQzJLWFFvd3FORzhNeUV0cTB5RFpGdmxwQzJOT0c2RWdLNnZr?=
 =?utf-8?B?RkcrR3VJR1Vwd2MvSDV1K2NMaCs3UmRLWnJyUFJSR3ZjU3dHSTI2VlVmQmty?=
 =?utf-8?B?K1BmRnhkRUdrUnAzYzhJUWkvUWZSMUUxR0JhL0trN1VxRmIvOE02V2k1SnlE?=
 =?utf-8?B?bE9ubTV3dTVmL21aK0NXSXRYMDNLNjUvUzd2YW51ZElkRnF6Z2NYd01JakFK?=
 =?utf-8?B?K2FMNzNtaWowQ29MelJaKzYvaEFwb2R0dmFsdW5XSXZGUE1WY054OTZhOFhI?=
 =?utf-8?B?TnNYRU41ekRaMGhpQ0dMcG9aZmFIMm9GdVAvbHVqVnNNallrazFkZGlDZy95?=
 =?utf-8?B?S25MYjl3ZzFoaTVXQUtFc0x0RVNPRlpKMkNkM1FxNmhvODFvTDJSS0s1dk9k?=
 =?utf-8?B?V1QrakpibDRYaDJvUEFuS1JIanBiMnFPbC9XWUJRb3YvanMxSDhlSTNUNEY2?=
 =?utf-8?B?aEJSMEUvb0N2WVgvV3Q4ZWlzL3NKaWxVYnRkb2drd2svbGtMNEdwOVozQ3d3?=
 =?utf-8?B?elRkTmhRRHNxK0Z0YUFabmFyZjAyaksyYVMxNjdsaEZvWHZtcDcrZkVtOXh5?=
 =?utf-8?B?YjFCK09ZdmJJSUtPakl3QXZTejFpNFVvczhZUWJnVHdVMllJb3pnTzlsa29R?=
 =?utf-8?B?UVlQRzlScWRXT09EVUwxM0YyUCt4Vk9nWk5SL0MyVTdNKy9jcmJSMm8zR0k5?=
 =?utf-8?B?WFpjYk9wRi84THZzb083TGhJYVZBUmY1Z2M2eTlaM3piQlFHVDQ4MXphWFla?=
 =?utf-8?B?ZmxKdEVJeDFpSG1SbHRENFcxY1pqTWlHS3BTSHlhRllnaFdENUdKOEd5Q05q?=
 =?utf-8?B?azExUmd5SGVYTmgwWkVmbFJxSTZFUXNWbHJNeDY1Qjg0bFVIVkwrWlVUenk4?=
 =?utf-8?B?NnVaeFR0UERqTnVrajF3SWZNY2tqaFkweDFtcTdVbUpuVFYzemg2R1ZveldZ?=
 =?utf-8?B?L0Rsc09jSWVUY3hncTU2Q0RQS0h6L1Z2Nkt3Z0d6M043OERscGgwWFFVRDFj?=
 =?utf-8?B?WTJ1aG1TUTRlQXlIK2E5azNWRjVzOVdpN0ViYTF2UGRrbXhRMWFaMVR3U3po?=
 =?utf-8?B?L1FWNFI2dFAyS2paa0cyZU9LR0VxSjlWOVJmaG0zQTcwS3JXZmo4enhzSTNi?=
 =?utf-8?B?b1l1U201YlFRYVpBZ3ZFTkRHQkFHVzE1OStXVGF3Mm4zbUlzRk9TSVlPSkFK?=
 =?utf-8?B?Vy9QRnZ6SXlqVit3QTVpQlE0TXZmN3BQS0tVMk5lcm9XRFdHdzNwR1Y2cmpH?=
 =?utf-8?B?b3hqVTJ4RmNWaXkvRldqdURlN2ZaYzgwRlNmcnN3NGR1TWFMUk9vWUlya3cy?=
 =?utf-8?B?bTZLRDhyOHVBTEYvUWVFb3hHZHdmM1RsUlBCcEo3UGMyUm56Q2hFZC8vNE5B?=
 =?utf-8?B?Y1VYeVI2Qlk3RTYxYTJEWHRIV0ZhYkpFTkZaaDFFS3h6VU5DUThUQXNDREkr?=
 =?utf-8?Q?m6OI/oKt5BM/W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lHM3QySkt6cXhZbFhlNEZTNUNZQ0dsRjJBaGlDYUtoYnBvd0lQa3doT2Yw?=
 =?utf-8?B?WnNlSkxxeHA4WEdJQi9Dek42bmd3c2V2YXJDRDlNeXdZU3FQcElrQS9YZ0lw?=
 =?utf-8?B?eXFKN1FwSUdlWGIwRytJREZaZ0IzamxHYlZBaitQSWcvSTRFaU9hbDBHOU43?=
 =?utf-8?B?aE9DMXNVSE5XRko4ZTY5SWlIdW95aU5kRXlUalNNeGpBSE4vWkprem1NRVJO?=
 =?utf-8?B?TnROQ0Q3OEFLNU50Vzd1V2ZjbWJTdDc0emhaTkY3a2w2Z201ZmdadXc1M1RH?=
 =?utf-8?B?NW1pUEFuZVBhSGd0R0k0WmFFKzZQZVhEb1dySW9QeXFuRzNmLzJOWGY1Qmdu?=
 =?utf-8?B?cGE3Uk9DK1FtWU1Da1BGakRXTEpCY21MVUxja2VVNDZ5RExxVm0xNEtCTXoz?=
 =?utf-8?B?dDE3N2V1WUxhVE1jcWRIaDVUaUxCbVlMckw5czZSUzRJa3NYOGd4dWhhR0ll?=
 =?utf-8?B?aGRQeU1VL2laVk5xdWZQZ2NRekZqMHMxSnZsMVBNMnU3aDNLTUpQQkJibS9W?=
 =?utf-8?B?MnZIVlFLTzlhK0Z5dk9SemlWT215UzlnWS9GUmp3enJXdDRmRUppVFZyWk9Q?=
 =?utf-8?B?NlFBVGFPMDF4UENrZTB6NThOV0gwL3RqSjRFTHFqbVZsallDRFJBZGtUeU42?=
 =?utf-8?B?a3UrVFZTaEQ0eTVwSmw5Lzk3QmdQSkNtTzZ3bmI0aVduV2hwOXFSNzRSbk5X?=
 =?utf-8?B?cFVwcUV4YkRpeXNOVVZMbWtmZkFJVHl2UWJNYXQwUGFqOVVNSk1od2lUVjJp?=
 =?utf-8?B?Rm5NejBiMEE3YWtOcmI5R25CNXcxY1h5M25GeFlQMXR5RGt3NlNUNEJPNi9Z?=
 =?utf-8?B?cjJYcWpWSkpDUllUUndGTzNlUm4yVzJtZ1JyNGdmRkZLbXF6ZVBoMlVsM3g3?=
 =?utf-8?B?bHBXYzQvazZYWitlK0FiUTlQNktBT3hkZFRMVC9ZdDZrdHd6OTNPS2RzMWdi?=
 =?utf-8?B?cjhMTyt0OGhOY2hUUCtWWWg2RHdaeThIWTRRQWxPNHRIZElzZEJkQ2xraFF5?=
 =?utf-8?B?NnBNL0pvRjFDK3dJOFV2TWQxdTBEc2crMk9RcElXRFVZUkI2UThYZHlRSjZL?=
 =?utf-8?B?VVZ0bndZWjFpd2NjcTRoM1pQeWE0V29MMWMxbjczbGhaT2VNdU0wZlRHZmU4?=
 =?utf-8?B?ZXFRZHJVK21SZzBUZytTdlBWclRONGpoK3lRV1B2aEd2NTlDZkZnMUVXQm5W?=
 =?utf-8?B?cUw0UkNOZGJPL01oYUFJd2NFU2krSHlTYmtsNTgvVGRkemxBQnNsb3NNTlkr?=
 =?utf-8?B?SVBsamxpYXVPRVVvdkwzN2VPZ25xVDdPTnlYdFRsNk9rWkVGajJLQXkrZjl2?=
 =?utf-8?B?VCtWalQ3ZlhIZHR3SkZYcXk1SHo5Mk1hOE9RcmFvTG1SN1lrV1RzQUdJbGdz?=
 =?utf-8?B?YjdtaGhid1pEUnJzWXpQeURVSWo3Wk11Y2pyMm0vc0oxUnI5OW10OC9Iak9s?=
 =?utf-8?B?RTRBdk9FM054UTlVODhzVVh2MnRjWTlDM0orZVM3d3RaNTZjUm5qRk11a1hR?=
 =?utf-8?B?eEZWSzR4WDl4b0VqNWtvRkVIV2xJZGdNOXB5V05XQVo2L3RvWHUxUHFUZ2Ra?=
 =?utf-8?B?MW5JdFIwU0hOcERqa1lTUnNBNGZaeGtENEdYa082UXdMaUhvQ1owRWdidTh2?=
 =?utf-8?B?NmU0anRka25RVHFvZ1ZuOGVpQkVxYUVBSkNtV1gwVjl3VjVFSkJ1QjN0MUpp?=
 =?utf-8?B?eUtMMi90U3V2SG52cDFXTEJuT1JwMHJXU010SCt3b21CQVBlbVRXQjREbjds?=
 =?utf-8?B?TXlaaC9vN2QwZHZoVXJFM0FaZSs2bllBUTE1UHBPcCtSdzQvdWtLR1RDdzNH?=
 =?utf-8?B?SHdGYkRESnRaYWhIMzQ4NmNGUGoybkFySnZ0aW1kRk9UdW0rS1NXWXpDUHQ2?=
 =?utf-8?B?RStMQThvZCtPUGE5OEY3NEJ0dTIzcXYrRUN1czRUWkFBdmxDN1pWL1h3eXZ6?=
 =?utf-8?B?N0xrbXFqRkhXQU5VeElDdmJQRGFYUEdUdTZaVVZBN0M3NHZlUmhtZnBmY25S?=
 =?utf-8?B?VmZ2OHMrSktnVS9JeHRVWFIyM0Z6Zm54SElPeTQxTW1mb1I2L2liYURWOE0r?=
 =?utf-8?B?ZENHSUgvdEN1d245d09QWVROZ1hKUmdPODhMYm1EMy8xLzlVZDJOck5CMk5o?=
 =?utf-8?B?Tjg2R2JVUHg2TnM2ZTNyR0ZvSFlTYlQwN1RMWEVGMm9GS1puelhCeThGYko3?=
 =?utf-8?Q?KPq0U4rSHLyUKUMMyCNA39w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4d0292-adfd-4964-5fa8-08dd68aede20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 19:30:41.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSp5cC36HEMWwJsXCcCIonNZVwcxM6tTR5ZwXJmUNy6hosO+bGLfTi3/EbYtE7l6+8+yLjlESxnbZAPLOe6a5r69Ty+r2pVr2vnw4vp46u4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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

On Fri, Mar 21, 2025 at 04:39:56PM +0530, Riana Tauro wrote:
>move xe perf device to fixture and re-use instead of
>initializing multiple times
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_pmu.c | 20 ++++++++++----------
> 1 file changed, 10 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 66edf24ad..f0959abe2 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -26,6 +26,7 @@
> #define TEST_TRAILING_IDLE	BIT(1)
>
> const double tolerance = 0.1;
>+static char xe_device[NAME_MAX];
>
> #define test_each_engine(test, fd, hwe) \
> 	igt_subtest_with_dynamic(test) \
>@@ -92,7 +93,7 @@ static unsigned long read_idle_residency(int fd, int gt)
> 	return residency;
> }
>
>-static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
>+static uint64_t add_format_config(const char *format, uint64_t val)
> {
> 	int ret;
> 	uint32_t shift;
>@@ -105,21 +106,19 @@ static uint64_t add_format_config(const char *xe_device, const char *format, uin
> 	return config;
> }
>
>-static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
>+static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_instance *eci,
> 				 const char *event)
> {
>-	char xe_device[100];
> 	uint64_t pmu_config = 0;
> 	int ret;
>
>-	xe_perf_device(xe, xe_device, sizeof(xe_device));
> 	ret = perf_event_config(xe_device, event, &pmu_config);
> 	igt_assert(ret >= 0);
>-	pmu_config |= add_format_config(xe_device, "gt", gt);
>+	pmu_config |= add_format_config("gt", gt);
>
> 	if (eci) {
>-		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
>-		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
>+		pmu_config |= add_format_config("engine_class", eci->engine_class);
>+		pmu_config |= add_format_config("engine_instance", eci->engine_instance);
> 	}
>
> 	return pmu_config;
>@@ -144,10 +143,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 	uint32_t vm;
> 	int pmu_fd[2];
>
>-	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
>+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
> 	pmu_fd[0] = open_group(fd, config, -1);
>
>-	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
>+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
> 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>
> 	vm = xe_vm_create(fd, 0, 0);
>@@ -202,7 +201,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
> 	uint64_t val;
>
> 	/* Get the PMU config for the gt-c6 event */
>-	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
>+	pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
>
> 	pmu_fd = open_pmu(xe, pmu_config);
>
>@@ -233,6 +232,7 @@ igt_main
>
> 	igt_fixture {
> 		fd = drm_open_driver(DRIVER_XE);
>+		xe_perf_device(fd, xe_device, sizeof(xe_device));
> 	}
>
> 	igt_describe("Validate PMU gt-c6 residency counters when idle");
>-- 
>2.47.1
>
