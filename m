Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB048606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgtkNTGT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753DA10FB65;
	Wed, 28 Oct 2026 11:13:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231D410FB40
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793185916; x=1824721916;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=as4500NEa4XYQU25XpGky+8uth1SMIMgUHGaP09kpLs=;
 b=YgtkNTGTQSwTzVVAqdYPA8sVEP8xvumPh00g74Bl+tzXnI1ooq/2Vw6s
 /8tsLe+LZIuzFR9r04ojpSwRkV0FAFKOS3BXK83I/wkx9iecAzlBK5kda
 gGWYN+l2LvOI1w4HMeUYAcoeh6Lh7pneZN5aKVxX9gagRBWAaGGNFzDxS
 fmMrT74hFcMhsmi+OfImVUW2Uf844BoDgjIaPGr86Eg5GOv2UbwXoYo9q
 GB1UYGuFd7f1+PdSuPKKZDXj0QuwcTWvoKpvn6gAyCqDpu7zajc8ZI+y7
 GXwzqjcnLgFG3ePB2UKq7MIdY2Q9eTVhDYRwAbNT6LfJUaK6hofY04Jhq w==;
X-CSE-ConnectionGUID: LGSFEUQ6RXWrX0eHUwxV1A==
X-CSE-MsgGUID: xDeIoXAGTbC076LkJAuxdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1788403"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1788403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 04:11:56 -0700
X-CSE-ConnectionGUID: sE22PY/tTxGCBSzPSfsOGA==
X-CSE-MsgGUID: 04H+6t9gRDm2WeEn+RqNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4900044"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 04:11:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 04:11:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 04:11:55 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 04:11:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/qMRKNKapOV7R6GHzk7xMI6hgwaGEQLk8ZATRKXsF1LMEmS1HXb1zpnBSpQLJsevq7YoKc4qabIhbo4/UuqN/5BFqn5GiOdoqP+iQfUX0Zf4Dj7Wi1jqJTsD3CNEirjtQKOB+6JBzIAmI8KimQXvBanefYxDXCJH4iil5DzAdWS/tvU9XKpEqRZ4x4CON0+2EYUw9PWm+fUqiTleroHPVPKEr8IR3GJh+1b3lLDhfoAD2mVEGaW/6EIErZelLiAPvZSZkiS2RDd0k88goFbQ1dpEA5Gv4X8TTqbNb1V9aSRUxuvAhqdAR9RaFEdLGD4PigetN07tZ2AOp2orZciVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q99tz13clqBNK39+lS/EN+3tTW/Z4Zm8Bar2psnpA2k=;
 b=oYYo5VDr2vN/oWyl0813dDU6KX8Uca1Lp1fm3NiXSDQxGGi8prLZcHhJnPtvQ52fqW5xdh6bHLLA7W3ByLDEM1O2b3YBmNCm2bfMwWR+6C+5mSMgB3BGvXJQk6ii/7umNd3mVpyBT4yobsLJ1YMmM5EWKpuDrCdpw/0wignZkG5L2mcUAjnCfn0+3Lnpi/WtS0KBcRvZ59Mgj7yoMRFly7hyNEF/hacO7BXdyXGPJ5D8dLcizJYfkZMgmeXJsvq1atpvZ4dqoCGdNw5KV7xAUif6JPmy75zAV/QbwcfWKlfn8cMJy9DutmwSzRvkv4vDIQSgQwQZ/C+uKK5VpVwWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 28 Oct
 2026 11:11:53 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 11:11:52 +0000
Message-ID: <b371b401-f336-4497-8249-c9e117dab7c0@intel.com>
Date: Wed, 28 Oct 2026 16:41:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_configfs: reuse pre-existing configfs group
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260929103701.2050914-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260929103701.2050914-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0236.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::10) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|IA0PR11MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 2927f761-d7b8-4ecc-2588-08df34e444fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|261026140227099003|11063799006|261021123027099003|261021121427099003|56012099006|10067099003|261022105027099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: KPQby9/CwZr/F57a+p5R6wRn6AOiPZgWiB2CufuekBh+KLDmrEWr7I1STJrrqexBPadOmv7J8m1JxYrw8zZ5qQmAU41nAjHB6n0eGYWpBtRR/CYAb5usgvG7ILuLYtq3VorLNj9rsEzQz3+4Fa3FUyVsQrx7sXM7RxIo7av0SCJPJSPDwX2V+BnlIopWcl9ghq/1MDnQVw61gyI8TePlm94uxIhnkQkBbbzjlwtbCiYpTilFqro3M3rQnKexrqx7RKzDE9YOJyiXfMiGbhoBxCxd+wEbLRLFJeF/NFPpWLjpWlKHnTT5XmVaFimaZge12U4LQj4KZdNE1UQq2/8hIKQNnleYgsiiSPNSCB0x6DerCr/Wm4mB6SqYZXeRGXAs/M2E+CLliz3E1mJ8oAGzDhNFU4gnkSx7qxH+7SUAE+/Q8MvklgtFeJru3jLl7IaPzOEhHbcH/B34tk6Uk1Pee2rtPh4Hc4GdcfzLwPFkQpxGmZtcKWbwVdRAQHm/RhCpGZqkJnMBOK6LKKI55p8DcfZ4fWaP/51bg3T8Hmg511ObUu2nwG8uQWDhi6KHmE2ZHdVRsZrM7MQo7trYTyQ5+mMenHHzJBcTUr3cbqro6A5hqlw455Ss5Y3l/nJgUA/FtRivG56xksSJj1la163dGyfJwQ2TWGTfSpXo+g12yJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(261026140227099003)(11063799006)(261021123027099003)(261021121427099003)(56012099006)(10067099003)(261022105027099003)(261009223027099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3RueTlDUXIyWnZUS1I5NitBVGsxMm9Fa3BUR3UydEFoeWtBbHo4eVJCT0l3?=
 =?utf-8?B?WDlJWUE1ZHFobEN4eldVRm5DOXJ0M0VvYTVudzJyb3I4YUVQTFJTN2N0S1Nq?=
 =?utf-8?B?VUJvZnE4YUFJSmd5V3l6V280SkNXM3UvQU9PajJCVGluL1BBMmFhc2ZoVWIv?=
 =?utf-8?B?NXNJV1cvL1dWbGJ1NFdocHh6YjM0bWdLdHR6OERCeVJMMkg2TlA2MzZjNTAy?=
 =?utf-8?B?Q0FDdWdubDdkZ3RoVkc4by82WmU3elN0cGJlL3ZuekVWNlJyM2phdnVVTTBl?=
 =?utf-8?B?djBFTW9UaWpVN05qN0d5SS9ueXVtczM0QW13R2NPNDY1WjhUWDVaRFpQVnR2?=
 =?utf-8?B?MS9VcnVWT1VWR0xpTVF6N0Fod3gxOVAvYTgwNGMxVzVlbXBLVGRYSC9lbWFs?=
 =?utf-8?B?aW4zV0FPOGIwdzd1TDR2cnJseldwZ2lYWHc5cDcrZU1QMVh3VVJLUHZURlA4?=
 =?utf-8?B?d0xIMWhHUkFRMDFTRjIxNVFIT3pNQ3lsZnQ2RjFVdmdaa2ZsN2gxcDlmdCtU?=
 =?utf-8?B?d0Z3aWlGZVdSVTloMWtzSWtHc0JWc2QrNGx1Q3VIUHRBVHE0RGkxQndPM09P?=
 =?utf-8?B?REJMNC9nR0Z5R01NZng0SlZFTHk2UmtVcGNvOThEME1GeitlVzVUcXF0UGtK?=
 =?utf-8?B?Z3B1K0crNEt1NzQzYmduR3hVaUNGWVhsNU9UVHpSdFc2eGZxWUlSeXFYYmxK?=
 =?utf-8?B?SlhCaEZETVU2aUdPUExRUnNzaUZONTN0WFhFTjZleTd4a1pHT2FqZkRnbTkx?=
 =?utf-8?B?ejFGZitCOWIyMVpzSFZaMWd5T1QvQ1V6SVJPOUxNT3BLVzZoa1l4Z1FybUhT?=
 =?utf-8?B?eGkrVWJsUkw1YnEwYzROUk5FZm80NDljQ2dzRzFWY3l4V2t5UitrTUxKdklw?=
 =?utf-8?B?QVNsQVFhMTNIb2ttT1p5WnlvOHBkdkdQSXdEaGYrMGoweGdzRks3VDdGUFdz?=
 =?utf-8?B?SG9seDA3T29PNnpzTnRHdW1PdFRzNVc5MXlvd09hb2Q5Y3hUVUhHTmFNQ2JJ?=
 =?utf-8?B?SDdQQ3lyWlc5RnVPOEZGMjh5SzZ1STZ3dy9XdXg0U1o2MFdhaDBGaDhSd0p5?=
 =?utf-8?B?enNXajhnZzhqYklsQ1NVSlF2RUhQdi9mZ0pFNFdNd21GaWhMUDVqR1RNVDhB?=
 =?utf-8?B?QVVBWVQvTnU5a0NvWTlwZnUwKzVVUHV0VHo2S3VkT08zOHdmV1BrZjl0Uzdr?=
 =?utf-8?B?ZDNLT3BnK3duTGZUVzhpMnhpVEFTMmJjNVlIYW5UOVpHZTVpcGs0dnp2enpN?=
 =?utf-8?B?Y0RkZHJURmdrRjh3aWk0VWRrcHYwekh4N0s2MGRKbCsxODA4RjNPQkNSQjZY?=
 =?utf-8?B?WGEvQ2FvNlZVb1pJaU1LdUJaQzIxY3lnS0dDWG5Hc3BNUGRDYnRrSmJuTHpJ?=
 =?utf-8?B?TlN5K0czRVgyKzFickcveXh1aDNEVHppQUVJL3AvM2lIZXl5Z3p5WXZZYno4?=
 =?utf-8?B?VmdmQlRHTUl1dWY1SUFTQUZocDFSZm9uYVhCdXNOU1F4MmIxMUR1OXNPa1VH?=
 =?utf-8?B?Vkl1V2dzL080Y0h4TDVnT01HS04zNm9HN2dYL1ZqQWNUdzJkWm1HOEdINDdT?=
 =?utf-8?B?SElaSDFaSXVEWXV2bmhvSmsrOGhzMkFSY1dEM1lrYndWMS9RT3JkUXFBVSs2?=
 =?utf-8?B?dnBUek9XL0VITEV5RzJVSk9heG90M1JpckFsTExVUUlDOEttNHVabmt6RXpq?=
 =?utf-8?B?M0dWcWhISUZhR0t5aUFuU3d2SUZUdnVoTWt5OTNwaElyS2N5NW5BR0lJN3I1?=
 =?utf-8?B?VngycVBzVEFFWnJZWVlqZXlQYXJqR3lhWENSdHpjRTZvSHpma3lnT0NvRGRa?=
 =?utf-8?B?K2M2VkxsTnl2dUdKTHFXeE1tek41RHZ1ZmhVY2d1SmkrWFphY1ZkaG9PRXB3?=
 =?utf-8?B?d0RVM25xM1dYZkJ4TVk2dmQyTXM0d2Q1eDhtTktldmpEYW91K0lVcVBtVWNU?=
 =?utf-8?B?OThyZm1XN1J2MW5sYnBZczdmTHBxWmVpdG83K2RQUWVxd0s4bTZkanMvS3Nl?=
 =?utf-8?B?S0NPVFNTellpbE15aENRTWNuYm84cmYvNDJUTDVVNGdWdmQ4WVROVm5kTnhJ?=
 =?utf-8?B?OXdIdi92RGhqeWdrdmJQQndVQnZPbVZ0SnlGajVKVDRacUhMZ05qSGk2RDNN?=
 =?utf-8?B?MVpTTURLUTc1bGI3M0dPUThFSWd5SjczcS9OUlNUajIvU1FTSmNrdllVS0dv?=
 =?utf-8?B?eTFRS1RFYUc3VTQzalJtNlF2MVRtQ0hQWk9pcW1JNFVkQUVvMWI4U21FQzJB?=
 =?utf-8?B?QVRkSDBXYWZiSjhEQnRBRTFwU0cwVHk3dC8yNG1GQ3lCMEh0SzVOYmpJbVZK?=
 =?utf-8?B?NFZRaGpUNnZxOVY1S1B3WkNWVDVIUERWbk40QTY5L09qNTI1QVlFdz09?=
X-Exchange-RoutingPolicyChecked: r+Qzq/9dN8/H9iumEw7VJg14FjbGjwa0J56m7/PT3kl5d4uWxYpIHWr0/6JIW2+J4dv2LoV7fua8iI43lI/5SssuZ9Gzp/31rKUQbR7pM3tIHzqdiCJYz37OfD+RQWc0jfucjIW5WQiUzVWDI7T7pMLDu197u2I3VAdPjjhkeuPKZIf8bf+dqlRBU2SOrOyN8Qzc2Ph+C3LXUuwCVj1yBxG2GQ2KvgNg4EWh3hIvBMJhB9Myq3mZi9PXJs66QfLM6fiIyEDQRvOmojxEfuQk8K070NBQ8ewG+mExYLnQGcOVj9pVZYruvK9169gEYqUMUXP+wHwHOV/Mx0l/8guRvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2927f761-d7b8-4ecc-2588-08df34e444fa
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 11:11:52.7386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tTBkzEBvKfWxWKtCImN3usgcBvpyjJmMQLjqte6NhaEyEgK9+ZYaRk8IR+lA9FiWUDdOAr9ewcDbO9XyEtdgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anirban,

On 29-09-2026 16:07, Sk Anirban wrote:
> Handle a pre-existing configfs group by opening and reusing it, retain
> it across cleanup, and validate the fd so the test fails early with a
> clear message on any error.
>
> v2: Add a common function (Soham)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   lib/igt_configfs.c             | 56 ++++++++++++++++++++++
>   lib/igt_configfs.h             |  6 +++
>   tests/intel/xe_configfs.c      | 85 ++++++++++++++++++++--------------
>   tests/intel/xe_survivability.c | 23 +++------
>   4 files changed, 118 insertions(+), 52 deletions(-)
>
> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
> index e0cba92a1..a394cebe5 100644
> --- a/lib/igt_configfs.c
> +++ b/lib/igt_configfs.c
> @@ -10,9 +10,12 @@
>   #include <fcntl.h>
>   #include <limits.h>
>   #include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
>   
>   #include "igt_aux.h"
>   #include "igt_configfs.h"
> +#include "igt_fs.h"
>   
>   /**
>    * SECTION:igt_configfs
> @@ -84,3 +87,56 @@ int igt_configfs_open(const char *name)
>   
>   	return open(path, O_DIRECTORY | O_RDONLY);
>   }
> +
> +/**
> + * igt_configfs_create_device_group: create or reuse a device's configfs group
> + * @configfs_fd: configfs directory fd
> + * @name: name of the device group
> + * @preexisting: set to true when @name already existed
> + *
> + * Creates the configfs group @name under @configfs_fd. If the group already
> + * exists, it is opened and reused instead.
> + *
> + * Returns:
> + * The group directory fd.
> + */
> +int igt_configfs_create_device_group(int configfs_fd, const char *name,
> +				     bool *preexisting)
> +{
> +	mode_t mode = 0755;
> +	int device_fd;
> +
> +	device_fd = igt_fs_create_dir(configfs_fd, name, mode);
> +	if (device_fd == -EEXIST) {
> +		if (preexisting)
> +			*preexisting = true;
> +
> +		device_fd = openat(configfs_fd, name, O_DIRECTORY);
> +		if (device_fd < 0)
> +			device_fd = -errno;
> +	}
> +	igt_assert_f(device_fd >= 0,
> +		     "Failed to create/open configfs group for %s: %s\n",
> +		     name, strerror(-device_fd));
> +
> +	return device_fd;
> +}
> +
> +/**
> + * igt_configfs_close_device_group: close a device's configfs group
> + * @configfs_fd: configfs directory fd, as returned by igt_configfs_open()
nit: Keep this consistent with the other doc references.
> + * @name: name of the device group
> + * @device_fd: group directory fd
> + * @preexisting: whether the group already existed before it was created by
> + * igt_configfs_create_device_group()
> + *
> + * Closes @device_fd and removes the @name group, unless it was pre-existing
> + */
> +void igt_configfs_close_device_group(int configfs_fd, const char *name,
> +				     int device_fd, bool preexisting)
> +{
> +	close(device_fd);
> +
> +	if (!preexisting)
> +		igt_fs_remove_dir(configfs_fd, name);

Why configfs_fd is not closed here and an igt_debug/info would be 
helpful in case remove fails.

Regards,
Soham
> +}
> diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
> index 91f95659b..0f4cfe5d3 100644
> --- a/lib/igt_configfs.h
> +++ b/lib/igt_configfs.h
> @@ -9,7 +9,13 @@
>   #ifndef __IGT_CONFIGFS_H__
>   #define __IGT_CONFIGFS_H__
>   
> +#include <stdbool.h>
> +
>   const char *igt_configfs_mount(void);
>   int igt_configfs_open(const char *name);
>   
> +int igt_configfs_create_device_group(int configfs_fd, const char *name, bool *preexisting);
> +void igt_configfs_close_device_group(int configfs_fd, const char *name, int device_fd,
> +				     bool preexisting);
> +
>   #endif /* __IGT_CONFIGFS_H__ */
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 450c0a119..68daed690 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -26,6 +26,8 @@
>   static char bus_addr[NAME_MAX];
>   static struct pci_device *pci_dev;
>   
> +static bool configfs_group_preexisting;
> +
>   static bool check_registers(const uint32_t reg[], const uint32_t val[],
>   			    size_t max)
>   {
> @@ -60,7 +62,7 @@ static void restore(int sig)
>   
>   	/* Drop all custom configfs settings from subtests */
>   	configfs_fd = igt_configfs_open("xe");
> -	if (configfs_fd >= 0)
> +	if (configfs_fd >= 0 && !configfs_group_preexisting)
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   	close(configfs_fd);
>   
> @@ -70,10 +72,19 @@ static void restore(int sig)
>   
>   static void set_survivability_mode(int configfs_device_fd, bool value)
>   {
> +	int ret;
> +
>   	igt_audio_driver_unload(NULL);
> -	igt_kmod_unbind("xe", bus_addr);
> +
> +	ret = igt_kmod_unbind("xe", bus_addr);
> +	igt_assert_f(!ret, "Failed to unbind xe from %s: %s\n",
> +		     bus_addr, strerror(-ret));
> +
>   	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> -	igt_kmod_bind("xe", bus_addr);
> +
> +	ret = igt_kmod_bind("xe", bus_addr);
> +	igt_assert_f(!ret, "Failed to bind xe to %s: %s\n",
> +		     bus_addr, strerror(-ret));
>   }
>   
>   /**
> @@ -93,6 +104,9 @@ static void test_survivability_mode(int configfs_device_fd)
>   
>   	fd = open(path, O_RDONLY);
>   	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +
> +	set_survivability_mode(configfs_device_fd, false);
> +
>   	close(fd);
>   }
>   
> @@ -357,23 +371,6 @@ static void set_bus_addr(int fd)
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
>   
> -static int create_device_configfs_group(int configfs_fd)
> -{
> -	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> -	int configfs_device_fd;
> -
> -	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> -	igt_assert(configfs_device_fd);
> -
> -	return configfs_device_fd;
> -}
> -
> -static void close_configfs_group(int configfs_fd, int configfs_device_fd)
> -{
> -	close(configfs_device_fd);
> -	igt_fs_remove_dir(configfs_fd, bus_addr);
> -}
> -
>   int igt_main()
>   {
>   	int fd, configfs_fd, configfs_device_fd;
> @@ -412,62 +409,78 @@ int igt_main()
>   	igt_subtest("survivability-mode") {
>   		igt_require(has_survivability);
>   		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_survivability_mode(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate engines_allowed with invalid options");
>   	igt_subtest("engines-allowed-invalid") {
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_engines_allowed_invalid(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate engines_allowed");
>   	igt_subtest("engines-allowed") {
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_engines_allowed(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate gt_types_allowed");
>   	igt_subtest("gt-types-allowed") {
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_gt_types_allowed(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_post_bb with invalid options");
>   	igt_subtest("ctx-restore-post-bb-invalid") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore_invalid(configfs_device_fd, "post");
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_post_bb");
>   	igt_subtest("ctx-restore-post-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore(configfs_device_fd, "post", engine);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_mid_bb with invalid options");
>   	igt_subtest("ctx-restore-mid-bb-invalid") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore_invalid(configfs_device_fd, "mid");
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_mid_bb");
>   	igt_subtest("ctx-restore-mid-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore(configfs_device_fd, "mid", engine);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_fixture() {
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index b4f1dfb38..c89db43f7 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -40,6 +40,8 @@
>   
>   static char bus_addr[NAME_MAX];
>   
> +static bool configfs_group_preexisting;
> +
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/* this is needed for igt_runner so it will ignore it */
> @@ -155,7 +157,7 @@ static void restore(int sig)
>   	igt_kmod_unbind("xe", bus_addr);
>   
>   	configfs_fd = igt_configfs_open("xe");
> -	if (configfs_fd >= 0)
> +	if (configfs_fd >= 0 && !configfs_group_preexisting)
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   	close(configfs_fd);
>   
> @@ -187,17 +189,6 @@ static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pc
>   	}
>   }
>   
> -static int create_device_configfs_group(int configfs_fd)
> -{
> -	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> -	int configfs_device_fd;
> -
> -	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> -	igt_assert(configfs_device_fd);
> -
> -	return configfs_device_fd;
> -}
> -
>   static void test_spinner_after_recovery(int fd)
>   {
>   	uint64_t ahnd;
> @@ -225,7 +216,8 @@ int igt_main()
>   		igt_device_get_pci_slot_name(fd, bus_addr);
>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		igt_install_exit_handler(restore);
>   	}
>   
> @@ -262,9 +254,8 @@ int igt_main()
>   	}
>   
>   	igt_fixture() {
> -		igt_fs_remove_dir(configfs_fd, bus_addr);
> -		close(configfs_device_fd);
> -		close(configfs_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   		drm_close_driver(fd);
>   	}
>   }
