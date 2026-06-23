Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EEECD4F26
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 09:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D3310EA2B;
	Tue, 23 Jun 2026 09:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDyFP4K+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F64910EA2B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782205863; x=1813741863;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pApWeQm1pq27RZ1qJvoWECX8HOVDqL/kfB6uwTl2pWM=;
 b=LDyFP4K+NHZ3F/S3T6IF9GPLTNX9WMAIwNLk0ohGhqOmkLykCz+urhhi
 v107eZr9MukepT909c74z2pkvhl7yCqNcanPbGYQcY7xvyCMdk/L8F1Vo
 GmmDx+qgkdXj8ucZidNN4i5jjXjpCcYQqymH8/0+X8PKGOOQNlA8Nuayk
 Ls2uaU4pHtUXRKyNGJgJ8TEp7Fw0U4sfY5L6CUs0/GelKCDfKSqboVQEM
 nmH85Y5gVV4sCtpt5xjjdnp6sUIB4FPpfph6EKdiM8fRDuprHs7GEPZ4G
 BUOYpCkns2e1RZM7T4Ezof6TR1W8xLC7lqYHN6YozLlFpEubqat6315U/ g==;
X-CSE-ConnectionGUID: JtKW4U7MTkSUDM6Ilau/FQ==
X-CSE-MsgGUID: dAGxK7NLQLO1WLDdJD3rIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82829948"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82829948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:11:02 -0700
X-CSE-ConnectionGUID: QhhkD79WSUKxlbA/D3/6Pw==
X-CSE-MsgGUID: DabEZu7xQamJs/hn75Hcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="279648359"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:11:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 02:11:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 02:11:01 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 02:11:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaFdFqtoIduRoEeMXbsF6HvgLi0cPPLOUge+gyoGQ4MzGTeAOqZrsqjLZx5hfD79bVklGOgs9Q/Ot3j206lwK4s2rrZc68cXZMQhLDGrKJ/vFGKqLy2T0PiaUe6rbB71xYFGZblNWMtcQhvXMbltq7RAOcqVH+75A/KlcY7IrQMVCPMB43hHAWb7mkOQJis2OMUQQ3P+0yHBbHghWFNbTTqtzb746MgQFvKHNo+OS5ORb7DDnDpdiO0TiILxcH5GIKYNe7q/d0qt+wFgOp9JNLSMAn7zbGwt01KXSxnkYW8w5xhqXsTEWr4vSyZsBBOae296aULWSEhSbAsyVSxmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFnS1nMClv2/SfCsViqy4lrbySsbvQVX0Vlf4/SWMAg=;
 b=QdJ9XUJjpsHSr3JrHZuVrrcEEzqOb9LcBTJBOdHZxUxuofFE2+O4pyGkHuMBIZJ4+hRTBiAWOMv82trpPtkck1nV6dZRXqp0gaGP05Z1wxf9UCukioqE5+BKoDxO4PD2BTs7HGcqz18jZj321YJm3qpQbh37U1oUUqhKqtf8JvI8UdBU/gUOG2opEudO21F9DHRtOKL3APYpCc2/02qxwfX+Z5+gUXIH9c0doT+J6ABg+PTBxswmxu+g4I59Tn74ikwU804idjtvkEdwC3VBk1E+sGPfZk/w4O1kvS+BgC5aGVycR4THniMIvclw1rdlP3PkqU2qBv7fFseMqH9Lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 09:10:57 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 09:10:57 +0000
Message-ID: <fed379e6-5227-43f5-8a95-80ed2f634969@intel.com>
Date: Tue, 23 Jun 2026 14:40:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel: ensure stable GT C6 for residency
 measurement
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <dwarakanath.ramadeva@intel.com>
References: <20260623063559.223470-2-gajendra.uttamchand@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260623063559.223470-2-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::9) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: cf30501b-6eb1-4bb7-e1e9-08ded1075629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 99+MK/B3CQoCgQpj2ba4p38me0DxrhTrWZ5Ow5fCnXB9EpoNWLsXirU0nv8hHn5avrxyvD4+pCiWkiPFuS7kjUyKmOD9pp6Xzy+x/iVrK0oAT9VKgLVn/S3FXhQ1OEj7WxBRufu4b8Ku43cuDT0ncR+a3EirfYQ1JctAUT8xSv6tRpF8XGLkyzmiIqyfX4EXKD4bdSlyWbKVrSfFh+GxGG2KBm7vxHuS9WbOEEZfPM9CEN/0SP+YGyA3YBufP/BfM4wjGO8JwTfUQq8P2dmeKAyWuRa3efM9rNek3uVVi48T2kVzKNSbmbxHLr3fT2sEVad10rVz29WfYGCMyDurfkIonMqU+KZrSOH/+VX5ei6org1AzAwWs6R4Hs6NhK7DAUoyWJdtMcaEa7zKnU2DjZofKIY1sv8QgYowcAeY/xrx3Yjt7ocxXEbYk4Q9pt4t160a0cssHdO7+nd09DcbNH89clzkuSj6P9f/JasJGeO66aWh31HuTj8VDgiUx4onyxCkjZj6bTvnAElTHwr0hFIJh7NSOzfG9A2JpPEgQGc1VgmCiSrUo9l+uEblkEZW+FuuFpxT8rn341HamBXT229XJpU/Lb5bmF3Ovf6fGfx/NTofTwLlszbcXnJNYZDsBQz7m3NtuZWt2BHtcCycck5dvMedzzkD2ClrJ/WFKPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVVuZU42RzRPSVVDOURwUkNyQ0dmMFBvQjhkT1NEUWRid2ZhbWN5MnFBT0pS?=
 =?utf-8?B?bFM3REtYQWtWVW1CSzl6UnMxUFB4NDBpOWptaEIvMFkzbU0zTXZlZHIwK0lN?=
 =?utf-8?B?Uk5DeXdUYlVSMUpDVUJrUjAyTlRES2dKR0ZETW80VG9uS1Z3Ym9CcTM4SEhW?=
 =?utf-8?B?R1M1bWhUZ1ZMUGcrMENjRzNaV0Rvdit2eVJhdXpxaEF5TnRwdkRGNXZJUkRo?=
 =?utf-8?B?blM0TnhJNE4xUUgvb2I2UlplV3BPQ2dFQWFuSUwvU1hiZWxqYnBpdEdyS0tG?=
 =?utf-8?B?MzFDYnJPR2dlZzJBUjREVUMyRkNIaDVrYWNieWcxRWxQODVoR3Q5YVZZR3g3?=
 =?utf-8?B?bHhLT3kzM0o3Vm13Z0k5dU1CZUMzdS9pRElmRGZ2MC9kdVRCQ3RaRGtnbW84?=
 =?utf-8?B?azdYc0ZwcjhGcU92Yml5TWFUQzJ1K3UwS2ZmMUd3cUp1OHdFOE85Y2M5UDNW?=
 =?utf-8?B?dk1XeVNEekx6aEY5bzlzRkgvWUk5QzZDb1pFNzFrellVL2lLa2IxRmlQTTJl?=
 =?utf-8?B?d3FNQkNFb05PU2tVTmRWNkRUKzVrNGxYL1h4RlY0RXFrUXpQMHRlcGVKTW5K?=
 =?utf-8?B?bnp1cnZtNHVuclU3Q2FvR0lVOTBQWUdYbnl6ekt2K1kxUlBOQk90SE9IMEJh?=
 =?utf-8?B?ZEx4OEJWZDQwamsyZWFFSGNnTlQ1N1JwRmVROEZTaVNFTDFNeitNUVRnUEZ5?=
 =?utf-8?B?T2xaZm5DaisyN3VmVHhlVjhhc281TjVhOFUyR2ZrYkhkQXgzMDJJZ08yYUxm?=
 =?utf-8?B?YUM3TmNSbTdnZlFiUGd6R3RTOGVwN0hwbmZWWXhjeEtBalhtRlFkYThXVy9s?=
 =?utf-8?B?SlNyNS9saFRBZ09udzUvZklpZ0xlNzFPTmxpZFZVZUVoQnhHZkFaYklUS3Q0?=
 =?utf-8?B?aUpoRGV1a3VpOHRJaXd0UFE4R29VUzFtdDYwcmR0SkpKU2ZOS3phVjV0UkRF?=
 =?utf-8?B?Tk9lZlBWZ2ZSWVRtZDRYdGVHclFxYzI3eTFlNGw5UjVnQkt1Uk50LytoSVZL?=
 =?utf-8?B?Um5rUldUSnZUWEIrSGlnb2lrNWp6RE5ybnUrSWVTV0RjYXd3UUdXUGhkZG1y?=
 =?utf-8?B?TWN4aktDbSthVThoajVmNSt2MjNhVWpjUjNTRHZES3VacEczc1VGZTBmaFRw?=
 =?utf-8?B?ZlJBUHpodnFVUUdNSFROTnQxVGkvcHRjYjdKNElJM2lsWWxHaW9ZNVdBdlFo?=
 =?utf-8?B?N2tURHNibkMxZy9Hb3RzbU9NN2RYckhqVzVKNTlxS09xZXhvNDZCVXd4eDNq?=
 =?utf-8?B?UC83K1k3NjA0dTV4a3NXWFlEVHBhZ3BzY0dVeFNSUlF5dXE5RWFZRVNGQVZF?=
 =?utf-8?B?QVFLOVFkMzVHM0lxY3NMWUlGU2kxY1Q5d1hsdW11WjNGRnN2a1FndkFwMWlK?=
 =?utf-8?B?cld6YXE1alRkUlJqbk9jOXlDRjRhWUJndnVKcWJqSVlGNXhXbjBXemJseERT?=
 =?utf-8?B?THN1bTlCL3VIY2JRL3J4S0NMdGNETG1Eek5BNG5tZXlxUzJweHFyRWo4bWJ6?=
 =?utf-8?B?aTlqaFhycjdGYmtsS21VMzA3N1YyVXNyZGVYa282eE5ZYUdKMUFUbjFWODN0?=
 =?utf-8?B?d00zVENnYjFoYzYyUSsrR0NMMlZhL09FQnhVeTVYZlh4NHphUmtvd0JZTmZ6?=
 =?utf-8?B?N1ovQTdTaXAxNE5YSFpic0NjSlNWRUxMTU8xSE5sVkxUMVFqZGhKdTcydGJk?=
 =?utf-8?B?aXRUZmJLVTZTaWdOVEwzMUZlVll2WjRqdjdNYzNWbnVlVnRtcUtDL2x6RGNx?=
 =?utf-8?B?UDdxRlJRTkhFZE1EbktCUUxmaHhuU3g5QVZTL2dldFRmZWZPYlNtSzRZRnc4?=
 =?utf-8?B?cnhIMGhZSmtqU2hZdWdjME1Ca0ZrSW5SZ1dpbDlWZFh1cytld3k0c2EvemN2?=
 =?utf-8?B?ZlYrYTIyalY0M2lDM1NFMTc1NjdYT1ZVZWVvQzlQUkxsTDBKK24rdkM0MHJs?=
 =?utf-8?B?bEdHcUZweW9vUmVPWjFoK21EVEsvNGtBeld4RjIxV2NUUGs0bHdwSkYwMFc1?=
 =?utf-8?B?TUQwYVAvY0FmSVVtVHdmTU4wdkc3OG85bFhZS25Gb0VabXpWOVc0VmNCaDhL?=
 =?utf-8?B?b1pnd2lJeFYxSmN6WmtsV1crTkNHMnVlMjhzYTVYKzZkVFhjV3oyQkxITGVq?=
 =?utf-8?B?NDdMeUJzLzdBamxhciszTmFBUzMrdjJJZmxWVVVlcGNoNEFlbWVUcjUrbVF0?=
 =?utf-8?B?QmlHUmM1YXhwSDFrRGk5aE5rSDlMZ2w0cEcxQU1KdkdjSHpqREVuQVkvenlO?=
 =?utf-8?B?aXhYYXo2YnlCdkVidUw1V2FyK3ZlUTFkRjNjaXpJczVNL1d0WDI3R2VNdzVk?=
 =?utf-8?B?NGdSeEdiSXNPOGh6dmpZMzJ0amlHbHM5OVBzVUt3ZFZRVG1XZHZSdz09?=
X-Exchange-RoutingPolicyChecked: M5yLr7u7zHxDG16EwqVSaQvXQ9ilTjeWoV6u1vgZcpjgkeT5DiQV/3JmEIwkjKIuEoj5sqw03/qLVwNxY04FS5LAw39F49RlzzEC2cS/3k0K5eqZwFj4cXBnsx7Op5VuKIdl7zdzNsUa5P4FK0RdSOosvOk3fBqdILLSmw8mecAcoTH+O89Hpyqhn6+Iv4yvQ43eW9rN1M2CIeIoUyDs3uDa95zAums6nr4SZ1xikF10YINmwvdz20qB/KHJ/AoqfpQbhqL8Evuf6I5siCKcjRNHjHr+nCwFnc5Ji9Ecyl3S8sfUTy1An7zJmcg4vth33b59QuAkgTjAjNkxFJAdQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf30501b-6eb1-4bb7-e1e9-08ded1075629
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 09:10:57.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1B+SHSqPZdBgkX81Haa2XaC1O1oOAjmu2UNvMXDV/qjeXXSLIzWvEWAfIHebHm5OKT2Oy0zGK6K/ESxmhmuxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
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

Hi Gajendra,

On 23-06-2026 12:06 pm, Gajendra Uttamchand wrote:
> Wait for the GT to remain in C6 continuously before taking idle
> residency measurements to avoid capturing transient C6 entries caused by
> asynchronous register accesses (for example, from in-flight modeset
> commits). Add a helper `xe_gt_wait_stable_c6(fd, gt, stable_ms, timeout_ms)`
> that polls the GT and requires `stable_ms` of continuous C6 within the
> `timeout_ms` window.
>
> Update `test_idle_residency()` to use the new helper and require 300ms
> continuous C6 (2s timeout) before starting the residency baseline. This
> reduces flaky/residual measurements and makes the test more robust.
>
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 41 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index bfae1f844..7a8e11eae 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -212,12 +212,51 @@ static unsigned long read_idle_residency(int fd, int gt)
>   	return residency;
>   }
>
> +/*
> + * xe_gt_wait_stable_c6 - wait until the GT is stable in C6
> + *
> + * Waits for the GT to stay in C6 continuously for @stable_ms to ensure
> + * genuine idle state before capturing residency baseline. This filters
> + * out brief C6 entries that occur during register accesses from async
> + * operations like modeset commits.
> + *
> + * Returns true if GT stayed in C6 for @stable_ms, false if timeout reached.
> + */
> +
> +static bool xe_gt_wait_stable_c6(int fd, int gt, int stable_ms, int timeout_ms)
> +{
> +	int stable = 0;
> +	int elapsed = 0;
> +	const int step = 10; /* ms */
> +
> +	while (elapsed < timeout_ms) {
> +		usleep(step * USEC_PER_MSEC);
> +		elapsed += step;
> +		if (xe_gt_is_in_c6(fd, gt)) {
> +			stable += step;
> +			if (stable >= stable_ms)
> +				return true;
> +		} else {
> +			stable = 0;
> +		}
> +	}
> +	return false;
> +}
> +

imo this could introduce unnecessary overhead to the C6 test. If the 
intermittent C6 issue and resulting delay are caused by a prior test—and 
that behavior is expected—it would be better to

add a delay to that specific test instead. Otherwise, this change risks 
masking other failures that the C6 test is intended to catch.


Thanks,

Anirban

>   static void test_idle_residency(int fd, int gt, enum test_type flag)
>   {
>   	unsigned long elapsed_ms, residency_start, residency_end;
>   	struct timespec ts_start, ts_end;
>
> -	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
> +	/*
> +	 * Wait for stable C6 state before measurement. Previous test cleanup
> +	 * can trigger async modeset commits that access GT registers for
> +	 * extended periods, causing brief C6 entries. Requiring 300ms continuous
> +	 * C6 ensures any in-flight operations complete first.
> +	 */
> +
> +	igt_assert_f(xe_gt_wait_stable_c6(fd, gt, 300, 2000),
> +		     "GT %d did not reach stable C6 within 2s\n", gt);
>
>   	if (flag == TEST_S2IDLE) {
>   		clock_gettime(CLOCK_BOOTTIME, &ts_start);
> --
> 2.43.0
>
