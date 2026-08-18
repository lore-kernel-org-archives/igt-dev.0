Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D851C5DF70
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 08:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7B710E0D2;
	Tue, 18 Aug 2026 08:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCGXoUyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A3C10E0D2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787041862; x=1818577862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=IOSOT95lAGs5Gyn4HxeV6Fvg8OokqvfQB1sOo2Oy6iM=;
 b=DCGXoUynk4yu+flqbTzwp6pdmulstVbRd5UCzOonv12HwqpMcTuZ8pWN
 Q0+kuAvKXRS594b5ugxiNwI2wGT7oOcqKy0Z3igW4iRlj778J+My8VL0s
 8QXo/J05ez/eMZcxQJLS1qZOTHSna0ZxaOzzkHmvHcJsyFwvwqmIEOQdi
 y/aIqZoEoOHfaSeViIFwTUrTB/0X4jeXF58YQEVxZdK1beSgvbTf/nwF5
 h5edt04nBLDN0gWb0Vm6w5dfdzhCDPWVHtrEiJSTIdtICB8nsz/vOIhni
 rJaMNxl76NOpWiiOxlggkz6VItop3opUiBjH62QqbbjgYXYk0py0HSO+R Q==;
X-CSE-ConnectionGUID: IHSGCGsXTiit9/Udfu5m0Q==
X-CSE-MsgGUID: 8O6TDGXQSYq7vg42v9MbhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98194358"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208,217";a="98194358"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:31:00 -0700
X-CSE-ConnectionGUID: 72uYZXmqSn2MHDbGilmUVw==
X-CSE-MsgGUID: htJ+ubThQzmBIypQWhOPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
 d="scan'208,217";a="265195193"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:31:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:30:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 01:30:59 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:30:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5OaCxBx5ERBCKklMj38IVtk+dJnHS8owF1107Lshv7pIAi/VZA2r0MMw5UKi+g1h3OZXMUX3LxuUSgFcHGbn8x8A5YSVpK8W7x5JFzbeWHEXqJUxHZC/NznRlR/W/rxM3rY/H+KrHxB/Xuyv4zJjGgr8uwViThBbFC7Vei88ScmmQSZpwiT5rpvoT3ljhE1cUBaIDrbWE6Flbspa2ToXjz1sdon7QtrvQ6u7mOPW2pQSDEP0G75AnV1TH2ikVZ+Wk60W6iBYcmrmizwozj7G8CvnMPJap+mHHi43a+QhV8xHfCXvufynK13ugYzO5ZqyZoVz6cab3hPwDWMbzasfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPc4JnUB3Ti40tdSqAhADWJ7fnqKBtIe07LbL+ixH5k=;
 b=N4VDMFYjXS5CkU/cGPsvZOx0OiDPtXA9sxNfuF0/Ct4i84d3blHyiVHN5triclA8eksNIk1H4J3LZ+oAC5RPXoHwfeBZt40hfwzptV/jUhhkaoCHJjhdn6XGtpJr3cPSPsQyMm1E9HRBQC1+kGuyo+W5YGer3mGPl8kL0RzjxKl2fhk0ZqdXOMnotqgIUwjLjmzY4K3ogD8RzzJC9Ce8keYe3xCI460TLBCBP4YHR1M60EfgQb4zrHlDIDMhyDZ23nrYylxqMAKR2jzI7iRm3VlphJ++zIzU5xqcCJ4ja8HSNwbCEKQ9OcQD5Htd+QLyPz+bYBT3r44aEMIQyxQtfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:30:53 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 08:30:52 +0000
Content-Type: multipart/alternative;
 boundary="------------TEZaCAQ4TZHnlNdbEhjVm3ch"
Message-ID: <35f33ecc-9a74-4533-8bb3-d7274a21a3b4@intel.com>
Date: Tue, 18 Aug 2026 14:00:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 07/16] tests/kms_pipe_crc_basic: limit #crtcs
 tested during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
 <20260807224746.3554064-8-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260807224746.3554064-8-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5P287CA0337.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::13) To SJ0PR11MB4926.namprd11.prod.outlook.com
 (2603:10b6:a03:2d7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: a09e846e-85d0-49ac-b0e4-08defd03039d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|3023799007|8096899003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: S6PQpKK7KZZ6O51CkhWkPVkOHEuiR9j+N5slBaI23CQM5rA5Z3Edkt6MejObcRow/dhgz6cf5y3ZjK3w4ce+liHrxgBW3SsomKQyg5OQhRM7TKwohF/ZqAZ5Veos1Cvlg5OfMr0WIOfA6lyaKiZLwBiSVNMEHtYZ2LIEbxXqxUNw1uxc0ioO2dqaWXTiOBZo7ePJRop1jn7LzqKr3dLx8ILz2MXncafKoPsRo4ybFBtpdFmrunItee5MaWPZ2BnFCPY4aWkV8P967L3AeyaUXRBELGCXA88CkzWhLlqhxuI3LSp3i/1ZYLg3Ttq9fsWu/NqLxRXrZyFf2bxG5SDBzXYKSyZ0x06TkpAge8dJc5AKUu1CMsT5PGIEARLMv63wSSqRshEOaoVO9MpF89vMr5xuma0XNw/vqq1cypNGnEYf4TotcDHfRW1VlNDVklTJQXirQeczLBGvblWoocjB25oiwnEMLzPL9HYDrM1LKEeonp2+EvQayStwu5b+NwOz6YTSa/dGsxUQMgEOc3c0P7rZotNs5ZvMEn5JiAVAEXScJXjkqG9d4csyHE3S3Z/OIj6UOz6fCNjQPQVuRfQbYTE+esxDWklueKf8C2ugY4WQCv5l0hsaRXz4PGmIQwUdW9wpdCncP6PHrIR+kObppGrROwiFCMzdj/WYdiRoyP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(8096899003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzA0ZnV5Z1pOeTFDQU1payswcWJFUnNUclc1TEFxQTdxdFNxaVExem9QWmlz?=
 =?utf-8?B?V0RJbVhaeFVYZTJZOUtZSnBmSUI3RGFFekt0TERaZHB6bytzNjB1cWJXMXcy?=
 =?utf-8?B?c0xtb1VSem5YNHVBR05wbS9ZckF3OWd3QlRCcS9LeWlOT1Jxc2pVcVhYRmNz?=
 =?utf-8?B?eXByeUprNU1STXc2OXlOSkRhdnlQL2JXb1JKVkVkOHBnSlp2cG51ZEhzeXJP?=
 =?utf-8?B?SmNtbjhpYW1HcWRXMitsSlA5cXd4cmRrdFRkY1p3ek5kUHUyVHR2MVdHOVNL?=
 =?utf-8?B?WThPMWFmQ3d3N0FqUWVWRjFZM3ZZbEltQXRNN2ljS3F5ZWNwUEhDTEp1K28w?=
 =?utf-8?B?djJydXFpQXdjV3NZWXpwOHkzcERSamJ1WTE1ZE1naEE0N25NV244ajFCY3d6?=
 =?utf-8?B?SE1leXhMdS9NOUFvQTNaMmp2R2g4a2JOU2FGeUlvK05QVnZZdFA1ZStMUHBj?=
 =?utf-8?B?Uk5MZC8zeEhVMDh6ZFBjQlJET09WNjY5RVNQQVM3eWgwTy9PRjB3VExCQnNF?=
 =?utf-8?B?M2g5S0haRXQzWVl2T2hkUFlmY0pDakV1aDRHL2xRM1V1QUJocTE0VDB2MHZj?=
 =?utf-8?B?MG8wSlhMOXVlWTFpTm1JbUJKTk4wTVhWUFQyUDBBdXVoNW9ySEo1VG1KdkZU?=
 =?utf-8?B?R1lxdzY1UlVoZXRnS2w0dExxWnZXR01NQmtoK0FUZnVhT2MyR2NvcWpuVERj?=
 =?utf-8?B?aHgwVCtPb29pNC9xZ0crYTNhMnQwQ2xrSTZrZlUzNUpCc2FFbnAxNDlmYUNV?=
 =?utf-8?B?TkZvSExUT3p1dkU1M3Y4THEvdCtQSkhsMmlPcFBzenNQUFozeVFaaVdyeTcz?=
 =?utf-8?B?RmVVUWQwT2ZzNFVac2ZybEcvK0NobjZNU2ptK2lndGdVcVNRTWg2aEZ4WDNx?=
 =?utf-8?B?bzNzSmkzK2hhRjV0eG1ONUdqeFZYKzVMZ2NscVdMaU9lSUhtaUJ0SFhEN0lx?=
 =?utf-8?B?cWlLejhSeDQ2UTF6Nk1sdzlIV1ljVkpNUE1NL3pJOWY5V2cxYzlYMWxRNS9a?=
 =?utf-8?B?cXNxdkNiZ05NcldUenJyeTFJUS82cnJwSWp3b1drOU1DK1REWHlFcThON2lB?=
 =?utf-8?B?bGxSOS9ZbzJleEhGOGoxZ29tZ0loQlhNQmpneHdEUDVGN2ZvS2ptZ1hPTWt6?=
 =?utf-8?B?ekhBbFJqNm5KYjJXZm9wamNxSUtWeEtSRW5CYkJ2Q001VjNvYzlkN3dlb01x?=
 =?utf-8?B?SWkxVFdoQ25oaXZJQ05oSGtoNURSODU4U3AzTEVsS3B1Nk1xbHBFRFFSVE9W?=
 =?utf-8?B?cHMvS2RzL0g4NGFITTJXOHU4eVhDYUZaeTRQYkt3a3Y0dFdLbXdSUWMwSTBU?=
 =?utf-8?B?K0JmalBxT0NKOGFydGVwdzFNRnIyTE1CbW9WREJrQ3dBeVhNa3NVbk5sUzQz?=
 =?utf-8?B?Z2VVbUFZL0VsdUxlSjRsMW90dnNJb3Y4UHh2S25vemdMYTd5YmI0MFVvN015?=
 =?utf-8?B?ZU03VmQ2WVJBUXBLbDBrUW1XckE5Wi81Y1pKMTBtbm9BTzBCS1lWSnh5QmVC?=
 =?utf-8?B?cXRGZEZLNTRDNlRSUXJJbEQ1clFQT0hpWk5yWE9yQ2I1UnhHZUV0WjJDOGh2?=
 =?utf-8?B?TU5kcVltYTV3Zjlqby9qNTVFQ0dsL0FWRUorWGR4MGIyN3hrNFFhQXN5MDhP?=
 =?utf-8?B?WGFuR0R6VlNFT09XaUlrcTQrR0VpREZiNEZmd0ZzbzQzbndLTzVpTlBkYUxL?=
 =?utf-8?B?Y2xKRTYzeDZBeVRkRTM2WGhya3FkQlM1MWM3Vm0yVlNwNHVUZUtSTE10dFNv?=
 =?utf-8?B?ZlpibllQZG1sZHJvb0dYWXBxc2t3WlVFNWRRM3BNbzMyb2V0Z1ZxbE5icmxu?=
 =?utf-8?B?QzZHOFJSdklWdFlTUzRYU2xTMTM3M1R1RkdXdzYwVkJ4bUpPdVBDeS9UeUVU?=
 =?utf-8?B?SFBkbUZHWkVCbXFGMjZZY3RSL1ZvRUpUcHhTb0dhTmZJcVdIT2JicXljTTRL?=
 =?utf-8?B?Ky80elFLODNQVklReU9IVmc5K1RnNjVTeDdjSUN0Q3RTV0xDYmFZcjNIV2Jk?=
 =?utf-8?B?d2p1OUs5ZVhIM3pHSmh1MjBmS05GekZibzlld3pYWFkwTEptRWpSZllsN0lQ?=
 =?utf-8?B?QW9Tem5xTFVXZ2tTVldybGFRNUZQL2tpZjVrNVZWczB2MEVOSmEyaVVnV09u?=
 =?utf-8?B?UElpVzh1TTZjOHRLcUNJL1dncjVUWmlLdUVQN2RXNDA3RzQ2THdSYUc2MDI4?=
 =?utf-8?B?RjljZWl3amt4bzYzVmNTckRXREJKV2RoNmZPV2lVMnBpc2VxOTVVQlZGYkRJ?=
 =?utf-8?B?OVAxUytxMzMyOUVCcTZ2dUpraGJlaHN4c0xPQTVockh2eGppTWRGQk1iT2tH?=
 =?utf-8?B?dzd0ZHpmRGlzRlNnTGNVcWJjeHdtR1NtWTRLYWkrNVFxSFB3NG1zczRJM1Qr?=
 =?utf-8?Q?8eCiGsbt1O9fioKk=3D?=
X-Exchange-RoutingPolicyChecked: cLt3hjZghaDWbaPbobga+zrQtYltIIRRmvHx38lHiFm++j3DL6sQ6V80A8VEORWBSOPYdWskjRhL53U/KcFSvcz15jWgo9Q9M3ETcMx+ws3IhZecy01YLmoxi2Q7pmCQG7IfPWC3+vGEWkMi8VJwucnloxV3uWoDvDT8InS0wsKmSkB28dRmHstZ+RoSImr2qswwxByORdEnyZ2dwTT/xdj+Fn/KRif+dBR6m6nKAkygtLAV+zN5VuOQ2el7mxDWKqkMXJtpricCc0NBA9pqMRvGoEcTto6EInWmSvLvhnXwQlu68tGTvf73ZrdlFMLmWNwbuNV+GXeN1oJtTeHLwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a09e846e-85d0-49ac-b0e4-08defd03039d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4926.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:30:52.8835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6olXQYH5bI/SPQlUJjyyOtEuvLzaOP4beAsfGNAVMrKLnbhl1Wt+bn/qYw9K1TG+qGHTYnm+KK2RJ8snEvHXr/LqdmPhOLLL+R9ePqzmqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
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

--------------TEZaCAQ4TZHnlNdbEhjVm3ch
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 08-08-2026 04:17 am, Michał Grzelak wrote:
> Limit execution of suspend tests to first and last active CRTC unless
> using `extended` flag. This helps with reducing default execution time
> of the test which can lower number of hitting CI timeout.
>
> v1->v2
> - move constraint before crtc_output_combo_valid() (Mohammed)
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>

LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_pipe_crc_basic.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 42e1415452..f1f89f11f8 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -127,6 +127,16 @@ enum {
>   	TEST_HANG = 1 << 3,
>   };
>   
> +static bool suspend_constraint(unsigned flags, igt_crtc_t *crtc)
> +{
> +	if (!extended && (flags & TEST_SUSPEND) &&
> +	    crtc->crtc_index != active_crtcs[0] &&
> +	    crtc->crtc_index != active_crtcs[last_crtc_index])
> +		return true;
> +
> +	return false;
> +}
> +
>   static void test_read_crc(data_t *data, igt_crtc_t *crtc,
>   			  igt_output_t *output, unsigned flags)
>   {
> @@ -425,6 +435,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   				if (simulation_constraint(crtc))
>   					continue;
>   
> +				if (suspend_constraint(tests[i].flags, crtc))
> +					continue;
> +
>   				if(!crtc_output_combo_valid(&data.display, crtc, output))
>   					continue;
>   
--------------TEZaCAQ4TZHnlNdbEhjVm3ch
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-08-2026 04:17 am, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260807224746.3554064-8-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">Limit execution of suspend tests to first and last active CRTC unless
using `extended` flag. This helps with reducing default execution time
of the test which can lower number of hitting CI timeout.

v1-&gt;v2
- move constraint before crtc_output_combo_valid() (Mohammed)

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a></pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre"><span style="white-space: normal">LGTM:</span></pre>
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20260807224746.3554064-8-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 tests/kms_pipe_crc_basic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 42e1415452..f1f89f11f8 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -127,6 +127,16 @@ enum {
 	TEST_HANG = 1 &lt;&lt; 3,
 };
 
+static bool suspend_constraint(unsigned flags, igt_crtc_t *crtc)
+{
+	if (!extended &amp;&amp; (flags &amp; TEST_SUSPEND) &amp;&amp;
+	    crtc-&gt;crtc_index != active_crtcs[0] &amp;&amp;
+	    crtc-&gt;crtc_index != active_crtcs[last_crtc_index])
+		return true;
+
+	return false;
+}
+
 static void test_read_crc(data_t *data, igt_crtc_t *crtc,
 			  igt_output_t *output, unsigned flags)
 {
@@ -425,6 +435,9 @@ int igt_main_args(&quot;e&quot;, NULL, help_str, opt_handler, NULL)
 				if (simulation_constraint(crtc))
 					continue;
 
+				if (suspend_constraint(tests[i].flags, crtc))
+					continue;
+
 				if(!crtc_output_combo_valid(&amp;data.display, crtc, output))
 					continue;
 
</pre>
    </blockquote>
  </body>
</html>

--------------TEZaCAQ4TZHnlNdbEhjVm3ch--
