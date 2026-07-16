Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B15C44501
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F58D10E2E1;
	Thu, 16 Jul 2026 07:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/AOahul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5210E481
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784186219; x=1815722219;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ntPbdkAPMwSsTWsFtcCO3myHygGP+NAwYmxeb7COiEg=;
 b=L/AOahulOXZoMhfs1PfDt7BU8cMCnkOX1ZmgrvpTB5/ITT12PnvFuFVb
 9DAHR+8I7QiT49AcgayMTN7A2URPLGFcqwOGMXT7z6rHvydskcYK3R5jE
 OGhV8qSHj3t3JJRP2YqmnjmaQcMJYZ3sPbDS0Iljhc1hGeVehQpdEg28V
 0lpRT7b8zea3ugV5aLfWI2bFtQB1PB0VKGG9OsKK/Y0k1JTGSgLthAzJS
 pijw5ns8UAERjek/ulApR7IaxlWTpuvRaoWgs9qnpc5z/t2+37acoX/4Z
 v9d1rsCYJzGiAtbKD7dUNPDLlvo5JDQPDWGHhI7+jGgWElcHWox50rEE6 g==;
X-CSE-ConnectionGUID: 8DkE0YYNTWChY+H5VQa7uA==
X-CSE-MsgGUID: 4pZZeFT1TaadGAJnSjjpiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96351586"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96351586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:16:58 -0700
X-CSE-ConnectionGUID: Grp9UqPyS4WeRl3ipPQ2SQ==
X-CSE-MsgGUID: XRJk31a4S4W+Ew1qo2FmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260728499"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:16:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:16:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:16:58 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SR3sy5i4QjaGmu709rOvHilOP6I2bsBas8cuwEBiNvBMulbSav2FNX1SJpHM5FwW/vCBijowMXMsRG+uwI2zQzKuzmkFf+/1TPnDxkE4xxgRdeiiJ0XA858vb2aJsnEbAODpMbRkZsQ8AItCA1fUOT7EQ1ZJUEc7pbipsnWZbkcDCIURw1Ods443yQVqCnik2REdi3x63S1DCE6oMLchJTv/I2Kr4w11Br7cXdnSZFaH9WiN5nd0j37AWMKElNNTGAKvLkhcLYBP9h/GmPiTUZ71wSHwB5ZuxHI2PDbzaLfoCwNZaDLDVsN81kf27wbPINGlMdOUL7XpvnEJBxx9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3btHhzPqSuFWOY2qK4bG4pCuYB+0CDsd4Q3T/yoACw=;
 b=op90yRoQN/i3Z1IKC9WlV9ycb940jYag/H/Fo+lpVPUnXbsMpseHZNrOnjjArz9MWSdb8QNxcNsJ+DQMgX+KpPijGHVGYEHnRGRDO/Ss2F/nG7fjDMN//ylYXZkmhYKNBmNtIGrVldjc0oB2jJ8s24DZOyZWfUugf5krrnPiyaKNFZAGFXu+7zTVmq7M8oAb7ugyqXRI9dbcQverKEd4gcytZPLMNIgfOb7/L9Q01bKLI6A9vF+Ftp4qSMk685K318D3OCneXk/VdWQaSWLUMLD9DeGINSg3in8ZAuexDvEo9NbmelarBC10NRXIgPid6qPSNVI9jZXp2ySGrHouQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 07:16:49 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 07:16:49 +0000
Message-ID: <593b8284-fed2-477b-8e8e-cdc06625d5c1@intel.com>
Date: Thu, 16 Jul 2026 12:46:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/xe-perf-recorder: Add mmio-trigger support
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260702052315.3740840-1-shekhar.chauhan@intel.com>
 <87pl0uctb4.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <87pl0uctb4.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a54f324-21d9-4804-b385-08dee30a33fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|3023799007|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: lzNVL5v52J0dbfJzZMV4x21BIS8DXVXp1AjobPul8RfNxC4e5ChQwpnzL9OyyTn5rsJ5hevxBJE7/P7pPnFbewAYZun5kW8I6TVXyEy/GkRJQLrB7jH4ZvYYRzs8rYb1ZEmePaDVbJF3+pK1KH5osQibTNMsrfjU5C4mB2VtHMlDa9qIqmuyvOAxxoq4Fddxc3knRJT2gpYKyMXyJmGUyzRXZ1paxn33O7LbzReppQZqbCBVvxwFqPJLHLffcqg75sWl7raxqZx0+kRsJVX7n8LmaNZ1QWlg9lbxhVcmxuOsOM3cw9GQuCwOGBC+Ie2Upb1cfbM4CQwqgdr/nRrzWTYCIXlVg6jmvTH/u6R71NCVIZAbOhPXFURmIr4bRhN8tkvMX2GE8LbtAOACwY5J4NKzSMXVY2+uFcl5d9H/FTJljSztlOxnR8xb1fkvU6ZgW9UQ/uDNWq4KsTFTJlcbzkTF8HFjdIvMg1XahkDgvonJiUVjTYAGD9FnSPz6tJC9hZqqqsLy4RECEJ4L5ATLVWBeG3exrPCEse6Di62Dv+Dz4lOjLrdRk3H+N/fjqePC2dMkDcvhCaOgqw9AKCCCft4vT0TJE41uNib+V/uQUeTGkq0/yk8gQT8dZutd/E1NblgG9R5AOZ2AnLvF0VFJggCBGrEWpYiLtuoNiy5UEXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(3023799007)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFidzJLTlVveUFMZngwc2twVzFsb28wWVk2MFkzZ3RhSVRBMS9oNFB4MmNq?=
 =?utf-8?B?RjJHbkl2Um9jMmx6Ty9LYjdOVDdRZUgzZWxvUTdYamdBZHg5NHlkcmRPWmNI?=
 =?utf-8?B?c056YS84cURURDlsenBHMGZUTnVRNlEzREtsYjVBWXlFUWlmYTROOC83TEtl?=
 =?utf-8?B?bmZQSXhETlNWQ1FocXNRUHhKZVF0VC8vejJWaFpzcWZWSm1QMWlpSFZBc29r?=
 =?utf-8?B?TTM2UCttSk1XQmNiRjdNeEswYkljcE9GWmo3NXZYV09PMWgxZkFUbDVsUFRC?=
 =?utf-8?B?REhZc01CajQ5K3NGMFpKbk1lQ2w1dVBZY3RDR04wbi9URmdTU2RsWDJxNkxY?=
 =?utf-8?B?ZVgzYUNVVUo5d29LTmc2ZTNBVE1qSC84QVo4RWI3MGs4alEycFNaV2w0VFZo?=
 =?utf-8?B?aGxrcUxVcit0WlFVdWIvNndaaE1PdTIydWQyVno1S2VmSVl1VjMzcmlPcDV5?=
 =?utf-8?B?SE9obnJqWGlNNUs2TGNEaVZZdzB6MmJzeU5RWjBLV2NaVUY3TXBGdWJhRENh?=
 =?utf-8?B?ODdyb3kwaHBpMWh3dEcvZnc0R3ZlVk9Yb2YrSkNzR0hrcFY4RUxsVUpXellS?=
 =?utf-8?B?VURjdUN6Wm5iekpZZWVtSktISXZTSHROZWI3QXVxWkU4VDdscWYvSTMxQkg4?=
 =?utf-8?B?WW04QXNkVHJMQW1oMUdkRUZtUnJDd1FvaXFoOWNXd1lMdG1IMXpaVTNOd055?=
 =?utf-8?B?L29UZ1pUVU1ob013SkUwSU9pL3ArOUNaYXpkUXYxd0VzVW44OXZBMmJrUlhM?=
 =?utf-8?B?bUQzUGVTenMxZlhkWHBRaklyd1ZHV2JRbzZnQmxYZURuWnFNcjlKNjFyMGZa?=
 =?utf-8?B?TU50eTlIN3BTSExjcW9xK3J0blhiaVFTaDBhMzNCNHZoYVhQL3ZtVVdIaGhH?=
 =?utf-8?B?TmcrbkVQTkZGLzY2VEZCUjFoMitsVjdYSE82UXFvbHpTL1U5a0xSYWVncVNl?=
 =?utf-8?B?Qlk0em5CY2QxRGx2R0MrNGdmRnNXK2NCQkJuRFY2cktyVHV3STYrNjF4MVE3?=
 =?utf-8?B?ZkdpQUxnVSswYnN4Y2JVS3Q4YWFFV1RYbTRvcHFrNHIvUFU0TytvMVJ4S01V?=
 =?utf-8?B?dUtuQk9Tc0I3UTNCRldJYU1RQlNwNG83b3oxNStQTTQ2RkNCOGVKN05VWUdo?=
 =?utf-8?B?TEcwQmRMUklZeFVyNDEwUnppcDAvbTZzTHJpNjQ3QkMwcC95RDNpNDBCbXFw?=
 =?utf-8?B?Tm1zdzlYNE94VC9tcm9UTDNocUtBbnM4UkN4NDRNbmhBbndqdWZPU1ZqRWc3?=
 =?utf-8?B?T0luRkNCdjNJWm9VQUFUZHc5V0F1K0hiSnZjV1R2U2NiMnBZbnpwVjk1U0Zq?=
 =?utf-8?B?a0pZYitNL0ZvT0t0NmdhanJ2cVBwVmw0WEpzLzdEUFVNQnNZNkV4bkR1NXlF?=
 =?utf-8?B?UlNMbTB0OWR3cW15bnVoSXVSdG9aYzRrWEJYN3dLOHBmOG5MMnBQeE9BZW5o?=
 =?utf-8?B?YWVIVlUzTkcyWnNJWDdmQXZGV2dXY0J6aHFKNk1oeHJrMUgwR1dqQk1ZYWVk?=
 =?utf-8?B?WXBhblp4bmhkSzhxbGVESWtkK0NRK0ZBb1EwZzY5VjVtNzEvTEtxVG9EVjNm?=
 =?utf-8?B?SkNCdVV0M0xTQTFBdmxpTytaeFA0KzAxQkRJQ2ZqTExJdmpyeTNMbThLR1Z2?=
 =?utf-8?B?K0hWeEdYOTNFYStHVFJLTm5CZzJhN0Q0TU52dzA4UzZNSUlVcUgxLzl5TzY1?=
 =?utf-8?B?anhJcjZSWWErcWlGRnAxM0dXN3JRQ3AvWkpYblA3WkV5WUN1RUdhSnlYWE9L?=
 =?utf-8?B?RUFySGRNNXZXQ2U3eDZHakpoM1pndzhkNldGQUw5SFVobDhDcjl2WTlZaDAr?=
 =?utf-8?B?Y2p3Z3ZZMGtvWW5tcS9oMGJvYldqZzU2azRPZEF4RWZJTjN6Ymg0UnNOV0Vx?=
 =?utf-8?B?ZVp2THdmZWtuaDhTc0FvSlptdjlXODA2ekRSbWdBR1ZLbFZ5K0tTenFmWHFD?=
 =?utf-8?B?WFZCMjFzb0tEdVBITFBzanpqaEEwNStTcTNFRzJRVzJ3U1BXWXFUSzUyb01p?=
 =?utf-8?B?c2RiWWs0R3VsczN3NllDbkFKS0pDQ085d2hYWjkwN2wvMCtFb3hTTGIrbWlk?=
 =?utf-8?B?cnNEL1k5L29lcmtHUElSQkp3TlhlOUw0VVdpL0ExVXBHd3VGZGo0R3AvVzho?=
 =?utf-8?B?WTZOS1oweW95TEJmZUFIVXNBMHB5OEhhZHdrdm5VZXBWcjBPODdlNTNjeW1n?=
 =?utf-8?B?RTBnVzg5NU0vTm9kVk4wQ0NFb1NId1M3cHZSNFppM2hKZUU5VytHZGdHdGR6?=
 =?utf-8?B?OGk5WXBsR25WMUdMai83L0R5c1BQR240bjlCSnVPb25VTGkxK0g4K0hYcHdi?=
 =?utf-8?B?V2NFUlNqd2RMWkQrSlcwejZGaXJOcFM5ZmFuU2VPWVRhNDVNanhxbHBxWFdL?=
 =?utf-8?Q?X6UbKjxhTOg2wULk=3D?=
X-Exchange-RoutingPolicyChecked: BI9is1jj3FBmTrAzGGsCzU2Ai7xwhQQen/3EVnlYvpJmYbiti9/l2SDdnNcG29WtQH7KSDVZOEv6Q5Y0JyB03QPqMUjLZA2wg+amYE4nNaHfUTyJ8FKzKvpkIGUM4O5ppZcdGkuUk3o7cACqT/AuxSWdJYia5a7V12NOyB2zjwEyOxenlxd2lr+MqrPTjO9U/d69GujfhMkCYncLr1cXlwMJwZmKm+q8SWazk0G8opLLPnR6vDS9nQaOlvY4vmACPnUtPwAiJrkravUl8urf6PdRXZzVERiknpHTJyoyufdPMA/2IRpoADqic47tgAputrDRj0htqoYo6vbcxZMRPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a54f324-21d9-4804-b385-08dee30a33fa
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:16:49.6254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sphcrM+F/8NxZ5z9sFUV4LFJiOEpa5XdP/dqclXF04K42uh5MY4XDS+q3Amdbcd7yG7f511TZwAgPPnDWFvhg0yWZ5RY5TW7AeQKJbuNvxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
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


On 7/11/2026 5:04, Dixit, Ashutosh wrote:
> On Wed, 01 Jul 2026 22:23:15 -0700, Shekhar Chauhan wrote:
>> Add mmio-trigger support to xe-perf-recorder, to justify the
>> whitelisting of OA MMIO Trigger Registers in XeKMD.
>>
>> v2: Add all OA unit types, fix includes, compile warnings and adding
>> extra triggger for file mode.
>>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   tools/xe-perf/xe_perf_recorder.c | 122 ++++++++++++++++++++++++++++++-
>>   1 file changed, 120 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
>> index f200fe9c9..ecf1c7c27 100644
>> --- a/tools/xe-perf/xe_perf_recorder.c
>> +++ b/tools/xe-perf/xe_perf_recorder.c
>> @@ -26,19 +26,29 @@
>>   #include <unistd.h>
>>
>>   #include "igt_core.h"
>> +#include "intel_batchbuffer.h"
>>   #include "intel_chipset.h"
>> +#include "intel_reg.h"
>>   #include "ioctl_wrappers.h"
>>   #include "linux_scaffold.h"
>> +#include "xe/xe_ioctl.h"
>>   #include "xe/xe_oa.h"
>>   #include "xe/xe_oa_data.h"
>>   #include "xe/xe_query.h"
>>
>>   #include "xe_perf_recorder_commands.h"
>>
>> -#define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
>> -#define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
>>   #define MAX(a,b) ((a) > (b) ? (a) : (b))
>>   #define MIN(a,b) ((a) < (b) ? (a) : (b))
>> +#define OAG_MMIOTRIGGER 0xdb1c
>> +#define OAMERT_MMIOTRIGGER 0x1453cc
>> +#define OAM_MMIOTRIGGER_OFFSET 0x1d0
>> +#define MEDIA_GT_GSI_OFFSET 0x380000
>> +#define XE_OAM_SAG_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x13000)
>> +#define XE_OAM_SCMI_0_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x14000)
>> +#define XE_OAM_SCMI_1_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x14800)
>> +#define OAREPORT_REASON_MASK 0x3f
>> +#define OAREPORT_REASON_SHIFT 19
>>
>>   struct circular_buffer {
>> 	char   *data;
>> @@ -354,8 +364,47 @@ struct recording_context {
>> 	int oa_unit_id;
>> 	struct drm_xe_oa_unit *oa_unit;
>> 	struct drm_xe_engine_class_instance *hwe;
>> +
>> +	uint32_t vm;
>> +	uint32_t exec_queue;
>> +	struct intel_bb *ibb;
>>   };
>>
>> +static uint32_t oa_unit_mmio_trigger_reg(struct recording_context *ctx)
>> +{
>> +	const struct drm_xe_oa_unit *oau = ctx->oa_unit;
>> +
>> +	switch (oau->oa_unit_type) {
>> +	case DRM_XE_OA_UNIT_TYPE_OAM: {
>> +		struct drm_xe_query_oa_units *qoa = xe_oa_units(ctx->drm_fd);
>> +		uint8_t *poau = (uint8_t *)&qoa->oa_units[0];
>> +		int first_oam_id = -1;
>> +
>> +		/* Find the first OAM unit, like oa_unit_by_type() in the IGT */
> Let's change the comment to: "Find the first OAM unit, as in oa_unit_by_type()".
>
>> +		for (int i = 0; i < qoa->num_oa_units; i++) {
>> +			struct drm_xe_oa_unit *u = (struct drm_xe_oa_unit *)poau;
>> +
>> +			if (u->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM) {
>> +				first_oam_id = u->oa_unit_id;
>> +				break;
>> +			}
>> +			poau += sizeof(*u) + u->num_engines * sizeof(u->eci[0]);
>> +		}
>> +
> assert here that first_oam_id is not -1.
>
>
>> +		if ((int)oau->oa_unit_id == first_oam_id)
> (int) cast is not needed, can you check.
>
>> +			return XE_OAM_SCMI_0_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
>> +		return XE_OAM_SCMI_1_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
>> +	}
>> +	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
>> +		return XE_OAM_SAG_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
>> +	case DRM_XE_OA_UNIT_TYPE_MERT:
>> +		return OAMERT_MMIOTRIGGER;
>> +	case DRM_XE_OA_UNIT_TYPE_OAG:
>> +	default:
>> +		return OAG_MMIOTRIGGER;
> Let's do 'assert(0)' for the default case.
>
>> +	}
>> +}
>> +
>>   static void set_fd_flags(int fd, int flags)
>>   {
>> 	int old = fcntl(fd, F_GETFL, 0);
>> @@ -569,6 +618,28 @@ static bool write_stream_status(struct recording_context *ctx, FILE *output)
>> 	return true;
>>   }
>>
>> +static uint32_t
>> +report_reason(const uint32_t *report)
>> +{
>> +	return (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
>> +}
>> +
>> +static void
>> +check_mmio_trigger_report(struct recording_context *ctx, const void *report)
>> +{
>> +	const struct xe_oa_format *fmt = &oa_formats[ctx->metric_set->perf_oa_format];
>> +	const uint32_t *report_32 = report;
>> +	uint64_t value;
>> +
>> +	if (report_reason(report_32))
>> +		return;
>> +
>> +	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
>> +
>> +	if (value == 0xc0ffee01 || value == 0xc0ffee02)
>> +		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
>> +}
>> +
>>   static bool write_stream_data(struct recording_context *ctx,
>> 			      char *data, ssize_t size, FILE *output)
>>   {
>> @@ -582,6 +653,8 @@ static bool write_stream_data(struct recording_context *ctx,
>> 			.size = sizeof(header) + format_size,
>> 		};
>>
>> +		check_mmio_trigger_report(ctx, data + i * format_size);
>> +
> I don't like adding check_mmio_trigger_report() here in the middle randomly when
> mmio triggers are not happening (since the two mmio triggers happen only once in
> the beginning and once in the end). Checking should be coupled with
> emit_mmio_triggered_report(). See below.
>
>> 		if (fwrite(&header, sizeof(header), 1, output) != 1)
>> 			return false;
>>
>> @@ -697,6 +770,22 @@ write_correlation_timestamps(struct recording_context *ctx, FILE *output)
>> 	return write_saved_correlation_timestamps(output, &corr);
>>   }
>>
>> +static void emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint32_t value)
>> +{
>> +	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
>> +	intel_bb_out(ibb, reg);
>> +	intel_bb_out(ibb, value);
>> +}
>> +
>> +static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
>> +{
>> +	emit_mmio_triggered_report(ctx->ibb, oa_unit_mmio_trigger_reg(ctx), value);
>> +
>> +	intel_bb_flush_render(ctx->ibb);
>> +	intel_bb_sync(ctx->ibb);
>> +	intel_bb_reset(ctx->ibb, false);
>> +}
>> +
>>   static void
>>   read_command_file(struct recording_context *ctx)
>>   {
>> @@ -712,6 +801,9 @@ read_command_file(struct recording_context *ctx)
>> 		uint8_t *dump = malloc(len);
>> 		FILE *file;
>>
>> +		emit_oa_trigger(ctx, 0xc0ffee02);
>> +		write_perf_data(ctx->output_stream, ctx);
>> +
> So thinking about this, since we are doing this right at the end, because
> of timing, write_perf_data() may or may not capture the mmio triggered
> report. There are all sorts of reasons why this mmio triggered report might
> be delayed (due to caching in the GPU etc.) and so not available in the OA
> buffer and therefore not read by write_perf_data().
>
> The way to confirm that the mmio triggered report has been captured would
> be to keep reading from perf_fd till we have verified that ctx_id in
> captured reports matches what we are inserting via emit_oa_trigger()
> (0xc0ffeexx).
>
> To me it looks like the best place to do this would be to modify
> write_perf_data() (which reads and writes out the data). We can do this in
> a future patch, if needed.
>
> So I want to remove check_mmio_trigger_report() from this patch. As I see
> it, it is added incorrectly to write_stream_data(). Instead, after
> inserting the mmio trigger, we should read repeatedly till we see the
> inserted ctx_id. Let's do this in another future patch, we can merge this
> patch first without check_mmio_trigger_report() and taking care of the
> other review comments. So let's make the initial problem a little bit
> simpler and then solve the second problem in a separate patch.
>
>> 		while (offset < len &&
>> 		       ((ret = read(ctx->command_fifo_fd,
>> 				    (void *) dump + offset, len - offset)) > 0
>> @@ -835,6 +927,13 @@ usage(const char *name)
>>   static void
>>   teardown_recording_context(struct recording_context *ctx)
>>   {
>> +	if (ctx->ibb)
>> +		intel_bb_destroy(ctx->ibb);
>> +	if (ctx->exec_queue)
>> +		xe_exec_queue_destroy(ctx->drm_fd, ctx->exec_queue);
>> +	if (ctx->vm)
>> +		xe_vm_destroy(ctx->drm_fd, ctx->vm);
> So if we make init_trigger_ctx() void (see below), I think all these 3 if
> statements can also be dropped.

The issue with this approach is, what if teardown_recording_context is 
called when something at the start gets messed up before any of my 
changes even come into play, and then we might run into 'abort' issues. 
So, I've kept it in the v3, if you think we can still go ahead and 
remove it, I'll do it.

-shekhar

>
>> +
>> 	if (ctx->topology)
>> 		free(ctx->topology);
>>
>> @@ -912,6 +1011,18 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
>> 	return -1;
>>   }
>>
>> +static int init_trigger_ctx(struct recording_context *ctx)
>> +{
>> +	ctx->vm = xe_vm_create(ctx->drm_fd, 0, 0);
>> +	ctx->exec_queue = xe_exec_queue_create(ctx->drm_fd, ctx->vm, ctx->hwe, 0);
>> +	ctx->ibb = intel_bb_create_with_context(ctx->drm_fd, ctx->exec_queue, ctx->vm,
>> +				 NULL, BATCH_SZ);
>> +	if (!ctx->ibb)
>> +		return -1;
> Looks like all the functions called here just assert, so to me there is no
> point checking for NULL etc. We can just make this function void?
>
>> +
>> +	return 0;
>> +}
>> +
>>   int
>>   main(int argc, char *argv[])
>>   {
>> @@ -1180,6 +1291,12 @@ main(int argc, char *argv[])
>> 		goto fail;
>> 	}
>>
>> +	if (init_trigger_ctx(&ctx) < 0) {
>> +		fprintf(stderr, "Unable to initialize trigger context\n");
>> +		goto fail;
>> +	}
>> +	emit_oa_trigger(&ctx, 0xc0ffee01);
>> +
>> 	corr_period_ns = corr_period * 1000000000ul;
>> 	poll_time_ns = corr_period_ns;
>>
>> @@ -1227,6 +1344,7 @@ main(int argc, char *argv[])
>> 		}
>> 	}
>>
>> +	emit_oa_trigger(&ctx, 0xc0ffee02);
> Let's add this comment just above this line:
>
> 	/* Emit second OA trigger for the case where circular buffer is not used */
>
>> 	fprintf(stdout, "Exiting...\n");
>>
>> 	if (!write_perf_data(ctx.output_stream, &ctx)) {
>> --
>> 2.53.0
>>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

