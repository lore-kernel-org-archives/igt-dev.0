Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A1DE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 13:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A05D10E966;
	Tue, 17 Dec 2024 13:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTb81DGz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C4310E966
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734440903; x=1765976903;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QLRKVOPGN8jd9XfqwxDDg2mDFOF7FrSo8XZJuUAKEvA=;
 b=ZTb81DGzeV9I4xZzbMSp4K3T7FFLVWVhBVGp0k1pZkG09jIX2EzEQ477
 /KrbHR3FZr0mSViss6phNQfWzvKnGTWfcfM3/HTZR1trjj41cyXU+3TWa
 TJYduuTJb5ODt10USihIh2mUpNQjpH3EdY38jHI+NdcCZteRNdO/O7hJI
 ASUlkqKUdmr4xACRLj+EG9Ubc80dcEyW+8pdC6Eq+8O2e9/XmPRh99Ld2
 nXbSv+bllMbwGM0Ri0QV1rPLWCg/nn3RontepEWxC961/sJBpMz3kyQNs
 p8y5Yt6UadC3BS34o8ETYI9WIKg3yQZcASfkXWvcLPWfT9IavzZT9RhFv w==;
X-CSE-ConnectionGUID: l8A01FA4TiuxvnFCjd6KXA==
X-CSE-MsgGUID: Z00z3wa0RcWNPtFtWyvcCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34995366"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="34995366"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 05:08:22 -0800
X-CSE-ConnectionGUID: VPI6V7qPQhGZ4w/21hokvw==
X-CSE-MsgGUID: b6wHu/0hSd+Ifb14TwR++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="102370447"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 05:08:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 05:08:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 05:08:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 05:08:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXUMCGylPJPF4a5vZl/JXVLs9wSvVzCB0zheUOePCvuWdDoYGkB7JyV6Pc+ndYiAsPa938ackO5jK+ooO77M9qwS6iMz6iaoKdhfhu6dHNL9T0XfDhGnQ2XhC4TgLC/TCXKwua78yayKbgZVarNI9cpU0n9i4Vhyy84++nk+yKEqU9V+GrfkQff8TT8ukszv7Unc6mowZ0XVTCvKJh+jmZObrKjXlL8uj919abHmp+YN5D9fQn/5zvwU8p6PjewIst+m/pHlzLFqUqdEgta8BFPdcqGzX9JFNgKkr9qfVbBBMSbwQlqZucjsFKHCAC6Uhr+zI5Zcdq+dBtmFAO19OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVUeXS4wg2XLLUtPrMF7Q/5tG8Em6mYFu3VUUkZ4nys=;
 b=EUJQVmJGVyBrrod3TMUWS0B1N/Zqi4CHcv1shLMTTefIN+azsTF7Fn2o7Dyb6E1WXTsPOkT1IXm5EGxWLZR6NYHgxNWl7WLjdHHJ7kgaPDaTA2r4Cxyp44s9R/frZ2y4Pf4VLQWCFiyfvxtPHUmrvXWm5KmNoYankgqPtaC5chEiF9grdKt3D3gBOKy+S3FBB/RJstgaCB6YJkIiFv5FLlTXQpBSw9rr4eiUwhPIoKbJbjogtFeYke1g4/S+sPlVk7yo21z0uwl21iJvMMJCJe+bCZv1bpH7ztLfDvozvKHSU/zdCHYd0sXJIlB49xagp5cYGP404vrc/6GLijGgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 13:08:13 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 13:08:13 +0000
Date: Tue, 17 Dec 2024 14:08:04 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <andi.shyti@intel.com>
Subject: Re: [PATCH I-G-T v4] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <7d2d7w4dancui7js6mgh7zrcvfg5z4rxbzg7xj5ocxyzi4ye27@orpiifglz35i>
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
 <a3evoug4tajult4jtj5c4vn6plfh3db6mkvg3hludtqrptwy4u@khgd2axkfwpw>
 <xarj46jl7t23hkexmp2wrkxh6q6yioplpl2hggfxio6wr5sjvv@3ygotnvwalhs>
 <j7ixar3v3rpgtrrk5af76snc4ixtnjfiyir7flbunccjqgyyy5@carwpi3crpxi>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <j7ixar3v3rpgtrrk5af76snc4ixtnjfiyir7flbunccjqgyyy5@carwpi3crpxi>
X-ClientProxiedBy: ZR0P278CA0188.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::20) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb46074-e8fa-4a79-1900-08dd1e9bdd2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHRQSW5sMGdoVHNnbzJjNG9FbE03eERPYWdXdEVNNTEyRWNmTjdtV1laSkxH?=
 =?utf-8?B?Q1V3TE5jQUI4N2tYK3dnQ3JTQWRic0UzbGhBK25GT2tiMEhzVTRueGF5SkUv?=
 =?utf-8?B?eGdpNmRnMEdNSkhiait1R1JqZkRjRkZ5eDVvS05ZdVV2Lys4NjV6R2x3WWFo?=
 =?utf-8?B?eGhxYTFwNlJrbVR1NFR2V0JOMkIyM3RWYklLVStBWXFXVzN1OGxyY0RGWkp6?=
 =?utf-8?B?UGFCNUsyaFRxMVgxMmpaeDgxZGV4cGczdkFmRFIrYXVKYnpZb0x4Z05aNk04?=
 =?utf-8?B?TnN3ejJKOENxK3pDTTFRdDB6c0E0SXpQd3NiZEdqMzdNTGFRQU9XMWRlNWwz?=
 =?utf-8?B?VEtxN3JscFU4Zko1Zk5YNlB4bytjUTJMSVQzK3h6cnltL0hRVjZKUEVYOFRx?=
 =?utf-8?B?WDRtbUFrK21MN2ZQYWsrOHFDN2xYa3hSVE5PY1RDRmtNc3pVZmsySk8zOXJi?=
 =?utf-8?B?endKNWFUUG5yTDJ3NWVOOGpqTjNpeDRPc01yaS9iU21WclZNT0xBZEhWd2pL?=
 =?utf-8?B?RExFQmxoY0czS1JMUGwrTlk0NmY2aEtIYmk4WXo0dEVxcjhWN29GWDRDaFoy?=
 =?utf-8?B?ait4MTg4OXlGU1lkREVpYnBnT1pGY1JkWEYyd1M5a3MrVjNlNTJQaVFZMVYw?=
 =?utf-8?B?UjRWN0ljY0JqZVhCaUwrUzltZkg0Ly8yOVczNXdJR3JTTENYL3RtQllQOUIw?=
 =?utf-8?B?VTNNSTVMSGtZVHVBUExma1pwNHBscTRhVDQzNmQ3djhaSzRHdkpNZ0NuM3Qz?=
 =?utf-8?B?dERsUk1WTytPaGkxcEwrVnJvU1RlM3ZFc0lETjNYUWxBTFBGU2F3V1dud1Fw?=
 =?utf-8?B?bGNXUkN3UENza25mT2RHbGUwUW5jZURkWXhWNGIwNFNudGRUMHJhMmtVenRl?=
 =?utf-8?B?eFd5eWJLSTQrcTRJN2dJQURIR0hlRy9haWQrYlBaczZmbFd6NnFTNnN0WTB3?=
 =?utf-8?B?MVJTNXg3aHgxbVNvOGpkWG93OHlPbURwVnBQTTJhdGphcnVRQnB4a241d3Nv?=
 =?utf-8?B?YkxPL1B4aWhlaFlIeGNIWHI5QTdJYS9qbGdLSmQvZEg3RC9XNVdWdEkxclo1?=
 =?utf-8?B?dVJOeHVRcCtlNE16cFNDYWhvVGdyWFhPVGJGaTl0NUhsQTVtY0pMbEFxMThY?=
 =?utf-8?B?bWtqUkw3ZHM2RlNBQlFmdDR4V1djT1N1OGx0NU1mRDV4ejIvU1lqeis5bkRW?=
 =?utf-8?B?Y0JPak1kVHFPUCtDakEzRHFUcyttQ3piNWRjS3AzLzdjVHRISzBpVzFjOFMr?=
 =?utf-8?B?Vy9yTnR2aGE4aVArTHJPWVBtU1lvdHMwWjA1d2pnTjQxUDBuUDUvcklpbmpk?=
 =?utf-8?B?VjFURmkyRXJzSm5jdnhBelJiZFZ3emp1NEhQdVBnc3Y4cXhpSzIxWHcySUVy?=
 =?utf-8?B?b2k1eEFYRlltQlRJSWhwa3pkUjhJelJtRGlPV1BvQ2pabGNlZW0yT0VkQ09P?=
 =?utf-8?B?bEw4YzNJVGpqMVpOOHZGNStBU2l3ZkdUTzgyV1JkQWhZbmd2eHRsVUtnMnFl?=
 =?utf-8?B?RjJoYVFxUi8zYUZLQi9oaUs5K2JLMHl4bUNZUlRoazdNa3dFVmVRdGpUV1pp?=
 =?utf-8?B?QzN1SFg2TWk0UWhlWmZUSjdzc2xnZ05kbTZqWUFHUnEyQUUrcDU2NktvSWt5?=
 =?utf-8?B?RDgxNkFRbTZRTDJrL1FZY2xwMWViZVNVSitzYWwrcVZjcDdrOUFPZWZpYTMy?=
 =?utf-8?B?OVN6SU9MUjkvaDY2ZDVNRzhmSjBzSnVTUEJsQW9kc2YvZjdkWFhjMEI3N3dG?=
 =?utf-8?B?eDd6aDdQUTJsOVdqaDJGaGNKMSs2Y2RxbmZ1UGdPZS9zZzhuTzNoeEZBb0FK?=
 =?utf-8?B?bWloM3YrME9aNUxSaDNQd212dDI1Z0VRUHhsbmdVeVEvWWorK01GL1lwY2lm?=
 =?utf-8?Q?KHeuCTlHmlGVF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhOMHJacnoxSnR0WW1meHcwMTgvZ0ppbUxNSTY1cS9lT013SE9tWm9mRTda?=
 =?utf-8?B?dG1BY25lN2dSMHN6aUlEUmIwMVNHYjh5YVpCUHZnb3hvL3Q1QW5jSjR5Z21W?=
 =?utf-8?B?eDAzMDVSSWlCenBQWjQ4ekgzcjN5all4UGFaNXFuM1hUOXhpVGdBR045aHVy?=
 =?utf-8?B?L1ppZXJKM2VVMlZiYnRrOE9qYWQrZ3dhVkV0RXFINHRidEZmcFlMZmNkbFNV?=
 =?utf-8?B?L2x1U2NlSG5QVkxSWjY5YlR4cTRITmVjVjV6cnp6dUQ2Vk5qeUMyZkd0Qm5s?=
 =?utf-8?B?ZmRGank3Y1YxY2ZWK2NuUk1wdXVqYk9YWXJwUVdTQVpvYXlzb3FYOHlQUUt4?=
 =?utf-8?B?amtzVklXT3F3cWNJU3ZsSGVPM2dtN0h2MUwyZFZsMDBQcjVMKzlrN0xGRnNF?=
 =?utf-8?B?Z2NSaFY2WEc1R1FNWjluRDF1TkRHV3hqWVo2aHdXWUR2Q0Z2YUxBbVNPNUgr?=
 =?utf-8?B?YWY3RFp1emUvTktDK3FqNG9oOTNQdzJnNjVUTzVJM1ZFVjRGSDZ2c3JNS3hr?=
 =?utf-8?B?V0VrMDgxVzNOWXhvOERBM2JkNU1rRkczRllUOXpuaTdOOVc4L3VpVHJTNzFh?=
 =?utf-8?B?Tnk4NkRwUDhHd04ycXhnQXBnOW1qY2g0WlpNcEJxS2k4M1U4ZnIvejFsMCs2?=
 =?utf-8?B?aHR1NTlrSTNaL0JmVUdiR1ppYnJrcDZpSmoyZXlTQXhjOWdGNHZrMVVtSkNo?=
 =?utf-8?B?S2N6bnp0U2FHcDBhcGoycUtnY3llamtoOVlSVWp2RHZWakpURFJ3RzNsYVlF?=
 =?utf-8?B?ZmdYM0tmbDExckFQQUs4dEhQRzdkQlF4bVhvajQ1dzhDNmdkOFJNMGdwdjBr?=
 =?utf-8?B?QkVPOUc2QmpqbWhKYlg4RkZLcHNXa085eXFRVWJrUG9yRFdEMWVkaGJvOTE5?=
 =?utf-8?B?eWVycENyTlBENzdWYWZRODVIT2grNlA0ME1hUDJHOW1EaTgyNWlDNnV1NVIx?=
 =?utf-8?B?dDVCcHBoWHRTang3clVaeEpETDV0ZWx6ZGgrYUpNazUwa3pWUmdLN0JXbXcy?=
 =?utf-8?B?RDFxUzQyTXlWc1VOeWNrelpOQ1pvWEpLTFpHdWk0aG5qRWlVSnFqbDFNZ0RB?=
 =?utf-8?B?OGk5ZE1jYmsrMEVhMWUvWHpqcUhERHBMMXM0QzNlTU1XN212RituaHc5RHBR?=
 =?utf-8?B?S1lEV0IwRkViTW5vdXZ3aDRrUDdHVXRTaHhFTHJnNnVlMGVRZXprNUJWRjVa?=
 =?utf-8?B?cVZnZlRaYjJVSjRhSEE3ekd1N1JPZXFTTkRNdm0xR0tyWmR0UlV3WGZ3YWhp?=
 =?utf-8?B?akVpNTlUcENWdGxTd1ZXTlBKRHZBUzZGTW5waEs5ZThHdDU0SEZQZEdDNFNE?=
 =?utf-8?B?RjA4VWliUEdBbVJpTWhCTFFBSUNxeWhTTEhZS1BkN2ZQL2tKdCtTcDNzUnpK?=
 =?utf-8?B?YktTVnVrMGJFa2pabVJ5UTlxVmJ0eVo5OFZsZDRNQUxjWEJUMEEwQkIyWlFO?=
 =?utf-8?B?SjRHWTUzSll2R0lHSDdSN0d1Ny9XcXlobEVTS2lod2c0M3lML1ZVamd2d2c0?=
 =?utf-8?B?QjVhT2FFVlVpYXBKUXZocWxJSWZtS1FFL0dJYXA5Y3NFRTJDZ24xMUsvZzND?=
 =?utf-8?B?WDZoVTB4Q0J3RUlsWnB2a3N6WWlJQ3ZuR3lpVjd0RmNhMHpBd0tyYTdMTG8z?=
 =?utf-8?B?SDhOWEpIMG84U3JmTkl0T1dnVm53VkNZSDVFTmsxWGwzY1J5a2d0di9PWmJT?=
 =?utf-8?B?R0JZMGY4dmcxN3QrZ3hwUmlxVmxjNlFjTm80dHlqSVJWVXdxZ3ByRmxTL2w5?=
 =?utf-8?B?YWZNUDFxT1pPcXJ3TzZtZ0g3bFhtQ1pyUlNXYjRnUUpZeUhCYlhwazRaSjNO?=
 =?utf-8?B?a1JNbE5yV2xGMmMwdC90L1A4a0RFMlRuZHZZRUdJbU5JeWVha0J5NTlTWGw2?=
 =?utf-8?B?VVJoaCs1ajI2aWw5dzV1Z1ZyQ0M2WHEzVDMwbThXbzhRVE81K1JleTd3UWpV?=
 =?utf-8?B?WS9lQitBRFM5eUFUQUdFQXp1VC9IMVZxOUFQWmRMVXpGa1ZMZEs5RWE5aFlL?=
 =?utf-8?B?WE5XcFMxSXJoMWtUaVpRWEl2RHhKai93V0ZnOUZmcUk0QlVUUndkcWFoc3Az?=
 =?utf-8?B?cDVod2p0WW1BUmVYVW1PN0hOY0NaMGM2MFdCWTlNTG53bXRWYk11ZkdIOEUz?=
 =?utf-8?B?R1Bwa1BOem9tNDNaM2tZZXZCaUNHVGRZc2x2SXdkZE9GQ2RkVStFUE1KdE9h?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb46074-e8fa-4a79-1900-08dd1e9bdd2b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:08:13.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaAyC8wovd/LqPOP0rxn2vnjwUdcMRWwAwhRLSCLKv51GOKFBl7sgmRC0iQ99Ung41oTuzG8EMR0tbbzgkQ558LD0+5xiqkBRjERVc/fPZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
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

On 2024-12-17 at 11:23:46 +0000, Krzysztof Karas wrote:
Hi Krzysztof, 

> > > >  	for_each_ctx_engine(device, ctx, other) {
> > > > +		/* Wa_14014494547:DG2 */
> > > > +		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other))
> > 
> > The test fails when both rcs and css engines run in parallel.
> > What I overlooked in first patch version, was case when both of 
> > them are running as background spins (initiated exactly in loop above).
> > So now the test passes not only when one of the engines is tested one,
> > but also when the other ones are tested.
> > 
> > > In previous version of this patch there were also checks to confirm
> > > that:
> > > 1) the current engine is one of the two types,
> > 
> > Current engine doesn't matter now because even if we run test on rcs or
> > ccs, we will know for sure that the other one won't run in background.
> So the idea here is just to disable running rcs/ccs in background for
> all engines?

Yes, that's correct.

> 
> > The tested engine is run later in the test and not in this loop.
> Does that mean rcs/ccs will always be tested separately?

Yes

> > > 2) the engines are different.
> > 
> > Cc: Andi
> > 
> > This I'd like Andi to comment on. What this check did, was that it
> > allowed for tested engine to have both frozen spin and normal
> > background spin. Do you think that this background spin should
> > still be run or is it negligible?
> In that case testing e == other makes sense. Thanks for explaining.

Yeah, current patch doesn't test that, I'll fix it.

Mikolaj

> > > 
> > > > +			continue;
> > > > +
> > > >  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> > > >  		context_unban(device, local_ctx[num_ctx]->id);
> > > >  		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
> > > > -- 
> > > > 2.47.1
> > > > 
