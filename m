Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A782C98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 06:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D7210E403;
	Wed, 23 Sep 2026 06:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkGseCJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C754510E403
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790143589; x=1821679589;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yWVFwPb5FkS1tOMg0CHypTkNDoUyN1sP2UUl+e2REHw=;
 b=DkGseCJZXW27/eCwW2klr6wSgtukqIT1A4nhQ4O0Cnid3Ig2/s8IFNE5
 J+t5DRZWL0YB8L/dd5sH2tWF2HwBpRCm3UKnp62sdyoeER0eOiYDXAgHi
 6pL1s4Nmcu2FypMJS/fu49sXUXXkEvkRvDkpSAeK10b7VNnri4NbYjYUA
 ZkmqGiJ5AcB8FdB1HLqNV8WoUm5n3XZBonNuozjALEft+RsIXyc/XEuN8
 4ZvBsd8Llp5M3E+JsFRFylxAiqlJt0JThgl81gog72I1L5AOKrZ4p9PWn
 TWium2+7XHb3Qw0p1PMTc5R++yG81PPnl1H8iZMu05JOzSOPbUecl8McM g==;
X-CSE-ConnectionGUID: 8Jl07eMuS8eN0loFPWJLZg==
X-CSE-MsgGUID: Y9G79Q0VTX+XOVeq4vtUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101394697"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="101394697"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 23:06:29 -0700
X-CSE-ConnectionGUID: iFJUv8RzQjOGBAl6w7BpFQ==
X-CSE-MsgGUID: xVsdp83QQB2wwOEwjSYUdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4533836"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 23:06:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 23:06:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 23:06:27 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 23:06:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeSevJe+rE1+GNBnBv8jH5Fur7LZAk4oa++unTaiVbxXFvox9dVHnwX3aZXaobm79/yccE1MzDaipBgdQNocHwDhcnCErFdHYx5Q46YbWhfhLISzeSZ4FCzUSxMCbnrMJeV71ZwLA5TluhGdOX8Rba3I/k27D6kgitACHejF/jhRHF8cjIEKK2vudoihRch37gXRMsnGtH7rgP36Z/zHIe6ftLIz7Jusi+92tT1V2gtGMjO0CTku4hZth07lcNSnLIqglRQgWrSox3pa00C/8htTLhdDSGLlGkxWg/bnIg9aQGSH1jQehSoF1ZLHuBpyA2tyyH8E7Sui3CQrsVkcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2g8HnZJHnTwd4+5K18j/8EzopX9BjwfTQ6KAnSdIrh0=;
 b=zMXCpZGM0JJTmRuiHJdpz+9249IUsTrxIDyDIpzD9OhXXjiTexnSjyuseiLnDKY313Dw2rj73YHFQ3IRU0nPSCbCURRUFlpl1HYSHJpdbF0/lMuqEhdcAb3dwtnmuix0osxk1ok/UOjqOL/Ppv700tX5/DuTZMA09sUN0/pyMt3rmw8IV/M+H34IP+E3o/mbG/tvEORzyecVzsdZU6SURcer9m8+0437ToRUxRags+yNiU63TdKDbfUy2CH09CGDu1wJo8YgD8pjMl8p9T4ezznUOewHEhymXWm9dZ+UkSpRaJSDXivXNB/pTwRAhhDK/iBzuAWJr75h34qb9CtaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:06:21 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:06:20 +0000
Message-ID: <59c1e7fc-0f17-44b1-a177-8fe71eaa1448@intel.com>
Date: Wed, 23 Sep 2026 11:36:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] tests/xe_err_injection: validate CPER tracefs
 event format
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
References: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
 <20260828170439.204268-2-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260828170439.204268-2-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0296.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::7) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 11625ff6-c251-4d5c-f5d5-08df1938c998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: kMtOVDYiv/vV6J56/GvLHxyKAaG4wU/RO6HZYJLeSliHNvo7RkIz1CIWxuAtA4znSePRKs5ypPlO/Xz3QPpA/VC7CFXrGp7SW+cYFAsltiv60uXiFELoagbSiXmAfnPQ20pdgMjeKRdCqfoXX3NgjFouktyvkrNU3i5Tx3WflgPjy3xfYd1C0rHYgsIhphMoTP/C/Iip3fOm/YUSIgh/YBni6Ny7DnmfTHlJUdToIOVTnPhSw/OuesaxlPJQZ7quuGeN1tk6sJUlBo7pD9Ervz2oG3g4zPtqHtL0bdJF2pd0y3TKd8lO06hFEEZ4A0zgHKyabJ2T7ZC2XWJgiE2oUcZS8O3P2/udqbCh5GAOy7zAL/IUl6ai4r4zc7qCD9paI0hIBnyFWdi8SEhM1OEgPcVTgdgbRHMWFE9wRnFeJiorQh5WYHkGZnbQARfg689GTXE+SgTQzjUYMWv5K3+7037zn4qH6+NNTWWFdCBOxj3hnETxc0Vr0vZMcWF5a2IpO8GsY6rjizo+3hmM8KeqGvUFvUp9Ua1cZL9GLDk2BqZveuGM9ZKXZaqYOxA6FPq2DlbaHxP4zPOsJCeeLo3DpX71A65nH1Jcf4j/O+P7pN0qD//9H9MoFC6c+3lLwSu8xmXqvfgPR/cSkylO6aIzzB8n3wqbaET6uEeJSttbRr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU00d3c4dHZXa0ZUUDVWMXIrRWxKbWJqOGtvRGsyOEZGcmZoUm9qQU84VmxZ?=
 =?utf-8?B?bjk3Z0U4Y0cyZkc3NFJHS3NZUS9MT1NYZ3ZSTG1BYU55NDcxMHhXb0QxMzRx?=
 =?utf-8?B?V2hrQUxXYzFWNDhBUWZHZ2kvcHNybzFNT3dXajJlVHVvRTZYN29UWUt5TXcr?=
 =?utf-8?B?ZXpDRTdvVlVUUHZMaC9YVk1odGtuaGZ2WjFFeUZuUVRZRm1Xc2YzcEtpMUdP?=
 =?utf-8?B?TEFaOHRJa0g0S0NDWHlCU1FPYnlTZXA2bmFDU3FqVVdtTGpLSjRWVWVsOVN1?=
 =?utf-8?B?dWpnNGhvWnpCb2ZSajg1RVFWcUd3NSs3L3RJSlhIemxhanNRZm11OHp4MVhy?=
 =?utf-8?B?SytmbVU0bVp1Q1hJYjM0UXV6UW42eHdVcU9obTNZSS9sak5xT0xMQjgrbnFH?=
 =?utf-8?B?YVJNWGsrV3NKeGpISjdZRnFoTVMxWmlmeURIVllPY25xakMwM1ozUXp0QlRU?=
 =?utf-8?B?WXJrTnZnZ2lOZUh6bzJyOGpwcjZwaXlBb0NKemxYcmxtN0M2Tk9sRi9oa0RL?=
 =?utf-8?B?ZXUzb1NNZU1acm5GMk5NbmlEc0w5bHRwd25aUUNZazhSa0RIQ3lmZUFpbEda?=
 =?utf-8?B?d243blpnOVJvdWZQc3p6L2JHd2x4WTVQM3NUUUkrb3gyUG5LT29RanBWNC8y?=
 =?utf-8?B?emhYRkdsaFgrUVY1KzhCZ1I4OG0rNzRLSUZYb3Y2eGhQSHhkVEFleVc3cFFW?=
 =?utf-8?B?OUs5TlpxN05yNHcxUERBNU5XTWNya0VFRmpnbkIyN3VaUWZnbmZEbjJDcUM2?=
 =?utf-8?B?bnRnc0NxSktYbTJmcVRBZG11TWEyekxRWE5kR1BLZStzTnc0Y1BwU2RUZERO?=
 =?utf-8?B?NjlsWG56R2QxWXJMTDNrazFPNitKQ0VWQVJVd1BiRmJsRll5TUJlbGJOVlV0?=
 =?utf-8?B?TytLRExLYzE4akMralNISjBxaURJYmdITXI3Z1cwTlpvaTZMamFYZkhWWElW?=
 =?utf-8?B?NENGa0VMWVQ2NldBdlI3LzdOZDhmU1RYb0hQTXRTOC9XQzZ1ek0rd3NLWDhr?=
 =?utf-8?B?MFVaUWVFcjJhRE5CSkt5VFJyZEZOQVRhNlRkdHBybHNxNktrSGNSaFBsTCsy?=
 =?utf-8?B?WEZuZVh3RlYxOVZyeVBGR0RFUU1WWDYyZ0xJSENHRFRQbjYrR3VZNDJKcXJT?=
 =?utf-8?B?UU90bjBlQVFBODVKMWw4bk9mVGN2MGpOa2FyUEFnNTFrVXhZcWtBb01LYk9G?=
 =?utf-8?B?MmJ2RUp0cyt2Z3E5bE9tMzJDdy9la254ZUUrYTIzMk8xa01iYURTeUZmYjlp?=
 =?utf-8?B?R24ydzEydGNSNmFMVGJGMUkzeVp5bVljb01mM28wdHVnLzcvS2lkdkhqd0xu?=
 =?utf-8?B?cWZpcXM4UXZVZHpRM2l6NG1LVnEvM3RZcXNReGJFUnMvNnV0WVpWcVdnOEgw?=
 =?utf-8?B?dHV1MnZyenV2Ry9IampSM1BQcDZCa25XOUNQV1RqQzB3Q1N6WWR3Y015L3hp?=
 =?utf-8?B?dTY2TVFmRkVuLzVOdFhRR3pQSE51Ym1IcFlMTzFIRDhiMGRHaUR4QnpzOXNW?=
 =?utf-8?B?aG9odXZBTUVTcWRBMkMrMTFqVHkzMzczOUpaNGo3cStvRGMxTHBLQjBSSFpS?=
 =?utf-8?B?eEg0bG1iRUhLRW5DU2o1U3d3a3ZSVVJtTmwxL3AycDM2M1hBa2dJU3lLV3pl?=
 =?utf-8?B?N2Z1UlM3OUlyaDI5bVRYV3RRSThrbk5EVE5lcU9KRkd5clh0NzBPRFkrTkNP?=
 =?utf-8?B?YkdjUG42cU9FOHhEYkNHYUdQSzRoRWdWcWxBTUdBS1dtYTBBN0xwbzRMcGVw?=
 =?utf-8?B?aDJOTnp3VWFVNzBwZzZnNE5hS0RMT0JXNklWVENzbkIxZ0hQNmNUZHFYOG9q?=
 =?utf-8?B?WkNMNVZRbUNMSnpuQXdQYVFQUEUyRUdSQmIreVI1ZzZ3MU52a0d1aUhWY3NR?=
 =?utf-8?B?dDVVY2NhdnFLQ21QOG56Ujlld1cvclBIeGlSN09ycjI4WFBuNnRldDdaVVNO?=
 =?utf-8?B?QmlzOFhxcGhkYkI2NU5JMGkvLzVCR2xJck84czNjSUhWSnRVUFV4djUrMGpx?=
 =?utf-8?B?ZmNiZ1Ewa1h3VTVlT0w4RE4waWNzSlA2MGtNR1BGN0tIdmZEelA4STIvaGNH?=
 =?utf-8?B?T0ViNThhZXVrdFJHTEVOdkJtZlJTNVZLK21sS2JhVDUyODJ1ZkMrbUtjOExU?=
 =?utf-8?B?S01ycFVkQ29GYnFCeXY5N21sb3pJMnJSeXpuYmhjTERQNS9OVk14M0tubFVp?=
 =?utf-8?B?QURNRytMYnZsdURUZEF1ZXozTG5WbEo3d2hNdTVOYWZJOTYwWFkzbGdZc2U4?=
 =?utf-8?B?WmU2dWpkeVpqNmxGNHhiVXpNeG9RKzkrQkxNK2dBMEJlY0lzd3V2TFgyc0I2?=
 =?utf-8?B?cmZiMmhPT095d0duSjkxZG9nZldwQnluTjJDcFpqWitCWVJnTStxZz09?=
X-Exchange-RoutingPolicyChecked: rqO6nDHoH7wpem/dPQNZY9Znn4C6+ACVdkEvLwtuqzNWcJwoqWLdlk6GVYBqPwFlfLxlzF7Mu+voBqf3gclyqwqllOnRVqrKy3i2CpQLihM8krFPQm/IJcVf73s79oZlwwSi3BJnjEF7p0Ci/gtH6QlAl+E3t//H06K74UsrKP7OuhlD3NxZBaMQFcWo8s29aIR7kvo2wkFno88psJJWqQfgfj3fSSe1kLy7HYYwO+rd84t9MBZe6KUq9s3n5GzCrInggyOGngctuIwgGtavfiOLocOcVclRM3+7ZhNtRJPbB3Bwofv2m1gUk5PWto9AgGEk5/0CY36nzPa6MBv1rA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11625ff6-c251-4d5c-f5d5-08df1938c998
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:06:20.6945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0YFD6J3Fita5oqai+VX5SA2VLTCfYtWITtIVIhF7IJpz4Dq5LCUw/ljpn9C5o6BKKdSYovhNzZbbyTmZgqO0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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

On 28-08-2026 22:34, Ravi Kishore Koppuravuri wrote:
> Add CPER tracefs paths and verify that the xe_error_cper event
> exists, exposes the expected format fields, and supports enable/disable
> through tracefs.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_cper.h          |  21 ++++++
>   tests/intel/xe_err_injection.c | 119 +++++++++++++++++++++++++++++++++
>   2 files changed, 140 insertions(+)
>   create mode 100644 tests/intel/xe_cper.h
>
> diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
> new file mode 100644
> index 000000000..706c63715
> --- /dev/null
> +++ b/tests/intel/xe_cper.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_CPER_H
> +#define XE_CPER_H
> +
> +/* tracefs paths */
> +#define TRACEFS_ROOT		"/sys/kernel/tracing"
> +#define XE_CPER_EVENT_DIR	TRACEFS_ROOT "/events/xe/xe_error_cper"
> +#define XE_CPER_ENABLE		XE_CPER_EVENT_DIR "/enable"
> +#define XE_CPER_FORMAT		XE_CPER_EVENT_DIR "/format"
> +#define TRACEFS_TRACE_PIPE	TRACEFS_ROOT "/trace_pipe"
> +#define TRACEFS_TRACE		TRACEFS_ROOT "/trace"
> +#define TRACEFS_TRACE_CLEAR	TRACEFS_ROOT "/trace"
> +
> +/* Timeout waiting for a trace event to appear (seconds) */
> +#define CPER_EVENT_TIMEOUT_SEC		10
> +
> +#endif /* XE_CPER_H */
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index d17d049f4..37f4c2edd 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -17,6 +17,9 @@
>   #include <time.h>
>   #include <fcntl.h>
>   #include <unistd.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +
>   
>   #include "igt.h"
>   #include "lib/igt_drm_netlink.h"
> @@ -24,6 +27,7 @@
>   #include "lib/intel_reg.h"
>   #include "lib/intel_compute.h"
>   
> +#include "xe_cper.h"
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_mmio.h"
> @@ -545,6 +549,117 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
>   	CLEANUP_ON_ERROR(ctx, fw_handle);
>   }
>   
> +/* ====================== CPER helper functions ====================== */
> +/**
> + * tracefs_event_exists - check xe_error_cper event directory is present
> + */
> +static bool tracefs_event_exists(void)
Make this function generic with path as parameter.
> +{
> +	struct stat st;
> +
> +	return stat(XE_CPER_EVENT_DIR, &st) == 0 && S_ISDIR(st.st_mode);
> +}
> +
> +/**
> + * tracefs_enable_xe_cper - enable / disable the xe_error_cper trace event
> + */
> +static void tracefs_enable_xe_cper(bool enable)

Make this function generic.

Thanks,
Soham
> +{
> +	int fd;
> +	const char val = enable ? '1' : '0';
> +
> +	fd = open(XE_CPER_ENABLE, O_WRONLY);
> +	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_CPER_ENABLE,
> +		     strerror(errno));
> +	igt_assert_eq(write(fd, &val, 1), 1);
> +	igt_info("Trace event %sabled: %s\n", enable ? "en" : "dis", XE_CPER_ENABLE);
> +	close(fd);
> +}
> +
> +/**
> + * tracefs_clear_trace - wipe the trace ring buffer
> + */
> +static void tracefs_clear_trace(void)
> +{
> +	int fd = open(TRACEFS_TRACE_CLEAR, O_WRONLY | O_TRUNC);
> +
> +	if (fd >= 0)
> +		close(fd);
> +
> +	igt_info("Cleared trace buffer: %s\n", TRACEFS_TRACE_CLEAR);
> +}
> +
> +/**
> + * SUBTEST: cper-tracefs-event-format
> + * Description: Verify that the xe_error_cper tracefs event exists under
> + * /sys/kernel/debug/tracing/events/xe/xe_error_cper/, that its 'format'
> + * file contains the expected fields (dev, severity, platform_id, fru_id,
> + * intel_err_hdr_raw, cper_len, cper_raw), and that 'enable' can be toggled.
> + */
> +
> +/**
> + * test_tracefs_event_format - verify the tracefs event directory and format
> + * file contain the expected field names emitted by the xe_error_cper
> + * TRACE_EVENT definition (TP_STRUCT__entry fields).
> + */
> +static void test_tracefs_event_format(void)
> +{
> +	int fd;
> +	char buf[4096] = { 0 };
> +	ssize_t n;
> +
> +	igt_require_f(tracefs_event_exists(),
> +		      "xe_error_cper trace event not present at %s\n"
> +		      "(kernel xe driver may not have CONFIG_TRACING enabled)\n",
> +		      XE_CPER_EVENT_DIR);
> +
> +	fd = open(XE_CPER_FORMAT, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_CPER_FORMAT,
> +		     strerror(errno));
> +	n = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	igt_assert_f(n > 0, "Empty format file at %s\n", XE_CPER_FORMAT);
> +	buf[n] = '\0';
> +
> +	/* Verify that all TP_STRUCT__entry fields are present in the format */
> +	igt_assert_f(strstr(buf, "dev"),
> +		     "Missing 'dev' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "platform_id"),
> +		     "Missing 'platform_id' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "fru_id"),
> +		     "Missing 'fru_id' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "sev"),
> +		     "Missing 'sev' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "ihdr_raw"),
> +		     "Missing 'ihdr_raw' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "cper_len"),
> +		     "Missing 'cper_len' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "cper"),
> +		     "Missing 'cper' dynamic array field in xe_error_cper format\n");
> +
> +	igt_info("xe_error_cper tracefs format verified:\n"
> +		     "Below is the content of %s:\n"
> +		     "=========================================\n"
> +		     "%s"
> +		     "=========================================\n"
> +		     "\n", XE_CPER_FORMAT, buf);
> +
> +	/* Verify enable/disable toggle */
> +	tracefs_enable_xe_cper(true);
> +	fd = open(XE_CPER_ENABLE, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	n = read(fd, buf, 2);
> +	close(fd);
> +	igt_assert_eq(buf[0], '1');
> +
> +	tracefs_enable_xe_cper(false);
> +	fd = open(XE_CPER_ENABLE, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	n = read(fd, buf, 2);
> +	close(fd);
> +	igt_assert_eq(buf[0], '0');
> +}
> +
>   static void igt_require_cri(int fd)
>   {
>   	uint16_t dev_id = xe_dev_id(fd);
> @@ -616,6 +731,10 @@ int igt_main()
>   	igt_subtest("test_l2-bank-single-corr-err")
>   		inject_error("test_l2-bank-single-corr-err", &mmio, fd);
>   
> +	igt_describe("Verify the xe_error_cper tracefs event exists and has the expected format.");
> +	igt_subtest("cper-tracefs-event-format")
> +		test_tracefs_event_format();
> +
>   	igt_fixture() {
>   		xe_mmio_access_fini(&mmio);
>   		drm_close_driver(fd);
