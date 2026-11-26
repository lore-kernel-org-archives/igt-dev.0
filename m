Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B829606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bhklwh5Q;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HsAESMTv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043F610FCBB;
	Thu, 26 Nov 2026 07:14:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8608B1120D8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795677110; x=1827213110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lRLCcyPiJ58ewgwpVOtlG03XYTZLLvXlaDxjxvXC85o=;
 b=Bhklwh5QfYZSjIRH5wn7j2lxAH8kR1OuJ7JJ/Hn/03q905zCHKguRqnM
 SHBh2MwzwrW5Znub48KukjR+k4ZgvxyAFBQ2qrV7tktqK5GHZE9iOD8bJ
 nRh2SjhEs3A8kpoa+/kEDgza25kQvJRLCdxp3PxwR9LpLGuBZb96MG73B
 aE4S6wRkdhhYafjMp7skSUl3/CgpYyIZS2mqjwOzSHcEPYjaNzvhxJBHv
 OGnG8wBTiUDvuqZJZGwWaL1Jn6NoTi/aI/jE++GX6RGFJUTprx8nxLPr+
 SMnoR32mGHzykumTPTbncto5USKHD/hb3zEIeArAGO7RlExFwRR51/q6S Q==;
X-CSE-ConnectionGUID: SPSJFxS7SraebttmpP4hLg==
X-CSE-MsgGUID: ytDJeOy/SuGCe3cAQiAduA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462020"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462020"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:11:39 -0800
X-CSE-ConnectionGUID: BaQxInSFQriTdXF4STmzfw==
X-CSE-MsgGUID: IfTx7VgHQAKWyDbBNvO8lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12091147"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:11:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:11:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 23:11:37 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:11:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gikt4UcBZyX0mu9bdsU8FzhD5FL15gu1Rw2UN3BxMbzGMJ/2l7kw2UA89MRyvZsjDxPwf1v+bfJLswZtdp4d6bCC9Z8g/BEZ/r/8hqL8VH3tubmKjHkPt5fS4fuJtI5Ooa3edPTcpF1SSp/Jsra1vYHAeTE5uGVmsqMDt9mUB0ktNfdvPiZdnrvIvGM4WCUbYsoTY4BrUAi6g1hzHNQGWpJETrUcLuzLrvLosQ5cykd7IAgAYRXwTBZX4fDj15n1/tIlhKsqJxuR3P75esx3eu5eHreJ8sSwitqosPTwM25dfGOWoIkz+1ohjgA9EnrgKxZ4yEQbS9a7edRqwmaVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdCfeb8xTymdDkDNRTBwpSGImDppz/3p8bQsG89EMhA=;
 b=F+xr1Bf6lh9rFlAfzr70w+VO6/db6sKfBwjqFwfYHf6oJVBdk1i06zV5pEohKJQM4QHxxOMl5H8g1p+SkTYkAU9fjVNC45Uy8ni3d+4smOjCv82auh9LtYV6FHF4fTY48MH42p35Lh60dIqLTLD5QjS6D8yAXUaLtQDiR9metU81IKeMrSm0IwLXly/37tZKEqCWGVCgy0Us2qNtHcuQwdsvBPVHaVeWEjCXYXNBQbqwl5jN4TJNXE097n7TqfMn4RIklTVgqLmy6uR7uvPXnlMruYmAxA0TG2vthD1Jgf955peSlN0wyKQttCqWjwGLbJpdT6PPPx8kpun9GhlcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdCfeb8xTymdDkDNRTBwpSGImDppz/3p8bQsG89EMhA=;
 b=HsAESMTvjmsCx5hMXBlntTHfC7ZKn5t7Bsm5QPGWQ4XDD2Kr4lIz085cC8os/3Beo2SYFcQB4z5jXJkXaT7PapHY1rkZJCRv6dY2EqjBWpmHUo9tUQtOuHi7CqZMj6JluzGPfs8s6MupuzSTLkTPTzJNKGqusckU2nMUzwhrRvE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:11:33 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:11:33 +0000
Message-ID: <c46e1253-b037-4353-98d0-89be36f04f5e@intel.com>
Date: Thu, 26 Nov 2026 12:41:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] tests/intel/xe_oa: Add an exec queue variant to
 the unbind/rebind test
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
 <20261104005505.3232485-17-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261104005505.3232485-17-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0347.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::19) To DS4PPFD24E991EC.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::52)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: e09a3695-eb7d-4162-ca5f-08df4b8c8053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 8hFy72sYhRFJ8d/tFAl6pgPjyXD1cN5n9EZPZ2DvYguHIBl6b5LMwHBs/nCBvTbxPmPPEpvP2GX/aQGubZw+yeeovDfLCUQeUdc2ZkbckTsVCnqWnKoC+gwVY2b7jfougJak6wXLrsm50lQiUNQDDtAZDbv3PubwzjbiLlpsGXYCCxL6HtgMAkwpMXp4Ye7i15hfsZDeoY08JSjNcLEi6pl7O+15eRJKQ0vlOvHCeQXRBlgXk0Yp91BlFKltPmdRShhl0qoqSXm6UYnLgK72jAZe9aHBsTlxH3Vco0tKF+rRI29vDQDcT8bQQJ+Lvs4ugLC+5co9NFWYbhCyolnEVYAgko6rLpy/nbvx4bKfmw8qgEDeghZ5h8Low9gsAzVQSGTZXiYTqEdyjRN2rEXOLIoVloi7I4AXPjPI4OYN5UEcsb9IjvVKLnNO1lE5l7h+WYwofLcgHr+iLsBgh56Pvt7JuF27Km81MD3xegCPId7jhKyDwf84Hr5b0TOQpAc+PQfnphIjSdCSvHrDWOq9BrdsXxy7pTRIEgyFszcJwIkYW5XMCMqTmRn8RVpECUWdMhl4qL53TlS+NU0ENsbS+RqbrGDtaipWA4YG0ZNtbMYnLMR+S4imHpmm8PmKMnRkp974JkDqcXRnm/JbSbm6cFMPeATAhErgyh0h2Yoj+MI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZSthaFZUdTFQRjBDQTJOVDBLdWMwVFVGbnJzVmg1cmgrdXE0VlhleTY3d0ww?=
 =?utf-8?B?SW4zeHEyRXIrZ09UT3gyZi9kREk1M0NvWWx2cGhnTDVIRkRoM0ZJYU5iUHBh?=
 =?utf-8?B?NldiS1dvMS9DRHR1RXJlR3BKQnFIeWdNVFpJVHkvMTdzNkYyemNlVW01NDM3?=
 =?utf-8?B?QndrRFBKTmZOTFVRTnVjeUhaUDh6WWl1MXRuNXJtRU1CYy9wNk4xd1hYeVk5?=
 =?utf-8?B?TDRPdWs4UVJLU2x5ZjRtY1Y1aE5zWG1UN2Q1eEpJNWhyc2VtdFBFVVdEd1ZY?=
 =?utf-8?B?NGdtTGtBRmpVUHBqamtTOXMrVjFzb3V4M3JTdXBFVVJSUmxYV0dDVkdpa0FJ?=
 =?utf-8?B?c0VXZVdmWlRGK1hsZDhob1c5ZnFXdTRGcThoeWRzRTNFZjZRazFHbE9TVEJJ?=
 =?utf-8?B?WWFreTc0MHdvN2NUUU1QRG9lK2ZJTng4WlpOOUVoN2hGOExJTmU5KzV4UzBC?=
 =?utf-8?B?a09Ua01GdVhZaFZJdVlXNFdtRWl1TDlhNHhMdE0zQ2E3OXBhRnRIdEZwUG5U?=
 =?utf-8?B?UUwwdTR1LzR4dEVLZkpORFJFWkN3d2gzSSs5R2U3eUExS1ZDbWU0Nnk5Rklk?=
 =?utf-8?B?V1FRNW1VUzZ5VU9KY2I2ejM4RjVpVlEzVkNKYUlqaDFMcHNITVZBWTFjVFg3?=
 =?utf-8?B?Y2FDWTNUcUNRYk4veVhPcWRIV2lGcGxaU05YeEZYMmo4K0ZlTkxOTUJjNk9v?=
 =?utf-8?B?NS9mZVhCdFJiYWVLS25QYk81QUV3VkxqaUR5dWlPb0hnMytPWkorN0ZaUmlz?=
 =?utf-8?B?QlJvVWcweFpBcVNoeDViOVd3NlE1M04yUjMwT09NRU9XL3h4Y0lka3hHREdw?=
 =?utf-8?B?Zjk0VDQxUXQvSWpoa1F5ZHJUdmp2YUtZYnR4bUJnby9VeWExZVlGYVdwSEVZ?=
 =?utf-8?B?WGtqNmppL0E5WkE3VjhLaXB2aGd1RENseHlSOWhEQkR4NUwxNmxNMGdSdEFE?=
 =?utf-8?B?K2x5anF3ajV4SDdJemFiSStZTDZCd1JveC9KNG1LVzE5Vlc4NmFxejlMdVFB?=
 =?utf-8?B?TXlERnI2Y2h2QlllMTZIYnJTamc2UGQyZGYxYUJndXZYZk5nNUpja0NhMU4x?=
 =?utf-8?B?d0dBNWs2dllkUXUyTVdqa3VkczFRMjNNZFBBYWNXUFh0WWdxOGZ6bThGcHMy?=
 =?utf-8?B?UHBFOFgraFd3ZHRRbmFHUEdOUUtiTlJ1RWtaak1rZ3FYZ0ljMG5xaUdhN0lP?=
 =?utf-8?B?TzNvcW56TEV3TVpBeUVwZWdMeWdvQ1RDV2E1UHhrbHBiOUd2VTRGbVkrYzk2?=
 =?utf-8?B?eGtHbmNLQjE5cjRIbzBtVDlQZFVSV3drUi90bGFFSldPRm5yT3lYRGFQN294?=
 =?utf-8?B?UFFiUG03T0pxYzRxR1A3VTR1eDVqcEJ4bkhDMWY1bng5ODZKalMwMk5TSnFl?=
 =?utf-8?B?aU0rdlFlN2tNV0Q5RFB3UklVMG9Va1doS09oa09aNjNWSVdMVGs4OCs5OWhX?=
 =?utf-8?B?bk9KM2ZSZUJXeGZZZHVHb0dWZUJRdkdtaGJXalF0VWxWdTd3NzRjQUxIN1lB?=
 =?utf-8?B?WlNIenlCajVXOUJWamdFQytETG43NVhRN0h6Q0JGa2krVHpqdTZTbFFyN0Rj?=
 =?utf-8?B?TXQwWFpVc0Nwby9FV0N2NE4vT25RNm0yZHlRWHRwTmw2aWp0S3RzYmVTVmNE?=
 =?utf-8?B?VVM4cG00Y0tNcTBlZ2szTzE1RXJnZS84d1R2UWZFcnJRakFsMHQ5aEU2RnJh?=
 =?utf-8?B?Y0NWWDd1SkVBYmJKT1g0amh5RGpRTkVBd2NxSm51cjBBRVRxZTNmbHZPckRv?=
 =?utf-8?B?QWZIb0xvdXROazh0bTRZMkFyK05IdzlwRFkxYnBTM2ZERkhzWGtvbzNRajVl?=
 =?utf-8?B?aVR5OTc2VGhqeGZoNS9EMFpEZm9UeGhqeWgxL0hSa2RIdEtMR2NnWHR1dlM1?=
 =?utf-8?B?VXNZRDlBOXQ0MTZkRWtFOWZreDljd1luSnJ3aHhrMW5KMnllMUd0MlF1MTh1?=
 =?utf-8?B?cy8wcy9WN2tnS3JVVDIxZHowSjFWK1N5S0pxeU0vVlI0S0xrV3lFZUFRTVpG?=
 =?utf-8?B?alBOcWZGTlB2a2o1U0FLSTc3ZTRXRmx5bVlDaDRYVTNnM3ZxdVhES04rZC9r?=
 =?utf-8?B?andrRFJ5bUpBUTM2Q3FSYWs4MWR2WVl4WklEQTVQUVJjRGIyWlIyaTFlMGcv?=
 =?utf-8?B?TUF4WnM4VllldDQvNGRlblFkWjM1bHd2UTkveWpYM24zbm5Bc3RoZjliWUZ0?=
 =?utf-8?B?QXIwcUVmNFBZLzVjRWp1TlhkanMwemNWSE5DY0o1dGpNVkZjR0VWQUlYMXRt?=
 =?utf-8?B?TUNscUdHU1R6Yis3cW9EZ3dyc21ucDhhQTlpTUpVMjFKcXUwc0hxZkZ2K1Fn?=
 =?utf-8?B?b1hVbEdJSTRxWUZab1piQlQxTitlc25ZbzgzMnlZSk1CSkdsT0EyUT09?=
X-Exchange-RoutingPolicyChecked: Vh0FQ0nnVfUYok10VpSq19bIH/bsaewgOkbPgXG41iV2wyXW1ZdLyLXHcQlg2jqbXocHb06PS+g9wyy6iVh7bmaN8Jw+Kd7BO1LXl2OmWPJof9gz2En9fc1bJ157TOOYyyvh7s7SWZwJuONmlZQ1EI6f1vXcMMl7RDNF1Hqci6mhIOMrITXVL/JLP7LvxN/xc5itwmRffG9o/DIrjnfssMNkOlv3WBsmzqUU156SQtipNc868BpH6fvkBuhwSu5LGs8REqB1lJZnEKcaVnUii34jdT09nOvudhC3REvNwM1e48EiqrRFdZaPjDeDsm5hG8DXpsYyPn+ev2Vf9NNPSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e09a3695-eb7d-4162-ca5f-08df4b8c8053
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD24E991EC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:11:33.7028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eN/IrKbsI7iLwQMzWX8+F8Ouf+I2z5pNMdMM0GM7SdyPvP/6b5P0QSs5MJSeTT4N6Xh97Xi4CIItKLk8p7deBO0g1sDoPOVp9RpssKqRopg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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


On 11/4/2026 6:25, Umesh Nerlige Ramappa wrote:
> Open the stream on an exec queue with preemption disabled. Unbind then
> also restores the OA context state with an LRI batch on the exec queue
> and restores preemption and timeslicing.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   tests/intel/xe_oa.c | 28 +++++++++++++++++++++++++---
>   1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index f1fe5f44c408..ffc1971cb361 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2866,6 +2866,7 @@ static bool mem_is_zero(const void *vaddr, size_t len)
>   
>   #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
>   #define UNBIND_STREAM_DISABLED		(1 << 1)
> +#define UNBIND_EXEC_QUEUE		(1 << 2)
>   
>   #define UNBIND_MAX_STREAMS	16
>   
> @@ -2898,7 +2899,8 @@ static bool unbind_waiters_started;
>   static volatile bool unbind_waiters_stop;
>   
>   static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau,
> -			       unsigned int flags)
> +			       unsigned int flags, uint32_t exec_q,
> +			       const struct drm_xe_engine_class_instance *hwe)
>   {
>   	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>   	uint64_t fmt = test_set->perf_oa_format;
> @@ -2923,6 +2925,14 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
>   		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
>   		s->properties[n++] = true;
>   	}
> +	if (exec_q) {
> +		s->properties[n++] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
> +		s->properties[n++] = exec_q;
> +		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE;
> +		s->properties[n++] = hwe->engine_instance;
> +		s->properties[n++] = DRM_XE_OA_PROPERTY_NO_PREEMPT;
> +		s->properties[n++] = true;
> +	}
>   	igt_assert_lte(n, ARRAY_SIZE(s->properties));
>   
>   	s->param.num_properties = n / 2;
> @@ -3140,14 +3150,22 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
>   {
>   	struct unbind_stream *streams = unbind_streams;
>   	struct unbind_stream *primary = &streams[0];
> +	const struct drm_xe_engine_class_instance *hwe = NULL;
>   	bool disabled = flags & UNBIND_STREAM_DISABLED;
> +	uint32_t vm, exec_q = 0;
>   	int ret, i;
>   
>   	igt_device_get_pci_slot_name(drm_fd, unbind_pci_slot);
>   	igt_debug("Device %s\n", unbind_pci_slot);
>   
> +	if (flags & UNBIND_EXEC_QUEUE) {
> +		hwe = oa_unit_engine(oau0);
> +		vm = xe_vm_create(drm_fd, 0, 0);
> +		exec_q = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
> +	}
> +
>   	unbind_num_streams = 0;
> -	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags);
> +	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags, exec_q, hwe);
>   	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
>   
>   	/*
> @@ -3185,7 +3203,10 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
>   		igt_reset_timeout();
>   	}
>   
> -	/* Drop all state of the removed device, the drm fd also refers to it */
> +	/*
> +	 * Drop all state of the removed device, the drm fd also refers to it. The exec
> +	 * queue and vm can't be destroyed on a removed device, they go with the drm fd.
> +	 */
>   	oa_device_fini();
>   
>   	igt_set_timeout(60, "xe bind timed out (wedged?)");
> @@ -5691,6 +5712,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   			{ "close", UNBIND_CLOSE_BEFORE_REBIND },
>   			{ "open", 0 },
>   			{ "disabled", UNBIND_STREAM_DISABLED },
> +			{ "exec-queue", UNBIND_EXEC_QUEUE },
>   		};
>   
>   		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

