Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73843FB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2180E10E2EC;
	Mon,  6 Apr 2026 22:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRaALx4O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE2910E2EC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514741; x=1807050741;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wm042IzVTA4Llc3Gm0OW0BSNwtLDrJ9+kIZlibXnP3s=;
 b=YRaALx4O14WXln2MX+1zPcT8Lh+MDgXuUUzOCr3EnBm5sJAT0yRPbNqM
 h5uLOFMcn5qLexY8aRPQaQ0FXGhEI7dD+HfMQZZjl2GCtZUZ1papNvL90
 fQUY3tWgQexhot3FS6XRjodRhmeiksQiIpPrPa3p4vxipONxiSPh8xL3S
 oexbGNMjwfIthDqVAsSJz0ayCKeEygtxiS8Ukvf2BOiHQZVX/pvhzzk+1
 iHSY39AUeh/pd55DalW9XlQZbspM7myy4k5z/HQv2PTzQDxqBxkhJI8Sj
 OfVx96u/ELPBz1rMxr1XSf+zdfpFrmauPQp4LcscZ5RXx/ZB0k2vdTvkF g==;
X-CSE-ConnectionGUID: Z7xFCXdUSUi25CU3x9jv9w==
X-CSE-MsgGUID: OxClWlrBQGm5L2hZLiauuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="79061341"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="79061341"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:32:21 -0700
X-CSE-ConnectionGUID: AsO6mVDmRSq6XeKlOunWqg==
X-CSE-MsgGUID: hhnhMOTZR9mHOU/fQl9jRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="223194269"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:32:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:32:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 15:32:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:32:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uj1mVeJwsW3PZzDtGWLfmsP2guPXhNtAJ0QDXVJZIVTyBRfNE8j2CKfXZFtIIkCNP+X9uYQ58pMmiB4uRGRi86e5arShnHBTMJCvaDt+DFcbArG/hqhk6wfUKD00NzmTWJnYGSiGTNZri0sHXBRgIpogNH1UUsXxW4Cl9dGhqfEXCngzalWYEKd6i/Rumn5RofbUm28cEqhp/ywVcgvoPKRMxwsFjUYNTg4Fso/38q15If6jsjXcnxKFrOMgckrUl9d0vP+K09I37SwXCD7fNqzL456e0Q5JTGoUsj4yVjFukbR65NyAZKwyo7mTJe/8mcTSQ8ukcAFlp9nOq2NWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUNvVPsagpfJaRfkaAksYWEbedL2DC1BElpgEpWO+hg=;
 b=M2WLohDIhSkBFF/G/1BcMONNpCLvD/Jxg1GyGU734xnhesDXfSOqvMk37crO/YKXN/+ribP4SrELzaeKqO84dW/H4fhiy4Met36H/st4YkSQ9qHSOzkp6tYH/3h/IVp0nTuxt637HM4kvDTaFbaHeLz5+tN8UUZFG7BMqD2J7jesjMDkYRLNJ7iM5fVTl+hOdSvIAJABJxtgyeyhOBbxTs9y8XP1G8i79F9z4yjZrfUQaKnqyN1GybtUEcMkJJGdb2q4xZ2aThuTmypIjVZM92Br3klzB3o2E5Ij93ZdEdi0YudMfiyZBCSisukhqqWGvltWvTPipTRVX38GTuJXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by PH7PR11MB7100.namprd11.prod.outlook.com (2603:10b6:510:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 22:32:17 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 22:32:17 +0000
Message-ID: <ee4c3656-9831-4ac2-8a44-3a84cf754e8c@intel.com>
Date: Mon, 6 Apr 2026 15:32:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,2/4] lib/xe: add xe_engine_class_supports_multi_lrc()
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260403071322.366766-3-x.wang@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260403071322.366766-3-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0011.namprd15.prod.outlook.com
 (2603:10b6:930:14::23) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|PH7PR11MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 117fc86c-b7d3-4476-091d-08de942c5b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: nphhlj4LLuFYnzdG3n8qav2gVA/ONRA+Y/20k2WCkPn/s0xGnOZClx0+TADam9mg6oE76m4xfWj0tb4il46U1oyRQrDUHD2piMirkkdS6lRN6BD50IrEou9ebPMSjCefyednGyz4pAujQlUmWbTmmKn0fqYIRJUhdJljDKCuvEu08lbTniv8ocQ9e3ABF6uWGwaU4VOdhMSA9XZLWbmuj7JmA1XzTJXU6S0WTdJMmHzh2bnUHw3gJYSnMbrC6RIsTQkjcvnynpRNGRti3flIYG0mBEt2H9a4Q66BFpPjfbzhZ5rnpvtKd2MgHkbl9iimTTyRQ31tC4IXX3UlHwqOh7mc7KvSlaCSQYF2eJ2Gr1h5Og9IYTxf9cjmfIpWgXV/kcTC+b8ICtTeRthayiwgBPVbFI/o8AoPNMCt/OZcxn2/M8z7x+ni/FWDlfQRcDqI1cjhyQI52ZXjIPwMl4SbHPCMOy9DhJk/5ZvIKQjRL+rimGAyCxSOQKd3t/oEemA67G48T7xJt/rf55Z1QILXKpHAnEZHcgB+0RLQC9zduEmw2b56iFrfgsshgKio9R1m1s3wpNFsO75BcCvY2geIv/PIk34uoe4UHdI43bT2vQJu4ot78ThR1DG9lcSQKFxgcUREVAQTISjL+W4sTG4sVV8gZHBZSjvIMDg9HuEs5roG1z46H5yOmfKW/zkMgR5Ygkfk25AVLSmTewJ59vRXdRySxXEY8bxyq7IU433QBt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhiR2lYUFo0T3V3M0tZUmYvR0dLdXNjd3dHTTNlQUxzWUE5MHNPYUpCbW5Z?=
 =?utf-8?B?NlBRcTRHa20yQUR5amtIVEhOWlNrSkRubFBvcUVwNnFTSk50SzJoR0E3c1hC?=
 =?utf-8?B?cXVLeWp4OHoza1Exa2dqSE9mMnRQVUtIR1NEQ1c4T29BRmJPVWJacW1CMERZ?=
 =?utf-8?B?UlRxSC8wUEtJcXZDcmFBME52blRNSVV0OE8zS09Wem5taURBb0wvY3h4RFpP?=
 =?utf-8?B?SzBrSllwYmhmRU1zZmlQWXBpbFJITGplK2dMNVoxN2djeGxvU3hUODg4cG9P?=
 =?utf-8?B?OVBhSGZPRWVPSTNuV2VsVzRreGE3RFNIdFRsRjlLQS9VNEtBL3Q0QnRRenNB?=
 =?utf-8?B?NlpIQTZpMWxONEdkQ2U4SHp2NFVWM2Y1SW9nRFJRY2xRbjM2SnJqcCsvbEti?=
 =?utf-8?B?RVVrL3I1L1pjVjFNM0s3WWdGZUo5eE1pR2FDSTh0T1NyNjBPL0FPYUowY2o2?=
 =?utf-8?B?Q3BaVUV1YkNaNDBpeUtabXY0c0NWOHdONTFIVzdFdHpNc0lNZElHYnFXcHBt?=
 =?utf-8?B?OFI1TngrdGlnZ0JGdnRjZXNKWEVzRXFOMUN0cGRaZ0JUVm03ZzF4WWNKazRV?=
 =?utf-8?B?QzRyaExkWUwxa0dpcHh5OEcxZmJoQ1hicHE1S09WNWtvVHBJTVd5dWZQWFEx?=
 =?utf-8?B?c0xEaFExVXJNSENLeDNPNnY5Q2FZakw4L2FRN0htVEVOZU1ZZVhHRXJuQkFj?=
 =?utf-8?B?YVNPc3B1bTR3NnRadE1JZjdma0IvVTZranpLTktPdktnK1BoZTRWd1JSb3BN?=
 =?utf-8?B?RjJEWExhQXBic0FvMHlHUWpwcjg3K1JxdG1HNHF4bnNRMlNjelFLY2t2RGtS?=
 =?utf-8?B?ZUs3dEdOeEhzZUF5V0ZqdE81MSt2V0pFL1V0T1g4cUxHTUpuODhRMlJuUGVE?=
 =?utf-8?B?dkFwY24xK0h5Rm52VzdiRi9YcjF5OVNwb0p5TVhWeTNxUnByRlRCaGE4MUhj?=
 =?utf-8?B?ajRJa2o3UWExTGR1KzNRZVhhWjFLMkxTTjYrSWJzR283NlNKZVNtdGd1WHAw?=
 =?utf-8?B?aTR6Zys3eVNFV1FjMERScWNiNkwrUjZtSVk5WDlwQThxckVUelRDd0RPbncx?=
 =?utf-8?B?b1puZWpCejN4aWlFT0NFeDZzcG5BczlLY3lCU2JUckpVK3U5WnI5ZzRKR0VL?=
 =?utf-8?B?anBXTHdIVWtQdUp0dFhudmhrZndDb2g1UllCY2tDenhIZENzQjZCdmhNUlBM?=
 =?utf-8?B?ZHNsNU5PQXZIZ1gwdU5GTndMankrQWV1UytUNEJmV0Q2bEdpQzhzM2tBUXVo?=
 =?utf-8?B?WDlEVXNzd3c5L2s4WnN0K24vazBHaDMza2JJMW1obFVpVnRrNmhHNHpxNEVr?=
 =?utf-8?B?SEtwWTRrSlhjekt1cWhlYjFQYzZ4R2JDR1puM3drS2d1YWVhY1d4bDI1ZHBs?=
 =?utf-8?B?Vm1WRjFrRmF6eDFqdVNnOUZiU1ZVaGIwNnNLQW1QdlJZN1EyNHRpcmFNcW1l?=
 =?utf-8?B?eVpUZDhreWZPS1NkcjRBYVF0QUhDUzdSaW95ZHg3SkxDZlhWZkt2dlh5cTRw?=
 =?utf-8?B?VU1VM2FYTENFOFZuUkIwWFp4S083VER2bGRtM00yVW14cTdRVE1TcE5ZMTN3?=
 =?utf-8?B?MFkrQzFVbFF0by82L2VNUDVPNUxWU1IyWHZsS0NQSzlDSXpYaWl1b090YzlE?=
 =?utf-8?B?dmI5cDd2WXFFNnBxTGNlcEY4OERhVUo0U2VQR2ttVUFGem1QbkUrRmR2dEJE?=
 =?utf-8?B?aG5yRE9uZ2o0cTJZTlYrY254bk5uOFYrZUhCeFpFbVhyTDBKYVRiRERMTGNq?=
 =?utf-8?B?cFE5UmtnVk5IeHRqR1p6M0g1SjBYYUUrdWlhQXRRM09BdkJYak5PcWlkTEV0?=
 =?utf-8?B?UjR0MkRXb1ExVSs1UDcxQm05Tkp5cXhnYlZlT0xnT2Nsb2MyTkdRTFYwTmFo?=
 =?utf-8?B?Nm5aaUQ3RDByazFjR3BPa1FaOUpmZmRqSWU5OXF3b3ZtdzE5QlVXM2M4M29a?=
 =?utf-8?B?TkVoS28yTkVWcUhRN2kyanNXQUJmTndEUmNCVnUrbXYyalEySC8remFBb0xO?=
 =?utf-8?B?R2wvUFRSTHFxK25hRHhpS3JON0VFcW1rZWs3OGcyY3QvNWNPWkU0Z2JXZGdO?=
 =?utf-8?B?Z05UazNxN0JXSFY0cmcxWWdWaXN2YlF1NXFHaXVJNC9iNzFaQVFXR21nTVdI?=
 =?utf-8?B?U29vTitsUko4VTMrRnN5cXJBMlhVZzh5eHpYODg2OTJiNDlaVW9sd1ZJVkFs?=
 =?utf-8?B?K2sxbCtsOTJ3eU04REFVMjJvaysyOCtISU9tdWlVcXVlWkRFNUR1OC9ZaGZo?=
 =?utf-8?B?aHdGS0QwOFo0NDV0MUVCd04yNmJnVG5adWc3c1lMcjNuQ0t5RnBoZ2dTK0px?=
 =?utf-8?B?MnFpT0Jmdnd3TlZzSnAyL2E3NXZ2RGtMQU52Ylg3ZldWekxkd3Q0WlZmZFdE?=
 =?utf-8?Q?JYaJS6jO/OUSf9nE=3D?=
X-Exchange-RoutingPolicyChecked: iDabkZcyy/aCbRwK///+r4hsoUGYL17HKYMtiN8mw9JZgJHTakRDdpRJmapdZma2FsZgLCwshtrsGbsbjV2bHx4BfdQP17009xdFEdT5fj+qTZBVQa2G27PFIrKXeWQzi2e8cYQPNDkVO5on4/Bi8ISXFavbRbhVMRqdI2mLHef+OQ840H5JQB7uxXers5kVeFWTMHFUiw+Ndznjvn4MvkCwSM9X+aG+aNwDlY6xJtVkqz1pULuyWPQ77wYpDlkG6dmaQpNCKxfLKRQwrC0TeC9PhAoyWcgLhjczaQ1HmwHj+p9NEINFkHWXDpNRYmnszEFjub1wjQ7DXljFwKKZhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 117fc86c-b7d3-4476-091d-08de942c5b9a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 22:32:17.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAw2t5mLzvCc3Ia5E+iwASwvKbyN0V0j6QBbNLUUKZLCTTWhVYY3WuvVYczupRFR7XEun7GuTxYmJSe7gDk96J43U+FqBj3oc40aRmVasjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7100
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


On 4/3/2026 12:13 AM, Xin Wang wrote:
> Add xe_engine_class_supports_multi_lrc() to query whether an engine
> class supports multi-LRC submission.  When the kernel exposes the
> information via the debugfs info node it is used directly; otherwise
> fall back to a hardcoded default to keep compatibility with older KMD.
>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   lib/xe/xe_query.c | 30 ++++++++++++++++++++++++++++++
>   lib/xe/xe_query.h |  1 +
>   2 files changed, 31 insertions(+)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 441e95794..e13d5e143 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -308,6 +308,36 @@ static struct xe_device *find_in_cache(int fd)
>   	return xe_dev;
>   }
>   
> +/**
> + * xe_engine_class_supports_multi_lrc:
> + * @fd: xe device fd
> + * @engine_class: engine class
> + *
> + * Returns true if multi LRC supported by engine class or false.
> + * Uses the kernel-reported bitmask from debugfs when available, otherwise
> + * falls back to the hardcoded per-class default.
> + */
> +bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class)
> +{
> +	struct xe_device *xe_dev = find_in_cache(fd);
> +
> +	if (xe_dev && xe_dev->multi_lrc_mask != UINT16_MAX)
> +		return !!(xe_dev->multi_lrc_mask & BIT(engine_class));
> +
> +	switch (engine_class) {
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return false;
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return true;
> +	default:
> +		igt_warn("Engine class 0x%x unknown\n", engine_class);
> +		return false;
> +	}
> +}
> +
>   static void xe_device_free(struct xe_device *xe_dev)
>   {
>   	free(xe_dev->config);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index f33562bda..5c26a3e88 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -162,6 +162,7 @@ uint32_t xe_va_bits(int fd);
>   uint16_t xe_dev_id(int fd);
>   int xe_supports_faults(int fd);
>   bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
> +bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class);
>   const char *xe_engine_class_string(uint32_t engine_class);
>   const char *xe_engine_class_short_string(uint32_t engine_class);
>   bool xe_has_engine_class(int fd, uint16_t engine_class);

Reviewed-by:Daniel Charles <daniel.charles@intel.com>

