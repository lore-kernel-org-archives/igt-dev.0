Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7C9C44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 06:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E62210E149;
	Mon, 20 Jul 2026 06:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/u6PqPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4342210E149
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 06:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784528734; x=1816064734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P7rpvUgPsRr2M6pUY7nk7mtLg+1Y0bYO1EQOJVH82DE=;
 b=D/u6PqPGWOlCAWPRhiYq3u9wUJ4M5+Ghv2rahwCVfj0OEleMiK7nXYQi
 ttzXqpdndMejDMGe8RIHmyexXJWbBYNafXEgVxaDk6okAnOTCPre6Q+9N
 MDxECE3tL72EGwNniTRX/iXmYS8SRsLnmxJmpz99nd7pseMGJG8abQhTn
 TwxD/4uiKcsWtqBFqNu/m45P7jK2Z9baSnonKNxZXSm9Ged7QNpH371AP
 Bnqtbht07NMmivR25nLdFLMjOOr6IdtBzZds6i4VarBzCUkyKmDQBX8Pb
 tGiiRtDiR/B3/PbHFVb1lrHLimPVVlUYw6g9hZRn5yXG019eM+6/vEen/ A==;
X-CSE-ConnectionGUID: V/1NypglSHOtEbvKr471pw==
X-CSE-MsgGUID: qTesHYeVRzapdqK9R4tYbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85219879"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85219879"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:25:33 -0700
X-CSE-ConnectionGUID: HuJ4rozqSI+9NqcBtWP8kg==
X-CSE-MsgGUID: iinb8tnAQFKIS8dZ9YdNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="258008242"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:25:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:25:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 23:25:33 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:25:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf+UlzRy78r93on/sQ/XDRrxBsoF5lts1pHjTazKTD11VN53A2+jgO+Ces5uVyDewQXuRu2QJQDql4c92osdAB9jc1s2WqP8Kyukh39gq6fUw2nUcS7/T6wkKlJnCVFAySDNnFJZ5KH++wjDsR7g78hOKxQYXqjRwxnJrk5g2g528Kzb3zY0eQxTiAEREMmfuGFf43Hh/BRqKrrtRh4JQEp/nM599VQuHZBe7Z3ykVojnSXooskKpiZhmV8zrxrhAXpsIRfZVizlLA/KlD7ncbZVrUiYEssVXjsmFZMgsPPSvDKydkIsM2pREsGB5ioQLoAATuih8VNbJL5f2M4hyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkuBTdyxlrb+JyiI6PBiwROjiGTKvBYLRphW7hxZJCQ=;
 b=PLVvL4gpxfZmwXNyLgcKvlaBjpqrwsTJ/tmXgzNyPx44iWFTsYQuVJhbagXmICnG9ekIIxULtdPJjHO0HgdKltqyeq0dnrW1MgeXLa1VtVUcYvTQ8dWNdC26eeAGS6rsOEeSvy5fad1UGbOy6EVk5nwEOgQflAZZdxg32zcz6MCL6meJwz/kdRqnEV+JZNBdSQrlwhjFaJwvyQvplGu9/Td1vN3YnOHgL8bg+9KO36n7U+IpdF5Qgs9XCv465GeFMmAQaSoBCoqG+zCSxX2nIHVhMQabvVJucGMUInNTLzqTmIiqStyyJHdT0O0n9pvZ0XfiWeCC1JcJF7v7frE88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 06:25:25 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 06:25:25 +0000
Date: Mon, 20 Jul 2026 06:25:15 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 16/31] tools/intel_dump_decode: link with
 minimal sub-libraries
Message-ID: <i76nbapinkwalnjycvoc3lr6wheeypgfwwye6hkwuvlmm2z27i@kt6j2x72tewt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <e61776987a68bf192665057c3fd78b0e43384562.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e61776987a68bf192665057c3fd78b0e43384562.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0026.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::13) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: b4cd2f94-0c46-4d54-8053-08dee627af49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Zgq7x9XGd8CFXEsWRVmpclv6ns2pWPb6UAf6a2XxSiNelaOYD5bLUtvUKXAnvqfYnY7M8y+LBeQG+zmr1gT/thXYy3u72nkZZOkfPAPODtAEKi08WbomFTu9KM4SqZkvY9HZTUlMZFsTaItzDKFnfskcOoJngD+TPhy7NugICfJo9mhl77RI5dzDT07m0XemO+8JCzMjIcC/qAzKzkUp79BfImtkH5DltPNSd7aelC0IZXyOX/oEVvM2JlmrEIIOJIBgJjVQI9up0wvf2fxWU/QAMBsflWeKBbz6S+pUgHH3upaBjW/zlhNlaBXL81t9wMOfIdIUyQ+9uZR0unbx9se3MgKytS6K3rC0GCf0eDWl6qcf6Dv5vfwv0kHtz7LA7QLsd/cm2xVLvmhYRJ1M73FN0XjJ0pAByh8MJg1p1iM5nXicJQEt+JfRPp6jQv/F2ZXeX6SdOuSkroRgf/Ze6bkFJsmkHe0aoBE+hwzpM67APKU6x1lOcxjhk5lCg3ShJP31eithU9gISkZlu+BFlfzREtYce4QjhEdE7AJBQWnQzJaDkkI3ap36xSy3aHcL6Qtu2RRjMf8wsk9noP5ZbsmR/iZ/Z1paroIHsqxoS0jfuS0REKQ5ymzjEW50dskzHRsfDuvhWrbExqUXfJgCj/qcEQBFSsQjeWWGUubQsGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OStnLzFiYU5Yamt0Z2pPakFUR3VIbmt2dWs3TWNmNWlqY0QzYWNpQTJRMmJl?=
 =?utf-8?B?SmM3anBVMmJMckRleWJDL2N3VERNUFNLeTdDdTdLTU1QZUs4WkRWbHNVUU9C?=
 =?utf-8?B?NXVZNWlxWXVualJnVzhHSWlwcVBWNUVwZ0dwck5BYzVmTkFCazg4WjNjajhC?=
 =?utf-8?B?bmZuRVNRbSt2UVdRWGVKQzZac0hUWGJwT0U0Y3NEc2NXenhjaXFQR1FwNHRW?=
 =?utf-8?B?Zys3d1RBOTE2TVFUOCtHMllWUHMxK2NFSHZPaUlhOWZXdVhyNHJ6MDZVS05O?=
 =?utf-8?B?TEhVL09ZcENWbVAyTEFsZDJCQnArOEhTTzhmQ3VzaE5OeGlDR05HZXJqd2FT?=
 =?utf-8?B?cUZKb05OTlBkMU5jU2w3L21OQmZVK1lEYWFNRDJsTi80VjREelZHL3Yydm1j?=
 =?utf-8?B?L2F4bUwxSTVzZitweXVCSXpkcGpvbkphNVdoTDlhVDNiZ2tUNld0NU1lM1Jz?=
 =?utf-8?B?aU1xamNMY1JRNk8xZ3Y0MXlSc3N5M3RYQ0hSMW5UNjBxb2xjTzFXaWFvOTRR?=
 =?utf-8?B?eHpoUEo2cHB4cy9QWXV3djZLL2FSRUVRKzNabXV3QWlDUjNUM2dkY2xrQmlh?=
 =?utf-8?B?RUhNZEtoR3E2V3dFT0lteEQzeFNvOVJQTlNlTVVNaGR1TExFUENsM2R2aitK?=
 =?utf-8?B?bnJUK3liM1BraHlEcTRNNytmL1lhZXAyNVhwWXZHRjBNWXlrSDVTSzdUSWpM?=
 =?utf-8?B?WDNwWU9vNExXZDI0UFhVV3h3VnUxTkxDL2ZJMDZzRkdVVnhUNDZJU01ESHFr?=
 =?utf-8?B?aGJ6SW91c3IvWURFSzZhd3lRbTJUZjd5ZGtBOEpaWUxtT3o5MzNYQ1NZaEVF?=
 =?utf-8?B?RXkybkdIbWxRd0FlODVQUk5wM2szbENXU3dIVFYyM2hSN29PblRUTms5RFZw?=
 =?utf-8?B?N0VOVzc3Z1I0K2hnT1ZDclo3VU05TVFDQ294S2FSQmZLN2VEMFF1TkRwSlp4?=
 =?utf-8?B?eHZLUE8zNE5ubTBITjZHQ1JTWlJZay9vRk0xMWs4Y3krTTZVVVovT0JoMndM?=
 =?utf-8?B?RzEyTkF4Ti9EM2FyTS9wVW1hS2FzdU5VWDhnMW9Rd3U5NVdISXI1bmFoVi9j?=
 =?utf-8?B?L3Y4R3dpd202OFBUcVFETEY5QytQTGZxMUNxbXRjaENZN3EvVFkzd2liQ1hI?=
 =?utf-8?B?STl0ekxZaDVSTU1rVzRoRXNTU0tHMXpGYlpGVWpwRGlOazZ3V01LS2d3NnRr?=
 =?utf-8?B?YnhLczRMYUU0L1ZLWHBwZnZlMG55N3NkNFlqWlUrRm5EdjNSNjd0THVSZDVh?=
 =?utf-8?B?TG5KbFNnVDF0VDMvQ05wVFFZRWxwTUNSSWFzOG01VkVxcVVJWXoxa0RzRlFC?=
 =?utf-8?B?eVI3YzN0MDdlNjVHd2t6bGJFZ3F6cE5OS0xoK0xWQ0wzd2twSms0NjZka0sy?=
 =?utf-8?B?Vzh3cUNGUExwSHcrZ2VVd29kZjhkdkxrY0ljOGR0SG5KaDlIOEFYLzNOek85?=
 =?utf-8?B?bVhZOG1hYUI4UTFYY0ZKU2pvTnRkdko2dXZOcFBNVVFtVlVzVTFnWGRnWXBB?=
 =?utf-8?B?WEpVOEwva2YwNVRpNTRLT1ZvekhaVVkvdjFNaldyVmZ6VzZFeXYzTTRXWC9W?=
 =?utf-8?B?bUxaN1dTcm5PUVRVRDYvN1hqOGpldWxZWUZ2YVpCSkY5TnBlWEd4eldDazN1?=
 =?utf-8?B?TTMyREpIK0I4dlRNd0hCaEdoTmhnNUx4L2lOZzBNOFZZTjlJazF6bndoK0s4?=
 =?utf-8?B?b3pKeTJVNkNPbXNRRUtvRkdvSjV0bUd2YThnbjJERlVYSFROa3RJTU96ZzJ6?=
 =?utf-8?B?MU5zR3lBMFhZT1A5aWVTcU02bkk5UzdHRTFINWV4WCtUZGJxaXpvcHR1dW5S?=
 =?utf-8?B?bTBBdG51dnV3L3dnSCtSdTRWN2RFT0VXaVZOME5RMUhBNjh5ZTI1UTdmcHV5?=
 =?utf-8?B?Z3lmWUR2ZWd2TUdRYVRFTnhXWVQ0TkhPMXdNV1NRUy92U1dkemVmMzFBK0tX?=
 =?utf-8?B?S3FnNmsrUVJzNUd5U2xnNjdzQWE2M2lHOFRMUUJpZXN5RU5seG5lZkVNWFhG?=
 =?utf-8?B?TXdXYXJkbWdTcmRPdHFRTktsVUdzMUpsSjFUUGNnb2J6R0NUMkRYS05vZDVK?=
 =?utf-8?B?QW1nZmpXTTFGaW92dlIvQ0krYkZMeU5sU2JhSStyQVVyOHVMRTBFZ3hCVkZj?=
 =?utf-8?B?aGJ1em55azdaTzRDSkVDeVByM2prSmVzcjNqU21mV01MWCsrdVRLMHlEZWxU?=
 =?utf-8?B?RkhUMXlNZ1Y3bHlVakpWL01mRENaazR3UFJ6cHhIUWJVM0RJaWVadmg1Njl5?=
 =?utf-8?B?cTlpL2VvRXRDdFgxQ1AyblFDS3k2YVVHL3ZEY2JlbFlOSG42T2tTTXlFUUdN?=
 =?utf-8?B?QmZOZXJaZThYU3M2ekVXQXZMSzUyUDEyMWQxQ25yQWZJeFQydjg0UUc0amFa?=
 =?utf-8?Q?7yNJikonfy0ZXAWM=3D?=
X-Exchange-RoutingPolicyChecked: asM4XPMMNWW54ydtSJOuyR2Er/i+TGDvDedzWqExwuRfa/vmwQyzdbpWNJZvKMtgByek+MumAqy20lAT7yWWqGC1dnqgQmROggdISqnfMjQpHjqdOpgoBQi9yPsgkXTO8qs0EPh8PR4NGXGDZbUhKjyiaReQWuPi1OlhsLdpsJwY+kpuxn9KhN0YE4Fr8ZStMzrMbGcx0MFOfsroBicl1QLs+B3gxJGyi2aEK+5A31DgjcsN2ncrPRCmFnm8X6KgBZkt6IUA2YlA/2goI4oEMHE42FIR6fGEw9d5KVEQ8TinVjD4ikm87GdF/pICOSngnemDP4h/7Rg2CWjRpdUPwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cd2f94-0c46-4d54-8053-08dee627af49
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:25:25.3972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2IHEC1I/sCo9TulhDY/qTngTfoR3pYOmFiAQJViFeMMzsW5NQeYh0AR8DjON7y5W7lD/3vaAx55UFT3YFDR0acBa8mlDomNLetFXUEzGkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
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

Hi,

On 2026-07-15 at 14:15:26 +0200, Sebastian Brzezinka wrote:
> intel_dump_decode only needs the i915 decoder. Link it against
> lib_i915_decode instead of the full libigt.so stack.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index a3fef87a9..467b8eea1 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -20,7 +20,6 @@ tools_progs = [
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
>  	'intel_display_poller',
> -	'intel_dump_decode',
>  	'intel_error_decode',
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
> @@ -80,6 +79,11 @@ executable('intel_gtt', 'intel_gtt.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_dump_decode', 'intel_dump_decode.c',
> +	   dependencies : [lib_i915_decode],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
