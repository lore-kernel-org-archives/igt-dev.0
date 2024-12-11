Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9310E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 08:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836C910E5FB;
	Wed, 11 Dec 2024 08:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyjFMoFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2BA10E5FB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733906836; x=1765442836;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oaV20cQ7GOxuz35UPBCpUwwFFz2g6oQLmAxegj8c1Bo=;
 b=lyjFMoFUJQ/U8kooZmZNjNLPDwkRwoC9IWEJUr4oST2TNi00en5uk/pl
 tJYbYv1Gx6FCEyj6VWy+HXvMLYzScn8Yjgqnou0VPe2WL3BZoWfw+lkJz
 5rUOwBtChFHGjtixd6wJIx2u7lGYmpIojrfQc2Nd39cYdHmXJLJtnABYD
 jJKE0BtYTK0H9stP4KJh7vD419JAr0ojkcdanTzzZp38sKsbubvGqluAg
 xuXmXbQavGlk2V7MEeXcwpv/8TTtjXeqKYUohwwmiJNtVD0ghomlwGZOp
 d2KvcoqsocaMcRE3ywMiNhBHRkDg6rIwCk6qCwTS1E87lQdUEfEVcq6LD Q==;
X-CSE-ConnectionGUID: jQoUPeWrRzGsnm+Hidsobw==
X-CSE-MsgGUID: GHM7BZj4Sl6rrxsgwBnPdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33596669"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33596669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 00:47:14 -0800
X-CSE-ConnectionGUID: 6zSFE23WSRaV1pcI/U6zfw==
X-CSE-MsgGUID: sVzAYyj/SKOMQc8XQ4ls4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100260332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 00:47:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 00:47:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 00:47:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 00:47:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQlSt/J3XX2kCHr4boFHWS+3tWxpp/y1qNkVkal5Is+wdgqQyiXiEdK4G2F2kIFcTpP4GXy5qNLvEd6Fn8hK7l9E0iQp+hdWNYwwbXpOnDiGP+iumBp6UK/QtCAyofPGT3TL/jNVun8vaxbIicypf1DX3qsI7Avn//vpE04IBQr2iSbv49IqUY4IEk3oWSBuWfE43V6r03vkevV00ugHe7qXdhvySX1jQeRU7GO4HCGEstYZbFI7qE5h069AyqjvPwsK6/II/3GDlIgMnErF8uNU/emLcn4mNsYNqoVkHB4X0jLvIoT8g0hv7rBNy9GtCtBqIhlnzXF9sNMyWXTqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scFczrNQfKfZ6UpfuuLMcDwRrsMsKm0zfKwJYzDse9s=;
 b=Er7PCqyv0MI1DY1lfdmJg/KN0dWam3t9Ocs1pzwMW7jO2cstAG+5ATY9+SQfQi51VqV+5NjZEenBdlPnSCyloN2NhatUvEeEJMk3xWTgvFkty6hm/BnIU5jcyuO9Terp52qW6x+YWPKalLY56Rsandtqtcu7hqPdHtf4KbTNs8Ar0cYYbaV1FZkLczVOe3Wor2fE1aAbxnxuiQ8d89ELTEb/NgyjAF428Vd3v5ajF6Zdux8DZmeGTrQiDvnmxVJwHJ4intz5x8W6Dj2yI5AUzJWK5spvpnHp6JBv0t3jAw68t1Alj8s0O3Me+12elTs4Ja3xla7CBsSjwNKSAqvJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB6964.namprd11.prod.outlook.com (2603:10b6:930:57::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 08:47:10 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 08:47:10 +0000
Message-ID: <1d38ea57-ef56-4604-b3f2-4ae628d0d3af@intel.com>
Date: Wed, 11 Dec 2024 14:17:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/9] tests/kms_sharpness_filter: Add scaler subtests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
 <20241209114623.1843033-8-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241209114623.1843033-8-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 62643f86-5873-4337-7c4b-08dd19c066aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2xpU0V1MHhZenBkSHZDUWRxU0c0UzJiU3REakgrWjNFTENLd1lIeTB2ZDJN?=
 =?utf-8?B?WTIwcDZYNzJnZFluL1dOZ3RBTTRsZU9ubURMbFd6Tm0wT0t4TVZzU2RzcEMy?=
 =?utf-8?B?RDJpbi9MSDFSQ1dONVBHTXhGYUZJMUFhaEduSSs5TnZ3VVJoL1Z1R0tRb1hM?=
 =?utf-8?B?aWlWakpSMTZOTVo5QjRCdVFYejdqaFJrdHl6MUtLVkRYMDN3K01YVS9ydng3?=
 =?utf-8?B?ckJRTzZ6S25rSlE2T1RYSEtwdVh6cUR4Umo4b3JLdHhmcEdNd2F1OGNCT0hW?=
 =?utf-8?B?cXltcjJlUkJzVlBUaXNwTmFGRGU0emNGQ1diQ29KT2NZZk84ajdWUXZzVzRB?=
 =?utf-8?B?VW50aUNaS25qdTFLaGpSR2RkMWw2VlJUdVVyMXhEbC9oczhLdWZ6V29Dc1Jt?=
 =?utf-8?B?c3R4NTVhZjZ0QzNJdXJLcUM1Ny9Wa012V0YyZFYwVjVqVUlqQ1E0cFFKQlBU?=
 =?utf-8?B?bWZtMkJqT244bHYvQmFTTXMwa080ckU0MlhKMUJiMHhMeDBZSkFrYlZYVGxO?=
 =?utf-8?B?dmMweHBGTk44cUdBTWhJRmJDZktPaFl1T3o2K3NLc0FIV0NZd0laNFBVM3RF?=
 =?utf-8?B?ZjJ0ZGhSNkltbHR1WHBHQ2NJZ1ZnT0NVZTlaV01ZTkZRQ0tpM2lVODQvVXAr?=
 =?utf-8?B?bDF1MmcybURwWGxTRlNVZi9vQ2pFNWQ5K0NCOXpQTm01SkVxbmZlRzQ1aHJz?=
 =?utf-8?B?djNiaUNHVUVsYXVLUGN0QmE5MnBPK2xuNnV2ZkZ0TVE5K3RrUkc1ajFoajZM?=
 =?utf-8?B?OVQrV3g5SnlSSHhpZzV6anZtUXUrT1cxVGtTZTdzYy9QWWZ1TTFoYStuck1l?=
 =?utf-8?B?Rzl5Z1dUMTBkOFNsN0haMGYxRE85c01rR3FFbjRtcHdKZG9VcHJ4QjZNRUdh?=
 =?utf-8?B?TWgvQ0tFczRrb0NhZ3BlcnNoRGUxVHZsZ2xuV1ppVFRZeXF2bllETXJLWDBW?=
 =?utf-8?B?djN6SGxxZUZoNHFCcHAxd3YxbHV4MG53MWlhREprSDcxUFZrckZ3T3ZPbGNk?=
 =?utf-8?B?TXFyVjBicW56NDV1SW1KNExEUzFlN1hDNmNjRUZteDBIQTFTODBBU3Q5MGRj?=
 =?utf-8?B?a1Qxc2lhdnA3bXJOMnV0dEx1a0pMaktsVkUweXExc0R0WC90THNqUG5VVHhZ?=
 =?utf-8?B?Z3VhUnZjUlMyQVJJbVhWc1NCbk9FZTExcDI4OVA2MllhaFVTRTdTT0JLTmt0?=
 =?utf-8?B?NjQ4dndQbThTSTNjcnN4YlV2QS9qaStEeFVrS2Z6cklKOG5ZcVRsaHZQSk1Y?=
 =?utf-8?B?NFB6TllXU1Rza29sVFJZa25qNXhmTEwraW9wbEVsazFjUlNDL0lZSFRMOFRN?=
 =?utf-8?B?OEtHWjJXN2hiR3Q1SnFLOU9pb3hTVGZpUWJmVDJtTHA4QWRCc2VKT0hCK2Jk?=
 =?utf-8?B?RmxNUHRyMGlyR0xzWDBCSzJidmxXWjZNY05hTnVzYjBLRHd4QTVZbWJIWUUv?=
 =?utf-8?B?RGpUMWVvd090SnlOV2k2VEhxLzNvSmxSZC9jS3h3MEhONlRkUWMvU2lXeHp3?=
 =?utf-8?B?Yi9WZXlZQjVUNDRRcGkzM1NqY0dPNFVOcmtud1RBTkM4NTBUaXROZ2Z5UkFs?=
 =?utf-8?B?VEx0bjJlSE1WQS9mdmdhSEF1bnFGYUx2ZHdxRHpjNGl0cE53cURVbXFFcEZW?=
 =?utf-8?B?blZLSWg3Sjd0QURYQXh2LysyL1VyTEJKMWhXS0hWTkRVbk5haCtTLzZXK2lk?=
 =?utf-8?B?OWhvTk91RTljcW1rZXdPWGJCdElDSUsrTmxaNTBxMVdyV25Za2pqOEV3OTd1?=
 =?utf-8?B?ay9keEJyejg0RjNSeVdBUW5CVTY2SUdGK0F2bnllTjVyRjh5THJXQTVxS29o?=
 =?utf-8?B?Mm9UNFJ0SEZYRk0vNm56UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0pBMGU5U2JzQWlzRXNzcUsrSUZlUnQ5NjNQdHNjTk4weC9WZWsxd0w3bG5p?=
 =?utf-8?B?VkRnVmFVUDdzTU5uZVNrUGcvbXpiSk9zOXVibmlJdXNxNnpsYXNKSE1mMjZ0?=
 =?utf-8?B?bmFUTEIvdWVNcTVSa1YvUWZORU5RemVYREhNSkFLc3hyL1Z6SDMxSml2MnZY?=
 =?utf-8?B?OUh2VjlYSjhnRTRSVy9EYkFaekF5WVZVOUsxam9rQllSaUV1bU5yM3ZuZ1RD?=
 =?utf-8?B?QWRaT3JzTEpwanRkd01MYUk0Y0JsRkdScGpyVFhYczRiVkFGUFoxVHc1QkNt?=
 =?utf-8?B?TG9OVGgxbEJzZ25aQzhBSnd6bTdYTUEzalZXZFFkTDVZajBFVExkTktJeHp3?=
 =?utf-8?B?VzBCdGN3aUxhQ29ZZk51aTBtOGNFV1UyR0kzd3dXd2dkUkZWU1hYUzFTT2Vx?=
 =?utf-8?B?cGRjNUM0MmYzTitTTlQ0am5KaVNaMktmOHVWL1hiNXUwNXF6RmV3aG1scUly?=
 =?utf-8?B?Rm41SnFoSENJM0Y4MGJ5Yi9jdkdDNUdadXBVRnpqbk0zT2NrdHNVNmhLOGtB?=
 =?utf-8?B?ZkxFTnMvSnVlcnNjTjlyY0VLZ2lvWjZuQVRkc0pYTGU4dGkrOGlSSHFYOXpZ?=
 =?utf-8?B?YjdaNk1kdDVxSFFSc0pkMjBZYWdzM1JNbFc0bUdabkN2OWlRV0ZEZEpCLytY?=
 =?utf-8?B?bjNrYnZrTlhVTFE3TU1yV1BkS0QwemtwbzBHTUkwY0d4M2xXU0FZRmtERDBh?=
 =?utf-8?B?SzBxeUtZNUhCNDl4cmlTZENWd1BhL1VjdnZ1QUpGN2ZHM3M0VHprUDg5bXlz?=
 =?utf-8?B?YWh1UGR3V1ZKaGhETmFEU2dScEpobjlSWVBTbzNEaDBDL2dtUFFIeFQybXVT?=
 =?utf-8?B?TEhFZTRlUjI2OGp2REtwOE5yVHlzYVYrS09uYTdEbmRwQWV3L1pma2hON2lV?=
 =?utf-8?B?MlZNc3F6V2dKdU55eDlCMFUvbmNLZ2ZJU0QxcDJJS21mN2ZwYmE0ZHFZWVVI?=
 =?utf-8?B?Z3g3c1Q4bmdCcjJ3NXZGSFdEdDdnaTZaY3F4R0VIU2YxMks0MmdGcS9LVzVh?=
 =?utf-8?B?bVd5Q0M1aWRzYUlRZ0pYUEdIUDdmRmdyMlVyVml1ZngzWVc4anlIZFZqYTNq?=
 =?utf-8?B?Z1loRS9UMnQ1SUpnbDloNkt2WFllYlhjUnpldTdjRWpjMGtGa3JBekd0TlJK?=
 =?utf-8?B?NHlLUWxoNnNsVzYyeitWUUZXZHJYQlJoYWdodkJqK2lpMlFuYkdxVFNkVlFT?=
 =?utf-8?B?aGdnYTFMLzZySUwyTGZqTkcyRjJaM0FSeGZlN1ErdHhyOS9jQzlOL3pEVFJU?=
 =?utf-8?B?ZmE5WkZHUkZiajE1ZXhzVjhiOGJucDhEMUVwYnkxdXpnRFBwb3RzYTZJOTdj?=
 =?utf-8?B?M2VGbWdyNWNheVVZb05YS2tvM0I0bVlpMFROdm54R01qWEJaY2ZzakNqcFFL?=
 =?utf-8?B?N0FIM3pVZUdBd09hNHZ0OGUyTlFFY0hRNWxlOFp4QTdlaW1VTWFidjF1WjhT?=
 =?utf-8?B?SkVWbXJEOEt0dDVPZTBQMGl2SVhzcFVwVVlsZG1xSWNBNElpMDQvN3BPbEVJ?=
 =?utf-8?B?M04xa1JXUDM0djIxaS85VzlieGN2YzZUTXJVTkpQaUF3bjhDZklialFYWUdO?=
 =?utf-8?B?VlVjVjQvTEhGU0QyWFlnU2Y5cytkZlhSUSt2RHVnYlZJSmxSankrVFdoWkJB?=
 =?utf-8?B?VFBiRGRhcXBPNzdLbndjSkovMWdNNzV2R2w1d1lGNEdDdTVOQ1VhT1BHdnA5?=
 =?utf-8?B?SThjS1J1OFBMR1pCZitvZXRNRmRVMjNYR0FjNXhyUGJyQkhKejJiN0Rwa0ph?=
 =?utf-8?B?Zlord1BvVHRqaktrRXpHS0Iycm1obnVseVNhYXM5S0ZTcXNES3ZWR3lucVFF?=
 =?utf-8?B?bk9qWXNoWTFDOCtSQ0VibFZCVjlpOVVPR1RwTmhkWUFva3JtOE90VzdHQ0o4?=
 =?utf-8?B?dWJYMEp4UmxaOWxDSXVqRjU5eGxpVngyMjN4VFVodTF3YS9BeU83WnFWTm9r?=
 =?utf-8?B?NGNoeW9tbXIxeU53YkJYZmNXME5YZVhwQk1CUnJrTDgxdFI0WUtQYnRWNi9M?=
 =?utf-8?B?Q3FlcmVTRDRURHZLT2JDTnU3NEhPVEoxQUw3UDdPc2pXVzB2OWxrWmpvczZI?=
 =?utf-8?B?aXp2TzNVOTc5QTl2RFowcjYyRmpDREYwZ09MaW45MXJZbm9BQ05WZW5meDBP?=
 =?utf-8?B?SUQyam1oZGRCOVN3UFpzaFNNNWsrNDFtRkIwYnNEazFMYkswaGM0eXBQTXla?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62643f86-5873-4337-7c4b-08dd19c066aa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 08:47:10.7463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYWM0RkOjGGekLPGq4seTXCbveXe691TvXddjoaNXutg5QunLGoYtmY8IJtmKUUOeur/RS5F7N+WKZCiFiqz5bvzDbDGnDd7KnrDvIh1+0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6964
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


On 12/9/2024 5:16 PM, Swati Sharma wrote:
> Upscale/Downscale subtests are added to apply plane scaler and casf
> together.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_sharpness_filter.c | 69 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index 92c816480..06c9cce11 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -48,6 +48,14 @@
>    * SUBTEST: filter-suspend
>    * Description: Verify content adaptive sharpness filter with suspend.
>    * Functionality: casf, suspend
> + *
> + * SUBTEST: filter-scaler-upscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: filter-scaler-downscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
It would be good to add upscale, and downscale in the description .
> + * Functionality: casf, scaling
>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -69,6 +77,9 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>   #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
>   
> +#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
> +		||  (type == TEST_FILTER_DOWNSCALE))
> +
>   enum test_type {
>   	TEST_FILTER_BASIC,
>   	TEST_FILTER_MODIFIERS,
> @@ -79,6 +90,8 @@ enum test_type {
>   	TEST_FILTER_TAP,
>   	TEST_FILTER_DPMS,
>   	TEST_FILTER_SUSPEND,
> +	TEST_FILTER_UPSCALE,
> +	TEST_FILTER_DOWNSCALE,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -169,6 +182,27 @@ static void cleanup_fbs(data_t *data)
>   		igt_remove_fb(data->drm_fd, &data->fb[i]);
>   }
>   
> +static void set_planes(data_t *data, enum test_type type)
> +{
> +	drmModeModeInfo *mode = data->mode;
> +	igt_output_t *output = data->output;
> +
> +	data->plane[1] = igt_output_get_plane(output, 1);
> +	data->plane[2] = igt_output_get_plane(output, 2);

This is not used in these subtests.


Regards,

Ankit


> +
> +	if (type == TEST_FILTER_UPSCALE) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
> +	}
> +}
> +
>   static void cleanup(data_t *data)
>   {
>   	igt_display_reset(&data->display);
> @@ -238,6 +272,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   	else
>   		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
>   
> +	if (SET_PLANES)
> +		set_planes(data, type);
> +
>   	set_filter_strength_on_pipe(data);
>   
>   	if (data->filter_strength != 0)
> @@ -261,6 +298,10 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   	if (type == TEST_FILTER_TOGGLE)
>   		ret |= test_filter_toggle(data);
>   
> +	if (type == TEST_FILTER_DOWNSCALE)
> +		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +			      "Scaling op not supported, cdclk limits might be exceeded.\n");
> +
>   	igt_assert_eq(ret, 0);
>   
>   	cleanup(data);
> @@ -354,6 +395,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			case TEST_FILTER_SUSPEND:
>   				snprintf(name, sizeof(name), "-suspend");
>   				break;
> +			case TEST_FILTER_UPSCALE:
> +				snprintf(name, sizeof(name), "-upscale");
> +				break;
> +			case TEST_FILTER_DOWNSCALE:
> +				snprintf(name, sizeof(name), "-downscale");
> +				break;
>   			default:
>   				igt_assert(0);
>   			}
> @@ -510,6 +557,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
>   	}
>   
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-upscale") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-downscale") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
