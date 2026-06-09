Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0177CD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6E710E52F;
	Tue,  9 Jun 2026 14:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmmsqi68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F4010E4DC
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781016821; x=1812552821;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UdTABIR7jm+i8mcT5f3few8FcA3HBHx1YtxVX7aULAQ=;
 b=hmmsqi687WC5MUFcuvMAKK/cUZmhB3IcX4OLiEr47yT4LkclwPI0PDri
 S+BJH3Gp+ygUHyG4fojX/uUy4vz0N4ohKLDBj2GtYcLdqLxDybTWZ2Bwl
 hjfJSkkZH8DrBcsrRk3Zcb5uGg7YxYGJ4Mtf7VJUFss2JJp8oS4xI5heC
 DNXobqumyPn/bWK+vGlqy8gWrDPMjAHy88adq9hPtF/gHQ2gogTphdhAK
 wiP5f8wi9gyQsX+oov1paiBtiY5esr4LSowaEw/Z93Wrb+NnTYNdi4R1S
 f2HbZs79mf0u8EBJIdImJDF50bk17rwhuoO0/abHzE+NqjBUhxo0hhAOx g==;
X-CSE-ConnectionGUID: SQE4eMavSci468hm1IQdmA==
X-CSE-MsgGUID: ZTZXfJdzRMa4qKN4dz8zvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80799892"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="80799892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:53:41 -0700
X-CSE-ConnectionGUID: Luk/Rkr1RCuHMB0LK3vazw==
X-CSE-MsgGUID: MKYkqI5pR/iX+zJl2FT7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="245924848"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:53:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:53:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:53:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvpcJujVrRMhtU4ffG16uhmfVNCg212/ujnagZ7uns9zwWrOVh6mkwlKSBSVWN8bStuaG5K8HCA5zBe9SO8hyg5GH8Hs+IX5IsSVAPjrX8evoO9IocgBxiMs0golrgasVDEhtmgAKikr6ZbH3d7bJkx5Zm5tBHA8P7hkdNotJqvWd3gybThb4rZH6Nc4hJmpIZHi8thzIexTRC2q4Y6vU97g3bV3Qa+G9UZNAMR5mmyWz984rzWZdCitj92gdjj8s+/VffiVAA3aYzjjPln8ZUFSChFlAoysW/pLyU/TQsSqYDM63IRp2JNgwmOJD9Xlar8OVt677eYDkkaYELXThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9wbdA8hyFIR+usI/ajY/YEUwNodqxInahBlZNXSJwg=;
 b=Bfhj2fPTRELtTe6NLO9nWo9nZ1IT7ahZ/ChUM9L1AnD4Qf/Z0bMHbiiD8PCx2qdw41uejILrd/ZDK8Gou72y9nDwi1TasmwRjqeuKAYnaixNM5Mw0osPtHE0T2lLu/wv6hmrFqFCqpHH1LbcKXKDIt0J4sEUGh1AhKh2ZDAUOIM+0XLRj28UWuk/oDbDyZ9SjyQrov1PzD1TrSW/ffeFM6Al8tmZjt6+BTE/PZzEJlbdH9BZjsaSiCfik9ytgZuhzvvfIBOgnf27Ldmwdw8HR0+NbP1BSQL3BxcVvDaUR5cUr8nvtSIwngde6S+M4tLZeddQ0j5hu3Lr9f0t7YEmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 14:52:06 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:52:06 +0000
Message-ID: <43a21ca4-0c23-4f39-ac26-8c055754017f@intel.com>
Date: Tue, 9 Jun 2026 16:52:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/8] tests/intel/xe_sriov_scheduling: Make
 sysfs_get_job_timeout_ms take const eci
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d458d98-42b8-4c0c-c866-08dec636acb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6yr7DqAk9FQMjSgFVUa3SdUO2rBpYH/OC28Wx3ZjxV0nsPtL3Yb2MGw5r4WQDLhKG1cNtq7Nqo19Nm5GxH4KvHKkcE7YpfG+vaPFkp22gHF35TLDR6sHi2YCUdn00otQLISWpOhEinvFA0QJ0Ela54ersJLy40DDlo7fxn794kw96T1FhC4+KWBV+HCT5LFVFnIEB257OHGX5JYTsCrJEUlqMR33bE9LOvF3JSljwlybZ9mlE6ZbkKyQGy4ioYvhnv/QxkotXoaN6Sgv5o3e19qtx6S1D9ycTfXKs7qoFF3zzTS7162P05/jdYUQ/ef2gjfEDHosuQSg4jX0b82ysGNg2o402PE8tmV1lKbfL1qj/BzyCG2GKae0mxNIAfgtK23JO/QC6vSIXwkh7GRUXKm36soJ+3A7yrIUj37Km6v1T/dKM2qC9APu81+vdeO1MFtaM2aqBJeUOqhRrhU7Ox1aJVcusP5q/gJBwkeTejv/qHsDPNKMLQ4ER/LvLLgm8gIVRKBnUYFY+CSunGI6xyTX+4rQs+HP3b129l5A/4ppmpugHYvMYE+UtgGj/v3DNwh+TzSfZjT3AdBKlebEZ3qJi5DFc6k8je7D1G+bPpMoKxrDBw8DLlBDit0W8WiKkP6HDK5HD/2bxYWn+njM7aZ6D9lIJvzbDP8fdtSngxiJinUTQox5MipnxsLFXj+a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzF2MU1kaG40K2JiZW5vY3k3dHAwUm1PMm9GUjRSNHdKMnE2enVybE5yNlU3?=
 =?utf-8?B?Mkc1aXd2T0pydjF5cDVRZEtyZXUyc2U2R1cyWExYenZFdlpmMmJZMTB2NmtL?=
 =?utf-8?B?cWdZRmJEbElVTUZ2MjVNTlJCNk8xQVRxUDQxeFpTakJRZ242bndNUk91Um4v?=
 =?utf-8?B?L0dIMEVFTjFiWENJV0Z1RDlCWEVvdzhicHIrOWNuSWtpOVZJN3VDVDlPTGRP?=
 =?utf-8?B?MnVleFF4UlZLSVg0aGc3ZEVlTWNQMG1YZVlSZ0pSZmJwSStoajZRZ01INEta?=
 =?utf-8?B?blIraWFCTVdscXZyTFA5WW02ajB6Vm0zQis0R0hXdDVGL2V5WGE0ZjVHVk1u?=
 =?utf-8?B?Z2w3eVBDd3FWbnpkK1ExUU9hdnROVHdqSXRiOXRvcXB3QmVQZWJhRk9HcEZY?=
 =?utf-8?B?U0xYclA4dThaT2RISEs2ZXc3NERSQWxnQ21TR094V3hqV013SEN0QW10QzFs?=
 =?utf-8?B?L0pOOUkvUFQrTVdHTEJNVVNpRkNHTjFZN0c0RFd0K2RZT2pESzlVc0dmYTha?=
 =?utf-8?B?aGR0RDRLWmRoL0JwMElDTytUSTMvR3dUMkhNM3JRYXdzc0N0TnlrZ29aTEhq?=
 =?utf-8?B?bTZ1SHEvZ0VuWjVIbTJuY3JsOFhpTjdyVGRJSXlYOVdtTzRWekFMS2gyYlJr?=
 =?utf-8?B?REpzQkd0c05OQko5VG9XanZXWGlTTDI1L2JZakdGckNGcDZnbTRKMWh5cmo4?=
 =?utf-8?B?dGFDL2Z2WlFhV2d3aVpxbTZWT1VWbDQ5YjZ2NTlNWVFtanpqaElvUTVMZjlC?=
 =?utf-8?B?V0NndWJXMUpEVVhRT1VNaVc5czlhWVlBSHZmcVlyNm0rdUlQdVlXSDE5L0N5?=
 =?utf-8?B?S2JTU0h0RFY4R1NHcVpIc2hyYkIvM0wxV204ZTc4RGh2dDdoekFWRC83aWMx?=
 =?utf-8?B?b1FQVktTYVNSaTlja01UOGxPQ2lKNU1IQ3hoa3hSTktuZzFIRDZhd0lMRkdZ?=
 =?utf-8?B?UlgwSnRPM3U3d2lZWHlORUZYQ2VVa0dRLzBQdlRFemtrcnFSdXoySnJiTkkv?=
 =?utf-8?B?WDJUYUVWdXpZOXRGTy9rYnNyOThmLzVHYU1YYk43ZW5EWWR4cGFZU3BYc0Zp?=
 =?utf-8?B?Q083MWg5MjAxZkpZTFg0c0VCbkVPSWpRU2hkaHY5eU5lV0JWR2pTenVCM3JR?=
 =?utf-8?B?RzdzanN6L0xsVHFPcE5WMm1PSWNpWmxETDF4aFB5cmZnWGg4R0V6azhFTlhU?=
 =?utf-8?B?NlUrdjkreDErQTNnSGNXUEVJKzVUNVdQMnJWb09raDZ2bDFOMHNmVThqWGYx?=
 =?utf-8?B?OHFKTk5JeUkyblpjcG9yL0p4K3ZiaSszRnNLaW1RWW8rWHJnd2Q4T3R5TElQ?=
 =?utf-8?B?b1VlUFNyRFVsaDQ0M01UR1o1bi80cFhwL2padHI2Tkg4d01xTEdlVWhISHhD?=
 =?utf-8?B?UDNqcmhLVlZwTXpjekFBMm14N1hkNzVFWGNZQTgrN3FCeDgvNEIvQUxkamU5?=
 =?utf-8?B?U3JPNjBDK1VqVVNqTUFnaDkrb2MrNENIaHgwWjlmWXB5S3VtMGRPR3pmVmMv?=
 =?utf-8?B?MVJ5dWFDcDBrblJaMXg3eG9hMWdGYzZRekIwaFM2MWc2L1ZkS0ZtYmpkbDJO?=
 =?utf-8?B?bDU2Uld5cDcwWDFPY0xmRCtleEhteU9YTmFNbWVRb0M2cXppd1FSbkVVMHM4?=
 =?utf-8?B?bXRVSXlPQ3FDb3hneFMycU91SVlrNFlLNnZhOXJPekNtc3I3OUxnN3lEdEdB?=
 =?utf-8?B?Q1hwR3ZDUzBleVluRHNQRXRIdVFUK3VMb2ZUWXVmNjVuWXhRTS9XY0JqMmdr?=
 =?utf-8?B?Qy9HcEFuVDNjMTBOd2hDMUVyMW9HaElqcjQwaHZCa2JTQTh3MXlCcmozMXZv?=
 =?utf-8?B?U0Q3enZ1MGlFK3Ezb3dvOS9wV2pCZUQ4U2pJMEVEOFFNOWZsUlpWZzBYcXM4?=
 =?utf-8?B?QXpnRkNuWjY5bmpQS3FQY25ZOERVL0hLWjFtZHlXb1JzUUdCVTJBWm12OEFV?=
 =?utf-8?B?Q2RCMG54Tkc1MVcwTVI1eXc5a3BQbUl6Y3pLaXNEOGorakZhTkkrRVdPOThO?=
 =?utf-8?B?bkxPQmxoNklzSlhRVTNwcm1FZHZSZ25rVCsxTFJRa2tSbzhXTDIrZUpYbmlQ?=
 =?utf-8?B?REZMUHduU0lhOVJJdmxFNHhhQjBqcUJ3cDMwVGFiVm9sUFVMVU1EcmJUR2VP?=
 =?utf-8?B?L09ya2dzOCt2ZDF2OEhHRnB4SEcvbkxLeFV2bnYwUDlUOEM5N0Vsd0cwb1hp?=
 =?utf-8?B?eForbzg0Wi8xY0puUXByelFGWlZiVkhUaWdaVTZFTWRmQnM0cEhkWmVqUitT?=
 =?utf-8?B?RHk2UTk0OWhaVGxPM0dmNW5relRHNGZQbklnOXVLVDZqL1BNYUNEWFlzMmNG?=
 =?utf-8?B?QmJNZmdraWo2Q25hZnBjMHN0S2JodUltV3FDVEVLZnBVN3p5czVzUT09?=
X-Exchange-RoutingPolicyChecked: mayNC/eZQkn1AStR7TCeLRpft2Z4WUKzoQ2a0fPz+ZV0X5bJdrY5gY6DhftxtQnuCH9pHA70VlYTm0FtZbZOKvgkapkUGfrtiH7pB8ugWp4Lu94Em01OcabnkyjCqH3FPyCkf1uau47NYLo4DvS2u+1RG8dXNNk/5tPbrUOujyHh8WlIPVi6iz/d+sSU1sfNSvkSfvsDdqqD+fQL+UG6b1ySND7QJU7NWK0TPpE/T8TsxFNyjCoRRSH9JLXDIo5o4CZtFHhwSqnK4aTFGSqBpQ3nlnR7vaDcg1N3O+leczo8dTmNUMI7LwXRvC5lz/jU4e/oQYKkYVyMLxzUfH2+tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d458d98-42b8-4c0c-c866-08dec636acb1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:52:06.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iltwiDR12daFVRzgM7IAhtZZF63w6QA8glnNqOWDOv2A5Ij7SOZLFLP5Ikq6wTZIT9GbTTbWpN8vDY/yg0Dn3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Mark the eci parameter as const since it is not modified by the function.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index f4e674fe2..f7cca95ae 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -531,7 +531,7 @@ struct job_sched_params {
>   	struct vf_sched_params sched_params;
>   };
>   
> -static uint32_t sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
> +static uint32_t sysfs_get_job_timeout_ms(int fd, const struct drm_xe_engine_class_instance *eci)
>   {
>   	int engine_dir;
>   	uint32_t ret;
