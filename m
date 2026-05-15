Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FFACD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BB310F56A;
	Fri, 15 May 2026 15:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RltWfg9u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8BC10F56A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778859567; x=1810395567;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=eWwTCFTl0L9sfrU+Bj5g9KLoY98ue8jyniVfaBCBGGw=;
 b=RltWfg9u9Nf1+PzxP7cin6ONfcSvzltZlf/fmVcfW4jvnOUXPOLvkIpb
 9n3vSxHTJKCQLMzxKcSRvN8Q/Sl+MZOoCS2XisTsiTFL83c2irn42E7xd
 Q3iDQW8tTK/ysTIjdV1qkfU7lv47GdFB7i6gR/RxHSBh0S3AfLC6x5DNr
 g6mp+nazhiJYZAYynlnpV1lGPFq/LgEM02BKDxUcBonIBlqUtbLMJvG52
 CZ+EtTp45glNoTnbecCHtaqkopDFjcwcoHh7GVWvXkBKWJ6LCpYQFkNYd
 0iuOoUcgPT7mcAoWnlne2aaM1SF4SNphcHSxhmj4CARgvcmA6wuUttEjp A==;
X-CSE-ConnectionGUID: 2vdDegqoR3+nSme33CCTTQ==
X-CSE-MsgGUID: +MRJAHqUQdGXzcQiMPkgkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97246080"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="97246080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:39:26 -0700
X-CSE-ConnectionGUID: TMR9ctTgROSVw9zUrx0gAw==
X-CSE-MsgGUID: Z1vDBH46RF+ZYRmfbyg/hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="238974806"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:39:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 08:39:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 08:39:25 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 08:39:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx5bNdA4i9ZpJvYmBjxeproDqcHhDsIyB+O3p1yJeNPhzKVWDDloGLgz0ryejxUs6piIY7l6Z9nWLZp78Jo+Jfyw/lpC+YMhLMdRaSVnroZH/f25YaV/led86tswNK2KNCdagE6MtJCBcN62X5Fvy0HyozDj/M88MonxpglOk10QzKrMv0ilPs1IgdjkMpFbGKA/Oiyz7X4jwa4fWmbirn3IGI1+0l3bniwOcTfcREvaz/vqHZDrSUh/6i+DuQIIDMxAgahsqeZiwb5CC/R8Rt//1E0R3eVDwETwKTNJaiV+0qOD8mHlc3aRLcuioGcU+59FD2ZByObK6GYvhzmbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYi8JJe7ne9YOqvEyxYflfkHNFpEgZoj9ksAXd6knW4=;
 b=BAnQIVypImr/rjo7efeDL/AMsEJGCGz12sim6wg/S3sOiGfl2Y6nAhpNna4qmmSzS2Is9SJMeonVugFL4HpUX1hPQns6gq5kbqvq5XPxsMCDoenzK0caWNe3EeT0YkOD19n+J9Di8V914w/SPEP05v2j3hk5mHORUNelD2pLnS1Kv547DebOkGEKXR+OZoNKyH0fhxxLgyxtR57WFWH3E0S+hFriq/HMe1GDbpjm5BMBClMtvMZFFP5EAgF61Sv1MvjXpHXQsERmPLvaJZXkS7bOBk5lzkvPeX8WKs4dGi78R4SxEq3ykTiiUPMoqy4nLQ8hO3llp+XkHR42VFad9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Fri, 15 May
 2026 15:39:20 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 15:39:20 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] scripts: Add new script for verbatim sync with
 kernel
In-Reply-To: <5815af33af2ec1fe4473edd9a77e23c06d152fa7@intel.com>
References: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
 <87lddkpwlq.fsf@intel.com>
 <5815af33af2ec1fe4473edd9a77e23c06d152fa7@intel.com>
Date: Fri, 15 May 2026 12:39:16 -0300
Message-ID: <87fr3sptqz.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPF07B018B9F:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcbe5de-6cfc-401d-6044-08deb2982176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|3023799003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: ixXliaDbTmAv6WGeaw80bqwXRMBQyV/AXSFM7dcZlVtJIhGsbw1uNeI8GDLi1LfI10pwy9kjxjhpGrPTrqrUkHVFZKqKU0ONWlsOpg+cS38TBQCyOzY7+e1LzQfQjZCCubTgCKpiLGTywXOXgIeJef0K+WUD/xBBCbnXxwGUPWGASqvUmX0Rhxv31/hXS6VilGYSKrTfaqov7KroVWvvKHVqpxq4qigbKOifTsrv6NWxoQ0jAVqwynMzsFEliPvUGwd2CIfMJzWxb2joxtybzkPTrS74BtQB89UiArC++orlLfR+rovf+Xm8ZdGPE9qguLHRiKT3jtUPwYUg3DbMwQ87BG1GZxw5fkS9q+LdEVr1Sb5hVawvh7wZyeqQ/LoVq1hbJmY3VCjaH3X5je7IbObDxzyI1tpbHbC5Fy9KvasU1mapAPBVRAIwIsfsCdpFBHNOlrFNbEgDtAQIyOEvrlzuv87rPAExMi6d8ecAlt33SRLpmxKyCAr4m0p/j7Wl5PEWFRqIJE6IDlRWgQemg0sc8PsLVULWjLD4DRmse056rDzlm657PNZam2Ta2yw1h7JCwPa/ajmE3q56C6nuji+pwhv2Xq+ZzYx56sKq9lp9MdvJV06RBghy2mAf5EvslXllo5GcEFM1ZugaOLaGB4T70QIb05jbNjZBsv51rhZaex14m2gj2F2vCER/kGjZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(3023799003)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmM1bnlRZzJsWkJQNHpTUG13ZnhMWG10Y2ZNNkMyOG0rajFTMHE0SDVGUGc0?=
 =?utf-8?B?eUNLS21rL1puN0k1amQ5RWdXZ1FMbk9nS29HT3BWeEx4dE5Od0pRUkRvTm43?=
 =?utf-8?B?TzFtTDFSeE1zeDg1cFJGVzF5ZjMyQisrT0NFY25SckIzek8yM3lOaUQrTCt2?=
 =?utf-8?B?Vk1DS2JkanEzQ3dHR0F3QmxLSFhlUGZ6dzZ0bVRkQTk1L2wyNUNzMjFDL3Jt?=
 =?utf-8?B?eld2N2dsMlVIQ2dmYTRqSXI1UGJZNHVTMitjdWh6ZGpWbndpc2ZQVEdVREpj?=
 =?utf-8?B?NmRnWmdwS3crbTQ2elRRQ0JDL3NNSndMK2xLRmJrMDJEbnl4K280RmQ5cVdN?=
 =?utf-8?B?WmFpMDZucTRzemM5aFNmeUUyUndaOGRqelk2aThWNTl4MkhYQW41QWZKUUJi?=
 =?utf-8?B?ajdEdmsweEZ0dHNkcmxCeXBIMGR4c2JKU3JiNFhWY0xsV2hBMi9ZUFBFSzZw?=
 =?utf-8?B?MlcwZlBjdXVjbnFDMzFtVGhqRWNZYWpXTEIxS0xGVjBhNXQ2UWZJRHMxOGQw?=
 =?utf-8?B?c0tPSEZEdk5nbnRLOG9TNWFIUDlzZXliWCswMWxIR1JOUjNPZmxPaFpDS0xM?=
 =?utf-8?B?eEtJMDRZT1lLekd0MGtycFFkWFJwU0QvZlBXeHVuNm5RVDZsdVFjSjBlcEhV?=
 =?utf-8?B?WksyV3puTkRHK0Q3dDNVNXEwdTUzNHJRYmtsbjdsc1JEemZuTFVDWStpb3dK?=
 =?utf-8?B?Z0EvWGFLMHhNR2FvKzZaUzBSQXhoRTg0SithaTVIRHNJM09JSzVuUDRTcXRo?=
 =?utf-8?B?SFllMHI0ZHU5ZG1nRDRNT3FtZmpsVUY0M1NiUEtlRlFNVmJXQVNHZlNtcCsr?=
 =?utf-8?B?MllwZ1hzbzJQL2FuUjB0UFZyNHl6WVVOWTFTeUF0ZzVlMytyZkZLNXQzWW1V?=
 =?utf-8?B?c21ISUlubVowdllFZ2ZEY2xyZ2lxVnl0WVRLQ0UzZ01ZRmV4a2ZOQWtmOHNz?=
 =?utf-8?B?K3RDWWFrTGpjRFQ3SGlobHFMc0VPekY1OENPNWlSUXpMa1hqWmQyRUlkNEhG?=
 =?utf-8?B?UEJPUkcwNWkvdUY5c3FNS0tnMTBNem1oVCtycFFRdnh0NlVQTXg5VDdQOGZh?=
 =?utf-8?B?ZjY3NzMyRnMyZWRHSC84WUdoYzRJTHRRR2hramE5UEEwczBVWTJCZ3hUamps?=
 =?utf-8?B?TzdxSTc3TDZqKzRTVDZnMytpZDlKcmw5R25oK1pwME5UUXpPOFZtZmRtZzNx?=
 =?utf-8?B?QlNRY3ltZ21wWUl4TmNONk14bTRlQ3dBZHpmYUxxZmxGVTBSd2tpelJxa3pk?=
 =?utf-8?B?TmlsS0JUMUlLbTVmNCtTbDdsTHptOWdVeDZ4UHpzR0cveHZKMU1yczZJWEpm?=
 =?utf-8?B?RUQwQnRjbk00WGxIVER0VkxxSGpPQloxU29tMG5hUVAzOGJOcEUvQTJxMHZQ?=
 =?utf-8?B?Y1dkN3hJRmJNMGovTWVLOGV3ZzNnTnNXclYxbEd3QVdGblZPcmdNWlFidE03?=
 =?utf-8?B?NWdqRm1zTERNbVNIQm5LVFdCNy9jemx3VEUwZ2lLR0k3UEpoeTFjb2Eybmk5?=
 =?utf-8?B?bFFsaWlnSjNnejN1YWsxNmZWdU1MR3I3M0JGb3JyUTJKSTZ1MkRmMThGZU9Y?=
 =?utf-8?B?UzZxQjJqZG5mc2RUTk9SeXpkNHRIaHU3ZGxVV3RsUE9PZ3h3eW9WdDZ3VG1Y?=
 =?utf-8?B?ZlNxZGU4VjUwY3UwbU5IZkFBUnRlbDdzSnJ3dWEvWDZGSVQ2UEQ4SHE2UkZG?=
 =?utf-8?B?RFpGY0ZNYU1IZ3VFZnYyZWJjUmVSVnlsOUJodlM3dEJjL2ozZnpvekVXTHZ3?=
 =?utf-8?B?bFNqVHFHZGpFeXVNY3NwbmVWN1o1bUp5LzY0UmZBVkZBaVNoN0N1TjdnOTdu?=
 =?utf-8?B?cDNWZ2UvZkwyZ2x3NmcrZjJDZUdselNDbzJlN0x0NGRWbWtteSswM1VEUjhn?=
 =?utf-8?B?ekw4R3g2NDhZa0pqWmZTeHZFMVJDcWZGUDk4eVNUd0wwbXNVNEdLUGhHMlNs?=
 =?utf-8?B?SmlML3h5cVp2Zk5yUWdrbzVLM1NtWGNkMllBdHhxUDMvQk85K1UwRC80WkJ0?=
 =?utf-8?B?aTlaV1JWUmlyVy9DVEcvWWl2eXNQY0hXZEVlVmxxUzlycUMybGJyL1NxdlpQ?=
 =?utf-8?B?WWlHRThoWmVMdzFCWHRlZThsRmJTL3dEWENZSHVUOXAxQkF5QzhMV2J0cmND?=
 =?utf-8?B?UGJmaUY4UGYvaTM0T1ZOV29ZZEJMRCtrbThnVisvL0JaeGZnTUR0SWtpNU1I?=
 =?utf-8?B?N2JVZjhqRkN6Y3d6V2s1L2QvVkh5RDl5WWNzZnVwYlMwNzhVQ1dtd0ZKVEZ5?=
 =?utf-8?B?ZlRTcmFSbVk2OTVsTFFmV2ZvSmNHUDl2U2xCbkNsR3NJQk85amFvdTU0MG9y?=
 =?utf-8?B?WWFLQXVES2k4MlpYV3lhd0xlUXNpdHNNZ3FJN1lVMkdVcWVQSWtNUT09?=
X-Exchange-RoutingPolicyChecked: KGvlAdWcz6zu6sDyVP1FNnXz75f5qIPJx7zUVwWUghMmZA9RJoOKm8SIThGkskMiZnAM4ygv8qRJMRyHIDVWU9nYLWARZQSRdc+852Z/9QoVAgG4dyR/swIkmfYVbBVz569I86B5JpWeIEo1LFP8r5MMBaZfEOG5T5a3+n5jYU6ttY4xO0zNjkSt1kASZQUTR28QAdoCPqv9qbrwLgc94yPstfo4HI4PoLi/3OWuMgzdZ49wz0aC+S8pvx+6Jt2UTof+Rhl8sqwO2dyQMEoDFZIL4r9qO2vlCm87+uxD5tcA5wMGbJhcvMy34v3/3M0M8vK+ReFz8OhLi0gwdKT7yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcbe5de-6cfc-401d-6044-08deb2982176
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:39:20.0636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3BZtB9kZxKoRebGqNJIm3nnF6ptzX5OhZ0aDtiD7hA2KZ7BVNregzb6MSvwpAw0Hvd9L7jiVheeS6SlrtUWOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
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

Jani Nikula <jani.nikula@intel.com> writes:

> On Fri, 15 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:
>>
>>> From: Jani Nikula <jani.nikula@intel.com>
>>>
>>> This is a helper script used in cases when a verbatim kernel
>>> file should be copied into igt-dev.
>>>
>>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> ---
>>>  scripts/sync_with_kernel.sh | 57 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 57 insertions(+)
>>>  create mode 100755 scripts/sync_with_kernel.sh
>>>
>>> diff --git a/scripts/sync_with_kernel.sh b/scripts/sync_with_kernel.sh
>>> new file mode 100755
>>> index 000000000..65753677c
>>> --- /dev/null
>>> +++ b/scripts/sync_with_kernel.sh
>>> @@ -0,0 +1,57 @@
>>> +#!/bin/sh
>>> +# SPDX-License-Identifier: MIT
>>> +#
>>> +# Copyright =C2=A9 2026 Intel Corporation
>>> +#
>>> +# Author: Jani Nikula <jani.nikula@intel.com>
>>> +#
>>> +# Use this for verbatim copies from kernel into igt-dev-tools
>>> +# Change paths to yours, update the repos, cd to IGT, and run.
>>> +
>>> +SINCE=3D962601ac4c78
>>
>> So, the plan is for us to keep updating the SINCE value manually? I
>> wonder if we could do better.
>
> It's just a starting point to not go through the entire history. It'll
> find the matching commit after that. It's sufficient to update SINCE
> when it gets too slow.

Makes sense. I guess we could add a comment so that people are aware
that we don't need to update this constantly.

>
>> One idea is to try to infer it from the files in the IGT repository: for
>> each file, we can try to find the latest IGT commit in the format "...:
>> sync ... with kernel commit ...". In case we do not find any, I guess we
>> can fallback to using ..HEAD as the revision range when searching for
>> $last down below.
>>
>>> +KERNEL=3D$HOME/src/linux
>>> +IGT=3D$HOME/src/intel-gpu-tools
>>
>> I think the script should not assume specific locations for the
>> repositories. I think:
>>
>> - The location for the kernel repository should be given as an argument;
>> - We should assume that scripts/sync_with_kernel.sh is called from the
>>   IGT repository and we can infer the repository toplevel directory
>>   based on "$(realpath "$(dirname "${BASH_SOURCE[0]}")")" and "git
>>   rev-parse --show-toplevel".
>
> Fair; I originally wrote this for myself.
>
>>> +
>>> +declare -g -A map
>>> +map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]=3D"tools/intel_vb=
t_defs.h"
>>> +map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]=3D"tools/inte=
l_dsi_vbt_defs.h"
>>> +map["include/drm/intel/pciids.h"]=3D"lib/pciids.h"
>>> +
>>> +cd $KERNEL
>>> +
>>> +for infile in "${!map[@]}"; do
>>> +	outfile=3D${map[$infile]}
>>> +
>>> +	echo "processing $infile -> $outfile"
>>> +
>>> +	last=3D
>>> +	for commit in $(git log --reverse --pretty=3D%h $SINCE..HEAD -- $infi=
le); do
>>> +		if ! git cat-file -e $commit:$infile 2>/dev/null; then
>>> +			continue
>>> +		fi
>>> +		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; th=
en
>>> +			last=3D$commit
>>> +			break
>>> +		fi
>>> +	done
>
> This is the bit that finds the last matching commit.
>
>>> +
>>> +	if [[ -z "$last" ]]; then
>>> +		echo "last update to $infile not found"
>>> +		continue
>>> +	fi
>>> +
>>> +	for commit in $(git log --reverse --pretty=3D%h $last..HEAD -- $infil=
e); do
>>
>> Do we really need the intermediate commits when synchronizing?  What
>> would be the value in adding those?
>
> I wrote this at a time when I'd done a lot of refactoring kernel
> side. When each of those kernel changes needed corresponding IGT changes
> *outside* of the files being synced, it was tremendously helpful to
> split it to smaller changes.

Ah. Got it.

>
> If there's no such need, you can trivially manually squash them with git
> rebase -i, but I think it's helpful for the script to do individual
> changes.

Sounds good.

--
Gustavo Sousa

>
>>
>>> +		prefix=3D"${outfile%.*}"
>>> +		base=3D"$(basename $outfile)"
>>> +		# ref=3D$(git cite $commit)
>>> +		# alias: cite =3D log -1 --abbrev=3D12 '--format=3D%h (\"%s\")'
>>> +		ref=3D$(git log -1 --abbrev=3D12 '--format=3D%h (\"%s\")' $commit)
>>> +		git show $commit:$infile > $IGT/$outfile
>>> +		cd $IGT
>>> +		git commit -as \
>>
>> We can avoid changing directories with git -C "$IGT" commit ...
>>
>> Also, perhaps using "git commit ... -- $IGT/$outfile" is safer than
>> using "git commit -a ...".
>
> Fair.
>
> BR,
> Jani.
>
>>
>> --
>> Gustavo Sousa
>>
>>> +		    -m "${prefix}: sync ${base} with kernel commit $commit" \
>>> +		    -m "Synchronize ${base} with kernel commit:" \
>>> +		    -m "$ref"
>>> +		cd -
>>> +	done
>>> +done
>>> --=20
>>> 2.54.0
>
> --=20
> Jani Nikula, Intel
