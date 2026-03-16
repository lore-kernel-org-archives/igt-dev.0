Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9408F013E0
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4335A10E36B;
	Mon, 16 Mar 2026 08:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/3OldGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E3C10E344
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773650751; x=1805186751;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ynj4lol9/E/m3+6gxRQehXJDUCHUCvC7W8TxBAVv/xI=;
 b=e/3OldGv0U8Avtn0bsTnRErKH/MsvwMKc3+ITMg/vbvzcArAF7hWBgMj
 9KU8f99AYq5Jumnvsa6OE+3i3e755tCp/MKUod0YsCjLimZ6mSoj70w/K
 Dnlryu79noEGopKW/q3p63pPBcTq1zf1qnrVDLAbU3PIIdU/gh8fjet+v
 rCbNEqThuxC+C/u71ZJ2cv4Jm+mYbM7oqoL6NVb5zAasA2wnOg1AvAMjb
 vMzitbTJgmhPqa/GXTmGTAgHARaj0Qlz743lJZmAOOTtShitGkw7O8qJt
 jYZpRmlILjmwLfpHvZdmw7CnNF8O+HPUjGmMOxxohnw/ybGL/+7zk4PGL g==;
X-CSE-ConnectionGUID: Aj00wEjrT+KKqEWecMvpeg==
X-CSE-MsgGUID: V2g2RtCjSUaSVdper4gs7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74634316"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74634316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:45:51 -0700
X-CSE-ConnectionGUID: afpAAISuT8y4aTyA8lOsAQ==
X-CSE-MsgGUID: PiRFDvRrTfqcimiHzVbWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="252363807"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:45:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:45:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 01:45:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXgGIq/S/kNwhFk1QSwUAxyKKLk+5b3c34Z8b0vBslYdpANlEAF/jLXluxkhEnG/KhWH6EToU7xllkGpHj4JQGUHugTCSbzc+tNJGXoW6cIIumTfnnb3G0YAkhS/CEf+Cnx/gFQXQfVZ8GGO9HrNrfezeIUmwLA7ZquFINS7kN+e+VLSHQ65OgyAfkfO2So6p8u4tWqwoDEU+J+ltN9DLyKePWXySHyVBL5IzgN+cTDBMRz4JTrFZPVFv+16RoeozM81I5W8ioi5b+fwDmo5PZLJjIlBhVo7Sd5M6go0Lv8yBhCPWcfeRCq5gwOpc7lAZZlLOTXua30/Te0ee+WaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/c4p7D1gGp8zQsiLnecZi27JAlEvcIecC7xphH2xvQ=;
 b=D2RL9CfkluMFHKmfetpARV+jOyD+5cDn41pLRlNEaj6bffKwYTSESGV0IJLMcwl4vst544jS2G9o4U0moGxz+lFjNHi81T+kQByXXQTG09OtNzu8lstWQAV8/cbWg4VEuN44SWBTgvYECkBd+lupgEf3iSI/G69Dhy0Fa+HzNSMYMGm+lwXXng6pCaydu3gkGWaoxHWeSW+al/bNpf2+MJRb2DvLY0OsiA7+eXXYh6fIoSbVekgmN4LLJM3/nctK231CbO9v3UKO5fcgTm3YElbJwFowVgGkKQuGIZX/PYLdJr2GwC956irb+ujr0qtOMiuv07BkUTlukNo5guGc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ5PPFA0B9CD929.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 08:45:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 08:45:47 +0000
Message-ID: <d2ff02fe-b75d-4783-9f2e-c7adb4d571bf@intel.com>
Date: Mon, 16 Mar 2026 14:15:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,4/6] lib/igt_usb4_switch: add helper library for USB4
 Switch 3141
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260225212859.876713-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260225212859.876713-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::16) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ5PPFA0B9CD929:EE_
X-MS-Office365-Filtering-Correlation-Id: 975e7f0d-b12c-4a87-5ca3-08de83386b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: /R0TGJ06MS5C5DZ9MTN320jgizrdqzQRnIOkry0pK5dXNgiwRlySkGp+n61KfZYocqaIRzE4871Xx6Vl/0w/cNEOIJA5eoTvJtq+04w8w+ApkpnOvEKrImPUPZa+7ZU29I6Kmryyu2c9rQrLbFaMw6zeOyOIsApS7/cl/mFbD7Zx7IVHPJDj8aewvGlKAHbeBuEPMOVDHTD0s3gNckw0etFiJBjSwb4kDta8gDLLx+kgIzM+6LIqnCw8XhGVapchEB6W2k5FkZWrDW0zMR2q3Lde35pUpJI/YvGYuRsyUecrxsu4+FhGbnzTYPRIY/uTDeLPqWihfeeap+SEOk9f8oK4sRkHqMoeGzLSuf4Sgi9pxDj27yVzKFzl7uRsgvGYxMWPAAw2nxVPeuahDZl2OwgQcM+7x0t/K+U3ygkZCYXRRkawqEZxEUgFUA9vU1WnWeANnlCuWH8/ceBvCWlKQu3HbBhFiZwf0ig+iX7fvpfNt3z5PoYuybbVxvTC4AeWaD9HPRfkoJPuM7jqUXNSNhIZa6gJStM1NnMfNl/g9vBG+u34Dw7ILyHeHpIRG0DahXPpr2VZlR3wxC1JchSzGzn//bDHGry3O/VSwXHNcO9fwekkPFR0ls7C0s8CdxcBzygUVmUWEaR2XV9eIIPWGHfZDM7bMnvkY45gMfxJo6rE6oDJl2zWYk40q9jn8WW+E4p3vMLy7C21DsPQZqd0Wfqvm8nEX5YwkULq4wtCOGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUtva0c2b3lCNVVWVEY4NkFNUXl1QUtxSDBmc0YrSmRpeGF3d0NOdXBZUEZv?=
 =?utf-8?B?Q1BEdzdaY1ZQT1czcGlSTWI4bVN4U1pQcUUzWEFLTVFzS045NUlzZkVmdFh5?=
 =?utf-8?B?U1hXdFFFVG5OMzlyaDNLWEdocFVXaGZkcU1IcU51OW5mVEhRbVVscmxoek5o?=
 =?utf-8?B?Q3BYZVl1THFSVGZ5U2VRWnBWbk1QWlRYWlFWWHROUmVxR0VUWGJoZnRkbjRF?=
 =?utf-8?B?RFJCZlFOQVU0amV3UnZwa1BhbzV1b0p2N0RlSE40dnRtYk5YVS9RRktNdnVD?=
 =?utf-8?B?NlN4bGpFUHBOT1FReGRaSWhQeXhhVzZ2L0xCZ203OTBQWDUzcEpwOWYyQVlH?=
 =?utf-8?B?dFVjMmx3UG5acWNWaGFrK0ZXOWV3T21OYkpvc3lYbVZ3NmVzSXhDNmQxMVZ1?=
 =?utf-8?B?aitxam9aTVJJSHNWbnF0ZVJxc3pPRlNEYkVOYmdlMW5RZEdRMllyc3lvM1ZW?=
 =?utf-8?B?TWpPYlkyU1JuaXRJT2orbU9SaFJFMHptYmtDbkk2MmZwLzFwRU0wZ0phdVcw?=
 =?utf-8?B?MDNTc29IbnRXblhKNTg0ejBUblNQSXJSM2pqY1NTU1Q1VnVRWnNsa01GWUt3?=
 =?utf-8?B?bERKVXE0MjMvdTQ3VERCSGNVRzRLdmRQSXBSMTFFL1dXanc2MXladktEejQ2?=
 =?utf-8?B?YS9TRXZRMEo5R0Qybm9UL04rYlQvYUNuY2d1YjRWd2U5MTBlQ3VvNlZuVmV3?=
 =?utf-8?B?ZC9PN0RXOFArZ1hzeExQOFpLTURBWGZuVWhCU21MYnowbk9WMVhHRnJ1S2lo?=
 =?utf-8?B?MXJnWS9MV0QrTTFZSHdNNU14QmJSV01FVlNMdnFpM1BxbGExRnRWekFQVkpW?=
 =?utf-8?B?T1dwSkNJcEpWVnlvaGxLVFZRbzVGTis1b1RVbndjRGRxUlFSbGZBN1hkUkNC?=
 =?utf-8?B?cG5oT0sraTVYSmJyQWJWcVFiR3JwdlpuZnQ3aTBpckw1NCtreGZLTXdLWXU5?=
 =?utf-8?B?eXpZVEY2R1ZlNUdaV2hQa0QwR3dQNWZ2SVU2eFMwQ1QyZGVWNHUvRDZBUVcz?=
 =?utf-8?B?eXZwVGhScUcwZURUSEJ3THZPQWJsaTkwbVVQNmZMRG1nT1lvRUhXN2tpY0ta?=
 =?utf-8?B?Y0ozSWwxdkZJQ1V3eHJNMzdlaHQ4Ky8zWXVnbnBrVnJSWXU5aFRoQ0JrNVRn?=
 =?utf-8?B?eitZR05kZHRJeUR0RGxLWlZFa3N5M0Y5TXFORXprcFVKd0kvQ25zV3ppakRq?=
 =?utf-8?B?Tk5uL2w5aitNdHpaQndSMDF3bENrdXVFSzdEeVVkZGlpWU8rMGduNVROSEVT?=
 =?utf-8?B?aWNQSHhKMDlKa2FiMVJmMDZzYkFnT0RybnZKT2pTQ3RJdmwrT1gwdlA0VmNT?=
 =?utf-8?B?RS9VWk1MKytaSUNjbTU0UDl0NDdzTFV5NUtFQStWM1lhQkdDVjdDWGtkS05N?=
 =?utf-8?B?UUV1SEdOR3dlaVBNNGo5MVMrMWQ3VGtLSlE3YnlTM1pJRUR2Um5pRkdkeEZh?=
 =?utf-8?B?TlV5R3FxWWpjcFFabU4vZ05KaGFKRHFoWGxDZjlEemw5cHB2aStQY1cwWHd1?=
 =?utf-8?B?TFNENzhndk5hMVdvam1jTkx5Tzh3cDlqUVJZQ0xsa29DVTJYRXZNZXQyQkZk?=
 =?utf-8?B?VHZQem9Zcm9nVmR3UzQ4UDNGeFdBeVFvRHUzZS9ha2s1VHhDV25LUC9NZkRH?=
 =?utf-8?B?cHV5RnVaQTVIOWJCZHF3MVhNZCtWT3k5OUMvR2YvMlhsUjZMa0ZJMDJIV2ZX?=
 =?utf-8?B?a2ZJd0t0WC9lb2ZaL240V0xzMUJYZk1obWhZMFljVGxMRU45YXhZQWpJSHdG?=
 =?utf-8?B?VWhtYlRmdC9hU0FQY2FFK1FRb0ZMb0Zpd0FobnBUa2RVMFgxUU1sTXpzZUI4?=
 =?utf-8?B?WmRHVVZDa05vaGN1T2FTY2dzbitvdmovKzdycnJIVTExQ1I2OTdPUzJRd3JD?=
 =?utf-8?B?WEV0eDErTXNuUytLTFh4NGdxVUVFVWgzbE1MdWJqRmVueGF0L3BIME5BTnhv?=
 =?utf-8?B?b3RCSGpDWEppOVFyRDRmVytNWXJLZHlRTTBtZEhhNXR4bFlRbzh4VmkreGxP?=
 =?utf-8?B?di9WV3VuWXFFcTZZcml1VVFicjJjSWpyT3dmdEo2ckc5ZDNOSlJoZFBXNVYr?=
 =?utf-8?B?YnQzNllRT1UyYUpIRUpXdTN6eXNGSk5xbytKeWZzTjNkd2gzMEhmQlJuM29h?=
 =?utf-8?B?UThVK0kzL21WZnJXTTZtV1AySjNSbUpZQkJuUWNFUWxYM1Fnb0hMTVF1SEdL?=
 =?utf-8?B?cmRCT1cwZWljR0N0QnhkaGRWR1YvTTFsa3pOREo4dU1rTzhEeW5zN01WUjhT?=
 =?utf-8?B?UHU5eXorU0ZENDhrSlcyWVl6aEg4dXBrWlFiWkVSSG0yb2FXdTU3K1ljeCtQ?=
 =?utf-8?B?MlpHV0dEVW8reXh4bzRsN25BNXVFOUhyZlRzZzJXYU9oeGlwcDZkZTI0eTNQ?=
 =?utf-8?Q?E2tZTLSiGIykc3r4=3D?=
X-Exchange-RoutingPolicyChecked: uaP7VCac9zCFvAy+8h3P2Cq8yivEbmyL9c7HQPsDOYDW8qhEyOYDm1zdbiHCCZVIbZM6wAhWFok4ll6DzH3hPYD2YvHc3YaHrms+BbnrDevoLM9pbQGTQUS+DcnaXjUGgoGCUOcKnINjzlJ9fpHZ1vQzKMicn0L62gyVNuVIxvFvn5cadv2AHdSrzwwyPoN4fdN+FLe1p0ZocD+rqLkTyEePnKEFbSohqRQU+VgE45h0pH1Lbb8/Eioqd020H2B7IRjBhf1Zd1ZO0hjuqCnF78wmwn5Uf/fnOd4PNa3TBU6LJuMR7WVBJmJ8rnrjYisu66XAWxk0YwH3OCisB8FCoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 975e7f0d-b12c-4a87-5ca3-08de83386b02
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:45:47.3972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPVxEGo9Tuf0Y9oJrJ1yicvkt27qh63HVGmaM4qI7CS3/mHNGslSSLKin9/XLr0bM9iZBp8hw+eCoIKGSSm2gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA0B9CD929
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

Looks Good.

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------

On 26-02-2026 02:58, Kunal Joshi wrote:
> Add a control library for the Microsft USB4 Switch 3141 test equipment,
> used for automated USB4/Thunderbolt dock/undock testing:
>
>   - usb4switch_init()/deinit(): lifecycle with
>     .igtrc config or autodiscovery
>   - usb4switch_port_enable()/disable(): port control with optional HW delay
>   - usb4switch_get_active_port(): query current port state
>   - usb4switch_get_voltage_mv()/get_current_ma(): VBUS monitoring
>   - usb4switch_get_orientation(): USB-C cable orientation
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_usb4_switch.c | 1055 +++++++++++++++++++++++++++++++++++++++++
>   lib/igt_usb4_switch.h |  157 ++++++
>   lib/meson.build       |    1 +
>   3 files changed, 1213 insertions(+)
>   create mode 100644 lib/igt_usb4_switch.c
>   create mode 100644 lib/igt_usb4_switch.h
>
> diff --git a/lib/igt_usb4_switch.c b/lib/igt_usb4_switch.c
> new file mode 100644
> index 000000000..5cede4d60
> --- /dev/null
> +++ b/lib/igt_usb4_switch.c
> @@ -0,0 +1,1055 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * SECTION:igt_usb4_switch
> + * @short_description: USB4 Switch 3141 control library
> + * @title: USB4 Switch
> + * @include: igt_usb4_switch.h
> + *
> + * This library provides control and status functions for the Microsoft
> + * USB4 Switch 3141 test equipment, used for automated USB4/Thunderbolt
> + * dock/undock testing.
> + *
> + * The library handles serial communication, port control, and
> + * configuration parsing.
> + */
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "igt_core.h"
> +#include "igt_rc.h"
> +#include "igt_serial.h"
> +#include "igt_usb4_switch.h"
> +#include "igt_connector_helper.h"
> +
> +struct usb4switch {
> +	struct igt_serial *serial;
> +
> +	/* Configuration */
> +	char *device_path;
> +	int hotplug_timeout_s;
> +	int iterations;
> +	int min_switch_interval_ms;
> +
> +	/* Timestamp of last port change for minimum interval enforcement */
> +	struct timespec last_port_change;
> +
> +	/* Port configuration */
> +	struct usb4switch_port ports[USB4_SWITCH_MAX_PORTS];
> +	int port_count;
> +};
> +
> +/* .igtrc section and key names */
> +#define USB4_SWITCH_SECTION "USB4Switch"
> +#define USB4_SWITCH_KEY_DEVICE "Device"
> +#define USB4_SWITCH_KEY_HOTPLUG_TIMEOUT "HotplugTimeout"
> +#define USB4_SWITCH_KEY_ITERATIONS "DockUndockIterations"
> +#define USB4_SWITCH_KEY_MIN_INTERVAL "MinSwitchInterval"
> +
> +/*
> + * response_is_ok - Check that a firmware response does not indicate an error.
> + *
> + * The 3141 prefixes error replies with "ERR" (e.g. "ERR: unknown command").
> + * An empty response after a successful transport exchange is also treated as
> + * failure because no meaningful control command produces an empty reply.
> + *
> + * This is a transport vs. command-level distinction: send_command() only
> + * guarantees that bytes were exchanged; callers that need to know whether
> + * the firmware actually accepted the command must call response_is_ok().
> + */
> +static bool response_is_ok(const char *response)
> +{
> +	if (!response || response[0] == '\0')
> +		return false;
> +
> +	if (strncasecmp(response, "ERR", 3) == 0)
> +		return false;
> +
> +	return true;
> +}
> +
> +/*
> + * Minimum-interval helpers - enforce a floor between successive port
> + * operations to protect hardware from rapid switching.
> + */
> +static void enforce_min_interval(struct usb4switch *sw)
> +{
> +	struct timespec now;
> +	int elapsed_ms;
> +
> +	if (sw->last_port_change.tv_sec == 0 &&
> +	    sw->last_port_change.tv_nsec == 0)
> +		return;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &now);
> +	elapsed_ms = (now.tv_sec - sw->last_port_change.tv_sec) * 1000 +
> +		     (now.tv_nsec - sw->last_port_change.tv_nsec) / 1000000;
> +
> +	if (elapsed_ms < sw->min_switch_interval_ms) {
> +		int wait = sw->min_switch_interval_ms - elapsed_ms;
> +
> +		igt_debug("USB4Switch: enforcing %d ms minimum interval "
> +			  "(sleeping %d ms)\n",
> +			  sw->min_switch_interval_ms, wait);
> +		usleep(wait * 1000);
> +	}
> +}
> +
> +/**
> + * send_command:
> + * @sw: switch handle
> + * @cmd: command string (without line ending)
> + * @response: buffer for response
> + * @resp_size: size of response buffer
> + *
> + * Sends a command to the USB4 Switch 3141.
> + * Appends CRLF as required by the switch protocol.
> + *
> + * Note: success means the serial exchange completed and at least one byte
> + * was received. It does not validate the firmware response payload — callers
> + * that care about command-level success must check response_is_ok().
> + *
> + * Returns: true if the exchange succeeded, false on transport error.
> + */
> +static bool send_command(struct usb4switch *sw, const char *cmd,
> +			 char *response, size_t resp_size)
> +{
> +	char cmd_with_crlf[256];
> +	int len;
> +
> +	if (!sw || !sw->serial || !cmd)
> +		return false;
> +
> +	len = snprintf(cmd_with_crlf, sizeof(cmd_with_crlf), "%s\r\n", cmd);
> +	if (len < 0 || (size_t)len >= sizeof(cmd_with_crlf))
> +		return false;
> +
> +	return igt_serial_command(sw->serial, cmd_with_crlf,
> +				  response, resp_size);
> +}
> +
> +static bool verify_communication(struct usb4switch *sw)
> +{
> +	char response[256];
> +
> +	if (!send_command(sw, "version", response, sizeof(response))) {
> +		igt_debug("USB4Switch: Failed to query version\n");
> +		return false;
> +	}
> +
> +	if (!response_is_ok(response)) {
> +		igt_debug("USB4Switch: Version command rejected: '%s'\n",
> +			  response);
> +		return false;
> +	}
> +
> +	/*
> +	 * The device was already identified by VID:PID in
> +	 * discover_usb4_switch_device(). Here we just confirm the serial
> +	 * link is alive.  The firmware returns only its firmware version
> +	 * (e.g. "0201"), not the model number.
> +	 */
> +	igt_debug("USB4Switch: Version response: %s\n", response);
> +	return true;
> +}
> +
> +static char *get_config_string(const char *key)
> +{
> +	char *value = NULL;
> +	GError *error = NULL;
> +
> +	value = g_key_file_get_string(igt_key_file, USB4_SWITCH_SECTION,
> +				      key, &error);
> +	if (error) {
> +		g_error_free(error);
> +		return NULL;
> +	}
> +	return value;
> +}
> +
> +static int get_config_int(const char *key, int default_value)
> +{
> +	GError *error = NULL;
> +	int value;
> +
> +	value = g_key_file_get_integer(igt_key_file, USB4_SWITCH_SECTION,
> +				       key, &error);
> +	if (error) {
> +		g_error_free(error);
> +		return default_value;
> +	}
> +	return value;
> +}
> +
> +static void free_display_config(struct usb4switch_display *disp)
> +{
> +	free(disp->connector_path);
> +	disp->connector_path = NULL;
> +	free(disp->connector_name);
> +	disp->connector_name = NULL;
> +	free(disp->edid_serial);
> +	disp->edid_serial = NULL;
> +}
> +
> +static void free_port_config(struct usb4switch_port *port)
> +{
> +	int i;
> +
> +	free(port->name);
> +	for (i = 0; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++)
> +		free_display_config(&port->displays[i]);
> +}
> +
> +static void free_config(struct usb4switch *sw)
> +{
> +	int i;
> +
> +	free(sw->device_path);
> +	for (i = 0; i < USB4_SWITCH_MAX_PORTS; i++)
> +		free_port_config(&sw->ports[i]);
> +}
> +
> +static void parse_display_config(struct usb4switch *sw, int port_idx,
> +				 int disp_idx)
> +{
> +	struct usb4switch_display *disp;
> +	char key[64];
> +
> +	disp = &sw->ports[port_idx].displays[disp_idx];
> +
> +	/* Path takes precedence for MST */
> +	snprintf(key, sizeof(key), "Port%d.Display%d.Path",
> +		 port_idx + 1, disp_idx + 1);
> +	disp->connector_path = get_config_string(key);
> +
> +	/* Connector name as fallback */
> +	snprintf(key, sizeof(key), "Port%d.Display%d.Connector",
> +		 port_idx + 1, disp_idx + 1);
> +	disp->connector_name = get_config_string(key);
> +
> +	/* EDID serial for verification */
> +	snprintf(key, sizeof(key), "Port%d.Display%d.EDIDSerial",
> +		 port_idx + 1, disp_idx + 1);
> +	disp->edid_serial = get_config_string(key);
> +}
> +
> +static void parse_port_config(struct usb4switch *sw, int port_idx)
> +{
> +	struct usb4switch_port *port;
> +	char key[64];
> +	int i;
> +
> +	port = &sw->ports[port_idx];
> +	port->port_num = port_idx + 1;
> +
> +	snprintf(key, sizeof(key), "Port%d.Name", port_idx + 1);
> +	port->name = get_config_string(key);
> +	if (!port->name) {
> +		port->name = malloc(16);
> +		if (port->name)
> +			snprintf(port->name, 16, "Port %d", port_idx + 1);
> +	}
> +
> +	/*
> +	 * Parse all display slots, then count the leading contiguous
> +	 * prefix.  display_count is the exact number of valid entries
> +	 * accessible via displays[0..display_count-1].
> +	 */
> +	for (i = 0; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++)
> +		parse_display_config(sw, port_idx, i);
> +
> +	/* Count leading contiguous displays (Display1, Display2, ...) */
> +	port->display_count = 0;
> +	for (i = 0; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++) {
> +		if (sw->ports[port_idx].displays[i].connector_path ||
> +		    sw->ports[port_idx].displays[i].connector_name)
> +			port->display_count++;
> +		else
> +			break;
> +	}
> +
> +	/* Warn about and free any sparse entries beyond the contiguous prefix */
> +	for (; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++) {
> +		if (sw->ports[port_idx].displays[i].connector_path ||
> +		    sw->ports[port_idx].displays[i].connector_name) {
> +			igt_warn("USB4Switch: Port%d.Display%d configured "
> +				 "but Display%d is missing; displays must "
> +				 "be contiguous from 1 — ignoring\n",
> +				 port_idx + 1, i + 1,
> +				 port->display_count + 1);
> +			free_display_config(&sw->ports[port_idx].displays[i]);
> +		}
> +	}
> +}
> +
> +static bool parse_config(struct usb4switch *sw)
> +{
> +	int i;
> +
> +	sw->device_path = get_config_string(USB4_SWITCH_KEY_DEVICE);
> +	if (!sw->device_path) {
> +		igt_debug("USB4Switch: No Device configured\n");
> +		return false;
> +	}
> +
> +	sw->hotplug_timeout_s =
> +		get_config_int(USB4_SWITCH_KEY_HOTPLUG_TIMEOUT,
> +			       USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S);
> +	sw->iterations =
> +		get_config_int(USB4_SWITCH_KEY_ITERATIONS,
> +			       USB4_SWITCH_DEFAULT_ITERATIONS);
> +	sw->min_switch_interval_ms =
> +		get_config_int(USB4_SWITCH_KEY_MIN_INTERVAL,
> +			       USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS);
> +
> +	/*
> +	 * Count only leading contiguous ports that have at least one display.
> +	 * Stop at the first port with no displays — this enforces contiguous
> +	 * port numbering (Port1, Port2, ...) and means port_count is the exact
> +	 * number of valid ports accessible via ports[0..port_count-1].
> +	 */
> +	sw->port_count = 0;
> +	for (i = 0; i < USB4_SWITCH_MAX_PORTS; i++) {
> +		parse_port_config(sw, i);
> +		if (sw->ports[i].display_count > 0)
> +			sw->port_count++;
> +		else
> +			break;
> +	}
> +
> +	if (sw->port_count == 0)
> +		igt_warn("USB4Switch: Device configured but no display keys found\n");
> +
> +	igt_debug("USB4Switch: Device=%s, Timeout=%ds, Iterations=%d, Ports=%d\n",
> +		  sw->device_path, sw->hotplug_timeout_s, sw->iterations,
> +		  sw->port_count);
> +
> +	return true;
> +}
> +
> +static void stamp_port_change(struct usb4switch *sw)
> +{
> +	clock_gettime(CLOCK_MONOTONIC, &sw->last_port_change);
> +}
> +
> +static bool usb4switch_queue_port_change_delayed(struct usb4switch *sw,
> +						 int port,
> +						 int delay_seconds,
> +						 const char *action)
> +{
> +	char cmd[32];
> +	char response[256];
> +
> +	if (!sw)
> +		return false;
> +
> +	if (port < 0 || port > USB4_SWITCH_MAX_PORTS) {
> +		igt_warn("USB4Switch: Invalid port %d\n", port);
> +		return false;
> +	}
> +
> +	if (delay_seconds < 0 || delay_seconds > 3600) {
> +		igt_warn("USB4Switch: Invalid delay %d (must be 0-3600)\n",
> +			 delay_seconds);
> +		return false;
> +	}
> +
> +	enforce_min_interval(sw);
> +
> +	snprintf(cmd, sizeof(cmd), "delay %d", delay_seconds);
> +	if (!send_command(sw, cmd, response, sizeof(response))) {
> +		igt_warn("USB4Switch: Failed to set delay %d\n", delay_seconds);
> +		return false;
> +	}
> +
> +	if (!response_is_ok(response)) {
> +		igt_warn("USB4Switch: Failed to set delay %d (response: '%s')\n",
> +			 delay_seconds, response);
> +		return false;
> +	}
> +
> +	snprintf(cmd, sizeof(cmd), "port %d", port);
> +	if (!send_command(sw, cmd, response, sizeof(response))) {
> +		igt_warn("USB4Switch: Failed to queue %s command\n", action);
> +		return false;
> +	}
> +
> +	if (!response_is_ok(response)) {
> +		igt_warn("USB4Switch: Failed to queue %s command (response: '%s')\n",
> +			 action, response);
> +		return false;
> +	}
> +
> +	stamp_port_change(sw);
> +	igt_debug("USB4Switch: Queued %s with %ds delay\n",
> +		  action, delay_seconds);
> +
> +	return true;
> +}
> +
> +/*
> + * USB VID:PID for Microsoft USB4 Switch 3141
> + */
> +#define USB4_SWITCH_VID "045e"
> +#define USB4_SWITCH_PID "0646"
> +
> +/*
> + * Linux USB uevent PRODUCT= format uses lowercase hex without leading
> + * zeros: VID 0x045e → "45e", PID 0x0646 → "646".
> + */
> +#define USB4_SWITCH_UEVENT_MATCH "PRODUCT=45e/646/"
> +
> +/*
> + * When no .igtrc configuration is present, autodiscover:
> + * - USB4 switch device by scanning /sys/class/tty for matching VID:PID
> + * - Displays behind each port by comparing connectors before/after docking
> + */
> +static char *discover_usb4_switch_device(void)
> +{
> +	char path[256];
> +	char uevent[512];
> +	char *device_path = NULL;
> +	FILE *fp;
> +	int i;
> +
> +	/*
> +	 * Scan ttyACM0..63. The 3141 almost always lands in the low
> +	 * range, but the upper bound is generous to handle busy systems.
> +	 */
> +	for (i = 0; i < 64; i++) {
> +		snprintf(path, sizeof(path),
> +			 "/sys/class/tty/ttyACM%d/device/uevent", i);
> +
> +		fp = fopen(path, "r");
> +		if (!fp)
> +			continue;
> +
> +		while (fgets(uevent, sizeof(uevent), fp)) {
> +			if (strstr(uevent, USB4_SWITCH_UEVENT_MATCH)) {
> +				device_path = malloc(32);
> +				if (device_path)
> +					snprintf(device_path, 32,
> +						 "/dev/ttyACM%d", i);
> +				break;
> +			}
> +		}
> +
> +		fclose(fp);
> +		if (device_path)
> +			break;
> +	}
> +
> +	if (device_path)
> +		igt_debug("USB4Switch: Autodiscovered device at %s\n",
> +			  device_path);
> +	else
> +		igt_debug("USB4Switch: No device found during autodiscovery\n");
> +
> +	return device_path;
> +}
> +
> +/*
> + * discover_port_displays - Dock a port and compare connectors to find
> + * which displays appear. drm_fd is passed as parameter, NOT stored.
> + */
> +static bool discover_port_displays(struct usb4switch *sw, int drm_fd,
> +				   int port_num, uint32_t *before,
> +				   int before_count)
> +{
> +	struct usb4switch_port *port = &sw->ports[port_num - 1];
> +	uint32_t after[32];
> +	int after_count;
> +	char name[32];
> +	char serial[64];
> +	int i, j, wait;
> +	bool found;
> +
> +	if (!usb4switch_port_enable(sw, port_num)) {
> +		igt_debug("USB4Switch: Failed to enable port %d\n", port_num);
> +		return false;
> +	}
> +
> +	igt_debug("USB4Switch: Waiting for port %d displays...\n", port_num);
> +	/* Poll for new connectors (max 10s) instead of fixed sleep */
> +	after_count = 0;
> +	for (wait = 0; wait < 10; wait++) {
> +		sleep(1);
> +		igt_connector_reprobe_all(drm_fd);
> +		after_count = igt_connector_get_connected(drm_fd, after, 32);
> +		if (after_count > before_count)
> +			break;
> +	}
> +
> +	if (after_count <= before_count) {
> +		igt_debug("USB4Switch: No new connectors detected on port %d\n",
> +			  port_num);
> +		usb4switch_port_disable_and_wait(sw);
> +		return false;
> +	}
> +
> +	port->port_num = port_num;
> +	port->name = malloc(16);
> +	if (port->name)
> +		snprintf(port->name, 16, "port-%d", port_num);
> +	port->display_count = 0;
> +
> +	for (i = 0; i < after_count; i++) {
> +		found = false;
> +		for (j = 0; j < before_count; j++) {
> +			if (after[i] == before[j]) {
> +				found = true;
> +				break;
> +			}
> +		}
> +
> +		if (!found &&
> +		    port->display_count < USB4_SWITCH_MAX_DISPLAYS_PER_PORT) {
> +			char path[256];
> +
> +			if (igt_connector_get_info(drm_fd, after[i],
> +						   name, sizeof(name),
> +						   serial, sizeof(serial),
> +						   path, sizeof(path))) {
> +				struct usb4switch_display *disp;
> +
> +				disp = &port->displays[port->display_count];
> +				disp->connector_name = strdup(name);
> +				if (!disp->connector_name)
> +					continue;
> +				disp->edid_serial = serial[0] ?
> +						    strdup(serial) : NULL;
> +				disp->connector_path = path[0] ?
> +						       strdup(path) : NULL;
> +
> +				igt_info("USB4Switch: Port %d Display %d: %s (EDID: %s)\n",
> +					 port_num, port->display_count + 1,
> +					 name,
> +					 serial[0] ? serial : "none");
> +
> +				port->display_count++;
> +			}
> +		}
> +	}
> +
> +	usb4switch_port_disable_and_wait(sw);
> +	igt_connector_reprobe_all(drm_fd);
> +
> +	if (port->display_count > 0)
> +		sw->port_count++;
> +
> +	return port->display_count > 0;
> +}
> +
> +/*
> + * autodiscover_config - Autodiscover switch device and port displays.
> + */
> +static bool autodiscover_config(struct usb4switch *sw, int drm_fd)
> +{
> +	uint32_t before[32];
> +	int before_count;
> +	int p;
> +
> +	sw->device_path = discover_usb4_switch_device();
> +	if (!sw->device_path)
> +		return false;
> +
> +	sw->hotplug_timeout_s = USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S;
> +	sw->iterations = USB4_SWITCH_DEFAULT_ITERATIONS;
> +	sw->min_switch_interval_ms = USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS;
> +	sw->port_count = 0;
> +
> +	sw->serial = igt_serial_open(sw->device_path, 115200);
> +	if (!sw->serial) {
> +		igt_debug("USB4Switch: Failed to open autodiscovered device %s\n",
> +			  sw->device_path);
> +		free(sw->device_path);
> +		sw->device_path = NULL;
> +		return false;
> +	}
> +
> +	if (!verify_communication(sw)) {
> +		igt_serial_close(sw->serial);
> +		sw->serial = NULL;
> +		free(sw->device_path);
> +		sw->device_path = NULL;
> +		return false;
> +	}
> +
> +	igt_info("USB4Switch: Autodiscovering displays...\n");
> +
> +	usb4switch_port_disable_and_wait(sw);
> +
> +	igt_connector_reprobe_all(drm_fd);
> +
> +	before_count = igt_connector_get_connected(drm_fd, before, 32);
> +	if (before_count >= 32)
> +		igt_warn("USB4Switch: Connector count %d may exceed array size\n",
> +			 before_count);
> +	igt_debug("USB4Switch: %d connectors before autodiscovery\n",
> +		  before_count);
> +
> +	/*
> +	 * Probe ports sequentially. Stop at the first port that yields no
> +	 * displays — same contiguity rule as config-based port counting.
> +	 */
> +	for (p = 1; p <= USB4_SWITCH_MAX_PORTS; p++) {
> +		if (!discover_port_displays(sw, drm_fd, p, before, before_count))
> +			break;
> +	}
> +
> +	usb4switch_port_disable(sw);
> +
> +	igt_info("USB4Switch: Autodiscovery complete - %d ports with displays\n",
> +		 sw->port_count);
> +
> +	return sw->port_count > 0;
> +}
> +
> +/**
> + * usb4switch_init:
> + * @drm_fd: DRM file descriptor (used only for autodiscovery, not stored)
> + *
> + * Initializes USB4 switch from .igtrc configuration.
> + * If no configuration is present, attempts
> + * autodiscovery of the switch device and displays behind each port.
> + *
> + * Returns: Switch handle on success, NULL on failure.
> + */
> +struct usb4switch *usb4switch_init(int drm_fd)
> +{
> +	struct usb4switch *sw;
> +	bool config_ok;
> +
> +	sw = calloc(1, sizeof(*sw));
> +	if (!sw)
> +		return NULL;
> +
> +	config_ok = parse_config(sw);
> +
> +	if (!config_ok) {
> +		if (drm_fd < 0) {
> +			igt_debug("USB4Switch: No config and no DRM fd for autodiscovery\n");
> +			free_config(sw);
> +			free(sw);
> +			return NULL;
> +		}
> +
> +		igt_info("USB4Switch: No configuration found, attempting autodiscovery...\n");
> +		if (!autodiscover_config(sw, drm_fd)) {
> +			igt_debug("USB4Switch: Autodiscovery failed\n");
> +			if (sw->serial)
> +				igt_serial_close(sw->serial);
> +			free_config(sw);
> +			free(sw);
> +			return NULL;
> +		}
> +		igt_info("USB4Switch: Initialized via autodiscovery (Model 3141)\n");
> +		return sw;
> +	}
> +
> +	sw->serial = igt_serial_open(sw->device_path, 115200);
> +	if (!sw->serial) {
> +		igt_debug("USB4Switch: Failed to open serial port %s\n",
> +			  sw->device_path);
> +		free_config(sw);
> +		free(sw);
> +		return NULL;
> +	}
> +
> +	if (!verify_communication(sw)) {
> +		igt_serial_close(sw->serial);
> +		free_config(sw);
> +		free(sw);
> +		return NULL;
> +	}
> +
> +	igt_info("USB4Switch: Initialized (Model 3141)\n");
> +	return sw;
> +}
> +
> +/**
> + * usb4switch_deinit:
> + * @sw: switch handle
> + *
> + * Closes the switch and frees resources.
> + * Disables all ports before closing.
> + */
> +void usb4switch_deinit(struct usb4switch *sw)
> +{
> +	if (!sw)
> +		return;
> +
> +	usb4switch_port_disable(sw);
> +
> +	if (sw->serial)
> +		igt_serial_close(sw->serial);
> +	free_config(sw);
> +	free(sw);
> +
> +	igt_debug("USB4Switch: Deinitialized\n");
> +}
> +
> +/**
> + * usb4switch_port_enable:
> + * @sw: switch handle
> + * @port: port number (1 or 2)
> + *
> + * Enables the specified port.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool usb4switch_port_enable(struct usb4switch *sw, int port)
> +{
> +	char cmd[32];
> +	char response[256];
> +
> +	if (!sw || port < 1 || port > USB4_SWITCH_MAX_PORTS)
> +		return false;
> +
> +	enforce_min_interval(sw);
> +
> +	snprintf(cmd, sizeof(cmd), "port %d", port);
> +
> +	if (!send_command(sw, cmd, response, sizeof(response))) {
> +		igt_warn("USB4Switch: Failed to enable port %d\n", port);
> +		return false;
> +	}
> +	if (!response_is_ok(response)) {
> +		igt_warn("USB4Switch: Failed to enable port %d (response: '%s')\n",
> +			 port, response);
> +		return false;
> +	}
> +
> +	stamp_port_change(sw);
> +	igt_debug("USB4Switch: Enabled port %d\n", port);
> +	return true;
> +}
> +
> +/**
> + * usb4switch_port_enable_delayed:
> + * @sw: switch handle
> + * @port: port number (1 or 2)
> + * @delay_seconds: delay in seconds before port change executes
> + *
> + * Schedules a port enable after the specified delay using the hardware
> + * delay command on Model 3141. Useful for hotplug-during-suspend tests.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool usb4switch_port_enable_delayed(struct usb4switch *sw, int port,
> +				    int delay_seconds)
> +{
> +	return usb4switch_queue_port_change_delayed(sw, port, delay_seconds,
> +						    "port enable");
> +}
> +
> +/**
> + * usb4switch_port_disable_delayed:
> + * @sw: switch handle
> + * @delay_seconds: delay in seconds before port disable executes
> + *
> + * Schedules a port disable (undock) after the specified delay.
> + * Useful for undock-during-suspend tests.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool usb4switch_port_disable_delayed(struct usb4switch *sw, int delay_seconds)
> +{
> +	return usb4switch_queue_port_change_delayed(sw, 0, delay_seconds,
> +						    "port disable");
> +}
> +
> +/**
> + * usb4switch_port_disable:
> + * @sw: switch handle
> + *
> + * Disables all ports.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool usb4switch_port_disable(struct usb4switch *sw)
> +{
> +	char response[256];
> +
> +	if (!sw)
> +		return false;
> +
> +	enforce_min_interval(sw);
> +
> +	if (!send_command(sw, "port 0", response, sizeof(response))) {
> +		igt_warn("USB4Switch: Failed to disable ports\n");
> +		return false;
> +	}
> +	if (!response_is_ok(response)) {
> +		igt_warn("USB4Switch: Failed to disable ports (response: '%s')\n",
> +			 response);
> +		return false;
> +	}
> +
> +	stamp_port_change(sw);
> +	igt_debug("USB4Switch: Disabled all ports\n");
> +	return true;
> +}
> +
> +/**
> + * usb4switch_get_active_port:
> + * @sw: switch handle
> + *
> + * Gets currently active port.
> + *
> + * Returns: Port number (1 or 2), 0 if disabled, -1 on error.
> + */
> +int usb4switch_get_active_port(struct usb4switch *sw)
> +{
> +	char response[256];
> +	int port;
> +
> +	if (!sw)
> +		return -1;
> +
> +	if (!send_command(sw, "port ?", response, sizeof(response)))
> +		return -1;
> +
> +	if (!response_is_ok(response)) {
> +		igt_warn("USB4Switch: Port query rejected: '%s'\n", response);
> +		return -1;
> +	}
> +
> +	if (sscanf(response, "port: %d", &port) == 1 ||
> +	    sscanf(response, "port %d", &port) == 1 ||
> +	    sscanf(response, "%d", &port) == 1)
> +		return port;
> +
> +	igt_warn("USB4Switch: Could not parse port response: '%s'\n",
> +		 response);
> +	return -1;
> +}
> +
> +/**
> + * usb4switch_get_status:
> + * @sw: switch handle
> + * @buf: buffer for status
> + * @size: buffer size
> + *
> + * Gets full status from switch.
> + *
> + * Returns: true on success.
> + */
> +bool usb4switch_get_status(struct usb4switch *sw, char *buf, size_t size)
> +{
> +	if (!sw || !buf || size == 0)
> +		return false;
> +
> +	if (!send_command(sw, "status", buf, size))
> +		return false;
> +
> +	return response_is_ok(buf);
> +}
> +
> +/**
> + * usb4switch_get_voltage_mv:
> + * @sw: switch handle
> + *
> + * Gets VBUS voltage by sending the "volts" command.
> + * The 3141 firmware responds with "X.XX V" (e.g. "4.85 V").
> + *
> + * Note: The 3141 hardware may not have accurate VBUS sense circuitry.
> + * Voltage readback may not be meaningful on all units.
> + *
> + * Returns: Voltage in mV, -1 on error.
> + */
> +int usb4switch_get_voltage_mv(struct usb4switch *sw)
> +{
> +	char response[256];
> +	float volts;
> +
> +	if (!sw)
> +		return -1;
> +
> +	if (!send_command(sw, "volts", response, sizeof(response)))
> +		return -1;
> +
> +	if (sscanf(response, "%f", &volts) == 1)
> +		return (int)(volts * 1000);
> +
> +	return -1;
> +}
> +
> +/**
> + * usb4switch_get_current_ma:
> + * @sw: switch handle
> + *
> + * Gets VBUS current by sending the "amps" command.
> + * The 3141 firmware responds with "XXX mA" (e.g. "125 mA").
> + *
> + * Note: The 3141 hardware may not have accurate current sense circuitry.
> + *
> + * Returns: Current in mA, -1 on error.
> + */
> +int usb4switch_get_current_ma(struct usb4switch *sw)
> +{
> +	char response[256];
> +	int current;
> +
> +	if (!sw)
> +		return -1;
> +
> +	if (!send_command(sw, "amps", response, sizeof(response)))
> +		return -1;
> +
> +	if (sscanf(response, "%d", &current) == 1)
> +		return current;
> +
> +	return -1;
> +}
> +
> +/**
> + * usb4switch_wait_vbus_safe:
> + * @sw: switch handle
> + * @timeout_ms: maximum time to wait in milliseconds
> + *
> + * Waits for VBUS voltage to drop below the Vsafe0V threshold (800 mV)
> + * after a port disable. Polls using the "volts" command. If voltage
> + * readback is not supported or returns errors, falls back to a fixed
> + * 1-second delay.
> + *
> + * Returns: true when VBUS is safe (or after fallback delay).
> + */
> +bool usb4switch_wait_vbus_safe(struct usb4switch *sw, int timeout_ms)
> +{
> +	int elapsed = 0;
> +	int mv = -1;
> +
> +	if (!sw)
> +		return false;
> +
> +	while (elapsed < timeout_ms) {
> +		mv = usb4switch_get_voltage_mv(sw);
> +		if (mv < 0) {
> +			/* Voltage readback not supported; use fixed delay */
> +			igt_debug("USB4Switch: voltage readback failed, "
> +				  "using 1s fallback delay\n");
> +			sleep(1);
> +			return true;
> +		}
> +		if (mv < USB4_SWITCH_VBUS_SAFE_MV) {
> +			igt_debug("USB4Switch: VBUS safe at %d mV\n", mv);
> +			return true;
> +		}
> +		usleep(USB4_SWITCH_VBUS_SAFE_POLL_MS * 1000);
> +		elapsed += USB4_SWITCH_VBUS_SAFE_POLL_MS;
> +	}
> +
> +	igt_warn("USB4Switch: VBUS still at %d mV after %d ms\n",
> +		 mv, timeout_ms);
> +	return false;
> +}
> +
> +/**
> + * usb4switch_port_disable_and_wait:
> + * @sw: switch handle
> + *
> + * Disables all ports and waits for VBUS to reach safe levels.
> + *
> + * Returns: true on success.
> + */
> +bool usb4switch_port_disable_and_wait(struct usb4switch *sw)
> +{
> +	if (!usb4switch_port_disable(sw))
> +		return false;
> +
> +	return usb4switch_wait_vbus_safe(sw, USB4_SWITCH_VBUS_SAFE_TIMEOUT_MS);
> +}
> +
> +/**
> + * usb4switch_port_switch:
> + * @sw: switch handle
> + * @new_port: target port number (1..MAX_PORTS)
> + *
> + * Safely switches from the currently active port to @new_port.
> + * If another port is active, disables it first and waits for VBUS
> + * discharge before enabling the new port. If @new_port is already
> + * active, this is a no-op.
> + *
> + * Returns: true on success.
> + */
> +bool usb4switch_port_switch(struct usb4switch *sw, int new_port)
> +{
> +	int active;
> +
> +	if (!sw || new_port < 1 || new_port > USB4_SWITCH_MAX_PORTS)
> +		return false;
> +
> +	active = usb4switch_get_active_port(sw);
> +
> +	if (active == new_port) {
> +		igt_debug("USB4Switch: Port %d already active\n", new_port);
> +		return true;
> +	}
> +
> +	if (active > 0) {
> +		igt_debug("USB4Switch: Disabling port %d before switching "
> +			  "to port %d\n", active, new_port);
> +		if (!usb4switch_port_disable_and_wait(sw))
> +			return false;
> +	}
> +
> +	return usb4switch_port_enable(sw, new_port);
> +}
> +
> +/**
> + * usb4switch_get_port_config:
> + * @sw: switch handle
> + * @port_index: port index (0-based)
> + *
> + * Returns: Pointer to port config, NULL if invalid.
> + */
> +const struct usb4switch_port *usb4switch_get_port_config(struct usb4switch *sw,
> +							 int port_index)
> +{
> +	if (!sw || port_index < 0 || port_index >= sw->port_count)
> +		return NULL;
> +
> +	return &sw->ports[port_index];
> +}
> +
> +/**
> + * usb4switch_get_port_count:
> + * @sw: switch handle
> + *
> + * Returns: Number of configured ports.
> + */
> +int usb4switch_get_port_count(struct usb4switch *sw)
> +{
> +	return sw ? sw->port_count : 0;
> +}
> +
> +/**
> + * usb4switch_get_hotplug_timeout:
> + * @sw: switch handle
> + *
> + * Returns: Hotplug timeout in seconds.
> + */
> +int usb4switch_get_hotplug_timeout(struct usb4switch *sw)
> +{
> +	return sw ? sw->hotplug_timeout_s :
> +		    USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S;
> +}
> +
> +/**
> + * usb4switch_get_iterations:
> + * @sw: switch handle
> + *
> + * Returns: Configured iterations.
> + */
> +int usb4switch_get_iterations(struct usb4switch *sw)
> +{
> +	return sw ? sw->iterations : USB4_SWITCH_DEFAULT_ITERATIONS;
> +}
> diff --git a/lib/igt_usb4_switch.h b/lib/igt_usb4_switch.h
> new file mode 100644
> index 000000000..5f1a0d334
> --- /dev/null
> +++ b/lib/igt_usb4_switch.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_USB4_SWITCH_H
> +#define IGT_USB4_SWITCH_H
> +
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +
> +/**
> + * USB4_SWITCH_MODEL_3141:
> + *
> + * Model number for Switch 3141.
> + */
> +#define USB4_SWITCH_MODEL_3141 3141
> +
> +/**
> + * USB4_SWITCH_MAX_PORTS:
> + *
> + * Maximum number of ports on the switch.
> + */
> +#define USB4_SWITCH_MAX_PORTS 2
> +
> +/**
> + * USB4_SWITCH_MAX_DISPLAYS_PER_PORT:
> + *
> + * Maximum displays per port (for MST hubs).
> + */
> +#define USB4_SWITCH_MAX_DISPLAYS_PER_PORT 4
> +
> +/**
> + * USB4_SWITCH_RESPONSE_MAX_LEN:
> + *
> + * Recommended buffer size for usb4switch_get_status() callers.
> + * Internal commands use smaller buffers since responses are short.
> + */
> +#define USB4_SWITCH_RESPONSE_MAX_LEN 1024
> +
> +/**
> + * USB4_SWITCH_DEFAULT_TIMEOUT_MS:
> + *
> + * Default command timeout in milliseconds.
> + */
> +#define USB4_SWITCH_DEFAULT_TIMEOUT_MS 2000
> +
> +/**
> + * USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S:
> + *
> + * Default hotplug wait timeout in seconds.
> + */
> +#define USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S 10
> +
> +/**
> + * USB4_SWITCH_DEFAULT_ITERATIONS:
> + *
> + * Default dock/undock iterations.
> + */
> +#define USB4_SWITCH_DEFAULT_ITERATIONS 3
> +
> +/**
> + * USB4_SWITCH_VBUS_SAFE_MV:
> + *
> + * VBUS voltage threshold in mV below which VBUS is considered safe
> + * (Vsafe0V per USB PD specification).
> + */
> +#define USB4_SWITCH_VBUS_SAFE_MV 800
> +
> +/**
> + * USB4_SWITCH_VBUS_SAFE_TIMEOUT_MS:
> + *
> + * Maximum time in milliseconds to wait for VBUS to discharge to safe levels.
> + */
> +#define USB4_SWITCH_VBUS_SAFE_TIMEOUT_MS 3000
> +
> +/**
> + * USB4_SWITCH_VBUS_SAFE_POLL_MS:
> + *
> + * Polling interval in milliseconds when waiting for VBUS discharge.
> + */
> +#define USB4_SWITCH_VBUS_SAFE_POLL_MS 100
> +
> +/**
> + * USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS:
> + *
> + * Default minimum interval in milliseconds between successive port
> + * operations.  Matches Cricket UI's 1-second safety guard.
> + */
> +#define USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS 1000
> +
> +/**
> + * struct usb4switch_display:
> + * @connector_path: MST PATH property (e.g., "mst:5-2-8"), preferred for MST
> + * @connector_name: Fallback connector name (e.g., "DP-6") for non-MST
> + * @edid_serial: Expected EDID serial string for verification
> + *
> + * Configuration for an expected display on a switch port.
> + * For MST displays, use connector_path which is stable across hotplug.
> + * For non-MST displays, connector_name can be used.
> + */
> +struct usb4switch_display {
> +	char *connector_path;
> +	char *connector_name;
> +	char *edid_serial;
> +};
> +
> +/**
> + * struct usb4switch_port:
> + * @port_num: Port number (1 or 2)
> + * @name: Human-readable port name
> + * @displays: Array of expected displays on this port
> + * @display_count: Number of displays configured
> + *
> + * Configuration for a switch port.
> + */
> +struct usb4switch_port {
> +	int port_num;
> +	char *name;
> +	struct usb4switch_display displays[USB4_SWITCH_MAX_DISPLAYS_PER_PORT];
> +	int display_count;
> +};
> +
> +struct usb4switch;
> +
> +/* Lifecycle */
> +struct usb4switch *usb4switch_init(int drm_fd);
> +void usb4switch_deinit(struct usb4switch *sw);
> +
> +/* Port control */
> +bool usb4switch_port_enable(struct usb4switch *sw, int port);
> +bool usb4switch_port_enable_delayed(struct usb4switch *sw, int port,
> +				    int delay_seconds);
> +bool usb4switch_port_disable(struct usb4switch *sw);
> +bool usb4switch_port_disable_delayed(struct usb4switch *sw,
> +				     int delay_seconds);
> +
> +/* VBUS safety */
> +bool usb4switch_wait_vbus_safe(struct usb4switch *sw, int timeout_ms);
> +bool usb4switch_port_disable_and_wait(struct usb4switch *sw);
> +bool usb4switch_port_switch(struct usb4switch *sw, int new_port);
> +
> +/* Status queries */
> +int usb4switch_get_active_port(struct usb4switch *sw);
> +bool usb4switch_get_status(struct usb4switch *sw, char *buf, size_t size);
> +int usb4switch_get_voltage_mv(struct usb4switch *sw);
> +int usb4switch_get_current_ma(struct usb4switch *sw);
> +
> +/* Configuration getters */
> +const struct usb4switch_port *usb4switch_get_port_config(struct usb4switch *sw,
> +							 int port_index);
> +int usb4switch_get_port_count(struct usb4switch *sw);
> +int usb4switch_get_hotplug_timeout(struct usb4switch *sw);
> +int usb4switch_get_iterations(struct usb4switch *sw);
> +
> +#endif /* IGT_USB4_SWITCH_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 67b57533c..d03bef209 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -124,6 +124,7 @@ lib_sources = [
>   	'igt_dsc.c',
>   	'igt_hook.c',
>   	'igt_serial.c',
> +	'igt_usb4_switch.c',
>   	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
>   	'xe/xe_legacy.c',
