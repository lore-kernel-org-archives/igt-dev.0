Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F030CCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 12:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7010E701;
	Wed, 12 Nov 2025 12:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJVjoyRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E7010E701
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762949439; x=1794485439;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IDpBOnCETvzihtd5BPsHXRyoaGxHC9CpDAb+6mP4ySo=;
 b=cJVjoyRAvBjMsnMQCUpf3Kcy69dcckpjY3Ave6x2iEQ+CVn2uPiuHOEm
 ZhkWdVeSVyM5BTWUfX37IjyG0N/wrtBMdIum4skde8upNrVaPY+M8Znh2
 oS/a+laALxACSdWGWemx/uFkNCGYZC23+1ix6ejG4GRWLaXQhEEIKiarK
 /AlKA+wjrkIMKyfATF8RsDq/EHvMW6XDGlrKth/NHY07/bjdoNko38vM4
 49lV6YGt70hV/Mql3w2r2L/FS7N3Ohv1YwAd7mloQNre7JVI8AMPDBPsW
 Svbuq12wmr3bKGjJsBszAe0wjlfeGh+sQbKg04UUVnDpiHSWoyfpjZR2F Q==;
X-CSE-ConnectionGUID: bS/srHwMQ3WPdhT0m7h5BA==
X-CSE-MsgGUID: NynwDm5KTb+lxE42MOqSJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76469172"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="76469172"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:10:39 -0800
X-CSE-ConnectionGUID: lK48AIX8SdeW4UxaTp//OA==
X-CSE-MsgGUID: GCTxCP3ZQHmi+wrczdmnkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="193596010"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:10:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 04:10:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 04:10:38 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 04:10:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trQ2i+ajicanfvvSsw39uSVpat6S/KhPuWfgwPhXa9iTjZrV5LKdTjCAy8bSbw0JPFEHMmmg8LYInUZXFfoWwz+aQB9hYNjg0WHOjGozIUQ1F0S3lRIuNn7sCcnr6w3098NAiP66aDk5aOXB8RfiM24lt2DXrmQeyWUAL+I6YjL4L9Yq1XScLhYI3JsHfsKFJ7/M4fUuWLAYHPi4aMmKhiQ9k/XiONCYZyFfRify5Y91ZUvF0QHcylYAUeuRoLUxALGilgNnMJz3fQJ/xaiXX6emby5NutbUha+BnfOxI8vLbGH7hYh8KZyTUcDklv3QTqEy3mAHk9/M9oot3xfHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haVqoTYsHYqVHI6oM/b3Qk03l5NNzxVxl4QabVZAZxU=;
 b=Q1Hi2tg6kSgWsfkKZwKr+C11iKmwzGLB0LpWTqOem1S8xCummIr6W4SufSuNRYlj5Jo+vENdfqOv5CePwlr3nkSRasd3cZEIMQOodU2juCm3wyVOHPei7iWKfZAFbLmZLFF6lUh5Djnxl5JGkHU9wv8CyOStY40I7dmB3+bDJ7/cItKCliO42QVfYMtsnjtTF5MspZTsFedUf2Cd2vPDtHHQUSQb1l8rEP+u34X8b4PAUbBv57sNeQYoxAizy3XhB/at0016zEJFoYh+h+LXNjOIySdipdDLJxP7e8PuMAIGltpLxx+xsylF96dAWASh+kaLQkBYPEu8eA6ySdq5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 12:10:33 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 12:10:33 +0000
Message-ID: <56ffeaef-b0e8-4b7b-b7e1-d3fd9687d7bd@intel.com>
Date: Wed, 12 Nov 2025 17:40:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] igt_kms: Rename igt_pipe member enabled to valid
To: <igt-dev@lists.freedesktop.org>
References: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 7849495b-baaf-4f71-59f7-08de21e47ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWtSdE44TXh4YWdCL1g2UkdVVWlPZWVzTGcyeHBPOHBJYWs3OGJQOTUySWRQ?=
 =?utf-8?B?RDllZHdvaUdIM3l0SHZVemFxdHo2T1lzRVZmTUZXQXdLRXNBMUkxa2pwMXBa?=
 =?utf-8?B?bi9pU3dGYTJyVDVRVzM3OUdSL2Z0a3RQRTRLQ2RFeFRuaUFkbGJUQk1uWkg0?=
 =?utf-8?B?YXZ4bWVwOXlkbGtaQTRjVDhmOW5Vc2NZaGlWeTFkdlg0cmUvOFZ2cW0rSnUr?=
 =?utf-8?B?V1Fkbm5qaExRTmZUdkxyM1JMUWd4NXZSTEFMRThDUllTbEc3d1N4cTlLNld6?=
 =?utf-8?B?MUpyNnRPQlQzaFk2TlYzNU5kSTZMMWNnem9leXRKdVowWjQzMmVIamlSMzRn?=
 =?utf-8?B?M2pBSmFzMURzcDZRenJOanVMYVpsZWQydVV1QXgxZlRGay9UU0h0bENMNjEv?=
 =?utf-8?B?WDRCU0F4SmU5Sy9HQklCSFBNYVBmLzJtL2NOVk5rWkdYV3JVUzFFaytwKzBs?=
 =?utf-8?B?TXdwVkEvLzMzREJhaVUvamY0S2l5R2owaDd2cGc5S1NHdmhMdlFjaWtPaFQ5?=
 =?utf-8?B?ZFNGKzgycEwwanJvdjlwWEJkVlVESm53VWFjc0xhbnp0cEdUVXJZUFZxd0sz?=
 =?utf-8?B?a0Z6dUlJSmhHbHJyZncvSnJXVDFqL25JWGJzZ3JWT0JoT2tvaExGQlRRODZQ?=
 =?utf-8?B?VEZxaW10YmF4WXFlem40M3ZwSjd0MTdGaXRPV01iL2ZUT0J5aXZLVXdrZ1NP?=
 =?utf-8?B?Qyt3dHVSSkx0NGJWNDB3TlVzaE4xSGEwU0ExSGRtMUdwQUhxT2NpUGZTVkth?=
 =?utf-8?B?Skw4YjdpL2Erakt0THlMMWxSd1FaNlFUMXhwcWdvQ0N3d0ZzMDlPZ0UyWHc1?=
 =?utf-8?B?MDVlcUdDdlZNYUhFVkdvUk5PR1dmQk5yTjZMYkxYckxVUTA3SUU5eDBvOXNm?=
 =?utf-8?B?a2p5UVBlU05hVnlyem5kUC8vWG0zU0VPdWRpeGl0RlVnVjlVd1VOS0hRSnI3?=
 =?utf-8?B?cmY2U2FkKzZuTWs1U2w0dk1PTFBJTlV6ZkRwaTZ4NlZRUDBCUmUxWDdLektP?=
 =?utf-8?B?ellOQTJMWmF1Q1U2N0NBOGd2L0JJRHlWREp0alVMV0Mwd3h5NlRpQTE1SUs2?=
 =?utf-8?B?dEhFS3dGbVNUVmpZQTllcERyTmU1V3FGbVFJeHVhQkI5eUM1azJNUTVXL29O?=
 =?utf-8?B?bUIrYTFPVUZGdGx3aWk0YzlQaUYwamprcDkzL0tPbkFVbDRaQTROTU5VaUY1?=
 =?utf-8?B?RTUrTXQrUndMaWM4RldTTnpqSldNbUFDM0xMWHJoQ1FuY283RkFHeDZjTC9O?=
 =?utf-8?B?ODMwQ2Q5YlRxZ0t0MWpLWndKbE9zazU4b2RFQ3R3SDA2MzlUcnhUUEErWGpz?=
 =?utf-8?B?MEE4QUlLdEprVTl2cHd4U01JcHdvZ3JLWCtuekJKclk0dW15TEpYSFhhYW9h?=
 =?utf-8?B?aGxnRXRMZmFqVVlmM1RpZkNPbXdHcFd2YjNrWDBWUFpqVFBFRS9OTGhERU4x?=
 =?utf-8?B?OVkrdDNiMStkamlSMGJaN1JtRFFpWU5MUG1KYkRXZUluWitmMnhTTnBiMjlr?=
 =?utf-8?B?WlQyWUh5S1BrRFcweDEvbm90WUN5YmxrSkpLaWVhMjJxWlYwYWxQMU04VHQr?=
 =?utf-8?B?aUxzcDVEVnRMR0ppbElrZmRTK0lRc0lROTAyZ1lDYnpyOVgyK0Y5YXY0dmVv?=
 =?utf-8?B?TWpkZW90c3JqaUdGNVZzaFRuMjRnSENOU2tFcVVtT3RCWGpNcGE2aGRMK2E2?=
 =?utf-8?B?SDRvWXVLQlNlbENTei9tQTdZcHZSemYzeTFrWEVEU3RpR3p2N2s4WUVCUWt0?=
 =?utf-8?B?dG5ra2t6Nk51clY3T0QyamczeXE3SXQzMnVpKy9vVDRXdmlvU0pjZm9Cb2sy?=
 =?utf-8?B?MFRaQjBWcDNCUU1TMlBRMDZ0ZWZQYkR2cmMzSXFNRW9yNExKbk5mK2pCZzVS?=
 =?utf-8?B?UDdTSlNvS0ZoeWdjMDNFOHovSW9NZzlyNVZHeUF4MFdTbFRHN1d0OWRtTEl6?=
 =?utf-8?Q?FBd8YmzdeuFK8oisto+f+mNq7YlB1VpZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BrMDFuQnhSRE5KM3oxZE1MUXoweGxmMnJ1QkFoM3RscUpoNEpkcGkxNzA3?=
 =?utf-8?B?d0xFR3dDcWZmZ0tXb2RmZzRGRzNHbmJ0OHdlb1VCcm5wTDVUNlhabElSRmZV?=
 =?utf-8?B?SzY1L2RIU2Q5SWhyUm1RZzI2bnBEajltNWdObHk3L3J0Y1E1dGNQR3FsbHVJ?=
 =?utf-8?B?b1Y0K2RyamRUV1N5VWg4bjFTRm9RUTNqSWZBd3d4bkZMSTNHd1pNTGlKWTdt?=
 =?utf-8?B?eG9zQzkwRm5GdHhWUzF6TFdyZ0xLZHNocFhQNzgxR2dPZk94T29TdTJOVHRS?=
 =?utf-8?B?ZkxwSEtOZnV4N0JrMXRxVDRoUUlXa0Z6aFU5QVVNMVJpc1R0RWVBQkhVeFRr?=
 =?utf-8?B?ZTVSQmZYWHlzMk04VHlIeGlYY2w5dVgzUDNRUDUvL1V3OVg5UlBMVFpLVGZ2?=
 =?utf-8?B?azV0b01vOE85MDZNMHJpbUcxQ1lRa1A5V1FoWVpnKzFwUlR2cVBwNlhvU1NI?=
 =?utf-8?B?bnVKcG1jV1YvQmtBLzdBc3FlazdBcmlwcWJMS2pYTnJuU2YvUm1oV2ZxKzV3?=
 =?utf-8?B?MHFQejYxemJMTTBLOXQ5ajlMcDcxeWcwcjNQeVRFWjZkcHZGQXp3cVliYmE3?=
 =?utf-8?B?ZEpPSis1R1JqMjdTbzJoeEtucm5ZNmczbjQ1dnEvVC9KdXprMHRrbGlQa3ZF?=
 =?utf-8?B?dG51ZXA5MVYrQzFCVWZzR0RsMUkrZzdTMG1BOThiMGdibEtuWENLcENHL0U4?=
 =?utf-8?B?UExyK1RCZm5uazRSVDVmQVRMaXByeGVzZkdrdEJrZVZyWlZxUXY0MGltWlov?=
 =?utf-8?B?aGo4YXA3OUMzQU9pRDlmV2JJMThJQ2dhYUVtMnZ5eGovakNXRjcyaXcyZllC?=
 =?utf-8?B?cCtDRmxtRExSZ1JTaE56YWwzczVPQkttNGpYbk5iMW9GcHkxcEpmTWMzbk5X?=
 =?utf-8?B?V3lPeGt3VGtVRm1wR2hUQkdGOVltOHBjSVUrbDAxSDR0MTdLdzdTNkhoTjRz?=
 =?utf-8?B?WDRPOHdMR0hMY2dKTHdtRlg0UzdXTXB5b3pXdU9IZS9aNDBEOTYzdjV1S29I?=
 =?utf-8?B?NFJ5S0VGNDFvVzhYNWI2ZjhaS3BpT0w1QUd3WXd3bC8rNnpKUnNlLzNEM0Zi?=
 =?utf-8?B?b3B5U1luMmpHV2MzVENCRUxzaytYa1JBamJ6bitSY3ByalVRT2ZSTGplOFEy?=
 =?utf-8?B?U0NGWE9kWlBPWk9zMzFLY0lsS2hzN2MyQzV5TlZ5RWMxWURxYTArYkJrS1M1?=
 =?utf-8?B?bkpaV2JsUUJLcE9DYWhLNi9xOTd2bFhnUHlWUzVuTDFyVmhaOXRwaTVXQzRp?=
 =?utf-8?B?L3FlYUVwTVRPME1qR2RCVHVZN1VoWUNycnkvczJEU0RiQU1KVGZLU0tvUUkz?=
 =?utf-8?B?ZEZMRGZDQ29wUWF3T1hEaTZ6dlpPcFpEZ1JCUUpVVllVbmhUTjduUmtNTUo1?=
 =?utf-8?B?NE9PN28vMnd4ZTNUWDJaMHRTY1ZITTlib2x0dUJua2ZUclZlVm12b281aHAw?=
 =?utf-8?B?Vnc2a2tvMnlVb1BJWjJsS01mZlgycGo4enNseHdYWkU5bEVDNCtlQ1I4VnU3?=
 =?utf-8?B?SEgrKzc5ZDFWVzNKU1lKQndqQ2VNdFg0UW0xSWxNV3ljQ2lWSjdYOEhUcGtF?=
 =?utf-8?B?VlF6V0NzUm04T1dDMCtMRHc2ejg1a2p0ZzF4YU96OE9yOWNVZjdMOGhkdmFO?=
 =?utf-8?B?YVlBWm9IcXZ6TGFNdjVXR1duQ0xHTzdURXVyOVRNWG1PNnN0UGVxbVl2eG5I?=
 =?utf-8?B?eHQ0YzUwcGFFbG5kYmozMktxTDg0M0lTQ1FQcjZKcHhGeUVaR3hBYXV6cU96?=
 =?utf-8?B?L25pcXJvdWtMU0RvZHlmSjB4RUtGVzFZWGR2eFZJajFWS0ZsNzV4R3NqWjRW?=
 =?utf-8?B?Rk9YTXdYNGlEUE9WRGNReUYrblo5c3NJYVN0SWwxNkIwdnNFUjJhZThucUlF?=
 =?utf-8?B?UHhSQVF1TzIzRGlVcEZ4MFZWa0ZyckRnK2pScUl6K3Y4L2xpVENKQjQ3Y01Y?=
 =?utf-8?B?YmtnMjhyR1lOVGg2RFlBVkoxSW84a0tyREJ1UGVpVFBDRXUvY2ZHdEkzckhX?=
 =?utf-8?B?Tzl1cDF4bjFKZklZejhJNHk2MWVpQ1Z0YS9paENzZ0dnU0R5Y1MraTJWR1Bi?=
 =?utf-8?B?aG5iSFppY0RtaDR2dWlONVBrbENuUWF3cXdLeXZPOTY0U0UyUzlwTVZhWFJR?=
 =?utf-8?B?ZytMTUFGdXJzZ1RaNHVGQnM4QUFDRzZFeGZiVHJ2bG9tZFlRUjJzQlhKVHV2?=
 =?utf-8?Q?e2PhoBrJVFkhiSNOUoKoNjs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7849495b-baaf-4f71-59f7-08de21e47ada
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:10:33.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0pcspBRoINpmFD2mOMACsPRxoVteS181yiCWsR46b2PCmWzFMuPAQfKrvCyHFRlDa/5mJvRhBxOWMrpWeoHGKrFBtsY9c2xPd/pQLX/dQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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



On 10/29/2025 8:11 PM, Gustavo Sousa wrote:
> The boolean member enabled was added to struct igt_pipe by commit
> b743593074ba ("lib/igt_kms: Add support for display with non-contiguous
> pipes") to allow having array of pipes in struct igt_display to be
> indexed by enum pipe.
>
> The chosen terminology can be a bit confusing, because one could
> interpret it as the pipe actively processing pixels.  Let's use "valid"
> as an alternative name for that member to avoid the confusion.
>
> Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>

Regards,
Ravi Kumar V
> ---
>   lib/igt_kms.c                   | 17 ++++++++---------
>   lib/igt_kms.h                   | 19 +++++++++++++------
>   tests/intel/gem_eio.c           |  2 +-
>   tests/intel/kms_joiner_helper.c |  2 +-
>   tests/kms_cursor_legacy.c       |  2 +-
>   5 files changed, 24 insertions(+), 18 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2eaf483d47d2..3b22d60f5942 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2714,15 +2714,15 @@ static void igt_fill_display_format_mod(igt_display_t *display);
>    * @display: pointer to igt_display_t
>    * @pipe: pipe which need to check
>    *
> - * Skip a (sub-)test if the pipe not enabled.
> + * Skip a (sub-)test if the pipe not valid.
>    *
>    * Should be used everywhere where a test checks pipe and skip
> - * test when pipe is not enabled.
> + * test when pipe is not valid.
>    */
>   void igt_require_pipe(igt_display_t *display, enum pipe pipe)
>   {
> -	igt_skip_on_f(pipe >= display->n_pipes || !display->pipes[pipe].enabled,
> -			"Pipe %s does not exist or not enabled\n",
> +	igt_skip_on_f(pipe >= display->n_pipes || !display->pipes[pipe].valid,
> +			"Pipe %s does not exist\n",
>   			kmstest_pipe_name(pipe));
>   }
>   
> @@ -2970,8 +2970,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   		pipe = &display->pipes[pipe_enum];
>   		pipe->pipe = pipe_enum;
>   
> -		/* pipe is enabled/disabled */
> -		pipe->enabled = true;
> +		pipe->valid = true;
>   		pipe->crtc_id = resources->crtcs[i];
>   		/* offset of a pipe in crtcs list */
>   		pipe->crtc_offset = i;
> @@ -3507,7 +3506,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
>   
>   	for (i = 0; i < display->n_pipes; i++) {
>   		igt_pipe_t *pipe = &display->pipes[i];
> -		if (pipe->enabled)
> +		if (pipe->valid)
>   			full_pipe_mask |= (1 << i);
>   	}
>   
> @@ -6841,7 +6840,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   				}
>   			}
>   
> -			if (!display->pipes[pipes[i].idx + 1].enabled) {
> +			if (!display->pipes[pipes[i].idx + 1].valid) {
>   				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
>   					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
>   				return false;
> @@ -6863,7 +6862,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" : "No");
>   			kmstest_dump_mode(pipes[i - 1].mode);
>   
> -			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
> +			if (!display->pipes[pipes[i - 1].idx + 1].valid) {
>   				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
>   					 kmstest_pipe_name(display->pipes[pipes[i - 1].idx + 1].pipe));
>   				return false;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 7121ab985fd2..52154933b25f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -455,8 +455,15 @@ struct igt_pipe {
>   	igt_display_t *display;
>   	/* ID of a hardware pipe */
>   	enum pipe pipe;
> -	/* pipe is enabled or not */
> -	bool enabled;
> +
> +        /*
> +         * Indicates whether this pipe struct is valid and can be used. This can
> +         * be false when the pipe is allocated as part of an array indexed by
> +         * enum pipe, but the respective pipe is not reported by DRM, meaning
> +         * that the pipe could not exist in the underlying hardware, could have
> +         * been fused off, etc.
> +         */
> +        bool valid;
>   
>   	int n_planes;
>   	int num_primary_planes;
> @@ -694,7 +701,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>    */
>   #define for_each_pipe(display, pipe) \
>   	for_each_pipe_static(pipe) \
> -		for_each_if((display)->pipes[(pipe)].enabled)
> +		for_each_if((display)->pipes[(pipe)].valid)
>   
>   /**
>    * for_each_pipe_with_valid_output:
> @@ -713,7 +720,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>   	for (int con__ = (pipe) = 0; \
>   	     assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes((display)) && con__ < (display)->n_outputs; \
>   	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe = pipe + 1, 0)) \
> -		 for_each_if((display)->pipes[pipe].enabled) \
> +		 for_each_if((display)->pipes[pipe].valid) \
>   			for_each_if ((((output) = &(display)->outputs[con__]), \
>   						igt_pipe_connector_valid((pipe), (output))))
>   
> @@ -1220,10 +1227,10 @@ uint32_t igt_reduce_format(uint32_t format);
>    * @display: pointer to igt_display_t
>    * @pipe: pipe which need to check
>    *
> - * Skip a (sub-)test if the pipe not enabled.
> + * Skip a (sub-)test if the pipe not valid.
>    *
>    * Should be used everywhere where a test checks pipe and skip
> - * test when pipe is not enabled.
> + * test when pipe is not valid.
>    */
>   void igt_require_pipe(igt_display_t *display,
>   		enum pipe pipe);
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 9389efb9683b..3544cb1fb3f5 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1032,7 +1032,7 @@ static void display_helper(igt_display_t *dpy, int *done)
>   		int pipe;
>   
>   		pipe = rand() % dpy->n_pipes;
> -		if (!dpy->pipes[pipe].enabled)
> +		if (!dpy->pipes[pipe].valid)
>   			continue;
>   		output = igt_get_single_output_for_pipe(dpy, pipe);
>   		if (!output)
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index 17a22d34a3da..d2a3117fec26 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -105,7 +105,7 @@ void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *mas
>   
>   	*master_pipes = 0;
>   	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> -		if (display->pipes[pipe].enabled && display->pipes[pipe + 1].enabled) {
> +		if (display->pipes[pipe].valid && display->pipes[pipe + 1].valid) {
>   			*master_pipes |= BIT(pipe);
>   			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
>   		}
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index ed1c77d5593b..865853c38fac 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -294,7 +294,7 @@ static void stress(igt_display_t *display,
>   		}
>   	} else {
>   		num_crtcs = 1;
> -		if(display->pipes[pipe].enabled) {
> +		if(display->pipes[pipe].valid) {
>   			arg.crtc_id = crtc_id[0] = display->pipes[pipe].crtc_id;
>   			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
>   		}
>
> ---
> base-commit: 7cc368821eaceafddf710879851ffd76f97ecb4e
> change-id: 20251029-rename-igt_pipe-dot-enabled-to-valid-227274664767
>
> Best regards,
> --
> Gustavo Sousa <gustavo.sousa@intel.com>
>

