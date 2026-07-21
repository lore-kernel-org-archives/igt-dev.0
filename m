Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34301C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 03:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE7C10E284;
	Tue, 21 Jul 2026 03:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGf+gSd7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03AE89048
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 03:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784605159; x=1816141159;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7sgKqruh9rBt5mQ5e31Ku811KpgHvtUepYa4D39Rh1A=;
 b=HGf+gSd7AbNCl4DXn+Z6P0vA/jyjR3a1wzP6ozYLrSjfd1sKjc/C1TGS
 /a6hOIfd9etMyfjWRtwGti00CJvDthwELaUioeQlLs4tjeJJEI3heBNwS
 wN5XBm/89qDU10jReGLx1w+VShe0cFTeLjBAS0sUUrO5vBymj2/AAXRjO
 /ytIOJzb/VlfmB7S9UQHo133iWML+l94mEOaLtLKTA2isOJxn48fEzoA3
 d3BYXFZ9dZjpov2zXv/4wTQaO9xDRx4qFD1cEIWf1LEnhhXIosddk8Qt7
 ffc4Fwh582ynVLb6N1Nl4ljiexsrYX+P1qca0+cS8J4cn+bLaVMw+m9Uu g==;
X-CSE-ConnectionGUID: LgiwZlNfTzqdWupIp7pOMQ==
X-CSE-MsgGUID: /yKPcuDpSWSahNAXgF8WSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85214099"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85214099"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:39:19 -0700
X-CSE-ConnectionGUID: +cX1iG2vTymuZUaJhYjn1g==
X-CSE-MsgGUID: CKuNPSMbRqO4PkY56KLKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="261197354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:39:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 20:39:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 20:39:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 20:39:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDbqWyHumK0YOEJOB1Pu/o6R5dXMpYofz5+s9nKt2YyUanImO7MbD3Htb53+EQ10FlBZDnORSya7LbKHHKaJzecL93zbWK02IPUVVmMQHSo1SSkv5Kexs/kbigOQ1e5BG5/HzgZq8EOfeXKKkT0+P2LiuCeKX2NdZ8PduJ06K9NyPeW27ZCpqPpwB0K3WY8rrGzB3f+a9pVm8bIJGHyhE7a6+dV6k0g6XO1nzC5mVSuZwna4ClcrYW794wg38wtC42P1wY42kogJTLWnk0Trro/GFgePFkLLnIP9WU6lBKBL2nYjnsDedRxjSJk9V0M3Np1wfwddhdTJSThRyn5FEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HutyuJlY9XTbrUQ+ik0rWQKu0idXmOh7u9a+mVXBnQc=;
 b=wX9xzZPsRNjKQXMqqG0Dc13nx3TsXKBZgecgbpuB8A/xNEXQ4KUWaK2pYnScBtgSgPKAEFa8aXx37cEEd84EwhJE5VtQsGXNbME7IoLT8kKPggh3guYTN6jpsc2BXmYnAsG5cexXyX7pLBD2BDOSQ/1yQ8+h4EfDqZ7LoHSCYXHOn/vHx03tTbLFLvlM7vq9zQThyBpk15tsO5v+9G6vibg/The17yx3HFIYJ3K/SUKvN7fQqwDEaC3/ROPE+fR0jaqYWPsJN6xoo9RT6BPQHRwIcSP/WJeC6yPSUFmuN0CRvVf0CLfLn2PjLADNxJ2j3bueO8naUG9yS6Jt+4imTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 03:39:11 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:39:11 +0000
Message-ID: <fe1c6b9e-cbb1-4df0-8854-5fa31ac56a25@intel.com>
Date: Tue, 21 Jul 2026 09:09:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/xe-perf/xe-perf-recorder: don't write OA
 report multiple times
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260721003252.2224870-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260721003252.2224870-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::6) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe5b907-6824-4266-7500-08dee6d9a050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 84HljhTFaTuBrmPsYo8bP6e9D+0URbRCPmxAlCeaZPJJ0ZdAm0h8703ylFWF9X6lHQygO0lOqyvBACbArHi9/Dzt1sCgEodtHfra4pejmEbuLdTTX36B45hJysYLWDcjSimEVyzay4MnYqHbIgx6heDlG/PrB0TAQDgEuWR7grePyOzHbvJ8QNsBEbH9SvRQNB70y4skNpPRe4Qt7GMNywffZQcTVjorcu7SwO7rFxQTTxlrUa+pFxpi9TYq+Jp9Z5ZAkKEoFoagL+iYM0gfwV4n0Mb2+xWHvkl8Nyi8G9wEaEDJOCV+2J6ARMvwnrej23h1gLcnsVyOZSlxumOg5cF2W496PPwxh7m6Xbte9Y20rZncN4pUp2OSsg2qbC5hcYPi6GJvMuuxpk1jEZKD+Gr7+1LphU0AUSrYWyLESXJqrnwRmC7uOOiq1Glif2z3Ow+rasIzu7bZqEEU5viiCIO0zwDh3wb6AGdqGu7gz7b/3cL4b0lPLhbWOUUJs4rk+qlLwh0thm4BiqMlf/VqnbgoYvZ5hRsPaEDs4SbkKBcCVZwD5wdR5HrSB+f9Fq8PGp/Ncq/SxZ6ElZh7ghNMOQQHpFbGKChu7uDJcQ8qD81oxPrVL/oB/SHnO4/5J5xwdbcKEmTKxuM8QqKFL5xIXlB77/VtsWgCKb0moWMO4UY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRtY0Fqb3RicVBweWVWWmI4dzY0bDRqYkhEdm5PVjNZV0VUdUJwNHRaVVlI?=
 =?utf-8?B?TkN6MHJVWlpUeEExbDJOOGpDdlNVN2JqYVByTmxndEc0bXZxK25Fclg0MFBV?=
 =?utf-8?B?UHZMeWVtbTZFTCtxVnM0K25pVmxzcnpQYXg3NVg2TlMweVZHNmhjcG1ucjlU?=
 =?utf-8?B?cGVSS1o1bTlQL2tKYi9HWmdqcVR1OU9SWDRiRm1CNzRLaHh2V2k2dy9PWkkz?=
 =?utf-8?B?RGtVeDdhblJhZkZIZzRidWxYT2lQUjlLS1RqQzZlTkt4M0ZYZm9VaVRkZ2x4?=
 =?utf-8?B?aGQrZHNUMWNYekVqU2s1Zmo4NXlwejhyOGJUek9UbFA5aTEzSUFTMVlIQ1Zs?=
 =?utf-8?B?amNZOFVrTUp4MC9wa0NXREdHUEhKQXdvVjJHbW56S201UGdDYTFEblJQTlk5?=
 =?utf-8?B?a2s4a3pKckwxM2lqOXRCdEtrOTFWZjJmWlEvY1htakFhelIvNmJubmNRM3hE?=
 =?utf-8?B?SURHc1RjTGx2MFZTbURWZEtKaHNvQVB0S2NjQ2NsTFJYbmQwMFZHc0pOZzl2?=
 =?utf-8?B?MHkzYUJjUnRodWloMFJyK0V0d2JsVmlabS9lUm9McFRWQm50aUpwSkJHTkJj?=
 =?utf-8?B?OXdGdjFWRUNrSGlXbnVnU0tZa2wrSjlqYXZmQXZXV3JoZ0FpbG1aZmlOcFRV?=
 =?utf-8?B?bENtZFRIc09ITnN5VXE3RUNCTHhIbldNdFpGdzlPOUd4bjFtdlRkQUJxNmtx?=
 =?utf-8?B?NjdiOUE5S1lVL2sraGlCNVQzMUVjTWJjLzVQeEZtemFlQTlJbFlaOTBSd0Zi?=
 =?utf-8?B?dFNwR0lnVkUzSzZJajRJT2lLNDlDa2YxVmx2eVpaWndvdmtpRGZVekpqa203?=
 =?utf-8?B?bkFnNlNYb01zTDJvTllMdEZMN0ozdFZWQXBXVFdPcDYwLytyUlZwem1pOEE5?=
 =?utf-8?B?S0xUS0RESFg5eDk3VjIyTDBhRU9GZ1FUZU9ZWVNMelRBUEwwV1lJTStiR1Uy?=
 =?utf-8?B?L0ZCTWs4aWhVc2VsckMvMHMwNXVOdHlJSmNzRG9VelFDQ0dOb1lwZGxIWXlM?=
 =?utf-8?B?YlVPeXA5bTZpQTJOTjVGZm40bzZNMDFsQTIxckFRTEg5aExqdUhLTnNINXVN?=
 =?utf-8?B?aTBJSHdLUUduMTZXNTFiNXFzQThuOER4aXczY3IxZmI4RjFteUprTkErZXVB?=
 =?utf-8?B?Z1gzbUFKSy9xcDVVQ0VPc1ZyaENqVlRZN3pwQTAweFVOMFdaYklkS2xXUHBG?=
 =?utf-8?B?NzU4RG9jblRFajVwY1gwTG5PZGNSQllGNEdvM3B3VFRNZ0F0Z0hUeVZuVUNS?=
 =?utf-8?B?TTl2V245MmhCcWZJY0lyT3FwN003YXpId0tZc25pNzE4M0JVdDFWWTV1enAw?=
 =?utf-8?B?Mm1wNjBZV1I5ZmFIWWhTQzRnTndQV2lrbEV4Sml0RW1zMUo4RUIvTGtjbEEz?=
 =?utf-8?B?NVVlVy9XRFZSMEJOU0R1a2J4dlUrMHNobFZPekQ3L2ZyME5uMXVxQWdRWmZu?=
 =?utf-8?B?YkxMWDArb2RxVy9lY25qd1ZxTzhKaFZXUVliYW54eittRjRlbVVpTWxOOVJ6?=
 =?utf-8?B?KzFiUUZQaGdmcU5hMWJvUVd6cjZZSkFxSURmWDJydXNGa1cvNms2cEFCM3ZR?=
 =?utf-8?B?NklWOE5WR0lMV2pRZWh5R0FBSDJPc2hhYSt0eG11MlhjTk9YV2Y2K3N0Ujhx?=
 =?utf-8?B?a0pDdFZ4ZXhRU3FaVE12ck9UWHZLam5QVGZYYUVIUitiNlpLZ203a3FXMzlF?=
 =?utf-8?B?bm9JOThGNUpyREx0bk0vVi9KaDVMempWZFhsZWhRWERuejZxSVZOS2o4NlBS?=
 =?utf-8?B?T2FCQUJYOU1ac0R4aldpY3RrVlRZbmtOMDZ2RVphV3BxUFVJcm1ZMk15cWh1?=
 =?utf-8?B?K0haMGNyVnB2dG9RcUk0eFNOQnpydFo5eU9kVFdVUC9zTUxPOUhIYW8zeDI1?=
 =?utf-8?B?YVV5VklDbUJxMWMycWZtdzI4MFRjV1NaZWJabS9mR0UyeTZsdDJ5UzJhLzkx?=
 =?utf-8?B?UnNoazlrQ0pOVFJVWXhROFpkUEhnVzN4RW9TeEJ6UWNoUE9Yd2JnSG9BT08w?=
 =?utf-8?B?dEhhTVBBVDgrRU5NQkV6OWhBRzBFRE56S3BDaWtNSVYyczEySVhLK3RqQXlT?=
 =?utf-8?B?RVE1VllHTkh0SW1pQU4wcFJRR0ZFYUdkZ05PZldqNCtLcDg0Q1ZZWDYxT0xL?=
 =?utf-8?B?THhwTFE2S1NUWEtBRTRrSzg0dTR3cUxjTDZMWG1Va3Z3UXQ5ci9aelVDN0c4?=
 =?utf-8?B?ak9rcU1jZW1OeVBzMG5wc3lNT2tnK2MwejFGdktqYWtvT2VUQ0ZDK3J0aFEr?=
 =?utf-8?B?eTB2WjhRZ2dNanRtSzlUYzBCNkk0U2NLT2VwWm82b21YSU1NYTM0S200bTBX?=
 =?utf-8?B?c1JMTEMrZkErT2Q4Mzl3UnFuMEdlUVkvYS9ydlBucHFWM1ZWVXJRWU10WmhR?=
 =?utf-8?Q?zXIZ1J50nVd2Ez+c=3D?=
X-Exchange-RoutingPolicyChecked: nJ3e+tyWNDsuxLeV+TKC4SHsZKEas0Y8TAHQzXqfGN4Kr0EE5dHOdgo6VJHThXuR09ngTdt8RonNQSRBxgngfJQusN3c0jwlpt2qhixpPVfgrNEnb9z52hUAQunxaWxPlwvfxqTVObK82xfzHahnoxnLoWOuN8uePQu1pTkhfazKKQ3Wvm1/ahR6BWKtFQV+wXjplBmcDS97P7tJrrpo8HCPKget+kK9tduyMyR3s9rOOiB61Ef4cAmXcq0z7ZNY5u63Umtb86g2n5IKCXiduRHGy3wSmheK/wj+z3aCnOxtUVwH0W3hsF3CNYLaCwIcdsOnJCSVGxp05sZLaVXwvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe5b907-6824-4266-7500-08dee6d9a050
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:39:10.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v21p6MX8XMDueFadiGj87mHfpITu3MMnOk/XcFZGpdnmBBxrukHX1lIm68GmQlDVt/Wku/Lfo4f43OfwdnAO/fBV3I+WbuopNTPvZhJuVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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


On 7/21/2026 6:02, Ashutosh Dixit wrote:
> Fix bug because of which a single report is written multiple times (rather
> than writing multiple reports).
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Patch seems correct, but since it's a bug fix, should we also include 
the <sha> commit-details in the commit message as a "Fixes <sha> 
commit-details..."?

That's your call, but other than that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   tools/xe-perf/xe_perf_recorder.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
> index f200fe9c9b..61c3f6945c 100644
> --- a/tools/xe-perf/xe_perf_recorder.c
> +++ b/tools/xe-perf/xe_perf_recorder.c
> @@ -587,6 +587,8 @@ static bool write_stream_data(struct recording_context *ctx,
>   
>   		if (fwrite(data, format_size, 1, output) != 1)
>   			return false;
> +
> +		data += format_size;
>   	}
>   
>   	return true;

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

