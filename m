Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0591CCD8CA7
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 08:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF17F10E18A;
	Tue,  9 Jun 2026 08:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnZeWTk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE9F10E189
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780992677; x=1812528677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a6/FK+EecJt0dpXXu8GC8p8cFgGviizXubIH/bQDkT0=;
 b=HnZeWTk1k9eXMypor8dIvqEDf2nRhc1P7B9WF6ZxAZnKJvjof2jeNBKx
 wZptpIRuMfsa63+GbjYF50e1MPNA7Kglz30bGx2sh5yNBu+cojryXcIUo
 wLfCXtoGwgb5APz9rMU1UGmoPkt+5XVnuEzTj1ltLVyXFfgmw3s+Z55AD
 IFUfCKGtCqQZaU2vTVpbvPXepe34+2X2mLLNSfBaSYSVyBWpatCaB0zSf
 L+P7NaZuai5Mvf6XmwB4CerWJQgPzP8FBGdy0/ozrRBQqj+EgiT5zgqDj
 LzkF0ibKsPQxlhk52FjjnhhQiRdEhaWlKM4wqHCcDavS8pDWNBufsFp0H Q==;
X-CSE-ConnectionGUID: 3aM15tPMS6+srTlKiNWNqw==
X-CSE-MsgGUID: 70Fv96jZSvaetqSxJyqMLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81598201"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81598201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:17 -0700
X-CSE-ConnectionGUID: J/LrtnUbSAGBKAEhxgyE0w==
X-CSE-MsgGUID: XEkDghL1ShqJa/0pP0yGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="239455083"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 01:11:16 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWTYEc2+LABgS9dQWkzBRIfXu8RABwcSnNZPvAwNROZCsbZunYRtkRRUTK+mTrGaOZSef3FXTodqSp9FjEP/BpXAAMb/2zDdq6/gdICQZ7K8m2MUzGYMZeL6C1DcUvgQ8zv3I8P3qJDVQnakOOwkaWgxPGoJN6nrrSZH3rEdkvrEASXMgqhnhhDbatT7MMDuxgOd6/5BOkjabenvI+9W8QtMc6/zVU60F5M9ZurYaO3A2+sHjdnz05FIbp8niwZvOmsvU3LYKAuOVWJ6tUzNNPHsPR49Ies000fj/c82KZDmYJMIaQO6A1eLEHEPuz0QyBDOCDcw8bdxa6vUS6il2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGqjBE82ecKnMfJ5tu5r1udgF4KR5ehB0p3H7MCiZXc=;
 b=Rquf2BqHiMqOiQ/wanKsjK8sQmg1oGfSoyjxoS5/pTzsL9n1bKNP5+sRtueKTOgfunFhU5gqJjxUGJVGGxKNG9mJNeisMsiCIxPnvWVPrtRmJUHn1pSJIC3h23MX/4DzpbDokwIQKBcvfKwpjmai50Cuq4mabv+6yX2XVq5qDQfcTGil4i0YUVigFjEtGwwy5ygr4MGa3iTg9ewaJ/lhhYT9jPzuIi2FfX7zIT7XOy1M9RWn6z7sR7EvxZ64rMK+rIl02G1NdN2CixhKvV0YlSQmNpJEX77qphhOoHtfs9duLleHdL4Z8EL/tnP26Oo5HI4d0XXsV10qCFesYdF20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:11:09 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:11:09 +0000
Message-ID: <02a2c68a-3c0f-471f-ad89-66ca85652587@intel.com>
Date: Tue, 9 Jun 2026 10:11:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/xe: Arm SR-IOV exit cleanup with callback
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
 <20260602141609.3941750-6-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260602141609.3941750-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2d328c-4fdd-47c4-b7b6-08dec5fea9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 2zij7H+LPo5oAJtV3J3jQLd4hhZfKG5b5nKW5asRXUrYMrh9/mRewe/XddJaYWxlHwcimpKPw0y33X4svRuhRDJr81JSXeBA41sQ0RWvc/AsiG6bXistqjkICzI2QbRKO3eFg28ISYvuoBxpHq+0fbwLlnrLKN88C4wKheSE8LjpwZWxPZx64VlXx88vTfWaTZZ3hIuc+CuWV6UwVoZc0TBqqPoUhfox2XHgtScC2BiKxE0mszLgKa4UYZHFC6XUYkDOL2Hy+Um8ZvLSWptr/h8ij3jr+3Ri0XcB5BpUhtaTVEw1kDEVGYt6SEB4lXnD7UDI64i/IJSf3/Kyba1ygA5n6OTeg6L1lCqgPyDZRmtCFcy1n6k91wW50nIzQDRfbl3I6Oan9MAB9Ukv19gCkdj+bk6PnMF32ehGOmeOiMalgK79m6ilI7Pu2tg+jw3otXX/9s/sZ2uH8tkvg9LrUiydY3jp2+quAu9NH9Sez0mOlf5XKX0jP4ltHxQhcxni6ZMUXXgiVgABzrigzhabbJqLjcd3xE3/JYfOVaaleNn5uFa89FXZnGXmiSrfWHyJONzIhkMug5A4O+gQG0vhSvaJ9QKtaEJpDJIdn6bNvNZKtoo8ZeI93xXfJlJsheAy4erOiuhmigzNSH4YQS5GL08//O7BS8XopmIOmhL0oMSlnn0uIKGofBo23VIGg1No
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWlHS2dxak5lK3VuZFkxeUVQOXFIb2J1VXJuZE1leWgvSUt3NEM5UTRzeEtt?=
 =?utf-8?B?MExRd1d3S2JNR0d0Y1RUaDJJL01OYUk1aFRJRmgxQmY4dGVEZC91US92T1Rj?=
 =?utf-8?B?TlBtdEg0WCtza001M1FOd1BGUWZtU3QyM0VleVV6SHBVdk14ZVlHTy80SVpW?=
 =?utf-8?B?QTdybHBKeXV4V1p0MHhHcUZ5cE9CcjU5RDlhcWpOWEwwenkzSzN4R3hOWlp3?=
 =?utf-8?B?RFBiSDVETWVmWm00NS9VNHZzRmdRZkt2L1N3amxGZU5BaFZlVDJhRXlCWmRa?=
 =?utf-8?B?OTJvMDZ6bXVXaVNWdkozbytyVmFlNFFUdU5jOGlDMXFZYXdPSFhaMlI2eUdM?=
 =?utf-8?B?WVZnZjk2b3pST0RsNTBzVGlsdCsrdklzVk5JaFlpZ2xRSk5MektmaE9tcWFs?=
 =?utf-8?B?UUdVR3V3ZjY2N3BxZ1JIMjFxQk9WaXVoVi9Ed1ZvUXM4bnFnY1V2T0hyZnVp?=
 =?utf-8?B?aVFDK2NxQUNzTXB4TVJsYU1tRnJYNkdDUkEvc1BYeDZRTHBrcFVmY05PTlRR?=
 =?utf-8?B?S2syalQ2eVFNY04vRlVmWXR6bmJSTzQyaFZCUmxCV0ZXcmFQVU4yMFMvcUxZ?=
 =?utf-8?B?MldXRWtDckFFS0N5WmtSa0YxZmIvUnNsZmJIbkswUVRDbFRtNTlKUGxvTFhI?=
 =?utf-8?B?WUxuakUrcy8rckFzUVJBK0NhN25xSnJ0SnA1WFB0bS80NXNQOHltQ2xtR2Fx?=
 =?utf-8?B?UFRkVDZ2eXJxRmtyVEQ0VU85ZnFLYlQwa05QaXRYUHJuVE5DeGdXeThvVy9J?=
 =?utf-8?B?aGZBMmwvMXhFdThxOHpueFJ6VXBLYXRqSE85TGFrL1dzUnFubm9tT3liY1Ez?=
 =?utf-8?B?VHcrRjZOd212eXE1M0Vaa3ZYZ2Qva2xFSDh1VGo0Rm5zZUx4REdnWGQ0MFda?=
 =?utf-8?B?dG1WdFNwWmh5czdidHY4d3hMQkh2OXNWaWtTbVdPVDRTcDBjRUg1RmtaL0xQ?=
 =?utf-8?B?YzdZa1NEVUkrY2NQOVp1RXArbHlEOG5zRk9kR1lQZVZ3MGg1RXM5ZnhVTUVz?=
 =?utf-8?B?Z3oyR1ZmaTZYTzNaZU1FaHJtZ0xwYy9LN1ZYQjdFVkMycGhua2p1Sm9pcEFH?=
 =?utf-8?B?UE05WWJZVUEybFF3VXA0OEZGaTNyT2RUSWNDdWNkQVg4ZXlERGdSdXlTcEJP?=
 =?utf-8?B?aU5Dc2Z5WkNxSWFiV01WdUVvUm5ib0hlSllCWGdkTy9kQmIzbjBNOVBySDlz?=
 =?utf-8?B?aERHeGRtUzhRS3QxSDhnVDBnbWxSK1lPc254TU05RE9rK2lyc1ErN1B5S1B1?=
 =?utf-8?B?Mnk3dzFIRUVFWUdydXJMN3FKREduMnJDNnprNzQwMDJSbXNzdmRwb0pMMkgw?=
 =?utf-8?B?SlN0RjFYUFpkREZQMVNrNWRGdnRjNExBc0lKWlJnVGpZTm5RMXk0Zk82MW5S?=
 =?utf-8?B?Rjd4bGgrWTNaSWozWENUUDJ6OTFBd2VtamlRZlFPK3pHb3lkR0FMZDNOUVZJ?=
 =?utf-8?B?cjAxZkMvTXlJYyt0cDBxZmQwTEw5UUJmSVpWUGNJMHdiUmhWTldXU0lBRjZG?=
 =?utf-8?B?Z2s1T1F3UlNnSC9uZ0R5VlJLaWNYNzdVbnppLzB5SS82emxGTW56VmpFT2h6?=
 =?utf-8?B?NSsvZ3YxcEdKMmQxRXdFb0QveVdUcHhReFdvSnpmL2ROcnZEU1h6dHNTTk5Y?=
 =?utf-8?B?RGZOSDl0ekEvWmF4R1ZUUXFYZTkxYUkvR05hbk9tb2I2Zkg2WGRqNUJtWHRW?=
 =?utf-8?B?M2JBTUxzMlYwSWQ5WTdPQ3FJQ2VNdmlmZEo4VWtndlNlbEduaEJlcUZsQmhQ?=
 =?utf-8?B?QStxZVBTdGh0S3h6dk5VeTJwYndEWXJOMjBXb1pJbVZwSVk0RUhxdDUrSDBS?=
 =?utf-8?B?L3RXMW1uS1RiMWREcGVUQ1RGQ2VVM2hveHpXT25ET2FFUElaTVBEaHhlb1Rw?=
 =?utf-8?B?cWxyMkNCdHM5eVZZZ3phaDZtQ0piMkFZc3lpMnVWZ3E2eTZ6ZzZGVFFjZTlX?=
 =?utf-8?B?K0JvSFZRYWRieVFmZDdWdG9ZWCt4TjluNzRUWWhnN2Y4dStzYVl4WHhTYTVL?=
 =?utf-8?B?bFJmbzR4anZQMWV6S3pIWFVaNE9PUzVWSmdJYjV4MFMzRTNtejc3VHFsVFNa?=
 =?utf-8?B?SXZaZEhQVG94Z1JucW8vRlV6T1JGZDRVd1ZKaDJudlRCMDkzNGY4QW1zbzF2?=
 =?utf-8?B?VEI2UzVLcU96V2hwVndzdURWVDFuRGVFWGtMZ2VIOFltdTZkeVNMZkF5RnRD?=
 =?utf-8?B?QnkxTHN0bElXN0dhZWIwbWthMUFhZUl3dFVUWll5cEJsazk4TkQxUWdtcjlM?=
 =?utf-8?B?aHhTMktTbUNzVGUvczc5dkIyMEE0N01ySHZ5YzVFWkZUUU5tei9lT3VGaTFi?=
 =?utf-8?B?Tm93cjQydjRkYittTVFtUTFuMjlnKzhncmhnTVl4NTdUZ1FEczgrUT09?=
X-Exchange-RoutingPolicyChecked: Np/J+lHxhMEdmQe0sOY1A/+/ms0zWe9VjKv8DPoTK6Z7uUbY7Q+oTRLn6Vuix1a+UPMYxim2Aegfb6h1okVGqfJPxKOPau7ECSzoJBRMlfAokeSeote46P55F48NVtLh4bE9QhP0OMXgqPfRvOn2uO45r1b/RhjVsDaLcSUrV0PlHmqIuEirlFHVaIfxuec5tENjqxbeS7p645B1/4eB3JN4CmtxZr+Gnx2bQvbNETt81zmVspDV+1mIZkSZ2ehOBK1YSRTlMgumnzl6xO3tG/xRJI+WMLQNY7r/sgD1/WBIOU4/YtREvZZ9WaAwputPq82kH5GeMjETlwFhFUKBHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2d328c-4fdd-47c4-b7b6-08dec5fea9b4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:09.3593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dzry4IsCP2IVy2HB02A2D6ucPHXVx0AfL3NYGs5JdodP7lxEzFbiEAklWg+zx4SjKGRMvKQeEkt37zNgAVZt2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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


On 6/2/2026 16:16, Marcin Bernatowicz wrote:
> Install SR-IOV exit handler in xe_pmu, xe_sriov_admin, and
> xe_sriov_scheduling.
>
> Use xe_sriov_admin_exit_cleanup_restore_defaults() as exit callback to
> restore Xe SR-IOV admin scheduling defaults. Clear handler after explicit
> teardown succeeds.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_pmu.c              | 4 ++++
>   tests/intel/xe_sriov_admin.c      | 4 ++++
>   tests/intel/xe_sriov_scheduling.c | 4 ++++
>   3 files changed, 12 insertions(+)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index fb4b871e7..ec0266577 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -994,6 +994,9 @@ static unsigned int enable_and_provision_vfs(int fd)
>   	igt_require(xe_sriov_admin_is_present(fd));
>   	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
>   	xe_sriov_require_default_scheduling_attributes(fd);
> +	igt_sriov_install_exit_handler(fd, true,
> +				       xe_sriov_admin_exit_cleanup_restore_defaults,
> +				       NULL);
>   	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>   
>   	/* Enable VF's */
> @@ -1035,6 +1038,7 @@ static void unprovision_and_disable_vfs(int fd)
>   
>   	igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(fd),
>   		       "Failed to restore sriov_drivers_autoprobe value\n");
> +	igt_sriov_clear_exit_handler();
>   }
>   
>   static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
> diff --git a/tests/intel/xe_sriov_admin.c b/tests/intel/xe_sriov_admin.c
> index 5c7f5d621..344a141b7 100644
> --- a/tests/intel/xe_sriov_admin.c
> +++ b/tests/intel/xe_sriov_admin.c
> @@ -346,6 +346,9 @@ int igt_main()
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		igt_require(xe_sriov_admin_is_present(pf_fd));
> +		igt_sriov_install_exit_handler(pf_fd, false,
> +					       xe_sriov_admin_exit_cleanup_restore_defaults,
> +					       NULL);
>   		total_vfs = igt_sriov_get_total_vfs(pf_fd);
>   	}
>   
> @@ -429,6 +432,7 @@ int igt_main()
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
>   			       "Failed to disable VF(s)");
>   		igt_abort_on_f(ret, "Failed to restore default profile values\n");
> +		igt_sriov_clear_exit_handler();
>   		drm_close_driver(pf_fd);
>   	}
>   }
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 4228eea2d..bd0ae95fa 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -908,6 +908,9 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		igt_require(xe_sriov_admin_is_present(pf_fd));
> +		igt_sriov_install_exit_handler(pf_fd, true,
> +					       xe_sriov_admin_exit_cleanup_restore_defaults,
> +					       NULL);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>   		xe_sriov_require_default_scheduling_attributes(pf_fd);
>   	}
> @@ -952,6 +955,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
>   		igt_abort_on_f(ret,
>   			       "Failed to restore scheduling params\n");
> +		igt_sriov_clear_exit_handler();
>   		drm_close_driver(pf_fd);
>   	}
>   }
