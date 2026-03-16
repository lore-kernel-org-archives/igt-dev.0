Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD684F506CD
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 13:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7214D10E1D5;
	Mon, 16 Mar 2026 13:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6XOJ2sQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203C110E1D5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773668331; x=1805204331;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I8xvQhfa9iOpuC2zS9JELJwYx7mLk4/U8WZxM9tXQDo=;
 b=g6XOJ2sQjKPArWhWQFoM7bhKJH4CQcYF6fXpxdCcCjmaYRm9AzckHfoV
 9Ambd3ACb2inH/xZYsl3F3oPuqKrDkRUoM/gntSvBKhw6zYUN9IAWyUYx
 syET2ulTuRmKtctORpYElWyCitidtOF/brjmWRu74zQosEDB+gBiil2wO
 NV0aXk4/YgLTSjbetk+lNphfrS3hZm9cVm8pp6OgPkiHxKacrcr0gtJdk
 QjT3PeEHWjKcXBRdkmMF/LVNVjMcPvGIHHrr9v6EjXZ+8Gt3KPDhaPCGp
 QH0Ae/bZfjSFjMy4DOuxNwoYwYiA/9LQ7rAbWwlu/vb9lwDP7kobUF3uL A==;
X-CSE-ConnectionGUID: CRgCs1y3SLenvdW51WYOtQ==
X-CSE-MsgGUID: aaJUef76S0Oxh/eDFJjuUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74600257"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74600257"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 06:38:51 -0700
X-CSE-ConnectionGUID: wL+Gm77GSnKjUG6blT9SCQ==
X-CSE-MsgGUID: NIFZfq5gQ92ihtlOlPbBKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="246782351"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 06:38:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:38:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 06:38:50 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc+NF4j3zpLFYxgZa01FhGwLUcWsFs+9c3CmAzNM232vBJRxRQVWA8CI+S/rMPSmh9lTNuQghKkV0YeLgJvO/AHJQlAgB9YuqJ5mBZiPnABTV0JuEfBtzYJXm5hSZ2DF2DSO3rjN/A+hsZrAUursw9KhrYCN8y+pedL4O0ZmggSv8M//DfAbAZ65KLx0QopFZfUC+0o1wxpPR78KDnPnR3o8LtlUs5g2m/MThw5pF/7EhdyMcNMgEb5LHEc9Iw02txmk2NKUkGbeRbqi4T9hluIK7Nz8Eg5DfiT6Q79sFp3OVdjrFnc+KgfWwd9KvLdGIfGSpFANX/zi+5dLqjd/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzxIrmoP/3FS6BOcTfglV32RbeQBx/0hCopFptYzjE4=;
 b=RqwUFoxz5tryfKzmSz0KX7F8EqZ4hshF5LygrtL7O8o7aaivkRxj2+6zdDfeKxw3MXN3xaKzdJhR9tQBoi+2g6eamlFVFh41RzqMhckQpUykAWr4pp2jxEwqb4sH0LKlQCzD9QfnBY1F8mPlv3r1YdrhsCToEhQ+at0QPLbfbKsNDjDje/lIVS6JtSqpNqooiQuBtD3JpvHJXe60KIcDNnsrKEFBG4vbaEzrza++U79Xd0/aY15tfIlsimcLY3ryHvlV7Wc7eQ8Ur35bQ/3w7WdfePbJjFVNb967l/StI/QzJzuA/ID9WOMsQazHj15zCoXRBWgSjRwYIvnY7Rp+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) by
 SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 13:38:47 +0000
Received: from DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129]) by DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129%4]) with mapi id 15.20.9723.004; Mon, 16 Mar 2026
 13:38:47 +0000
Message-ID: <43938028-7492-4309-8c78-d661c1b14452@intel.com>
Date: Mon, 16 Mar 2026 19:08:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 2/2] intel-ci: Add NVL Display blocklist to
 meson.build
To: Aditya Chauhan <aditya.chauhan@intel.com>, <ramadevi.gandi@intel.com>,
 <himanshu.girotra@intel.com>, <kamil.konieczny@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260313123459.64815-1-aditya.chauhan@intel.com>
 <20260313123459.64815-3-aditya.chauhan@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260313123459.64815-3-aditya.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0195.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::14) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5993:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce2879c-1de6-42b5-ff78-08de8361595e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: YELBgae/X2Jeuuh2ndj0yuUn+6WGqSyDxCd7XtdGagLx6GAm+FtDIvZe8gpNEMuPgWw0Rr7DkdJ65BAujq4P9fraiIR+dftwDGb/brMFwPbmshlxqit7jM/EOKiH16fGoBdEOA4ewnW1eW8DG4CL0mu++TT1H9Wa5hYZa13A8fRW/HHEuvHKFeCXr6qfMpqTM+bCqoQPqitfYiL/RXxA74ItOzWYhV+0r8IWwCmw8Ux1m+VmD2teP45MuQQ0WP848FWDgf23kqqN3BQBRWOTAblwH4RiaAMujr8icQmMqCTeaxbAGPtRyv27sI5BfQDzbh0la1RzTEO1raKcQh/Ki/Jo5dmAKci2ldZ2juRNjpMqIypz+Hha0IjumfrqPpvlRMGMDYxs6cMlZiTfItKXvz0FIDnnRT+aEAdu+wVfLaWVdZUxSFkGh1mkclZcTtzAOs9wW1WebBry2dMuhyTgyoXZSJa9kux4Rm4rWbGwgybRyZz3ScJAGxYM8U+g1OVqkJISVtVStfkPrZqL3Mmlncx7JFj8HyS7RmU/1bOuzdiVYIVoM2XhG9u9S9Z0mcr/MCZM/zvGI2LM5GBQx6AjIQJJN2d5pZKcW5kHA1f4SVju/cmKWPXoT1H/4EL4bKqbTpYvvLelChjRytQEy0drBAoqV0pXHJhLAa++yp4t+tO/T88jHNfY2++rNvBLQw7JF5JfVY1QG0APSsKf6B4yFZg7d9eW56WrALP/L5MeMz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5993.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTdWRUxORmZIY092WnhqVWYxZXJJeVlSV0dIeHVNZEhRUmcwTGVoQUpYZDZy?=
 =?utf-8?B?dG5aTkVUdndjQ2NzRUJoL2FsRUFnaG5SSGE3QlJGaXVnMFpjOEhUdVpBbnJV?=
 =?utf-8?B?U0p0KzM1YU9mUWJwbjB5U1I4WUxYNlJ6dUtCNk90d1JjOHNyS21GNUZKVnRp?=
 =?utf-8?B?NGVzOUJDVUNPV1E5aGlleXd6US9WVGJSWWs3ZGovZlc2Y25rQ0JielY5TkEx?=
 =?utf-8?B?akJ0dGRUY3VTL1NzZXpXc1lHV2ZGclNZWUtrdDdJV0M1dEtMemFING55STB0?=
 =?utf-8?B?NXYzYjBjcXU3MjByUm50M2wzUmdNZktSdXBXS3ErcHU1aitMUXVxT0dRS3RN?=
 =?utf-8?B?K1p0eHJWVUluakFXY2M2UXA2UGxLQTI2S0JqaWZ5djRVUVdRS3h0OUExcEg4?=
 =?utf-8?B?aTdBcnNEUnZkN1VYdy84cWhYZGhBSEdQeGQzcFUwOHl0a3V2VG1OTDlkc2wx?=
 =?utf-8?B?cllkaUg4UjVaTlJwVnlxOFZsdExzSDA1eUgyRkduYXBRRWJqMUVlK013Sjds?=
 =?utf-8?B?YlZJN3VIWXBHQ0NFNHlucGFhSW1pbDN5NDZ6T0tsLzdGdGw3OTVuZUVWVmE4?=
 =?utf-8?B?RER3WGVDNExvYkRCeHMyc2hCbS84bldzeVRNM1BXeFRta3gvZFoxUWsyUlNi?=
 =?utf-8?B?YXlSSG1XMmwzMGdzNHJwT3dTN2dPSmVxR1BFUmVjaWVsdDByWU9pcm8xWmNN?=
 =?utf-8?B?ZjlIRnZXQkUvenNkZkRjNG44aURKWlVuSWwrRk56Y0F3bVVVRm54YjhpcTNh?=
 =?utf-8?B?TlZneTBZL0NZNlg3UUxtelh5eDNzUHZiMzhZT2k2OGs1QnVTVHJKV1ZKVkdD?=
 =?utf-8?B?NytPSyt2QTMxdFNiQ2VOOUpnMmZEckwzR3BxdUhqQWNKbTlqK01FT1JhLzIy?=
 =?utf-8?B?Nk1tOVp2Q0E2cWtQc2xGME4ySi9ISjBIMTFPZHR2Z05hSFFBZ1RHRFU3OVM5?=
 =?utf-8?B?eHpmS2RSSXc5ZUdtUEQyaWlXYmh2MlczRC9qaDJiME4vOWJicDdCcndFQzRD?=
 =?utf-8?B?QTNENEFrWDNmSm14QWE3RFd2MDlJa0M5TkJEaTRCaURGMDBiNzRsWnYxYUhY?=
 =?utf-8?B?czhTSysydExnV0h6ZWZyR0VhZkpWRWRWUUhTY2hMNUlMbkd2R1Vjc2pLYUFw?=
 =?utf-8?B?K3p4VVgvckNyQi9ta2hWeFQyNGN5aVR5VWFJMU55RGIxMFhyZGFoVEFXaXRY?=
 =?utf-8?B?bTIxMzFSTk00UnFOWEIvTmJVZzZRbWoyc2tKaFdNbVJzRWJtM3l2L2VJOHF0?=
 =?utf-8?B?N3poRGtpLzBrSFNBaEtKdWtrYXQ4Ym80Wm5VcHIyZTVSN2tvbGFtcldpUTBu?=
 =?utf-8?B?SEQ3Z25GZm9nSjNzQ3JwelRqRjRpbEpJWU5QU2tDZG5rK2ZFNHUwSXFaM1hV?=
 =?utf-8?B?emxsaHBBNE1nVjFkcHd1RklXbHBXK2Q2UFBqTGpJNTl6aWdKOXlseFRoZ05R?=
 =?utf-8?B?dDBFMlVxeld3UUx1NTVuY2tGTDNZc1FsNk1QNk9Pd3NlTWVkTS9wZG1EM0E3?=
 =?utf-8?B?WisySi9ldldWeFIrR1VySjdpNHVvWFZ4M0oxb2xuc2x5clQ0eXgzWnNENkV6?=
 =?utf-8?B?L2t4QWdkaHdndG5wRjkyVGpuZFhDcDBIMHNqbnZEZXpJVTJLTVJXUFQ0cEdB?=
 =?utf-8?B?Y29LUzRLb1J1SmJaNEMrcHp3UXdHaVNleURnem82NXl2cFpDR1p3TW5NYU1S?=
 =?utf-8?B?VDgycjI3RXJraVpXc0dZaVUvc2JxMnc2Y0thT1RyTjJvaEcxcXp5dHpTcmZS?=
 =?utf-8?B?dVRCTU9uSUQ3SVJIYW5HU0tRRzhBU3Y2dWpCNVB6OU8vN3RXak13YTBWazFx?=
 =?utf-8?B?ZG92WnA5UnZqUVQ0SlRFNjUrR2pYZUtpK2sxRWlZYzZ6aHVCR1p3aytmNUpq?=
 =?utf-8?B?VUluWTJtSlg1Z2FQZ00rVU8zSEUyOTllOE5PTGtQeG43cmxHV0ZIKzlNVFVW?=
 =?utf-8?B?QXJQNEZ0VU44V1dmYjBvNDE3TnZaNUpxTjBoV3lwSU5XWWwwSjhlR000bHYr?=
 =?utf-8?B?YWpBWXR1NEFVWXNUM3lCYTRpeXNMNHViaTJyd1VBY2Z3bk9PRE05RnMwYzdz?=
 =?utf-8?B?Q3VFOGd6N01BT2t2WFIyc01kelpFU01xVXMyV21MOU8zYkhFZVRxSzhFTmJv?=
 =?utf-8?B?S2p6K1ArVHI5Z3ByVEhyWFE0aXB4RFR1bk5WMEZ0RVpwcTlyVjB1eGMzRGww?=
 =?utf-8?B?M2pRbmRQdkFFc28vekVVVmFJbVJZMnNzVk42N3JVT0VWaDZpbDdHSEJlMFky?=
 =?utf-8?B?T0IzWnZqODBPOUkrbWZSUWxpVUVxb2lOd3hWcXV2dVpsTkdBRlp6OWhuUDJn?=
 =?utf-8?B?WEZsMms2Zk9mUTdWZ0d4S2t6bGlid1lWL0Q4NWNpRThrY1kvT1dpUT09?=
X-Exchange-RoutingPolicyChecked: LpWMwShoj/zgOk7nfLcl0+AcnHBHKE6sM2SHm8wNgMYMoZ/PlhqqMN4HlUa+rA+mEXzdcwEjxN21t35XTuzNXtp6LaOyCVHYsEjoJeX/qR5AvmqgxJPWPTchZ/0o2jNffk0IcRf+cEic9uPW7AqkaoN1XF3VnZQLYVgC6apQ77/CQOnbTwjwpG63KUoSJcpaTmHg5SWdQwYl/31r/lQn9yL03flvbp4UWfuVWXu3Ho9grrxnjEy0eV/BtcoWisiyuPD06y4DgekMa4r43iKOD5AzX0AIvEEXozrZdub6pltf+WEh9RwV2uo7G4fxGzpdzAnwFRgfS5kv5dcIxDzbdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce2879c-1de6-42b5-ff78-08de8361595e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:38:47.1693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pHvsygAdaD5mo/xJeg1iyHLZIYvGNV57PM6Pndp8zrjwEkq2aRRsstLmqsJ9o0qRXwpDvpzyFNu4GItmSEMhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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

Hi Aditya

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 13-03-2026 06:04 pm, Aditya Chauhan wrote:
> Add NVL display blocklist to meson.build which was earlier missing.
>
> v2: Make commit message more descriptive (Swati Sharma)
> v3:
>   - Use correct subject (intel-ci) (Swati Sharma)
>   - Add blocklist in alphabetical order in meson.build (Swati Sharma)
>
> Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>   tests/intel-ci/meson.build | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 3c7fa28b7..2b3266bbd 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -24,6 +24,7 @@ intelci_files = [
>     'xe.lnl.eudebug.blocklist.txt',
>     'xe.multigpu.blocklist.txt',
>     'xe.nvl.core.blocklist.txt',
> +  'xe.nvl.display.blocklist.txt',
>     'xe.ptl.core.blocklist.txt',
>     'xe.ptl.display.blocklist.txt',
>     'xe.sriov-vf.blocklist.txt',
