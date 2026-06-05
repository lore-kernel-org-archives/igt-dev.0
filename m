Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D6FCD6E7D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B8611A91F;
	Fri,  5 Jun 2026 14:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfjQE63C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B7611A91F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670726; x=1812206726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eQFt19zeut7gsO691U7rAnlkf9TPTzum4LlkrF64iRA=;
 b=MfjQE63Cg1yHxNk7R1vkdl+8b11grCNn1Jjfs7L7Lop6N3WjZBXlpg7y
 Imvj9KDYSLeCholCmmCGfAP4z5ze24p2QzU4K4DY1xgE6kIqBwNnFyUjc
 GG3Y9xDspxN4s5mYYwRzXvABDyz/lFQC3Zi3Jq4S1a59Dy8TAwn7pYmXP
 ZBBNSL26PMgSN9CGC1++y0t1ggU5wr4kdLrPBnhmUWL5MYcZW2tNozQVq
 7CIR93XnuXk3pY+hwS/EyHuQFZcb3qTFwz+i7GUvFHb6CBhmOoQkB5Q29
 hUCccvPfSueTdPr5GKd6DB5xMlJlUyyZ5HlaSMSZGEvCyyx83mCaUgOgu g==;
X-CSE-ConnectionGUID: L01dYHNyRS+9/l9QpuavDw==
X-CSE-MsgGUID: mC/4vK1/SdGYhY9NFEgG7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92613319"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="92613319"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:45:26 -0700
X-CSE-ConnectionGUID: j28CBlIjSmyLknw1JWqQOw==
X-CSE-MsgGUID: dvAf9q+WQb+HgkJ+er257A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="244719479"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:45:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 07:45:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 07:45:25 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 07:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlekXG6WtsgyDraS2sGiF7XFTkYZ39SnMKaAFHGq2MPO2Y2M8DEcezHz2+JrgVgjT6IJskkf8AH6GW55nUu0vCkcdggSNsWF0ga3S74/BFWhLCvAU5ds94Z+68oyXLvctSz/frBqJ+LPPNqa31ldrFNZUy94oktfwAybRwl0Fp7l6StD9oiREJWWHk8OoJm4D1J08mRAMlBR+TCDKsy4r7hgGvvn48NZPRASFmtaJeFG6e38+sjghisDBrK56JFwYavgqyoRy6AP8fYX7w4jZ3a9aSLGRONXYEkK3ZDp0o2j9Fat05zlBfDX/ziC8cRkGfpEQExMsQwnSBZrMXFauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALiurkM0mis9c607c1Lh93Gr4iaJm0JkWs598Kv9O7Q=;
 b=f3NNML//35G6rBsGccU+uWrdBTE6gn5BgHcFEvL6Zu9gAfhxnOx/N2vzaHS3mv9yN/GnYwVfFk5dJWWqlCs9fnsf/U+u+CEzRc5Z8GlgKrIj8K9RikqPXwk67rJNMENGEe+00bflT02pwsYfXHArQsD7SURuZnmJkcfjrYckOWPzQgtEBo4PI+r8Kk6evyfEbAK2Wn2wIsm9e6/m1gn2Ws2k2fb/aSlj0pO2cqVD/5dnRfSvyJql7WS3VlVKRA7PjbrkZFC5Gl7YoMyHIKS32Sm3iB4U5zjDkfZWqqlLFTBx8FRgEDJe2/NHDtUrLx7ojgkfEvJou2GRrzAa/7EEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF04AA7285F.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::806) by MW5PR11MB5931.namprd11.prod.outlook.com
 (2603:10b6:303:198::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 14:45:21 +0000
Received: from SJ5PPF04AA7285F.namprd11.prod.outlook.com
 ([fe80::ad5e:bc71:8e1a:ef18]) by SJ5PPF04AA7285F.namprd11.prod.outlook.com
 ([fe80::ad5e:bc71:8e1a:ef18%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:45:21 +0000
Message-ID: <b9f5b532-c525-4ff4-80cf-8325e8ba996b@intel.com>
Date: Fri, 5 Jun 2026 20:15:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected
 CGP_SYNC dmesg warning
To: "aditya.chauhan@intel.com" <aditya.chauhan@intel.com>, "Gandi, Ramadevi"
 <Ramadevi.Gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Dandamudi, Priyanka" <Priyanka.Dandamudi@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>
References: <20260605103632.3297911-1-aditya.chauhan@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260605103632.3297911-1-aditya.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0355.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::15) To SJ5PPF04AA7285F.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::806)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF04AA7285F:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: f29fb777-e172-484b-8d31-08dec31111d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099006|22082099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: Ud1f6GP4Q+6EFlOUC6+gdHwME2wNbUJfQgM+w6oi4sT+68/d9HRKAo38eOsnhBzexbuL9z25yJW5JU2NkPjR1WDhzQE1zE9ifUAyVe9gpqM3RhqwnrcE+06+H2DvhHFTe91xIIUKtTMoI/HHlC6xnmdoJ3G3uF0DKt4YQlVyZDzkfffCo63Xy6dhF5MRQfkoHd0M5WdmLWZLWdbwxiuq6g4wvIqHNwQnoybevEQXxufiFKow9bUgTsyAeGLcX6tFOdgtmlSxI1zqCaeq5aORYHpDKcnZ7aaaKbZO5qf9gdSubKaP3cONVBM0qE+hv5H3HC6sN6/pFeKEUihMu4Ib+L1mtY/oI5f6P9sibqFELn6UZDnCbRMzAPher1WrRu4oc4+Xaf2VvhafhM9MsXsIANqERu3K+t+gWMlNygm2ZYrECtIvhhWekak39A9Av5PL6hcc34D4PKTim4rxGdeq+zEz8O3m7PcCgQy3oavL5my3dpmucIK1rjbfs9OxT87lHxC4FiBwNlBe0raL61bd/PVAdYB6zfd06n5CzrY9ZB5WI4s2PCNrPUDO2x7l8vXfjYuy5uTTr7ovEIMjSBw1OsxuMBbBJSQYDo1WSkIj4rbNeOTk2SNw8rJg69Q3KI8F3D6dfEK3d3JnPmKmevh/pv8Rds0QxFMjiA0jTVpu/h8wxsJ1Kw0jQSiSDWkY73KsidG9rYrPKVF49sS3LbmTKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF04AA7285F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(22082099003)(18002099003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWtpWjZMdXB3MWlpS0lEUWhuZnN3WGwyOWNGYnprN0cyd21LR0MwUXNZWXlu?=
 =?utf-8?B?dExJWVM1TmtvazA4TUVSaWJRMTgraDVMT29zZDQrTTdXUnpsdGh3cG9rWHU3?=
 =?utf-8?B?WWpaVzdTa0wwNTI0d0JGN3piUzhEc1VzQ0xIOXppZmZxSEVkYlJTUXF1SDM0?=
 =?utf-8?B?bGllWUZFZ1EzT01HMUFlMFVKUk9zaEtzalI5aHJHTmJMV29ieXd1clFMc3RS?=
 =?utf-8?B?eDloRUthV1pEODlKY2N2eFYzci9FemF5anZSSER2cXRMbFMrTTNWY2J3Z0lX?=
 =?utf-8?B?bjd3RC83VXFmTXEvazcyVWRZNWRCaGVHRkFOVmIwMEptWnp5alpid3l6bllq?=
 =?utf-8?B?aTI3OUNSN2QydE5Vd2tlSmJtaTJ4dkJ2S0hCdnJZelRCSG80UlNSSVFxK1d2?=
 =?utf-8?B?cklZTTVDNHJxSW9hWXlIWGlkZk5ISFpLVXhkbUErcnEzcm1NZmEzSTdteVFm?=
 =?utf-8?B?Vi9icFQ4Q3pqOHJabnVwbit6U003YnYyL3VoRDBNSStqZC8xTDg1UllaNWNq?=
 =?utf-8?B?QTlCcG0vNlM0LzJ6czJBcGE5YUZIcHBpdzhLc0tXbWNQWUtKTWlNNzR3VFN5?=
 =?utf-8?B?K0dZbVArLzU1TzVGVjJHMjdtQVJLdTlEZlVLamVyRjdDZmVSRzQrWTluR202?=
 =?utf-8?B?SmxTTUw3UE9IQnZrSzhIbC9RWk5QYXR6ejFwNVYweDRFRGNNaUhBYUhJZmRq?=
 =?utf-8?B?V0w0aDkzaXl1R1JyY2hVUFBZKzI3dnQ3UDNJOCszRUYzdlBYV2pDNUNiK0Ez?=
 =?utf-8?B?MmNLQTU4bWhKalVRL0hJTHlzVUk1T1gzQlR4R0VINVd5RWFwdm9oZkRuMHZp?=
 =?utf-8?B?aUVsYmhJeG00UnRwNkV4R2FxcVI2RkxDajJnOEpNTVEya01aMEFENHVybVJa?=
 =?utf-8?B?V2pXdURyaFRIZldjMVQxL0c0OTgrK2dVQ3Vud29oSlVIWHVlcHN0V0NqUG1V?=
 =?utf-8?B?MnV4TWxyQTBBU0hjN2VCcmhZL2VXdUZhbXpqU1hEWit1Z3RtM2FyalBUanNF?=
 =?utf-8?B?RVl0UmN3aGhxZmY5VUFUQzVBTGF2cWQxbUpYdkRuakJDNDZTcmhiVjEvYklp?=
 =?utf-8?B?R09KbEFTUmE2SVZrUVB4QWg0MEJvdE01OWNyL1I1V29NS29JTHNDQnpuQmRY?=
 =?utf-8?B?MXN5aGFYWS9uYWt5am9hZlJCTE90WDhMTlJ0U29aRnltMmFOMlI0QUlxOE5B?=
 =?utf-8?B?QjBXQXBEdFVDZmFKTXVYZnVVUUZuUGFpTUJpTXlwMUJ6L2FpV2M3RDFBV1VV?=
 =?utf-8?B?bUg3V0p1cElocmlPbkJHRGhXME1jNmlhUi91T0NCUzIrOXZsaytsdWtJRlp3?=
 =?utf-8?B?Vm9ybmF3QitUNkxMQkRscWo5eklhaW4rMTdlcldzaVNtcDlUUWdlL2VVeXlv?=
 =?utf-8?B?SVpsOXdnYjlEMkhFY3ZjdTlsREZMWjkyZWdXUzY1TkxZMXRMKzhkc0trYkVI?=
 =?utf-8?B?dXFYKzNYZjllSENVcmVoOXJiV2tKN3ZoSlZJUnNvenc1S3lpWXdib09jZWRa?=
 =?utf-8?B?ZzhsSkEwSDVJemxvRmlQanNGbGE0bkQ0ZkVVQUoxNkUzZVl6dnJYYkEzb0li?=
 =?utf-8?B?cTRTSHB0ZC8wVXp4akE3UVE0RWlYTXMycnFNcXZmRFVKaWdZY2xvUlNveFFO?=
 =?utf-8?B?ak50TElwVm1RY1RIenNJY0IwUnJrM0VoUkdMeVJwcWJMK0Z5cUdycnBDZ0NB?=
 =?utf-8?B?OVplYTJhUlI5ZzJNZ0U1cGNNTllxNDR6aGhNc1JLdVc0ZmovemllSHRsa2V0?=
 =?utf-8?B?WEpXZmQyYWNQVGwxUXdKc203ZnZEc2hBWDJmejNrUTlrOVNWQTZscDgyaGZl?=
 =?utf-8?B?d1hjTjk0R0VoZTNBSWlRamdVcVBVS2RBY1NCN3c2SnNjK25ZNnF6b2orMCt1?=
 =?utf-8?B?QnZpb1pUYkR2ejdETFZvemtyOE1FK01xMjlLdzFaVFIremE5bko1R1dnZHEw?=
 =?utf-8?B?VHhWNU05dER5RTJ4QmlHNVFLS21WOHZ6bEFoZm93ajI0YTcxc0JHOWgzVDRX?=
 =?utf-8?B?VlZyQmhNWWYvVU9lVjAreDhLRGNGdFQwR1g4OHd1QXo0UVp5cS9vbjlPVmVG?=
 =?utf-8?B?LzNEK0FJSzF0ejYydmcwRVVUM0VxT1JjQW1yQ25qbWtPYlcybkdVb0NydHBV?=
 =?utf-8?B?azM3Rk00ZFJHUXNNNWFiMnJJcDFQeS82TWova014U3EzeDNsQXFXMTlXWlBF?=
 =?utf-8?B?eG92Ti82L1BkRnRtTk0zMHR3K0JwbTJxWUNReDlYYXltR1FkT2duYUlaWXds?=
 =?utf-8?B?L0UxdnZhSnlRZjZuRUZaV00yMW81WjQrZ1FDZ3J3bWlXWk9RVSt1ZE12SHNK?=
 =?utf-8?B?bmEya29tazNHRWZOV2YzTTExUC9tdERCeVQ4Y3dwT3ZCZEFmdnJLdz09?=
X-Exchange-RoutingPolicyChecked: b6QmZjVGvN0N8FyISs9xdhs2tKOeG7q7szvJrfKC0iOtNSJyQ2bIObhvbarxgdsnNzuUI5c57smUKD7qoLipQslADW8Ac99Dat8uhmG23Y9tmNmqFbNNIrfzQv40RTSOkrsJ5KfT84xvAllKElmARvOC3VUKtJL6zKEsV6ucoPFOgW1Njyvb16Z6pWBjT4/2S8IvszocjV/rpOoLxdsolWO9Q2NcT1WBNRR9t0BkgJ9xe8zNPicgEZieBNZr9j3GFhy4JuWCI9MaBrjZY0KCAxJCtPJD1KLpRwFMAcH/KMKOmq+bNzJUXOLRlkYRcyyf4E1XJVHEiWoqRBud6wgP9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f29fb777-e172-484b-8d31-08dec31111d4
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF04AA7285F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:45:21.5134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9J8/Eiw4MWqYI9J7CZbFm9pSCVMhEsqok9LtWPGSQvfM07IRKZamQa+wJOe/Swc7mwYUbMAKRW5jh6GB9Kr5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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


On 6/5/2026 4:06 PM, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>
> When multi-queue GT reset is triggered, it causes the kernel to emit
> "Wait for CGP_SYNC_DONE response failed!" at warn level, which is
> expected behavior as  the test intentionally validates that CGP_SYNC
> failures are recoverable during GT reset.
>
> Suppress the warning using igt_emit_ignore_dmesg_regex() in the
> multi-queue-gt-reset and cm-multi-queue-gt-reset subtests to prevent
> false dmesg-warn verdicts from igt_runner.
>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>   tests/intel/xe_exec_reset.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 89a47d236..dc1ae7e99 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -29,6 +29,11 @@
>   #define SYNC_OBJ_SIGNALED	(0x1 << 0)
>   #define LEGACY_MODE_ADDR	0x1a0000
>   
> +static void ignore_gt_reset_warnings_in_dmesg(void)
> +{
> +	igt_emit_ignore_dmesg_regex("Wait for CGP_SYNC_DONE response failed");
> +}
> +
>   /**
>    * SUBTEST: spin
>    * Description: test spin
> @@ -1104,6 +1109,7 @@ int igt_main()
>   
>   	igt_subtest("multi-queue-gt-reset") {
>   		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
> +		ignore_gt_reset_warnings_in_dmesg();
>   		xe_for_each_multi_queue_engine(fd, hwe)
>   			xe_legacy_test_mode(fd, hwe, 16, 16,
>   					    GT_RESET | MULTI_QUEUE,
> @@ -1165,6 +1171,7 @@ int igt_main()
>   
>   	igt_subtest("cm-multi-queue-gt-reset") {
>   		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
> +		ignore_gt_reset_warnings_in_dmesg();
>   		xe_for_each_multi_queue_engine(fd, hwe)
>   			test_compute_mode(fd, hwe, 16, 16,
>   					  GT_RESET | MULTI_QUEUE);


LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

