Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379DBC55AB9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 11:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90510E7DD;
	Fri, 20 Feb 2026 11:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbD2JV9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E73810E7DD
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 11:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771586002; x=1803122002;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SmmK/6t1aMjvEOKpRCihELpmk6E5IBaZk7PEER8VCsE=;
 b=cbD2JV9/asBZ3mYfv4giKgSwt79FxNkRMItSNOUo7nSuekyUaiXh51/r
 kPsd60VA0RSJte6iaC3kHRlyKaRov+cuo2jMoS9+kvV7jIRgRuVMRRWe5
 +KsQ8XA1rBK08kTqamkwtqpid8AcTWc0D36B2L9K8ojXdz7q8rZlsXD9+
 +5b2TsOjDS8oKy8eAuBlHSPnb99rZjpbKHKnuzbl1DBSikqeq6FeThD9+
 x6o9n9KtKs9rWwPXdclkx8AtXJTDoqFpklKqZMmA0P/uT64XaKsYqDlqV
 rsvHaqhPTMDzA5bIJmr76BSFPDRJf3za1ND4MuYDwjGHEjs+9uWuWq59l Q==;
X-CSE-ConnectionGUID: 1xjepZeWQC+S7Xvmiz+7nA==
X-CSE-MsgGUID: QlVgoTDVRQuPnD/vOV1I+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71883586"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="71883586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:13:22 -0800
X-CSE-ConnectionGUID: audhQ2yyTuK5wfWyHiyFJQ==
X-CSE-MsgGUID: yVgFeIpjRT6r8Tq+sy86Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214052217"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:13:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:13:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 03:13:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:13:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+4rHMpuONg18DUDyBzhZn/IEaN6GYynj/Xn49AMjPEW4NTAItMzWke192LJPpiC/zx7PQOzg9/uU7RnaEM/xltHcyt5XSIpiDZvro/RtPldF188/RckM9DNHg5WVuPQ0o4blLK7n8nPrZ+X6clWm0WDqdVIapy5OXYmniwMBhnP150816FbhuoKZ8r3lkcsAYAYvqZMUfAnU35Vs+DwLxijeW3GRAjL11hqoaZyB9Kgxtx7MEB1nE8jP8HCyrK6STwOiSsMZZUxt+U1JAh/UIPcB8PdYPSoPV2Lg1Xx1xqfHQUcAyKq8zySBsl77REonEQhH5cLaGoQx2lYCdaELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLAU0G3+fo8/TtUj5Z+xD81Z4O+f4M2LARbh8+TvPdI=;
 b=ZyHf94EVTWdsAKKdXt0FOBcbmQNjOQQHtOZDEzOttrYxZB4i7alh9J8zwJxWaNGzkv5SXltWy6NEludTUzbzAAEfZJD6J8cbOoNS9lm0kcicF8yLDFzNJpWBPlzj5/nM2wwbuNFHrP2APrFb7Tb/EeLpusupaek3NqMZls1VaC7Wu0/N+QISdIkpWfPR3g8SLrUR427AF3roG55Pf/tH6W3C1sPOpT+Dnq0Kjb+6Na9gg1niPV9bWGLbJ4CsY9xcT53rBVmB5z4G17MWQkh7RC1neZaRSPCPC9JSA9hVF8OQlKUGfOzXqrhy0eL5d9+61BYeqd6ht0+JxjdNmU/ppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) by
 SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:13:17 +0000
Received: from DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129]) by DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129%4]) with mapi id 15.20.9611.013; Fri, 20 Feb 2026
 11:13:17 +0000
Message-ID: <e792d252-3a9c-4273-ba7f-a8a1f67d8d0d@intel.com>
Date: Fri, 20 Feb 2026 16:43:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/kms_color_pipeline: collect reference
 CRC once per pipe
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260219090545.340383-1-chaitanya.kumar.borah@intel.com>
 <20260219090545.340383-4-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260219090545.340383-4-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::17) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5993:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f563721-668b-4712-1313-08de70710c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHJiU3FuZUEwRHk3RWoxdGtXeGwrR0RsNmROSlJGWEV1VkRqZDVXQjhYd21Z?=
 =?utf-8?B?djhpZDV2V0xzTnl0WmZ3RG96WGFKbUVOdkQwdENMQVpydUJlcG5QMnVjeFdO?=
 =?utf-8?B?SXlPZDBVaG5wN0JETHVjUjVOdzVuVGNtbVRQTjhMbjM4Z3A1RFFWVHpOcFhE?=
 =?utf-8?B?VUpaTVFickx4Wk5MQjhrWFQrMHdldnYzamxWc2pUQXJwK0JxRkxCNU9ZT3Q0?=
 =?utf-8?B?REE5TndTMWkzOHZURFpzYVVJemR0aHpZRkpqeHRZcXNYbmdBOEZndk1QVGJa?=
 =?utf-8?B?OGx1SWNwbGJ0UTM5ZmYvakg2T3lyTlVWZmdzU2M4SVZMQzU5K25YMnJOSW40?=
 =?utf-8?B?cFlMK09ic2MrNTM4eGJGekNLU2ZycjRHTUFObUJkUDEvZFNydjZvZzBXcVBL?=
 =?utf-8?B?akx5bXRueTZPOVI5UjFzR2RXdkRwWVF5bzdYejliMy9WM0lxMzViSFF5bkha?=
 =?utf-8?B?Zmx0MisxazhHNzJCbmh0LzBaT2dNWWt1OW5yWkpnV05rYWU1cU5WbFJGdjJT?=
 =?utf-8?B?NGp6SW81YTRsV3B4NkRZQmxtSFVsajd2T2JESUdzVlgxcG5PNDlxVHdCVVlZ?=
 =?utf-8?B?UWdEdXdnaVRYanU1Y01WNUt0eWJrMi9mVWZ3WmUzNlRlZlRWMU9NSExIa2M4?=
 =?utf-8?B?cFRNVythYnBJNkwzZFN3YUhyRmZHSGpkSUZ6RzdIZUhXaWVjRkxKQ0M2NklG?=
 =?utf-8?B?REZzWk5jVTZaM2VTMERHSmphaUhqZmYwSExFTkQ0bkY3RDh6dGgzeEJYQ3Yv?=
 =?utf-8?B?aFcrd1N6Z0ZkS0R6RUV3QUF4bjk2V3VRVmovUDExN1ZkMjMrT3NpV29PbGNh?=
 =?utf-8?B?bTNDeFV4eFgyajlKTUIzMmpZQzArRlNQdUZNN3pWZ0paWlNMZytxSFY1Y3NQ?=
 =?utf-8?B?STVuZWVzVmNxR1I1NDhMakNjODZkSHM2NDFYT3lWankvcityQXllY1RXMnRD?=
 =?utf-8?B?WkNUQ3R0SnpLbjNnam5aRnJqT0lsbW5BY05xYkptSVV0QUVkcGpBdlp4NTVV?=
 =?utf-8?B?UHozU3Bmem9SMmVJQXdLcnR0a0l3WmVSL2JKK1luUFN2a1Q5SGxOOHJFZEJW?=
 =?utf-8?B?SXBQaExsZ0FpOWVMK1dBTFphdjhEY0lWWGtMMG9zNkV2QTdzUEZjcUtBeW9K?=
 =?utf-8?B?ZjllSnkvcjgyMnVvMFkycnFBS0c2Rkw4NXRoZXVYaGpoUFYwNjROckxXZ2R1?=
 =?utf-8?B?WEQyNDJTb05vK3FWQ0hLaktKRERqNnZsUnVFTURnREhVVkhhdytJSWtVbUJ3?=
 =?utf-8?B?dWtNY0x0OGl5UGU2YUw1QTFMamZUb3p4WGZOYm50RXlMMC9FN2dPU2cySEV6?=
 =?utf-8?B?S0xvaDJjdWRmZUwzWWR5aUNtaVFHQ1FPM1h3ZXl1RjdQd1FramRuemVsY2Rm?=
 =?utf-8?B?TUQrY1BkZURZd2lMTEQwcUJCUjFRdUFKWHdmalp4eWowaDhaNHcxTlpJd3lN?=
 =?utf-8?B?Sk16MTdPekpPdnlQeTl3ZTJrZnRzSGF6S3V2M1EyRUNXbHVMdTNpWThWOGFZ?=
 =?utf-8?B?a20venBJRTNaMTU0SGZiNHlaSm9JZ1M3Y0ZtZHNHRnVqVWErTzJ2ZVNweW1L?=
 =?utf-8?B?R2c0K2ttVkZjcUZ3aWx5QktUY1YwQUZUTDgxeXFQVmdkVC80UmZIY0hiR3FQ?=
 =?utf-8?B?amNzM3c4V3lHVzZvY2loUUdvemFUdkM3ZGRhSXNSdGxaY1hCakN5YjhleEZH?=
 =?utf-8?B?aHNBa3VqM1MxbEZ2cXhGMk81ZkJxa1ZUb2tlaVViVjA3eXlXMnNjN29rUHR3?=
 =?utf-8?B?c1p5UTJ0ZEpkVmpvd01yNVRzSWQ1amxiaktSQTZqVHRIdHc4aWVoUDJiMURq?=
 =?utf-8?B?aGFXNmd6eHVRT09DMXhXVTE2SG9jQXlmMnhSdHViOEN2d3JlRWRUbEc4MDBa?=
 =?utf-8?B?eFNJYlhHVCticEhHU21IMmNOd2JxUXBkS2ZvQU5rT3NPZXMzcjlkVkFzZTdQ?=
 =?utf-8?B?S3BkSEt4djJ3Nzd0RS9USjJEUnkyUzRJM0s1dTRRNUtablpLelRLbTVxbFNa?=
 =?utf-8?B?VUN3M2lad0lIT052YTE4M0ljV1dWRk1WT0lHSkR4NGU0eUdWNmhVMjhJc3JR?=
 =?utf-8?B?QktCV3l3ZExTYWptaERHSCtxbyt1eGVQVFJHNUNjRm5MWWN4WW91V0wxT09p?=
 =?utf-8?Q?a050=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5993.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qlg3RUFXbnpuRXRqOXg0dGVzZ2Y5Zm5Hak1QYzFaUElVaGJ4aDBXcFoxaGM0?=
 =?utf-8?B?Vk9MZzRpSGJleFhNZkVyZjZaajRqQVZHb1FIc3k2UzcvVS9ERHNSN3RvY3h5?=
 =?utf-8?B?YXZZb2Y1WEUwZkczQ2YxZXhXY2tNeWw1VnM4cXpndFI3am5pSXpFajJhOXUy?=
 =?utf-8?B?UjZUSHhrR3lVWHRjT09XRnBKVThobE4vaFRkcW83OHhrRzdHZzVEbjBBVU1P?=
 =?utf-8?B?N1dKbGw5VCtIKzQ4T1FscHBhUDhOdyt1KytxNmZPYkJlSVZIZHNzUzh3R2g0?=
 =?utf-8?B?RHNEbW43a1JoV1RvUFY0elhKRGRocHkyY29hbThJbWlZMzR0QytteXNYa0tC?=
 =?utf-8?B?bExlZ1JkUldvSnhUeEg3MVhzd0VyS0dvSFhMd2ZYbnNVczhCcU1MTVhDSDV2?=
 =?utf-8?B?NnRhYnVvMGhSQ05VS1pqSytRK2s5ekVmVXdVdG11TWlFMmYwV0tzZHlvRmhX?=
 =?utf-8?B?RXIrcVNWaU5vN0RaY0ptaUNRRmtIY2Z2d0k4WHpMWXF1SkN2Vys5RFZieDRx?=
 =?utf-8?B?RjBWOEhmbDNQd24wZ3NTUE9xY2hyMUxrR2lyNHViK3k5RUxPVVJUR1UzT2tr?=
 =?utf-8?B?eWhnTmNmY3BuSERabHcyYzJIelU5Nlo2aTBiT2p2VVJYektwd1FzK3ZnSVYv?=
 =?utf-8?B?bUJlWWNKZU9LdUhoSjBqMkx6SUVjZ0x5dGZiMWpjZEJLcmtOR1o5Q2dsa2RT?=
 =?utf-8?B?bkVRc1ZWbE5DdXdxYkNVSTI1Z29zUUc2OENub3BPQjFLL0FPbEJCV1dQRHJU?=
 =?utf-8?B?YU9kVTJuYTdLL0cxTWVneHMzT0pnZlRnTUxhSHVRcDdQaWNBeHdDVmNkRmN2?=
 =?utf-8?B?REI5aU9rVjFGQ0ZPbHliS2R5UnJ6MkYxejdDVnRhSTBCRHlZTVZIZzNEeTVF?=
 =?utf-8?B?bHJncXJndW9sVGUwUFRkeUIxV0JYUWZ1YWZhV3lsYnN2UFVyTzNyc0NTNzVr?=
 =?utf-8?B?R3M2WEJsanZxNUowRUVYeHlBOGYzYkhtNDFxM1l2eHJLWWdRL1JZMGxyZ0xv?=
 =?utf-8?B?c25OWkxBbVhGZE1KUWdhcmZLSzgycnNLV084WFA5TEgvMVpwTU5VZ0FWdm1l?=
 =?utf-8?B?Ukw2RjVEbCt6L29tRTRzVTNQemprQmJmaStGdktCeHFac25jWjBCaCt3V1lF?=
 =?utf-8?B?L3dWcGE5ZjdkUjhmWWtFb2prT24xMkZvajZ5dHpMUS9MeUdFeXJad0Zxbmhy?=
 =?utf-8?B?V0NPSFEva3lhMnkwUUlOeW15WkpZY3kwUTUwK0l3VGhuNFA1dEliM3ZSZWt5?=
 =?utf-8?B?RlpRdXJqc0k3N2VsNnZ2OFlkUysranN1OFhYeExXVnEzaWV5WUl4YW9rQVFs?=
 =?utf-8?B?OWNmakxLanRWcys1d0lKdUw5N1FmbkpURmhiV09icktNRjN6RkQvOThyby92?=
 =?utf-8?B?RURyWmRiMVE3OWRxQUtzakhYYTRGRXZ6b3NPSS9MTnBiTmZWcmhWaStOcWZv?=
 =?utf-8?B?RXVITWZZNjQ3RG5PSFUvMStsNUZvL3VPcmk2ZE92SUJXTTYxeGJCdnJ3T0wx?=
 =?utf-8?B?T1lXamRaTTNuZXBUSjFTU2dEektZVzVHQUZtMzg5c0xRVFVTRDlZc3gwUVZk?=
 =?utf-8?B?LzBDZWk4MG5keUx3NlpCKzVxeHRFUldkQmdLRUlWS0Nya3d3R0RtN3FHcTI2?=
 =?utf-8?B?dysxd2MvZy9vbE5VOFlTbDQ4aHg3VmEyZTdiZjg5MUpnWWZzRWZIaExrZkc2?=
 =?utf-8?B?NEk2aU9YQXB1MGw5b04yM3BqNzRRemVvWmJZZmZTdjZUa2lnZU9aTExKL1Nz?=
 =?utf-8?B?dncraDNLcmoxdGJaUmxkQ0JPSG4zcEFwejN4c2dDZDhWZmFDcGpZNDZxWFVs?=
 =?utf-8?B?cmwwZ2NBQ1pZbEo4K25nN05HVTRQY0lJYmxuTkxqR0pPcXdqTjltTGhxYnJZ?=
 =?utf-8?B?RlNIZ1dnQXFzQTQ1bFptUEE4bkJxSmF2NHdYekd4V3ZlUEZYTnhhU01vNEVD?=
 =?utf-8?B?d0JBTFNHdHczd0tQTWNyeEc3RVZvM3dMZTFlOXpWbnp5L29IaFVGVG9RdGlG?=
 =?utf-8?B?b2IxenQ5clU4aHFXL083eGJkMGJiVG5HS3piem5nd2Juc1U0bGFXaEhUS21M?=
 =?utf-8?B?aUw4eEhnbEFCZitMMTJkT0dVUDVWeHhEZDNPNVpEZFJWK1FKM1V6QjdLWEFW?=
 =?utf-8?B?STFzeldFT2dHdTgrL3FTSTg3ZWY5NkFxQVlMeDI3MHhLRFNDWHVpV3ljVDNE?=
 =?utf-8?B?aHh6Z1JUQm5ueTlYMHVxSW9xWnI0MHdlUkJPZFBCcWwybTNoNktZRmpsZytW?=
 =?utf-8?B?czJ5S0QwbU52ODhwRm1VQVZjZTZGL080c0NnYm5MMEFJaU9TVDJsTFQ1YTcy?=
 =?utf-8?B?NWZObDJlRHJmN0pmbVlxeVdiM2FVS082K0lFRXJvLzJzNExZVEI1Mk5NS3dn?=
 =?utf-8?Q?IAo4svxQyHzUiYxM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f563721-668b-4712-1313-08de70710c1b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:13:17.3541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qQ2hPNbgJQt1e1bAJ/LK0yW3BmXMTWz7geftqjkQjDcCbqCDFBGVe9c0igV5D70tBlnw3iEJDN+t7b3UD1pTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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


On 19-02-2026 02:35 pm, Chaitanya Kumar Borah wrote:
> The reference (software-equivalent) CRC is being recomputed
> for every plane even though it is identical across planes for
> a given test configuration. Refactor the test to collect the
> reference CRC once per pipe and reuse it for all planes.
>
> v2:
>   - Rebase
>   - s/test_grab_crc/capture_ref_crc (Swati)
>   - Use DRM_PLANE_TYPE_PRIMARY (Swati)
>   - s/igt_skip_on/igt_assert/ (Swati)
>   - Add a comment explaining why CRC capture on the
>     primary plane is sufficient (Swati)
>   - Wait for vblank before CRC collection (Swati)
>   - s/reference_crc/ref_crc (Swati)
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_color_pipeline.c | 66 +++++++++++++++++++++++++++++---------
>   1 file changed, 50 insertions(+), 16 deletions(-)
>
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 4ba4ea605..7da78b2a5 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -87,16 +87,58 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   	return true;
>   }
>   
> +static void
> +capture_ref_crc(data_t *data, igt_output_t *output,
> +		const color_t *fb_color, igt_crc_t *crc /* out */)
> +{
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	char *crc_str;
> +	int ret;
> +
> +	/*
> +	 * Since CRC is collected at Pipe level,
> +	 * collecting crc for primary plane
> +	 * is enough for reference.
> +	 */
> +	primary = igt_output_get_plane(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	mode = igt_output_get_mode(output);
> +	igt_assert_fd(igt_create_fb(data->drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    &fb));
> +
> +	paint_rectangles(data, mode, fb_color, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	igt_assert(!ret);
> +
> +	igt_wait_for_vblank(primary->crtc);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, crc);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +
> +	crc_str = igt_crc_to_string(crc);
> +	igt_debug("CRC for reference fb: %s\n", crc_str);
> +	free(crc_str);
> +}
> +
>   static void _test_plane_colorops(data_t *data,
>   				 igt_plane_t *plane,
>   				 const color_t *fb_colors,
> -				 const color_t *exp_colors,
> +				 igt_crc_t *crc_ref,
>   				 kms_colorop_t *colorops[])
>   {
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode = data->mode;
>   	igt_colorop_t *color_pipeline;
> -	igt_crc_t crc_ref, crc_pipe;
> +	igt_crc_t crc_pipe;
>   	struct igt_fb fb;
>   
>   	color_pipeline = get_color_pipeline(display, plane, colorops);
> @@ -109,18 +151,6 @@ static void _test_plane_colorops(data_t *data,
>   				 DRM_FORMAT_XRGB8888,
>   				 DRM_FORMAT_MOD_LINEAR,
>   				 &fb));
> -	igt_plane_set_fb(plane, &fb);
> -
> -	igt_display_commit_atomic(&data->display, 0, NULL);
> -
> -	/* Reference (software-equivalent) CRC */
> -	set_color_pipeline_bypass(plane);
> -	paint_rectangles(data, mode, exp_colors, &fb);
> -
> -	igt_plane_set_fb(plane, &fb);
> -	igt_display_commit_atomic(&data->display, 0, NULL);
> -	igt_wait_for_vblank(plane->crtc);
> -	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>   
>   	/* Hardware pipeline CRC */
>   	set_color_pipeline(display, plane, colorops, color_pipeline);
> @@ -138,7 +168,7 @@ static void _test_plane_colorops(data_t *data,
>   	igt_wait_for_vblank(plane->crtc);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>   
> -	igt_assert_crc_equal(&crc_ref, &crc_pipe);
> +	igt_assert_crc_equal(crc_ref, &crc_pipe);
>   
>   	/* Cleanup per-test state */
>   	set_color_pipeline_bypass(plane);
> @@ -157,6 +187,9 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
>   	int n_planes = crtc->n_planes;
>   	igt_output_t *output = data->output;
>   	igt_plane_t *plane;
> +	igt_crc_t ref_crc;
> +
> +	capture_ref_crc(data, output, exp_colors, &ref_crc);
>   
>   	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
>   		plane = igt_output_get_plane(output, plane_id);
> @@ -165,7 +198,8 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
>   			continue;
>   
>   		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> -			_test_plane_colorops(data, plane, fb_colors, exp_colors, colorops);
> +			_test_plane_colorops(data, plane, fb_colors,
> +					     &ref_crc, colorops);
>   	}
>   }
>   
