Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA72CD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 14:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E6210E398;
	Mon, 25 May 2026 14:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNiD8Fy3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE9A10E398
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779718305; x=1811254305;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dkB3JkH9ESUldVkHX5UxKlIL4n7kKhnN9ArZMuZaOKA=;
 b=TNiD8Fy3BqhgFLH9wOcXP36BlQ2qCr+ZN+Tm9HPzMl51I5zebPvmhyWM
 bmZNJZ//tZTTyxdPqtfqcQPMMoZ8D0Z1k+saLeC4tCiUxpkulM80mxwEx
 WjSMR4+2Bt/aKEcF354FBxHrq8QV/EOg153JHS8sUyAZHCcrP/yRxQzM9
 FnOg64LKYHZLjYoeQoQbmUD6nTGCq0bMqMuotbYJjBjFbzROl+0tFjNba
 bF7zBXGL7RDNpDNlPU9YowHDK+BL5+vXdcdT7xAoiBVgAVsY8Lu6wI1Hq
 v79Wnr7tV9z//UDRG5s+tGICfMWMsaONrBe+XpbQUfxvfhEWdgjpBZ5WI g==;
X-CSE-ConnectionGUID: dyUViGg/SO2oJvu/GlXM1A==
X-CSE-MsgGUID: gP+IhWGBQpG7oqzM8Ojm8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79573658"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208,217";a="79573658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:11:45 -0700
X-CSE-ConnectionGUID: /Xg/UrCWTuqD5TQ2q6CkUA==
X-CSE-MsgGUID: n3atMnxMS7m9/N9r20HTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
 d="scan'208,217";a="246581170"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:11:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:11:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 07:11:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nE8kf3b+EDWxq/3Q6RjQvOcGnNR/9mP8NEhLVXtlCl0Qi+zvqbDtRQ4X09LXBv0Zq+ld0aH+bdB5x8UKfjfh15BCRQRw+b2Ew6FC3f8n7IB4SLXIcsRlXoJCjEdDM1ddPUYkbt29WtsuZNT2pfw6Gaw/2zezERwY8Kz0JRmI7eR9PUTE/3urI86dMixj5NuQsAFj5hwhiWXMGtDF/GMawqOIaBUZ6GtoszDbvJn8h6D+GfY4puPst4mVvK+DPB60l6qmeNH7W74xYgBqak5ryu2fKHwgaIf1OGw7B7wZkDso0vgEYwwhLK5xi8i1mO+Diw/OokEaYGtLZ8gMetK1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iZB03+D6idlHmEkrbH6mZ/MD9WgyKAd+N4/8N8HuTc=;
 b=UNFe48rHj3HAIf2BNSSrEMZ3grLzrx2s01f5n3IUIrPBC1gjfMPOPSuu9E+zs30x5siASPeBY6plEACWDBnSMcgmvy2P1F9/Ghk/CyPnVohUdsoGbB5WxapxhzBQ1TZnAacMfTBlb319j2clUn46/4/dXk0d4REpXf1QMW/doJBSzW0DxZ1SRJinESPX55ECtKB5K8a3HG+064MBhSdeFBjixvT1D2BEY39wFwh8JxX96HXrEhM80asnej0KAxeII9ZsoPIbCdJ1+aNgDWr5OQfJKfyC6S0MtYIDc3ezm44fdvfgeh2HrxS3Yl6+AKLZ1X48o0qm7bUpPdO5vXoqog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by PH8PR11MB9879.namprd11.prod.outlook.com (2603:10b6:510:3c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 14:11:42 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 14:11:39 +0000
Content-Type: multipart/alternative;
 boundary="------------4ifzsBEf6ESg2GGY0jNPSMcZ"
Message-ID: <937ff9a3-ff20-400c-a634-d3eb493556d4@intel.com>
Date: Mon, 25 May 2026 19:41:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
Content-Language: en-GB
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <aeIo15_JaYs0A_Y7@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <aeIo15_JaYs0A_Y7@intel.com>
X-ClientProxiedBy: PN4P287CA0044.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::14) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|PH8PR11MB9879:EE_
X-MS-Office365-Filtering-Correlation-Id: c1138735-cec9-4fd3-4663-08deba678a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|6133799003|11063799006|3023799007|4143699003|22082099003|56012099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: HI77rPl5fqV10+urbNbAJxbArbBzkUU4ghTbezjqd0lXicPpub5e4lLiqTi0nKWqDE/nwLBU7c2tRuYowaeD95d4o0RP//aikWbF1N1DVe+4gDzevcDLqfqVvWJBQGziGm29CcJeT3LnFXX6cmWZRwCr9TooPWTRDgRvMnTVeeeQFnCarJn0Mix/npG8vC/Cb1DhVvK7z1pON3se4x1tH6snoSu7D7fEXcu6iBEbdhYwlOZHDdhnSeKcgZIrT3Kvzn5ag5ShysY5QGZjkwe68TP7AScp6D65cyab7p3OIkSIfJSmqkJkMlSSQb95fJCJlN792Ujt4HoTasdP2edve74V3YMZqHr5CSlznMZDpaeodLR9eDajuPPY3VGsTAEkQyXxCiQC2tQORqPaVGNSfygpVU0+X3CAXVehIHYjBS1cXNEANqq8hqxIsU6gwMcmfcUok2+PnqxDuj+Iz35gw7v0ftNavCC0dTX+RpnrtnDv2c36sh5w+q8WllvA3/5umy3C8XkET384Wn5+tZ4M1Fj9/ziNEsUNS2u3zZmp1HHOzjDV4nHkBorNUotTQ3XV4D9xYUnXY9ZCLAoxOKg/dUMx8bHp39NAuwU/+fL8X0Qx2vYwCJKxTUgK4iCavK+weRaidl9vUUFl2rIVVz6xUuP39KX9gPKtuOrwhU8YTTjr6A6sZB0rdXUbF8fRPii+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(11063799006)(3023799007)(4143699003)(22082099003)(56012099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzlhNmpEZ3BhYlZ2K01HQ1lsUGlyeHE4Yk1FYjF0VHRqa0UyWVQxd1NKa1Yz?=
 =?utf-8?B?bURuNVJJbjRBU2hDa1NWYVpVK2xtdzZIY01uUmpuTU5UV3FlRTU0OXlDdnN3?=
 =?utf-8?B?dzBtdFIzV1FBcE5mNjJhckQyRUJnUlNiTXI2VDBWTTM5bEpWMkZOakxiblRN?=
 =?utf-8?B?YnVKM0ZvSWg5TE56bmg4bmUyRllqWXhtMm1wTzE3UTNNMlZXL2JEemEyK2c2?=
 =?utf-8?B?L3kyZkJCdGE0K01acEFwNXErZ2JBcWVpTzV4dkZlcHhiR21CQmxWTWczVzE2?=
 =?utf-8?B?S3RwRDB4dVlNUHNUQjd1dnYxeWExS1FrNXV5TGdsSUJ3RXlUOHkzSTcxTEF3?=
 =?utf-8?B?OGlGdGdzTU1RVDVKZkFadU9kaFVjYVRVZjFyUjFtRUVMZDBmOFhjdUxxb2M5?=
 =?utf-8?B?WGxVNnIrNlNvWDVUNE5YMkN3endSN1RjVlE4SmUwUWg1L1pIbDNvV05jWHlL?=
 =?utf-8?B?WHBJV25qSHo2eVVBRUpzV2daOEh0NWpQaXF2YWpzOTBmV0RPaEFLTnJIZU5s?=
 =?utf-8?B?RG5VSThCdzVWNlF3TkQzNU8vUTZqRmgxcFUxMkE5KzVlTjgxc3dwK1VBU20x?=
 =?utf-8?B?NTh2SHlRbkllOEpDVk5LNlc4TTk0bkFTSGt0NXpkTG42U0RJWEVwOWJpbSt0?=
 =?utf-8?B?azJqRC9La1V2ay85MkxET29XVmFMRVNPbWdMR3JyS2tOdGR1TTVNWDJVUEJK?=
 =?utf-8?B?TWtCNEUrekFheXhNbVlsVXB5UDZtdXpURGRqQStXL0FTQmxZWTk4TzlOK1Ir?=
 =?utf-8?B?bGJiOXc0Ky83SjBuTit6dGI2TDBDSDA1R29aYWZOR3FQNkMwV2IvR2NmaTI5?=
 =?utf-8?B?M2pZN0VKZEtoS05RTzVGMUo2c3VPTFpuVFk2dFBhS0c5ajJkLzJIZXZqTUdE?=
 =?utf-8?B?SEJiQVpWMXRHZjFJb29jMlh5bjVGWk1tZFZzL1VOTkhGUDVMYWhBMjFwZlZ3?=
 =?utf-8?B?S2syUlM3UE5nQ1FEUkR0SnJwUytjZEc2SnBrNXhlN1V4NW13czRRQjRoZTY5?=
 =?utf-8?B?NG94cU9hNmIwTWpjQU1lTXdHTHpkWjgyYXNtQS9FUGJxSHA4RTRMYlBxRFRB?=
 =?utf-8?B?b3J1eWNFdlRDMkVMWDVvdEpodklXM3ZpbUVRbTZrdCt0K3hWb1Vld3ZTS1Zl?=
 =?utf-8?B?anRmdUhxSTdWWHU4R21xOW9BTWs1a1RPUi9GZzlWOVJHVW95VGhzcithWGtO?=
 =?utf-8?B?eDdXL0FVZ0JpWkpDQktOeHRwZ1FpZ1o3MzA4WURVc0M2Ym9UUVF0RWRtaTU0?=
 =?utf-8?B?aEdpTXRGNXBRbkhxaUFrcWNFMjZyeXBweTBUZ2NBSU1DRXFxZzJCaTNmVld3?=
 =?utf-8?B?c202MDZwYnpjcWRPbFMzZE12cVQvZVo2S1dhRm4vWGUrVEJCUEgwT2dVNEtI?=
 =?utf-8?B?YWRVT0NZM0RtQXdFMjRwMktaSzFUREtvL0tyeGRnSHQwaThRL1E2NHhJZ1R2?=
 =?utf-8?B?QXBOd29wcURSWVl0NERxZHh0WGx5cUtsdkx6NDBzYzBhaGNOQS9Xc0dmNXg3?=
 =?utf-8?B?ck5rRzBpVkppNUZDWWdjU2M5SG5OUFJwV3pjeElZOTQrUFlWblk1dzN3cmcw?=
 =?utf-8?B?bkVkTE1ld2xMbXN6YVhFM25FWDhWRS80ZngvOXM1elNEaGpMaW5tT2hoTG42?=
 =?utf-8?B?Rm9YUWRMU0hPVmNkMjlxbjRhUWFxTXczQ1M5a28zVXpWbklrL2NxdTVtM1hG?=
 =?utf-8?B?cXJQSExkRVIvMXAyMWFrbFdtYzVwOFZySnhyeFJ5UnNUZ1FWczBSMXB5c3NO?=
 =?utf-8?B?UmZ4RnFzUlB4ZHN3MDM0K2xpamlZNW1tQkVjTjFwQ3JJOFNwcVdVcTlmWS9n?=
 =?utf-8?B?REY2aDY4ZDBjOGphQlQzZ1hjc3RKVjBJaUYySmR2SnJBVy9XSFozaDA3WU5S?=
 =?utf-8?B?NTJQZlZwU1pxY2hISHNyZmFPTnkxUlJsWUVQc0xNY0tNdDJxODEvOXRqNkFP?=
 =?utf-8?B?T05rOXNVUCt2aWFBWFFIMCttbWdrMUcwTTJqd1N6U1FFV1ZLUHRaRHBCLzFW?=
 =?utf-8?B?bndWQk9KakY1cDh5cHJlZDN6T3ZVdGRlcytlT1NJdzgrWXVuNUFpSUtyLytt?=
 =?utf-8?B?b0d1SnIyWEc3eHg0NE1ySkw5OHZjcHQ4WFVUcCtjTGFNVnIyVzE4cmtRWHox?=
 =?utf-8?B?UzVncjd4cFE0a3hMZ1pVV2piSDdYRVkrRnFLc0E1K0U5czRaUUJvSGE0UGh5?=
 =?utf-8?B?cWczbUxSd2pxU0NRUEVwMnhYcjZkbGxkampiZDlhTnczaU5hUGtEZk02RUp1?=
 =?utf-8?B?VjQ1d1lGWUdrU09SYlEwaXlGRFV3Qy9JbG50RGtJYnBCYktOVUVGckw4M2Zn?=
 =?utf-8?B?ZVlXakZIZlcrbER1bUR1MkF3ZS9seFRrQURrbWxVckZKZ28wVGk0RUk2V3ow?=
 =?utf-8?Q?FStc4uN8U2Uie0lE=3D?=
X-Exchange-RoutingPolicyChecked: LLVyP6b6LKht3CqmkuT0Ii3nm5aHJjacmPTOl01wxTqoaz1AdFsghR4jc5LOCU8fZzqAMjw6vLKYXgxw3EkH3BaoObJdh5Xf/nGclJz1Mz5VgdQAkbujxnO4aTpFi6362/K5w5Gjivak/MeL5WzeuXBoe4Ws2Ldt8dJ9putRzRowbhM1KXncD4DjR1+DIPBvk/qrMr4IA708iDiN4EGffLU9z/pOTijiAr1HYVStiMeySmeY2XipNkU+oreCMwbAxphGJBwYhMZM6+lEkHEMIhhx6cJ49tGkj0LEQS0PuPYBEHGXxYYBKoFks9UWDrcDbOMZkeUucQYMxpoqOLpTdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1138735-cec9-4fd3-4663-08deba678a08
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 14:11:39.5351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UseOCX/ps8EDD8G3ruIeFkovLU3Sne3bigq2O6QGG37TztpeCPKZSQSXsgRDKMhr5fEHCI8AXA2h2i8s2dldxHseoTT66ewboYSxRBd4bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9879
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

--------------4ifzsBEf6ESg2GGY0jNPSMcZ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 17-04-2026 06:04 pm, Ville Syrjälä wrote:
> On Fri, Apr 17, 2026 at 02:04:59PM +0530, Mohammed Thasleem wrote:
>> Remove the deep-pkgc subtest as it depends on other display IPs which makes
>> testing unreliable. Current validation uses Package C-state counters that
>> are affected by unrelated system components and requires platform-specific
>> checks that vary across different platforms.
>> A redesigned test with proper display IP isolation will be implemented
>> in a future patch.
> What is the actual plan for that? How would it even be implemented
> and when should we expect to get it?
It's in discussion with hardware design team to come up with hooks for 
better validation and tracking.
>> Mohammed Thasleem (7):
>>    Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
>>      test"
>>    Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
>>    Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
>>    Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
>>      check"
>>    Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
>>      calculation"
>>    Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
>>      sleep state during extended vblank"
>>    tests/intel/kms_pm_dc: Remove unused pkgc functions
>>
>>   tests/intel/kms_pm_dc.c | 98 -----------------------------------------
>>   1 file changed, 98 deletions(-)
>>
>> -- 
>> 2.43.0
--------------4ifzsBEf6ESg2GGY0jNPSMcZ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-04-2026 06:04 pm, Ville Syrjälä
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aeIo15_JaYs0A_Y7@intel.com">
      <pre wrap="" class="moz-quote-pre">On Fri, Apr 17, 2026 at 02:04:59PM +0530, Mohammed Thasleem wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Remove the deep-pkgc subtest as it depends on other display IPs which makes
testing unreliable. Current validation uses Package C-state counters that
are affected by unrelated system components and requires platform-specific
checks that vary across different platforms.
A redesigned test with proper display IP isolation will be implemented
in a future patch.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What is the actual plan for that? How would it even be implemented
and when should we expect to get it?
</pre>
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-family: IntelOneTextNormal, system-ui, &quot;Segoe UI&quot;, Helvetica, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">It's
      in discussion with hardware design team to come up with hooks for
      better validation and tracking.</span>
    <blockquote type="cite" cite="mid:aeIo15_JaYs0A_Y7@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Mohammed Thasleem (7):
  Revert &quot;tests/intel/kms_pm_dc: Ensure eDP detection before skipping
    test&quot;
  Revert &quot;tests/intel/kms_pm_dc: Add polling for deep-pkgc&quot;
  Revert &quot;tests/intel/kms_pm_dc: Update test duration to 4 seconds&quot;
  Revert &quot;tests/intel/kms_pm_dc: Update VRR handling and eDP output
    check&quot;
  Revert &quot;tests/intel/kms_pm_dc: Add time unit macros and update delay
    calculation&quot;
  Revert &quot;tests/intel/kms_pm_dc: Add a new test to validate the deep
    sleep state during extended vblank&quot;
  tests/intel/kms_pm_dc: Remove unused pkgc functions

 tests/intel/kms_pm_dc.c | 98 -----------------------------------------
 1 file changed, 98 deletions(-)

-- 
2.43.0
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------4ifzsBEf6ESg2GGY0jNPSMcZ--
