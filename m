Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D46BC5CFDB
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 14:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B4910E0AD;
	Fri, 14 Aug 2026 14:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrcG/svs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C35C10E0AD
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786716588; x=1818252588;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RLgyhd4h67lNsC05NrGccdXvZUJilBx7sJ7hBhr08/8=;
 b=LrcG/svs91adqD4xNjUdgTEHWV9clEC0VraT+2UjmE1qDn+XrDIWy5YE
 h3r9FJGNfMHuoeUBou7YPkrfCF+/BImg5rVX2WgU3TbFPyRXy7g/6HEUJ
 8V5cTA3oxu9DYuS7H/ME4zUbN8nW4K8Og7/z7vLgJymfHBJO4OVETYnNC
 LHaBG9ST/d7ECbLnC5EfMylKVutuXqwCVut3cpNybaaEH/j+iTg7/0UZF
 NzXrmQfckt8HrslzIafnQ+KnVccaDH9zJ75fvrxXSW2au4tyKIlwHlCuK
 5oH/tu3cYmu25sNkSHGlB7/UcK0QmNGMFHJLBCT19/Y4plYDRNTVsD2WY w==;
X-CSE-ConnectionGUID: PX0vUrV7SvWHwWeRQuAPRw==
X-CSE-MsgGUID: i01F/0MFRG6ol6PgNVOtVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97959300"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97959300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:09:47 -0700
X-CSE-ConnectionGUID: u6wVFrw5RgOEhUnh6Vh8CQ==
X-CSE-MsgGUID: STZIQ8t8SNCmgS5K1Flxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262473667"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:09:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:09:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 07:09:48 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:09:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjr7XH5WdA38kh6GJPqafA1uFSFUJM8EnD8v5JbiKC7Y5eEbLi+AgiQ9WONgm5HAzw2xHr8hxOR4XZyyOBz9eDFgbbwUyMrncZgoolFjStv19mi9n6Phrte2EA5pvkoEkE89LYTq5nV3IhCGd8D2XB4y1FzoV9/59ACWDFbn+Ke1xPv08CcQ14IlRmyFTFcqB7FCGGDFZtfdQFPMmB3iwxOfiT3PVQwOT4YfWpYs158soAcfW9QTqT2e/9ELdvqp/fXp2iZAgQSF3yVN9eZNS4P5A6QTjn+XEgpRJSIp+xYoGB/I/oqb6QJiX45ZHCJb6wiuut0Mif3gwLJE62h9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnS1/SR1jDXozoh4f0Y2Ylh3sfsoytTaFgcYX15U59M=;
 b=sEpnuiHyCa3VRKJ1p6iKpHPLZZw6dEelz3dBr3jRxGUX26UWU41kx2vH2zh2C23tKsRyjD/bJ4EcR/eP7WZTasAQ57ibH1DGFHPjXCRQEuZhHTEUL2gbVT/vWKLXa7boV0/kQbGR8km8nBK0iW5OPdJLo+6u5YmpzAXgLb1wtD66J4WPnY767vUGyZY5CWZggS5yk0kvtsaI4TplvT1XjqNRYeB9lIBJZrJ7TaO2OK3NS0jSepUbF0fZ9V3px8v47X7OHCWtng65NztR+H3jj8Y3FaZTRJE8KjDt57tVLDnVKh04uiCjdByCmDfYoqPpOXVvxjwNf3zUKEcp+OWGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 14:09:45 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 14:09:42 +0000
Message-ID: <98fd2a7d-340d-4419-9a63-c20ec8f5972e@intel.com>
Date: Fri, 14 Aug 2026 19:39:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [2/8] lib/igt_drm_netlink: add get_error_counter support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260729121959.603890-3-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260729121959.603890-3-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::18) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: e753f5f0-09df-4030-d33b-08defa0daf5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hAQup+347PlhTqoUux1COCEDaQ3KA3sqSpAhiC0TXl04qbYYR3I1Zs9GRK3cQdPdBOoLSS0+ciyuNthx3CvDGgKdrlFdz1tC7nQe3GEtOX1S/RBR6lltdehP8CDyw+uT/b0vgtGtJgNd66uLKBv9qRuZ/xJDEVI0/9sopyS8Y8YCh0dy2ZBTr3p9IFoJm+Jox1uAnjVfMk8XRhIlwqyk8+PBwgBlmlk+uzaDFQLHxq6yzgvusx6DbyWjevwMkjmNQ+HC16VyxfUfngENPGLTUifBEduLuw7McXESqqgw26FJJv71e2prQ0pmcUpDMnSnbDbizEYxx0GC9Mqa9xpKdOmIFQrI80RCvXFBF+4DW9tQdZ+b2syxdKtbyOG3X7Hs5MQO8hjQA1BOjFdTYVCN0HbJRHBM6Iw453D9tl1E0DyQcvIKqLoA+BeNg13b94evrbDdG9QXNzysm+M8YZ04iRuHnvmxevAkIOdg5XsksJEeBqLDslRrJ3kVaeP+kIuj1QfMnKbDoyMbcFoWr5pGpoZQ5hjR/FdmfTQcjzmuTZIfSDhJp9sGzAMQsviLRhxOG2AiEtLQ8SQLPwPvEtND5/xiQXqUefqcpY6LygVQWpKNpDhJA41tz9sGgd6fO+dsmtJcMWHyRsxFJPtdbJQwOFWNRugLL92Yn9ii/uyQuII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk1vRTN5bG1PZ1J1cUZyRVhRQ2lnOFJ6cUoxSmR0Vi9IV05UOFJlWXJab2Jw?=
 =?utf-8?B?c2U4eVdjZ2dxL2JrblZzc0M5NlV0MklIdFFUaTBiL2ZGOVN3VEJseVAxcmNo?=
 =?utf-8?B?OGxtU3pCejJMekM5TWZGTG9MdWFwWnNiRUhwcTVwNkFxV0NSL0txMGRsU3VB?=
 =?utf-8?B?b3AxMVNXb3FITG9qbWxEQUpObzZ0eHFocWlXT1lUVDJFYUhPeFJzSWJ6cUZi?=
 =?utf-8?B?MExTR2tTSVhXZjQ1Tmx1UXFNTjN3SGxYYXVpN2R1RnpuclFlaExGeFVwYjBo?=
 =?utf-8?B?Uzc4MVc5RzZVSzBPSE1rSjFVbWVvNUdGaWk5MnBadTNwYkNoK1dNWTE1MVpE?=
 =?utf-8?B?Ujc5VWk5U0crcDVnbzRsM0M3QWhWRVhTUkRxOUI3QldCcXdzbEFGbzJZUi9K?=
 =?utf-8?B?YkFmSGwzRSthUSticmFQdHpPWllEaERiMkxSNGF4T1V3QVhKOGlMS3hFOFNo?=
 =?utf-8?B?K0hmZ1lEMzJ1Q2I2aHYrS1NWcUsyM0pLTnh6WndhZlJYQXN5Y1Z0K29MRXZk?=
 =?utf-8?B?OVVZR0JzNE8wRUUwQmVOOTVONmM1Q1BUaFVuUUM0SzlrQUtUNzhFMTZrQWRQ?=
 =?utf-8?B?OUY3OTgwaFJ4SmpYNkNhWE5pNGJjUG5tdnlnVlRHa0hwRi9Mb0hXZnR1dzR6?=
 =?utf-8?B?K08zVVlPTHkxa3JOZkRwWHp4KzM2YzF2WDJHL3huWXh0cHc0S3pwNmpmZXYy?=
 =?utf-8?B?Z3pUS1RoSXgzNklUNGJNeUFjNDZWL1o2emIzMTRsYUluZGN5UE1HSWFsTlk3?=
 =?utf-8?B?ZWJrQzRzMERNL09kM1pqSGhVOG1vZmgxRVNyeFkyUkhGNDdyN09SVlREVU00?=
 =?utf-8?B?aElBQTJja1JVWGI3VHUwL3Q1aGlmbFZoeWpWM05FcGJ1ZkZhcSt3L2Y3WFVz?=
 =?utf-8?B?T3pCb2s4RUpRV2duZytCNmVlVGZqVVV5N2VyeENwSkZOVnJLU084Qk41MVpy?=
 =?utf-8?B?UDdERWZwdXdFQ1YzZldkUzlQUXB4b1FsV2g5SjZIaVRoS2NOcGQvZVJTazE3?=
 =?utf-8?B?Ukh0dFBkb2R0ZjRGcTBxMGZGajhhTnJmOE9qNTFMeGF5SVczc2Z6SmVaSm5U?=
 =?utf-8?B?RDZvaE1SYklaazBCZ1lHTzh2NmdBQkRCeXgxK210cnBFc09PTEVhcjI0M0lr?=
 =?utf-8?B?SlhnRy9vVUJLaldEcmRaVmFNdHJiMXVPNkhKQU1nQ3p3bVF4Z04vVW1Yc0V6?=
 =?utf-8?B?L1BHZCtqamhhRVl0SWRLdm56d1FWTERJYUhRQlhPSEtkWHJmb2s1Qmwwd3M4?=
 =?utf-8?B?RjkrcVhKNUNDMWJqdTdvRGV5MldhUGpFN2pJU0ZnWXpoak4rbDF2U3BieWlT?=
 =?utf-8?B?Q28yMDVPWU1RZUJXSVVtSXdqQ2Z5S0IydmxOVWtIL3g5eFMwNFkzTHBpVFdI?=
 =?utf-8?B?MHlhRWJWL1F5cHBTRmp6MUxPMFhHYTBOenJ3cU4xcmJJb2hvSFNKUExrN1ov?=
 =?utf-8?B?a2tGei9FQncvWXZETU10NWFsY05RTHpJU2dHMzRNWmhUUEpBbHBnM05mMDVP?=
 =?utf-8?B?ekNDdGJnNjExWnU4SXlZSXRVcG9QTXU2SUpBR1JWSE1GVGMyNkR5S0EzaSt0?=
 =?utf-8?B?aHFHZkFkbGh3TTR0L0M2amFQYSsySDBXWUdqcGlySnVhZE9YVmZTMmovMWRt?=
 =?utf-8?B?bTQwVVRKalJNMGNKWVMrcGd0U25oS21HSVQ1RlRWMWdUU0RKWDZZQzhVMldy?=
 =?utf-8?B?QnAvcVVJU0NuVk0xbFpmdXR3MTFlWU43a0RtRnJtbUpTeWtYcExnOGFRQ3Ro?=
 =?utf-8?B?T3VxUXZ4cnd3Q1YzSnpJT2MrbDZBK2ZHaXZ4cVlGTWx4M2R4SmdETEFhOHNh?=
 =?utf-8?B?c2ZPdEtuWHAwZ0w0MVpOUm5PdXhnZDZmMDN2K1g0UndZc1gxNURDcmI3TXV3?=
 =?utf-8?B?VnhOeEcvMlVBcitnSzZPMzZvMzBEbjNlK1JrdkVqVkZoR3ZiUFlWZkFzcy93?=
 =?utf-8?B?bHU2S0c2OHR2Ym5nV3oxcDMvNTNsZXd4a1hKTnhhTkw2TE00TnQ3dGo3NUFq?=
 =?utf-8?B?WDFWclhWLzBsUnYyVnZLQ1MybFIraHNySDhiZUV2Y0FVYVdjVWtZVHcrcEdu?=
 =?utf-8?B?RmIrMzk5dkJidWdNNThUSVIwaUpKUXF1UDdXYXlZa3NkUFlWZlRURTNyd3BE?=
 =?utf-8?B?Z2VYaU9hTjdteHpicXpXWEZxNTRLSktNM002c1Eydjk4ZE92ZGtrT1J0ZUt6?=
 =?utf-8?B?TzhvbU9IaGd2a1lPT2l1TnpKOTdVeDBIeHlVeDVpMUZydGdBYURFN1Z1QmJV?=
 =?utf-8?B?OW5hRXp0Y0xLYXg3RHE4NUNabys3bHZpWWhzcGJzVTFpUGRZYi9CQU5FRERV?=
 =?utf-8?B?eG1iK1plcDljWlJraXBJYytNVHd6TENKY3hVWnBIWjdKb09Jd1RRZXFNdkda?=
 =?utf-8?Q?7r28dDsVGCKLxplk=3D?=
X-Exchange-RoutingPolicyChecked: sqXT8GKpt4qzCzHQGqZIXmKRijvH+LUECc3jYE6Rb+/UTfYe+f3D5sQKVfOn+GzYrCtdccWmvma8vuBqtcq4BYqU+u4oUZFb0Qgb9sBrULVdhipfCUgU4sfs7jkLS/PYfaS9YCw9dWwCnySTu4QLrvDLSIaftC+bOPQ0udLqE08Ss7IK8y7OWazxZz1MjbWch2tynN5QT5GWBELGsiNNbOO8L/zAc6DaTMYJQWJV1+hcZmI4K9HxkEUTmkc1+Qwxf6aiGiJ3db9O13YHTcJfG/buBY0eZEQ07vR+/tvqbItYyuQBC9T6tiNt6P55JbitPnPh1uAezGNmEpVjF0G5xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e753f5f0-09df-4030-d33b-08defa0daf5e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:09:42.1663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY1NsM1loWSZFMRUuPMTVuVR2S4CX+WjH2i5HxIqsO/rmft6IXsJ9w3IDighOO9c5bGs5Q7rq1jupaYcDNV9pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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

Hi Ravi,

On 29-07-2026 17:49, Ravi Kishore Koppuravuri wrote:
> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   lib/igt_drm_netlink.c | 179 +++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_drm_netlink.h |  11 +++
>   2 files changed, 188 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index 1c07bb2db..4d543275d 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -5,6 +5,7 @@
>   
>   #include <stdbool.h>
>   #include <stdint.h>
> +#include <errno.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> @@ -17,6 +18,146 @@
>   #include "igt_core.h"
>   #include "igt_drm_netlink.h"
>   
> +static int ras_command_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +	struct nlmsghdr *nlh;
> +	struct genlmsghdr *gnlh;
> +	int ret;
> +
> +	nlh = nlmsg_hdr(msg);
> +	gnlh = nlmsg_data(nlh);
> +
> +	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
> +		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> +
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
> +		break;
> +	}
> +	default:
> +		return NL_SKIP;
> +	}
> +
> +	return NL_OK;
> +}
> +
> +static int send_and_recv_nl_msg(struct app_context *ctx,
> +				struct nl_cb *cb,
> +				struct nl_msg *msg)
> +{
> +	int ret;
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	nlmsg_free(msg);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return ret;
> +	}
> +
> +	ret = nl_recvmsgs(ctx->sock, cb);
Is it blocking ? if so, is there any timeout ?
> +	nl_cb_put(cb);
Why the callback is being removed on the fly ?
> +
> +	return ret;
> +}
> +
> +static int send_command(struct app_context *ctx, uint8_t cmd)
> +{
> +	struct nl_cb *cb;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	msg_head = genlmsg_put(msg,
> +			       NL_AUTO_PORT,
> +			       NL_AUTO_SEQ,
> +			       ctx->family_id,
> +			       0,
> +			       NLM_F_REQUEST | NLM_F_ACK,
> +			       cmd,
> +			       DRM_RAS_FAMILY_VERSION);
> +	if (!msg_head) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER:
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +				  ctx->node_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return ret;
> +		}
> +
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +				  ctx->error_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		nlmsg_free(msg);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);

The callback could have been set during initialization to avoid setting 
and removing this callback on the fly.

Thanks,
Soham

> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		nlmsg_free(msg);
> +		return ret;
> +	}
> +
> +	return send_and_recv_nl_msg(ctx, cb, msg);
> +}
> +
> +int init_app_context(struct app_context *ctx)
> +{
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = UINT32_MAX;
> +	ctx->error_value = 0;
> +	ctx->family_id = -1;
> +
> +	return 0;
> +}
> +
> +void cleanup_app_context(struct app_context *ctx)
> +{
> +	if (!ctx)
> +		return;
> +
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = UINT32_MAX;
> +	ctx->error_value = 0;
> +	ctx->family_id = -1;
> +}
> +
>   void cleanup_nl_socket(struct app_context *ctx)
>   {
>   	if (!ctx || !ctx->sock)
> @@ -24,14 +165,20 @@ void cleanup_nl_socket(struct app_context *ctx)
>   
>   	nl_close(ctx->sock);
>   	nl_socket_free(ctx->sock);
> -	ctx->sock = NULL;
> -	ctx->family_id = -1;
> +
> +	cleanup_app_context(ctx);
>   
>   	igt_debug("Cleaned up netlink socket.\n");
>   }
>   
>   int init_nl_socket(struct app_context *ctx)
>   {
> +	int ret;
> +
> +	ret = init_app_context(ctx);
> +	if (ret < 0)
> +		return ret;
> +
>   	ctx->sock = nl_socket_alloc();
>   	if (!ctx->sock)
>   		return -1;
> @@ -58,3 +205,31 @@ int init_nl_socket(struct app_context *ctx)
>   		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>   	return 0;
>   }
> +
> +int get_error_counter(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
> +		return -EINVAL;
> +
> +	if (ctx->node_id == UINT32_MAX ||
> +	    ctx->error_id == UINT32_MAX ||
> +	    ctx->error_id == 0) {
> +		igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
> +			 "node_id should be >= 0 and error_id should be >= 1.\n",
> +			 ctx->node_id, ctx->error_id);
> +		return -EINVAL;
> +	}
> +
> +	ctx->error_value = 0;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
> +	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index c20d5452b..e539bc030 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -9,17 +9,28 @@
>   #include <stdbool.h>
>   #include <stdint.h>
>   
> +#include <linux/genetlink.h>
> +
> +#include <netlink/attr.h>
> +#include <netlink/handlers.h>
> +#include <netlink/msg.h>
>   #include <netlink/netlink.h>
>   
>   #include <drm-uapi/drm_ras.h>
>   
>   struct app_context {
>   	struct nl_sock *sock;
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	uint32_t error_value;
>   	int family_id;
>   };
>   
> +int init_app_context(struct app_context *ctx);
> +void cleanup_app_context(struct app_context *ctx);
>   void cleanup_nl_socket(struct app_context *ctx);
>   int init_nl_socket(struct app_context *ctx);
> +int get_error_counter(struct app_context *ctx);
>   
>   #endif /* IGT_DRM_NETLINK_H */
>   
