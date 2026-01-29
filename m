Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F9D358D1
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 08:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AE210E33C;
	Thu, 29 Jan 2026 08:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+aCrDep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0824A10E33C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674805; x=1801210805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hFsGuQdv21gh1RVEz3uOs4KQKKomoh4MGiZspYcQH8k=;
 b=N+aCrDepU/0FRDTRvh8rhmWkzUj/1vAZzvP321mAIZiXFM/vKFOyUfbv
 Zj8GYwFypH5SeQg2woPo2L4qNI6UWS8ukMLwpU4jUq4qHwRq3PYQH9s3U
 sYAn/CU2AyqJ8wVoGRYdJevaFe6tcT2FIibk5TgRkW6WN58nHiJBT+cs7
 y9A40pp6H+dg8zqNXnc6Ejxmp6hdnl9ZyNJm8sxt5ISeOTf+Yqo6aFZLS
 SknmeFfHghns4p3FSmeyn6wxPBChzYVfsgJaiItmrFSiZJ8Fwfio3zEFC
 Jk3MFiLYsq7fyUUM67vvkmwZ4QY8DZw6CSP1bARuRugu5/bc9Cx0Gq5mi w==;
X-CSE-ConnectionGUID: +9muutM4Rt292xE0TE+PeA==
X-CSE-MsgGUID: f9EzK9uSSziK6GFvrqQNtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82272483"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="82272483"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:20:03 -0800
X-CSE-ConnectionGUID: 70o5QjfoRQiYFff6GkeZUA==
X-CSE-MsgGUID: sXmF8C6jStyOeaemDTey3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208404605"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:20:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:20:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:20:01 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:20:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAPA7HoWkpLu2yVrqAckgXLPp3RdhG0SauAqLp6wOMv0Pw9C7yc3sC6eRiNX8+/RefyHc9+1luWtJcDPLS+shOQAzow079OyA3xciQ665YHNNj5/VC83PWJhPfzXOuM9i2UJxbPnqZxrxVWeBSXx9SyGFQ7E/qBVR/vlI3ZGgW0so17p16p+6ffKLq2pO+2A/5r4nMvwfRFsP7OxySx0xzV6OxBoikySEbWg2r4l0nMCQEOeZ/osYGjFHVGmGho9PLTtGIx71dfjFLDYp48MsiUFmUAT0DQe7PqKDZJzhnJ2viM1h4+PDEsOUVMKMU6DZcyi3EO81cB72TLw4iw74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ACMElZQNZ46fWkRl3qOxK7eC0VaBXwrkOVb5eiMQtg=;
 b=VfjEDzYlHBrTU69Kk8KPpbWl66NMCxJKPj/Rogd/3rdgVSxjYhvTC2qmVg6C9LcmaUwfkegNP8MFO4qX49KLL/rye/iAqdP5hDcIGvsGqJG1NFp/jcWUSYiq3Ftmze2HWS02yXaHQ4iqExH0POUF8FENVEIMz3r2ySEyzy1IcwkngSN2oCCxY1DWCZLXRdngTCQV3URXfWC4hhtUN+OflqQU++1qT6nTiSB+nDhstSPUpIeK/huQlA+njyITbnq2Y6HWokWD99rllZlCJMLKzZDKCDhdn9u1VpP4DOAjfkPhOn+en+IzaOO292j29UKz5wZdVaKQYoaVklkux3jEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:19:55 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 08:19:55 +0000
Message-ID: <a3503117-4f47-43cb-96f9-c68f4775d71e@intel.com>
Date: Thu, 29 Jan 2026 09:19:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 04/10] lib/xe/xe_sriov_provisioning: Add sched
 priority mask to string helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
 <20260128180819.1373376-5-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20260128180819.1373376-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::48) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 8032211d-942d-45a4-00f3-08de5f0f2ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWx5em1PZEZJMFhpNXg5SjZiM0k0SFJ1Z3E4MFBzL0RhTXVwTWNWMzJrakpX?=
 =?utf-8?B?ak5LcGVXdVpIeEdtMXgvY2ZTTUd5UTM4QXYwYmVxL21qYjdhaHdiUFQwM3Z1?=
 =?utf-8?B?Ym9CT1VyN0hjNUNjQ2RPWTRaNUdab0NtMzlWd3VULzVaNURUM0UxSWxhaUNU?=
 =?utf-8?B?NHNTU3NTaXFkMElkUzZ2MWxzL1FaSlM0OThka1dLZENqdWNnN3ZPRFZ4WWgr?=
 =?utf-8?B?MmozYXhrYlNsalM2eFVkelAxUStMUDZudkkyd0gxSklHWW9TbXRBdW8wdis4?=
 =?utf-8?B?eGYrNmd6d1hjeHpqLzRibmk3MGQ0ek95QzgrYklQUjhMM2tNNGVMekpHaHpQ?=
 =?utf-8?B?VFhNLzRRb3VpdzVEYTBMYzJDbHdHdHJwdGZQU2x0ek1YSHFOWndrUGtRc0w1?=
 =?utf-8?B?UXJRUTZ3bThlS1d6Z2tVR1JvWC9ZSWt0RmYwNmN3SzEzNHZWWWYyZkZuUUxm?=
 =?utf-8?B?aUw5UnNSMnVwekJPL0ptWndwUlcySVZzckZvTC9Nb3JEbWhMOGR5WFZjcGI4?=
 =?utf-8?B?VEdPbHY4WUhaZUt0dVgraUlGM3JaeFZibys5c2d4dVh0TjF4M1dnVG9jWWpZ?=
 =?utf-8?B?SUQ3TFh2RE1nVWdLc3M1aXIxVEloa0krQmdVWWFLM1BJbzJLYlpCSk9kc3ZK?=
 =?utf-8?B?WWExeFhCRUhMOVRJMWkrNjFzZUdRa1NsdzVLYTFrbWxsQmFsUmk3RFEvQWdo?=
 =?utf-8?B?UGtFc1g4aktaVmZCN1NjcWtXL0pMWHdWTUNKMzIyODh2TENxZlhQMzJLTi95?=
 =?utf-8?B?a3JGYVFiWCtXWjZsRG4xUy91QndCNEVtNnVYcnpkQzh0bG1tNUhSaHpzbEZp?=
 =?utf-8?B?NkwrakhpVXoyNXdSWjN2anR0bEVyZmNwUk5YSEVmOHBjVTRRM05WTWhHMWs5?=
 =?utf-8?B?WFl0c1NVWHp4QzRDQlF3UDJra2doLzdlNzJqZFVyTzJYSnhpY1VabUlTVUhP?=
 =?utf-8?B?blBoL3gwWkZ5WEhxeTZyWFVoMDBHblptdDlCckZ5alZReGlobXdoYUhMS1Uv?=
 =?utf-8?B?YUZDMWlYalQ2MUxiV3hQb1JPSWhGZTlZeHByNzBjSG44UENDclhxMlo0V3p4?=
 =?utf-8?B?MFlVMnZoRlZDTU9WQThIbDJWa3ljR0hWSDByRWU5R1J1cDZNT3VoZ0EyQnNW?=
 =?utf-8?B?alExVmpWQVdpUXJxeHF1NDhKVlBlYVA4bEpLODA0WnM2SmtmM04zZ0d1czlT?=
 =?utf-8?B?ZUlhODlKeG00VnVINTF4V2h6eUIra2YyMkY3L3BPSmZUUkxPRWI5bEN2eE1U?=
 =?utf-8?B?NjNFNmc4RWVNS2tIK0pZS1JuYVZOSUQrejl6cG1qOTcyUGhzbGdXazhmWWVl?=
 =?utf-8?B?ekI3NXBpZE9KMEk3OG5sVHRMTXJZck9KMnVOM1dQQ01EY3QwSDZUSXNWQ2p0?=
 =?utf-8?B?b3JsemgvNTg5ZVB3OHFuRExNOE1Zc1JwSGlidHdqNEhmZnAxMFMrcVgrcTNZ?=
 =?utf-8?B?UjdycFlHejZ4c3U1Y1lpMjRiOUdFb0EyYmF1MlJMNW0xZXJCbGNTc0hhWG03?=
 =?utf-8?B?UWoyekc3WWZVdytyUmc0UzZ6N0NOeml5blg2aTk0bHpmb3Vaby9jdHFpZFR1?=
 =?utf-8?B?SU1DcVIrZ3VQaXpzUjhVdys5M0lDV1VvVzdURjRVVkxwNXRQeW1SRlRYRWlB?=
 =?utf-8?B?VjhmRmo0dVp2d2U0Z0krNXlnUEpQSklXenNzSnVNd0QyYUJMb1piUGlnd0o4?=
 =?utf-8?B?bXdDQ0tjVmNHYXdLbmIrTEhGTSt1VTIxeWtrVE5jQ2IxUG1nbERCM2F2bml0?=
 =?utf-8?B?a2RUcXd3RzBKWE1JNXNJVmp4UnlzQU5VZGMwOHZxM3BtSHBiVkg0amdsWnNS?=
 =?utf-8?B?c0wrWGh5M2J6dm0xbmM3MDZVNHZnM2VaUjdiSGJhU1B5YkhKSE10VVBhRlZ2?=
 =?utf-8?B?aTFkZ2NINW04U2V1bWNyUDFmVWxUR29PMVo3ZVBOR2JZUXlrWWtpc2VDR2RZ?=
 =?utf-8?B?Nmtlb2dmVjl2OE1iQzlmMlVGRkcrUkwxcmU1OXpqbG5nSk96OGR3SUc0RzRo?=
 =?utf-8?B?cUxsOVlZczNBRDNiOHZHelFCbCtUR1p1dDVRUWhqUHBuTXllSWFCakltRDZW?=
 =?utf-8?B?bnRIQzFWeGk2dzZCM1ZmN0FacUJ5Mm9MWlZiMkFITzdsbVUzUHlaVGJOTkg1?=
 =?utf-8?Q?mOtI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGhzSkZUV1ZoUEtoaXB3THVublRIdzRPUDQxRndYbGozTnFUQ2VtRDdLZEFy?=
 =?utf-8?B?N1pWbmZSSHNSYWI3MTNUbGtkZzJBMG8rMWpuVS9ubTE0L2N5OXlOU2pnWFYz?=
 =?utf-8?B?QXdxQmNuSjA2VjhIMTZnd1VwUHQrbjNqb1ROSnVBM0xSZE9vSVRBUlVHQmRO?=
 =?utf-8?B?TUFvdkZwZk9xclpHNjhqVG91MWJkMUIrOXdQSGlLV2R1cmZkUGJXa3RkdFJ2?=
 =?utf-8?B?TkNsbjUrNW5ETFA4ZEkzUkkzZ3ZOaFA3ZERIVC9MdkpPcWVVSEJXOG9LeVRC?=
 =?utf-8?B?TE9VSytJcHdnWnZmc2pOend3MTZPaFdtNXZiQ2Vnb0FUWitIUmpNMVBaSEow?=
 =?utf-8?B?MjJ4dGQ3M3pKd3V1TDdjNFVkSVJ4MTdjVVRpeHlVZnI2enA3V2E5ZnZVWUNW?=
 =?utf-8?B?SUZNc0dqMXpYOFAvY0dvRXV6dnBwYU5TZCt6Y0FXeUErRTZJNGdkSitrRzd6?=
 =?utf-8?B?MmlNSllvbEtSNnQ0V1dDcTFFWUFvcWZ3SnptdGRMbHJ4ek5FMm5oanFUQnVX?=
 =?utf-8?B?V3dHWGhxemN2NXMvMjFzR29RY1locWZiVmsraDBCOVBvblNKbHBDMkVHUjVa?=
 =?utf-8?B?dHBxSForLzdoeHIrNkFrNVgxQjVzVTJrWVN0NlVrSGMrVmFEOGpUSGxuSkZE?=
 =?utf-8?B?c002L1o1a2FDOTFCV1dKbG5YdFF0RnRPeW4zZkhIU3JRMVFVVEU0K3FWbVpX?=
 =?utf-8?B?OVFrS09tajAwTTJQcTM2T0hRQkhydXNHbXNNdjdnbUFaQlQzZUppVGZFbDd1?=
 =?utf-8?B?VlpXbC9WN2VoSDZ1VWZndjNkeldtRzZYV2hmOUpNYmUzRmhFOVRLdmQyeTVN?=
 =?utf-8?B?UUxHOU9nK1BpNEZyUFV5NTVqRGJBVko2WFoycXVpRHdCSUlIMVd2VmwyTjl1?=
 =?utf-8?B?M1p1WlEva1ovUFNqRTk3NHMrR2paeW9vWHhhbGJpUSsvWXBmOTRRelE4U21t?=
 =?utf-8?B?WXhMcTVFcVQrcGt4UFVGY0VzUThTbmhVY2RIdzZLRDdBWm5Pd3JJcHk2Z0Nu?=
 =?utf-8?B?ZjNCcFZHUGpPMENGSkEvSEY1cUFFeDcyREVoOXVNNXFDcU5qWUh5VUMyTno2?=
 =?utf-8?B?U1E1RGp6WWRtNlhTanczaVA1QVRTU0lEU3VGSTZ0OWtkR0gvZXlJRTNTT2E2?=
 =?utf-8?B?L0VFZU1KRGFNTXR0NTRsdjhPQVU3Q0w2MlhOYk9KbXMzbUFIZE1yUWhtL3E5?=
 =?utf-8?B?QVJDNDRkeWlVSWtsc1Rnam1DcVNmaThsS0ZtZk1PK0c4RU5JTDNqQjJ5Vy9v?=
 =?utf-8?B?cGp6NGFGL2p0NFBjTGJEN0Q0bXpOMitRWEU0U1R5bHU0eEJvUzJIYVFXSVJv?=
 =?utf-8?B?ZE1mMFhxdXM5eUx0Z0pEREt5S2R2V1J6SFRzLzBOS1FRZTlxRElCMnN0aVJl?=
 =?utf-8?B?YUJkaHFWekZRc0dpUVByVjZCUEw1c3hNRjBaVzdxQmh4cXN6MjBiazd6VUly?=
 =?utf-8?B?c2F4VXRNVDUxdnVMNHZuRzFIYVdYaVE3RCt3S21tYjFOelZHK3hPUWJaV2tw?=
 =?utf-8?B?WkRZSHA4NFh1TDhFUnNJR3Q5dE9GNVd0S00wZVZoVG1tNS9UUk9pY1F5SVdH?=
 =?utf-8?B?SGdBaDQwWU9jZ3FBT1RXZXcrQUxPRDFMZEJxNDdxeVRVNnN3QWZESldUY0ZH?=
 =?utf-8?B?VE01TnhLM0NNQjhnNW51OG5peUJhRVE0cWxwNWR1Z0tTTmRndkhCVzEzdWxF?=
 =?utf-8?B?ZGp1cStubGJGdmFDeXRUenpWL2Q1NTAvRmVlazIwOFg0OXpBa2pxNktzbUJ1?=
 =?utf-8?B?aExkNHUyQ2dXa2ZvdWFwd2hXbDEzcm0zTDBxN2FkaUR3Wk8vT0lPdG1GK2ll?=
 =?utf-8?B?Yi94d2pTM25JTU04bnRUVlRjczY5akRFSy8rUFJnWXdsV0JvVUpLWWs2eVAy?=
 =?utf-8?B?MEFQYWcrZjBpVURVL3k2T3l3VWl3NlZ1U2ZoV25renpzclJjMmxSWlhOZktR?=
 =?utf-8?B?Q1VCcTlLS3g3YUxEUS9kcStPeVMySU5SMnQvcFhrUUlQS0hKK3doeUNJam9w?=
 =?utf-8?B?d3Nsb2R3eEErRVlXN0s2NGE5d0RqSzNsQUtQVTNwODhuRk9VWldiUnBEOE1F?=
 =?utf-8?B?SU1naVhmSjNGdWpmc050NXMvN05ENXVHbE5hSzBrOFpzUTZ1TUJ6THFnWnNu?=
 =?utf-8?B?dUVCZFdZOFZHY1hkWVpwa1luK3lTd3F6UUFxQk9rZHcwMDF1ZGR3NmJaWFhY?=
 =?utf-8?B?R1hPZjFEYnJpRVQyQ2o5STU0SVdvZVRkRkg2Rm5OU0hKdlRsNVVNNkZBMnFE?=
 =?utf-8?B?Qnpiai9Zb0lYUzJjS1l0VDRhdS9NUjVRblp3Um4vNEVqZFU5N0xGMC9oVmVt?=
 =?utf-8?B?M2lQbGRmN2QyR3c0UUo0WkhIY1JZbEhTc1VuSmJhQlNac2VESDR6QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8032211d-942d-45a4-00f3-08de5f0f2ed3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:19:54.9676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2/KNbTu92CXTwndZ/DdRygiOWGHGAMSIbHCfVeQy2KYHXHP0oE+qItdV/1zyNtAuQPAQMsqRpSIEmCyXM4YFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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


On 1/28/2026 19:08, Marcin Bernatowicz wrote:
> Introduce xe_sriov_sched_priority_mask_to_string() to format a
> scheduling priority bitmask as a space-separated list of priority names.
> Introduce xe_sriov_sched_priority_choice_to_mask() to convert an
> igt_sysfs_choice into a bitmask and a selected priority index.
>
> Both helpers are thin wrappers around the generic igt_sysfs_choice
> functions.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> ---
> v2:
> - Make xe_sriov_sched_priority_mask_to_string() return error code
>    instead of NULL.
> - Add doc for xe_sriov_sched_priority_mask_to_string() and define it first
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 47 ++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h | 13 ++++++++++
>   2 files changed, 60 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index c2a1db4bc..f8dda09fb 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -9,6 +9,8 @@
>   #include "igt_core.h"
>   #include "igt_debugfs.h"
>   #include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "igt_sysfs_choice.h"
>   #include "intel_chipset.h"
>   #include "linux_scaffold.h"
>   #include "xe/xe_query.h"
> @@ -657,6 +659,51 @@ int xe_sriov_sched_priority_from_string(const char *s,
>   	return -EINVAL;
>   }
>   
> +/**
> + * xe_sriov_sched_priority_choice_to_mask - Map parsed sysfs choice to mask + selection
> + * @choice: Parsed choice (tokens + selected index)
> + * @mask: Output bitmask of known priorities present in @choice
> + * @selected_idx: Output selected priority index in the known-name table, or -1
> + *
> + * Converts an &struct igt_sysfs_choice representing the sched_priority sysfs
> + * attribute into a bitmask and an optional selected index.
> + *
> + * The bit positions in @mask correspond to &enum xe_sriov_sched_priority values
> + * (LOW/NORMAL/HIGH). Unknown tokens in @choice are ignored (best-effort), so
> + * tests can tolerate kernels that add extra choices.
> + *
> + * Return: 0 on success, -EINVAL on invalid arguments.
> + */
> +int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
> +					   unsigned int *mask, int *selected_idx)
> +{
> +	return igt_sysfs_choice_to_mask(choice, xe_sriov_sched_priority_str,
> +					ARRAY_SIZE(xe_sriov_sched_priority_str),
> +					mask, selected_idx);
> +}
> +
> +/**
> + * xe_sriov_sched_priority_mask_to_string - Format priority mask as text
> + * @buf: Output buffer.
> + * @buf_sz: Size of @buf.
> + * @mask: Priority bitmask.
> + * @selected_idx: Index to highlight with brackets, or <0 for none.
> + *
> + * Converts @mask to a space-separated string of priority names. If @selected_idx
> + * is >= 0 and present in @mask, that priority is wrapped in brackets, e.g.
> + * "low [normal] high". An empty @mask results in an empty string.
> + *
> + * Return: 0 on success, -EINVAL on invalid args, -E2BIG if @buf_sz is too small.
> + */
> +int xe_sriov_sched_priority_mask_to_string(char *buf, size_t buf_sz,
> +					   unsigned int mask, int selected_idx)
> +{
> +	return igt_sysfs_choice_format_mask(buf, buf_sz,
> +					 xe_sriov_sched_priority_str,
> +					 ARRAY_SIZE(xe_sriov_sched_priority_str),
> +					 mask, selected_idx);
> +}
> +
>   /**
>    * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
>    * @pf: PF device file descriptor
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index c9b321d58..6661b33cc 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -9,6 +9,7 @@
>   #include <stdint.h>
>   
>   struct xe_mmio;
> +struct igt_sysfs_choice;
>   
>   /**
>    * enum xe_sriov_shared_res - Shared resource types
> @@ -75,6 +76,14 @@ enum xe_sriov_sched_priority {
>   	XE_SRIOV_SCHED_PRIORITY_HIGH
>   };
>   
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_LOW    BIT(XE_SRIOV_SCHED_PRIORITY_LOW)
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL BIT(XE_SRIOV_SCHED_PRIORITY_NORMAL)
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_HIGH   BIT(XE_SRIOV_SCHED_PRIORITY_HIGH)
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_ALL \
> +	(XE_SRIOV_SCHED_PRIORITY_MASK_LOW | \
> +	 XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL | \
> +	 XE_SRIOV_SCHED_PRIORITY_MASK_HIGH)
> +
>   /**
>    * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
>    * @vf_id: The ID of the VF
> @@ -138,6 +147,10 @@ int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
>   void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
>   const char *xe_sriov_sched_priority_to_string(enum xe_sriov_sched_priority value);
>   int xe_sriov_sched_priority_from_string(const char *s, enum xe_sriov_sched_priority *value);
> +int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
> +					   unsigned int *mask, int *selected_idx);
> +int xe_sriov_sched_priority_mask_to_string(char *buf, size_t buf_sz,
> +					   unsigned int mask, int selected_idx);
>   int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
>   				  unsigned int gt_num,
>   				  enum xe_sriov_sched_priority *value);
