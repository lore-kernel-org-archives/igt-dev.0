Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D8FC5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 06:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3D910E05B;
	Fri, 14 Aug 2026 06:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEn6+kYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C28D10E05B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 06:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786688454; x=1818224454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HshCLOFsmdmGbXttEbTVxngn+Ih3MqC+b7E44exI+JI=;
 b=fEn6+kYTvmvq/e7umHTtTReyDbuMSj/SM1SdMFzVe3wwZH16R0FFJVOB
 I+2c2AatAa/6a88eHEKEUGE6M8JvFpKJaqAK2Bzj3N3HJKQeJhvGcqhLi
 gLcZ0lHHVNOrWwP1180+IsHT6zcKth9e6Ab7WElaxp9pgiHF3bjYGKcW+
 dgQ7GUJKmUCZ2aAYYqtpbAqIy2jbT0eQi9Sq7cGDYcDRmKRvRImtgtvfq
 /MgBhMy89MqCTG0CJH4T8fgkLfhhGr6dnqy2upafw3e3qJSU95bmbs6yH
 CGP5RA7tv8xX45sAv1EfUHYSxj9iDYd/cccuYmOecE4gWK8zb8xYlomVm Q==;
X-CSE-ConnectionGUID: QiUW48WgTH+TsH0UdHonMQ==
X-CSE-MsgGUID: US2D1BpoQ4mLWM8qYo3wag==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97614342"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97614342"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 23:20:53 -0700
X-CSE-ConnectionGUID: TWthoojTRfC1Tp+b2ZS6wg==
X-CSE-MsgGUID: 76E+Odv7TJegKbiaJEmWRg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 23:20:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 23:20:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 23:20:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 23:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpNYN0DeRpdPmIuu1orPTt427IcMjMhQtq6UuIdw/yufnnww1YEuILndcoIJ7Pej7t0M6wyCtWv6jLXVPScutmu29lHJ0kzBcf2UJcHR2grtwPh/YiD8xUtELv7pWmj7Ftf/b3bjyGnb0wAaUp2aOm7F3KxvakxB/4dFjNV/xM264R9nbkioU38IinzeZF+H8dvpaKLcqbhCAAbdOClT2UESTx53TlX9bvwKsuFmeL2h5dLFdehqPVo5iS+FokXLgqWIAfyQ3iCdHlSQIpeHS6sfky5UfiEmLIsR0X54LuSKB8em7rEUUMXvWKm3Y3xlmpEj5UjQLDZT/0ByNm35tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4Mmo1dvIG4Xw7lmhXqLDnDXga7GstwMHv/2oqqJonM=;
 b=oNiMVP8PfTzp5TV+0og1AhqzmQ9XDC6lnjDfQ9/0MG/73FpBh3kwxLmsTsb3Q+gTqdADxrcGjr22MnEqD/P+KKEWWGU/3P9GH4z+jWxOblxOQGe5vMgT1Uw0sBwYNmiqUGskUEIkJpOjQAsdZGw28CJ2Uv+LAOiyetmWLgNOJR5tSuAbI8TjG8Gb0nmOvNqqd3jg4TFeXruUDhrJLgp/P30KbIxIn13sg26qkj6H4KDDt091LkIZ2BMtEtKt8FSpPBItUCAbxCQyt25Qe/QBhJrEJOAybMg97H8NxeOEbyyk1ztlRnHjIiZ9kQWXTc4gVzR1WctxIWxjlshfvZZg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9204.namprd11.prod.outlook.com (2603:10b6:208:56d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 06:20:49 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 06:20:49 +0000
Message-ID: <dafb89ca-6a60-4d1c-af84-96e0cb87991f@intel.com>
Date: Fri, 14 Aug 2026 11:50:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/6] tests/kms_properties: keep primary plane
 enabled for each CRTC
To: Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>, "Petri
 Latvala" <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Swati Sharma
 <swati2.sharma@intel.com>, John Harrison <John.Harrison@Igalia.com>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>, Xaver Hugl
 <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>, Uma Shankar
 <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-5-mwen@igalia.com>
 <09f130b9-5b9f-4791-ba50-d7ea6311a0a1@amd.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <09f130b9-5b9f-4791-ba50-d7ea6311a0a1@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd3cfb9-98d6-4f45-7a9e-08def9cc2efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|7416014|18002099003|11063799006|56012099006|10067099003|4143699003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: VHosxCXSpulLlrTrcakf5p4HUFr9RxwiNZ4xtzJKyx/mCLfARlhL/3QFKDgyx44NwR6vnGMM2sQne49aydCEOhACYPc75PpSqNkt9nph3fPIN0tylkK4YWCBll3/peqlghbJVoJvom1MkNhcVGKuVYtIsPkUuctkGa9VtWUryx5EpIoRQDIJ60joEnrGsZV96hZx90EO+c10CX9mxwB74aAV5UxK5Qyvc528F/mj+hVPFvWIjZMEXc34C2T6oNBQa38AR4sDxhtAmsYH3J2mYnWlfxi5jZp+F/lzbm89Z2ICKT5akdOkYik1g0CK7aOw7DqT3TiKdxKXKQJdilby4zEp3XN+95iJlI9+8w3Jxp+VjtalVxP2xfYUOCwZJD1sTRYRBD+vPrXP58P2ZQLgTvxWdiYbwmCrr+ZD+VF08ju+NtJCUGH+gjYF4ez3Bk/2IJv7y+LHWK+QlU2T1pbW6CgGlmt2okexTCS9poZVg0MKBtneazwQqs4awm1WGh915iwNuLJxRQm5jYL4PTk4qM9UfUNAS7QuWwzPbHmcshbKQvOL+u+B37wa9oYsG4DgCHZoVkj8MvVHKViA6jHbHTZD4w93fKCyfS5SAPmYwp0Xa6eTc21u6iJ96Rl5vQKH3FGPivDcb8Mwhy8vegRSZ0nfiCDEZTXc3n5S8eKP3BI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkpLdXY2b25IZFlZUnZwSEtldUJvYmFmT3UvY2JVSmdRMDVoSE9iUURQVVFK?=
 =?utf-8?B?dzdCd0tXanpCaDdJV0E5b3NzTEltSWJEU0hDQkF2Z0F2VEtyenN0eE9vZEhi?=
 =?utf-8?B?VE9VSDdaZXQyQjU3VFRWMkdkZ1lzK0N4ZjQ3QkNvNm9yQW94T0NoaytaT0JQ?=
 =?utf-8?B?YkZJV1VTL0d6c1p6Nm4yNDVXb2FFTWZDUFNWK09WS0dXejAvL054RUJ1ZjJQ?=
 =?utf-8?B?Ymh1Unkrc1NlS05XV1dRQmJ4UFRqYk52TnViSVpOV3VyZm9McTIxRWplWFpF?=
 =?utf-8?B?MFNtZDY5TjBuQ2pucGtzYTA5K3VMS1hlbUlGMWZ0WDdrOGVVZ0RtczFNMm1a?=
 =?utf-8?B?cDRPYnIxTkVySHBKNll5Tk5aWHpYMFh5UkVLVjYyZW41dTRRSnNaYjNnVmVo?=
 =?utf-8?B?cE1kWnRjMzJzT2NseTJsalFnbHlOYld1Q1ZVeHIxL3Z5NVpRT29ab2lqSXc5?=
 =?utf-8?B?Q1hoSnRYMGM5NnVLTWVXTUxqL08yTmhWbVhiaFZlSjNGd1dkWkppdXY5TEVS?=
 =?utf-8?B?WVoxTDgwMVlMTHdqTU85OHBRdmI5RjhyNzZ1dnpralRBMFUwYzAvT3hka2Jq?=
 =?utf-8?B?NDdCNXF4akJRNnF5d05oOTY0ejRKeUZSOHFLL0t5VUlscHJvOVdxOEprQm9w?=
 =?utf-8?B?RzhBSEtGZXBPcG5SUXJiSWNrTnJSakpMc3RXVzlpaWlmU0srNnFZVEM4a0g3?=
 =?utf-8?B?d3lDSWp3ZGNEdXU0MitGbHc2R0Z4OHpTeXN3Z2Zwajhkek5sdVRneGJpaFUr?=
 =?utf-8?B?bFVxelgrNDJWVGQvQmV1aDhua3pkMlZmTFpzTklZdTc4cEhvZjJ2UzBzdGNC?=
 =?utf-8?B?cDEwMFZweTVKNnkvcEVqeFE2cjFtTmM4cVFTcmEyVFBCd3llbDBYSWttNEZW?=
 =?utf-8?B?dVdCbjA5eEFmcW1DQlZNWncvQzNGWnoyMXJlQjFQajUxVFI5TXJZKzBqYkRQ?=
 =?utf-8?B?Tks5MzgrVGREd25GM2hqTmZKcFZMd1Z6VmVvZk9ma1dsSUp1QTlZRXdtamRr?=
 =?utf-8?B?VHRPcnp6azlFNzNRc2FYWFRHbHNpZDM4Y0JEeUdRWkhFMk9QeEg4Tld5VWxo?=
 =?utf-8?B?MGhWWVdKRHdURHVncld1N2pjbzNoZjBWU3Y0TjFpcVYrMXBiRUwza1FpcWVX?=
 =?utf-8?B?eVVQdjFHeHdLa0dacEEvZ2xVNHpiK0dUWVIwV2N2U0hOMEhCdllhSjdEbjN4?=
 =?utf-8?B?MXBLMGRLWW01dlBGeGhNT3ZuMWZPOEdkaGtxWXp4dEVDamdJaXdtZjRLNjdk?=
 =?utf-8?B?c1NDTTJTNkJJVmR4MkhadWhRV085N01PdzZITExiVEVxekhEUysrZzdtWlZr?=
 =?utf-8?B?cXA3bEVWUE9xK3ZPeXMrR2txTXVnZkZabzNLSVNJbHRYaGU1TUF6b0U5Y2ZH?=
 =?utf-8?B?Slh1STZidDUxeWQ2KzB4MVRQTVRBOHNuRUtjeFBPWGRqQXBEMmNvZGVzL2RF?=
 =?utf-8?B?VjBXekIzOGQreGJzQUY3eDhNQ3N6Zm9RemlTZXNvc21aNUlEVWtiRTYwSVgx?=
 =?utf-8?B?Vkx2UGxjSzloYXJrUEJMY0k5VnRHaTVwYmw0YzFlRGEvWldDajlDdkZNQjVk?=
 =?utf-8?B?TzNlN20yMTVwalA1MlFoNVZTNEJEQ3JhZVBIaGNqYXlLcXh4bHJtOTVOaytN?=
 =?utf-8?B?VlliUnpxbkprZ2dFQzlPWUh1dTlRMnVGNGNuV0dPMUdiVzUydVk1Tm1UU25J?=
 =?utf-8?B?NkhMWG1vVTZOTXlMaEFva2pGRnZDa3JoclhrenR6djBOR0pva1lqN0c4T1NM?=
 =?utf-8?B?MFpzc3BnZzZBbDF4WXZ0clJiREpkdjZYYjhDbUVFdE53N3h1NFBUNGdRUHhq?=
 =?utf-8?B?ZW5kRENncjY2Qm9SUDd5RUxpaVp1Y3BLcFlwaVBCRDRacWxSeU5qTnpKQzVQ?=
 =?utf-8?B?M1RLVENrWDJieTBlREFVaktqYzRNM1RwRWMyOWl5MXcyMnFIT0dQWk1ncUFZ?=
 =?utf-8?B?OVo1R0YrK0tFQ3pqYlNhRzhUK1FMNEtsVk54N3FjeFN0NE5zNXIySTVtZ1l0?=
 =?utf-8?B?VUltSm5BaXc3bDRGSE9XeUoxTVZMR2h4VFgyNGo3RXBTb0FkZi9sbUQwRWgw?=
 =?utf-8?B?cVNIbC9oWldTWU41UTFuYnpnL1kzbUVUOXphc0xwbzdENXdiOGZnTTZXZjZw?=
 =?utf-8?B?Z2ZKdmtxaHRPZGV6WjI0ZlAvVGNwc1dLVURhK0xJeHBEaTNPdis3ZElzNzU2?=
 =?utf-8?B?RndMUWtzNFFzTmtNdWFseGFKdnFsK1pCNG55RjV3YWNseFBVeVlXQ2IxRDdZ?=
 =?utf-8?B?R0o5Mmx1NHc4Sit1em5RbkFabGlNL3ZQSzNLcSs2bjlEL0xlc0xGRmpFU3Rn?=
 =?utf-8?B?WCtubWt6enlkTEVLQmpvaW9QWC9RNUdQU2VSOVhjMEJ1UXd3MVlsVlEyMXhC?=
 =?utf-8?Q?oRLyPNzGbGWL75JQ=3D?=
X-Exchange-RoutingPolicyChecked: q0kYNyx3n9Pr7gh0+Hc7VZjq95ssqrl0BtDzYRw9S0oiNo2XxVjXHtZQigTMM99j4JcfajXyVxsG1WeEhdAqVvHYeR9j2apgwAzT5FwHINBXO5MytMKGlNmt7ird+5dFpV5Wd7z8KPol/DBcqX4cW8tT90lo6FUUXipg4B2Bpp9AjtjXUW81+oetpJG578+QNp+KUFRXBFC4jb0tMJtQRc/aEDylPq4O4YD9PYLKr4b4C3DzMlm2aRpqzUadaXHYiFpoyAVrXBONJoTi7uPjgFb0iQ5ARXgIXzNgvoqfd+A1VDWipZBz7Kxis1NPTvW8rC8BVdv8AIPGlb/QTyll0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd3cfb9-98d6-4f45-7a9e-08def9cc2efd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 06:20:49.4058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQzN7GWktouQZ5e0n9Zwpvj0h/aJ/S41HFLuoz1JTui+mfIw0f64HHSR3MNEm4WFris/YovqM9TxK2lYXkqoZUtI+eeTLTpMEjatSceSvZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9204
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



On 8/14/2026 9:35 AM, Alex Hung wrote:
> 
> 
> On 8/11/26 08:23, Melissa Wen wrote:
>> For AMD, a primary plane must be active to keep CRTC active. So stop
>> reusing primary plane fb for overlays, give the latter its own fb.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>
>> ---
>>
>> v2:
>> - detach different changes from a single commit (Chaitanya)
> 
> Were patches 4 & 5 a single patch? I think they belong to a single patch.
> 
> Ignore me if this was discussed before.
> 

When I suggested splitting the patch, I meant separating the "needs 
primary plane" change from the "set color pipeline" change.

So I guess the last hunk (excluding set bypass) of patch 5 moves here.

==
Chaitanya

>> ---
>>   tests/kms_properties.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>> index 292a04a2a..87614346a 100644
>> --- a/tests/kms_properties.c
>> +++ b/tests/kms_properties.c
>> @@ -237,7 +237,7 @@ static void 
>> run_colorop_property_tests(igt_display_t *display,
>>                          igt_crtc_t *crtc, igt_output_t *output,
>>                          bool atomic)
>>   {
>> -    struct igt_fb fb;
>> +    struct igt_fb fb, afb;
>>       igt_plane_t *plane;
>>       igt_colorop_t *colorop;
>>       int i;
>> @@ -255,6 +255,16 @@ static void 
>> run_colorop_property_tests(igt_display_t *display,
>>                igt_crtc_name(crtc), plane->index,
>>                kmstest_plane_type_name(plane->type), output->name);
>> +        /* AMD requires primary plane enabled to keep CRTC enabled */
>> +        if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> +            drmModeModeInfo *mode = igt_output_get_mode(output);
>> +
>> +            igt_create_pattern_fb(display->drm_fd, mode->hdisplay, 
>> mode->vdisplay,
>> +                          DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 
>> &afb);
>> +
>> +            igt_plane_set_fb(plane, &afb);
>> +        }
>> +
>>           /* iterate over all color pipelines on plane */
>>           for (i = 0; i < plane->num_color_pipelines; ++i) {
>>               /* iterate over all colorops in pipeline*/
> 

