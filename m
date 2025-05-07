Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2C7C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 10:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE9710E18F;
	Wed,  7 May 2025 10:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8JPLiCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D274510E390
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746613947; x=1778149947;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l6Lczj5XJvdXkCU2x/xWLUX6cdNeNECXRjyPNlSYf40=;
 b=c8JPLiCK6k7iUSk0MKupEYR35MpiSKw+W7rQAPW8lkGxna+3/jJ7CVYD
 HoySmAzrZxrOc7Qp3S8Ngp3LmBJ22F91fSUGbII546b0eN8RlNskIhR15
 +nXoHIWCNwwBc45ykynNWeJ9qz6Q08WXNTsmuxukWL2sVjJMvuLfStPyy
 M85mpgI3OLtGaVsPJKW23IBidLTpBfvw8VAlmiQv5n5lLzJOmTOnHBbvt
 qhPpq7QJfx3hmbKMvdoDG79knQf4WEEp5EBxUuDJVQ3quNJT2py1lMagq
 TqxH8AgYK+3kgRvfxdvybJbJ+bP6hp/fY2+R2Mxn5Ls03lqIeGZc98jQC A==;
X-CSE-ConnectionGUID: SShIwnZVT3CMCbHQWaA86Q==
X-CSE-MsgGUID: CVbP9MA9T/OkRSJiQG0P8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48349050"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48349050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:32:27 -0700
X-CSE-ConnectionGUID: hMAP67iLRKOu5vHngtt39g==
X-CSE-MsgGUID: jvHR5HnTSq6KlfPA2/rqEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="140868240"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:32:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 03:32:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 03:32:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 03:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6z5KsZdHpj0hfhNbwY0DyBvssQuWnQSGKQ1/U02YMvXWvbeVU+qmPwj6vLYPfieCoDABjTxDNRBD8Feb8QJUIOWdOCeJpuTi7lhkRJ8NSurhQJ9IdprfXunDjZL3Gf/7UgAWmQ+E9gNLq2G3TbNG6wQV/GWK9+IiOsRaLtmub6DEv25mBa4Czye2OhukjTfEpNM7KDEq21UgFQ3vkBMIqpa45ykVnlhnPFFc/Z6kP5hwpHKvo+UnXvbGuNtBEKbVvkFaR+zcYRCXGhJQJyH7YiFPuLXJ8QJ6Hx7uDUtid0YWBFlc5yXVBgwYidwsqcR38GdPTkR3BVk2wJ27TC3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn5dNPhqkMshn8i/UwhbrL4L4BfFuPMgrmM3ZrkjXtc=;
 b=erYrRLDRvH+xhecomE0hYJ7umrS0/iVjea1SH4AjHraDskGM5z3SSC0tk3ApIEZ81dCPOF3fVqoZtUKulHsNUQT3agYYOBFrn58i6tAo/TtDCHuwd8acGxJPOi6jsZ8KWGRJJsv+cdr5OCNjikhcRstr0knXS2XWk6Zl/NYfJXVjFNI5mAxpKL3RPHnMip28niZ5y3urtwkPE1aJgT9wjU6eBRFcuog2Vb7/sJCM9IJnSYCPUFk50s44djyBCpYqjlX8WqJHeX/dCYmU2nCV4KFxuZxcWBkacFjjt4MLBn/3x2ncosTEjLomUMqG9uTjLsock/ynCbYXB8zxqhd9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7274.namprd11.prod.outlook.com (2603:10b6:610:140::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 10:32:16 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 10:32:15 +0000
Message-ID: <f0305a56-12f5-497a-bfb9-95b00b009c23@intel.com>
Date: Wed, 7 May 2025 16:02:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_tiled_display: Skip if connectors are
 not of same type
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20250505034941.930385-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250505034941.930385-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc6214e-bf5e-40be-9e2d-08dd8d526f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjZxTUN1Q2szc285VGNZWEJXblFKRDc0RVh4a3pTMjBoVlhVcUs0ZUJYU2d6?=
 =?utf-8?B?TUVQdVpJOGtOMFNtRm12VXBrY2xTWXlBcHlwNEVqNDVXQWVRS3dTTmY4M1ZO?=
 =?utf-8?B?bWRoOUNVOW9uemJrMWhvdnRFaWVUN3RUaWtQRzcreW5KelFIMGNOd3ZSa3Jj?=
 =?utf-8?B?N2RkSVIrOXR6UWFmRjNhYzhrejVlRFRFVEJiVzVSdDEzUyt2dnZnenAwUGox?=
 =?utf-8?B?ZDhNaHlSRnoyMEpHV1lEZ1RiQ0tCOFZzcm5NM3RNT0tMNzJlbkZGOEVmT1RN?=
 =?utf-8?B?VzNKSW4yR0NtUlZCQTM4VVR3OE1aSlFFRnJwT1F1VDR4aXg1WkVOMVBUaHVo?=
 =?utf-8?B?TzNicVd4T3BjR1ZvclZNU1gxdmo3R0dQcm1zVlk1bDE3RFpRdWtUeUFVcGNE?=
 =?utf-8?B?clpabExFKzBVbGZFOW5IUElyQ1VCS1NhOXRFRmFEVHJDMHRqQVUwOTVXbzNs?=
 =?utf-8?B?c3pjSmxXbzhaT2M5UU9BOFpBYmp4MXNaSm1rZThQYTRXbUJXaUJsZnZDK1VQ?=
 =?utf-8?B?bi9jcGRJVVh3ZWNKd1BWdzllWFBXTTQyUVhsbnIwWFpwK0ZyMFZkZWNqcmNN?=
 =?utf-8?B?VDF6Nm9mdDZVelRCLzRPQ3JhUWxzMDdsTk9mYXRaK1cyY1F5QmRTa3kwL2tV?=
 =?utf-8?B?OUlPajViWHV5VlBPR1VybFppVFFCbkZCbk02enhHZ3BDeFhieXBwa1RpR2tU?=
 =?utf-8?B?WVUrTHRvQUlUNDhPMno5TDZqcHVSZmdKcTA3R1dBeTQrOVZ1Wlg0amg3eWhM?=
 =?utf-8?B?TURpdkI3ZDczY0U3RENjaFJBWndJc0MvNGVFdm9iekxCWHhZWlRWMUNMT0lY?=
 =?utf-8?B?aXRqZzdmRmtXN2ZwTjhhY09yanF2a28wVERYdmVxcGowOWlkMGFlWTBNeVlm?=
 =?utf-8?B?b0FoR0VUT1R2TnFvMzdwcjgvMUdZUkJvRlVMQUNaeWpQUHFWYmdIVkhoeTBV?=
 =?utf-8?B?WSt6bGZHYUhJWm00d1hlcHM0VjE4SGx1MnRjeVpBR3Znb1VxazBpVnFtcVpR?=
 =?utf-8?B?aU5aZzV2MEYzYTlKRmI3amdaUXpFV0xyWHA3TFRCNm1DT2FqZ1hIQzJwaVdh?=
 =?utf-8?B?TWZJY1V6M0MrWXJ6S3BKL2dNWXkxYkkzbU56enNOczBkeDROaDdjZVcwQXl4?=
 =?utf-8?B?bzgxS2ZMbm9UdGxpUTIrOUhiK2tVeEQ5R2hDTSs1TDhTa1dka29pOE5RcDBB?=
 =?utf-8?B?MG1kNDRmZGIwVXpzejlNYzNtMGk1ZytoaHQyZ01Ybm00RFNsK0NlQS9FSkhn?=
 =?utf-8?B?VzkybElaaUNUSEx3WjJ5WkQrTk1qR1g3Z3lCL0cyMllJWkVSbWNPWlZCU2Iv?=
 =?utf-8?B?NWVoeWwrdzZuTVdMUVpOemREejFxdzVmalJKSCtNalh3QkxrS1hsT0pPdFll?=
 =?utf-8?B?ZFN5QnpZaHh5QjI5YnQ1Sjg5R0FGeXhKbnQxT04rQnFBZkEyY0dkZjFFbVVL?=
 =?utf-8?B?L0FiSjRMSzhjZjg3c3JhbkRybEZpV1RGNVpEQVF5YjVZcGo1NU91SmorbjBi?=
 =?utf-8?B?VStza0VTTkdadWpNbTZBUUF5b1BvZmhXeDVGM3c0NXhvd0laeDdIT2FTanpr?=
 =?utf-8?B?aERlbGg5Wjl4cy9SVHRqNVI0RktEd0FSVGNzWGplUzdlTVIwczBXUFFjK3Ni?=
 =?utf-8?B?UXBOdU9JcE11NXdNTFJNYmZyc0JYYkgvckIwS201QkJuY2lFWER2d05rWHIx?=
 =?utf-8?B?SDVKcWpnQ3o2bjc1SmtvNDNhdGU5QUxxR095MTg3Q2xNSmtmenBFSExDeTFD?=
 =?utf-8?B?ZzlrLzBFcnhhK3FlQks1dFNvb3hpSmxQZGt5RU1IcFZ3ZnRDbHlUeW4rUG9H?=
 =?utf-8?B?TGEzMTRkUHZMa0hGQWMrSjd1RjRKM1NJL2ZZNDlmY2lnVVhlWVc2bi9RMW9n?=
 =?utf-8?B?MEorYThtd3c0WlZnNU1rUUxGRitCbGNUVWVkUS8xK3c1djBuMzdteWp3eWNW?=
 =?utf-8?Q?tZNk84RwoHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElZcGFVOHBlSEI3UzdaOFVQUTVvbmJNd0crU25ZL2p4TE9wODFvdGdMbWpz?=
 =?utf-8?B?R1pvd3haazFobXdraTUvVk9LcDVKTTVYSWdjNHpSeXBvYkg3WG8vODc2bmJn?=
 =?utf-8?B?M1h6b0daU1UzOEY3Z0tDSVFLMXhvN0ZFeEliZk9EY0wzVndGRUFoQ3VYM0x2?=
 =?utf-8?B?NGcrK0NPdUR3bFpEK0Rkc3pjU1kyZXNkZWpNamJwdEV5dDJuSFBnQ1ozdi9R?=
 =?utf-8?B?eXhsY2JqR1pwb2hLNStvYTFlZURvQlkwRTk2VFMzZzlMVGdpN2ZMMm94T2JX?=
 =?utf-8?B?STJPR1lYMkluSE1ycTJ4c0IrV1F1M1kxRGt3ZzBGNjljeC9oOTM2eDBreHdR?=
 =?utf-8?B?Q08zVEo1blpRbXdKcGxEbElrYTg4eWRwa1VDRDBTK3FDSEc0SEtnaFl0ejVD?=
 =?utf-8?B?TmVQS0c2Q0pMaWk5YUJUNnRSN2Q1MDB6dVhlMFRZQkI3ajhSSm5NMk5paFZS?=
 =?utf-8?B?dnZtNDRtR2pFSm5qUWt6VzFxNkJBS2xRSDkyMjlJWis1cTRuRTlmcjBSeVdx?=
 =?utf-8?B?blQ5SlZld0JRU3l3L3Q4N1NONG1JQlZXVndEdnNjUkpRMTd4NFRiVnN2c1pv?=
 =?utf-8?B?S2pnSTB0OGdBUUhWdEtOVG84VXJXQ2NZME40TUNIU0tHV055UGdMcG9sWkdr?=
 =?utf-8?B?L3pzZnpJOXBQMkxxcHFXdnpQUS9sd1RLVFRERi9sZDdsbXRpMGFGbmlaeHgv?=
 =?utf-8?B?M1prR1FaYVVac2t2c3g5WEtvN0tZc3Y0eEtmczA2YkF5anZRTXdrMDNFbWVT?=
 =?utf-8?B?dTR6UlJleExLTUNVUGR2S2Uxbmcxcmdpc0prN3RqNGhrQkJLV040bTFSVXBa?=
 =?utf-8?B?cHJBVlA4VW1maEVTa29sZGpKMlRZK2Jkb1pPWGg3biszV2tnTzBaVUpNV2Mr?=
 =?utf-8?B?NnZqZzJXWVZtRDQ5bEVzeit2TWhvMFBqZ0UzYkdrbzNmK1o2NmpCVmZtT3Zt?=
 =?utf-8?B?eG00WURWaWwzNUhwdTk0dkpMckNCTkk0ZmYzVUJudmVyOWh3YzRzazJVdHNB?=
 =?utf-8?B?dWo5Ly9sTXJTWXBjQ0tpeFptYU5aeG9PZS94dDdVcStwSjlxNGdHQTg4alhR?=
 =?utf-8?B?Q1Z1WGhIMldwNExxeCs3MmgzVk1sVWNjVGxNMStWMVgzZXk5VDZod0lKUnh2?=
 =?utf-8?B?azVuU0drV3dxeVVRQW8rbCtYWjdWRVQ0ZTVObzlrVVYvdlVtQ2JGSkphS1NK?=
 =?utf-8?B?SGhtQWp5OE1VOWFhQ3hPSlpQNzNQaFd6cnAyellTRzFuWjZjczA4SjMwL2dH?=
 =?utf-8?B?bTZzODNEd1NoTUdHYytNRi9wRXN6WGF3dmNGd1BHY1E3eEUzblY0ZFdaS09X?=
 =?utf-8?B?QUZNbGZDaEJNVW1uNUVyTFZPV3d2WEFmRFNoNWdyK2ZESFBoNGJnMlU4NzNl?=
 =?utf-8?B?a25sZGhndDVPQUxaZEg2QzFqVndnTXZicUF5S2psWU1zeG1vdjlqanNKNGdW?=
 =?utf-8?B?TitUVUxHVnRlZDduTS9QQnZhanYzYjBEWVJ4aVhOYlBITmRBNU9hU2RoL3BB?=
 =?utf-8?B?RTBvNEs2aW5RVk1jQ2t0azkvbnJ4MUdCelZWc2w0V3RCUVdIT0VQWjRlQi85?=
 =?utf-8?B?WjZiWU5xTWcyMUdKL0tSR1RZYkRyYUxGcDY2Uzd3d2hrTWJrSmoyZ0doam1s?=
 =?utf-8?B?U1g3dDJVOUVDTjc1dllBSDJpeE8rT2dSaDRWbnFFdWJxMXhBd3hBWXpxSWZR?=
 =?utf-8?B?MHNDRm5wcjFrR29TbjZZYUt0NHh0cGpiT2VlMGN1QzU2bXpzN29nckN0KzMz?=
 =?utf-8?B?ZnlXTnhUQkF1SGdjTStGek1aTEZRc3NTOHNUS0pPblhPVk9iMjJ3ZS9FTEtE?=
 =?utf-8?B?L21CVitGQ3RiT0U1YUlTLzY4REZ4WEtRT0puNVFOTCtUTUo5WTFNSGhuOFRs?=
 =?utf-8?B?emIyYnk4YkltTjlDME0yaTBGMnE2a280Zm00b2ZQdTlpbXpDVlRSNkwxUW1K?=
 =?utf-8?B?ditwNCtreW1JdEIwNzNGSXNDalJrUE96UE8yNTl5SHFVV0FqRTNvZ01TMDg2?=
 =?utf-8?B?a0hYd1k2aEZnOWxYWEpEUVAwdWduZkEzSFNqU1ZvZjZWN2s5N1pJZ1VTajlx?=
 =?utf-8?B?UG1rNjU3amM4K1FtSk91NGw2WHhpRXF5SjZ0SVcxZHJkN3M1eHVLcis4SGdO?=
 =?utf-8?B?eFlENDg4QUwyd25ZcTNBYTE4MlEydXFzaXhYWWsxTzNCNlZhdHhnWkFuQkN3?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc6214e-bf5e-40be-9e2d-08dd8d526f95
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:32:15.8857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gconAuAeezOj9okkfPD3vtbnW2DCpUzbPA7SHbMbQbCjJ8jnZtgVGalxEBinXCu11nBTrFKmhQB0/s3yFM0WjEzghN9dQjPF0FqPgBBOtog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7274
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


On 5/5/2025 9:19 AM, Pranay Samala wrote:
> Tiled display setups require all involved connectors to be of the same type
> (e.g., all eDP or all HDMI).

Currently Port Sync is supported only on DP for i915/xe.


> This patch adds a check to skip the test when
> connector types differ, preventing invalid configurations and reducing
> confusing test failures.
>
> v2: Replace igt_assert with igt_skip_on_f to skip the test.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_tiled_display.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 1f5331408..6d461c976 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -149,6 +149,7 @@ static void get_connectors(data_t *data)
>   	int count = 0;
>   	igt_output_t *output;
>   	data_connector_t *conns = data->conns;
> +	int connector_type = -1;

drmModeConnector has connector_type as uint32_t.

So better to use that and set it to : DRM_MODE_CONNECTOR_Unknown

>   
>   	for_each_connected_output(&data->display, output) {
>   		conns[count].connector = drmModeGetConnector(data->display.drm_fd,
> @@ -169,6 +170,14 @@ static void get_connectors(data_t *data)
>   			igt_assert(conns[count].tile.tile_group_id ==
>   				   conns[count-1].tile.tile_group_id);
>   
> +		if (connector_type == -1) {
> +			connector_type = conns[count].connector->connector_type;
> +		} else {
> +			igt_skip_on_f(connector_type != conns[count].connector->connector_type,
> +				      "Connector type mismatch: Expected %d, but got %d\n",
> +				      connector_type, conns[count].connector->connector_type);
> +		}
> +
>   		count++;
>   	}
>   	igt_require_f(count == data->num_h_tiles,

Perhaps need to check that connector_type != DRM_MODE_CONNECTOR_Unknown.

Regards,

Ankit

