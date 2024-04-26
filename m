Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F114C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 07:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DFE11227A;
	Fri, 26 Apr 2024 07:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gs9wrx6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BD911227A;
 Fri, 26 Apr 2024 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714118197; x=1745654197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KkjYC1gvprjrrTwXJU576elZK/Y/md9rZhUkmDwtO1M=;
 b=gs9wrx6CQBS8fLmd4OHCi6s5IBwtfRciZuLtLVyQ3dsGY/IjJ7VPybbf
 6EziK/aFDvKQA+MSouK402S5daGvVxy43lGDE6k+FMjOfN3RqpxaKL0I1
 Lawj+f7Msq9mExzk4mfi9NEUpfTNWpFSJPLqcOL37QDvrucDhQm8coIHV
 8NJCQpNM6rtlcbU8XkpuIN5T5OQ5XUVhK1wG0qxwSTPeAT5RStjbXHAtq
 IEJvR5wSBknDaZ4AZPrMLPZekcACQcgAccj14p8KlmmwS87xyt/6GPiZ7
 /PjjWCWR5lGLHGnOvKqDNZEDb6Dio3qLap9mS9G98NtPYMXJx8uEogWx8 g==;
X-CSE-ConnectionGUID: P6dLj9taQT2MlRNyuVTvGQ==
X-CSE-MsgGUID: EPKWe7AeQHW7fy7AXiZ06A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9959656"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9959656"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:56:37 -0700
X-CSE-ConnectionGUID: y8bYNNBIR/uDAxUomJ41cA==
X-CSE-MsgGUID: xKqkhe5iSOuaWcjm0AxgaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="25975699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 00:56:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 00:56:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 00:56:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 00:56:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 00:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzioB4b7HvF4wgc9gRLXMujvAcBqUZl31xv11zkWl5kyLxxglMI5UD2w0LuaPprkYgLYAnBkZBcv9sKi2MoEQGmxi0QDkBKAVqgEslB3/gtgpHjjB1cfdvcdDl+P7uZYYIDA8hh5N/i45EQi4DiCDsozcnvfVZVUd6FPSBR9gJYnkUuKyf2kQkJdgemw5wOUalr2nd/6S5pM5iqjhl6P/04317EF9df5RWnw7guXtFiF4X6kLhKl/qMn9NYymoAV5zMdURofs2J0u0jKZwRfUqWH+iulMjJ8R+ZQlEBG1/W5QixW0yKSqhraoAMQI71u0jFoPnOWptsi/XFykQmamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkjYC1gvprjrrTwXJU576elZK/Y/md9rZhUkmDwtO1M=;
 b=mWA4z+067NXbe3RLT5KvQWH3BsuQKGcqjxPIEc/ypkXsAkAHs0eY6yLiX1pwtLy2uV9u2lKI75G8P3JkD1NhnMIzl6L6MiQ95eGq+bhy5M2hrDtlctP6p4xx9TzfuU3VcYgwc6BdS93LZH+owv36kQa4F8fDjjV9puB+N/juxLc6yugppr1jGi19CjtWb9MTx5G6IS5RpUIJg0Mxuz2mudh1v45KLDGFj58tXArwwNaTSJX71Ogc7opF18mdHt+Z7Cy1vBM9VO9eQ9Gyd6vRnRr3AFPJyDpW/4DtjqyKN/Zty6wpalaFxlP+zfXSH9vUOfz9fpdxJHrFgXMfVwdygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Fri, 26 Apr
 2024 07:56:31 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 07:56:31 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2RldmljZV9y?=
 =?utf-8?Q?eset:_move_later_skips_into_subtests_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvZGV2aWNlX3Jlc2V0?=
 =?utf-8?Q?:_move_later_skips_into_subtests_(rev3)?=
Thread-Index: AQHalyRoZbcheWlD00S1eUPvvBLgXLF5MXkAgAD+iHA=
Date: Fri, 26 Apr 2024 07:56:31 +0000
Message-ID: <PH8PR11MB675378A0BAE656E27D7D7EB9F2162@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240425140544.41750-1-kamil.konieczny@linux.intel.com>
 <171405854591.1667639.11449798164959104525@8e613ede5ea5>
 <20240425164446.lmd7cstzvl7hvqts@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240425164446.lmd7cstzvl7hvqts@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|PH0PR11MB5879:EE_
x-ms-office365-filtering-correlation-id: 74c2762c-1251-458f-fe00-08dc65c66296
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?cmFOK3lFWDhYNXk1emx5SCtTUWExdGczUGFTRXF2UXdnNk42c01tak8zNXpW?=
 =?utf-8?B?VXFWeXRPa3pQbTJnalNvcEw0YlpLM05scHZPcVkrQ0F4SmY3ak51TWdTV2dH?=
 =?utf-8?B?LzlBcmZYOXhWWU9QYjZoME9KWXA5djZkMWZvWXlJOXcreDNXUnhrZ2ZSTS9x?=
 =?utf-8?B?c01teS93WFc2VGxhTWpQSG53dkVkTkJrOXpGY2twYUhicUJ6TDBOSE5jV2lN?=
 =?utf-8?B?aW16ZSt5V1UzNUhSazFzL1dtbldpaG8yR1IybnVCaWVTSkdoaVJRSjkyVW1S?=
 =?utf-8?B?WjdnQ3lzZlhRVnVRdElnbEQvSC94ays1SHlySnk5VURveFF4ZVdnUG5OSmRo?=
 =?utf-8?B?S1kvanRibWlSOHZlZUl6Z2Z2QUNzWVk3a0FlOGd6L1JGeWpxNlZRbnJWU01v?=
 =?utf-8?B?M0tzWDZ5N2NCbTFVYnJEUFF4MDlwZGNqSW9ScWxNazdGeFR3N2labVhRKzJV?=
 =?utf-8?B?bEtnZ1dZSHJydWgzVmVycmpHOEVlN2JMd2ZzYklDK0RvbTBXWnM3K1A2cldH?=
 =?utf-8?B?bDdUVS9tbjhsUGgwcjZ5V3JwZk9jeFg0K3RQaSt0a0llUUllU3RLTWlNUkpk?=
 =?utf-8?B?YUxvRFl6S0ErTVl2OUMzaFlnRVlPM3pjWjhOSnJYdGhoSFJXdjJzRWxIaFNC?=
 =?utf-8?B?ZVN2bkxpaEF3bm1RR0t2bmh3MUloK3B0WWNpY3Flb2FweGdxc24zVHhpM1pW?=
 =?utf-8?B?RTUxdzBpRGlxZWFxNGlkVlE2S0ZoN3FYRUEvc2o2eHRJNTVFMGYzOW4rT2JR?=
 =?utf-8?B?Uk9TZWI4ZGlnSDdxZEpvcDRuU1Q4RndqVXFtWGpiQ0szL1VXZ2QyQmRiUzlm?=
 =?utf-8?B?YStMRmFzVmZWbGw4SlRhTm8wWWNBS2g2RXZOcXZtZTR4WmJYMER3OTV5ZzhL?=
 =?utf-8?B?T0w1UEFOTVBFMlNzVHFsdWQyQ01FUmpiQXRkRVlMZGdNQkFRNWpiV0dXS1VJ?=
 =?utf-8?B?Wmg1N05weGUxYVlFNkgycFpWMXE0SnVRSEhJdnNzMVA2alFxNzFBbkdlbDkv?=
 =?utf-8?B?bU4xKzg2MUdPWVV5UmRJVGdlVzZkTjE4SWlLTnlxdklWaFhpeXF3SW91T1U3?=
 =?utf-8?B?dE82NDViL2hvNk1KK2JIMXZoc2hMSytDdDBVcGh0UGpGSk8vZW5GMjFrM3gr?=
 =?utf-8?B?SXdpcld5TUtVanVTV1ppTEJCY3RFOHN2RFdXYXVZWWIyNEFWV3NlOENNQlM3?=
 =?utf-8?B?OGkrMklZeFFtS1pzMkZlQytwRVpYWExEMld3RUZUNmdpS1NDQjZncFZPeFBI?=
 =?utf-8?B?TlBDOG9LeUtlNHlTVEI5U2lsdFZiYnBPWnpKWDlsUWxIZHlDUGowQURWV1lM?=
 =?utf-8?B?QnN5UVA5NWoyVUlPaWhuZzlSNjcvNkwxVzZyWXRHVy92VnFURDdwYmZFTE1w?=
 =?utf-8?B?cm0zTUpJbnM3QjRRRnVrOTZJL1Z6QU9mUTBLSXhPRWZRMEREM1hpbWVGQjlT?=
 =?utf-8?B?M250bnB3emJtVXp5b2l5Z3V5L0lmbklJK1ZBUHZ2NFVRL1Q4QUp3ejlETGtr?=
 =?utf-8?B?cC9oMWFMWnp1SkVqQUlhS0toT282MlpjQWtpdVQzNWxDQmE1QTdVMmtsbmtV?=
 =?utf-8?B?aENNd1VNOCtKSjdFa3BZWWFCajdHYXBnK3ZQcEgveWlpNWIzZWRhMUlsWXNn?=
 =?utf-8?B?Zkp4bWxkOU9CN3phNmQvK2x3S04wUmRQWjV4SklCZFNWUVk5ZFVUTjArSG84?=
 =?utf-8?B?WnY1RTFCYThKdnAzVVhVeFRWUlVVc1AzQlJ1MUMvN1RlMWtGTy9HOEVsZ2Ux?=
 =?utf-8?Q?PxXdmGZsHrPCikNgy8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WExUVGtUMktQbWR6dExMTDF1RllmKzBpUWQvMzU5REU0WDMwNTgrM0FWaGtm?=
 =?utf-8?B?SkV4VzBYT092S3pFV2IxbUNDaXRqaEhiUUNKNU8zS1lGenNUVFNTRURvNEU0?=
 =?utf-8?B?QzBaM1c2aWNDbDhZUlNBcTR6YkVmQXJCbno2eEI1K3NIUXdkNURhYm1UUDlt?=
 =?utf-8?B?L0Fra05MdVBkb09XRGh2bmxOSEZsSENob3BxVGdHUmhud05XNjZBcllmRStw?=
 =?utf-8?B?ajdaNjlmRXErV21WT01nb1oxeHhLQ1R3OHBUV2NCazhESHRvSVBMNGt4dllW?=
 =?utf-8?B?ZnhjeWhHZmxhcy8ybmRpeG1PZFM1ZnZEbHlpbFZjelh1UnFacjFiR3J4eXlY?=
 =?utf-8?B?T0oxcm5PT05aZlZ5NEp0aFFhL1hyMmxldGp3MEo2YVU3OUlZNDlxVHh3SUtV?=
 =?utf-8?B?SFVvWTdPVWZXamtYQVA1SGZBYWs3VjBWcm5jYnJoZGFwcmNqN0FYVjFiYktk?=
 =?utf-8?B?NEZUU0haNVZQV0NaUHJkK1hyd2FRcnFnRFgxeVlJRjVMbk9ja3ZQWVZabU8z?=
 =?utf-8?B?TWFNVkxvcGM3bExMdjB3UklHWWpSZHFhTTY1WkpiZzVFeHRZK0g4bWpVL2Ji?=
 =?utf-8?B?QXhYUUtwS1p1UHBwK3FYbTJPT09aWFVnV2VnWlp5eE1UenBKaWdERFFhY1Na?=
 =?utf-8?B?VGdnUUdtTXNCZFgwakNJc0hwL2hNQUhMdmhiSmpHY1VHQW5nb2l2cmNSOWhN?=
 =?utf-8?B?TzVhbVJ2NmhUdzZVTWhYUlVjdWY5YlJjeFFLaTFmdXFrYUFMSjFTZkFSWkJY?=
 =?utf-8?B?L010OGtqT0lNSUcxR1crQ3BRUEhhY0tsclZ6UmRQcnQ1Wmo4ME4wSHNSbEZL?=
 =?utf-8?B?TElodVEyTWI5NXZGdDg3UFF1VmxycDFZZk81UWZPZC9BQ28zekovbzVWOE5P?=
 =?utf-8?B?N2ZRUEsyelhYRy9WRWdEelVaaElIMzlMeWptZzRNNkxKZ09MWnoybmV6ZDI0?=
 =?utf-8?B?RStXam5IK0crbG02dGZ3ZW54TG5MU21SRi8rSXZCaGJRbjlqNDJ3aVNSckhC?=
 =?utf-8?B?Y1FLY3FRcEtQUmx2MVlHQkVLcUUvVWVaRUJhTC9xVGtUQTRsSkhVellwNTJP?=
 =?utf-8?B?dmw1dWorM0M4Q1F0TERxOFdpODQ1VlRrUGE3UWVGL1Jpak10VU03c2lOc1g4?=
 =?utf-8?B?TXFFRnp2M29wMmNMZytpUUxaMzhjQVNtb2VmM0h4dUJSa2s3d2MwS0JyNXJv?=
 =?utf-8?B?aUZJODBMby9WL1BkcFJOOVZ0YUdNUmZLKzlNeEIrSVE2K05hT2JuVHdkdkNB?=
 =?utf-8?B?ZGJ2bjdCRWMreUJYcEJTalJJLzBDNloxWU1jTiswdVgyeEtxMXpDUDF1MzlR?=
 =?utf-8?B?NDBncXVDTjB4QnltcnFEc3dkVU56SmlnNTdvUjExZVk0bzRMeHN5WUhDZUJn?=
 =?utf-8?B?OTIzR0tFSiticG1sVGtYQ3kyMk42YVQwYnJoa0JQL1R2bDlNYTNhUWpEbndp?=
 =?utf-8?B?M3ZOSUpmL0o3ZXhlbDhxMVVrVWUxYTNYK3l4eCtvM1JlT3NLY0dtZW5mZkxI?=
 =?utf-8?B?TDVwSC9hbVF3WEJ0cTNQTHliVGtxNnorckxRb1VvSndRdjdIblkrL1V0TWF5?=
 =?utf-8?B?aU9OY2QvWDBVQ3lENjRQekRHSEZTRzJKSTRuL01yQ1JoQzE3SGg2c0s4WTlX?=
 =?utf-8?B?WEZReDhlRE5GRkhCcTQxdVpvWFN4MVY4SkpLWktzVlJOajhGd2RVYU1BS0lO?=
 =?utf-8?B?T0F3WE1EU1pDT1c4RkxhOHpTaFRuL3g1dXVpbHVVbXl1amFXVEZyd0RKeWF0?=
 =?utf-8?B?eElNRW9CQ1ZBZUJFOU51NDlueHQwVTZ2T0piZHVLZmx3UGVzSDJvTG5ucXpk?=
 =?utf-8?B?VXUrNnR0OWFhd2JrVVhrT1ZQK2YvTGdMWGF6YnNCMk1BbFRVS1VRN2YvRkpa?=
 =?utf-8?B?d0JreklPQ3FXRXpES1dQS3lTbW9FaytNdjl5U0JOczlkMzkwdzB4MTVlSmNk?=
 =?utf-8?B?b2YrQktoVFIvenhLRGVxMW9qVW94OHVEQ3h4YUM0NTlQRlNBM3pOaE8ySHZT?=
 =?utf-8?B?MEdEZFh1TTRaNWlyVXNpUGs2ckNoOTUvZFJQTFdRUWYvTCtTbkdkbjlzYUNW?=
 =?utf-8?B?blBsY1JIL3cwOTRuVG5tbGVab0JTa3VYL3lYRHMxNjl4eDduNWw0cE9xNEtB?=
 =?utf-8?B?d1FZdjdDQlN1S2dPUHBQRWdsUkpUNS9qVnRDRGFoK2RVeWdhTkJIVnFEOUMv?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c2762c-1251-458f-fe00-08dc65c66296
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 07:56:31.1151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlIG3QgLQ6GYK1pdhJ6goA1aJ3U4kD8bs29R4G6RKYNETcDM38wIWYYdI6B5BnG+AzsfiaQdx5c/MCuJ7GhbOl4PUej22Z1Azx4oMZ4tx1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMyMDQwLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsIEtvbmllY3pueQ0KU2VudDogVGh1
cnNkYXksIEFwcmlsIDI1LCAyMDI0IDEwOjE1IFBNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVj
dDogUmU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2RldmljZV9yZXNldDogbW92
ZSBsYXRlciBza2lwcyBpbnRvIHN1YnRlc3RzIChyZXYzKQ0KDQpIaSBpZ3QtZGV2LA0KT24gMjAy
NC0wNC0yNSBhdCAxNToyMjoyNSAtMDAwMCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMg
RGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiB0ZXN0cy9kZXZpY2VfcmVzZXQ6IG1vdmUgbGF0ZXIg
c2tpcHMgaW50byBzdWJ0ZXN0cyAocmV2MykNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzEzMjA0MC8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9
PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNDY1
NCAtPiBJR1RQV18xMTA3MSANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJ
TFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBX
XzExMDcxIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAg
IA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8g
ZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTEwNzEsIHBsZWFz
ZSBub3RpZnkgeW91ciBidWcgdGVhbSAoJiN4Mjc7STkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcmI3gyNzspIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBm
YWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4g
DQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xMTA3MS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3Rz
ICg0MSAtPiAzOSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE1p
c3NpbmcgICAgKDIpOiBiYXQtYXJscy0xIGZpLXNuYi0yNTIwbSANCj4gDQo+IFBvc3NpYmxlIG5l
dyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5r
bm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzExMDcx
Og0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNz
aW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBnZW1fY29udGV4dHM6
DQo+ICAgICAtIGJhdC1hcmxzLTI6ICAgICAgICAgTk9UUlVOIC0+IFtBQk9SVF1bMV0NCj4gICAg
WzFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18x
MTA3MS9iYXQtYXJscy0yL2lndEBpOQ0KPiAxNV9zZWxmdGVzdEBsaXZlQGdlbV9jb250ZXh0cy5o
dG1sDQo+IA0KDQpVbnJlbGF0ZWQgdG8gZGV2aWNlX3Jlc2V0IHRlc3QgY2hhbmdlLg0KDQpSZWdh
cmRzLA0KS2FtaWwNCg0KPiAgIA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0K
PiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZvdW5kIGluIElHVFBXXzExMDcxIHRoYXQgY29tZSBm
cm9tIGtub3duIGlzc3VlczoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMg
UG9zc2libGUgZml4ZXMgIyMjIw0KPiANCj4gICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAZ3Rf
bHJjOg0KPiAgICAgLSBiYXQtYXJscy0yOiAgICAgICAgIFtBQk9SVF1bMl0gLT4gW1BBU1NdWzNd
DQo+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9DSV9E
Uk1fMTQ2NTQvYmF0LWFybHMtMi9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGd0X2xyYy5odG1sDQo+
ICAgIFszXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTEwNzEvYmF0LWFybHMtMi9pZ3RAaTkNCj4gMTVfc2VsZnRlc3RAbGl2ZUBndF9scmMuaHRt
bA0KPiANCj4gICANCj4gICB7bmFtZX06IFRoaXMgZWxlbWVudCBpcyBzdXBwcmVzc2VkLiBUaGlz
IG1lYW5zIGl0IGlzIGlnbm9yZWQgd2hlbiBjb21wdXRpbmcNCj4gICAgICAgICAgIHRoZSBzdGF0
dXMgb2YgdGhlIGRpZmZlcmVuY2UgKFNVQ0NFU1MsIFdBUk5JTkcsIG9yIEZBSUxVUkUpLg0KPiAN
Cj4gICBbaTkxNSMxMDkxMV06IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2k5MTUva2VybmVsLy0vaXNzdWVzLzEwOTExDQo+IA0KPiANCj4gQnVpbGQgY2hhbmdlcw0KPiAt
LS0tLS0tLS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gICAqIElH
VDogSUdUXzc4MjQgLT4gSUdUUFdfMTEwNzENCj4gDQo+ICAgQ0ktMjAxOTA1Mjk6IDIwMTkwNTI5
DQo+ICAgQ0lfRFJNXzE0NjU0OiBhZmU3NGM2NDVlYzYxZWJlMWM0MDY2NDY3MjVlOGQ4NjliMGIz
ZTljIEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ICAgSUdU
UFdfMTEwNzE6IDhiOTQ1Yjc0NDJkNzliOGVmMDIzNDY2MWQyNzliZTcxOTc3MTdmZTUgQCBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+ICAgSUdU
Xzc4MjQ6IDc4MjQNCj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2Vl
OiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMTA3
MS9pbmRleC5odG1sDQo=
