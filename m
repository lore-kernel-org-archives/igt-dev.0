Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658C2CA6012
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 10:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9D112047;
	Fri,  9 Oct 2026 10:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoJX0Rj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53312112047
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541676; x=1823077676;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ZF+wPecm0UMFqS4gh6vSvQbj/4aiORVl74JnGLmtVg=;
 b=BoJX0Rj/Swzw4tyRQDc6taBkoTBeO7RPKKi630A4Plbfbvc68B3gRJa1
 ENvNvYXemuGnNChreQnMCpWSqdOuLSagD+xNlczMoeQCHFjI88vWfbVmN
 Bo0H7hdlHD6Ezbirm0dZwf2uRu7BfWDZwv1TQr/AhJKEg7QM9Af49t1K1
 vvqs2Q0lnJEfPivBTauzQ9Ww0ru0hY1HgleWipB+dSLXdVs2hio2FcuJM
 63KP6CK5gq1REQbZt0WpR9NIuq8cQLjkaio2zrdOXkomjddhebBeXttJk
 hMftbFnU8DOwH/Evzyzm3g0Hp68Xb1J0KDdmkNx2kkfgptjUU2FL4w165 w==;
X-CSE-ConnectionGUID: fzrJN6bmR3uyvDxXCbbq9Q==
X-CSE-MsgGUID: x3M/ZwaNScuHwqHGyRqYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="223317"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="223317"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:27:55 -0700
X-CSE-ConnectionGUID: rM9MjyQaSAifED3dt4IOuA==
X-CSE-MsgGUID: pXEU0GBZSeiIg09MVUYbaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="271539"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:27:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 03:27:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 03:27:54 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 03:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfmKOBKTn6kyEcuXnlAa1j7GDietqC8aK9eD9y2iAuZonWP+kTaYcElNWgyUkIke62rH4DqnFgWNggF0KTHk1ahu412DggyCfr5Zvsi0UKqkO7cmM+/PemigiswrXwsBXian0jKahj0I3l6R9RSLLpr08LLFed7hWmgY4gnOYAkZXva9kmpb3ys6rmW5MRoz1SCpmKy8K4Z+sdlUTWPgfeiXnY9YS574oVKJDQqcZEnCdKl/syvN1j2A/RceBChKvKYsIFKEV4SFsGIQd93v7+zRCXyxilXiJtG7JwZ6Vz1xsCJTPNDlyQ5rKa9LoxBCmP3tVhaMH+DDx3y4ZWDhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2OP/Cb8M8+5gnuDt3AEJNKKo3Sn/EVVRv/ZutSo4iA=;
 b=dx5cF1NVm3dFWFKWrXkCwvZbti+aJsqqKbDFOmrRNKc/0FAm9Yjsk88XlCW43rR3GNiMDSLYdIVRk+YK3KGJO64inn4NmD8puKXzLjsvz53Yhi5X4ItQHKlrAi3uwk4FQtOiv1QDfF9DG9YjKSdRYBvaChhwfJnFTrwgIm3TimV+xeryc8zL1itaB7Jp0jUstkWp3qeKHS1nfiz+1JLVlgVE54g/3yZSNHuRp0Q6WbVJv8slQM8QsVewd6yVPhC7gz+NiUpYNlybL2yG+/SdKr5c1zsNR9LqjwZnRLXG1E0U7x0eZwF2fNLI7YE0DM2LbMZYEvkSRt0re0wK0o1Yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 LVXPR11MB9729.namprd11.prod.outlook.com (2603:10b6:408:387::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Fri, 9 Oct
 2026 10:27:47 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 10:27:47 +0000
Message-ID: <2c2c8926-42b0-4a6d-81fd-ecb981a41dbd@intel.com>
Date: Fri, 9 Oct 2026 15:57:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
To: "Tauro, Riana" <riana.tauro@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Gupta Anshuman <anshuman.gupta@intel.com>, Jadav Raag
 <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>, "Koujalagi
 Mallesh" <mallesh.koujalagi@intel.com>, Harish Chegondi
 <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-4-ravi.kishore.koppuravuri@intel.com>
 <4e07ff06-6b3f-4d41-ae82-1a1458ceca1a@intel.com>
 <6168ce1c-3b9f-4072-8c23-7b0b3f8e7eed@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <6168ce1c-3b9f-4072-8c23-7b0b3f8e7eed@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0278.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::9) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|LVXPR11MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fc4e45-0295-45db-48a8-08df25eff699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 47ksc3sHPPletrliCHOrWAefNfcBLytbTzA3T3BjIyUNk/dJ8hM1Ym1XWOUFZQhbdOL0ej3EsztKeW5a+6z+AtBEPGUckXaBYHd3ljM40mLZRz23h0EfyMJDnMjKzAhjkrMbIPf9M+/Tfwex4S8WelNtpNK1ClrC+xHZjJSCiz0leo1xMCUAwzH75VxJEhy7GKzbtq3wT4n2WiZdUim85NEoRFtJmUkT2v55argFHxS7/gYs91jVZos8rs1LJgwVghB15S5AfmfCCk8xUpAbHZEvbWwGKen5VK7w3aVTA/AMkC+YSmnoJZ/HIF4YNOhdUagvl5ubwVw5aMoGFvpgMsC+1udTEDEoCOqluXq7Uut0d9uzo0gTyLgASkRZrtBBv3w01Fq9354rtvjTERNorwlR7QueeYDRppEkyMjXgaoxefui/KRGrrwTWPWYsK1nkzKQXVYJxDqh4WLemKQEku2m4RTIL/HJWAXeG1oF3Sb4Fajx5+z+eeZx6+a7m9B6V2iTRr1A+VtmjodXH+UCovt3lXoVt1EvkGJAa3iksVpZjdHaUT57CDxx278D/FiW2O3Q8ZIorgBpJSinvNJtnp9nahIwWTFa6Gf8TbTvMSEYfbc3GaDrnNE0HSrH1H8Z+Ljhrsc2ogVsqgOuKPS6JOGA4gSV/VgtHCyOiF6fn+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U00rNkwxYXZud3ZUeHJCUTdwMEpxcy9jRjRZSEQ0eFRNVm8vaDRuaE5KalNk?=
 =?utf-8?B?MTRUdk4wM3Qya2V6NXE5R2FNelZMV1pkK284a3V5M1JmTklZR0N5OWcwelFS?=
 =?utf-8?B?SWdmdW5HOVFtUm8ySGd0bmF5aGVDT3RENVZTUjhkN0tkSmticXdWMFFCY1E1?=
 =?utf-8?B?MW5qQjEzb2FRdmZLbmpBaldpLzNVVWhLY0pXMmwxUmN4RWZnSTJXU0M4amtX?=
 =?utf-8?B?NURWdWdia0pHRjJ5MkR2QmZGbE9GY21KZUJlTUw3ZG1xZzRTczNKeWIrZkl5?=
 =?utf-8?B?S1g3OHowbGd0MWlhNDlxREFyU0F4aDBHeFR1ZkgyRFU2bkN0bTN4a1luT0Iy?=
 =?utf-8?B?aTVJMldobUYyeGlOT01FL0g5YVJzZDgwNUswRXhNcmxZRFlRUDFYZFl5VkR3?=
 =?utf-8?B?VmpqVlM4MnFobHpUWlZDSUhTMVdyQzNLSTQrS0VyL3FXOXpod2djSER0d1cy?=
 =?utf-8?B?TUk3eUljVUZpWXdjemw4WGI5eFY5YTJQcWRiTGx2dDNPODJEMzhaKzFIOVJG?=
 =?utf-8?B?WDU2b1N4cXFGNWZXeVBBWGhhZGRrM1l5eDI1UjFaRUh5N3J3TU9xd0pIcGls?=
 =?utf-8?B?cGdZM1BraDhJSXE3VHNjU2l3Njk2c1pnN0Z0RW9WcGhsRjNQeTZOdFRGd2dK?=
 =?utf-8?B?TG1zQWlxZHJnSlBIc1F5eHBsZUdFV05sOGlmMjN0NU82UGl0VDNQSWE5MDVi?=
 =?utf-8?B?QnczNHhTeDM5c0IvVlk5eHg4UHpvSklnU2gxckROSndpZWJ2OHR1RkR0OTNO?=
 =?utf-8?B?ZFVERFBEa0crdTRiVTVTb0ZLUnViQk1Na0JQaXBtbllVTmRVbzdlL0N3V2lp?=
 =?utf-8?B?SDRLUDZQQnlLVnpVQndaazNic2hpR1duNlhLVTRqRlg0SjFheVdhSVZnOThI?=
 =?utf-8?B?NUdDNGtJZXoxMlRVTlBDa1pnTnA2Tm1lbnFxVkFka3BCcklJdGQ1OEF1d3pl?=
 =?utf-8?B?bDNwTklKd0lUQzNJUFAwaEtKT3luZWlYSGtaVnE0UVRoclFiMTJBYkNYQld2?=
 =?utf-8?B?bXdVampjM0haUGtWWEhtWEEwNzJZWis1TDFIV0dRWTJRSXF5bDh6Z09pVkRj?=
 =?utf-8?B?a21XaTNGS2haeGl0R2E5MzVKTnZmQ2hQd2YzOTFUQUNNekpNN1pEVGhxYUlZ?=
 =?utf-8?B?bG5pck9OQ3ZPa3FtTEYvZXh1R2tQM1VzSGErdjhXTms2dWkzajNpWnoyS3c4?=
 =?utf-8?B?Y3FJMEpNdFJORzRNc1hncG5JdkVtM0E0WUllMFZ3b0VjZTJua2h1YzkzR1RP?=
 =?utf-8?B?eTY2ZnFEYmZlZE9zN1NsUkc1dmdJbm1tZng1RnVoM1MwVUlYb2FEekxKbDFG?=
 =?utf-8?B?K0ZrSnBzNm5LN1RJSTdtY2Y4OS9RQlZVSHZuYnZ2dXZHS3RXWktGSlpFdjNC?=
 =?utf-8?B?QTRJNHAxdTBERUdsalN6bDIyV3pUcG5RODJ6elNuenltdEJXeWs1WXMxcmsy?=
 =?utf-8?B?K2tJZy9TdEdwbWtrRDQrOEpYdTg2Nkg5UkJPbGRCd1p3aDBqVVNaaTdsRG1X?=
 =?utf-8?B?TWNFUm5IY0FGZUdadGZuNnJqVGpWUjVUTmlwck9sQUYrV1VwZjhaemUrTGkw?=
 =?utf-8?B?dmI0RVl1cjQvRzZoaEtqLzBXdWZod1dURmlRWTRaQ3hFMmJOSjFiZkhUSTFT?=
 =?utf-8?B?MnpQNEhSYmowdHQ4OFNRS2orL2ltTWU5LzZqaytaOVk2Z2RmWnZHclZhSXUz?=
 =?utf-8?B?SWk5NmZTandFa0NhemtKK3FNV0cyL1YwaVIwWlFpaGNKMFRYd3lzL05uNCtF?=
 =?utf-8?B?OHNFTUx6WTlKd1RlaVlDVXFzczI3d1hzT2VIOG9YTGkybWwyT21Rc2x6QmlR?=
 =?utf-8?B?SUd5Yzl3MEQ0L3NGT0Y4azdoRXJiNW5ESS9qQTZZNUN4SGw2ZDNjNnpFL21p?=
 =?utf-8?B?dmJDVk9STTd1SGl6RkZZT1c4d2dnaThKamxJRGIwU2c2QWNPaTY0MmhHdEE0?=
 =?utf-8?B?VVBMUE5qNDVIT3Q0RVJhUTdTa3lNTWo3dUNGbE9XZ1UyYS9VV0toRVdDTnho?=
 =?utf-8?B?N09FeDZ4NEdlTGxUVndQSXBLVklRd2NvRWZ6bDR2NHlTb3JpdVl0cWJrK3Jo?=
 =?utf-8?B?VmEwYWptek9Xa2d5bXlHanFoRS9xQlhUeFdkSDRJQy9YcmFQMUd1WVUrbGVi?=
 =?utf-8?B?ZUNDd1Mwbm5vcFZIUnVIcm9RWlg4NVZOTDBuRk1pR2ZNVUROaTJ2TDJ5VnRJ?=
 =?utf-8?B?b2p3S3BERExsSmdndUx5NThJaTI4WEZGc1JWanBRMmF6Tk11RnJGa0E0WDZO?=
 =?utf-8?B?eUVoMGMwUG83ejF3bjRFZHY2RUpSaWZvQnRBczRxQjErSlFhcHg1MVFJTmtK?=
 =?utf-8?B?Qm15UjJPTVdEOXRuOHkxTlNrcTJaeWlGUXgxbHB4WEcyRjh6b1BGaUEyZ1ho?=
 =?utf-8?Q?Y8SViZdcs87IpvP/9FVN7LLkO90cIvNPa8mae?=
X-Exchange-RoutingPolicyChecked: V4eG8dm7tyUcfXlfJhMcgXMxUubOWjJFwU3UNaguGsD5oHTbEmLe29NkQ6T5fnbCmT4JBhgkOIaHAjbXjmRHcFJna+lc+pgwhZmTbUkNCC0itrjNRbBr3EYuDN+5PMFu+xu45chZydw+vp5jMEOBrtRMHfaS9bd5+6UfV97o29HoYAHlhsFEPS0z/W3k93vii7pQ+hb7IwRcmAVoebSG6H9clYY1V1nfbwAsW1j2stkG5ISUBwJ4E/93g/1NL4aFK/E4XVgd+xghxFkQ2o6js1T2uBQjRf+7WqxP7lRh+67ACNzfCOnyXesclEDR1wSv5RibDQoCUiLL7JueOZXpuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fc4e45-0295-45db-48a8-08df25eff699
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 10:27:47.6961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEj4aH7Ap6nvat3fp/xtTjMnxa2rpq0e+Jm6jxbXp6WMKz1b0U7ffeI5UocbbzXAsCnke4l6FlvZ5fIxjXG6JDeSg8W2HLbRuPQphCUAKEr9kUDFh92sjs4xqQh40T+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9729
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


On 21-09-2026 10:46, Tauro, Riana wrote:
>
> On 10-09-2026 11:47, Purkait, Soham wrote:
>> Hi Ravi,
>>
>> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>>> Introduce an IGT library for communicating with DRM RAS Generic Netlink
>>> interface. Add helpers for Generic Netlink socket initialization and
>>> cleanup.
>>>
>>> Cc: Purkait Soham <soham.purkait@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>>> Cc: Jadav Raag <raag.jadav@intel.com>
>>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>>> Signed-off-by: Ravi Kishore Koppuravuri 
>>> <ravi.kishore.koppuravuri@intel.com>
>>> ---
>>> v4:Renamed library function names prefixed with igt_drm_netlink_*
>>>     (Nikula Jani and Kamil)
>>>     Moved the headers to other commits which are not necessary in this
>>>     commit (Nikula Jani)
>>> ---
>>>   lib/igt_drm_netlink.c | 54 
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>   lib/igt_drm_netlink.h | 20 ++++++++++++++++
>>>   lib/meson.build       |  1 +
>>>   3 files changed, 75 insertions(+)
>>>   create mode 100644 lib/igt_drm_netlink.c
>>>   create mode 100644 lib/igt_drm_netlink.h
>>>
>>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>>> new file mode 100644
>>> index 000000000..709c01987
>>> --- /dev/null
>>> +++ b/lib/igt_drm_netlink.c
> Use drm_ras_nl. Would be clearer if any other netlink in drm subsystem 
> is added.
will update
>>> @@ -0,0 +1,54 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include <stdint.h>
>>> +
>>> +#include <netlink/genl/ctrl.h>
>>> +#include <netlink/genl/genl.h>
>>> +
>>> +#include "igt_core.h"
>>> +#include "igt_drm_netlink.h"
>>> +
>>> +void igt_drm_netlink_cleanup(struct app_context *ctx)
>
> Same as above
>
>>> +{
>>> +    if (!ctx || !ctx->sock)
>>> +        return;
>>> +
>>> +    nl_close(ctx->sock);
>>> +    nl_socket_free(ctx->sock);
>>> +    ctx->sock = NULL;
>>> +    ctx->family_id = -1;
>>> +
>>> +    igt_debug("Cleaned up netlink socket.\n");
>>> +}
>>> +
>>> +int igt_drm_netlink_init(struct app_context *ctx)
>>> +{
>>> +    ctx->sock = nl_socket_alloc();
>>> +    if (!ctx->sock)
>>> +        return -1;
>>> +
>>> +    igt_debug("Socket allocation successful. Connecting to Generic 
>>> Netlink...\n");
>
> Not required. Even if needed use drm_ras netlink.
will update
>
>>> +    if (genl_connect(ctx->sock) < 0) {
>>> +        igt_drm_netlink_cleanup(ctx);
>>> +        return -1;
>>> +    }
>>> +
>>> +    igt_debug("Resolving Generic Netlink family '%s'...\n", 
>>> DRM_RAS_FAMILY_NAME);
>>> +    ctx->family_id = genl_ctrl_resolve(ctx->sock, 
>>> DRM_RAS_FAMILY_NAME);
>>> +    if (ctx->family_id < 0) {
>>> +        fprintf(stderr,
>>> +            "Failed to resolve Generic Netlink family '%s': %s. "
>>> +            "This may mean the running kernel does not expose DRM 
>>> RAS support.\n", 
> "(%s) not supported, DRM_RAS_FAMILY_NAME"
>
> Use short sentences.
>
> Thanks
> Riana
will update
>
>>> +            DRM_RAS_FAMILY_NAME,
>>> +            nl_geterror(ctx->family_id));
>>> +        igt_drm_netlink_cleanup(ctx);
>>> +        return -1;
>>> +    }
>>> +
>>> +    igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
>>> +          DRM_RAS_FAMILY_NAME, ctx->family_id);
>>> +    return 0;
>>> +}
>>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>>> new file mode 100644
>>> index 000000000..0e563e55f
>>> --- /dev/null
>>> +++ b/lib/igt_drm_netlink.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef IGT_DRM_NETLINK_H
>>> +#define IGT_DRM_NETLINK_H
>>> +
>>> +#include <drm-uapi/drm_ras.h>
>>> +
>>> +struct app_context {
>>
>> app_context is too generic for a non-local type in a public header. 
>> Please prefix it with "igt_drm_netlink_". e.g. struct 
>> igt_drm_netlink_context.
>>
>> Thanks,
>> Soham
>>> +    struct nl_sock *sock;
>>> +    int family_id;
>>> +};
>>> +
>>> +void igt_drm_netlink_cleanup(struct app_context *ctx);
>>> +int igt_drm_netlink_init(struct app_context *ctx);
>>> +
>>> +#endif /* IGT_DRM_NETLINK_H */
>>> +
>>> diff --git a/lib/meson.build b/lib/meson.build
>>> index 7248bbc2d..70da9a4a0 100644
>>> --- a/lib/meson.build
>>> +++ b/lib/meson.build
>>> @@ -27,6 +27,7 @@ lib_sources = [
>>>       'igt_device_scan.c',
>>>       'igt_drm_clients.h',
>>>       'igt_drm_fdinfo.c',
>>> +    'igt_drm_netlink.c',
>>>           'igt_fs.c',
>>>       'igt_aux.c',
>>>       'igt_dp.c',
