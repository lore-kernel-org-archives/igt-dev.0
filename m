Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7126C7115B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE34410E888;
	Thu, 26 Jun 2025 08:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3iq0aYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FE10E888
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750927514; x=1782463514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ic9sXtfcQR7v0MZ3ECL/12GZlRiTaszdH4HEi7NzS7w=;
 b=c3iq0aYvw/jzS4obulNMUrCX9SptbowHVfBByYqE5wds1jdyZPOvcKAp
 vNq4VWII9yHoVu5q25bwmNIcwM+Dax/lNwF/hF5AhcxIPhe51P9+1mXqx
 RPJly8HGQ4HXxJ4SZzsTHQS6uJEQsoO1ol8lmRo4QDhI2F/nIRYrkcCvm
 gg4nkPVMmzA/BQSXrVHrL2LQZ0G92tgkOnxXqlGcvShtmuwIfWI5ZU7ED
 w+myp+DkjzdV5fiJ8RNpMez5/eHHBpNVHlBGHvICkymx/4QcJy0zYW/bK
 ptxwN1F7LCiIuVUmeDQWb/aeIYqH7O6VpSsQsDFevannwMtiOdtyb9Ct4 g==;
X-CSE-ConnectionGUID: LYfPhqQXSku8voxTic+bpg==
X-CSE-MsgGUID: 42m1mAtGThSQNz5778jukQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="55839315"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="55839315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:45:14 -0700
X-CSE-ConnectionGUID: Db9EXu3uQzqwXKjH2Rt4pA==
X-CSE-MsgGUID: d22aRpbbSoeRsBIque4x1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="183344500"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:45:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:45:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 01:45:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtxtkT01WQxWCYCNQfVkDADGnz/tFjkqZymx/l/THUFQ9/2ZlpKLLzF7uNPODqj4yYfGLXN2uwoRiHC0wLwFBX/Y1VQqOGjJVSlCkak4S3CY2Cz2u90Qpp5fPhLUl8jJmWYblbYBcVaVtEaBg92QfHswfmacZdOAATP/w2/zU4XWSWfVY/BQYaLrZ/6v1TzYV8Uv6oGavQCRIm8Hiw8X2kcKP4/+g9DUtG9QvHslUPxU+fKIQ7seTLQGIGm5ruVPN4jNFJq/OP7Er3YzYUNq3pUdDiUhmmRD4FGhSrhHG73C9cZ9PkYFBsVKKnt+TRibhnH8nX13wQJhKjiv/ZUSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isfBpTcNuRc8SsyRID8YTQhW82Oz/Nr37VLb+/Y/ZTU=;
 b=lMp/ijcHzopwFVK8kCrxcVJcCsur9if/TmcY+S4Fqt8N1DvX5Ia5/Df/dey78Da6ufTVRYwGv/iNrCDhTlAEvXjQyMSowp3rV55JMJ10ibqhiF7D1pmFilOCRSh1e7QOPRGe0E32igFi0G5vK5Yp4POG6fgbReMd0QCxMgQ2un8VRdu2G4NrleXWvWCi8YlkAJIBDtIi/GgC0SAku0LWS61T+lzY6oswkJFcn1d0JmYx0ptvMZgXdiect7DP3cUX0C8LJZUsO3/0YkSen/UCosrMH3BVsCuneT7B99O6Sgcq6GMVEBygzOhwTXkkoCNOtkdoZIehMux6WA5MQ1RafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 08:45:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 08:45:10 +0000
Message-ID: <a5568d67-cec8-4709-a6e1-56fa5ce3ba56@intel.com>
Date: Thu, 26 Jun 2025 14:15:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v15 4/5] tests/kms_async_flips: Remove allow_fail
 flag from async flip tests
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
 <20250623110918.606014-5-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250623110918.606014-5-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: eba59d15-21d1-4e5e-8561-08ddb48dc289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk8vekY2bUJwM1NUNzIyM3QyN2xiQmpSNm91UmtIckh6NzFVNGo5UlYwYlJa?=
 =?utf-8?B?aHNtNWlXbkhTL09ncVFoV0dhNzVvWHNkK0dVUDZRUGNMc3Vscm5qQW5MdWJn?=
 =?utf-8?B?S05iTTNSUGZlMVN5bDBrMHJFMlIyMitvaHFzL3NDYVYzTHQrVVlPWWdnWFNO?=
 =?utf-8?B?N1dnOVlKdkRNM3k1TGlIeWV0YzBkcEdzZFdpSnhGSTQ0RFByNURZb3B4MnZQ?=
 =?utf-8?B?UDRmWEsxYUZuaUwrVWNKQWlkaVR4SkJINDJyQ3k0RjQ3TEx3MVpxRkxjZWl2?=
 =?utf-8?B?TVVDeXZQR0ErS0dSa1g0QWtsZFd5MjFTdWdIa0czT2dwajZVazF6T2VIeERW?=
 =?utf-8?B?QTI1QlJNMUJ0bklQT21SbUJBalNOR3lidi9rT2p2eGNhL1JhS2YyTmk5bGlJ?=
 =?utf-8?B?SnVGaUxKSXJsRFRvVHVtdkFCR3pPbFhoaGtDS3QrWGswbU1uYUhNNWExRTNw?=
 =?utf-8?B?cURrZkl0VVBUU3RmbFhKU0Q0cUVLUmVDTUhmVitjOTBQRVQ4RjRQN0VRcnpx?=
 =?utf-8?B?QVNjeG83c3JlWVNONUowN295K1FQNkN3ZTh2NFdrVXFFYnJucjJLRG82SGtS?=
 =?utf-8?B?VEZEeVJubThtWUxOQSt4dkZFeUlydnFiWXEvUThEczk3cmZJeVRMa2ZNb0F5?=
 =?utf-8?B?TWVNUm04YjgxU1kxSnBlTEYyaGVMV29YRFdVTUxtblRKc2p2OWo2K3Y3K3BE?=
 =?utf-8?B?WTVEakp0eGVaakhPam44UDAvTHF1ZTFHRlR5WXJLcThjVkEyb2UrRWlSdG15?=
 =?utf-8?B?aG9NdVp0VTRzM0pMMEZSNmJUV0ZVNnU5ZkpQRFZuOTZUQThFK3dRQ0JMc3pR?=
 =?utf-8?B?UEU1TlF2UkVIWWhMNno5U200ZWMwaDFKNmRWWm5GOFhSbFJQRzh1d2pmT2ZY?=
 =?utf-8?B?NFNZOHJPa0RsOWh5YzJvcnQ3TGJXK1hzUG5QNHdRZ28xOFNqWmVlanZ4MlYy?=
 =?utf-8?B?dVVFZFpUeDdhMXNVOWN0V2FLeTQvelJoL0tFN0NoQ1Irck5UZlVEMGR1SU1D?=
 =?utf-8?B?QXNsQmJ4Y3NsRjU0b3NLOGprVTBJeW9ocmxZcy9kSURGNTZNN0ZSd3F1d0Rl?=
 =?utf-8?B?UmtIWXI2RzhWZy8wS2RqS3lhUWQzQk94Z2IrU1dOMU0vMmxtTWhXMFNMNk1H?=
 =?utf-8?B?RWpBbE1sU0cxS2lSV1BudmtuKzVSVndYLzJjMkh0ci9WbkU4dGhOMEZlSGRG?=
 =?utf-8?B?c2k2OW1iTko5cjYvVmp2V0g3Lzl3SEh0UkxVdE4yaWFCWlpiVzI1VXM0MldK?=
 =?utf-8?B?NnJYNVN3VnVEcXBPWW9ZZm5rQXJ0d0VFZHBqbFVCOEQva2x5anQvdlpDb2xm?=
 =?utf-8?B?M3JsVjFjYjZkbEpKRGozOVYvU0gxZnl6aWZaSklSRU52bWc2K3RlQzEvRW1V?=
 =?utf-8?B?RHpDOTBHTGc0RmdlUTRBOVJ2Zll3WVhYb1ZvWkk2ZGozbFE3STNFVStmR2Qr?=
 =?utf-8?B?clNnYkM1dEtmbUFLcmlYSDBvb2JDU2RSUThpTjVPbzIreTU5QmtzZHErem1z?=
 =?utf-8?B?VzVtVGtmd3h3NlZYN2RHL1lhdUhrUUQrQzdkcVM5Y0U3M2YrYzJuQmdvMWMz?=
 =?utf-8?B?ZDhneFl2L2xSV1JkeHlaVVhnMXAwMmtScjhFTHQ0Wk51aFdXQkt3NjFTL1Na?=
 =?utf-8?B?TUVtVVlsM1V6L2E0UjlIQ01mWTdPdXlXTGx2dmtzNTJIVDduK3ExdVIycHZH?=
 =?utf-8?B?MnpWaTZGQ1NwRjJrYzYxSzkzTkRJK05xWEI4OEUzWnk0M3c0UkVneHY0UlQz?=
 =?utf-8?B?Nm9ONUZ5Q2I3SmZiSlhSS0RxZXRnR1JUSmlNWXBpUFZDWi93cTR1bVJJaTU4?=
 =?utf-8?B?VkdWNng0Vmk4R2VWSTFZcDVFWWp5VFY3aGd0ZzFyMzdJWUR6Q0I1WkNOdjhP?=
 =?utf-8?B?VlpmVUFWVWJ1TnJCRThRcTRtODdhODFkR1ZnZ0Zja0V6M2R3S2kzODFONGVn?=
 =?utf-8?Q?LDXYRFgwORQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eCtrV3Y3TDdVdGdocFpHdXVKRER1RjNkNE0yeStNdzhXNEJiZm5mdGZtR21J?=
 =?utf-8?B?ejJkNEhVMXN2TjBGbG0rb3ZoNFNyYWg3M214aEtYMHRwNm9TVlAydDRFZXBz?=
 =?utf-8?B?RzBsVnQzT09ad2grd0Z2Z2ZqODlKSUJXcFhVNGFlbjcvMXM4Ukl6REtMTFhz?=
 =?utf-8?B?NjlBTVBHL09iWk1aUUIwZEZrRnM2ZGsvUG1pQlVDMjZ0eXR0QnZoTFFaR3BM?=
 =?utf-8?B?ZDl6dE9rY0tCOHAvR3ZsRWwxZjJ1d09SdndremRTMkJhRm1pam9Id0lsOFFi?=
 =?utf-8?B?b0hRM3luUTA1QmJncmZNTVNTVmY0QUpxeEU0RHppZjFSVXUrMFNXcTV0b2dV?=
 =?utf-8?B?bWx4b1E0YWw3S0lKN3pkZDkrLzVpbUhQcml2c3FKOG9oZXp3QnNMYWRPeDQz?=
 =?utf-8?B?TDI1UlhFQTcxVnlmMm03SGo0cDQyQnB2eVRGMVZxRThCcDZzbDFmdmV0aFk0?=
 =?utf-8?B?TElxRE4rYzQ3d0RFbHlQQzhDMVoxd1VZUmFlMFlxOG5MSVVDRmNPQWNPTHhB?=
 =?utf-8?B?Rkk2cmNIRjdKZ3NmZTU2OCtTNVZEZ0YyMzBERWhZbHlKU0R0UWw3UEdtUElt?=
 =?utf-8?B?NVJiWmVlU0dyU2xxcmxxcnVhWDkzUTZrWkNuamZXNit2ZFJHbThmeXlXSlRC?=
 =?utf-8?B?UkluOFRxOWU4WGJBM1A2eGZHTVM1K2V3YVU2aVIreFZFZzNkN0hYN2JoTlI4?=
 =?utf-8?B?YitRcHQwbm0yZDBCTHloYWU3NmtaZGZMZ1c5Um1pd0xVUnZ2V3Q0YVE4a1Bp?=
 =?utf-8?B?VlVtbnRWMzRTTkF1WlNHa0YrSUJYUm9TR2MrRE1XK001VTgxNnRhL1R5RStP?=
 =?utf-8?B?MysxQ1R3bms5bG4xWVNSaWhzNTM0dTljRTZLWUhGRWR4Z0llTlVIc20rUXhq?=
 =?utf-8?B?ZFo2UDkvSlNVWWZxSkdtRUszTm5BN3U5RHRGOXBwRFZrYkk1YStoa05oRW1F?=
 =?utf-8?B?VmprUHF3c1ZKSmdvMUx5bTZXMFdNQ1UrbXhucjhsVDFhL29NRUtBbTBlOWhT?=
 =?utf-8?B?Mis0djJ0eUR0N05XL0owRjhsS0U0Y2ZrMGJzMGt6WFplRlNTREpBQUVXTGl0?=
 =?utf-8?B?azBqTUFvTUVnL2lXeVNrSkpqN0Y5cUQ3RU85SCtRQk10d1c3NU8xTENsNyto?=
 =?utf-8?B?c1lUZ0IvdklPbWg5WEwray9UWkp0dzVyR0tvYnhkVnNYWU5KSmRCOEo0ZGc3?=
 =?utf-8?B?dDh1dzBJK0V3dE40bzJCRmxYU0NvaHdpckdLUXk0WGNHeDJlTzBFWVZXaDVj?=
 =?utf-8?B?a0ZXVnFac0c1UWFqV1M3R25ORVh2NE9CcjQxVHZOUkNuR1VlU2NBUUROVk93?=
 =?utf-8?B?eVdrbnZnT2xGaHk5elZXZTNoNkdKS1VhN3BTYXlEM21OQTRoWTYrTTM0WHdu?=
 =?utf-8?B?T3JTZTMwazc0cmltNmprbzNJNWVQMmVZZEV0V2RqdlZGMVdoQit1OTdlSGcv?=
 =?utf-8?B?U3lyRm9KVkRKQnZxQkF2YjRINjN2RzIyY2xKTFJxOUZPMy9qRWlkcHk0VFh4?=
 =?utf-8?B?amFlbjNMdE1ndXl1TnR3Q0VBMlI3QmxPVHlvQU1FS3hMQlg2SjhqZCtKdzRG?=
 =?utf-8?B?Ry96SzJLSVpYa3gyeEhwdHI4WWNoWU1pbzR5TWRpSXgxdlBKZThkYmRITFBO?=
 =?utf-8?B?SWgwMGpTRTJkMmRNRFlDby9FR21PbGlrT1lCR1dHRmUwQStyV2YyMjBDbVpG?=
 =?utf-8?B?Zk9yV3krbEhqUlZ0ejR4bTUvOHREQmhZd2NJb3l5ZW45Z1lwNDVBaitSZ0xT?=
 =?utf-8?B?bXp0L0p6NjNMbWs2K29qQzdqK01IbzhCeGRsNFo4RTY3d05Ra004Zld0SGN0?=
 =?utf-8?B?WXpjY0lDdHZySWJmSENGZTRhS1FMTWt3ZE81K29kVnlsWFhUY1ZFWTBxbjBT?=
 =?utf-8?B?N2hpazF6Wk9KeHBaRUxHbmdJMFZJVSt0T0FYWGdWaTZGMHpVeHB4NWE4NGxi?=
 =?utf-8?B?dlRQbUVWVTBjZkwydlVUdjR0MzhBNStxT0tXQTRFNUR6SDk0YmlRTmhmMlcv?=
 =?utf-8?B?OFlTN29pZ284bkVJY1dCZzZZWmMwZmpHaTR6VkZBK21uS05jUGFqWEJ5RUxM?=
 =?utf-8?B?cjdWUlZtQ1V3NDZocXhUNkxQVnFYL1FvbWJ4L2Y5OHoyY09NSVF3RFh2SnUr?=
 =?utf-8?B?aElrcllDdDQySVlnaFM4VUZSVTJ2N3BoUmhJL1lvN1JyWUtJb3hxbTF6L3c0?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eba59d15-21d1-4e5e-8561-08ddb48dc289
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:45:10.7276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plQZFDdNv0DfHFl5cw6Rb8ZOJrtjAwQ6ElALtNnpvREB9nJvH/GxGYUwRjwDLIRa0xvqaa8J5twmRBYNxSOm7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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


On 6/23/2025 4:39 PM, Santhosh Reddy Guddati wrote:
> Remove allow_fail flag as the async supported format modifiers are
> now known to the user space. The test now executes for all supported
> format modifiers.
>
> V2: Remove check for frame 1, as no longer needed now as valid
>      modifiers are being in use. (Chaitanya)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 496d1c2c8..e176b2a28 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -136,7 +136,6 @@ typedef struct {
>   	enum pipe pipe;
>   	bool alternate_sync_async;
>   	bool suspend_resume;
> -	bool allow_fail;
>   	struct buf_ops *bops;
>   	bool atomic_path;
>   	bool overlay_path;
> @@ -435,7 +434,7 @@ static void test_async_flip(data_t *data)
>   		 * configuration. Therefore allow EINVAL failure and skip the
>   		 * test for AMD devices.
>   		 */
> -		if ((frame == 1 && data->allow_fail) || is_amdgpu_device(data->drm_fd))
> +		if (is_amdgpu_device(data->drm_fd))
>   			igt_skip_on(ret == -EINVAL);
>   		else
>   			igt_assert_eq(ret, 0);
> @@ -815,12 +814,6 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   			continue;
>   
>   		test_init(data);
> -
> -		if (data->linear_modifier && is_intel_device(data->drm_fd))
> -			data->allow_fail = true;
> -		else
> -			data->allow_fail = false;
> -
>   		data->modifier = data->linear_modifier ? DRM_FORMAT_MOD_LINEAR : default_modifier(data);
>   
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
