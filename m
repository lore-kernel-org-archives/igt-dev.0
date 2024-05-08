Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B84BC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0498F10FDA9;
	Wed,  8 May 2024 19:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTfBeeS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E466210FDA9
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715195520; x=1746731520;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6Y8gTEwioKC35oOdh1eAS7hinghQUKLjnOsG5RalbU0=;
 b=iTfBeeS5Vcq5gWU617+aVWJ+0vwfDAsywnfDEsGKYl0Yr8bUUA1vO0w9
 0NAJ2k9n08YPfCPuuoYwmhZ07diVpJliSN3atQ/YjBqVv/umCN7v4FdGl
 Q5tda8QWJth5vinyb8a+0gXHXBDEh7mEaA/VDek61GXXxg65KcuOtfvMl
 0RFZqINifyu+n5Jqgg1X/9K+uoMMMOgOARTtWgzmEu6lhu/OSnV9hWBVt
 PWY1w+FjTncgGYKNSY9m6o5Eg+bWAIHZL/aQ8ozmeLymRhetEtQ1g9UVU
 kqCRQd9cJHA7GNtQ/EymHhe0oit+UnxqjHZgsB1jeXTgl3uKEO2p0l6LW w==;
X-CSE-ConnectionGUID: ckMlpi1LRT2C5lI1rhtl3g==
X-CSE-MsgGUID: yJZhECrDQN2WZZUqWeoWfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14896236"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="14896236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:11:59 -0700
X-CSE-ConnectionGUID: c2pfD26pStKtdpJtRvRebA==
X-CSE-MsgGUID: k1pgLz5cSSG7TfsZrJo7nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="52189849"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 12:11:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:11:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 12:11:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 12:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rf/D5J8lb7jhVDmuQCz4E4C1nBOfIw1WQVheOh07BtHGmm+0aOjbY5JZjMS/pzolvZuXhlTCv3GUHODmxY/Q6TPswfunxYtDn+JI2SIV3gkIUfXm5JUfAzbcIGzFzc4fcR14BpgHxnvftfr+PKu33UtjYiSjoZtpQ4+ydhdmpXE+2+ZYXxYgTzEcM7FvfmnyyThLyxJAcH2dHBbih73qcgU6+W9C2JpvwxlPzqGf+WL8+lDlS6tYA2RdAcKVYdQYQjXpdNd73kvHyuOA8ZIhmaef7Qt9qPasjr8tdyF0cgdA0PHuEwFjpE7Cut56v7C9pFjq43eQZEARf0feigEcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sujxElb9WLOTU1xGaAYSdXxoThYlel2SZbuzLqsaxhw=;
 b=DN4yqefgAuNqx3dcap2WWekoeICTH9seB4fWEgNXFBO7bmPjJqv92OgWJ7sWFnyBw76dgQT+Zwn8mvqz8w6XEH4o8SivWJ1C7m1b6NMdWYYaae2xUYgPBEyT36BXIG8gf9MQYxEnh3ufr9nMJsVvLckYe72Ys6HQTY4bXm2Wcud7F34eFTPVitKZ97vuXAXV/9EKp52A8vjRJjG56dH0pGnNTr5L1ZWCVbZ0TVgzvB7Kk6mjvZrmPdG465560Y32yyBhxlnXFvVkM0ZCUxbdChhCBqe2Li3OrI4oTdnB4WS8CuNN0sS0qjOh1hH4PJsPMwr8Wgm4LKcc6a1eBRRuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 19:11:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 19:11:56 +0000
Date: Wed, 8 May 2024 12:11:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 13/13] gputop: Add support to
 drm-cycles/drm-total-cycles
Message-ID: <ZjvOeqh067bPEJkf@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240504064643.25863-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:303:b7::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: c1caa050-9e8c-4c51-c7a6-08dc6f92ba23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VndVTklvRHA3SVpyRWo5LzlWYUFaMTBUVXRjdWJZMGZ4NXlrREQyN295dmhr?=
 =?utf-8?B?bnJNWTMyRUNYTGtLVnRSMjdvRG41Z0gvaTZkbUMxUGJ1T0NZY0xJN1hkam5R?=
 =?utf-8?B?TzEvbnZPMi8xR2ZoejF2bG9HQUlmZ21MRHBxWGpkcHZWVjBONzB2dUprTjBQ?=
 =?utf-8?B?TG1TNHc3a1hMeFMzY3JKMS9FUVNzS1FxU3ZicnNPeG5tNXVJMEZkWTlZYThC?=
 =?utf-8?B?dGJNSmk1emlPclNQSXl5bUpTKzA5Zm9oY09sS0wwbGZmWll2cXhkNVhxR0dD?=
 =?utf-8?B?M3ViTWVYbnFyK1VzNzZnNXB2bVJYc3J6OElIMTNRVWRTbWxmYjV4S2NHdWJs?=
 =?utf-8?B?NjJPQ2hwcE4wM01YSlVVUm12WTFWbVRKSUMxakpmc1hQR2dJNkJ4N2ZLWXNV?=
 =?utf-8?B?T25zSkJVWWZuUjR6Qy8zeEJoNWtseE8xcEQ2Vi9VOSs5UTY3RDBlM0tjQzdN?=
 =?utf-8?B?eE5OQTNnQk9ZYnQyekZwMS9SaDVIMFNJdGNLeUl4aVFlMGpJbnhCVEN5K0Rz?=
 =?utf-8?B?V3JVK1dMVmhwdzNiZXJuRmYyQWx1SUxqd0VJY0YyL29CdjNOWjV3UUdLOEow?=
 =?utf-8?B?cEtVSGJQK3IwcS9aVWgzNUgwODB2Z2Rva1BDSDVpYm80L1g4bjdvVTRETDR1?=
 =?utf-8?B?QnBCOC9YU0RZNU9LdGNUTFNIVUdZVlA4RXBPc3h5R3hiVFY2Y1RqSExPaE9a?=
 =?utf-8?B?dlJmem5iL21iZktSZWFXWnRyVkNOZHhtc1J2N3NYdmx6RDU2aml4Z1dSdnor?=
 =?utf-8?B?ZGZQZUQyKzNUUEpZQjFRTnZ1a3JGTXJSbU82aFVHd2EwT2xPYURkS0I5dk5j?=
 =?utf-8?B?SUFvWXZIME12MlE1ejU4eXRyQW1aZjBKYVlENGtLOGQxdmR6ZkVXcDdVci9a?=
 =?utf-8?B?bjM0cStQb3RzZmdHSXJQems0U1FoYlo5Q29YUzJHVk5DbzJTbEJwUmFNMUZy?=
 =?utf-8?B?dndlcTNHZVpLbEpNdUVqemZXSnA5QThGblloTnhaMys3ZWlLdzVKRndyLzNH?=
 =?utf-8?B?YTd5Nm5uRDE1RlYwZDRRTTByN2x5SVMzcVJjbWIrSjJEcTFERWwrNnhXdDBZ?=
 =?utf-8?B?aDdHU2g2aU90SlN6QjU4ZHZHODVXcE0vM1k5NkZSMURrTm80RmVycnpQV0VX?=
 =?utf-8?B?d1hIbURXc0pJYnJySVV5dHlCcUt4emFvR2FHYit1V2JMU2lhNWZhYlhEUFBH?=
 =?utf-8?B?R0dpeW5aQVVVOW5OL0VWaE9OREtqbGI4WkhwT2t0RTBrV1ZBczl0ay91VmdR?=
 =?utf-8?B?RVZXWkwvZWx0bDBrR1dwU29QNk5McVRPczFsVFNGY1BIbHc0TmlNbHorUSs3?=
 =?utf-8?B?ODZEbXpGTlZyWUo4TGcwdjJuZXg2UExzQVNzTVRpcjNXWVNwQ2M2SjVqZUh2?=
 =?utf-8?B?L1ZBTUs3aFBGTmE4dXVSOWI3eDgxaFFEVFEzTCtvSWpoRVZULzhrMWlTSG9a?=
 =?utf-8?B?S1ArS1MzU2JNYSt2akRab0Z6Wk5XQ2pVME9MOGpVVExjVFlCTGhuZDlDWTZt?=
 =?utf-8?B?YUlWWTVPanRZTWN4YTh5TExRRWdiekprUGVsVWs1YmRxaFZnejJDY3ZtYUFG?=
 =?utf-8?B?blFYUVBSaTBZcitlMHNRZ014OHFjdU1UQ3Y3NW9vWVlBZXpTUVVLSlZBRVkw?=
 =?utf-8?B?Qy9MZjVWTzJ5czBPckJmK1ArU1FoYlVwY0F6VEEzOWF6TWwzcG9kcFhTbEZY?=
 =?utf-8?B?MnZpS2VnNEhSa0ZxWWxLUE05NXVsM1VBWkFmUjQyNGRxYzJzZ0xvRGtRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJIWlkyZmdub3FWZUx1cGRhNk1VR0lqQmFQMHd4azRxcFF4S09CNGt6T1BP?=
 =?utf-8?B?dCs5YkJCZEVTL2lMK0FmR1Z1SFNsU3BMWEhORjkxOGpRSGNybDBDV0ZaSGhx?=
 =?utf-8?B?bVVXenRLSW9zNGZoNW9xQ1B6aUR6Q2hQN2g0RUg2eGk0N0NuSmE3aytzVDRw?=
 =?utf-8?B?UDR6RktobzM5Q04yK1lUZm50b2lFd0tjaURkOGh3dkxxWU4ybUluTmZ3SU0x?=
 =?utf-8?B?LzBmS2k2alA4cXlQK3R5NnpaaGdhREZCMGlBVTBJQVdKSUQvYk5Bc1hwNTE3?=
 =?utf-8?B?aW94ZmY3UTNybXlTbmFxSWpMWkZlUE5tZGxaT2pLNDVPRXhROXF4d016RG4w?=
 =?utf-8?B?K01WWFlpdE52U1AwbFVybHIvSElxWktMRWRDbGpvZEE4SllSNzdsc2pCR1Yy?=
 =?utf-8?B?bWpka2hncVJ6N05SVkd3QTdWUVZFbG1wVERyOSt0Q214bU5nTy9NazhWdmRH?=
 =?utf-8?B?Y1hnM0RWYXZMVmxhcEZ3Q1ROYm9KWmU3SkUvSElWd01TL1ljaFk4bFFzMi95?=
 =?utf-8?B?SWx1TFJwZExwdVVKb2FKbGZhVzV2akk5bzVWVjZyU2JjbmdPOCtPQ1czL0w2?=
 =?utf-8?B?b0llcy9kV3BkYXVrYW1aeFB5ZHJYR0w3WkNqWnJBNmswZ2xXb3I0ck9MUDl2?=
 =?utf-8?B?OVpBNjdEQmNGbDNZVjZRVHIvYUhYa1JrcTI2VGZDMVB4bjhvekRyOHJUZnpx?=
 =?utf-8?B?eEQ0NXV6KzVLWXpTTmVWSnZEaFZXVDdWRkxSdEwyUDZtRUx0R3FSSnZ6Z0tS?=
 =?utf-8?B?ZnE4NDZZTGxXMllZNU9qZTlQNGNSMUZkNzlLZHFkTVdSWmN5a25CNzAweTlN?=
 =?utf-8?B?RGtOYnk0blBLelZlMEVxSklvckFlZ3NGSFM5RUJQeDJkaE0xU0prQ0Q4Y2Qw?=
 =?utf-8?B?UnN2TEtPQVNKcXVFd0tod2FQM2RJSjFjejEvb1BCOVc5WFcyY29BTFBKK2hD?=
 =?utf-8?B?T3lTRnZvRlMyd0FOZTU3alZzdUNuQUFZZXdxb3dhekM2NnVzWDdVNzFXOUln?=
 =?utf-8?B?WkNJeUJOa05Jdis3RzNQR1kyeUFUZkx1YkFuellROGlBSWM0Qng5SGhTYjRS?=
 =?utf-8?B?Sm1Va0xCS2hBdHYzVE5ScVY5NHRaZ09wb0VmTS9lSzN5V095N3BWK2R4MTBF?=
 =?utf-8?B?Zy82Y2NQVG1hT3dGcUVaN2k3L0hzbElGb1VYZDdnMWEwZ01RMzRTOTdBTzUr?=
 =?utf-8?B?aTRQSlZaSTUxTVJQY1BlU0hZZVpCTzZUZWFPakNrSm44Qmg0aENXdkFpYVdP?=
 =?utf-8?B?NWtPdi9LWEplUHhzYnU1NVo4MDI2bXBNVGhucloraXVycEc5Z0plaG5JQ0k0?=
 =?utf-8?B?VVU1UlREWnlibDlsaWs3dmZyNzhHUGtIQXo4NFFXSkppOHlnb3FQakczVGlN?=
 =?utf-8?B?eFpxMzlaMTZzcy8wc2loa0RvZFVCeUNyR01TcWZOa3ZJNFNZWVJFeG1vNEJy?=
 =?utf-8?B?c0R2ZXNMc0RWM3dPSUVFblB1aHNvV0FXemZzaDdJYTZmUnVhUDdEcGhTY0RL?=
 =?utf-8?B?ZG1yNUJTbWdDa2t0QUxRTUZvcHc5OW5UM0xNak5NRHB1N0ZmZUxGVkx0SldC?=
 =?utf-8?B?MDc4ak8wWHdPMGRvU1A4aExZS2t6N1k5UndUYjQybjU2alBMUjYxQXVsd0Ex?=
 =?utf-8?B?K1NIMmpNYTBPVnlFZzdRM1oycUZtRStQckluaTJLQWx5RThPSC9KZkJPRTJk?=
 =?utf-8?B?bVdNd3k3dHJBOWZNcklYNVkwbTR3cks3bjJ4NlN3a08ra2lNRHpSLzZsUzBi?=
 =?utf-8?B?OWxRN3J4QXhiY29ROFlkWUdrcUNKWHVrTHlLK1U3c0JadklGalhiVit0RUpS?=
 =?utf-8?B?UDVHUW9BTlQ3U010dXFaOWp4MVhrb0pYODh0bWdrZHBxa3dlakVYdUR6VXVo?=
 =?utf-8?B?cXkxRXJ0OHYyMGU5K3duN3FvVFhZV2t5ZVhtZG1KRURFWVZ5MFFwS2xzMk1W?=
 =?utf-8?B?VXN3YVJRMkNxSWVQOCtma1k5cDJMZktYZHdFbHdqSndUd1I4OHZtdytWU05C?=
 =?utf-8?B?NTZiTUJsem82ZE5UbU9jOVJLY2hBbWFTc2MwS2ZCdjF3ejlBbmZBcko1aVFD?=
 =?utf-8?B?aXFuZVF3ZHorOXhETTBBa1NMcVhLSWJ3OGsxZlpMSU80NnIzVWRDSXU2VW9H?=
 =?utf-8?B?RG9FZForcUQrZmRVbG1ucHU1RlBwNzh6SDZiU0ZtSlZJK0psTjBxT1ZSTlFx?=
 =?utf-8?Q?IREL+76bSrzdEV8aBQXDRNE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1caa050-9e8c-4c51-c7a6-08dc6f92ba23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 19:11:56.0112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOojq/PWch1NrArpb8fh7NGm98g+UUUtZo/z+OJVGM3q6fAbhOMMyrkJq7df+Wi/FQxRs4dMaL7uGM79I7yH1np2ny2vKXqLWJZ+mu0Llws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
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

On Fri, May 03, 2024 at 11:46:43PM -0700, Lucas De Marchi wrote:
>Add support for using only GPU timestamps to calculate the utilization.
>It uses drm-cycles and drm-total-cycles read from fdinfo. For any
>2 samples, the utilization is calculated as:
>
>	         u[i+1] - u[i]
>	pct  = -----------------
>	        Gt[i+1] - Gt[i]
>
>with u == drm-cycles and Gt == drm-total-cycles.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tools/gputop.c | 41 +++++++++++++++++++++++++++++++++++++----
> 1 file changed, 37 insertions(+), 4 deletions(-)
>
>diff --git a/tools/gputop.c b/tools/gputop.c
>index aa88a8021..11e0db482 100644
>--- a/tools/gputop.c
>+++ b/tools/gputop.c
>@@ -30,6 +30,11 @@
> #include "igt_drm_fdinfo.h"
> #include "drmtest.h"
>
>+enum utilization_type {
>+	UTILIZATION_TYPE_ENGINE_TIME,
>+	UTILIZATION_TYPE_TOTAL_CYCLES,
>+};
>+
> static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>
> static void n_spaces(const unsigned int n)
>@@ -171,13 +176,33 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
> 	     double t, int lines, int con_w, int con_h,
> 	     unsigned int period_us, int *engine_w)
> {
>+	enum utilization_type utilization_type;
> 	unsigned int i;
> 	uint64_t sz;
> 	int len;
>
>+	if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES &&
>+	    c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES)
>+		utilization_type = UTILIZATION_TYPE_TOTAL_CYCLES;
>+	else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
>+		utilization_type = UTILIZATION_TYPE_ENGINE_TIME;
>+	else
>+		return 0;
>+
>+	if (c->samples < 2)
>+		return 0;
>+
> 	/* Filter out idle clients. */
>-	if (!c->total_engine_time || c->samples < 2)
>-		return lines;
>+	switch (utilization_type) {
>+	case UTILIZATION_TYPE_ENGINE_TIME:
>+	       if (!c->total_engine_time)
>+		       return 0;
>+	       break;
>+	case UTILIZATION_TYPE_TOTAL_CYCLES:
>+	       if (!c->total_total_cycles)
>+		       return 0;
>+	       break;
>+	}
>
> 	/* Print header when moving to a different DRM card. */
> 	if (newheader(c, *prevc)) {
>@@ -208,8 +233,16 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
> 		if (!c->engines->capacity[i])
> 			continue;
>
>-		pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100 /
>-		      c->engines->capacity[i];
>+		switch (utilization_type) {
>+		case UTILIZATION_TYPE_ENGINE_TIME:
>+			pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100 /
>+				c->engines->capacity[i];
>+			break;
>+		case UTILIZATION_TYPE_TOTAL_CYCLES:
>+			pct = (double)c->utilization[i].delta_cycles / c->utilization[i].delta_total_cycles * 100 /
>+				c->engines->capacity[i];
>+			break;
>+		}
>
> 		/*
> 		 * Guard against fluctuations between our scanning period and
>-- 
>2.43.0
>
