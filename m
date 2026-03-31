Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FDB109B47B
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A3B890EB;
	Tue, 31 Mar 2026 14:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYy9tD94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA2010E96B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774968253; x=1806504253;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/ljnh7bLcBZs2I0+rr0lctoT+LOPiCuSDEAUmdGSQLY=;
 b=RYy9tD94FtLMASohZmhRe7bPCHadzGiX1Ldtsqvt9L690cQcRqdwdT89
 MPvFvzBvA60cSu7Hi+UCqjkCCemUPLmumnfQv9wxlcwTlTwPh2dhrJLPO
 NTeWKC78vhoqpHCC5I4PyeF7NzbeA6F7+umfBnX2DaYoS1rh+kOu2oz4n
 9hRvAufIWcnsKwucKMkvX52eybZ9zxHBnvw74Avy6Vk6tU6mIBBdO0M/r
 c2W8CvquVYpEVIgsEtXWnSOzL1Jy/4s4R6YeXo3WHa4mGcBpI+IGQF86C
 23UOXE5dIYkIkK+aC9VtNFLzyLQS4kmvpiil8kl2pzBukTfemTH+vruV8 g==;
X-CSE-ConnectionGUID: 3fztk72SSrW+Ruf4Cux1uQ==
X-CSE-MsgGUID: juCLsGHKQOeHwuCXAQ6nPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79842860"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="79842860"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:44:12 -0700
X-CSE-ConnectionGUID: saTirSpVRuGAsdV8y2k8TQ==
X-CSE-MsgGUID: +mDZ9s9/Qx6d6hTIioC6SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="221981195"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:44:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:44:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 07:44:11 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mu66lZmNH2seDF6/+jFYbjAdrqiqJGdoKUekOsf+g92fA2lMvaOYQH98qWODi+yi3M5Y7GiuXghFLgA0q0kPpW4draji73wE1RdxNX2POH9GP9K63Kxpz5yObSGcfsc9qc8NYTiRsXubboC0qeAOTknErjWZPLwqpAlydP1p6q3YOnmRfE+d0A1hdU/lMHPQnifz11XVuJEYp6jKkCH98ivU39JZMunC6ygleBb5Of1iSjAseelZ/EGD6cAmgU/8dnmcx429d+NIvLaiLfOb/1sZf/lLsgzRCqW0AN7dOS21SdhLtsDuZKcxAv4VRE3iw3aWLi3L7LGxSjyUdythpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YmkcIsRk6ZUbYkHiN7O7A2pwNm6EAIYWqyALY5tDRc=;
 b=KmTpyllidkO/qg6tvU8gzLsdPARnde/eZqRH1xW5yqHch9pUF4x34wdYyz+T2ws0z0HFRtHgu5TThyenJhXaRhg+Me/EcIDcv3yhaoEm3TsQyeFOqP5XvnL16i4TVTGeGA0Lj+10cFFLB+WTjq3CMiAJvS2Q+7RIJf3i0XTKthXP83oEuFbSW5krZdy18BuIN6uKbiPct5bw5zgrfhd41cQ1/0v70JWmj3YUDHXT7mdADcbUo7iY+JUNn88LlOISpJa2UvwFrOKxJEh/gpqQMEgbjQqSC4n/O81rTTz1f4bKneNGt2snfBLo7njeaz67nC/0CBRkDdOJ/NkzkDxeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 14:44:08 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 14:44:07 +0000
Message-ID: <678624b3-bc88-4b8a-a99c-4f3a6ba2d84b@intel.com>
Date: Tue, 31 Mar 2026 20:13:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <jianxun.zhang@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
 <20260325212208.85743-7-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325212208.85743-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 72499c8b-6822-495f-90f4-08de8f33f614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 6LFYIkEiaZxboVDcrmUGWLIIWx0TiXK8wszG+lEKXeEubcsek8E+uhNyLG9ntN/FnZrSXvpZZ0i4xQPYvLDKgXYWZZilQwp/neYK0904gnPUPskCIXHdnAEL6o0Y8vyAKIgQB2dx/hYFUXmgVc+j4K1WpH8ywWRgu9pMxe0M8slvUBc+2sZpAjmBP2fqD+Y5jNY6SkY2za6ALtCriFTsELvVakP8Kr5CjxJsqUJ0BMsZRMmQzStJyfD8Javp+KiwfePDIzk4Dt6gfJyLB0uRRB0kU4yHFZzMeRMkL7GHMFBKJjFV6T2CAxO6Hkud9RC1IWS7gTzmUeOJ0R2DP97jmrKM0GcCJQ/xPNfalDPtiVnRzxqiVxx3DMm9Mv/txiIwBpNDBoBKrnHfjz2L8euK8uqzAOqNqUBJtoJ+oWpMuTx0xHO/BR0E33z3FoqkSaSSzXHwr036QLCKwQXY6Xga35+eQtKNPl/ZFbWwVUaHT9JraUC2ibTWpH9WiduKy61NbmWR6rn4G6m05CDyy3NGC+aiCFJ20Neh4uXVS3FkdYmqUEWj1LQa911lzXk52s/87dFjZdqgsLKKTOMqp7lQS5PwdtF/Jlck/9pm15wBeRi91sqo/RvmX/xezNdscSB+NAqjJWrA7FuqBixy1ueLixMHjh7vylASfeI4Gp/SeY7pmwDzVT8z+4zH/24Sw5OKyXKv5V3EpivoeIivDmGEVqUhlwpCFOQckomKc7EmV1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEhWdmw4U2RKangwKzByOE0wdmpqRzdpNVRGUVZlV2ZyanEvVFBxczJDT3Er?=
 =?utf-8?B?QlFEenFrdkxtQnhMUEZJNy8wQkIwUUFNektaS3E3eDRZeGVXQzF4Qi9zUkhq?=
 =?utf-8?B?Q0tRRzFDWU8zS2lwSEVjWFlXWS9scDZ3VTd4RFhjM3JMZmtlcWtoU2pQMlpl?=
 =?utf-8?B?bkhROXEyT3RtMlNQZDdUMWNidkUyZk1SZVk4RGxwc3c0RmhKdmlkV0hzVTFX?=
 =?utf-8?B?NFEzd2tEeW1rT1MwNDFZTUxxb0pFNkJRZUFnVFhvZFdrMFdPMG1Ub3pVbmsz?=
 =?utf-8?B?VXkrZnNnbWh1RTdzTkpCekU4QkFuclA5eW4reEVtTG1QTlVxbXd1dUc3VGpC?=
 =?utf-8?B?RDcyYmpkTFgyVWJibFpFWFl3OFluUk1iQjJpN2lRd3R3MEN1NklWQ2RMd3dC?=
 =?utf-8?B?TG14Z1JFcWNaVU5pZEZzU28ycTNWcFg1ZkVTdGF4Ym1tLy96bnJFWjgzN3hE?=
 =?utf-8?B?STVZWGtSYmwrWDkzVDN6UG0zaWFrc2RHMm5BeGpnSWtnWStVc3JPQkhIcklW?=
 =?utf-8?B?anhMRVQrZWpkMnBrekFqeStaMU5ybWZuVzkxdEFZcWNoNUJGZjdhSHlxazFt?=
 =?utf-8?B?QS9kc0w3Ymsxay84RHFKZ28xamk2UTdoRS9oRVNQSGMrSjN1bHkrSXhON2VK?=
 =?utf-8?B?WDhLNmozZWJwWG9kekwyWGRmOUJOdysxNGxBcWVjWnhFbVlvMFRjVm1iSUM3?=
 =?utf-8?B?eVhrMzY2MStiT1M2RnJPWXhlZnV1V0czRzQ3NGNhSUxDK3BvTkkveVRDQzRm?=
 =?utf-8?B?c1RNRnVKNlI4cGM5M1dzWnExVzEwUkh3WE1tTDM2aWdpeHQzaUtZU1g3dHFq?=
 =?utf-8?B?NHY2bG5PVnM4N0plZjI2MThDeCtUUi9rb1FwMjR6V3JGQ3ZyRzhLbkt6SDds?=
 =?utf-8?B?N2xRbTRzM0VGMmZnaHBqR09xN2VpVVoyMmdZK2FUditSTk9jMVFLRGhzQjBQ?=
 =?utf-8?B?Ym5ySmgwOHM4RVhUZjJDZXZISm1Fd3BPK1dIaEFoS1ROb0s4SHRkaWlzcWZE?=
 =?utf-8?B?cEU5blk2NnFrTE8ySll4YkZDd3ZGM29Wcm1HNmRQUGVUbm80Rk5RVFFCOVhO?=
 =?utf-8?B?NFNxRjF2eDkrRDN4UnptVWk2empjWHdibFVtNEFFR3d2MHRoUTVQbm5CYllP?=
 =?utf-8?B?TGQxeFhCUjltU1ZYWCtWSW5GblhWSzBjdDdTVkw2S1IrdnY3Q2tqczZJRjVL?=
 =?utf-8?B?SDRIRUMzTnFnZzdLZ0lvajVGdWMweGxxK25xakEvTStvSTM2Z09WWDZ6eXph?=
 =?utf-8?B?bVk2QmI2RjJhUHdUZmUybWRFU05BZ2JOTTAyaDRMTDM0SkVnRkFTUkcyaHVR?=
 =?utf-8?B?NXlGOUNyNndyRXpqT3NhZ3Y3VUxaS01KTS9HM2FhYW1hdCtlSG5RUmtMaGp3?=
 =?utf-8?B?bEN1TWtxbzl5dTM3YUhlMTk2dnV5WWxXVnFGTTByUDdaUEpWQkg0NnN6ekVI?=
 =?utf-8?B?dXhLYUM5eEJWWmJOaGN0Tjk3a2JZQW9oUjQzbGlXbkdIelpGVEt6U3p6V0Mx?=
 =?utf-8?B?RWxCS3Q2OHA5THFOL0hza2tIRENyT1JHZXJLSnBCdmdrVUU3V2tKaUd0djE2?=
 =?utf-8?B?SmpkTm1WZHdEeU5VOHFBMXBuTmo2djBNbStRYTVmT3I4VlRrQ205aHRiT01L?=
 =?utf-8?B?RDl0N0FxWmRiUTBwNGtiL3N1Yk95eFg5NmJpcUg3cUlHN3ZvZUlvZml4UFA4?=
 =?utf-8?B?aWVnT2dCKzFzYnlPVk0xa0RVRXJnR0V2OGVOMm1BdkVEZmc0UXZrTGZHMHB5?=
 =?utf-8?B?QzNhZ1RtS20xQW1jMGFCUUEzUW9Nbzc2NFFQZ1owUE5Jd25ySisyeTgvVGN1?=
 =?utf-8?B?a2k5ZjM3VWJqa1c4MkN6cnIrVXNucGdtRVdoQllPa2hvM252cExDSmRIK2U3?=
 =?utf-8?B?N0NaNGViZm1VWGFwTWtKUndvenJjVVNBWFVmY0pvRUdDUnF0M01ud3UwV2pw?=
 =?utf-8?B?NkM5bXFXd0FJVitiQlNlc01aUnV4R3BTTWkxZ3VFN05mM1NHbXpsT2xNYUVF?=
 =?utf-8?B?eWZFUUJLNEQ0Mktaa2N0NmM2Tk5wVjE5eUpsb0tjUmlQWFU1Zk5qa2J0NVJZ?=
 =?utf-8?B?d3Y0UnVIdUowaCt4OTU0VW5oVEdXVUEvak5MdUlpaW1aaFNkOXFkVmM2VUtw?=
 =?utf-8?B?VW4wZHN4Z0M3UG1sN09wWXgzbUZwMGtjZStESi9iYm4zSjJTY1VlZHk1emhJ?=
 =?utf-8?B?Sy9hVUNaTHhsalFVOWhBczZwWmVaL2VqVnJvbzhaQ0ZSdnRUY0RGZ3Zrb2Zj?=
 =?utf-8?B?OHFycmMxT283SEN6TGE4MmF2ZkI0U0FaVjhaaTlsSGxNSmZwdC9FRUJvZG1x?=
 =?utf-8?B?Tm5EeWlSdDVYRk5QQXI5WkhIZjBRendNWG1rdkJRQ3B6VUlMUzh4QT09?=
X-Exchange-RoutingPolicyChecked: KLgkFC1FHOZpmCTqYocWBaKqNq8sB+VuQ3J8trfb/Dcttp9vQ0t9LZlgUZB3hFfvkx0u7g9TM5LUovYKlQqgBNi39bI7t4ErKpw3omwDhsKPgMsL1d9V6a2uS0GGyBe9eYwQ7WoCBa0uChrU7CgyRh+fRiRfrNlDCojAkP2vn8YmmAwFeYO3VMXbA5LWhs5RxWqZ1EBxk/nXpk0YEnf4QmYZtBVX7AjzgB5HY2titaS9n6/m0oK4Zn4aQQz2toN2mr96kWxHMrjQ/lQKnJG7XHVpotVGVHCCx5rQSVF+zDG6X1KduhAfP/Dxkq3gjIC+aI/WOYIj36FiT6XQ4gQnUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72499c8b-6822-495f-90f4-08de8f33f614
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 14:44:07.2603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azB0ydvYYutiYBJbh/VB8maOrfB7D6UZXD+zzfUMgoMGFLQE09/Z7xoLqxwmdWXaqLxHxOjl3zCLkdP/JIN6ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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


On 3/26/2026 2:52 AM, Jonathan Cavitt wrote:
> Align with 20250403173614.67195-4-jonathan.cavitt@intel.com
>
> Add initial declarations for the xe_vm_get_property_ioctl call, including
> necessary structures and IOCTL macros.
>
> v2:
> - Remove engine class and instance (Ivan)
>
> v3:
> - Add declares for fault type, access type, and fault level (Matt Brost,
>    Ivan)
>
> v4:
> - Rebase (jcavitt)
>
> v5:
> - Clarify canonicity of fault address
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>   include/drm-uapi/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a682..f5de148257 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -83,6 +83,7 @@ extern "C" {
>    *  - &DRM_IOCTL_XE_OBSERVATION
>    *  - &DRM_IOCTL_XE_MADVISE
>    *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>    */
>   
>   /*
> @@ -107,6 +108,7 @@ extern "C" {
>   #define DRM_XE_MADVISE			0x0c
>   #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>   #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
> +#define DRM_XE_VM_GET_PROPERTY		0x0f
>   
>   /* Must be kept compact -- no holes */
>   
> @@ -125,6 +127,7 @@ extern "C" {
>   #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>   #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
>   #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>   
>   /**
>    * DOC: Xe IOCTL Extensions
> @@ -1249,6 +1252,89 @@ struct drm_xe_vm_bind {
>   	__u64 reserved[2];
>   };
>   
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> +struct xe_vm_fault {
> +	/** @address: Canonical address of the fault */
> +	__u64 address;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @access_type: Type of address access that resulted in fault */
> +#define FAULT_ACCESS_TYPE_READ		0
> +#define FAULT_ACCESS_TYPE_WRITE		1
> +#define FAULT_ACCESS_TYPE_ATOMIC	2
> +	__u8 access_type;
> +	/** @fault_type: Type of fault reported */
> +#define FAULT_TYPE_NOT_PRESENT		0
> +#define FAULT_TYPE_WRITE_ACCESS		1
> +#define FAULT_TYPE_ATOMIC_ACCESS	2
> +	__u8 fault_type;
> +	/** @fault_level: fault level of the fault */
> +#define FAULT_LEVEL_PTE		0
> +#define FAULT_LEVEL_PDE		1
> +#define FAULT_LEVEL_PDP		2
> +#define FAULT_LEVEL_PML4	3
> +#define FAULT_LEVEL_PML5	4
> +	__u8 fault_level;
> +	/** @pad: MBZ */
> +	__u8 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
> + * and sets the values in the vm_id and property members, respectively.  This
> + * determines both the VM to get the property of, as well as the property to
> + * report.
> + *
> + * If size is set to 0, the driver fills it with the required size for the
> + * requested property.  The user is expected here to allocate memory for the
> + * property structure and to provide a pointer to the allocated memory using the
> + * data member.  For some properties, this may be zero, in which case, the
> + * value of the property will be saved to the value member and size will remain
> + * zero on return.
> + *
> + * If size is not zero, then the IOCTL will attempt to copy the requested
> + * property into the data member.
> + *
> + * The IOCTL will return -ENOENT if the VM could not be identified from the
> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
> + * providing an invalid size for the given property or if the property data
> + * could not be copied to the memory allocated to the data member.
> + *
> + * The property member can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS           0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>   /**
>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>    *

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

