Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F86D262AB
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 23:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F7A10E233;
	Tue, 20 Jan 2026 23:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOxYkeY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5506A10E233
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768950944; x=1800486944;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sI6Fi0dOgopTessfkW/mWuBawnEMkPjUQ2spVyzeriw=;
 b=BOxYkeY4CCTGuuexzbx/qAOtK0QVw/Z8mNjeIoZL22SGu0KGaUckQS1+
 fG6dCNUqv4xiEtogezHeIhvJY40wl9+2HXTYZBGiLDevIlCi0hEHPG/NN
 cSVhYweeYGF40HDd5zC1KQ4jK0LU/duhzd2SNMxd499fseJTog17b9fZj
 M4mVWZbszAXje86a988K5vXKfuu7WuGqFToXBsUDV8zNoiluT/Qzk/Lbp
 /1Tya3SRuh07UuO9I8oRCATSJoLuirfCSeiHAl/+Fohxa8J6lIqR6YveP
 oJXZedqLfBIjRDW62D0+sMVhWinTNqnlHYdx+gJtfYBXwibwItSX+FV1e Q==;
X-CSE-ConnectionGUID: G0Yx2H8eSZu48w9V3KEACg==
X-CSE-MsgGUID: fO0CbYs9RdiV7IkZLRm0Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80478093"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="80478093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:15:43 -0800
X-CSE-ConnectionGUID: LrPUKVnKShWE4Jllxlo7Bw==
X-CSE-MsgGUID: W7tTqxORTbOq7msv6nRNIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205502555"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:15:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 15:15:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 15:15:42 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 15:15:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sy6YKi6rI8QUFMiuNHekL/OQ5RjclwZoj8Nud7iLf6/TmX3B7EB+fXtD6s5q8AbiCHZxt5DPxurLx0t1k9HJ5AZnYQ+6haxAffhBtieFbXPbMFFWZ2fNqIfT9b5/SXsMWXLjbd/HQeEq/dEPmS86A3TEt+u/hYgFgwNtXWLNU+yidhpbFUBkZnVjGweq3KytzwPOJKkYUwdB/BBUEWw2ArsXQI3w0AHc/7cvKpLlBscnUhSI1fJMp/nZ8Czkrc9/fVSKz3F0g8lPeNmhwECGsCZjgM4rr0rg6um8Ppn1j4a/d+Nua6h3y/7Vu4U5MFTEBUheeNHvi2eVKiW/GPSnpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okl/HRXeVHMNa24qFIxdvdS2g+UfIueWJ9bQb3LyDOs=;
 b=WyiUH1WxnlEeE+ODbcZbemoAGfSgcIPFRIBSO9NYKptpRf6hBkH4MFXiWfXo9bve1zc0ne3gxGYyWM0BkHOYeIdRNHqVPBgJ9QNg2RQ3E5GHyJqObMADOTcL22EZ8dIhhBCMWACILyz8Vvr+4bdiU2kREKRXmm+TVzLWPi7llz6ycF/YJVGH3YD1Jmo32FokN6/RXZ8Al/yFyZfqzqzLLf+Ouo76FaIyw0fPDpnVT8CcNEbVywpbPGBX5QcdN8VQrobwM+9kqvSi0DBqEAHwFbIIDxXbTfN4JK+qK93MtqoaT9DEdIM9pmcpN1ZzSgWKy/Bmv+QYLlrnBETa1y/FKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9396.namprd11.prod.outlook.com (2603:10b6:208:56a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 23:15:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 23:15:39 +0000
Date: Tue, 20 Jan 2026 15:15:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Ravi Kumar V
 <ravi.kumar.vodapalli@intel.com>
Subject: Re: [PATCH v10 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Message-ID: <20260120231537.GF458813@mdroper-desk1.amr.corp.intel.com>
References: <20260112191732.672297-1-x.wang@intel.com>
 <20260112191732.672297-2-x.wang@intel.com>
 <viv6pwhicr6jjm5d4hoznn7w4h7ixamqdwalpx3eb3aoc5fgbr@2rrcrdhe7rsn>
 <20260116213358.GJ458797@mdroper-desk1.amr.corp.intel.com>
 <gt6bnphnrhub64xwn67xgx6aom7245osaqvqq3la5o4qt3hny3@zoqteqp6fd4e>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gt6bnphnrhub64xwn67xgx6aom7245osaqvqq3la5o4qt3hny3@zoqteqp6fd4e>
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adecf1b-4e95-48d1-4fda-08de5879d373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmdpVGJEalBsTTlEeXZaUW5qbGszTE9FTm9LRk1kK2FUU21MWHI3bi82Q1g1?=
 =?utf-8?B?NkRoVHdCK3hmeElLeEdVQzhVcXNQVmt1MVFyWFJIMXRlRlN3R2FmZUoyYXEy?=
 =?utf-8?B?UU5RdTBVeDNsb0YzYnlLbFZzTHZUY1BEQ0YxMm9sK0tUZi90L2tHMkZJQkcx?=
 =?utf-8?B?eHNzRUJtaEZBVGpUTVduT0RiSTE1b1pUZG5jSm1YZUluSDNJOXR1WTd0UXhB?=
 =?utf-8?B?Y0tvMVk0YUJKcFpqU1NGYWV0ZVljS2lWTVRqSkVTZVVCNTJOVUE5NXVveGFT?=
 =?utf-8?B?cWdJZ3Z6NzBOZjF5SFZlOXJvYTE4SThHYlUvQi9HS1RRMnE3VDJnOHRpMm8w?=
 =?utf-8?B?Wm1DUHVTclRFeVVpNlZ1cENad0o0cHFWOXJhQy9PZ2FsVXhtcjVTZlRHc2c4?=
 =?utf-8?B?WUZPd0RNdHFyaEFUaTRUdXRMeVJWTWlwWmdJb0dDNlRmM0ZtTjNXWC8vKzRi?=
 =?utf-8?B?TWwxQk0xdE1JcU9rZXBzeS82bXJieWxlRVNjV1BtZVFoeEI4M2tmdkg4WnN0?=
 =?utf-8?B?bjhXcW5mMG40a21zTUdITVlkRnlFcGtlRE1MWUJZbHV3SzArUk5UZTNENmpS?=
 =?utf-8?B?RjQ4MFk0a0lhSUhiZ0pSQjlDNHR2N0xZWjVNTWlJa08zVGhMZ3lHbzRzZ2hE?=
 =?utf-8?B?VXAwK1dZa3lqUkk3VENscVdpY1AxdVZObzNvSzFQVjRkZkNNMVJuMkU3bEFj?=
 =?utf-8?B?WVYxNEdNd2VFeVdlMkRuK1JyWEtBdGN6SURJbGlvQnpHT250aWhZQkdSNWhr?=
 =?utf-8?B?YzdrRFVnbXQ1YlR6RXlGZjVrWlo5THpnZUxhdTdrQzk5S1ZaQ3ZBRzdTUXEz?=
 =?utf-8?B?aUpsMzh2WVBsamRQVjdoVkR5TGd2QUVqNWlPZTZ1MzBTSHFOelBjSXJjWEtk?=
 =?utf-8?B?cFhhVkNOUkNwWjBTdTF3UXRjMmluL3drcHc4ckVlYUVkNWhZSVpKd1B6bDZo?=
 =?utf-8?B?Tk0raTdpdldFYzVhY3NRSytkTkZYK0RuUkh3QVp6eEVhWnE0ZFM1VFRPM2Qv?=
 =?utf-8?B?MGZQQ253cWdvWnRGVGZwQnRxVGxpOVRPbVBkR2tzQ295SVZEZ2xad1ZBUlVn?=
 =?utf-8?B?NTJXRjV6WDVqckxyUWFPWlZyQVZodm9iWkt1SWQxWkk2K3JnWmJoT095VU1E?=
 =?utf-8?B?a0c4dEhCMUhmRDhlZWhhYzZmNm5QanBvQVV3Mzh5V3ZaM2M5bEpvVjR6dUYw?=
 =?utf-8?B?NzZTWklJYTZkNEE3bWRvMFdlT3VNV2lIVGZiaUFneTZkaDI3SE5iKzJqdmtB?=
 =?utf-8?B?ZXdHaHRkQlhuem9lT2lzcG9IVjlhTTYwT0ZlS2hwckxlai9mMjJyanRxcUo3?=
 =?utf-8?B?cFVoU2Rqb1EvRWk4ZE1Ra0gxNGhnR1VtdWtpN1ZhQmZ0Q1k2UDJpYlA2aHVZ?=
 =?utf-8?B?OFdtUjVadzN5OVNQUStOZXYyZnZOa2ZieFk1RE54TXhiN0NuZDIyQWtwMFVt?=
 =?utf-8?B?blM1RTExVWEweWJLRlMwb21MeGdaTG8rYmZDaU1DUFBIWVVGczMzMHB6d3JT?=
 =?utf-8?B?MGE0cStwTzdYbklMdmljWlQrREJMOGVacEgrOFlxYythaWl1bG4vMFc5cmw1?=
 =?utf-8?B?MjN1cXphOVdvbmpVODV3ZmMvNVNPOTQvY283QnlNcGhWSkRoeG55TExacExH?=
 =?utf-8?B?aXp0c0R3VjlkMU9LT3prM1Mwb25ja2hadk52Um0zQm5VMy9naC9ZbjFQMTRS?=
 =?utf-8?B?WS9yL0lDbUZMRVZDcHVSZmpLZjM2UDhqaWFjTm9SbzlqQjJhY2MveVp3VzBV?=
 =?utf-8?B?M251N1lxZUd6QTNYUm11VGFSSkxEZFNFbVc5Y0FFWWhVcTdKL01seE4ydFBj?=
 =?utf-8?B?R0QvbTNOZmdsS0N2VDUrL3N1a3daNC9LZW1FMkVqMjlkT096Y0FQMUd6NW9Q?=
 =?utf-8?B?dHZxaGEwMlBKQnM5aUFEMzlBL0xvdVpUcDNuTyt2aXhLSTJWQm1JYW9vcEdh?=
 =?utf-8?B?VVpSVm54TXVSN1lPYStNeDFhZHVLYXhaR1p0REpiS2JuZi8zOStsaGFwVW1q?=
 =?utf-8?B?L0pMS1B4UUVqdDJkUm9sZVp0U0ZuRHlwbndtUjY0TEhlcWlDeVlMMG9aS2lP?=
 =?utf-8?B?ZGxvTlVTZUdISkhLN2M0ZE1wRk9KNmZveE92VEtpTXlhbWUrZVBHdHpSeEFi?=
 =?utf-8?Q?8V4I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRodFlkYzhpMFNvWUcybWpsRTR1ZFFRVmd1UGM2MDFhais5OGtFc3Ntejdr?=
 =?utf-8?B?cUNLbXdJMFRMTEZuQVRqaGY3MHc1RFg0Vnk3Q3A4dVJuTU5GMEZoVnYxRmRT?=
 =?utf-8?B?dFFGSXRieHNqaHMvaXlkb25Ha3RIZ2tWYkFiamcwbEZSYUlibmlpeWpyai9M?=
 =?utf-8?B?VmNITDFmOER3YkxRdVlJTDdZWnN6VjUyck9zN3Y0WnhINkgxM1VmREVUdHZN?=
 =?utf-8?B?VnZpTVhMd3RCKyt4MEpiWDZYTWUxOU9GOVV6QlE4a2tKVkt1VWlySmsxVG52?=
 =?utf-8?B?T1NXVDJzVmlVVms5QjNUemFrdUFJSk5WY1JnYVhWck5rZDMzL2R6djAraGRO?=
 =?utf-8?B?RVVJdzhiT3o4QndRcXdPV1hCdkJDRTBtRDV5ZS9CSVFuZTI3OXlSbG0xN2Zw?=
 =?utf-8?B?dVZqR3IyVCttb3k2TGtPN1hvOGZPZzQ1WVMzSmo4SlowM0d3NDNTMHRIaUN5?=
 =?utf-8?B?NmxRRTd6SkZDMGl0bTJsdFFhcTFyUFQ2b2VlaVcyK0I2SHk3R1hFQXFkeUkw?=
 =?utf-8?B?UVp2ODMxZTZmSVFZS3JaT0RQTjkybVN0MXVOWVk1TW1qb3VWVlNhUk9FR0cz?=
 =?utf-8?B?MmhSM21iSDNnYi9RWitHMVlwU0FSSEtxeVEzY3JKRUc3WEhQZHJwa2wyczJI?=
 =?utf-8?B?YjhBcWtnOFNnNG1XYmVYS0k0MGJiVFdnZ01nNkdWQmd5YVFHdzRPdjlDNERO?=
 =?utf-8?B?ZjE2a3JRTlBtczR4b3l2ckM5NExIRU5XV1lXR0N5VmtFdEF0dHBUWG5LNjVa?=
 =?utf-8?B?Vi9kYUdIeU92ekxVbnM1NUY2ZmFMKzIwRklEenM5bTh1dU5STXZyS1l4MVJC?=
 =?utf-8?B?SC9JMENtemU5V09GM0NzVGFuTTNJMzFUWjB4QmJOaXdaNDJzRG90SGp5TFdG?=
 =?utf-8?B?MkRib2t1WjZEVGdydXdOYjNPOHpOWVo3SytwQTNPNzYzeU8wajZtdUhpM1g4?=
 =?utf-8?B?d0x4RVIxeGZ0K3JEUjV3L2NYVWdoQmhwTnBEMjJwTm1hMno0enhpMGZPNmVD?=
 =?utf-8?B?VXJHRUZwRXhIMXlZUVdhWGhhYVhlYW03VVJWWktaNXVjdHdQeXVtZ1Z2aWEz?=
 =?utf-8?B?eTNHdjlGZm4rSERKZVZicUw2QXk4cnArbzR5VHE3K2Vzd3FVdTlYcmxjYmMw?=
 =?utf-8?B?bC9HeXU5WGQvRHBGWlZDV0pXcTZXalFnWnJ2ZE51amxqRFNFQ0thNE1abm5R?=
 =?utf-8?B?VFFJM3E3TTFEaXN6QVpUTDF5UnlUbWZVVlBpRGN5c2tIUjZpKzRERmlxZVVZ?=
 =?utf-8?B?dWFNUFBtWDJhV2FKOUxHM3hSOFVvUG16U0w5S1RrYjhkQ2l5ejJaeTNDaXdO?=
 =?utf-8?B?RGJ2Wjgvc0M0ZVdUTWswSXhRbWFocm9kWTd3NnBlall2NEtqNGtCcjNkQXBR?=
 =?utf-8?B?bmhObXdDWi8zUTBEZjV3Nmt1TEpHUW9KWkhoNnFubi8wWkJVWFFCRzJOWk9x?=
 =?utf-8?B?eG5tUFhGTVI5RW9Oc2dOUGNCRkpFdDhGYU5KMFNrWGlyN3hxekFwWS9XbzlB?=
 =?utf-8?B?TDNiUTJIdTU0MnN0dGJSalhWSVZVVy9GVGtxdWRXM3oxbWdUMkRla2VnbTJw?=
 =?utf-8?B?YWE0WHNVbkpwZzJ4ZFBTT043TzdOamY2TDVsR0luY0lSUWJyeDhyY2pWMy9r?=
 =?utf-8?B?Y1RicjE5Z3RRSS9OVjFuOWhzNDFmbVFKZ0FieFdFenJFV3RTU0hBWDFmL2dw?=
 =?utf-8?B?a2MraVRZSmdqUDRCN3NLRDZvT0Iwdi9ibGFJTXVFcnViTWUybUVYTDV4ZmFx?=
 =?utf-8?B?U3REalRoT1RIcUJvcDBhdnZXN0lud2NrVmpsZ3FrRlphUlc3MHgwTGhDSk5p?=
 =?utf-8?B?K0poMFd3azhKbFN2a09qT1R6WU95c0F2QWhBb0hwNDlqUnNBTXZmcktVRklX?=
 =?utf-8?B?ODRVb2M2NkFxNTdlT0lrODU3aVMvTEdrTndqZUlvbWtLYXJyRUQzZHJ1R2kx?=
 =?utf-8?B?ajVYUlJSaFFhK2JQazRWWlJhaCsvSkwxQkdoREpNejhiR3VldmxnOGVmWVJa?=
 =?utf-8?B?bVBpM3htYytyeUJiQ2dZczNzcUlEdDUybTd2bDhNOHdGNm5FT2g2dGp6YmJV?=
 =?utf-8?B?aXZsTWthYmRLMVUxeDRyQ2NnRVN2WWdMTUgzRUJxZkgyZVQzSjVhTjd1Tmx4?=
 =?utf-8?B?RHJ3aHY2MlZ4aGl4dGt2elU2V05KS3NMSHRWS0xEcEYvWGJ3S0RzbFJTSlpp?=
 =?utf-8?B?SUhoK1NCZzNQcDlDR204b3FaRmdzVXhGMUsxK3JzWGdGVDRWUXV4WC9OZm9h?=
 =?utf-8?B?SHNRMnVQbXNuQVhQUEt1U292czRqM20vQ1FZUnZNK1p4V3p0b2lvQXFrcWFF?=
 =?utf-8?B?UFBWRHk0V3BHd2djUXYrTjJTbktGWW9yNlgwc1BOUE1qb3p0eU40V2RzK2pa?=
 =?utf-8?Q?1jABZTAJU6fbXU1s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adecf1b-4e95-48d1-4fda-08de5879d373
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 23:15:39.7279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLoei32osqHPDtmwH88OS7R4H/aZbgIEfnh9izG11VstvNxEGk6uRZ5FzU11DbxIKXi8kNAxQCg0eihHcl82fsQBEHNc+uQLrGoao71ncJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9396
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

On Mon, Jan 19, 2026 at 11:36:27AM +0100, Zbigniew Kempczyński wrote:
> On Fri, Jan 16, 2026 at 01:33:58PM -0800, Matt Roper wrote:
> > On Thu, Jan 15, 2026 at 09:00:53AM +0100, Zbigniew Kempczyński wrote:
> > > On Mon, Jan 12, 2026 at 07:17:31PM +0000, Xin Wang wrote:
> > > > This allows IGT to query the exact IP version for xe platforms.
> > > > 
> > > > Key changes:
> > > > - Add xe_device_ipver field to xe_device structure
> > > > - set the graphics versions based on the GMD_ID
> > > > - Cache device ipver in global map indexed by devid for efficient lookup
> > > > - Implement xe_ipver_cache_lookup() to retrieve cached ipver by devid
> > > > - Clean up cached device ipver when xe_device is released
> > > > 
> > > > V2:
> > > > - add new struct xe_device_ipver to hold the ipver info
> > > > - separate cache map to eliminate collision (Roper, Matthew D)
> > > > - changed function name to xe_ipver_cache_lookup() to avoid
> > > >   confusion (Roper, Matthew D)
> > > > 
> > > > V3:
> > > > - optimize the coding style. (Summers, Stuart)
> > > > 
> > > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > > Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
> > > > ---
> > > >  lib/intel_chipset.h |  6 +++++
> > > >  lib/xe/xe_query.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++-
> > > >  lib/xe/xe_query.h   |  4 ++++
> > > >  3 files changed, 63 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > > > index cc2225110..424811f7c 100644
> > > > --- a/lib/intel_chipset.h
> > > > +++ b/lib/intel_chipset.h
> > > > @@ -100,6 +100,12 @@ struct intel_device_info {
> > > >  	const char *codename;
> > > >  };
> > > >  
> > > > +struct xe_device_ipver {
> > > > +	uint32_t devid;
> > > > +	uint16_t graphics_ver;
> > > > +	uint16_t graphics_rel;
> > > > +};
> > > > +
> > > >  const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
> > > >  
> > > >  const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
> > > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > > index 981d76948..823a29f2d 100644
> > > > --- a/lib/xe/xe_query.c
> > > > +++ b/lib/xe/xe_query.c
> > > > @@ -210,6 +210,22 @@ static struct xe_device_cache {
> > > >  	struct igt_map *map;
> > > >  } cache;
> > > >  
> > > > +static struct xe_ipver_cache {
> > > > +	pthread_mutex_t mutex;
> > > > +	struct igt_map *map;
> > > > +} xe_ipver;
> > > > +
> > > > +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
> > > > +{
> > > > +	struct xe_device_ipver *ipver;
> > > > +
> > > > +	pthread_mutex_lock(&xe_ipver.mutex);
> > > > +	ipver = igt_map_search(xe_ipver.map, &devid);
> > > > +	pthread_mutex_unlock(&xe_ipver.mutex);
> > > > +
> > > > +	return ipver;
> > > > +}
> > > > +
> > > 
> > > Please forgive me for sharing my thoughts only now.
> > > 
> > > I wondered about this a bit and according to current code shape
> > > I don't like this design - especially ip_ver cache in xe_query.
> > > I mean I don't like to use external cache which might or might not
> > > be filled at time of calling intel_get_device_info().
> > > 
> > > At the moment I see following options:
> > > 
> > > 1. Provide update function intel_device_info_update(devid, ver, rel)
> > >    allowing to update rel field during xe_device_get(). This still
> > >    keeps intel_device_info.c independent but rel field might be
> > >    incorrect. BTW I would set it in static definition to -1 (max
> > >    unsigned) to catch it is not set/updated properly during
> > >    intel_get_device_info().
> > > 
> > > 2. Add new function intel_get_device_info_by_fd() which will support
> > >    passing fd instead devid and migrate code to use it. Most of our code
> > >    uses fd to acquire device id before calling intel_get_device_info()
> > >    [exception is igt_device_scan which uses pci devid directly]. This
> > >    will break intel_device_info.c independency because we start calling
> > >    driver functions, but maybe it is time to do this (GMD_ID).
> > > 
> > >    Digression: It seems when INTEL_DEVID_OVERRIDE won't work properly
> > >    but I wouldn't care about it for now.
> > > 
> > > 3. Mix 1 and 2 but build hash map from intel_device_match[] in the
> > >    constructor and update it during xe_device_get(). Pros of this
> > >    is we could stop using 'static __thread' for caching last info.
> > 
> > The problem is that "graphics version" and "media version" are not
> > supposed to be a characteristic of a general device type anymore.  An
> > individual device will have some version number, but another device of
> > the same "type" with the same PCI ID can can potentially have a
> > different IP version.  We've been lucky enough so far to still have
> > unique PCI IDs for cases where the version numbers are different (at
> > least for production parts), but this is not something that we're
> > supposed to be relying on since the IP disaggregation happened around
> > the MTL timeframe.  Personally I think that hacks that keep treating
> > versions as something associated with a device type are just making the
> > problem harder to untangle.
> 
> Thanks for explaining this. I wasn't aware same PCI ID may map to
> different IP versions. If I'm not wrong atm kernel also doesn't have
> this addressed yet (pciidlist[] still maps PCI ID to some device
> characteristics).

I think the kernel should support this all properly today.  In xe_pci.c,
we track two different sets of characteristics and look them up
independently.  PCI ID is only used to pick xe_device_desc structures
that have "platform" and "subplatform" characteristics (e.g.,
"BMG-G21").  That's roughly equivalent to the IGT device info
structures.  For modern platforms with official version numbers reported
via GMD_ID, we independently map the GMD_ID values reported by hardware
into xe_graphics_desc and xe_media_desc descriptors that provide
characteristics for the IP (e.g., "Xe2_HPG").  Anything that's tied to
the graphics/media IP itself (usually GT-level stuff) uses fields from
the graphics/media descriptors and is unaffected by what the PCI ID
indicates the platform is.  Conversely, anything tied to the
platform/SoC uses fields from the platform descriptors and is unaffected
by what the GMD_ID registers claim the IP blocks are.

If some new variant of LNL were to show up tomorrow that integrated Xe3
IP instead of Xe2 IP, the KMD should handle that properly, even if the
PCI ID was the same as one of our regular Xe2-based LNL's.

Before GMD_ID showed up in MTL/ARL, there used to truly be a fixed
association between "platform" and "graphics/media IP block."  In the
XeKMD those old platforms are handled by directly assigning the
appropriate IP descriptor to .pre_gmdid_graphics_ip and
.pre_gmdid_media_ip fields in the device descriptor.  For modern GMD_ID
platforms, those fields are left NULL so that the proper IPs are
selected according to GMD_ID value at runtime.

> Is it possible the opossite that same ver/rel may map
> to different PCI IDs? 

Yeah, this happens all the time.  There are about 13 different PCI IDs
associated with the BMG platform and subplatforms, and today all such
BMG devices are using either graphics version 20.01 or 20.02.  So a
single IP ver+rel can appear on lots of different PCI IDs. We shouldn't
assume that other IP versions won't show up in the future (possibly even
paired with some of the existing PCI IDs), but that's where things stand
today.

We've been pretty lucky so far that even though we're not supposed to
tie PCI ID directly to IP version, the products that have been created
so far have tended to keep using new PCI IDs in cases where new they
also start integrating a new IP version with a different GMD_ID.  That
isn't something they guarantee they'll continue doing, and I think there
have already been a few cases in early pre-production hardware where
we've had multiple devices with the same PCI but different GMD_IDs.

> This would complicate things even more, especially
> we heavily depend on some flags set for device (has_flatccs, etc). Or
> ver/rel will uniquely determine other device characteristics? If yes
> may we replace PCI ID to ver/rel as a key for device info?

I think IGT, like the KMD, needs to track two different sets of
characteristics:

  PCI ID:  Platform/Subplatform Information:
     - "IS_FOOLAKE" platform identity checks
     - is_discrete
     - has_lmem
     - has_flattcs
     - has_display
     - userspace workarounds listed against an SoC stepping (not sure if
       any such workarounds actually exist; these are rare even on the
       KMD side)
     - ...etc...

  GMD_ID:  IP Information (usually GT-specific);
     - GPU instructions supported (and field details)
     - behavior & field layout of userspace-accessible registers
     - userspace workarounds listed against a graphics/media release
       (using GMD_ID value match specific release(s) affected)

For the graphics/media IP items, we don't always need to set them as
fields in a descriptor structure if the code has access to the GMD_ID
value reported by the hardware since a lot of times the code can just do
a >= version check instead.

> 
> > 
> > For a proper solution, I think we really need to separate the concept of
> > "traits associated with a type of device" (which is the stuff we have in
> > the device info structure which can be accurately looked up by PCI ID)
> > from "IP version associated with a specific device instance" (which on
> > modern platforms can only be accurately looked up in the context of a
> > specific device handle such as a FD).
> 
> I'm not sure what you've written is equal to my previous comment? I mean
> ver/rel is a device characteristic key?

I was trying to distinguish type of device (e.g., "BMG") from a specific
instance of that device type (i.e., the specific BMG card I'm running
these tests on right now).  Given a PCI ID, we know the type of device
since PCI ID ranges mapped to device type.  But for device-instance
information, we need to read a register on the device itself to see the
version number that it self-reports, and then make other decisions based
on that (either by comparing the version number directly, or by using a
separate GMD_ID -> table lookup).


Matt

> 
> --
> Zbigniew
> 
> > 
> > So aside from a few special cases, we want IGT to stop translating PCI
> > IDs into version numbers and instead start translating fd's into version
> > numbers.  The special case exceptions I can think of that don't really
> > have a way to do fd-based lookups are: 
> > 
> >  * tools/tests that bypass the driver entirely (possibly running without
> >    the driver loaded) and just use libpciaccess for direct BAR access.
> >    Most of these either don't have version-based conditions or only have
> >    version conditions matching against very old platforms (where a
> >    PCIID-based lookup is "safe")
> > 
> >  * the old i915-era error dump decoder tool just reads its information
> >    (including PCI ID) from a dump file on disk.  The tool might be
> >    executed on a completely different machine from where the dump was
> >    originally captured.  I don't think this tool has been updated since
> >    gen8 (everyone switched over to using the Mesa tool instead), and I
> >    don't think it would function at all on any of our modern platforms.
> >    So if this tool is still useful at all, it would only be on ancient
> >    i915 platforms where a PCIID-based lookup is "safe."
> > 
> > 
> > The solution I suggested during an earlier review of this series was:
> > 
> >  * Create separate "version from PCI ID" APIs that can be used in the
> >    few special cases listed above, and migrate those uses over.
> > 
> >  * Change the signature of intel_gen / intel_graphics_ver to take an FD
> >    rather than a PCI ID; when running on Xe this would do the lookup via
> >    the query ioctl to get an accurate value.
> > 
> >  * Update intel_gen / intel_graphics_ver:
> >      - If running on i915, fall back to the device_info lookup that
> >        we've always used.  That's safe for all i915 platforms except
> >        MTL/ARL, and we were lucky enough that they never created any
> >        production MTL/ARL platforms where a single PCI ID had different
> >        possible versions, so it winds up being safe there too.
> > 
> >     - If running on Xe, use the query ioctl to obtain the version
> >       number.  This will return the proper value for all platforms
> >       officially supported by Xe (i.e., Xe2 and later).  It will return
> >       0 on pre-MTL platforms (which aren't officially supported), but in
> >       that case IGT can fall back to the i915 approach above.
> > 
> > I did a mockup of the first two parts several months ago:
> > 
> >   https://github.com/mattrope/intel-gpu-tools/commits/forupstream/version_query/
> > 
> > Since the function interface is changing, it's a lot of churn, but most
> > of it can be auto-converted quickly via Coccinelle.
> > 
> > 
> > Matt
> > 
> > > 
> > > --
> > > Zbigniew
> > > 
> > > >  static struct xe_device *find_in_cache_unlocked(int fd)
> > > >  {
> > > >  	return igt_map_search(cache.map, &fd);
> > > > @@ -270,6 +286,24 @@ struct xe_device *xe_device_get(int fd)
> > > >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> > > >  		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
> > > >  
> > > > +	/*
> > > > +	 * Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
> > > > +	 * We should use the hardcoded value for the non-GMD_ID platforms (ip_ver_major == 0)
> > > > +	 */
> > > > +	xe_dev->ipver.devid = 0;
> > > > +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
> > > > +		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
> > > > +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> > > > +			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
> > > > +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> > > > +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> > > > +			xe_dev->ipver.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
> > > > +			xe_dev->ipver.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
> > > > +			xe_dev->ipver.devid = xe_dev->dev_id;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> > > >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> > > >  		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
> > > > @@ -304,6 +338,11 @@ struct xe_device *xe_device_get(int fd)
> > > >  	prev = find_in_cache_unlocked(fd);
> > > >  	if (!prev) {
> > > >  		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> > > > +		if (xe_dev->ipver.devid) {
> > > > +			pthread_mutex_lock(&xe_ipver.mutex);
> > > > +			igt_map_insert(xe_ipver.map, &xe_dev->ipver.devid, &xe_dev->ipver);
> > > > +			pthread_mutex_unlock(&xe_ipver.mutex);
> > > > +		}
> > > >  	} else {
> > > >  		xe_device_free(xe_dev);
> > > >  		xe_dev = prev;
> > > > @@ -315,7 +354,15 @@ struct xe_device *xe_device_get(int fd)
> > > >  
> > > >  static void delete_in_cache(struct igt_map_entry *entry)
> > > >  {
> > > > -	xe_device_free((struct xe_device *)entry->data);
> > > > +	struct xe_device *xe_dev = (struct xe_device *)entry->data;
> > > > +
> > > > +	if (xe_dev->ipver.devid) {
> > > > +		pthread_mutex_lock(&xe_ipver.mutex);
> > > > +		igt_map_remove(xe_ipver.map, &xe_dev->ipver.devid, NULL);
> > > > +		pthread_mutex_unlock(&xe_ipver.mutex);
> > > > +	}
> > > > +
> > > > +	xe_device_free(xe_dev);
> > > >  }
> > > >  
> > > >  /**
> > > > @@ -365,13 +412,18 @@ static void xe_device_destroy_cache(void)
> > > >  	pthread_mutex_lock(&cache.cache_mutex);
> > > >  	igt_map_destroy(cache.map, delete_in_cache);
> > > >  	pthread_mutex_unlock(&cache.cache_mutex);
> > > > +	pthread_mutex_lock(&xe_ipver.mutex);
> > > > +	igt_map_destroy(xe_ipver.map, NULL);
> > > > +	pthread_mutex_unlock(&xe_ipver.mutex);
> > > >  }
> > > >  
> > > >  static void xe_device_cache_init(void)
> > > >  {
> > > >  	pthread_mutex_init(&cache.cache_mutex, NULL);
> > > > +	pthread_mutex_init(&xe_ipver.mutex, NULL);
> > > >  	xe_device_destroy_cache();
> > > >  	cache.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> > > > +	xe_ipver.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> > > >  }
> > > >  
> > > >  #define xe_dev_FN(_NAME, _FIELD, _TYPE) \
> > > > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > > > index d7a9f95f9..19690cff3 100644
> > > > --- a/lib/xe/xe_query.h
> > > > +++ b/lib/xe/xe_query.h
> > > > @@ -74,6 +74,9 @@ struct xe_device {
> > > >  
> > > >  	/** @dev_id: Device id of xe device */
> > > >  	uint16_t dev_id;
> > > > +
> > > > +	/** @ipver: Device ip version */
> > > > +	struct xe_device_ipver ipver;
> > > >  };
> > > >  
> > > >  #define xe_for_each_engine(__fd, __hwe) \
> > > > @@ -181,6 +184,7 @@ static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
> > > >  }
> > > >  
> > > >  struct xe_device *xe_device_get(int fd);
> > > > +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid);
> > > >  void xe_device_put(int fd);
> > > >  
> > > >  int xe_query_eu_count(int fd, int gt);
> > > > -- 
> > > > 2.43.0
> > > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
