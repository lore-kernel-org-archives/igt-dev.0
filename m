Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F58CCCD18E
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 19:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165F510E68A;
	Tue, 14 Oct 2025 19:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqvvY9Ew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDD910E68A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760470157; x=1792006157;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4wXnbwP+2iz1WolLBKiSF2Erfo61U85KelNGbhsfoZY=;
 b=aqvvY9Ewb526hMV0gnYAJ4EUHvV586WP3RFmJ/osZfwZz2Jrw8xw1joQ
 oqc7Os8t6BX6cNCS0xPJ+xlILzuNfDHG1vzwQU+JCC3FNCCtCAjLfE4wp
 vPbZEtwTM4G0EejQdx1AhGEpkzsChPB2PlNeeDCVBin4yl+InCP8keo2r
 q5bpt0R/baQWLSrd/avX7oGtreTd4gOvsuyST1ZeI/ruGJAsKq0zVe9Mp
 yrq9A8IfOtdQ8z1RBEYgvJ6bC2EjtZAYcip+79sGQA/4ldNGAQ0U9uiYl
 L9P6kQ8MOY2baTMFQ+ILYVovay645na2A9w8WnI73SOCp6dSkpbQqHHFE Q==;
X-CSE-ConnectionGUID: B8Sx9GLLTRqqrqiCYNhRMw==
X-CSE-MsgGUID: NPZHbBGcSEWIe4HUqXbyvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62529658"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62529658"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:29:17 -0700
X-CSE-ConnectionGUID: MzuFk9YHS1OuLIpyryPe1w==
X-CSE-MsgGUID: UuoIiIdiSBOC4VNDwloXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181183794"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:29:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:29:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 12:29:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRJGu7rW7Yp/Cw/GemG+UtiZj17uEFOYO5DzfoiEL/YzUTEvrrel+4E8rjUdm6JQ3AwDnWJgSmBSq5Hl3dSH/+dZ4AhuMsXricpYhrsWnrrBiLHZMszAjf+vJI05+QGtOadhEMnkkZUjjRQ9LndoPEsMO52lomDz2lVudtm2K4EgQwn5B3oMoBAP7Pv3p0cjBSAHMZ0Bf8IOgnLznXcC38DI6rTE0a7+AW714PPN5ClNjEhMN8pGo/gmQeptltcYaAIkMTXX10QdcHDATXwsH57z7zN/60+vmBmxnpnAUn+6A73lfUNWrytcSnkV9TCleRkvdOM8Ec2HbTWxpz9VFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO2owmL9o0iqYkx9mdnCjG5piGY6vH+F56qFTLr+LQ4=;
 b=Id+tvS75QDC5sR0WY+O4TWWAWCG0+ZEyohMuMHLuABI+KFiLmajQK7mWAwEOReUqK1dDw5A/J8aoFY0VZYASGE50bQhqlQiqFaljjUISg/24++4F5HuwjR3RMIDrgw7mPlTf3S9fvsIrodeG0M9SiB7tTNLois7GftJpGZixlhkIevP3niGI8uV3/wEg9HYBvmTU7RyICuP3UH1q8ny2XzO3uG6w5q2iMivS4p11IoeLufLWa3g7oXzmsiSzWYgN0QlEZhdy5IYMx646zxSeBk4Dgv8By6uzkejPXC4kuU5liHOt5Qby3I5aaxvGLKxE9RaDpGodHSjsUoZHV4/fZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 19:29:12 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 19:29:12 +0000
Message-ID: <0f509eed-1b04-408e-b2cb-79d42488ab2a@intel.com>
Date: Wed, 15 Oct 2025 00:59:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jeevan B
 <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>,
 <pranay.samala@intel.com>
References: <20251009062932.1559735-1-jeevan.b@intel.com>
 <20251009162515.vn34jbz75ftg76wx@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251009162515.vn34jbz75ftg76wx@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 061dc060-0dc6-446c-e4f0-08de0b57f409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmZrbGxGTGVwdnBjYkhCV1h4SmZNLzBXWUowV1ZyUVlHdE5Wc094bUNZSnV1?=
 =?utf-8?B?MUNyR0o0ek1kdVlaREg5anVGYzZFMmxidHFBeWVScGs3eXFORmFzRWJwK25m?=
 =?utf-8?B?TDNPbVdRRlBtOWxpVXZScmZDYThlTm11azdiOVh1aVdvTTNnY3lYbE8zSnMy?=
 =?utf-8?B?emhTQkorS0xRTjh4UHk4ZC96dUVtRS9kRUdXYjFJOFFoSzg3TGhrSDNOQUY4?=
 =?utf-8?B?THl1RCtLUnNmKzZKZURjSjNJY0dUQXZFakdWQWJKYlZSNzZvQ3BOYysrZXZn?=
 =?utf-8?B?SlBCK2syN2VHVmFIdSsrNVM3VFFVVTREUXIxdXBvclFuRHY4VDM3SCtiZ09D?=
 =?utf-8?B?QVkvK00wdlBQR3NzbXNDTFNzUm4wbzBmNjF0bG16akVxeTF0aWtrSDNDTlM4?=
 =?utf-8?B?TjI3eFB6SkNucm9pcU1zVHJHYXRQUDdvbzBMODZMMFpyVUVpRlFYdXUxbUpa?=
 =?utf-8?B?UU5XMW5BNzhJckRjSHVnTlROck9wanRMMVd5ZWkvbkNEcXI1dE5DbjViWnFF?=
 =?utf-8?B?bUJYREEyRXV5K1VWTy8wWkdRWWFHNHR5TGhiUWt4QXdrd0h2a3FFOGc3aUpt?=
 =?utf-8?B?Yjc5YVZHOTdZU0FiME81Y0o1NHQ4cjBDU3VtSXo5N240akFscXd2NksrREN4?=
 =?utf-8?B?NGhlbGZZZGMvaG1vY3JDWUxVQ0JoclVrQ1EwK2txL0lFK2IvNTZpa2RCWXpj?=
 =?utf-8?B?K1JHelg3R1BYVW9mdEFyeWpWc2FsWmxpZ1NRYmxRWnhackI0aEladlVjVUhU?=
 =?utf-8?B?Ykgra1ErMC8vMlBjdTVPbHlLK0JOVW5hOG8zaXVSU2Q4UzR1MjhDVDlKWHhJ?=
 =?utf-8?B?a2tZT2lpOXZtNUxjU3V0Si85SzRIZGlBU1M1Zm85ajNnYW9JaTNyejRjTTdI?=
 =?utf-8?B?R3VlSGd4YS9iR1VoQlFaMDNCYWFNaVNMZjNLc3ptTlVCUXl5VnVqVFdSWEZD?=
 =?utf-8?B?MjBzUjNwZUFBV2VWSFhXcFY3TkRpMTBaN0JkMWhRMmEzbE5ncjB1MnkyTGpD?=
 =?utf-8?B?ZjZIdW1ZY21Fd25wS29VdXNJRGZxd1RHNVJWYjF3TmxHSCtzaEYyMHdRQitR?=
 =?utf-8?B?c1dUdk0wSTJhTGZmbDhXMWdOQWlXNlFxM1Jwd2NUVUZCYkRIalJRSEI3MWlH?=
 =?utf-8?B?N3ZwYW1iZWhNM2Rra0pyZEE4SWxQVTR2d1FQOEYrS2NUZ3N0a1lnbkNLZVFF?=
 =?utf-8?B?aVJSaThtNURIK296K2d1M1VpNjBYc0x3Vk5NWDJwMmZCb0FLdjFkRjZ5d0dK?=
 =?utf-8?B?UHkrbUZqQXpGSFhCRHBYS0Y5ZFBBenBuR3NkT1dRbW9sYlg0QTQ1ZUkyb2Vy?=
 =?utf-8?B?N2dSRGsyS2dLVWhZRFJIOWt3dUx5ZUxOcTdEVnNHaExoa25GK0h3UEtEcnA4?=
 =?utf-8?B?enJVWVFsOStOUjdjOXBIQkFVOFZnemY4S2VZRXVDOEh1aGQ0bytMaE5UUzFE?=
 =?utf-8?B?dURaZHU4ZE4wQ3VNOGZJRmxycHNGS3dmNXhkRGxseG5xRnBsT2pRTGl3VTRB?=
 =?utf-8?B?a1lQdXdhdlJjdnR3cTZxQ1YxRkM1dU5NOU9mRW43czlIeWVGVmtVNWU2QUlZ?=
 =?utf-8?B?NXoxTk9OMHlQWHlDQjhydHVqVDVNZEc2VmhxamZJN292eFlrcThBRm5saXpQ?=
 =?utf-8?B?cXJKV0hoelNSdWRhWkZWbU9OL2xBY1QrK0VJcE1BdGtYWTVCM2VQTXpSc2g0?=
 =?utf-8?B?VzVBNW84K3YzQm1EcUJZTmlPVE1OWUY0N0Z1SHUyTnN3QnM5VnV5TWtuVlJM?=
 =?utf-8?B?bXBzOW0wamQ3MXdjNzFTNVIwYXdmcFQ4dVV5NEp5c2tSd2JPMFZOZlg1T2Z6?=
 =?utf-8?B?R0ppOW95UjR2QnlGWXdMYmN2S3RlTjNjOTE2bm1QRThFdGZCS1RHQ0Vtc2Js?=
 =?utf-8?B?NzlXWnEwSjJBa0RaYU1kZkRqM2FlSWRYc29Bb1MyYlRMNUV1RUxETjd6aTYr?=
 =?utf-8?Q?sxZDxprm7ekOvwvquWE7Mmck/76Vv/KZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3NmRjlHMGMwRURUbnVmNDJoMk9lb2tUREFhajlvMEpnT3JWMnJ2RG9tUk1p?=
 =?utf-8?B?UmduZmRZVzlVQ0tJK2k5WWNuVE5tb2FyemN4aUJHeWlnbExCMkorVldVelFB?=
 =?utf-8?B?SzlpZ1hFNTBmczRuL3pjbDM2bmIzQUtHalJJVlFDTEN6cUxtQ3k1VTBlOVFW?=
 =?utf-8?B?TFptVzNicTZoV0dLNlloRDdhWFhCUUZRTjlSMTREU2xZREFvU2dGRGNFQzE4?=
 =?utf-8?B?VTN4eDhDMXlvd3V5TkFUbWJVbVFBVGhSN2o0cFlvdUJnRDE0L3pLYXFkU3Y1?=
 =?utf-8?B?bkF3OFA4T29PVExPMEtpSVhRM3Yxb1NaWVl3a2N6cjVzN3Z0cDZBMDZMM3BM?=
 =?utf-8?B?enV5VC9QeGtvMTJGOFlYRk5VbXZoeUlhYmV2N2tsMS9MWG5tUVlPSXFRaWxB?=
 =?utf-8?B?bm1LeEptL1N0cllpVFZ2MHZia0VYK25aSDUxZVFBQlQyWkx2b1cxVW5Tbzdv?=
 =?utf-8?B?YWJkbmVZWWVveVB1QStTaTZPSjFiNXpqK2lLRFcreXdSckR5NWw1KzRzKzBU?=
 =?utf-8?B?ZFlrZGRYZVIzdEF0czJTblp3RGZ6bUJmWDhwUUpXcnczeEVWOTV1aTR6SDRR?=
 =?utf-8?B?Rkl6NzMvUU1KYzYrTzhuenJjbFZjWUxuVXZZa0hGMmpCc0pBNDRuMHZDWHhM?=
 =?utf-8?B?VDM1YnJPZHdGcndIMEJjSHEvSkUwZEVkNS9US0o1cUJLbTRaQUNnSmpLQVp4?=
 =?utf-8?B?dzlnTU84aG9ZZDZHSk5RM2JWdkxvdUgweWxQMmRUeTNhRDdCWjJDVFFWcEsw?=
 =?utf-8?B?Rk4xeEpBZlpPdWhmNXhrN1ViOTEvTE5uN08vdDVyd0RJTnppd2MrY2dsNy9T?=
 =?utf-8?B?WENpTDYzMXhmT01uZXpWK1NieExqTWJYV3hqVFRZNldCaWVaSWN2Wk5CMzgw?=
 =?utf-8?B?czNrTlEwTFZ1S1poSzhyc05DY2Q5NzdxT0dScU9FOHZ4Y3Q3L3FqMm1rU1lU?=
 =?utf-8?B?WVlQNE5FKzBjcWtJWE0xWHNWeW9uM1ZpV2ZtZTAya3lLa2lBVHBjS1RrL0JD?=
 =?utf-8?B?MUNkZGM5U0kwSVRxa09vY3NBSy9VOERTUnV4UmpxWWJ1dHNHRStKWWczVE9U?=
 =?utf-8?B?RWwxM2dEWDk4ODhmSXJkMkN4ZHNXYnR5MkVnU29ZdDJ1cGJNSUU3U3I0WmNx?=
 =?utf-8?B?VHd1ZUlYT3VXMEc3WDlwNExSZTBhRWwwTXpvdWlHOEtrWWNrQjBhNUx1Ylg3?=
 =?utf-8?B?bGhIc1VHYjhlOG5iaU1Dc2JjcE9WdFhYMTV0UDZ4eGFFYzBBVURMbitidFcz?=
 =?utf-8?B?bFN3Y2MvY0h4ZUpZR0NDeEpLTWF1b24zM3FaQXZpbzhBKzNPZllEU1IzK1NW?=
 =?utf-8?B?QWNablJXTFFrdG50WTk0R0F2dGtxUCtiQjU4Z0JKaDB1elhEZUxjTno3S21L?=
 =?utf-8?B?aDRJcmNycWxSbWY5ZTRua2JtUmhMNmxxR3hIZC90T0RweUdOdVNlWUFnNEFr?=
 =?utf-8?B?cXJacjk4WmsrYmxGbVBYRGtpTGNoUFlkeUdTUjMrZC9iTDhkWE0yQnBVQUQw?=
 =?utf-8?B?aDdHeTh4K3l2QXJ4N3lKc25GemFrektLQXlaNGt1RTNUOG9JbGJoMU5peXdP?=
 =?utf-8?B?U09pbEdGNEY5ZU96THUwZlp3VzM5NFBzMHpUc3AyRGxLZWRvMGJacFVCZmND?=
 =?utf-8?B?eVJMeE5Ga2ZaMGEyR3lsVmtOeUg1SjJuK0RUNkRST1dUMWJ5dGlxekJrNGh3?=
 =?utf-8?B?N2lzZys1M3JDL3VSbHQrbnVkMFpxQlUySUZSSGhBN1FpV092WjM2c1NxaVJk?=
 =?utf-8?B?eklOQVNBMk9ONWZQeklYQWljMS8yNnVWUUZPRTNjS0R1QXh3Z1hRQ3FvY0to?=
 =?utf-8?B?S1BGWktjWUw3U1lLOFJnWUpXd3h2M01zQ0JlekoydUtab3dSbnFMelNVeDNs?=
 =?utf-8?B?S3k0Qnlyc3IrdUNLd3F3WFEvNDlzaERVV3puZ3ZLM1Y5SGdGMmRUOHlLcHZy?=
 =?utf-8?B?VkdsQlE0aVlQbGxjT2FYM0FPZzJRcGp0dWdtQVJtM1BLZFBjNjJWOGZmNmVo?=
 =?utf-8?B?OEw2Z3BjUExKYjcvRHd0N0orcERjdVFwb2FndjB5U0hROEhhYmlleFZjVEh6?=
 =?utf-8?B?cGlDbVNxY01iazl4V0tYcGFCYUZlc1IvYUU5cnV5WVUwV2lFZytFRnNQc1FW?=
 =?utf-8?B?UWlUUFdES2pMNmR3VHdSOVRXWlhJelUvanpqSU4vQU84Ukczdm9OTDZ6Ujla?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 061dc060-0dc6-446c-e4f0-08de0b57f409
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 19:29:12.0420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oefDu/+RyB8ID1rnqMIwqYkzqDNGPNry96VFStek6Kk3K0QRd/yMoS0CYDSqAIfiiiCMmbCr1u58ehlMVq7dSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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

Hi Jeevan

On 09-10-2025 09:55 pm, Kamil Konieczny wrote:
> Hi Jeevan,
> On 2025-10-09 at 11:59:32 +0530, Jeevan B wrote:
>
> small nit, add tests/ prefix to subject:
>
> [PATCH i-g-t] tests/kms_flip_tiling: reduce exec time for sim env
>
> Rest looks good but I will leave r-b for KMS devs.
>
> Regards,
> Kamil
With this fixed,

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
>> For simulation environment, we can reduce execution time
>> by running test only with basic tiling combinations.
>>
>> v2: Add helper to check basic tiling support.
>> v3: Rename helper to is_basic_tiling_modifier() and add comment.
>>
>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>   tests/intel/kms_flip_tiling.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
>> index ff9ad1229..d078653e9 100644
>> --- a/tests/intel/kms_flip_tiling.c
>> +++ b/tests/intel/kms_flip_tiling.c
>> @@ -84,6 +84,16 @@ static int try_commit(igt_display_t *display)
>>   				       COMMIT_ATOMIC : COMMIT_LEGACY);
>>   }
>>   
>> +/* This helper is used to restrict tests to commonly supported tiling modes
>> + * across platforms for simulation.
>> + */
>> +static bool is_basic_tiling_modifier(uint64_t mod)
>> +{
>> +	return mod == DRM_FORMAT_MOD_LINEAR ||
>> +	       mod == I915_FORMAT_MOD_4_TILED ||
>> +	       mod == I915_FORMAT_MOD_X_TILED;
>> +}
>> +
>>   static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
>>   {
>>   	uint64_t timeout_ns;
>> @@ -216,6 +226,7 @@ igt_main
>>   	igt_describe("Check pageflip between modifiers");
>>   	igt_subtest_with_dynamic("flip-change-tiling") {
>>   		enum pipe pipe;
>> +		bool run_in_simulation = igt_run_in_simulation();
>>   
>>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>>   			igt_plane_t *plane;
>> @@ -242,6 +253,11 @@ igt_main
>>   					if (plane->formats[j] != data.testformat)
>>   						continue;
>>   
>> +					if (run_in_simulation &&
>> +					    (!is_basic_tiling_modifier(plane->modifiers[i]) ||
>> +					     !is_basic_tiling_modifier(plane->modifiers[j])))
>> +						continue;
>> +
>>   					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
>>   						      kmstest_pipe_name(pipe),
>>   						      igt_output_name(output),
>> -- 
>> 2.43.0
>>

