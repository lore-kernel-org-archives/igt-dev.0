Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FBC106F315
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 09:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230CD10EA64;
	Thu, 26 Mar 2026 09:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgmHeE2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315A710EA64
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774519125; x=1806055125;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o9PlRHmzZbgR/L0iTmFpfShs9de1JP6lmSiOqNhsJSY=;
 b=jgmHeE2i+YEyUnM26cocHd1rb+0QID8nEiIBBMcUo8r0AHjUfynPEe0Y
 PZKfHfNancKzrRmiCfxETweHGs76ijC+VFlxpGH+8q7iGt7veEcZVx+GQ
 pei55aUA3gtY70JYHmdhGsJIExmiVDcJdQwYqlB4Lg7p5QQOPJ2z73E0Q
 H2xXVwSVqxm/SdCULtHtWK5ZpAiNKlPeNYp2atoNnvHWFJmEZ45JnSpcP
 8Tf9S9oPtQ9bg49MeQDDfK6dX2rkZCDHQ9oHRHULRyvf3WSbx2ox+V/TC
 28n/azUPhnF7OnXaM/gwlEMkMsUe+OnZXBlnwdNwwbbXXwQkxutmWD7sd Q==;
X-CSE-ConnectionGUID: cZdFCkzlS9qIow/SJFycVw==
X-CSE-MsgGUID: Is7M+sjgQ3mTspIqJBd4jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75685677"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75685677"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:58:45 -0700
X-CSE-ConnectionGUID: V5rfYuavRCWuKGFK+sS8HQ==
X-CSE-MsgGUID: DUD/aXPKRqSJQV2HaLeOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224983072"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:58:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 02:58:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 02:58:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 02:58:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqmcBz4+6wZq4VRcFo6VYKhR1uyqVSuvPOusZbCGnfyaCZUCiXMOfDsGyyk1/hLnZ1OyPvmAIgQi4pQKbSZfCdZaS79PcMRBLAI3Hx1iSu9LgYbZvdwZj7fAAS2+pS8FPm2w4Nze1UvRqNTFjkGBOUGPmITuAd+vQXAQZQp+0zChRaBQw9nsodvuGI/0RAaPXsXH0zjvD2goDN3wj8vX+RW4FGtwgjiyo66260yZq+MhxW8DD1ozDjmLOZT8xlf5XWiDY23JxNt7q81w8CIe/8j0nQHzfpP7pskZF9J11mlWHLKxy78k4oN8vI6F6Pidq8KFjoYAviagpyBh957rEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UespbPdkyvDE4F11ScBLuoYmOytbnjgYQWu2GqAw+u8=;
 b=OvBg1H9s1OM5rzzIxSyjwsFj/AcNFoPOpLiuE77THfNMApMAltaoDEoCa+U1maZVjo/4s9oIt3nzD+kZR5PVzKogBmw2mbD3Y3V9IVBd6zJue6Vd5ohBDt9R+xS4NPruER543NE740EXpSRdUyTe/c8b507sQeppb5k+GT+jDSTPQ0ovR0wNKMgn5N1zaGte6ZDIxBbZOov0Jo+WBZYHz99QhoFw6ndbYw239EaNqT/m2M7yDUCh+c//VuVFiFtVTAfLjXL76MBqfuHtAYSrRMeqepHmGXFwhK1FHMWIY4DCFQVzffUtfL/Bw9FbZxWNSTisuEqyC8TZpfnPshQQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 09:58:41 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 09:58:41 +0000
Message-ID: <53cda094-3109-4a80-aec1-b3750b173981@intel.com>
Date: Thu, 26 Mar 2026 15:28:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/5] intel-ci: Move suspend/resume chamelium
 tests to end
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Mohammed Bilal <mohammed.bilal@intel.com>
References: <20260326090417.864673-1-sowmiya.s@intel.com>
 <20260326090417.864673-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260326090417.864673-2-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: a217d8f8-a13b-4698-4556-08de8b1e420d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: UcoDFUYF0iKwrDerOBrpE0FSkSfvl1ONozxDMR/bxbc84LDwsPLEItp+ULx/s2nnPtpQKvfigqFjC1+BDfv4itB+ADH5x4se8djjAmAW/53AV1DLDsIjALww8TmJOdz68yYi/CXhYG2+Hy2ogVgGl4y5yK9i7fysYulARRr/f8O+JfzS7RyDtH0JvgmcU1pta3Y0/3sVrPUTZNTtbgpsPiIUEUCBjvzkLVqvsfsIonM6AiHCkQ/4wZMmR8eTZb403WOC4QlKDL+Rq98B4duqUkwbgzNzeq5BPMYVTJaBemgFVPZ7IVgS1KrIouBRRr99GjB6Xzn8LcMx3EgOPGk+EzAxbaDJkCyW7o5e4tcDydmt4ZRky+a0aUv1SUvOPwO7RAC0DJ4LDb/DYIYuC+CmLlr4xri9Om+x900OPa4xGjRr27cSsUc2SelgceYuJhFUi0yXDv0hG1q1z0PBYmFUvHqhGjZPYwvmGJDNzOvu9TLPlQrA90h+OuO/FnZLwJS0ggUyqpmHs12mU1zdXB9Bn+iuykvKxHwbhH9Env3kr13n1qpLrxGYWjzz0ht4VfUqH9kczJ4DK5F8lmYrn76uUHwcu3PR3wcOMRDxY0w0ZSYvfNNnEJA9z5rGB8BAdlzuJDPeiqIliDAANfr8ZY+JFYAW+9tUPVFAgp0FmaCBoBgyQbLVRY5u4VdWGvp8+P8ej+Y9T1j6VmDzL2IDC1aJ4GgtjsJ/zGX1MsTDVRCpPBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODRUS2x5TDZicnE5RUErNGhsRmVwOGF5RTBCQVFwdkFqTVlMU3pZajFYZDdH?=
 =?utf-8?B?Q1MzVVNoQTg0N0RRaXM5TFUrSmlVMHpQdGZIZERvbjB3OU02cGx3RFdhVktN?=
 =?utf-8?B?ZXF2emIxeStiZDlrTXdHOTFJdzJmNy9GWE5DamNiYkVYVzBEN0l2RXVTRXk1?=
 =?utf-8?B?dDV5WVRsTDNmczRGQ28xM0NYZlR2TUFJN3ZDRVh4MFlpUkVNTVN2Z2xHYXZJ?=
 =?utf-8?B?ZHBCYVd4Uk5uZXdtNjZlL3NDby90VjhvV1NueGordUlVRWxRTkE0REdxQ0lm?=
 =?utf-8?B?bzNvbndrbWFzS2pBdW1WK01NNnlxeDJNQnd0YnZaSHE4eERpYzBkMzlaR1Q5?=
 =?utf-8?B?aXhhRDh2VWFLM2crUk1tOVhJNVIwRXQ3Q2t5VFJsMUZDRFVSZW5SdkRSaFBT?=
 =?utf-8?B?ekF0SHlPSzNvbVBCakxVekR5c0s1SHZQaHNQQ1lDNWc2b1ZrdFRWdUpha1BC?=
 =?utf-8?B?MTFQK3NwbldTSWxmWjEwSDc3R1lsVE50ZVR1R1J2dUdNQkpnWUJPQVkyQlFp?=
 =?utf-8?B?MHRhTGVmWFhTaTMwa2dlV0ZOVitGRmdXZmY5c0h5aEpMUEtTSlhmbEpCVVZQ?=
 =?utf-8?B?cjQ5K2pzVHJaVlNuMEdWeDFrcHUwckoxbzZZNWVnNENhVm9OQW1nT0JlSFRZ?=
 =?utf-8?B?a2U2eXpCRzluL2RtUCtxTEpBSGhDVE85ZHJKNFo1R3RFY2FDYkwzcWRlNzlm?=
 =?utf-8?B?cWplUXAzdzkxOTM4Z0NvZ3pzY0swcWtoOWtHYnVzbkU5bTlFejVtZ29NK3lr?=
 =?utf-8?B?cU1tY3R0TmxRUGhzUm1Ub3B3V05peFN1dGpLZEc4NVNzVm9JaE9JeTBhTVhq?=
 =?utf-8?B?ckpvZTh0d3BoL0RKTmxLR2g1Tnc0WHRLWkpKRE9KNHNxSnVRMjdkbjV1YmUr?=
 =?utf-8?B?c0NIUU81blhEdUlUemlwTWY1MmFBLzBGYzhZRGNsd28zZ2lxZGsxbi84bjVs?=
 =?utf-8?B?eXRJam5RRXZ4OHpPT1pJZXI1OGhiTkxDVWR3ZzFjN01FK1pWeTFkSTZ0bXpm?=
 =?utf-8?B?M3NNWlY5aUtKdlFGd0U2aWhueTF5OVJWb0pLODVrSEZ6bXFNd2V1dGRZdUo0?=
 =?utf-8?B?YTV3VUxXTnVRVTRVNlYyQzg3ZTlLVkVqNk1pQytVVE1OdWlJSFRvMVR1TTI0?=
 =?utf-8?B?bSttK2JDZmdGSDI3cXV1UERGTkpJTEFyQkFjamswV0puOHgzY0dxeXFRa21F?=
 =?utf-8?B?OW51TGhBK0RCOUtlbHdKcGNlRHZwSFR3cndnNjJ6WHppRkFjVlF1VmRNQWVl?=
 =?utf-8?B?RU84NDZPR0svZjdjaWNKOUxNR3F1aGFwelNLQXlqTFk4UXRjWFIvVHowTVhF?=
 =?utf-8?B?ak54M0g2YWEyUWgzSGozdXNmeUlCNXQvSU42ZnNsaEZsYlFDUTNRR1hSWnZw?=
 =?utf-8?B?Y1BESFdtOUY0c2FaY2MySm5tUjBVSTk2SWZSNnFUTml1S3hCUUNvVFZ2dGQ1?=
 =?utf-8?B?VFBtM3FUaldyT3F2a3MvUVhkV3NsK0RQU0w4NXozdFRPSUs0d00yWTJtcjBN?=
 =?utf-8?B?cWg3MEd1TXdrZTVRV2R5NnkxZjEyY2JIV1FkWTVFZExXSEdZNGhSeTcvdTZz?=
 =?utf-8?B?RThsSitGcTJOdmZCSnJZS0VkL1BoaHRJZWVpOWZvM0dmNTVDNmhtK2h0UWNj?=
 =?utf-8?B?eUQ5T1hSTmNGTXJCKzRlMk9OUVcvSTQraGtrUU42TW9rRlRrdk1SUjduWm0z?=
 =?utf-8?B?T1JMOHAwaDlaZCtQeWQ5UkdlaGo2RlU2ZjY2WjA1TVNtSUZ4akFFbVVNdzJS?=
 =?utf-8?B?Q0FBNmp1YnE2Nms1NnNPcStVQlFvVjN0VzdWay9Lci9ldmFpYUMvYUdYSW9J?=
 =?utf-8?B?c0lWZk9KZ3VwdTJ4STlMREk2UTA1QnhFeVdwU3V0b3VqZXk1MFFGQ2lJMFRa?=
 =?utf-8?B?VFMxOXh4RlBZaElmdURadGVpNDlRam9HWGhleGVNbUlsZWNnemVkUVV4TktH?=
 =?utf-8?B?Um4wSzh0Unl5UkdBTjBqM2Q3SUJORklFTGZWMm5JMXpSL2d6dkZIUS9FSVd0?=
 =?utf-8?B?WW5haXVUSE9aVzlNS3B3ekxVWGthOVFaLy9UeDYxZTB5d0RsZXV6YXhBNWNT?=
 =?utf-8?B?WlN1elBmenFHSURqMFdBY2lWdjlVNUk0a29wOWhFVEdqTFN6MExZQ2l1Rk13?=
 =?utf-8?B?dzFqWm9NQ1NpVU9UTncxN0FCaXhTTXJucWxWcXRDU0J6UnlXbnhqZHJ2Mzdi?=
 =?utf-8?B?bEdZQU9tanI2WWlJS1RPeDlzZkxiL0xGaThzWmc0ejMxdlNma2QvU2ljcjVL?=
 =?utf-8?B?S1BLbXhqZ1FvbElsd01pdlEyYmhzV3JZV25kT3luTHBDbzVmdGdtVDErSlIy?=
 =?utf-8?B?SlVMckhQNHFoVUpRWTJaNDFpYUdVMExSVERqWnlsZ1ZZR3RTbGZZdz09?=
X-Exchange-RoutingPolicyChecked: fB+Ig9REYG+iUdyYpd15tprJyX0PE+1CQMEsbsEhIgI8LwXEGiKbkO0iw5xA+pnX6Rg0H5bQlwjDXUvrTrt3WSccvNTq9pRqTWliQwZrgvdZ2JY3DkPxCNNXAy8ExfeTmxM7njzLWssppWR9tOxUYuvO+C0HihPeB3AAPiwwojwMEnlUt6LwZp0inEkFrD5LF7hltYILJtjEZKdGtzlo78BGehIFI2NZ7FyIlmZpNpf30IucigvtenvK+IaL53L/DsPbxfp8yuZ4VJ8Dg3QvmuE3+WO9/zKRCoNjjDe+jqYHJBhaIFMyiWUmPG0reREaGJlmTfaB0fkl+BbWcfZFsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a217d8f8-a13b-4698-4556-08de8b1e420d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:58:41.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8z/tRsfOo2h3XvJA4ZXjwWo7VVWSet5oh74qRsUp5J3/NJG7ot6l5vTl+1ss6ZuKHi1dGgC55qPJkZ3xSNDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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

Hi Sowmiya

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 26-03-2026 02:34 pm, Sowmiya S wrote:
> From: Mohammed Bilal <mohammed.bilal@intel.com>
>
> Suspend operations can cause system hangs or connection timeouts,
> so isolating them at the tail ensures stability of main test
> execution.
>
> v3:
> -Sort tests alphabetically (Kamil)
> v4: Add detailed comment (Swati)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 9adace28c..0e7c8e301 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -12,13 +12,11 @@ igt@kms_chamelium_color@ctm-negative
>   igt@kms_chamelium_color@ctm-red-to-blue
>   igt@kms_chamelium_color@degamma
>   igt@kms_chamelium_color@gamma
> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
>   igt@kms_chamelium_edid@dp-edid-read
>   igt@kms_chamelium_edid@dp-edid-resolution-list
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
>   igt@kms_chamelium_edid@dp-mode-timings
> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>   igt@kms_chamelium_edid@hdmi-edid-read
>   # Chamelium v1 board HDMI receiver supports max 4k@30 resolution
>   # removed test as its having a mode 4k@60 resulting
> @@ -41,9 +39,7 @@ igt@kms_chamelium_frames@hdmi-crc-planes-random
>   igt@kms_chamelium_frames@hdmi-crc-single
>   igt@kms_chamelium_frames@hdmi-frame-dump
>   igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@dp-hpd-fast
>   igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> @@ -51,7 +47,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
>   igt@kms_chamelium_hpd@dp-hpd-storm-disable
>   igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
>   igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>   igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@hdmi-hpd-fast
>   igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> @@ -61,7 +56,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>   igt@kms_chamelium_audio@hdmi-audio
>   igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@vga-hpd-fast
>   igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> @@ -75,3 +69,12 @@ igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
>   igt@kms_chamelium_hpd@common-hpd-after-hibernate
>   igt@kms_chamelium_hpd@dp-hpd-after-hibernate
>   igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> +# Suspend operations can cause system hangs or connection timeouts,
> +# so isolating them at the tail ensures stability of main test
> +# execution.
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
