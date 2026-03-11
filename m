Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D63FCC9B1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA5B10E31C;
	Wed, 11 Mar 2026 06:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVoWmArf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9B010E31C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773209382; x=1804745382;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r0R9Tgih3rfeDzzAv05MJuGv8cGBs7bRUJfLVswB6dc=;
 b=nVoWmArfxVn3VQUemT1dx1qVUxoZFWqP5cvcxyOzjMcYXs5UlREV4Ome
 gw3KmiD/Pl1viMwOxvfUicmBIP+/XwBEL6EERHWR8y7dsz5RbPTRdxxUC
 qhsagGxylDrkI8a+w3l4XDMJGWfqkXkh5/NUuJB3Gk0JuKFUHPsD+5uWm
 PXRIyw1nqljTLlopyMk4SYEiObKiNiJsOMU+0DjR3x8hjKHJUWWbZsuqA
 Mz546Uv7LT3ObH1ciHvg22ENmI66P2DXw9ehOG13AQbXAsArg4TL8uM33
 kBjtnGjN2LWtiQPY3c3wtQRVsLMnhJLgUDrL6UBiYEKnEo0IlJPK9qj/Z A==;
X-CSE-ConnectionGUID: d45nMhxISd62HCY+c1AfqA==
X-CSE-MsgGUID: CaRlmnXdROecOh2zRtVOlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99734997"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99734997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:09:41 -0700
X-CSE-ConnectionGUID: sqX4T3HbQDO7rHTISjoAFA==
X-CSE-MsgGUID: 8uxOEIQgR8y88cr7h+Loyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220307379"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:09:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:09:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 23:09:40 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:09:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycIwhq0MgBypl81Ex71nB9o0rpjbSfhbBggbjixE7oQNfWe+aViWCsLcrMp1ohEZpBR7O2BUYS08636kPr62echbP8vHzoM9mNjAbQJeD3YHoUvn5eOZVBtBKXImDbkgSGIoox8aCQtc+4wbiph4WqxrhFfFtUX/zNp4i1HPmnQYb2Kbj+cgyINNxp5MF3FiXt0FNrjYycWPdko7TXIpiti1n7f//GF3u4G/KWZlLo5r+ZiiekyUWvNK0hxWGhpp18AOWncuOGzKO3xcYDIQQoPY/uUMBa+nsYfPBy5ngljC5xg0J9gVPAPEqiVUSgRRvTVonsifbOvObvOqGA416w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRHn+/qgfgL9ooOtzM2HUSYAde5Ojle3Y9zV+vIFI5k=;
 b=Qq74wQuVKTAVdVCWH7gTxHwusliDsPoFbLqdeTzF6u/VzBlfqo1j3eBn/ehG+S9fDnP5BOipWtDj/Cs5Yo+zG8UYgV8vZXIAvkNZDNqABcByD+7poERgg6tBFGn1bSD7nvgJT71RrQqPkIa2xTh1TktqIAjpEpByIxg7WzRItoSRZPM0YkD/iPb0f6e8w3ZqvWHnlI0fxTgkqqlnvHnKU/eSOybl1blFc+i7+8IsDPZ5Nd8y7k63cePCudONxPRE34OK2iHL/HmYH6zyWidPhHYvtSPrQBFgrWq2hp7TysNM1sO7xwMHJEBWkxVK76A5XByl+ZwOZShxkah25Fo8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 06:09:30 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 06:09:30 +0000
Message-ID: <29b62665-0fb7-409f-aa22-01779ae40490@intel.com>
Date: Wed, 11 Mar 2026 11:39:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci : Add async-flip with linear modifier
 subtest to Xe blocklist
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <arun.r.murthy@intel.com>
References: <20260311054747.1230383-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260311054747.1230383-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|CY8PR11MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0e862c-03bc-4d68-95b0-08de7f34c200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 9f/3Hm4hUWT5+IEhtdxAest2MK4IMHc5bSjaNLrDWyWPswOKlk4ZA6jS5ecPxesP9Y1t5XFKUtgaBY4BrN3EHiofLNqo081GNcusmkmNH+NITI6CUZZocH3KWmlMsgag7b/VliZJmpX9AZ0eEcjAWymcU34x6I1euEThYZGEy9uo3TGblBCCXi7T7Y10pFHSJgcWsvhxFUCgwyVhkP04EFnrfpEpPLIK2x9vJoUDG4KPN/R/Juch4sTTLw0k41sihDLh8Jcw2JSM28+Qkz0WENE3cw8cfOg318tS+ZY5UB21V9VvAUgQtqwpOPHTNVPYGE9/Zy7KnCgFxI4gzhyCDsAkrK78zlqNb5kbAEZBwFsBOPxw8qbUKAevWDpjs/hO+b5ZU8i9vw+EjI7zguMp5mOd0C5/tGzLd/vIaqMNQF1vyxME+6/2f7Ny/QWeH7x01ootAqH8T+LcyZpP7waafFHRpnWtsu3oSFqy9Ol4hr8MxPI3aBhwTTM+cLVvK5In29r6ZUrdjDFwiZkm5OPm81pA+zQfqqpRRuyWuEr5bNI307/Z5w0IBVEPiK+w7/tywmiRy8ed3F/vXjWKF39PactRA/LymJfscYHjNnAvfayoAjAk3HXK28LTokduV1ITbRjw+6B0rToE4z9BgZFEwzSVDp2mvWDztgb5kNZusL5GsuCbs29Kn7Bk28pTPRzOHcm/Nz4qmODi5nXrU/hZ9FSOW4cK+UQ+5TtASSys1Jo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1hQTWx6Y21nU3hFbXAyUEVNQ3B3cTlBZ2lQUlRuTFpVQ3Jhekp2T0loQW04?=
 =?utf-8?B?MEQ1QUhHc3NHT1pxTm04L3FGS1FuQnBOdzArR2N4SE9veGhxaEVjNkpRNm1l?=
 =?utf-8?B?L09hc2MzSGZQMkJHOGhEYUZ0TEJlQWpTbFFmMjEzRVkvaTFnZGhyZ3d0ZGV1?=
 =?utf-8?B?WUR3QytucXJWK0hrLytaY29RcEI4aXhuZ3JEci9xRkc4cHYrQ083eGRlTWNJ?=
 =?utf-8?B?NXo4R1NybytUNWhKRTY1cmQ0QXVCcTBhWU9tdHRBRkc1Qkt3L2ZvdzRDYXBp?=
 =?utf-8?B?bWpnb3JKdDlkSFJLUm80ckZJSlcxelNzMHY2Q1NjSm9iZUpldjRVcTNNMlRQ?=
 =?utf-8?B?VnFrbmxhRTdGZHlERjVUSFpoRThGNVF2V3h2a2ZPSW9HeXM5a0pwZEZpelRS?=
 =?utf-8?B?L1Qrb2hPM3gxS2s1aWw4aVdqcVBSSW9kbGltandVRDIzeCtaRGNkMTZuVTZP?=
 =?utf-8?B?bXNTWHZvRGZES09KTUpkNjRndTRtam1wSXdaWGJPTGpJSVg3YWRVcjRUZ2JF?=
 =?utf-8?B?Y2RoM3FXN2QveStSakFLOVJSZ1J2aGFvVy90ek5NTFNrYm1PNlgyNkRrYW1L?=
 =?utf-8?B?OFpsalowbWtacllwRDRPK3gyemVUdkFiTmJlMStqREoyY213OXpQUmxTcDlt?=
 =?utf-8?B?VFFOWCtPMm1uaWo5SUtTYW1ab3N0QS9sbnp2YWZMbjBUeVhSNmZnbGdudmxZ?=
 =?utf-8?B?Mm0veUZGalVVTkhKajlFWTdOQ3gyZyt2UnFzTXh6dDA1dE9RaTRjc09JZzJ2?=
 =?utf-8?B?V0xIditkZ0dhVTRoWVdkeUZkZnFmYTlveTRkcksrakt4cHlBRmpWdnVDanV5?=
 =?utf-8?B?Vm5zb1lEdkJZa0EyV1YwY3lmL0ZXSWtnZFExSjlRUjcvd3NOUGlJazlnVFdI?=
 =?utf-8?B?YVV5d0RGQzhwbkZVdUhSYndVdlMzQmZPcnh3ek5TVzlSeXc3T29WQVR0OWRl?=
 =?utf-8?B?ZDhoSzVUTXd0NmZCNG1obzZCYzNaYzR3L01OTGt1MG1EVjVyTU1NaHZnMlMy?=
 =?utf-8?B?VHNKbWhCT1RPMTVJMDQrK1ZjUFo0ZWtxSnJPMVhPWHMyS0ZoUmZIRHJJR2pY?=
 =?utf-8?B?d0xjRERRRHBmOG04V29BZ1ZQQkExemRjZE95REo4Skw4TXJCOWQ5REJhWG8r?=
 =?utf-8?B?dUxJNlpyRGV0eGszeXUyNzlCY2lFYXB4Qit3NWJUQUlIYk1RVHcxNG05bkZ6?=
 =?utf-8?B?aEdPNHlvejZ1TVdiSW96K3dYYTdtRGFsRDh5STIxdDZSNVpyTDZMSzRvOHJs?=
 =?utf-8?B?MVJ1QTRRYWVoajlEejkxRlVzQlNDRCtKUEpjaitobGJmaVo4SWFBKzVOcWNC?=
 =?utf-8?B?S2hCRWhlNXhTelA3U1pFNzhBL3JlUEg1ODI4SitSTUt3TWM3dUwrWnZibkxK?=
 =?utf-8?B?YWNKUE1keXJ6WkxYeEFvN3craEVzQlBuK1BMcHBzdGkxNTVaU3VhLzljakNV?=
 =?utf-8?B?ekJ6anNpRTg2VXhKcWpYR1o1Q1ZveUlaQzZ4QnhuaUozR3lhRnZNbjczUTBM?=
 =?utf-8?B?TlkyVWRQTVlxZUI5UkRFb3lraGt3TjRrVGRNVldGMmxMdzd0dFZyTjVUZU1B?=
 =?utf-8?B?UTJRci9zdHFJVlJuWlE4Y20zaFZ2VmhTQ2V4bUprL01zVlpmdzBHYkYvWVN2?=
 =?utf-8?B?Vmt6NFFxMndUcStxSnJDYXFmVHd4ZVNTaGlNem0yUFR1NjJVbmFIckU1Znlz?=
 =?utf-8?B?TEpFWmVMSFgwOXZ5czdVUE4rRzUyMUFGR1J0Ky9RU0hYYmczb1Zsa1Y1ajNz?=
 =?utf-8?B?UFZZbUF6cFJoYU9Tdit3ZXNGQVREaXhQQW1rb1NuaGtGMVJncE0rVTdjZ0Mz?=
 =?utf-8?B?OHNCN3BVM3JhZlZWSHYvTlNrRWpkNGk2bE5uY1lxa0VlU2YzMHYybmJRNVQ3?=
 =?utf-8?B?Z1NMS3JVeS9CZmZaeCtYV2JNaFYvUlJMbi96OU5ZZXZ4Sm5RSTQrOW85NHAw?=
 =?utf-8?B?czZsVTBoaHRqWlJuYXpBRlNyRHBzTkJXVDRiZDVVREZ0ZWxXbW1ack8yYm1Z?=
 =?utf-8?B?TXpGWDZRdHlldlBFcFhZVkEwYXA4Vi9qRmRNZzZZQmRpVTVrSXl2eCtFaExh?=
 =?utf-8?B?Z2VIaW1xV04xeG1SckpnWTFBNG93ZzhDWEdiVG5JZ3Y5eSsrcThFdWVkK2lL?=
 =?utf-8?B?ckliYkFTVHduWUxIOE54dDVRcURTYlhZejl5a0VBZFJxNVlxWEwwNWtMUS84?=
 =?utf-8?B?K1hNZTVjWkJ4eGcxYU9hNlRZcUdiQXordWM5MU5qN05wOWhQZXppNVNGTHJw?=
 =?utf-8?B?M1IyaWVKcVhiTU9pUnJIMERJMEFHYXRHTmpDRmhHQTYxUnlLNFdXM3VFK2Iv?=
 =?utf-8?B?Ymhram8xTUlaY0xyQmJ6b29ELzFMUHhCc3EwVVVNRndSa0NXRWRjOCtlS2Nu?=
 =?utf-8?Q?9zR2UNOJKPDW1tU8ToQlLgEF6TSafnUJgnmVf?=
X-Exchange-RoutingPolicyChecked: Gokz+XNL3OJpHXdqXOzxNDjfijPLjSj4oQ/2ixSZI7wByraHbM2V3xYez4aCQaqeKmAmIVYR3XzLD6BgR73EPNgThMxLwZSQ71BQnII0qexgNjqUzp/UJp0Z5tg+dbD8zW6WuLbkqHerDDkkdCIyIc3GLqnzcqZ/m8f29k4wZawuNTQO8HXJJi3fHb1pZHZJA7cBmn4WXm21+ZiDzs2Hq4ZVJ2EkAS7N7hUpdto27LaYnhKbVbz5mKGXcDIHyv/zCXNAEy4OH/qTMLEg/FVUiC0h4K8RD0ZV4viuBCmo5ZlDNIS8jZMXUj6UkytmQEj0V53q9JwmMHdzzJLMDeR6zQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0e862c-03bc-4d68-95b0-08de7f34c200
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 06:09:30.6213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6f5xF+CDj0soKYQBzWFEpYfxXw8ddL35/tO9IopJ6G4maHWI8+B9Om/tKd8yYBtv0JWDs3HwTHMGWkhy+EkBM1QKjpVSpD3r1vNhJcoP7UKZ45PSovi+bCjyio5ioTx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
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

Hi Karthik,

On 11-03-2026 11:17, Karthik B S wrote:
> Async flips are slower with linear modifier on Xe and so does not meet
> the required FPS criterion. This is not an issue as there is no real
> world use case which requires this combination.
> 
> Blocklist this test to avoid expected failures.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index bd08aa594..edc5039a9 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -123,3 +123,8 @@ igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>   # Exclude one compute mode test
>   ##################################################################
>   igt@xe_exec_compute_mode@non-blocking
> +##################################################################
> +# Async flips with linear modifier are slower
> +##################################################################
> +igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
> +##################################################################

