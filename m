Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D293FC5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 16:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7295E10EBFC;
	Tue, 18 Aug 2026 16:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7zJE+XY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EFD10EBE8
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787069822; x=1818605822;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1j+K0lFu1T5d5R+2T56m0AFGmRvYChmemO1EQ+K8oYM=;
 b=n7zJE+XYNJ2Fv7HE5aJajcG8N1KJNSSaI9FFNhsVmTGQIgnYL/bDsfTY
 GQufKhVCCBVBhiwYQSyomw34fRxb6n3pRRaiiwyZgP8NZ/b2CxK6zZl42
 zjuIdhyp/s3XQJKl04sY1AxqWPXbGddWEJCeWnnNJurdanPrMscstpS9p
 05g78BEcH9L/bmOiCWID7ffjRtq1d1xA977Dqy4o/UA8M/z/BUn8NlrRA
 7fgBApkcfxC5RUAQ5ubpzraEM4GsqajCykYLt/pVw0bpOCzCoQzr6LiQi
 iNa6kjRUaBPiXQWWsBibAq/X9l5uC4UrcFlVYwGG3gd9AHycRe4w9+o/D Q==;
X-CSE-ConnectionGUID: OcMGFjQuR6yacrxfek6qYg==
X-CSE-MsgGUID: d5p/HFcXR6m9NNmRg6Kv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="113108981"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="113108981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 09:16:58 -0700
X-CSE-ConnectionGUID: i4rCJVcoSamlmhJB+XHd2g==
X-CSE-MsgGUID: t8Ry7OrxT02lrbmNOPGU7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="264830551"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 09:16:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 09:16:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 09:16:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 09:16:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgmSmE/KYxHQ6FRPQ6z0zO5Tu4+fWOVQwBxyTzskc0KDeww3yK6N4BQ8dTXs1y+LlPFgb3431kWUv2qwImLpM+Unnc3UVY9reBMVrVWASY6mjIwlrNQlbK4xjEO3HOj6JOzgvGklSdkV1EH95Kyb1aAekcImGbtDjjj/LcHYtYkIUK+jZrGKefb/cHBMOgjtGMx9Cs5Yzwv+O039Fo5lXjWBFDGRZEHSgZ2Yef6uDzJTm0qT/s9EciONs4lGqdQGOOvZ3WPbE7BOKlrnVcESxtYm3djnmmSC8YJ8hBv/ssy0C7XLzEIG0jmB2Ik0IXQplblRTtIMn42vJnj0Kx/ZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNXas/0rzng8dftxYiwoOtWhsXLzlWO91zcVXCk13Qk=;
 b=KxXrF3JBYiXJ7Y2KYPK+WUaHIhRG8BbXfTHZWdYl9qEhGtfhaJ8An8+CRqu3V/OpGuHVx+Oc8wSZ/K04chsUDeSlD+rxqhOIXpReourqRyKT+H4dEneCOHnzP3UMkkV374KM0eeAJZm5lzA8hBHsoziHbx02xeSsnKraVY6gFizJOZbXXxGYLevzNVp06+JfIfF3hVCC6o57QDCr20EcU3y/7W3qlgw6NMN9cm7DhgcRwFo3nB01rC7dA5lsSQyVnfugK7pB9fPyQx2QOvmAbdtDTPMYu8e+NKWaqMhCL/BWC3TBnppNCSu/mtpXprYZ3LxLoEkviaPvlQcnafyyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 16:16:51 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 16:16:50 +0000
Message-ID: <8c1c5895-ca4a-4eb3-90e9-8b9ef5f76a4d@intel.com>
Date: Tue, 18 Aug 2026 21:46:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_ras: Add test for GPU health
 indicator
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260810180518.1131459-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260810180518.1131459-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 7631cb4c-d010-4006-4574-08defd441bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7b3lejDiiKo7EU3E03gmBRAtiUo5HWLwQTWUWOkMxcDjQI01xBvaUfp6/3U8qKwSyW8p5TIMo/4Yxa36zneGf90V6PRsP5FE7O4DOKjIM62CcMpi3nPXFXuFGBXssKLCXxnnsbGur1oeNhELm/SrD/FrV7A3H3WfHjbmbJP82Ay7nwQKM/RGTeNW+/5+BItpTA2t2iRe56OzhLR/PEIkRW85gEsBruvFCuwbsTc3g3KnLveDP8flYYoG1wv1wVnNd01zc3FWVE4xLCXWpjBdZIcQGr7CK9yocZnx2QAVIL9SMO9v26RyQviuMCh7yVlUuoBz4+UuAbmZXOr1N9BW3ERYcSUbBUjmjvHeERMhzpVLaEiJ/vfceXvg6RpkpIujyQ3ejYY9++t5d7YhBcAFcna1SHL9O8CSLGf4o4yz58QWrty7JWNgVhy7vvBviaItbh98DwHb0FAAdY/4rxstbn49AdySHLnvy+lTT7SipCDKNvdQUPl7gbMPY67iGKFOXcy1kHykGGAxvjRUUOeFinKOIvxbvS5vu2vFNBneOEWJWt4uMzsi+F5gDi0sCRpBY1zxfbt9Ug44zGSO/yw8n3VCq4ecUtaDs4wendNzxqLz9fimPX14+eTP51Tc9y5wlk20NXEOHosRBBY38EXabeEIe9xWGO0/BzsPU/yyobc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWZvaGJBN0p4dDFzTnIyd2l2TzJrZEVHZitra1dlVU9hQjNHUmFhM1N3ZVNp?=
 =?utf-8?B?WThxSGxFbU5yY3RybFE4eDdZYjNmemZ1N3g4SWFGZmFiOFpmUDYzSE5KbEsy?=
 =?utf-8?B?VlI0UUxOekFWSEQ4cDRxR1hKRUx3MDlIQ1FLSExZMk1NVDNCQkdaWkFCcjd3?=
 =?utf-8?B?SWZlU2NiaWlUWWdkYlZ0L0wwRDdvL3lGSnArckFuTlR6c2ovd0RjRS9odVhH?=
 =?utf-8?B?WEpMTkx5MjFtVDB0L0dTWEU5MkpQZkpraGs3VThJMHlUaXlIcXU3ZW9IZEFL?=
 =?utf-8?B?Slo1M0hDY3pOM1FKdUFEZXdKWWdyUG4wL1NpR1N2OC9uek0vcjl0L1l1TGMx?=
 =?utf-8?B?V2REY1pzZlR5R2RkcjVpUWRpMERsY3dQZFQ4RWgvcFpoUlRnNGl1SkQxUXJO?=
 =?utf-8?B?MkpMWm55dm51cnF4VDBISkNuMEhSaS9XbDAvc3lEa3V1L2Q5Q0RHRGJtZ0xM?=
 =?utf-8?B?OHluN2UybVgydW5CZXh6bzZGYlg5TFJGSHp1VWlUQVlnNTJTN0t2WUNqa1Mv?=
 =?utf-8?B?TDY1OVgwTUlrSDVUZzdtZ3hLTHdHSDQ3cUxaM014TzhaM0g4YUN0TGsrdUY1?=
 =?utf-8?B?OXo0MVlsZkEwaXBEMnpXUEtTRUtqU21zTmJQb3FsZWowdjZXeW4vL3R3WnZB?=
 =?utf-8?B?WENVUTV2NnJJOHlSMXFYTmt2dVk0eWRwNDltWENRV05xeFRodllDdGV4dFRj?=
 =?utf-8?B?RGFISnNwNGJJMkdmaEJqbFBic0pCeGFVTWF6d00xeXcrM256T21zUUdHQnJk?=
 =?utf-8?B?QzNsTndtdUdCamdPaGVycW5DaEVBTUEwcXJHQUhpOUlVYzlRQWxiT3BIVkxS?=
 =?utf-8?B?OWtxaTVncko2aHl2N1JSVUpTVzk0ckdIU2JEUVhaOFZPbWJLZnhzT2dzTXl4?=
 =?utf-8?B?ckV3TWNNUW8weERCT3hUa0JiMGMwT0R6VjBEREcvT2U5T1FrbEgxTjN2Z012?=
 =?utf-8?B?cTBwMVpDYTkrRVpVd1hLaThWZ1YzbFBXRnlhZkNzNGFtYy85Wjc4Ym13RG50?=
 =?utf-8?B?QnBRM0hsc29ONnlxVHpCdTRaelJBRGNqWVhEaGtidVh5UUQvYmd2N2FOWkZL?=
 =?utf-8?B?Zlo4YTlXL2VaTkhBSnBsSkNYZERzWWlDSlNncEVvQ0JqTzMwbTZ6Z2ZDMUJn?=
 =?utf-8?B?a3JKU1RHK3NjdzBBeitQTmVxTTFjUHdlZ1pGNDJPZDBMTExhQWFtQWl5aklY?=
 =?utf-8?B?ekNvNkdjb2Q4cmVKREU2OXVFNTl6OWlsbHJQWC9vN3lpS3pLbFM2WG1EKzR2?=
 =?utf-8?B?UG1qNlh2ZDR4MFNoWlVkdFdqWTBBYWQ4RjR0Y3VYYnBhTHRjWXg5K2RTNGRC?=
 =?utf-8?B?TmtHdWRqczdPbmFjK2xnYitSdmpYb2oySGRXa1dLcFplMTNocXBIdGUxVlVI?=
 =?utf-8?B?dGxRa2ZRNVhVRVRKM0Vrd21ZYzgxOWVwWks2dlh4SFRYRFppVk81dzllMVpo?=
 =?utf-8?B?R1VGZ2ozS3lDMWRsc2dJY2Zpb1NtVEdmejUyS3NaYkxJaXNtaWlwUzVEQXBp?=
 =?utf-8?B?S3hCN2RYVXJGdjJsbHU5YVVNOVhCU0ZoMFdEdFB6cWJzQlV3djdHdjdnS2V6?=
 =?utf-8?B?WEI3ajA0OFlZRTlRanRITjc0U0lZNkhrekhkWXhhbUU2NXlPUzRNRnJWNk1z?=
 =?utf-8?B?VjJ5aEY5WC92azlURXJuZEN0aTVITU5WQUJPbVNEcnhJVjc4ZkF0bXFHeHcz?=
 =?utf-8?B?WnkzdHJSMks2RUV5R0ZjMXFOMSs4QnBPWjdHZVc1V1puMThhNTZhQUNNZWJs?=
 =?utf-8?B?YTZzMWVsOXlVc0RmcUsyQnVDSW9CVjgyQ2thL253dk1hSm1DQWFXMy9mQkZT?=
 =?utf-8?B?SXAzc3FxeGx4dy9RdUxRL2txUmxLcStObVUyeTFEeTI2emF5MXBHREp0eWRX?=
 =?utf-8?B?OXlkd0s3NXJ4YzNMRW12RnB4NHhhNDRoQ2h5ZTJ5emRFa1VqMlJablBocy8y?=
 =?utf-8?B?M3V6M2Q2d3lkSUViZnpTbVN1S1FMVDZhb0hCSFE5Z2FOa0xSWDNMYWFmTy8z?=
 =?utf-8?B?UjRKMTl5Zmx3MWZDZElvZU5seE8rQXV5VURmU3ErZG1obkd1c2FsUXhVQUVQ?=
 =?utf-8?B?bkNUVW5jNXkza0xmY3hjaHFqbHFTM0hlb2VhbGhSdUVXcFpwRFI4dDBjNXZG?=
 =?utf-8?B?bjQ1SDEyQnFiakZ0Y2I0Q3VGOWhTZDBLY2JBVElabnd4V1JaN1F6cG9CaVJM?=
 =?utf-8?B?Q2x3eTlhNnZLSEIxUXVaYWp4cVJmd2hoLyszWWR3SXgxUXJYRlp0WXJ1NTFo?=
 =?utf-8?B?cFIydnZHbzk5RVdoOHlkMnllOExUeCtJa2ZQTktXOE5aTnFmazIxcSt3QTJt?=
 =?utf-8?B?VEJSVlR6SGdEbUVVMFJPVC9oZ2xiNEpsQ3pqSDQva3pZeStXeS9Cdz09?=
X-Exchange-RoutingPolicyChecked: D5Im8MprVgmk0fIDQ5YmoZc4zCRgF+5cUEFvWM+v0xwxc7Gk2gzuTJvGos5I5okwNv3MoQ9Op08hIyi1PAbqqN82eWSiEPZs89D7TSx/snWamrlJ17vdVE/M0xRfhe9iWxxs17Chy0XH9vv3v46cCsHwucYOpP+62Lpys3j0toISIiJw/ohQgHtnEcrYQdOOgw9spQaIsbCpq3HEIfKcCRfiF+ctygGPwe9XH+c6zMmhRbQ+nOf+FOnakyxCfxmHTdKY8a/M2Rymbz/IjPkqlvdQSGvtVJmvKFSSNe8JdSLPraMUsC2ROhuDGykzOh4RpXX0SfWA0sQD/NN/k7I6XQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7631cb4c-d010-4006-4574-08defd441bee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:16:50.7597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEWrFjKeS26TRIKJ+ipFzLvXxD5s5enyZWBHb7kMTOARN57HgV+3NoXjwjl+JpfqfBo8Zk4Ot3o8WaM22BBdlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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

Hi Soham,

On 10-08-2026 11:35 pm, Soham Purkait wrote:
> Add a new Xe RAS test exercising the gpu_health sysfs attribute
> exposed by the Xe driver on platforms that provide the system
> controller. The attribute reports and allows updating the GPU
> health state.
>
> The gpu-health subtest validates each valid state by writing it
> and reading the value back, and checks that invalid writes are
> rejected with -EINVAL, guarding against regressions in the
> implementation.
>
> v1:
>   - Platform-conditional skip w/o fd leak. (Anirban)
>   - Restore via exit handler. (Anirban)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_ras.c | 135 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   2 files changed, 136 insertions(+)
>   create mode 100644 tests/intel/xe_ras.c
>
> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> new file mode 100644
> index 000000000..c43dc3bdd
> --- /dev/null
> +++ b/tests/intel/xe_ras.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_query.h"
Above two are unused includes. Remove them.
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: ras
> + * Test category: Functional tests
> + *
> + * SUBTEST: gpu-health
> + * Description: Verify the gpu_health sysfs attribute accepts each valid
> + *		state (ok/warning/critical) and rejects invalid writes
> + *		with EINVAL.
> + */
> +
> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
> +
> +#define GPU_HEALTH_ATTR	"device/gpu_health"
> +
> +static const char * const gpu_health_states[] = {
> +	"ok",
> +	"warning",
> +	"critical",
> +};
> +
> +static struct {
> +	int sys_fd;
> +	char *orig_health;
> +} gpu_health_ctx = { .sys_fd = -1 };
> +
> +static void restore_gpu_health(int sig)
> +{
> +	if (gpu_health_ctx.sys_fd < 0 || !gpu_health_ctx.orig_health)
> +		return;
> +
> +	igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, gpu_health_ctx.orig_health);
> +	free(gpu_health_ctx.orig_health);
Check if we can use free() in exit handler as this can be called even if 
any fata signal is being invoked.
> +	gpu_health_ctx.orig_health = NULL;
> +	close(gpu_health_ctx.sys_fd);
> +	gpu_health_ctx.sys_fd = -1;
> +}
> +
> +static bool valid_gpu_health(const char *s)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
> +		if (!strcmp(s, gpu_health_states[i]))
> +			return true;
> +
> +	return false;
> +}
> +
> +static void test_gpu_health(int xe)
> +{
> +	char *health = NULL;
> +	int ret;
> +	int i;
> +
> +	gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
> +	igt_assert(gpu_health_ctx.sys_fd >= 0);
> +
> +	if (!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR)) {
> +		close(gpu_health_ctx.sys_fd);
> +		gpu_health_ctx.sys_fd = -1;
> +		igt_skip("gpu_health sysfs attribute not exposed by driver\n");
> +	}
> +
> +	gpu_health_ctx.orig_health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert_f(gpu_health_ctx.orig_health, "Failed to read %s\n", GPU_HEALTH_ATTR);
> +	igt_debug("initial gpu_health: %s\n", gpu_health_ctx.orig_health);
> +	igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
> +		     "Unexpected initial gpu_health value: '%s'\n",
> +		     gpu_health_ctx.orig_health);
> +
> +	igt_install_exit_handler(restore_gpu_health);
Imo it's better to call the exit handler in IGT fixture or under 
igt_subtest("gpu-health") section.
> +
> +	/**
> +	 * Invalid writes must be rejected with EINVAL.
> +	 */
> +	errno = 0;
We are not using errno anywhere else, check for dead codes.
> +	ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, "bogus", strlen("bogus"));
> +	igt_assert_f(ret == -EINVAL,
> +		     "Write of invalid value to %s returned %d, expected -EINVAL\n",
> +		     GPU_HEALTH_ATTR, ret);
> +
> +	/**
> +	 * Write each valid state and read it back to confirm the driver
> +	 * accepts and reflects the requested value.
> +	 */

I think these type of comment format only required in case of 
Test/Subtest descriptions. Cross verify once if we can use here.

Thanks,

Anirban

> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
> +		const char *state = gpu_health_states[i];
> +
> +		igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, state),
> +			     "Failed to write '%s' to %s\n",
> +			     state, GPU_HEALTH_ATTR);
> +
> +		health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +		igt_assert(health);
> +		igt_assert_f(!strcmp(health, state),
> +			     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
> +			     state, health);
> +		free(health);
> +	}
> +
> +	restore_gpu_health(0);
> +}
> +
> +int igt_main()
> +{
> +	int xe;
> +
> +	igt_fixture()
> +		xe = drm_open_driver(DRIVER_XE);
> +
> +	igt_subtest("gpu-health")
> +		test_gpu_health(xe);
> +
> +	igt_fixture()
> +		drm_close_driver(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 6d90627b9..4ab4ef603 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_progs = [
>   	'xe_prime_self_import',
>   	'xe_pxp',
>   	'xe_query',
> +	'xe_ras',
>   	'xe_render_copy',
>   	'xe_vm',
>   	'xe_userptr_pressure',
