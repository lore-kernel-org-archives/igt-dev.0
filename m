Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8758CD1294
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 09:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79E10F067;
	Wed,  3 Apr 2024 09:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbRGi7yn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DC210F067
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712135303; x=1743671303;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/dj8PvPpxinDgqWhckd67czOpKy6DSvSDYmrsVA8dmE=;
 b=mbRGi7yneHoXVX3gfW4RtbvSRtAHwuBy1xZ0N7F6/yrJwddkxztNBS9f
 LnFTNXpr79842ZTOSyfekVS9kJyeYZCwglfvZYYU/TbjSmJXW9k8XWwxx
 IN2fNpFWdwEpk5AEZnCfpCzoKdWhcUoZtPEvN9Cx3TOgo4aMK445CKZJS
 u7LVP6fphd6DOsONjGLFZRr1G/vCS37BQVXwdiLQz/qw6iBMzO9+8SLL/
 TXL7wjfsXqMok4wiX2Vek5bqSwKeVCBShINjk3MqKJ36dWJW1EMYQq8U7
 V3tAE5wZ5ZRxGPgYIJCfEW9I35/7v1rBObES19lYCRFh0VGV3v7TN4Gf3 Q==;
X-CSE-ConnectionGUID: tbl+xatBT4aYu7p48300Cg==
X-CSE-MsgGUID: gDmw7c3jSJCFhTeeOAhoog==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18080533"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18080533"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:08:21 -0700
X-CSE-ConnectionGUID: u8Tb0mAbSC6pQklkGd/mkQ==
X-CSE-MsgGUID: lgDErxltRO2TFRVl/mqWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18333282"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 02:08:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 02:08:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 02:08:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 02:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou8zhbOYGG0TlU94ZyW2F0rn/eOByFGn+RtgMQdyF4DNHLRt6bPjYjVDspQ7KOmws3dXXFBJ4sq0W8odHzeYtrcR4iIstfjZkBd57D1Es1UwAStKyN1JvMZ5YZcD/bv7i2ra+fwRgN5y+CeTCsGe9knLIn23kTvthqVVIkLXAeuxUmZi777Xtq9E2MQxzn6vgTQAcVJBcC1y9RpGw12AykjY2XNhJda3rUfMBXTt4pYLTga2JIPU0AjS4e6Q6PcFQQQg7O+krN6Gak//LtANi1IFwW+ClFTKIi4bw+36ZqpGSCY1NEkyawZeDGkCCl8qZ23Tx6F0BhstniRBhVTxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+Ce6sM+/SDsyVAWsnOw5KRpj0LvVkF++IIiPrD4mow=;
 b=MX6MN8g+ugYDcsofsT6r5dT+fyElMPiYzzfla66w5KMHz1IWEWQ8Snu/QkLAARtGqIT93RaW1ZfMfelruJib/YR2XRUrbguKZXyE5KlXymNBy5ILuLQMIfkVooXmKnd/35UgPUpMBeS6b7o21FDGUnPqkLxPO2hRehVkqyQC4X2Nc7ahxvBdC66nJhiHlqP8bdGdw66rNQ08PmQB9co1svXal7S2KQ9nLEecDR6DXyXowayB4kANKC1NJHJVbvW0igZ8lRrKFGx8LxEPqED8AbEjvc6Qj2ocdlpGDl1teHCQ+w1rKDX5AFJR+uVFtctC+J6KSsB57pfVA50Hv1lm2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH0PR11MB4966.namprd11.prod.outlook.com (2603:10b6:510:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 09:08:12 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 09:08:12 +0000
Message-ID: <60164b97-fc59-4d31-9572-045c2138662a@intel.com>
Date: Wed, 3 Apr 2024 14:38:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: adapt to boolean debugfs for
 i915_bigjoiner_force_enable
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240402054231.1499492-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240402054231.1499492-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH0PR11MB4966:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lGH121knxD6UAgW0x41jN2x0Xi+VWcL5TxaXyhOl4knfkrDxdsNhddwvDFP/qGrkmX07jirq5Rex7zWbnTo/alT/gs9sLIKI1cSKGKlnkqd84FhnRYYyzUoM0FIkyjHiGz/GNfCC0WnMUdomXPaevnu+mJON39p30BN4RniPGFcPc/oiGOxClrhJeecrQjANIWA2e5kl4/oTaPXyJbgLX2x3ZxHJj8t3EXvjs74AVoh+ItjBdeCvbsrzjE4lWleK3F4i50cVQyfjyquwQlo3vIfyNV/6kw/VUoc6V+Igw3LPDGEUbEEkJqCIc2HxiPW72LPRIdzYWDIMfeHwQxJReDUNs+kkCDQIAxsHCZ9Jt2h83VkdYOU1I5clAblNKWodDDHnVu/yxVFhNRAocJKRehGwBE72Ne7xoA0cMWhImuN26Y2PonJba+HpDwb5u8UYRcv3HgKpOo99LdSgOTeUJa8j6T+M0NsP2QFzWYQ8kM0qFrC3c31iLtRW/wlXLcXo93dz+UbciK8aLJ93IrmD095kK+ixLf9fMEogTpWnO6O5RhsvXqgkTxqgbJJiBrmyPYHUpFtumR/kAo6b8jDSi6f00Qebm8VM7GH5T4I1lI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0ZaSUZEM0E0TFRtYi9Pd0d6OHk5bXh0SWR4SkluSmhYQVY3YS9Vcmg5bWlZ?=
 =?utf-8?B?WFNtQ0tjWnFOLzZaRXJRMmNYVFNmbnhFQklyNEtubVpZUFQrUDFHRlZhZlBY?=
 =?utf-8?B?TjhWMHZBb1piekg3aWMxWXRtbHNlUjBVMTByTzFLT1ZpVUlmWVd1VEQwMHJB?=
 =?utf-8?B?VUp3OUxBMnYzRE5UbnZmNlVIVHlPdVFjazhJSTJKeXlXWWR6MUxldFdST29W?=
 =?utf-8?B?ZmgwcHBpTWYxbjByMDFRQWlWWTFDeFJubm9GK3VBOWpqRllHQTZWUTRSUFZT?=
 =?utf-8?B?UUdQRU83RzdzZ1VpVUVSWkw4T3VyN0VsYk9GV3dtK0l4VUw4c0hGeS92UTdY?=
 =?utf-8?B?VXpkMkVsL21NcExlSTArMkQ5VzdORGNXUjc3M1NHODUvUGRlUTFROE1QV0NT?=
 =?utf-8?B?MWpLZWVyVXJjMUVFeDZCb1dQbGNpQWVrWWwvZE9PbHhWd2tTUjBNOWNIVkl5?=
 =?utf-8?B?Z0tkUkpSdlFCV0s2ajhwT2NZZmlqc1o3TDA2VEVDdU90enNNa0R4V3VvQUNO?=
 =?utf-8?B?eWE1SGFsYzJjSzNQLzU0Q0hLL2xQdUlhczVQZGRDeU44VmN6TUhvQnNyRlpm?=
 =?utf-8?B?OE1wYlB3UG5lK3dYVElsZDdMUXFtSHVjUFNtU1cybEt3ektoZ3JIaVgwUmpu?=
 =?utf-8?B?VkprSlRZb3ZTR1pUemMwNUlMODJibVVFTWNKdE5DVmZKV0h4SmIzVE1RemNO?=
 =?utf-8?B?Qk45L25pZit4NXJDQnF2RVJlOVVxMXo0RDFJeldwbmx1cVZDRkkvUm9tN2tl?=
 =?utf-8?B?M28xWGlCR3U3MFIzdDI1RUphMjBqd1dHQlRBQUQ4SWJNZE1XbGFmOVpaUllh?=
 =?utf-8?B?R3lNUjBaclpEUVJpQTN3MFgzRVlDTER6cWlDcDc4K1JRM2J0SENmNHNXZU56?=
 =?utf-8?B?VG1DQ3dndUIrTlZaTE1qcHVYM1did05tNXN3UmVEUnRkZEFuNy9rZmZIZVNQ?=
 =?utf-8?B?VGNUM3dCZlVqaE9qZEVjanVoV3FhK3lJdkM4R2VPUFFPU1NnaWZGcm45cSsz?=
 =?utf-8?B?NXNqUDlXWXNNUmdSZldpU0Rhbmtsa2szTzBhSkJ4SEVaQmxNU2NrRFdKYjcy?=
 =?utf-8?B?d1NlK3hDVE1tYmNFemVRMDk3djU3ZUxKQXp3aTFvL0RSMXZSWWlieFFGbEFF?=
 =?utf-8?B?TjRHUnNNNU5JSzh6dUJtMnk5d0VleDQ3Tld5SURTSUVQZW5yVm9EQ1lhUjdD?=
 =?utf-8?B?NlhsNjdSWkhxY2MrQXJOSnVJaGppb0R1UjVvVnpHSjVLbTJCS2F0OUdScVAy?=
 =?utf-8?B?RWpINStCZGtmZTJHYkZ2R3R3UWZoMlNpUVJUQXJFckxyVDF4TkY0eTQ1YUJG?=
 =?utf-8?B?UXJ4cXlkTWdhMk54bytTVWhXV3dEVUtvTFVSL2hpMVM0OFFkdzc3NjdTS05P?=
 =?utf-8?B?ckk5NEtyQzllc01mV1lQTXBCWTY1WFc3cWx2ajBTMHFKQ1BJNkphRDFjenc5?=
 =?utf-8?B?dlZwcTNKYlAwaDVBTmlOMll5QXRhNEFvVjFpdmdKTURuNGhYSHRLU2x1NzFm?=
 =?utf-8?B?Q3NsMFZaMjBzTmY0UlBPRXF1QnBXY24wMnVwaGcxNEhPaVc5eXhhdHpJaFdp?=
 =?utf-8?B?UnBNYnRnYlpFQ2sxT3Y4VGJta0Q1TzM5aGt2UTdHSXFRVUUrNDF6Z3pFZkQ2?=
 =?utf-8?B?aHNKZ000WmE5bkkweC96L1pNQ1h4VXlEdDhUY2x3Qkl3d083cHRwWnJ3WXFt?=
 =?utf-8?B?eVZIUVlSaXNkRXVzQVhlSDhIYVBGcFZFRHRHeHY5VUVab1dFbVFqWmRkc2o4?=
 =?utf-8?B?ekVUSUtoRzBTNXE0ZUYySTBoVlRGMEc3MmpveUgvbGxNNmFxaVdoS21wbkZQ?=
 =?utf-8?B?WXVIZk5ISVBwekgrQzFnV1ZMUkRxTHc3bTdSeWNIaHNFelFOdkpabXdNSnAx?=
 =?utf-8?B?MnpJSGFVUCsvdXFIM0VydjltQlFyQSttY2llWXZMN00wcGpjRWtTSVFUcUc2?=
 =?utf-8?B?UEUvcWJsa3R6a0grTTZqeEpaTTl0NThjWFcvaTVzbUpZM3U1Q2h0TVlHQ3kx?=
 =?utf-8?B?dVdmd29mOEk4SkFKbjdhRVNpaU9CWXZrZFJvUE9DcnB2REt3OURZTk1hb3BM?=
 =?utf-8?B?QldsTEFtZEx1Znc1Y3VDV1VuMlljMUg0ek5UNlk4VU5MK2orMEV3ZWVsZTVK?=
 =?utf-8?B?YUZGMEMrYjRUK255NEF3ZDhIeW9HOENwQURUOTBmV1R6dVBCNURzQTRLSkVq?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3aa9986-e308-4de2-8389-08dc53bd968d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 09:08:12.2855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClrVcZIzBuOOttodYDN98jKBFbXx+HXbBe1KB5s9FnigFKMiw8jiDlnVF4yEC+TcRZBY1cwoRfy0BqFETs3Ar2eGOz2xGWU/torQ+Jp2xOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4966
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


On 4/2/2024 11:12 AM, Kunal Joshi wrote:
> adapt to boolean debugfs for i915_bigjoiner_force_enable
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

LGTM.

This is required with the change in debugfs i915_bigjoiner_force_enable :

https://patchwork.freedesktop.org/patch/586369/?series=131942&rev=1

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> ---
>   lib/igt_kms.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c38021dd7..2a518eb8d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6218,8 +6218,8 @@ bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool
>   	close(debugfs_fd);
>   	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
>   
> -	return enable ? strstr(buf, "Bigjoiner enable: 1") :
> -		    strstr(buf, "Bigjoiner enable: 0");
> +	return enable ? strstr(buf, "Y") :
> +			strstr(buf, "N");
>   }
>   
>   /**
