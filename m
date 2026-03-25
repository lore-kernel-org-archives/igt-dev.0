Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB1AFEA83E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 09:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09E410E1C7;
	Wed, 25 Mar 2026 09:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vd/sjxZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5096B10E1C7
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774432531; x=1805968531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zUBBwg4U/bOyPRKqym9awDpTtitsF0f/AI3VjvlxFbI=;
 b=Vd/sjxZLLFldDxClPzQ12WuD9T3L/M6xI6mX7zEx+LAAe0ANaSYXU9LW
 dTfgongbOuUzjTEngKp+Fi1ZzgK5Ivgts6EKbbHZrW0dPh1OUf+RomUW1
 hUePbFRa2JIyHhAg+AWeuJ/W51MCmB0gRTv4szH7A06P0AUbugDqrHb1T
 kjBqT2k7IOnSDcda0Hxjt7xxF1pjNjjJgjWaPIq80GkJhkVBFWEpXLGoc
 RFCLPdOuIdu4oo/mjt3IQaAnw3uXAPejm8eZ0LVjedgagfXHaFkEmsGp2
 f4XHlPjjdFpwk1/ILxgGwJMob0S1l+90Nt4l/pHuf0XfGYTtTbPTFtb0W w==;
X-CSE-ConnectionGUID: xERwkJSDSy+NLY/XY1lZkw==
X-CSE-MsgGUID: caAidZV4Qhm7VyWIXB75HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78063436"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="78063436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:55:29 -0700
X-CSE-ConnectionGUID: L1ST+OZ0SjadsIpAsMzGDw==
X-CSE-MsgGUID: seUekgCMRmWKWCE8wcJMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="220222377"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:55:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 02:55:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 02:55:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 02:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKWAUxF6alfYT92FuE3CDewQpgpVFifQgNAnCx0408YJTu1ObY0WDSN5KsJXYCcTHhwaozIZMJgveFWna5AVDT/Gwxz5ROMaTDbURBAXk6Er6v12o0Ba7d/y/9KwVUh6VZhGTkwcV38zmxjAFEpgSo0+7sf7HV6jTqSy/ESYg6Pc4CzQ4g0s+KBKFrhrPZYltr1uWryFXlDFIiYWbe7NyfCGHa6zeNibHJKZTjWEWql44omaOkaiNEZSt482vbH9q23uJgjRn8hasNgefKc+S0/kOfaicagFGWGT/Jy0C6gRm2UOMz2r0MTC8l6Da23aPGLu4CSTQuImYX7uZraTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QMjTsJRugZcYHpi7rzMU5AmmlV1/1NZLvAzm6EzfnM=;
 b=SwsDmewmxzr1nFio2HEpkCnDGt3cNbkSOfz2G8GGK3Vm46/5hbmpZVvYZ4V31jsG6w2y/cGg440ooyl/zZ/JrLj7ztVYAL4kyVGOGFyXX/zAfuDCLgScOJZgE/moYUQLvzhSY2Mv7is76LF1XMkGOk7kKJfBzgjB39G+nPr2JwRdg3Y5EjzRXbRW7EXGQx+ysQis95FvDk/I52ospNHcKDBjkOKCRKnpNrigf2ZiHLWIAiSN+Z/LKdA/sq+69+DCKDYhmfr0Z4Ne/1kbgm8qU+N6lnYNdLI/N91LXE4b2T24mYN0AvRWvfiGkz8E5+y9ucdSRbVYBF3wrkRmc8TKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 09:55:20 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 09:55:20 +0000
Message-ID: <aa0c4831-2f94-4d2c-ad11-4a22c9a656bb@intel.com>
Date: Wed, 25 Mar 2026 15:25:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix stale mode
 pointer in joiner bypass
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260323141101.2657652-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260323141101.2657652-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0195.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 447d23ca-8060-4470-11c7-08de8a549fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 0Q9g9U6BvgMgahzh8TOuThw6uRSQ33snvpEr/UBK0I6Sff93VRlFNzUPQuy1iDBLXmBVdmp7ZM/WUkHRAFxmlBYiOGrHizbIuPsZTnbPYnEJXwfVzMc6m4tjGY+B+UUNeghjhzJU8HVPlx5VNBSIhgLJZc0j2Gh9fv730PCuPSYuowOpUgxBYBbYrGMDYWdUmvk8Bv0ZDmVdvyspeQ6TQz/k1PJqMxvEN/qxsTIKLGhghodf+GahNwLy4A2TngaCg/XqOsbYR490q2doR/2j5UMqvxGthsyy4hhNXGVNBoDjWhFtkaO88H2nyA2XY6SfXKZgcygvRnvPoN9roBJxC9ndOd0uuMWwLA02tPSPY/u8Wa2eImaQ0LdJ9XVbRDvhFdkAnGjU24eruDkLfJEuwXWR+JyexwetIZNOnxm5l1kaDVvrB+c4J0LtYTvuwz1/bTzmP77k4DKZKjxZYb37S8HqRQdUqmw30oNRw6Zp/OTSiAs8WTsST3qSF6B+fD+L+9BeNEaCLWKc7fntR3+cmOlp+lcNbgXkF5urBP0LelQXJ0FwIEW/1M/gEUpjaEBfDYbqpbJGfmQQP6CtzJjgB4hYHkktB/4sn9r1cF+dBqDeAQuGlU08RGS4EYpRWeeQ/ti0LYKV7ME2WUfVhmVvbpHCca7wxie41s6hjBgBIXvwT4iDvUcehxhLMNPpL675
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0FmVzVzQnRUcUpueG0yazNYMFlDVFkrUys2Q1ZQeUtsL0lkQVArZGw4VDlF?=
 =?utf-8?B?YjlLMVV1SCtLa3VmZk5oWlZZQzFHK3NKc3BQa05yNUxlNUxadmhxYnNzcFZn?=
 =?utf-8?B?NzJnWnpBbU1pNzZsT0JocjF1d3RyQVBwMEpmc1M2VGpYajVnTmExZzhEVEpY?=
 =?utf-8?B?WS9DU2w2MHNuYnAwZzJpcmprc0lycmNmaUx3TFdYMG1XWWVWL0tVZklyb0ZC?=
 =?utf-8?B?M0dyMlJIRVhlUnh1YmRnRjRMT240SS9Da1FGQmZSOG5ERU0vcmE0SDIzNERE?=
 =?utf-8?B?ZmlXK1J1TFJxWW9Vam9wYjBuV3FLSkhVVC9XZ1RkRDZGMXluZmpGY1ZrNHgw?=
 =?utf-8?B?blBaT0E5cVZCQkZRenlEYy9HODZIcG9MRXl3N2gxSUZrTGhmUUFpTm53aEpM?=
 =?utf-8?B?S2Y2WkVMSHdxdWNLWkJwQWRnR3dUbUlyd3dnVHFmUHdvT0dtRk5LbEN0YWFJ?=
 =?utf-8?B?Z3RZTDB0eWFzOXd2Sm9yS1Y4Z29hUGoydDRtTmVVR0kzVlBKK2o3WEVteU9I?=
 =?utf-8?B?UWZLMFovQUVOMzI0dHFLM2RyaUFLVHEzQzkyaFNyMVVaTjFKR08vQjQzVHUy?=
 =?utf-8?B?STFjNjVQNlo3SlNZWGZ1bWwrUWd1NkR2WFNHcnplTldQb293Vng3aHVNV1kz?=
 =?utf-8?B?TTduc3JlaDNvN05zZy80K2M5dE90S0tyTVdMczZrOFFUZUxaMDV5c3c2L2c3?=
 =?utf-8?B?NkNuRU56c0ZxMFpraG1rYmtCVEFrY0tGL1ZFd0I2dVIrZktDQkt0cVFmbmZp?=
 =?utf-8?B?clpyY0ExT203TnVIc1FCaTZMYW9jVzVHenNqcmpSckw5TnFFU04xbzZ4eU9h?=
 =?utf-8?B?cFlzTVNZOXFKKzFkYk5aWmt4eUplYXFpQ0JyWWpiWWhoaTk4RHpRSkwxNkla?=
 =?utf-8?B?KzNDeExUa2pSU1J2TktubXoxVzNLeTAwdUkyQXZPc2l4Z1ZQMFMzTjJIOUFR?=
 =?utf-8?B?azNoNnlmQXA0bnJqOStvTm5FT0NEM2xaZVAyU1FjV3dobDVSbzN3cWdRc1Qy?=
 =?utf-8?B?VTBTNERyalFsSjZSVU1abmlyS2JxaUpaOGxtNDE4OUY2N0ozYkRHNXRPQ2Ev?=
 =?utf-8?B?dlBQRXpLVjdIQ3JJWVUxbWlNNytIVlNCSk1EK2Ztak11WnlzaG1KTk8rMnN1?=
 =?utf-8?B?d3hqN2xMbldOQ1ZSNnh4SHpzODZHc1RySndVd0g1eXNET29uazlRRTJ3eHJD?=
 =?utf-8?B?VUFBbko4YzA1Q2RiaGRNRWhreTRLWWJ5TXBBa0FGWTJXcTZ2UXdOMG1MYmMr?=
 =?utf-8?B?VUdWbG90a3lGb3pEN2RjNi9yMzM0QTZMdktWbE44a2hUcXo3ZmFxcmttNWlw?=
 =?utf-8?B?ajNRaTZHWHJtSHora0hyM1QxZ2JJK0tLRXM0NHN0Q1JmR1FnZFZpc0t3SEZP?=
 =?utf-8?B?eTNCaXYxY3pER201clgydkNrM0xKamRHSnFRMWxsMFBUeEk2REZjMDlWOTdC?=
 =?utf-8?B?eEhpNXJwMFB0Vy9kQXVoQnFoa0I0a25sMlRPQkdzWE1rV0RtQzBPQmZIT2sx?=
 =?utf-8?B?N0t3Nmk3NUh3Y1cyNXczU2o2NndFUGJ1UDNNWVVOY1JHQjZaU0ZqRkFxOERn?=
 =?utf-8?B?M2xxNkQ2dHB6WDRFTC83MGZ2R3N1Vk1vU2FMN3Y5WWFMVThpbmZiTmUyaWRJ?=
 =?utf-8?B?RTlaeW1Fb2tUWFl3Sno5cCtFb2d5RlpqUVlNY1VHUnpnMUcyL2VReDhiaG9J?=
 =?utf-8?B?K2xPVlNqVm5YTms5NGozUlJoeVh0U0FXeWxiTlo2c1ZhSWJZdm1ZMWlZSzNH?=
 =?utf-8?B?LzBrUktQVkpCSmVyMGhjVkQwdkF6YUVQRGFzWHVZcGJUQUJsM3kxTE1oZzNN?=
 =?utf-8?B?SVQxWHl4cGRlRzBTLzRYSEtsbDMxUXlVSExuZ2kvM1JZTVJoUUxZL0RSSFdr?=
 =?utf-8?B?eTNHK2xtaGJYTmZJUE1BdGMwQUpueTJwU2VDKzhHdkRmRThiVE9tOWxhaHhK?=
 =?utf-8?B?eWtPandMZnZhNkFBaXlydzg3UEVtWSt2VXlTcG5QSUtEbmc0R29WTmlxUnJ0?=
 =?utf-8?B?WFlaRnhvcUVGdVpGTGpnMS8zd0RlRWY0N2V2b3FRNU1ock51YkVnWVpmeEJs?=
 =?utf-8?B?eUtLQ0VkS09ZbDZWZTk3T2lrUVQ5MUFycFlrcEpkSTdWbzNjTGJhUHVpSkR4?=
 =?utf-8?B?WGxodFNrbFhQMFVrZExkTHRpalVmYWdPTzRET05aK2lQdEcyejZQS2FnZWJp?=
 =?utf-8?B?MG93MGh1TWV4d0Q5RWRwVWRKdUxNaElRRmFUWGZhZDloZW9QakUvb1B6dWp3?=
 =?utf-8?B?K0FxVUpwUUZtcyt5MGw3cStKbitXaG1oT1RITWZIbUtaeXVsYTRlL2xpR2E2?=
 =?utf-8?B?SEN2RHVSKy9wbFlRejFZTW50YUlpbVp5MWhhUG1HTXpUZTlBaHRVUT09?=
X-Exchange-RoutingPolicyChecked: HG1PtW760MkhXgxK3+dUECRpgHWMWUV4uMlT3SvY1N/LP4ElLO/34yuHz5wbTuAN6MYLHN9rthDV9HiGijKdt1J7uJESswgk+uPJpIvB0KQblJ3g9lHRp2KHOUGgJ0TzLcBEJHjQU1cY/8M3Y4etKvujeis3OV34rBhk81OujS+eAsME3IQo0CdxWNkpzVGsx7DFfGTMFjErnmk6cRAh8y7uQwEHMmnOFCZzNZUiRK13ruSm49vaCJgSHzNXwwQi0kpSnrrHql5o+t/FmFQIBVZX+WqjZ7W/aYPf2feUz+/PaIxxYwm9CdEPar7JqGGMoz9y59tXu5fqCx0Q80/8xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 447d23ca-8060-4470-11c7-08de8a549fd2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 09:55:20.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjUpmWsVJGa5Q9FujmrV+8fOiAOdajva2t8yiiph312lIH3Irz0oROhogaq6k3k2hjRWbQAx8uh6rO9PVmiJWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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

Hi Pranay,

On 3/23/2026 7:41 PM, Pranay Samala wrote:
> When joiner mode is detected, the returned mode pointer from
> igt_get_non_joiner_mode() points into connector-owned memory
> which can become invalid after subsequent display state changes.
>
> Fix this by copying the mode into local variable for stable
> storage. Skip the output if no non-joiner mode is found.
>
> Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass joiner modes")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7045
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 96fb139ae..c2295c0ee 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -430,6 +430,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	igt_crtc_t *crtc;
> +	drmModeModeInfo *m, selected_mode;
>   	char name[40];
>   
>   	for_each_connected_output(display, output) {
> @@ -438,7 +439,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   
>   			data->output = output;
>   			data->crtc = crtc;
> -			data->mode = igt_output_get_mode(data->output);
>   
>   			/*
>   			 * FIXME: Joiner + CASF currently unsupported.
> @@ -446,7 +446,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			 * Until then, run on non-joiner mode in joiner configuration.
>   			 */
>   			if (is_joiner_mode(data->drm_fd, data->output)) {
> -				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
> +				m = igt_get_non_joiner_mode(data->drm_fd, data->output);
> +				if (!m) {
> +					igt_info("No non-joiner mode found on %s\n",
> +						 igt_output_name(data->output));
> +					continue;
> +				}
> +
> +				selected_mode = *m;
> +				data->mode = &selected_mode;

Instead of doing this, if we get the mode after setting the CRTC on the 
output and we should be getting the correct mode. Could you please check 
this.

Thanks and Regards,
Karthik.B.S
>   				igt_info("Executing on mode %dx%d@%d\n",
>   					 data->mode->hdisplay,
>   					 data->mode->vdisplay,
> @@ -463,6 +471,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   
>   			igt_output_set_crtc(data->output,
>   					    data->crtc);
> +			igt_output_override_mode(data->output, data->mode);
>   
>   			if (!intel_pipe_output_combo_valid(display)) {
>   				igt_output_set_crtc(data->output, NULL);
