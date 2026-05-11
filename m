Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B173CD37B5
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 08:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECD810E4FB;
	Mon, 11 May 2026 08:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YADWQVio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D558110E50C
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778489488; x=1810025488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u4cndiWT+zV17mLQmIeIaHPe1TWo5YY59VLtIt5xryQ=;
 b=YADWQVioIvdnd657iyzaoa6CE4gygqCF6hSO3rEvQVIbH+a48DXU+Ga/
 qd6xcpCNTVg0XDbI9n9kgeUqzRD2sOApo/qhn8vAKdz8QR3GsA7hfg1IA
 BN/sO4WfKuf18usgU3HPH3CITxqizBnnBvNPrVvg3ZjjvkBEn0QMsaF6F
 qBZtresR4q/6VOFQWaGPn5/28CgjxRRdFSlnp+hEvEx8kxy/BuHCLiYfR
 IS9QexHk99z8GXGJ5/T3yT06yXhZTAwJbdxHJWEhM0cBm1t+qP1rOOeMA
 zADcd049aIX4Vna4or8p8BW3m8ptReWwL9Z1c8atwAYjpQhr8oxH7iA+1 Q==;
X-CSE-ConnectionGUID: m4JkGHaPQ1iEFXWVWBwSIQ==
X-CSE-MsgGUID: BeiICGggTqSgtpdx262N9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82982638"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="82982638"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 01:51:19 -0700
X-CSE-ConnectionGUID: 5pAps/tcSKuOPF0THH/6Gw==
X-CSE-MsgGUID: hRElPTAGR2OHejuJJNkj4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237625312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 01:51:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 01:51:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 01:51:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 01:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eyg2mKlfvVnCBG/H4ayBOKwkZMIMzLID1X5CWYimduCIMIH/CPLBpdRdqmXf3uSQJoIbCW76E9gMZEgfhzJHPHL1JxTXw8W/7CJB2IZbzSy+NUzZ/fLpBI30lCsW/ZRZkM/IQ+t8Dpqwb0VW7719F7rkonHttRuTmBB3mF14MmQcki2cSHWums+w6GXzsIZc/VxN+IbE4+qPxS7tg/3T3sH7Znw+VtkxW7Ngm3KdpP1P8+RocqnxgGn4ElYu3Pk/XXInwSdTaF8RlBFVHsGrz5SlFKxgtsmtA4JHztywaza+GzeGujYAxYIy4k0RSQlyPkbytQ5ZLjCIIVtVkjSOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ1ooOZ+YMP1snTBbFamtksHT64ynUFG2rH5BmRlZpo=;
 b=RSnKhd0UGPbkuTC6DIjfH7y8qDPtpd3V1elopuaDuBjvTuXsvWNFis7amKXstkZbCLeZJ2cCYqE0Bdiwi7kc38wSN4Fr3F/5Ca2T4+VflMqKJY9nj/J9ObCfFT75IkTDT+qHzBxXNkq0TzJDPL/0GeGkayl7DxO6+xtD3UrS0CScgA1PMM6LIGmXSRsFY3jExwpoyIIh0lH4QtjOSd8pnfUzgeQeWVH31+XYxjXyag0MW4N4lb9RI29EtAb13pkAQbZ9moDmKVfLDgMG80m8GRbLDbO+530nZyAZG6t2e3X6mkp80eVvrXuBPI3ubRI/QTFdhEkBnyqvpgEF8BRnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 08:51:15 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:51:15 +0000
Message-ID: <be508e0f-e324-4f38-b5ba-b05a3d3fdd8e@intel.com>
Date: Mon, 11 May 2026 14:21:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] tests/intel/xe_madvise: Generalize metadata
 and group purgeable subtests
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260511035310.32323-1-varun.gupta@intel.com>
 <20260511035310.32323-2-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260511035310.32323-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::16) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ebcad6-826a-4394-8ec8-08deaf3a75d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: IDD9z/1NB1f+1MEU0rhm+RwmpzgNL+vdE/z0zocMFVXm2OwSWTf4ocXZ/daBs45ia+FMZlan14Cgoi9fFpgGsuLT3+5G0DkdVsciVjuUYtokdtJ4PVAhj2gaIkXLiFXizYqVXDsfYBtVs77z24aTIpqlt25ax7HFn6etZwPFjkJKzFiBk5T9uexFhLAnskRCOssdnadt+s5uDctA1J2onpzdNZ6Hzwc9jLuH96r3QWoDQZ4SRcz9GhVnCe0dp0ogBSaqazVfusyTVv1P1n8ZAk2WZ6adckZsdT7hlVqc9BjkTeQcRRfKQ30r02qKmFD6Aw5igOsCc0UFCt6sCprPvS/xJv8XU2YlTh5/pB5dCmAPNSmDQgl4MLMNPaNMahev5z/f/J/ecUukeYq74FOSAWIDZUdR5RYhbNq9jcESagsfOxhrp5w6grVSj3J1p0Alad4sXi4Ap6AAR+NxYFVLfrclxOqFndBpmD+iaemzROoDzi+taH3nx9dXc0MkXvmtPkwRYL+0hYiC/vMAAVzXVNaCimpp4k78mKTwcNR2L1R87WHOQR6LBBMlOpHDEtTiUWDWBxoRwoRFuYWVNt05gpoKEXolf3gf1c5C+8EPpcRk+vog0Akvos/Tnj6Lu9VBK/4pAG7UzLX0O5NL/RMsbFUFEF9LTkukZoeWjrRgBoPmOO2scW8I84fMxLc9QsOP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGR1OGNkYmZyNWp0djRIU2dNejl1N3FsLzNCNG1XRG1vZmJOL2U1ckFORXpM?=
 =?utf-8?B?M0o4ZVVWeTlsMVZtMDBPbkRYSW00a1orOTNZYUkzc2llVDg3VElPaTRnSWNh?=
 =?utf-8?B?d0dwNDdWdlNOd1cvaDBWM3VDaW5RalpKdW1IWmU5aG1DSU55dnFvcG5TT1FR?=
 =?utf-8?B?OERVb0hCKzF6eGdWZk90T3FXTU9xclBoTnU0OU1hd2VRdjcvNDkzSGw5bUVz?=
 =?utf-8?B?UEpqVG5wZDBKYlNjWGw4eFFJWkwrYllWZC85eWRmRXdDQldRWWtlL1FYL0lH?=
 =?utf-8?B?R1hSSVVGK0NqUndDaVFqK3RIZFdMc0VUS0J6Y1lMZXlUbHUrUXEwbFBvS3Bk?=
 =?utf-8?B?MnU0WGVxZWtVUnozNFVHem1nWlc3ZDVQTmpZNk9zWDhoSkU2WkNaM3Nvc0da?=
 =?utf-8?B?QkdtMjhScXVLdW9weXpRSHVTc2NDZGdUNjJxVEc2SS8yQm9heVhUSWtNNDJJ?=
 =?utf-8?B?YVFYVGlGSkY2Uk05SGgvLzJaWktuNkp6b1I3TmI5NUQrZEpUQmRDVDQ3TmZa?=
 =?utf-8?B?b1FTYlBWVmNDeW9yWkVrYlUvSkZ6Rlk1WEFTQlpXSDE0MUxrajdMVlN6NTdY?=
 =?utf-8?B?d1FyTXloYzVjd3FjZDNlN1UrMkVLYklUTDFBZVRheWtmdW1WODBod0d4MHVX?=
 =?utf-8?B?RWdoVmp3WENNODNBVFZ5RndJTHcvZ25kN1RRakthSVJQOVRoUlB4UXBEbTg1?=
 =?utf-8?B?RVo1U0QvVUxGd1UrTi9jcHJTdGgrR0NwYnJwU2FreDVTSHk2ckJuRFBMd3d2?=
 =?utf-8?B?UTRtenNvV0tCYU40T2xyT2k4SE1yUkMvVXNRTlFPRVdKNmdsZGlxbGMrR3BI?=
 =?utf-8?B?SHBjcDMvdjBTT0t0eDhFZVpYalFaS1N5UURMVDJtNDB1OUVoak12MDVXa2NC?=
 =?utf-8?B?SHAvYTMzN3d2Ym9yS0tuYkJwQlpkZCtSUWFsaGRBcTNMOUlYYkFGam1ZNG83?=
 =?utf-8?B?enM4dTRkQXhLUG9hSXllU0tsa2tQSVF3NmZtQ2RIaC9lV0d2RElyZ2tPVWQ0?=
 =?utf-8?B?dDJxS2ZHaGV1SGtWK01kay8yRmtKcXVrUVhMak0waFlQTTN0dkkyK01MOEho?=
 =?utf-8?B?MndtYVJURzErYVlmQWFUSnpnTXlodFBUMTlGNmdVdUJlRVhYVHpCNDBDdWo1?=
 =?utf-8?B?bHpjTWRxcmRiTzhoVzkrNEIxait2RzlENUZLUDZjdEZjMTFhQXlCQnk0NS9x?=
 =?utf-8?B?M2p2WDlGTERIcnZLdERIR2VUeG5kMTBZNDJ0OGFkYTl3R2tNMnlURUpzS1Bh?=
 =?utf-8?B?WFFHb29MN3phNHJnUXA2NXczNGppTExLYTVKVWJUL3FNK2xrOUV4WHZwUnNX?=
 =?utf-8?B?UGtBNkFEMTd4Y3ZWRyt4MDl2Z3VtcVBOMFlVTEhJdys5RnVTWTVQdlVuSTFQ?=
 =?utf-8?B?QkR2TGRDd2t5RmRLQlRzOTd4dzk0dVpjVWxUem5LOWdPampkdi85Q3l2eGhV?=
 =?utf-8?B?OGZJVmFabjROV1hsMitGQTNsWXJYRVN4T3FrYXNpZ3VHWkdCU2dKZ2M2QlFX?=
 =?utf-8?B?M3FuR0IxTVF5Q3RJa0ZSRFFOdVFIaVl4amFmK1N2UC9wVDhWdFBIUjgzRnUr?=
 =?utf-8?B?bkRhRitmeGhmck5XMUdLeEVMNUhTZFJjZ0JQSmYxcUFaRzJZcU05YXl5ZXZr?=
 =?utf-8?B?TkNKWUdVaER0bG1obVZEUnVhWjBNZDZ4MXVSVC9jam1LOXNmWCtYYWorOVRP?=
 =?utf-8?B?a3F6QnBOVjhHd1JxQ2RiQ3IraGw5YTFIUmQwaEQyZDZkKzJaR0duSGpZRXVT?=
 =?utf-8?B?WVdxZEg4K1d4TE1EZG9JMERqZVlxZFc1WW55aTNqQ3hIeXpuVFZEb2F6Mnc3?=
 =?utf-8?B?Y0laK3hxcytuMGpocFJ1Qno4Y2NneU5TVEJYejNnRm9SdXQxM1Z2TzNPRThZ?=
 =?utf-8?B?VWtnNlJxOXNsbHYyOC9sOU5DYmJGdmhGTm56ck1FRDByK2pWSDdGUzVDVjUx?=
 =?utf-8?B?V2dzT2prTHZaaGE1NWdwRWh2STVpc0prQ3c5V1RjUmxMQkhQV0ZmNmdyaUJ5?=
 =?utf-8?B?VmcwNitCbkIyNkx1N092K001cFRtOEIvLzAySUMvYTFjc2ZIZEI3MUI2c0Rs?=
 =?utf-8?B?TVpRd2s0a240bVZtSDJVZS9iaVB6ZlN3TGFzNzBjT3ZIZzdRRmdLMnFCOUtD?=
 =?utf-8?B?andxUTRTMk5ZSDFPaGhvVzlSNkZzdnJGL2Rxak9wQ0p5WjRWa2orNmxvZ0ZV?=
 =?utf-8?B?NTF0QzRNQ2FhMkc1MnJNV1pZRTk2Z2ZXUW1NUDhPRTJKZ0MvOThkUFRDb2M1?=
 =?utf-8?B?WkZ2YjNLMHhxbitpMWZVUnJYNm9oUXl4T1RWUU02WVlwUU5GTTdSNzFrOVlq?=
 =?utf-8?B?TnRDRkRaaDFabWwvMXplb3RCS2trV1ZSTkdNV1VqcXFKbFpOUXExZz09?=
X-Exchange-RoutingPolicyChecked: BYNyyH113YnS+LvamxhOFFw02HA/VxqOXHvhMNLdm0GbmNmWG9IpWmdM627uJt6rQ7lXTuip7B6rAQBc+uFIoWbqXAsC/OgcwuVvR884ZCCc0MR0RLdr3oJ7F/XAfT1ELjlJPgAwkaF+frFOIaTpfdXZnYWue8yFhXYjinnuwboDVLzjcTbIjFZeVbZSt0+qINEjT2hgXuUCSRGTWwiVP9O9zA7WS2vMVC95nbYrqchNaWmNsMZe6+f7shKHbfACmOiLFenXo4C87AKVf1dFAcXMED00Gd4HOhK8rD9nsqI8p3VrPUVXOKZB2KAzFRvkOW/UJJa39ih3Svbgqn3uZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ebcad6-826a-4394-8ec8-08deaf3a75d2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:51:15.4899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ltV1moUcWZCHVpwDzMXrUWAJ8B2pDPR1sLHgXR22rXYUXzytUZVqCAj+yY/7Xujm3BF24vB/uQOYJmnGeAhKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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


On 5/11/2026 9:22 AM, Varun Gupta wrote:
> Generalize the test file description and functionality tags from
> purgeable-only to cover upcoming atomic madvise subtests.
>
> Wrap existing purgeable subtests in igt_subtest_group with a dedicated
> fixture so the purgeable capability check does not gate future
> non-purgeable subtests.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_madvise.c | 94 +++++++++++++++++++++-------------------
>   1 file changed, 49 insertions(+), 45 deletions(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index e9bf55ff5..e79cafbff 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -4,11 +4,11 @@
>    */
>   
>   /**
> - * TEST: Validate purgeable BO madvise functionality
> + * TEST: Validate madvise functionality
>    * Category: Core
>    * Mega feature: General Core features
>    * Sub-category: Memory management tests
> - * Functionality: madvise, purgeable
> + * Functionality: madvise, purgeable, atomic
>    */
>   
>   #include "igt.h"
> @@ -776,51 +776,55 @@ int igt_main()
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
>   		xe_device_get(fd);
> -		igt_require_f(xe_has_purgeable_support(fd),
> -			      "Kernel does not support purgeable buffer objects\n");
>   	}
>   
> -	igt_subtest("dontneed-before-mmap")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_before_mmap(fd);
> -			break;
> -		}
> -
> -	igt_subtest("purged-mmap-blocked")
> -		xe_for_each_engine(fd, hwe) {
> -			test_purged_mmap_blocked(fd);
> -			break;
> -		}
> -
> -	igt_subtest("dontneed-after-mmap")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_after_mmap(fd);
> -			break;
> -		}
> -
> -	igt_subtest("dontneed-before-exec")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_before_exec(fd, hwe);
> -			break;
> -		}
> -
> -	igt_subtest("dontneed-after-exec")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_after_exec(fd, hwe);
> -			break;
> -		}
> -
> -	igt_subtest("per-vma-tracking")
> -		xe_for_each_engine(fd, hwe) {
> -			test_per_vma_tracking(fd);
> -			break;
> -		}
> -
> -	igt_subtest("per-vma-protection")
> -		xe_for_each_engine(fd, hwe) {
> -			test_per_vma_protection(fd, hwe);
> -			break;
> -		}
> +	igt_subtest_group() {
> +		igt_fixture()
> +			igt_require_f(xe_has_purgeable_support(fd),
> +				      "Kernel does not support purgeable buffer objects\n");
> +
> +		igt_subtest("dontneed-before-mmap")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_before_mmap(fd);
> +				break;
> +			}
> +
> +		igt_subtest("purged-mmap-blocked")
> +			xe_for_each_engine(fd, hwe) {
> +				test_purged_mmap_blocked(fd);
> +				break;
> +			}
> +
> +		igt_subtest("dontneed-after-mmap")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_after_mmap(fd);
> +				break;
> +			}
> +
> +		igt_subtest("dontneed-before-exec")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_before_exec(fd, hwe);
> +				break;
> +			}
> +
> +		igt_subtest("dontneed-after-exec")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_after_exec(fd, hwe);
> +				break;
> +			}
> +
> +		igt_subtest("per-vma-tracking")
> +			xe_for_each_engine(fd, hwe) {
> +				test_per_vma_tracking(fd);
> +				break;
> +			}
> +
> +		igt_subtest("per-vma-protection")
> +			xe_for_each_engine(fd, hwe) {
> +				test_per_vma_protection(fd, hwe);
> +				break;
> +			}
> +	}
>   
>   	igt_fixture() {
>   		xe_device_put(fd);

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

