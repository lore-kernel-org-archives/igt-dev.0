Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C51CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 08:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6610ECD1;
	Thu, 18 Jun 2026 08:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwYCI2ll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC6010ECD1
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781771489; x=1813307489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B+fmJPr8AX3cPhJg95vPwMBqPpp272POcg1jWkc3BGU=;
 b=GwYCI2lljF/O86buq7ih07+RucSHY8k6FI/Q9oaIrLUSFSD2G4GnWZnQ
 v1NH5628E6SnLDvbXN9WZ5B0bAqAxFPW6GeL9Rp4pgaZk2p6zVUCb+NjE
 tzLuhkmHpBbuV29OtWQ26B7WsuQUhrsclv0vrL+Pi9m5X8AwUR8k8nqa2
 /byKECk6asheBhHFFgRg+4lB0ofW8+xLgc1pybemLizPMbBmeRD5loN1R
 cbupDp1jwpLmQuXQwE7Yo22oJlJnaxzMrmQcF5GfDlvll9EWXCVLb1HV1
 VzeI5nwz/3/8PGVCVA0dBYV8qFDuX8iC8H6KrAOJQzZRrI0p3usVAi6r0 Q==;
X-CSE-ConnectionGUID: z6V8AoGrQtm1jgG878rvFg==
X-CSE-MsgGUID: bL3fbZOIQ1q/SXq/aTrV+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81707118"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="81707118"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 01:31:29 -0700
X-CSE-ConnectionGUID: Ue9l9s5vQIO78zLdfedeCw==
X-CSE-MsgGUID: WeBNNYasQwWm+Tt39F3kxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="252202020"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 01:31:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 01:31:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 01:31:17 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 01:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjxGz0vvZ4+8ISHBxm8Dys0efVia35v9/cJA+W8lOvGNBhjBFZEj32bMjySx7JuPmEBiS9ocMqQoXW7ZkR9ePf90GHUbesmsqxBTuWbLzK3LbAJrqGCqsbxehp8xYhM27uHO2RmEt4k4RnYlHmOIo8eHqx4iKprXblRLOgKhkb0yG/BSHdsn4MWKJpQAHSN+QxD2dl8UhHbwGUOkm6sSrCkTXF3vTEWIAsGR+SoOd553GM5iHV+22CxA+kDTDjOKJSIQCmJ+mjREwEd41WBnEfJgpJWoCeGHqRAzKF+9IoFgbLVPSOEzHvppYEZPQFp3mBF8O7AWf+Srvs3tC7oC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS5ZKknK31uQSUYdfKpJDo8MDegg18nk/VIlr+cHNHM=;
 b=p2ISgxpRgKQ/Zfw1iCwcoiZQMio6hMdZbncWucWM4F33E8KZj7ZOVhsvk2+8RG2XVQlJqwYy0rIaXo//zRoU/fvVOuso7OmyRop+J8+KukpRgidd+s3DW8qU0HG6y9K8TFeN/eee8g3vEbbAT9rnrS4T6P/G6WT0D655ORKMNgvZIDJStv6u0wagwDBMh2J4N/SAWcL1g3MeZpRnzWSjMir/jMXjd71GfMSSMrQpQDZ/s2gvQZLxEqvS5gfDxRNcS+2pAk3MGCxTMYmcMntvHRiuib06pYqRmCpkkiFZpLvtkCUgyzVFysJWeBYvahCREQvXFjc16o17Lz89lzztag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS3PR11MB9648.namprd11.prod.outlook.com (2603:10b6:8:38d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 08:31:15 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 08:31:15 +0000
Message-ID: <74d5bf82-ad2c-4799-97a7-7a3a60f1a5b5@intel.com>
Date: Thu, 18 Jun 2026 14:01:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/3] tests/kms_hdr: Simplify flag check and
 continue with next format on failure
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <sameer.lattannavar@intel.com>
References: <20260618063347.2940031-1-pranay.samala@intel.com>
 <20260618063347.2940031-3-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260618063347.2940031-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS3PR11MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6682ba-74fd-4763-e649-08decd13f605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|23010399003|376014|1800799024|4143699003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: GBgbdVFDAVLQHbR/eJW2kOtj+h7IfxJfEevaPWCOEtRo87Sk8kbHCB2YwFZwPCJIwxuAONzQozW+KJwUZHTaZBs08ZOLvlWaagCdFvyhr8QcweplhFUxbQmfc2r6padevUMzZPpxfboMj9/KDrkE3PpI69HyBgoUFBdbh0+zO+60R8RXChwy3m3puPqZ7FvlUADDId3MaFdkGVEhc0foOneZcf2BM0PTAmBf1U1nODTvrksb+aqMlhGedvicNLBnOJ1ggFFXVUdTV5WrdQJEjL/SpaF6/5vSDJiadwPEfPPIXFufIuiHB/qFayracuypeloFYZxsxp9q6K8cNOwxJ+2RVSosj+6JLZ2Qc03NKaKkX2j/VuEPUApVnhm4TLATC4JFz7tUrwZ/zTVjqHS9tK1WsuW6oVIBQ4HJSzeDKfWVbh4Cl/8YzL+BTbiNpdcNeTqwGFFKpVqB6VV75Ah/ns5Pcf3xrh/pouTA82R2SpLoMyrJNSr5cg1aM5h6osN/OllfrPEg2SJsbvfDIypbcCQnuo2byM6325Bq7gS0dAUQyMoQMrv0YRBd80d2zd+1+kSJeARDuYZ0TuAvQAc3UG2GmGS4hP7vfQA73ph1CwMUtXFjPP3MuzWg7k/g7DchWTVLtNJt0mC7ptOIEoOg04z/9VcF7zlaryMcL6VS+iPhZc+68L60HY61fBBarshD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(23010399003)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWRHZ0VTZnN3STJod1g2eGhqL011L3BRTVo2QWF2T2xwYWRnQlJrZlZsazF3?=
 =?utf-8?B?YS9rSXNSR1kzRUVkTkdkd3kvUzMzenBTcUtqNDNNZ0hKT2NLNnpPZHVOQUd1?=
 =?utf-8?B?cGQvOS9sRnBxbTFxcWZLZ0NVTER1RzNBZ0RxQnZXcVBaVk1iWVp6cVJ5Nmhp?=
 =?utf-8?B?UFNac0Jmb21LUVZFeVdvelI4bW1EdDFaZzd6NlJiUHgwZHkzMERueE5LUEZ4?=
 =?utf-8?B?dWxFSjR0SW1Ka0w0Um85OXc5eEJvZjNYSys5WVRwSW1qQS9wQnVsNWdtSzlI?=
 =?utf-8?B?TG9pT0cxV1d6SWx4NDMwNytQajNaWEFoaUZnZGR5WC84Y3ExckNWSHhCTTlW?=
 =?utf-8?B?RlhCTUxIT2I5aFNDam82ZnEyc3dhZVRtSUtpVFBlWnNxczV2VVk0YmJVQktz?=
 =?utf-8?B?NVFhNE1hNFM3WHN1OGtsYjF1Z0ZhbEF1K1djeE15ZG5PMThDbnpQSmJhQmVa?=
 =?utf-8?B?QjA5aXQxRjhzMTlIa2Fud1M5N21SbkVBWVdXemx4RXE3ekkyT3lOTUNaaHgx?=
 =?utf-8?B?d0pPMm1nbHJpUDVJZ2xUU05oZGpoeTdadThGWEJabTN4MTR3djZEVnp2cUdL?=
 =?utf-8?B?RnBjWWFVRFArK0t6OGFPSllRRWhzKzhGTXh4NGdPa0JIbkpJeVZrTjIxbzNI?=
 =?utf-8?B?VHFVK1lZNi9xa0Q5UzFaT1ZYQmF2d2VmTDF1dW1tUGxzdjc2TnJ6Uk1ORWND?=
 =?utf-8?B?Q2Qzc0RXYk9mY0NJa1BLd3IwV0prSExnTkIyV0l6VndtRHdwenQ0V1h1VW92?=
 =?utf-8?B?MGd0aDdDdVhmaU02RS9VMGhtNUYzYnp4eHFqbjY4WWNpaitRN0lYSUI5TGZ2?=
 =?utf-8?B?YkJHekJDYk5lZTh0MnhPVHZFVkFScnowU3RDTHFWTXdIYTlqNXJBWmw4TnRO?=
 =?utf-8?B?UEhTSUxScFJidDVEc0NmYVhvNXpya3ZYRVZJK2JubzhLZ3dmZU4ydFBuRG1E?=
 =?utf-8?B?RVgwREwzSVB6L2dTQ0M5dUk5SzF0MXFQcCtiTlMrNllhT0YvdGJHb202c1hK?=
 =?utf-8?B?Nk5yWjFpajROaGI0UHM1R3l1d0hudjh4eFpoa2ZJSi8wbjdZcXBrRVFaelhG?=
 =?utf-8?B?VFphdDZBZTZkWU5kcktEbVFJSXNDYWdBeG10WHdGV2xoYkg0SW8vN3gzRjkw?=
 =?utf-8?B?cy8xZGExUFhXTERpWk9IOWhLYTgrcXp0T1lyb0RQeWZ0aG91ZVN3alRSMWk2?=
 =?utf-8?B?dFNoOEQ4azAwYTA4b1RlbGk0R1VnSnk4WlgvK2lyYU9RcFl0ZUtHSVB3b3ZN?=
 =?utf-8?B?djZuM2UrRXFmaTIvdjJLd0grVnNCSWcwV1VHZ3FiMTdEb201aForSFRZQ2lI?=
 =?utf-8?B?UG1SRHFVUE9oekV2UnEyK2tFMVIxWU0rNTQ1TGtkV1JyamRCRVR0cURZRmxl?=
 =?utf-8?B?UzFJVUtSc2NsS20zWGYwSnM1dngzMTVNN1JhaUJjM2NOazdmN25STm42Ukxo?=
 =?utf-8?B?Q3NNUXhCSEFlTG11bFZpY1pzUGRWaEpWcE1tVm8xd1laVFhYSFZITi92cVJI?=
 =?utf-8?B?bVYwc1R5dG1raGcrQWoyVHFhdXRiMjU0RnFRQzgwNUtCd0Z3RkZ4V040YVZo?=
 =?utf-8?B?OXdrWW15dnJRVHM2MFU4QjJLako1REJFckZEbzhjNGxQb21VU2NTOVlTNUhI?=
 =?utf-8?B?Mk1GN3VQb3VTaklEdXVMam9lbFpCRDM5RjkyRldTbC9FK0xiRHFuNDBZSk5R?=
 =?utf-8?B?c2t4cFErVzQzUXZyZDlObFdEZGExaVVSbGgrYlUrYlZBVTRnTmdPWldwVE1T?=
 =?utf-8?B?UmhSYjRCSi9Ka0pLbzhYc0twZXRrZklRQmVaOFR0ZHZybWMrdld4dG93bm4z?=
 =?utf-8?B?MWIwUmNMcTBmbWdqbEMyOURhamg2ci82aHZCajVFalBjblJsY1J4Z0dZRTJx?=
 =?utf-8?B?R2pMQldzWGJ4a2JBOVM1OHlIRk1OUitqdUIrTDRoNTY1THRpYUZnRUpSTEcr?=
 =?utf-8?B?MDZUakZNekc3SGZ6VVZyenAxUkNNcGJqWEN1NTVhajJrUVdQMnNUSUNwSVhY?=
 =?utf-8?B?SWF5VTZHZ3l1ckFiTUNpYjZNaFhmOWpTaUlXb05PZVNjdmlQVVpMTjIxNG1Q?=
 =?utf-8?B?NmRIMEZJUmpGMHhmczZMRDhGdTFRUHZtb1V5bVJHdnp6M0IxTlRNQ3NmYnd6?=
 =?utf-8?B?NEF1VGRkYXBqRGJaSVdWSWpTd1VLMkF0WVk3bVNTNTUzTUtTWVYxcjhjMDZT?=
 =?utf-8?B?aEduZ04vbTNBR2xUQlYrVTBTU3NLSDQyMkVNQkhTeHJ6Y3RyVCs2SWJCNDN6?=
 =?utf-8?B?NXZlTVJUekxzc0JlZHlSV2pjVUR4NmgrMThtTEcvUnVkVll3QmlLZ29NSXVH?=
 =?utf-8?B?a2tISmhCdHdiTGdvbXJZc3RYdXd5U2swa1RjQVoxZmRmSWhORm5JQT09?=
X-Exchange-RoutingPolicyChecked: V2aOH+hj3AWTqk8TXBD3FWu2Q3GoFLYKKyMtRN4rLkj9tQYDQOtmAlvJQyD9pN3e84Tp3zdOTuEDvjouJ+aoXAxR1lMm6u4hRQpf3uhTpw3G5hzxBKidj/f0d5/NZ7cgM8fCI+l14iSxVW5ROw3GIY1R7p2MSW7i8OmhfUR+dokQdmBEuP3ZSWx7wZ7qjx0gejA2X1oUUKompJ14BiYzA4sq4NRvOUFS7aTO58S7AcJGRkw99TqMInUOIOjiZ4425229qDSPj2rnHNGB/g033BQtZQJIJjVialq1yQDavWfb8HQ4Et/iyvDjcQLK45LOh8hpYfC012Irfeu8pFFVhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6682ba-74fd-4763-e649-08decd13f605
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:31:15.2394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymmoDLzzKcyWD3vH8kt5JZ6Qkjf2EFCtBp2jcGpWeMggv4i5MaQQFW8I1aVI3yoru/XQHYa4ydpe/Z7Mrmg0SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9648
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


On 6/18/2026 12:03 PM, Pranay Samala wrote:
> Simplify the HDR flag check to improve code readability. Also change
> the cleanup failure path from break to continue to allow remaining format
> combinations to be tested, ensuring formats that might succeed are still
> validated.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_hdr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 7127a56b3..c334c907a 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -553,7 +553,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> -		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
> +		if (!(flags & TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
>   			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
>   				 igt_output_name(output));
>   			continue;
> @@ -610,7 +610,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   					igt_plane_set_fb(data->primary, NULL);
>   					igt_remove_fb(data->fd, &data->afb);
>   					test_fini(data);
> -					break;
> +					continue;
>   				}
>   
>   				/* Reset IGT display state; hardware was not changed. */
