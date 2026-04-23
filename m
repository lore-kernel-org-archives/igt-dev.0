Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6332BF9934F
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 07:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1457410E300;
	Thu, 23 Apr 2026 07:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4kXg2UO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA9910E30E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 07:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776930949; x=1808466949;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gvI7tx5Dq6UgggB9R2UG1GhUgMTiqymLLm8pxSa+dK4=;
 b=k4kXg2UO1/rQ9QR7utFkgA/R92ucrFmYU7Y1A7BmumTk3ZjWz3v2p4nm
 WL7LrP328zF7uyi+nnobyA8+pM9gqjgHmEdQT6dVJZL4wLFyZOXE7//OS
 YC2h1KgjRvmbc5WvCEKZMc5ADC9IynkSMI9imnfIoFZnwuzV8ABvYBvxk
 kDEvtOP6AoVrHM4SeZ034bS7a9kLjguyzP1RbRFEklxwEKDhz+MXMIGpD
 PjKZ7Hwg22e3gzSKFPvQrEGsTzsFRHTKBN2ES0xNqdGf36KUnqUfD2qXX
 KsoQHLWRyjogSzlvFY4QZ6TcneTSVvY2xMwsebTboxVF1LgPLdml3vKBk A==;
X-CSE-ConnectionGUID: pvInGaJvR3m9s5uauZeiVA==
X-CSE-MsgGUID: PTaixiI/R6O7fnsH27ej+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78083270"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="78083270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 00:55:49 -0700
X-CSE-ConnectionGUID: OJ/VjwuEQxqpPCp6QsTaTQ==
X-CSE-MsgGUID: SDonr5KVTnS/FWWLRs/n/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="255885588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 00:55:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 00:55:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 00:55:47 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 00:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmkMTNtJnyIMe/laQ24dWer12pI+5cZFod2p81aK0BJ1TGZV4tvmRjlKGGDpk6VBM1iHc1+y411aPdlRAuLK3lOnDiLSvqgnVbUppcbHEw7ffL7UfAzTdr09h/U05u0AhcAlO0bbSs8lC8pPnvxHQfmv5sIqZojaHRUyRr+kOhiEJmFMZ8Q5hPibKG0KXlYWngbxxxmKqAnaK+ctKoGlCq9oo+ZmBdetmyqBhhQOa8lia+Fs73dXhQSbEBTJomGf9XQHe+26k0jPGXP8J2fzSsxLzfzd5Hg202gmSA/eHR7OgrZA9uwGTqv8eypGzKQA4ub3083w19nIre8oI5gskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fus2VCmkbz8lyxfxKLv2kxVpi8ujCKeYyzja63ZZmz0=;
 b=c28jaKP0kkibrKy3x5DOM9crbxwAV620SPpNlhoVtpfIUXO00DUzkUgw4qAW0HGzhV31t2OtRZ2PQE6fS/AwRcaDtnBuuAEZDol/HgS41T/dONOnIuKohE/WG2hRjTeXVk4DGr+3P3RhOJehxWQs0RkDLDtZ41bKpa2FdU2EkKU2sdw7qsz4p9TxHzfA2FtzKqh99Xww5C9RH54rMnM0nEwLXeF+mJnR2+0n94YGexvRLryDT8hgesuH+3l6yqOj4JGGUn473fveOQLFQuxSLfOvuc5Q1eDhpzz/YILW/t8Yq+crdU5g2bjwwOMCoDFIDxYwlEbBiMVljWnsblYQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA1PR11MB8426.namprd11.prod.outlook.com (2603:10b6:806:38d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 07:55:45 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.014; Thu, 23 Apr 2026
 07:55:44 +0000
Date: Thu, 23 Apr 2026 07:55:33 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 3/4] intel-ci/hooks: Add hooks-wrapper and aux
 scripts/allowlists
Message-ID: <a4owbujole5alcul5nwq62qgrn4baq66bqiiq3zufui342vgvw@c5izb2ztsxta>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
 <20260421111709.3163253-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421111709.3163253-9-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VIXP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::14) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA1PR11MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 817a0e62-b1af-4150-bb6b-08dea10db8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: O3TCYWYLWQbsXI1aYa9npMQhZdNaiLFsz5ZwpzYiDoBNJXE7P6xEQSVNWd9l3OhxT+BvogeCKN+1NDrkbuG0rVHUx5Ov6dDy9jaAAGzgJs8s1diC1BE5wWTd0YSuiS1xupoav4RMGd6FQED/p9J1y+1VovF6O5bgWikFwOeTpCjidX4xSy8V/JmUVspgToD/1zYDRrqSKaXPVLTDb8a7GH8gito6bmFbVh5TvtNlFwd0iRW79ttkLROl4ZAZldcltTGWckR4TEIjHInx0exp4DujPEcySlNnKaFEKoZ5qv1655PAvYC8ce9O0YQ+9/GpOezUomJ0ZD68yvLYvPsXcEcxGl5JNKcZ4c+2EssrWJvYNO0GQJKL5+ZmQ6CGctqSqmUpO+COFTfxN77VzPlsiBiM2/wAmOwtuUoOkLxj8H/zN3SjQDxwtQ4xiTqKCYol/O9TfSOEpsNYqHjZfaO3fGOsXbIr4y8aKJutE7n7wS3DleOuRFi0xEuC2NjRJZ8Ds1c6vTpORZFKIJY9W+8RXyQV4SiaK3dTp7fJ3TEOPlg7+/Mw5UnR2Xq44O0kwlI+2H2KOjj65dL0JZgSmNAP2jA6/EEsUEc5W8SOgTeNgxVJam7E6Ko35+LcMljZzyGG4XUFHk7utftVfYOW4iX31whXwIfVFvCieVeePrrYy4jdbnOXPlim3cvzjoRtO4wxcl89wdDfqXvSiq5jjn5pxgOivyjAvXT7FMVyeupC7Dk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnFJWlBnaFJ5alNzVmpUanRkTCtTYTYrT3VrZGh3Sy9SaTI1bmJSd1BNS29r?=
 =?utf-8?B?SDJhZ2N1TE16M3JseXllaXVzcEszWGExaUQwendGMDZxelphZThmTXdJQzRK?=
 =?utf-8?B?K0RJNUJkaGRTVkdZVENzbnZUdWptSjVrR2pLa3kvKzlmVlBFR3F0YThhSzdI?=
 =?utf-8?B?czFYbG43UzZzNXB5OEQwNURkaVMvS01XU3ZGV3ZTQmprZytLR09XbjdLWWRx?=
 =?utf-8?B?aGZ1N1M5UHRLNG9ZUytXTWhUNjIwc2Jld0hQdUlaSHA1N0NLUVMwL1FBV2w5?=
 =?utf-8?B?NEQxbHlyMUl5WTcwVytYVk5Rc2dXUHYxV0hHeFFrOStGYnltTmJJZUZpVS9q?=
 =?utf-8?B?d0hQZkI5aWx5SlNiK2JqS1RqMWpQVUlJL0NMeGJnMERMS1lmcjBEWmhqZFhX?=
 =?utf-8?B?NG9BTmx1a0JOdWVRZTBhemt2KzV1V3JOcGJNTWlwUWFRdFQraVVFajFRaGF1?=
 =?utf-8?B?TW1HYnpNaE9PeklEWUY3OVprN0pGdS9JU2M2SHhtR0dEN2NyNXFoV04xc2hu?=
 =?utf-8?B?V1l0cVU0UEdjQmU3ZjdWVGVuTDNrVTlsRnZUYkQ4VmlPSlJtSWxtK0IzZ0N1?=
 =?utf-8?B?akxDaEluQ00zcjdvaE5EbTVyR2RrR09zZVJlZVZJWnRXRjFHYVNzTEFHdFNv?=
 =?utf-8?B?M3VGSGwvTjA1YUEzS3RwK2tzUjFaM3dhQnNpK0tVdnByYytjdGhzY0Q0cVBF?=
 =?utf-8?B?c3h3WCtKY2ZIQXJ6cVJpcUhkc2FuUmg1c25FeG84QzkrQlAvRi9lODd2VHdz?=
 =?utf-8?B?d2hOSEgzYWlRd21Dc3RySmQwTEUrdUlsNFA3MWdiczVJOGNPU0VMM0pLZzVG?=
 =?utf-8?B?WjE4NWtvbm14d29sUlVWbHl6Y2FyODIvcXBZRjZGSjBhc1VqUTRLZ0ZRbmxP?=
 =?utf-8?B?R281UGNubjJqREJtZy9Ga0xSYU1OcmZEcWlkaUVNdkMyaVo2WlFremJhb0I5?=
 =?utf-8?B?VVovY2pxYVVQMjN4T2ZGQno2YmI5RUdOTnFKVU9zN2cwNXVGOUNPejF6ci9l?=
 =?utf-8?B?cGExTGNwbzVCQkQ5WjJmTkxTQWxjRTJodjJINTE5cHJUTk1PYXR5NTVocHhQ?=
 =?utf-8?B?RFAzdE1JMUE3TVpCWFhQdjNpby8wVFZFMzl4TjQ4ZG9PZGJhQUNmSVZpbFZm?=
 =?utf-8?B?MWRBVXJmSEtKSjF6K3M0cWZyMjN0TTZyeXZiT0pPWGZYbDJ4TXNXMzZ6V3lV?=
 =?utf-8?B?V3Zjb2ZIek9lYVNLbmZ2UVRrQXdMWkRpMjZJT2JWZ1A4ME05WDMweWlJc3Yv?=
 =?utf-8?B?dkpCM1dmUndqSWdLN2dkRTVsa21DVXNjWEw5K1c2aVpOVUppamVCZHBqQzU1?=
 =?utf-8?B?SXRNYkFBaHdhR3FGSlpjZXU0UjVrdDhvcUp4V0pEMGNYeXFyeFJCSG9yUHl5?=
 =?utf-8?B?OHBnbVlSOUh5VlNDbUl4dU5paGtLcjR5WHBHbGpBamhINHdwK3lrT0diQXFu?=
 =?utf-8?B?ME9zNTM2dGZxdnIvNGFoY2tzd3J3NS93MmN0K3JzRm96dm9EczZRQ21zRGc3?=
 =?utf-8?B?azlZU015UmRESFV0SjNxQ25iWld2S1d1OTNFNmZxRW4wR0VjMnFJS0tnZ09n?=
 =?utf-8?B?OC9XQVJXR3NSdFNuaFUra1Q0dXlEKzFwcWJFT0N2QkNlMUxsMnFlQ05McWhk?=
 =?utf-8?B?cXkvYnFtNDJoUHR2LzNUZC9vU2hYK2hzK0hGOWhIdldxQVR3Q05qV2w5L3k4?=
 =?utf-8?B?VncwbHJiZTFIOXhBc3F6ZHlmRXJmQzNvR1gydzljY0RZYi9ab1IrcENVSlVj?=
 =?utf-8?B?a2dkRXBGRVA0cXRYS2JGWFNyQ1NBTlU2Nm9zWFpQTWVrYWZsSmkyY2lhbllP?=
 =?utf-8?B?cVdRSUYrNjByRWFXaDZtK3ZiYjhMK1FYL1VFZkR5c0VITThlamhWZWl0TkFu?=
 =?utf-8?B?eXNCVnVCZnR3V0dPWStqU1dBOERZSGJTVklTTFMxMk1abjNLTXRBK2xyUkJr?=
 =?utf-8?B?RDM5SngyVVIxWjdKWnQxM05WejhOY0h2MG9zWVY3Q2xvbmxMQktXNFZVL1o4?=
 =?utf-8?B?VTVtWFBWLzMrZWVqa2haWEl6NnF3b0ZZc3FnbEVCbk1IbmdEZU1mc2VQNk1R?=
 =?utf-8?B?QnZoTHZaOGJ6RncrNmJnMDNsQTJoRkh6Q25lYWVmblFFZVJvR1hIK0lyVUFo?=
 =?utf-8?B?aXRlTHVwM0NPVHRGWVRDNGYxVUdIellja1pFMHltcUxtMXNLblZ6cGtzSjhr?=
 =?utf-8?B?Sno0Ri83Y1dtOXRXVTY4M0lQcFZodkN2TDBIV1NXc2QyQXVUL3ZjMnVVcDV1?=
 =?utf-8?B?eHZJMU54eUpSUlVtT3hzakZGdG5zV1hBUHUwdnE1MkVDb2hWdkIwTFdBaWRI?=
 =?utf-8?B?b1RZek40Y2pZbGF4em5mM0gwUmR1aVZzM082MFUrUVE4QzRyeUpjcXNMUFAv?=
 =?utf-8?Q?NtDeXR56s8+Gvlj4=3D?=
X-Exchange-RoutingPolicyChecked: TL6xFuLaF7aAbNtHU6+WQXILw3GAvlAOyyeJpk/jVOP82xb2eW+y6htjyeqftcCr9wkzZerbCGOeob2MYdM2UbV04MF5tyVCCIKevObRPMtfOw6HOG8p/3He6iRlwnY5JzX73kdWLpg6LeaIlEP6iQmk2u0Q6QKTWv0Do0mtk65CWvPDKkOA923bULagZ6GCZYok4tNtRt0MirSNxYI0vYXn+0Du1xCkEoSSmrlxrnmx1YGPnkDtwA1d57+8D60tVDyuKJOUf7hu53T6nb5RNuzVq5wA8ecjq6ETCGAhVFgByH1gpMO+NQJoLv3SbLntKIRl44zru8mLbw1XWztCnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 817a0e62-b1af-4150-bb6b-08dea10db8f5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:55:44.8872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vjls2dXrTwaNA8LGBZZPa8wkqvrybJ6QhFIMdwept7j8xwYOWvjlPBtKh39P0t0Sh3ZbUgh4YxbvXAgstYtLgr4fPiMXtBCMcICaBOq8fvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8426
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

Hi Zbigniew,

On 2026-04-21 at 13:17:13 +0200, Zbigniew Kempczyński wrote:
> CI currently lacks useful GuC logs when some tests are failing. For some
> failed executions (not all as copying guc-log is time consuming) using
> hook script which will copy it to attachments directory seems to be
> simplest solution.
> 
> Add copy_guc_log_on_fail.sh script which copies GuC log when test/subtest
> is failing. It requires an allowlist to specify for which tests hook
> will copy GuC log. It is time consuming process so doing this for all
> failed test would extend CI execution time too much.
> 
> Apart of this introduce hooks-wrapper.sh which might be main script for
> executing hooks. Instead of adding --hook for each script separately it
> may be used as a central point of hooks execution. It assumes it will
> be executed after test/subtest completion - called hook scripts depends
> on the IGT_HOOK_RESULT env var.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---

Looks good to me:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

thanks for considering my suggestions.

-- 
Best Regards,
Krzysztof
