Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9086ECAC5B0
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 23:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420C10E1B5;
	Thu, 25 Sep 2025 23:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvVITA2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDECF10E1B5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 23:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758842044; x=1790378044;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DIuP6jclAqlGtcS8q7pEMmBUVrxERfv4LewZcTEGmIM=;
 b=ZvVITA2O77ZMLOQ1bGS7v/FOCERiaG009zKM+/HSnIzaUCBpvtNPMrq+
 Ceo9VXh4Quup23QUQ0QAJKOizsJIq8ZT/JiKYx5Did6o47RM067/ejDUX
 QoKJhBFvx2z65NfHUCsGklkqEv3KGXkZbfdQyshrhIpRkLk3NlebIt4wS
 R2lFw/e5gtyxdaepEljusHflo9OgZC7bEiIDwVpFEzgBEwlmalCJO9OqS
 JW01nFLbMGXh4NCjcdORQXyBh7/1odyXx20YsyQizTxL7bFfRwic7xs/i
 fWY7mayocMwhYaH3YHG5ePvZXidTp36W8ThLuoD6iNPHRElc7iNBvJ2Rw A==;
X-CSE-ConnectionGUID: hgddhuuCQOacTSPlEufUjw==
X-CSE-MsgGUID: tjKqDk1kRK2OEPlYKpQYFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="48738513"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="48738513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:14:03 -0700
X-CSE-ConnectionGUID: BObCbW88R6eCLIW6ZYpKMA==
X-CSE-MsgGUID: 8SxYnPCiR7OZZgEgmBljsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="208187536"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:14:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 16:14:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 16:14:02 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 16:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqdDOEME7SX9SQxf+7k0nj3rLFATn5OzuvG5iBZjYs2smeFyWCkjnK2Wpb5JF5CogOBf46IghhuezghwiwEUKV3yFfmbDkWoorCwFElM+DugRMfh27vQ4h5vRBZCSwBp/vG4x4wCq2IvxrZx2dYj8B9nBIIIOMOHes0lOZQhptsn7f0San/mt7o/cJ90D0tUfNdCt/KVxaF00lG+iBmvQsdQqC2lKscAl5SSzQT0sI2bG3VW3kolZR0JuDMCKuQCfFMgnsOA9kYn1GpIFaRpwCOQZmsvOuaa01eYUb63X+5MbOpSy3EOWgcEzSiNmZclNaBoUSYsAk4pQbyfvsp7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxUky24e9Wq6BGaSPOjjnasBqW4bDwa25ZwO/qMocE4=;
 b=Cho4DGjgfo9IsGGvv3A5upoqWwOhwDLaWOKknJBZ8zKSetbFgAQwpIzUTvkKd2wCSTpt1mD1vLBBm3j5WbVZsYO/4U43yqq6xdlucbbeKe9hKXOv6nKyXxeyMdSdxn9tWh1Efd7O5Zi7nQc4uSVLHQZMqfEUupO91gnZzUdSFC+x6AMabGBR0wpn/gCughpybQa4dbWDbBnd118HACWcloheQgbkTbeBvWCzruLHN5MGnWPS2NeCU9JuVzDxT32hZK54dFYHWfHYS02GuBjxsWoU4q81KoaP6XvuKdaKXdFicbj2aSV8oTWUBqSq6qi1ffTAxvrrcvLQ2+nN2t5t0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.23; Thu, 25 Sep
 2025 23:14:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 23:14:00 +0000
Date: Thu, 25 Sep 2025 16:13:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] lib/intel_blt.c: Fix MEM_COPY instruction for xe2+
 platforms
Message-ID: <20250925231358.GC10167@mdroper-desk1.amr.corp.intel.com>
References: <20250923150926.1829954-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923150926.1829954-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: fad741b4-583d-4c2f-9ff6-08ddfc8935f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2VrUFNjUjJDNnNpOVUyVy9ZK3dRWjNLdkMwbVdBdFFlWjl4ZGVrb3lNNVhX?=
 =?utf-8?B?K1RTUmkxUzVnZUFNc2ZhWDZpQm5pQWhkNXhKcm0rTCtUWjd6ZnVibWVyQVR0?=
 =?utf-8?B?ZWlFYVhYMnc5Wk00OTNVQzRxRVhHWkJmZnY4K01scGRLdjZTUW9lbjdVRnV5?=
 =?utf-8?B?aFJZYTBPazdIOEU3LzRaLzFiTmV5VmY2bEpoRHROazlNL050VldsbkRVQWZ1?=
 =?utf-8?B?ejNSTVhqTkxWdkU4OFREaGUrQVppK0F6enB3K0o0TnBlNmNTTjBBK2lWall0?=
 =?utf-8?B?dm4rVXVxczgrQW5sdDBpUDlhM0F6M0l0REtLMEhMNUNoWXBDY2ZKVVJ1dkVt?=
 =?utf-8?B?QU03dk9DcFJVbTBvVUxpNVZ2b1VsWi82Y3lBYlVrdk0rMUhTekhXT0xtaTZZ?=
 =?utf-8?B?RWRUZXpvWjVQNTdqY0plWEN3V2szRU1OSjJ2RXUva0dIYUdDYTBGL0RlNGxZ?=
 =?utf-8?B?NGhTdUk4OTFmLzhUSlhyZnh2amFVeXc5bGVSSjlLMkp3czQrSDNOSXc5cXUz?=
 =?utf-8?B?cEdZTXZHSnlVbE5BZ1h3SFoxc0lrcjh5RGFrZTJDR1NDSVFnYVhJbi9PTG5W?=
 =?utf-8?B?UzhLcmR4K0VVLzVzazNrNGJhMENRZzZCMnpDeDRFcEtnSGdCU2trTkZoMVlN?=
 =?utf-8?B?UkNhemxaQlZuMnF3UE1GV2E1SndhbU84S08zZ096a3NCM0g2Z0MvdnVuUEIy?=
 =?utf-8?B?QlBGT0FCS0ZjcjhiZXdYS3k2VHd4YU11blVXY3NXUjhqeFpkRU9odVp1ZFNx?=
 =?utf-8?B?bTZoUFpFTnNlMHRiT3BPOXBKZTNraXJYM3lYdUg2RUVhR1c2YzFuWkdmeUN3?=
 =?utf-8?B?OHdMMG13NnRSbVZLY0ZsQzBDU1pyNkZiNzV2OTVLTGx0UlMxeXZtODV6dXdD?=
 =?utf-8?B?WGs2THBNLzRsTkJKMlFwMndCNzluVVFCSVpNaWZkY2JWNjMrbWJORkR6NFFz?=
 =?utf-8?B?U25SV1cyTWozQVJyK3R2aW1RSUxndERZaCtlLzh0V09nU1ZETEY2WG4zR0ZP?=
 =?utf-8?B?WWl3UXpNeDk3K1BsejFONkRmdjRoQlhwRHN4MXMrK212WUlVenVlaFNVUzZw?=
 =?utf-8?B?VEhSb2FnTmhyQ01IOVl6QlJaM3VVWlNlNmtUanFaTExyOE5sRzJ0VWFBanhO?=
 =?utf-8?B?ZjNRWTloMmFNa1VNeUIzRW5va2J1d1hRdjVjeHhweGlHQTlJOW5jYkVwc2Rn?=
 =?utf-8?B?THpMNUxaQkZUY0wwUWJmeGhSMWQveVZ4T1g3SXl6OG9LTGtWeVJ3Q0tCbGs0?=
 =?utf-8?B?RkgyMXhCbC90cVF0dUo4RE5tOEN1bnBKSUlUMXB5YUh4WDhnWlBNUS84dmla?=
 =?utf-8?B?NFNPZWtXT0YxT21YNzFIQTdBOFI1S3ltOGpMMEI5M3UxdDk5clFWWlVicVJr?=
 =?utf-8?B?WXlvbzR5ZGJkMlZoK3BiWW5HcFJ0cXBLSDQyT2JRNEd0Rkk4OGdjOGVPeDdk?=
 =?utf-8?B?ci9Ocmp3cG1JZ1FTT2VlcU8zTnk0YVhCdmxQT0hSSTFkUWxjcWczcmRXWUZH?=
 =?utf-8?B?MmxUdmQxcTVwaUxOZ0JPcC8wdlZ1STcwdmRMbUVoMHhla2QxcXBUckFoTVJQ?=
 =?utf-8?B?QklsaXk0UXBnS1FnbHBnR3EvODkwUENTQTZZUWlXZG9zY3lBdzNPVWVtdGtS?=
 =?utf-8?B?YmwvKzBMRkgrN1F2Z01iRTJycXd1UDhSQzBvUWJJVGJvalZMREN1YlNSVDds?=
 =?utf-8?B?MW9GNjd0dWd4ajFhbVpaelJZUWkzM1QrZldHNGp6QkxhT1YzdVY3Skw5SjVn?=
 =?utf-8?B?aUF1MjFwYm5kN0FHUE1FdXphRHVlN2I5aDc5K2dScUNqSmQ2U25kS2dMMXJk?=
 =?utf-8?B?R3pQUEp4MEVvbytwODBKUkFNZ3BrME4zY2VURWdKb2huMkx6UnJseTVKeEZR?=
 =?utf-8?B?VWlnaUJDNG43TjRGekl1VENSdEhhQWN2KzZ6VGN0ditZS1Q5bUhMSzQ5TkUx?=
 =?utf-8?B?UjZpMHk5M0pURjQ5WVduSkhRczRhSUoybHBwYnBpaDQ0Mmp1UGxEUWdoZGZV?=
 =?utf-8?B?cTllZmgvN2J3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZ2ZlhlYlhkcUk4aHdTOEJZWkJGeG54c0p0bTc3Z2V4VU5KZHJCU2J2YnUx?=
 =?utf-8?B?M1NpQnRaWnNacjIyYldhU2hiMG5iaHpWK1ZuSkZyT0JHQzMxQmtGaGpEUTMx?=
 =?utf-8?B?VUZLc0xFZ3pJZlArdzlBUUNoeFMwSVZVN2JnS2wwQ1VpRVVFNHkweDI1d2dx?=
 =?utf-8?B?UDBwVGdFOGxsZXNMYXgzYWw4T2FiUVNXdldpZTg0OGpYMHlyblg0Q1c3Q1Vj?=
 =?utf-8?B?aGRzdXRYRVVlMEJLQk5BYk5mS1BGMFBVbHRvNzhubGpjaWFKNGNLYW4xR3ZQ?=
 =?utf-8?B?TlNLS3pwajZHdU0wWVBSaUVJd1Y4a1RLWGQ4TFlKRTZQZlJuVXFPSGlIYzhJ?=
 =?utf-8?B?emVpcUhYWFhwNExDOEw1NkVPUFNSczNuVlpoalUwVUxLSHd2QXhuYitaUGo3?=
 =?utf-8?B?Mlh1UE51VWZrQzlEQ2lrTk4yRGd3U3ZBbExJbm03NFYxWENOTmpGc3l5T0p5?=
 =?utf-8?B?amVuNmcza1hqZ2pPVWplWFZDZE44V21uTEgydzlPZm11RHNtdFJJczFLbllm?=
 =?utf-8?B?MGV4WVRQSkJ4eTFNdTBNWlIzSGtmSit5d2w3SERFVElFTzJCMXZPSE9ZRkM5?=
 =?utf-8?B?cm9OcFpyN2xCUU1MRFBQb2xnZDd5VGNuQ0d0bnJHTk0wa1dBZ1lrK25tNDVv?=
 =?utf-8?B?aTA2SGdOc3prdHlad1FUMWtyUHNON3U5aFd3ODZGMkt4YlE4cmdMQXNCTThz?=
 =?utf-8?B?aUtzVTM4NU9xdmFyNFk3Z3VVM1NoeVlvYVAvdlQ4bW04U2xHR2hqSGIwQlZB?=
 =?utf-8?B?TnVOM0c2blBTSkFTckZpdFFtckRzajBYN1h1UkhoUkFMeGxkN29KcGo0emZ6?=
 =?utf-8?B?eWVKUjJwRExXdm9mbTY4Tjl4bERMTi9sYjFWQnpFY05FeGUxaVZLUHVvM2tw?=
 =?utf-8?B?aDFXY0c4V2E0OTUrT0l2QWNOUWNodU9RdCsrVENmMlhNb0RCSkVZYmJISFZx?=
 =?utf-8?B?ZytlTW1GTG9OZExjVHVjalR4RzVoR2pwWHBWMGxzaWtwbmw4bzlTR1lmODY0?=
 =?utf-8?B?UnlKSG5hOHNrNHBvVmpMaTIrdzYyNG8wdGxsY3FYNnYvWGxiajJYODZKOEdl?=
 =?utf-8?B?ckJ0YUNabG81dVdPRHFUdENTMjRKOXpwTi8rOGh6ZFFFTmkzd2hUUFkxWEpR?=
 =?utf-8?B?a25oU0VlU2lMN2ZOSDBVVm44T2RqYUdtcTRkTm5zcTRLRFRVUTdRNTdROCtj?=
 =?utf-8?B?eGd0bC9LVWx1dTZQNzRrWDFSUVNtK3N0K0kwd0E5VlkyWDJJOXdiWFVMUUZM?=
 =?utf-8?B?bTEvb3RqOU5tUnlYQllYTjRmcGhrV204Y09zeTRuUFJDbTQwcDlWSDNlQzBz?=
 =?utf-8?B?Z0NwMFBZTVNWRlM0eE1lNWVQU0pQUkMyaHduemFqSkJvREpWWXdPei9pM2N3?=
 =?utf-8?B?Rk44SlhVQTJqQ2l2REQxbnNMZUNTUDNnenM4L21TYWR3dlZGSlRUdC9WcWxD?=
 =?utf-8?B?eTdYMC91SHhlYVFlY2JFZmZUVWNwTkg1Y01yMU1ta3hGYi9vblVINVNsVWlN?=
 =?utf-8?B?S21yWk9VR01IdkRCdlFuWWt6U2s5endMNXVmTVg5Sk9icnhYdXI0dTk2M1c2?=
 =?utf-8?B?cFphZDZUTHYyZWRNTWYzNEdiZWtQR2xUSkh6MmJiT0hnT1JKQkRaNE5rZUxZ?=
 =?utf-8?B?YjdqdU5QMjk4UktHTnNEUGtZaHNiWVdnSWFkOUZGTGZLVlhkR2ZTdE9INC8r?=
 =?utf-8?B?bUUwMUE1RVdTQXd3b3JIb2RYaEgyWVBmSjFUTDFncmNINmNDZTNTWnpxSVNs?=
 =?utf-8?B?cDdUdmlpRCsxM2hFcTVvWVZnQW4xRXlyRW9vM2t5WkhKWkFqWlh4U2x5SW1P?=
 =?utf-8?B?UHV0QlFWeGttc3pscm4rbEdYZHpiMjdaOHlEZEx2dDd3NEZSWFNmV2YwZk1R?=
 =?utf-8?B?RGE1UDVyczFvNll0ZEFCVG15Ym5uWlpaMmhmUWxuZ3NuSmtsV0dkOG1jRnF6?=
 =?utf-8?B?R2VsdU1MS1FuT29hY2dBbkhFOUVKWjFpd0ZnUkRkRHd4RGpzRGx5ZlhhZHY3?=
 =?utf-8?B?OTlxYVNYSm9mbzRIaVFIdFFFUkFPOFRXUzVzcEo4VmNTNW1KeFdnUXNPa2dw?=
 =?utf-8?B?Vm9OZE8zSkx5MjdlYjc3T1dlQlZ2TnY2OHgyMEFLbWxsTnpqNUZRTnNOTXlY?=
 =?utf-8?B?NlhCWnhEN25seUZ4ZS9pVTBhZjJVRkRGV2Q4ejJCRDh1T2hKTWJ1RTlYcjIw?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fad741b4-583d-4c2f-9ff6-08ddfc8935f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 23:14:00.3810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zlaXtnTju6si6K7giCkOTH1fSp9R5Utjo4tHDONqat0zCEk8Bvo3SeHZPHsWglyIgKnbRt6PNRzKEeaSNZXY+H1g+7v78JNbZ+xg4Wr4Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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

On Tue, Sep 23, 2025 at 08:39:26PM +0530, Balasubramani Vivekanandan wrote:
> There is a difference in the MEM_COPY instruction structure starting
> with xe2 based platforms. Fixed it.

The structure updates match what I see in the bspec.  But personally I
find the "x2" name of the Xe2 structure a bit unusual --- when I see
that I start expecting it to refer to a coordinate (as in (x2,y2))
rather than the IP version.  Can we write out the sub-structure names as
"xe2" instead of "x2?"

It might be worth adding a git trailer "Bspec: 57561" as well for ease
of review.


Matt

> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  lib/intel_blt.c | 126 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 93 insertions(+), 33 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 71ed891c3..1a8808688 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1800,17 +1800,32 @@ int blt_fast_copy(int fd,
>  
>  struct xe_mem_copy_data {
>  	struct {
> -		uint32_t length:			BITRANGE(0, 7);
> -		uint32_t compression_format:	BITRANGE(8, 12);
> -		uint32_t compression_enable:	BITRANGE(13, 13);
> -		uint32_t rsvd0:			BITRANGE(14, 14);
> -		uint32_t dst_compressible:	BITRANGE(15, 15);
> -		uint32_t src_compressible:	BITRANGE(16, 16);
> -		uint32_t copy_type:		BITRANGE(17, 18);
> -		uint32_t mode:			BITRANGE(19, 19);
> -		uint32_t rsvd1:			BITRANGE(20, 21);
> -		uint32_t opcode:			BITRANGE(22, 28);
> -		uint32_t client:			BITRANGE(29, 31);
> +		union {
> +			struct {
> +				uint32_t length:		BITRANGE(0, 7);
> +				uint32_t rsvd0:			BITRANGE(8, 8);
> +				uint32_t compression_format:	BITRANGE(9, 12);
> +				uint32_t rsvd1:			BITRANGE(13, 16);
> +				uint32_t copy_type:		BITRANGE(17, 18);
> +				uint32_t mode:			BITRANGE(19, 19);
> +				uint32_t rsvd2:			BITRANGE(20, 21);
> +				uint32_t opcode:		BITRANGE(22, 28);
> +				uint32_t client:		BITRANGE(29, 31);
> +			} x2;
> +			struct {
> +				uint32_t length:		BITRANGE(0, 7);
> +				uint32_t compression_format:	BITRANGE(8, 12);
> +				uint32_t compression_enable:	BITRANGE(13, 13);
> +				uint32_t rsvd0:			BITRANGE(14, 14);
> +				uint32_t dst_compressible:	BITRANGE(15, 15);
> +				uint32_t src_compressible:	BITRANGE(16, 16);
> +				uint32_t copy_type:		BITRANGE(17, 18);
> +				uint32_t mode:			BITRANGE(19, 19);
> +				uint32_t rsvd1:			BITRANGE(20, 21);
> +				uint32_t opcode:		BITRANGE(22, 28);
> +				uint32_t client:		BITRANGE(29, 31);
> +			} gen12;
> +		};
>  	} dw00;
>  
>  	struct {
> @@ -1859,9 +1874,22 @@ struct xe_mem_copy_data {
>  	} dw08;
>  
>  	struct {
> -		uint32_t dst_mocs:		BITRANGE(0, 6);
> -		uint32_t rsvd0:			BITRANGE(7, 24);
> -		uint32_t src_mocs:		BITRANGE(25, 31);
> +		union {
> +			struct {
> +				uint32_t dst_encrypt:		BITRANGE(0, 0);
> +				uint32_t rsvd0:			BITRANGE(1, 2);
> +				uint32_t dst_mocs:		BITRANGE(3, 6);
> +				uint32_t rsvd1:			BITRANGE(7, 24);
> +				uint32_t src_encrypt:		BITRANGE(25, 25);
> +				uint32_t rsvd2:			BITRANGE(26, 27);
> +				uint32_t src_mocs:		BITRANGE(28, 31);
> +			} x2;
> +			struct {
> +				uint32_t dst_mocs:		BITRANGE(0, 6);
> +				uint32_t rsvd0:			BITRANGE(7, 24);
> +				uint32_t src_mocs:		BITRANGE(25, 31);
> +			} gen12;
> +		};
>  	} dw09;
>  };
>  
> @@ -1887,18 +1915,32 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
>  	mem->copy_type = copy_type;
>  }
>  
> -static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
> +static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
>  {
>  	uint32_t *cmd = (uint32_t *) data;
> +	uint32_t devid = intel_get_drm_devid(fd);
>  
>  	igt_info("BB details:\n");
> -	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> -		 "[copy type: %d, mode: %d]\n",
> -		 cmd[0], data->dw00.client, data->dw00.opcode, data->dw00.length,
> -		 data->dw00.copy_type, data->dw00.mode);
> -	igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> -		 data->dw00.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> -						data->dw01.page_copy.width);
> +
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> +			 "[copy type: %d, mode: %d]\n",
> +			 cmd[0], data->dw00.x2.client, data->dw00.x2.opcode,
> +			 data->dw00.x2.length, data->dw00.x2.copy_type,
> +			 data->dw00.x2.mode);
> +		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> +			 data->dw00.x2.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> +							data->dw01.page_copy.width);
> +	} else {
> +		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> +			 "[copy type: %d, mode: %d]\n",
> +			 cmd[0], data->dw00.gen12.client,
> +			 data->dw00.gen12.opcode, data->dw00.gen12.length,
> +			 data->dw00.gen12.copy_type, data->dw00.gen12.mode);
> +		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> +			 data->dw00.gen12.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> +							data->dw01.page_copy.width);
> +	}
>  	igt_info(" dw02: [%08x] height: %u\n", cmd[2], data->dw02.height);
>  	igt_info(" dw03: [%08x] src pitch: %u\n", cmd[3], data->dw03.src_pitch);
>  	igt_info(" dw04: [%08x] dst pitch: %u\n", cmd[4], data->dw04.dst_pitch);
> @@ -1910,8 +1952,15 @@ static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
>  		 cmd[7], data->dw07.dst_address_lo);
>  	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
>  		 cmd[8], data->dw08.dst_address_hi);
> -	igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> -		 cmd[8], data->dw09.dst_mocs, data->dw09.src_mocs);
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> +			 cmd[9], data->dw09.x2.dst_mocs,
> +			 data->dw09.x2.src_mocs);
> +	} else {
> +		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> +			 cmd[9], data->dw09.gen12.dst_mocs,
> +			 data->dw09.gen12.src_mocs);
> +	}
>  }
>  
>  static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> @@ -1923,6 +1972,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  	uint32_t width, height, width_max, height_max, remain;
>  	uint32_t bbe = MI_BATCH_BUFFER_END;
>  	uint32_t *bb;
> +	uint32_t devid = intel_get_drm_devid(fd);
>  
>  	if (mem->mode == MODE_BYTE) {
>  		data.dw01.byte_copy.width = -1;
> @@ -1945,19 +1995,29 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  	width = mem->src.width;
>  	height = mem->dst.height;
>  
> -	data.dw00.client = 0x2;
> -	data.dw00.opcode = 0x5a;
> -	data.dw00.length = 8;
> -	data.dw00.mode = mem->mode;
> -	data.dw00.copy_type = mem->copy_type;
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		data.dw00.x2.client = 0x2;
> +		data.dw00.x2.opcode = 0x5a;
> +		data.dw00.x2.length = 8;
> +		data.dw00.x2.mode = mem->mode;
> +		data.dw00.x2.copy_type = mem->copy_type;
> +		data.dw09.x2.src_mocs = mem->src.mocs_index;
> +		data.dw09.x2.dst_mocs = mem->dst.mocs_index;
> +	} else {
> +		data.dw00.gen12.client = 0x2;
> +		data.dw00.gen12.opcode = 0x5a;
> +		data.dw00.gen12.length = 8;
> +		data.dw00.gen12.mode = mem->mode;
> +		data.dw00.gen12.copy_type = mem->copy_type;
> +		data.dw09.gen12.src_mocs = mem->src.mocs_index;
> +		data.dw09.gen12.dst_mocs = mem->dst.mocs_index;
> +	}
>  
>  	data.dw02.height = height - 1;
>  	data.dw05.src_address_lo = src_offset;
>  	data.dw06.src_address_hi = src_offset >> 32;
>  	data.dw07.dst_address_lo = dst_offset;
>  	data.dw08.dst_address_hi = dst_offset >> 32;
> -	data.dw09.src_mocs = mem->src.mocs_index;
> -	data.dw09.dst_mocs = mem->dst.mocs_index;
>  
>  	/* For matrix we don't iterate */
>  	if (mem->copy_type == TYPE_MATRIX) {
> @@ -1983,7 +2043,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  
>  		if (mem->print_bb) {
>  			igt_info("[MEM COPY]\n");
> -			dump_bb_mem_copy_cmd(&data);
> +			dump_bb_mem_copy_cmd(fd, &data);
>  		}
>  	} else {
>  		remain = mem->src.width;
> @@ -2017,7 +2077,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  
>  			if (mem->print_bb) {
>  				igt_info("[MEM COPY]\n");
> -				dump_bb_mem_copy_cmd(&data);
> +				dump_bb_mem_copy_cmd(fd, &data);
>  			}
>  		}
>  	}
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
