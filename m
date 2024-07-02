Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF57C41513
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 10:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDB010E087;
	Tue,  2 Jul 2024 10:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M14ktdND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472E810E087
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719917386; x=1751453386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4KCa3kIlBXQuyKS7YkDo9cGIx+fE/Lg2HGGJNjTj+oE=;
 b=M14ktdNDxyQC6cyJevuWRf16a/wagl46t94P1d0BeXOzMrb5GMsmRv6L
 lcW70ZzHykn0NJ+OscaGzlLMq/vdB8UA6syzcAJyY3l3rCCLSl0/qr1XM
 fJCel1rzi2PWqjCPITDEKA+ckg0/YT1zPBS32T4KEXDbL9nKt87fuJ9+q
 pwnkSX3BJUMQW2/1eadtMSoLGe+yGungnL6s+/0exfuvZbTvb9INQLQeY
 jlh0PWN0cRX0H+hK9d26NNWkg3pJFW0StWi8mzHXzfv+wLORBi9sx4DEH
 P+RouskeHES6YAb9aMx2Xl+iVcEmUv/73X+QETMgfJrpP37cJEBuIs7yG Q==;
X-CSE-ConnectionGUID: GKaJ/7G1R26RKUV/GW7BwA==
X-CSE-MsgGUID: jEISdCQ2TxOsfgfkOY1UmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="28216660"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="28216660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 03:49:45 -0700
X-CSE-ConnectionGUID: jRDLSZZ+RKWku64biviqhw==
X-CSE-MsgGUID: H7S4/r+AT0e3+N9FVOqxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="45655455"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 03:49:44 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 03:49:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 03:49:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 03:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyIBGfw/h9xUfDLwBGNa3uwoJy2WNSWoKPstWaEZTCSmDU+ezti5aZN/6YazQ3Hmz7OpH/Exhpaeyo5LKl6absQvopiPaxOMzsBU+54qDm0e/ljSDBiuR0Bp+DBggAa7ivGMcr9DzF2Wj6kdEaAAmQsCiq95X0lk2BfadQlOPo8ru2l3VhvAg2le0NqokGHcPep1MKFfvRkolk8ZU75t9xkhx2OqSPEB209ZR1FTl48IGKYyc6usmy3qNGN5mdhgIQu4vCkeIQPTVPHkmo7dhqQ5Rc1futZKBfYYdW6Q5hHSh4J9PaVzs3LyPZm0oSkrJB9gSSX+s1/sC/O/ByAcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdwCy5bq9Gy7VqP++ruZJpUa77ywKkeMlNDrya2Yg1c=;
 b=cbQYNqzkO54GWqC8d7sutfQck62NF62A4ztQvMbnYyi0EF3dST2izddM1eiIuQEfn3nVt2Sr6MDzSFx8iLbGHIPETeePVYilcVCyrUw+3N8kAYBdfX8luH3ygNpxc5DBRjOxE+f4yA80l+axB1dXZUenIqFv/cLNzfIXGS8oSTFLUWuPY586b5zMd/nZ97TsvZIsAEJI3YQRjxyftvrQbtOVIhqi1a2qXZonX9SHA1LmZCgGnGYzdFzVBFpdWX5NEX9+Y1lgLZkFmNC4BtY3buklhYxvxJjlMlDIpHsbkUq6CZQZDcN8b2UVyLFpMeq85uVOqYmgAZ1h0LCPS++leg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 10:49:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 10:49:35 +0000
Message-ID: <3e4fb60d-901d-4716-9689-8f7e17a07a83@intel.com>
Date: Tue, 2 Jul 2024 16:19:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <janga.rahul.kumar@intel.com>
References: <20240701145439.91038-1-badal.nilawar@intel.com>
 <20240701145439.91038-2-badal.nilawar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240701145439.91038-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ea9980-cdd0-4dc6-3c22-08dc9a84a9ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWpKM3YzMmgydS9SS3ljQld2aHlicmtvc0wvL0NpdWxnY2tQaFNaQVN1VDhx?=
 =?utf-8?B?cDBzaHdZVTVXWXhTVStMLzdpOTBKMGtxS01nSGFVMmtnS2tvN3QzazZBVHg0?=
 =?utf-8?B?TzlBcDRYZkdsT0FPNGFLdTVFS29kcFc3K3ZNZmFDR2tRWHpybDV3V2U2Rkho?=
 =?utf-8?B?ZDRPZFpmL2s1YTFNd1Vaano2RXZ4STR0NE1uVkdtanEzTEphUWdNMEZoRjBJ?=
 =?utf-8?B?MXB2VHV4bk5BVzVwUUw1SVZNRnd4T3poV3ZMMFRVbHpaN0RIRS9CYWNxSFpn?=
 =?utf-8?B?UVkyYi9hOENlVXdRamNEbmM0SjBUOE1rZmFWaDlJYmgrS3l1SHRWM3MvTnY3?=
 =?utf-8?B?K2o4YjB6ekFWM05KVTlRUFROaUlrVVFBNlBHenlqa3BsUlp1UTJZelM0ZDl4?=
 =?utf-8?B?ajI3OWNJMGRBeDh6dXl6MWY5OHlXOXd4OUtuY2thYzRLcnhTSlBLek90ZTZY?=
 =?utf-8?B?QVlDL2lWd0FORE5XVElPZHNaaTZmMXZDQmIvM213V1l1K0ZwNW1GZzlHdG1w?=
 =?utf-8?B?OWFudkFwOU5HcnBpUGFKZkFpaDJVKzdRek1qdXlFRzNpZFBHeWpWeHkrYlRJ?=
 =?utf-8?B?R1JFb2pnQ25ZNnJhTzBtOXppbEpuQ2Vsb0xnS3lCTTZyL0xadERUTWVEZGdD?=
 =?utf-8?B?d3VQRW54VkExdEphbWhsRXpTRFcvY083QjhHdUw4b0FmM1NKRExNOXZ0VXND?=
 =?utf-8?B?UWhxbEVmN25IbE15dHBZcEZkOU5mVUxtNWxSWGJ4Q3FyOFdETWtTWmtGb1Vy?=
 =?utf-8?B?U1NLSVVkTDNDNUN6RWtKbXFOTkVqaXFKZGp6Vy82cmdBbDVPVDlNWkVmUjha?=
 =?utf-8?B?WDdEWisrbE1EZ0FuVGRUa1NLVGlLRU01TkI4Zm9acXh3eUNsVmRjZW1nRUsr?=
 =?utf-8?B?dUp1QUZ4c21lQ2k2dUlTOU1NVndUMmV5bkUyeU01YjBQQWxXbFNPQXg1M3Ny?=
 =?utf-8?B?MEFML1FyU3hQNGRyYU1YdFFNcVd6aTRCQTR5QkpmeDZIdXVyNTQ1SWNFTE9t?=
 =?utf-8?B?NWF0Tm40WjBUSVN0T1l6VWRLc2VvTnUzMFVwMDNSYXZoa3Z6bmRYSTNZNEo3?=
 =?utf-8?B?ZGxlWjE0Z0RQUDlYN21MQXdUS0xaUlVJbkpIUjZHWnd3QW9DUWdSRHhvTzJp?=
 =?utf-8?B?MTVYdVdJcFFySlh4bllnOTRjeU9YOXpFQjh0VVdWaGdIeFRXdW1NU1ZRbjNw?=
 =?utf-8?B?N1NvTHkrMklIQXNiUGV2ZFNXWEZzOXNTOGdKd1FpUmNmTzJ5bXdqN1ZNZ1Mw?=
 =?utf-8?B?ZHMxZWh3ajYxV2xLV1dndDg2RHk2aWl0TGNPSWFWNk43Nm02Njcza1d5cDZW?=
 =?utf-8?B?aHlzRGlYRkd2Z0k5SDltSG5ZRHJUdFpyMDZ6K2dlK1p3dDFRK0daalZjek9Z?=
 =?utf-8?B?MjFxUWJlaHl2dWlBUDQwSEY0TmhCWFlWcFNWSHhHdmxVaEVtSGpjZEl0RHRl?=
 =?utf-8?B?S2FibytweWpQNlUyWDl6SmxPUy9uL3MvVVZKdWJwYmMrMzVhVXhxbGczNUlE?=
 =?utf-8?B?S2cvOXdOTldobXhVYkZXSm85RWRWRytVaWw0ZE56SUZXd3hUQmEyb1ZDSStM?=
 =?utf-8?B?WExoRlU3aVN5UXVGRUJ5UE1ydVg0RURvQnptUEQzZkR4eUFPMUxZMGFrZkYz?=
 =?utf-8?B?elVLdWF1dnZ1TkoxN2xiM2xCVllmK0l2T2xTUEV4eUlyWVEzYmR4YmttYnR4?=
 =?utf-8?B?bTl3L2paRkUyWEtxWUdrSElNTmxSSklQUmJDY0JyQXA0NVFQMzFydk5oajZE?=
 =?utf-8?B?VXRNNy8zUHk5QnIzTjkwTDBRc3lWVkRpU2laTTFpYkpCWGlXV0FpNmdoaVlJ?=
 =?utf-8?B?eSs4WUFLbStpcUR2NGZTdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmh5a1k2ZWhOYkFyTHh6aVAvMWpoamVQcWpqMnlLejQxRitVeHdHbDEvQ0dp?=
 =?utf-8?B?Y2pSOFJIc1J5c1N0RFB1WWR1anVRc0NXY3ZKNkoyNmJGKzlhMEJCbGhMMkhk?=
 =?utf-8?B?SWpGdmorTlc3ZUU3bVB3YUJRa2grVFZocmdYaXN6bmw2YU1ldHJjYlJnMGRB?=
 =?utf-8?B?VDVkNXNvWnVFSlJOOWRhRU9kQkZHcmJ1MFZsbnlUNVRwemRHZmhLNk1DSjdK?=
 =?utf-8?B?NFlLV3BzTzF5QmVFMzNaTmM1KzdvRzV3OThCV2VoNCsrZ3dCaWgyOHlCcnRq?=
 =?utf-8?B?MU5FbG9odWNuMExManpEMXhWbWZYQk8zZHhWYWYzeVRsdDFpeDRNczZHbFQ4?=
 =?utf-8?B?NzFiZ2crQWRQb2FjWWpBeTVodjAxOEladnB6VmxnTXBjeUptalA0NHpzRmxr?=
 =?utf-8?B?Y1ZBRDd2dDRUWXNqWHU3UWN6WTh5aGh6TTVGRURRRk5yTk95OHZ4dHErUnNC?=
 =?utf-8?B?ZG05c3J1ejJEcUI2ZTFJYnVRNmlibytaQmNzRDlLTjhqcUp6SHI4dTlxdDBr?=
 =?utf-8?B?cXNSMzFmRURGcTVIdEpleDArRitYTi9YZFpMUFdjbWZjYXl2VHVXWEtKeFhI?=
 =?utf-8?B?TFhFclp5L3FKOFpoK0V6K3BMNGJ1Myt1T01PdlNRT3h4dTZsQ2ROOS9ENUhX?=
 =?utf-8?B?UXo0QnZMMGczTEp4dWFubVJQcHk4Unc1M08rS3Z2VDc3YlM5RDdEUEp5RTYr?=
 =?utf-8?B?b3VyZUZuK2Y4a2ZFTjNnbkYzczhoYi9NNzUwNFNXNUxJbEtIK1htOTd2by9u?=
 =?utf-8?B?Q2Zkb1M3VVFXSW5lQm50NXJWSHlmeXJwaDhCSnNqbHplN0RCbFl2bE5IRU1X?=
 =?utf-8?B?bWxVMVZ6SHpZMGtXQU44UGN6akpyenJRbUhZS2o2R3FNd29UbHJTUDh2SlFR?=
 =?utf-8?B?dlI2aDJ5L01HU05URjc4TGFXbTdHMHFvekJXb2JaZmpRVWxCNWNNNmM1OWRl?=
 =?utf-8?B?c3d0SWJxeWFSN2EzUEdwa2gwMnFqdHg3RGVkdVBzeW1uY2M2UWRUd0dGMm8x?=
 =?utf-8?B?OGtma1NqemVtdWlLUE1xWElqMDFkUmQxaGlQMnQzUEF6YzIvWW5GcUF2Y1BM?=
 =?utf-8?B?SWZ2STZrNE1rSURINmVLQjBzSHBkTklsMkRJK1JYTTk0cjNLZE5QVGdiWUE1?=
 =?utf-8?B?ZldZRGtYRUZVaE5wdHNuVGpHNm5MTDVuZDNGWm5IaG5zeEVJM0lndllaVWNz?=
 =?utf-8?B?NkREendMV01jbStyazlnV3FHTk5hblhTT1E3OW00U3RHdi81QkIwQ3VTSEtM?=
 =?utf-8?B?RGhyMlJzVW5lYjB5d3VLaHFkUG53dkdrN3NDa1d2K2hDSkE4azdCSDFjK1I5?=
 =?utf-8?B?K2cyRW5SYlFVRU04MzNrSFI4QmZIaGxTK0IrNmdkUGQ3aWJ4NzZhOTZzWWww?=
 =?utf-8?B?RnNTbHlETUxhUXFqak1GV0x6ekRWaDcvak9QQ3lsbW5YVzBOdERCSnV6K0Rq?=
 =?utf-8?B?M1hRRmQ1T0h6RkJmWGRlVGppWTlGWklxWldKWlVvNUhCMUE3Rjl3TkNPZGph?=
 =?utf-8?B?dFN3bGtodDgvYXlHclR2b2RoeEdBS25LdjVDZjVFR2YyZ0w4SlJqT3pGNVhn?=
 =?utf-8?B?bDFxdEZ0QW5rMGZiTTFYcXA2SWVXVVg0NC91VlpkVG1MOWhQbjk1Z0hYOCs0?=
 =?utf-8?B?OU1rREZJSFdpbENTTzZkZHZlNjBZakZZajQ2ekY3dzMwQzA0UVRYdjE4SmRh?=
 =?utf-8?B?b0JhdzJSckxSN3o4ZHB1TnViQ3J2TFhRMjFQa0ZHQ0pVSFNjSGc5cUZyVkJn?=
 =?utf-8?B?SjJSM0JOL005UGUycVVnTGxzeExsUmZuVkdadlJERXJRNkxYeVhsSm5RZHhv?=
 =?utf-8?B?MDdXWGFUVnJvL005Y3VFQS9XZnVlMm0wQ0JtMGhDeUU3b0g4WkxFMVp4WGUr?=
 =?utf-8?B?cVpsZE5hZVpCSVBscnFEWk4zcXhVbUxycVphQ2x1aUVKZmFXM0lLRkNER2RZ?=
 =?utf-8?B?NUd4QXdPVHkxcW1lK29CTlpqM25GSUZqK0J0eEtUL0lKWkY5Q3lpd3dMV0l0?=
 =?utf-8?B?K2F2L1hvaStwVFFGL01zaytUbFJ1bUFnR2xtbDQ2ME9kdUU2NEpPNDIyV0dU?=
 =?utf-8?B?SG9PNzdmVURWeVpTcEFHbEo3K0NVVWNpUFdJSmp4S2lrRkxOOTlXckRwanlJ?=
 =?utf-8?Q?n+wvXRwv2V8lxYtVxbgnGYshv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ea9980-cdd0-4dc6-3c22-08dc9a84a9ce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 10:49:35.8260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k7d7l3ajQNXuC0p7za77YuTb2AtcAnRe6OOqgxe5lluJq0EGiWObjdNW747fLbmUjcoUDxTlJ9C6kM+YVkHPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
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

Hi Badal

On 7/1/2024 8:24 PM, Badal Nilawar wrote:
> Use existing d3 helpers to cover D3Hot and D3Cold.
add description for the test being modified in commit message
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_pm.c | 49 +++++++++++++++++++++++++++++++--------------
>   1 file changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index b30e94a2a..eac5ea8a7 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -611,10 +611,15 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>   }
>   
>   /**
> - * SUBTEST: mocs-rpm
> + * SUBTEST: %s-mocs-rpm
%s already denotes the runtime pm state. 'rpm' can be dropped
>    * Description:
>    *     Validate mocs register contents over suspend resume
%s/register/registers
%s/suspend resume/runtime suspend,resume
>    *
> + * arg[2]:
%s/arg[2]/arg[1]
> + *
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
> + *
>    * Functionality: mocs registers
Functionality for the other mocs test is pm - %arg[1]
Should be same
>    * Run type: FULL
>    */
> @@ -629,9 +634,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>    * @s3:		s3
>    * @s4:		s4
>    */
> -static void test_mocs_suspend_resume(device_t device, int s_state)
> +static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_state,
> +				     enum igt_acpi_d_state d_state)
>   {
>   	int gt;
> +	uint64_t active_time;
> +	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> +			  d_state == IGT_ACPI_D3Cold);
> +
>   
>   	xe_for_each_gt(device.fd_xe, gt) {
It would be good to have a log to identify the gt running this test,
else would be difficult to identify which GT moc registers failed
>   		char path[256];
> @@ -644,19 +654,27 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
>   		igt_debugfs_dump(device.fd_xe, path);
>   		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>   
> -		if (s_state == NO_SUSPEND) {
> +		if (check_rpm) {
> +			igt_assert(in_d3(device, d_state));
> +			active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +
>   			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>   			igt_assert(fw_handle >= 0);
> -			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +			igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +				   active_time);
>   
>   			/* Make sure runtime pm goes back to suspended status after closing forcewake_all */
>   			close(fw_handle);
> -			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +			sleep(1);
> +
> +			igt_assert(in_d3(device, d_state));
>   		} else {
> -			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> -				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +			if (s_state != NO_SUSPEND) {
> +				enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> +					SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>   
> -			igt_system_suspend_autoresume(s_state, test);
> +				igt_system_suspend_autoresume(s_state, test);
> +			}
>   		}
>   		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>   		igt_debugfs_dump(device.fd_xe, path);
> @@ -766,7 +784,7 @@ igt_main
>   		}
>   
>   		igt_subtest_f("%s-mocs", s->name)
add igt_describe
> -			test_mocs_suspend_resume(device, s->state);
> +			test_mocs_suspend_resume(device, s->state, NO_RPM);
>   	}
>   
>   	igt_fixture {
> @@ -825,6 +843,13 @@ igt_main
>   
>   			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>   		}
add igt_describe

Could you also add the tests temporarily to BAT in these series to check 
the CI of the new tests?

Thanks
Riana Tauro
> +
> +		igt_subtest_f("%s-mocs-rpm", d->name) {
> +			igt_assert(setup_d3(device, d->state));
> +			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
> +			cleanup_d3(device);
> +		}
> +
>   	}
>   
>   	igt_describe("Validate whether card is limited to d3hot,"
> @@ -835,12 +860,6 @@ igt_main
>   		test_vram_d3cold_threshold(device, sysfs_fd);
>   	}
>   
> -	igt_subtest("mocs-rpm") {
> -		dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -		test_mocs_suspend_resume(device, NO_SUSPEND);
> -		dpms_on_off(device, DRM_MODE_DPMS_ON);
> -	}
> -
>   	igt_fixture {
>   		close(sysfs_fd);
>   		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
