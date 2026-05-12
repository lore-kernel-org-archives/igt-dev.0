Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84D7CD37AC
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 04:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5785E10E23E;
	Tue, 12 May 2026 04:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCv+fVuE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB9B10E23E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 04:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778561012; x=1810097012;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UCQAxv5ewi+MvvyZzIulhFNQD2AqKmAvluy5ULA1+54=;
 b=YCv+fVuEzEhugoHRd698wRzAVv7V4Zf2DD1v2+DluXlduDLgKbDP+TOT
 bYCJzePQHoZ8mJla5+SjMKNlV7kSjcaOlmRAXlor8Ble9mti5vxwujSXL
 wljoa1S2DvzWHUcubTK8JhfcNmxTbvuyAY5+IRHzoaEVJXimESp/4J71M
 cpu3KZFFmVtjiWakIEiDkkczaHh1Sz4BxKIcGGALPuvtRgBGxmTyJMKfM
 Afeb+FHMRft02Sudwd8QjYl1Iz9vVPj7Zw3M6XgbnXO85tJ/lTNWaf38U
 CkaAXLmrhcqR4n+gYh/7gbR3T63QBT8lBHWyk+dYBQO99oZRsRWZyXiZ3 A==;
X-CSE-ConnectionGUID: Wh7Q5oE3T1WfY8s2hoJUVQ==
X-CSE-MsgGUID: O0A4ttlvRdi5LIJPoZdTWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89763861"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="89763861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 21:43:31 -0700
X-CSE-ConnectionGUID: 7KlAQfQUQgqw0R7D+C4AbQ==
X-CSE-MsgGUID: kxAz5b+mQl2/4fuVIQe1fg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 21:43:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 21:43:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 21:43:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 21:43:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BorLqtAL3QkyQm5ThnVs9vPNJBX+AtL7RZ4+2ZROuSNf/MLnMN3C38MmmCyf5yzq5HLURQBzw7qDFdYbeD9U7PH2dZjDjBeIK9XOD66/wDxSQX5lC3zhVTTMVbJL3GADvpThP1KXJSqtmIx7wdoH/D3M+RXWZuWXuJ228Xw+kK8iKL4WpazkOE3VBL4GJElUqC+i5WFwkcykMQxJmxh6cnwVXsRYbPNhfoA+R5lBLSzN6VO3egobjQj9YJ6pzp1YAJ53Qr0PpDUXkWNhYEAUN/TQJFnb+oS/6SppX1ikEU3R/FJ8gXS2qRPCd/zWNEpYFQ4kMTfakDZjSo7Cj9XeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSNYbIsUcgjFKUz4+YZGs3/w7xCh7UrNFSYVsWbE9mQ=;
 b=If2fiCSgzU/r5HiVJbSpNpvlc5/zJfoTDhilRUd7YBPE7lEZy0+uhN/IaOSSk7wgW2HWbTwgU7eMUjpiRwCIZC6fnh5pwco2yuBUCaSmRMOTncBXRq/CxIFsos4HcZjvuDdEtTDT6TxqTwE9xkylCPEWuDI7dhb/oGItMyqh9+flp7jedgKBlNrPOVSquV1FgpsyvTna5D6OMhFKosjsQXtrclTe4cLtHN7UdeA1CIallfvPu1IOmauubrAvgvVGTyHlS4wxolBtl2MrSWkpxO+bzyivnM1L+Mc94bZg7Yi8g0phV/dZR5pre6nBOLwbp5y6J2Eo1Yu2AC7LwyT40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Tue, 12 May 2026 04:43:21 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 04:43:21 +0000
Message-ID: <ba0564fc-1fcd-45cf-99a2-f4cb997ad09f@intel.com>
Date: Tue, 12 May 2026 10:13:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_content_protection: Group all
 force_hdcp14 tests together
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260511034137.93127-1-suraj.kandpal@intel.com>
 <20260511034137.93127-2-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260511034137.93127-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0270.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::8) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: d10dea68-1562-497c-1e2a-08deafe0fe7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|11063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xRbbd4XW4E4GIcSbiluFO2c8XeSUE2aKv7FKL90CF9pZcwctK0XpFmfqGYHtsJdv/xpZOP4bAuULSOGznxC4VUxv3ZV/c7CQpy9IRSW8MwI/SzC/THE58oOE2U55P9MsX1AoxFCx/1ySb+vBUqllMAW418QCvQz/M7215TLttRuMMNpUtXjDl7JexwYgnf4G6AXXOUVhYvHX+hWuoPV8QX3aAUcmBu+VdXKnKMYbaXVNuLA75SwJB+BorV2muaI2EaW3AOiKbeToN+LDexvKF89V84C2o6096+OCwQ+xrIkjGerkcRJ9quSL5MJK3lq+YUiRacRVZbNl3x1jWhLM3J45nO/kecU91Q3mP+sVH/LR8xNmg9M6yUEXsfLoxrh/9HiV+NmUdqGaPQ+CiNxnZwYEqxo5/gr+GoFGMDmDgJzp824d2I6bWI/XYLud1hi1wXNiHJG/XxAy7cLkU5+xCzTRrA1fSwUH3BCL4JyoVU7UozKVMnjGdz6tiI9ubODwabogR9RL2SBkLOEE4fnRqNW9dB/wFDunyZ3I+uNCWqcPjb98W86fYEEoGCLmUg2YtHk+4wNJI2nKvh9IJ64iZQpRNdV5rMhdq+dXKTrKMLGQZYr/d+JbGCaIXq2v/+cFHs4wUc291+LtlW+0aTMagJXsR3z4KcjK1NEqLYD0mrKlUoOdRQtxBPQGewXoVBR/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(11063799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVRlUUlJUWVsUUE3QXlOU0hQK1RKRnVTamdKNSsxQUFBd1UxYzVSTmJSb1lw?=
 =?utf-8?B?REh3UmdXTVlOTDJCU3d1OWRWL2RWUDJHeTVjS2FGeUJBNXdFMUhqazZGdkg0?=
 =?utf-8?B?ZkVLYmNORkJwTUJveTBRSVVOMlVsQlpTUi9aSW9YMXVhdlBTOHBHUTRFMGd6?=
 =?utf-8?B?YmZnaTZLR25VSG4yYWhwNklGTmVQRGFOOE1KSUgrVnUxNVhBWnAxWTBwRUw5?=
 =?utf-8?B?dWRCWEpMWWl2V09ZWnAzVGRYZ3A2RTYxck4rS0R4TUx3RE9ndTQ3azJpMlNw?=
 =?utf-8?B?U0IwNEhZMGNHUEtVTmk3aDM0ekNFVy9RTTZ6Ti9oTmU0YkM1c2tVaGpBTmpY?=
 =?utf-8?B?c2hoM01oRC9yUXdhRnJzbytuTCtlMEhSS2U4TDFHU1k4MUU0Y1UwMVhhU3Bm?=
 =?utf-8?B?aGhQc1ZORUZjYTYvREdtWGw1Tlh1c1EzK21jNW9uWnU1aWF0aitXY0hoSVo0?=
 =?utf-8?B?RkMzdFBIUHZsV29qMExmT1hiVEdUNm1xdm0rSFp4ekZkNVJMZWFydktsMXJB?=
 =?utf-8?B?WFIzOTNRd1A4d0lEZG1vLzZKTldKMXdRd01vMUZGY2szVmlaaVk1MHFFcXAv?=
 =?utf-8?B?dW9uYkhzV20vVXZPOGpTZVVkelpqMStKeE82MVFSSDVHMjlMMVBZZitIQ0Nl?=
 =?utf-8?B?QXNoWC9ab2NkUERITmlPTEcyMUtCL0tURXJIZXhBRDdjaWkvbElWVjJMQklo?=
 =?utf-8?B?OEpBcFhKbE9Xa0drODNtYkgxZUZtWUE1WFNCRTF5V0ZJa0FhZHFUU0R4QnBk?=
 =?utf-8?B?Z3F2cEVvOU1pbDN1NmgrWlRzWnA0b00rMnJmNTF6OHQyY2lrU3U2RjNNd2Q0?=
 =?utf-8?B?TE8wSkxRSmx4ZWk1NnpWWWU5OEd1RUFrcC9qVmlWT1VlS2VEV2xseHpEbVAr?=
 =?utf-8?B?U25qU0VRT0VVNXMvN3MrV2xDdno2eThsVEZXbWtuR3ZybU51bDlyZjk4R05j?=
 =?utf-8?B?TC9nUDl2dnp4UlA3eE5kK1FIN0hrQk1BK3RSR0dIQkFYQnFQTlJWd2trWXBy?=
 =?utf-8?B?aCt6R1pGSzhYTXJ6UGdkeWpCSDhlcmprVDhweXMrMy9IK1RBUDVPK2EvT0tK?=
 =?utf-8?B?QzBSb1RGYWhFenU1dHkwa1o5V1NkQnhYWm5RUG1tVHkxaG1icHlHbFFxV3dW?=
 =?utf-8?B?dmxyYVdlODV6RnY4TmhmSW41T3VUb1I0UjFRRUw4T2tKWlkvL3lLNERXN2tE?=
 =?utf-8?B?RG5uVFNKRmI3TFY0MklwbTJZaUttMEQyT2RLU09wYWhSUkVTdllzZm43NHJK?=
 =?utf-8?B?Mm96TFZJdzhxc3c1MWExVk1COUNqNTRJbTdXMktRZmpGMG51MVZWRXI4Rkpm?=
 =?utf-8?B?Y0xPU3lBUFVjaWdLcHkwWm5GR05ydUdnemdKSUg4ZW5CM29yVUd1YXRXNDhk?=
 =?utf-8?B?OExiNFQ0MkdYQnNuWVFTV0wrZlNjRk5semhXVEppcTF6a2lUVUx6ZUdMbE1U?=
 =?utf-8?B?dzFoeGtaUEZvK0I1VVNCaUd5a0VxZkx3elNVSjJHVXE4K1VuV0JYdTZ2M0VR?=
 =?utf-8?B?RDJMa3JiOGJ3czNVRHVNZFJlcWxYSHRPeGZwSlRhRnB5RFZEYWNvWWYrdUE4?=
 =?utf-8?B?R3ZWMmhRb0JsOUlENE5HWHowZVNPSGhYMFk0d2VybXgxbGVPM0hDR0dGN3h4?=
 =?utf-8?B?OU96bkhJbmdoZFF4MnJkUURZUVM4N2VJMVUrUmlCcVJyR3UzUjVJZ3F3UXoy?=
 =?utf-8?B?Q0dUd1EyRFZlb2MzTlRvN081V1hWR0dDdGpRNmpLUXNWb1RhbndMQTIzM28w?=
 =?utf-8?B?c2NGY0VUZVpYdnlTdFMxSG9uR0tqemtGMGs3ZWNCOC9JUkVNdDd2MXF3VXd0?=
 =?utf-8?B?UnRtVmZ5U1lCMFpzWkRQNFdrLzY0Y05MZ1VidHk4WExscFFrTTFpQk1jd1pk?=
 =?utf-8?B?T0VwWWJRQWZHNVJ5Z2RTUU5hbWpUcVVhYWc4Y0V0azdWMHVyOHlnZ213WFBs?=
 =?utf-8?B?U3V2ZDUwSlYzOHBHcHRXVWJpSFMrK2t1UUdWOVptSjZTYjBZU1dKREtHWWZH?=
 =?utf-8?B?SW1DMnZSUDBkVnRON1RySEpNd3kya3AvM0x4ZU5LdmltcmxDeUx1VnRoQ1NO?=
 =?utf-8?B?SnF6TWNkUmtwS3QxR0NCQzNsWGRUZGIwc09jMlVvK1AzblpBNzNwcitxTmhS?=
 =?utf-8?B?Z3d0R3p5UzBoWVpFWWxYVzdyTGZRaXlpMGJ6MFZKekV3Yk94c1hvbkszRXlM?=
 =?utf-8?B?ZUorRklpU254MWp3amdSRE83dzh3czNGQmZGYWVRUlpQVFBWbFpyNDBEY2Jz?=
 =?utf-8?B?bTJjYWVLMURpbWJGS3NWL2FPVDlkWXhlQ3lyNGpEOENiYzRTWHhTdmJpQ2do?=
 =?utf-8?B?L1ExQmNhazdhSzhyamRUdEtOVFB5OFhGVkNDRDRNT2lCVEdYcklmV2Z3cTRI?=
 =?utf-8?Q?GkBrBGO3gy556R7BaemkBGt8INWYCN4fCGVsn?=
X-Exchange-RoutingPolicyChecked: HQAB5E0wY5kt53lBM1BjbAIl8twuNoxmX7zvtfEkwuZbluyFauIgi4JSXuNBM1oGoqG6lJ5D6EiE0O5VMtiukxaqXoIgamxILtJ8F2SdcZbqsm/ZloINc3HZfRhEJbHuGHRjg71/i/NgD4o1qmKKFs2bouKopHKSCZIFvK+AtoD3quOySvcMjZSgMqrrCf3TB8aeL/jQbNTzwfs/pY+RcO5pbgYq7PpA6YN9tGaghcjblq2bVGyJ2uYgbJvYmitq82dJzdR/9sdJ/sqL8vLDFvh0VdewEUmz4iFL/HYH9B7aqHo7WCr9yYhCq/bn4dz7NzZJVBMma8FuO2BDohbsAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d10dea68-1562-497c-1e2a-08deafe0fe7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 04:43:21.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCSb21y09iNu9wR3WLXxWifpKI9ISl+A9TJxFDI7DkCk2MHIDssrfFzybQCcYNDvKH1ujRyyY/Da5yHgCkx3qAEXdvkKWOCvX5P/ejQgduonSA2upd/YJ1HtbpF+N4Md
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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



On 11-05-2026 09:11, Suraj Kandpal wrote:
> Change ordering of tests so that all force_hdcp14 test are run together,
> that too after all the regular tests have been run.
> Currently we are seeing these tests are putting MST DOCK in a bad state from
> time to time where it can only report HDCP 1.4 after running these
> tests.
> The only exception here is the DPMS and suspend resume test which are
> run last since the help MST DOCK to return back to good state.

nit >> the help >> they help

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/kms_content_protection.c | 64 +++++++++++++++++-----------------
>   1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index a42f699e9..3baf225cd 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -1025,42 +1025,17 @@ static const struct {
>   	bool content_type;
>   	bool is_force_hdcp14;
>   } subtests[] = {
> -	{ .desc = "Test content protection with atomic modesetting with HDCP1.4.",
> -	  .name = "atomic-hdcp14",
> -	  .cp_tests = 0,
> -	  .content_type = HDCP_CONTENT_TYPE_0,
> -	  .is_force_hdcp14 = true,
> -	},
>   	{ .desc = "Test content protection with atomic modesetting",
>   	  .name = "atomic",
>   	  .cp_tests = 0,
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	  .is_force_hdcp14 = false,
>   	},
> -	{ .desc = "Test content protection with DPMS ON/OFF during "
> -		  "atomic modesetting with HDCP1.4.",
> -	  .name = "atomic-dpms-hdcp14",
> -	  .cp_tests = CP_DPMS,
> -	  .content_type = HDCP_CONTENT_TYPE_0,
> -	  .is_force_hdcp14 = true,
> -	},
> -	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
> -	  .name = "atomic-dpms",
> -	  .cp_tests = CP_DPMS,
> -	  .content_type = HDCP_CONTENT_TYPE_0,
> -	  .is_force_hdcp14 = false,
> -	},
>   	{ .desc = "Test for the integrity of link with type 0 content.",
>   	  .name = "lic-type-0",
>   	  .cp_tests = CP_LIC,
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	},
> -	{ .desc = "Test for the integrity of link with type 0 content.",
> -	  .name = "lic-type-0-hdcp14",
> -	  .cp_tests = CP_LIC,
> -	  .content_type = HDCP_CONTENT_TYPE_0,
> -	  .is_force_hdcp14 = true,
> -	},
>   	{ .desc = "Test for the integrity of link with type 1 content",
>   	  .name = "lic-type-1",
>   	  .cp_tests = CP_LIC,
> @@ -1093,13 +1068,6 @@ static const struct {
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	  .is_force_hdcp14 = false,
>   	},
> -	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
> -		  "sent with the corresponding connector id and property id.",
> -	  .name = "uevent-hdcp14",
> -	  .cp_tests = CP_UEVENT,
> -	  .content_type = HDCP_CONTENT_TYPE_0,
> -	  .is_force_hdcp14 = true,
> -	},
>   	/*
>   	 *  Testing the revocation check through SRM needs a HDCP sink with
>   	 *  programmable Ksvs or we need a uAPI from kernel to read the
> @@ -1115,6 +1083,38 @@ static const struct {
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	  .is_force_hdcp14 = false,
>   	},
> +	{ .desc = "Test content protection with atomic modesetting with HDCP1.4.",
> +	  .name = "atomic-hdcp14",
> +	  .cp_tests = 0,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 = true,
> +	},
> +	{ .desc = "Test for the integrity of link with type 0 content.",
> +	  .name = "lic-type-0-hdcp14",
> +	  .cp_tests = CP_LIC,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 = true,
> +	},
> +	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
> +		  "sent with the corresponding connector id and property id.",
> +	  .name = "uevent-hdcp14",
> +	  .cp_tests = CP_UEVENT,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 = true,
> +	},
> +	{ .desc = "Test content protection with DPMS ON/OFF during "
> +		  "atomic modesetting with HDCP1.4.",
> +	  .name = "atomic-dpms-hdcp14",
> +	  .cp_tests = CP_DPMS,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 = true,
> +	},
> +	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
> +	  .name = "atomic-dpms",
> +	  .cp_tests = CP_DPMS,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	  .is_force_hdcp14 = false,
> +	},
>   	{.desc = "Test to verify the behaviour of HDCP after suspend resume cycles.",
>   	 .name = "suspend-resume",
>   	 .cp_tests = SUSPEND_RESUME,

