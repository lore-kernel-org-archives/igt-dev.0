Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D44EC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 05:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2B010E01F;
	Tue, 22 Apr 2025 05:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjOoy/ye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD68610E01F
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 05:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745298586; x=1776834586;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jdELpUE21dkGMJaF0ikYE/mYMDx7mn1bDTlAXYOHhkA=;
 b=KjOoy/yeJuy6rs4O+e895crjYcwoSlU7H9dE7RxTzY8/u3tySLL9VDHU
 62CC14eaQGtg5ewYBUduwjy3QGgcyPWWzm99Zem7/LkHshhwmDJh6FU2T
 /pRHJMe1mV6+b5E43xmZhrYztkHXglgyPtzqIB5ZSXZr1HKDS9o027ckl
 KZ52oNrOHjw0MbBKcCXSwtGfRFd0idN2XVi0jSxMb4rX6Lb+EZPZgisGM
 vvGB2tvCSqb/Wz1SFyVDIVvD5synbFclgNB7liXvANTeTxj2hOusemAor
 xt49GjPSkrXrrILi4BgkaaYZhemRk7yTXkRSVXb5l+jx3izKtyM6+YDu0 A==;
X-CSE-ConnectionGUID: JBwquaTfRxSWoa4LNxMDXA==
X-CSE-MsgGUID: rcCf/uT+Rryn3eXSzS+NKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46851975"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46851975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:09:45 -0700
X-CSE-ConnectionGUID: NLZu3bFJT36NI/yrGF0x/Q==
X-CSE-MsgGUID: uAU8cxyGToKL8wKafic60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132870512"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:09:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 22:09:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 22:09:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 22:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgA8er1Zbz6691xWA74yASjzz1k4zXhBQyUQ0Pql53EaE93XBSKmxiq6Qqrow5sngSHKnt6Fqnhr41X6zM4VT9xTO9M+zu7SrTCeo82RLPnCOVlspa86yv+Xv3O2k5Yn4vA+MpE53ZbxZzlMy7sYuQZkri9rxDq9U11zJoi+dN+E5Y3VZGgGNrgupQxsSBuWpGs41ADp/owIc7etTQvwmVAc+GA7GSjc6mUSvq4U89R8r5O9Xa1VNSL1sdcHCUsaEeyunofflg4oEjfE8lUm3S9AZKji5sy89j+fJ1ala2hDmHULAdvGoOYCqUiOyyyobSDgldtfjg/Tw0dq7auIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhXHn5Qnw9fV39Vk9Fw7yTEcvp9E4kxBStqzk1TShHE=;
 b=RoSMV3/uhl11Dq4ZPCfcCg1s9FiUpP2BjPNHtQYcEQZu+5KI0dkdAHCNuUR3bVPfrEnAMM2kRWRg5+jZ3IQUgIjxn7VCCPucfjw5vAs7K9+t1HFWzKgrvViVaZUI4Q0lgJsCJ3GJwXja8ZMyP0+mnsRkpElZklDX69Lr8G7qTpecKquaeONfNUV929mVvZvJgfq/YEin6Z4CT35R8gsGeJDDPjfaXLijC3HQLiFFlNLMoa2nd+rDy1y+JtigyY1+a9m2HVghkntOKi+VYST19gQ0uhtp8vjymj5dSaNKisikkaEgtiZyqM4pnELtdL0Qc6yDiOabQ6xdtGkOKYvY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Tue, 22 Apr
 2025 05:09:37 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 05:09:37 +0000
Message-ID: <91dc4ba4-6b0f-44c6-b420-0c7c8077366b@intel.com>
Date: Tue, 22 Apr 2025 10:39:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Blocklist AMD specifc subtest
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20250422050547.8479-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250422050547.8479-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SJ0PR11MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 036e113a-2e4c-4ea0-62e7-08dd815be0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjBUenVyRTFqOWR6UnFUZEF5Z0VqYUlMYUFacU5abzBRR2dpNGc4YytwcVM1?=
 =?utf-8?B?WHRlM2RoUjVaV29kZVd5WklDTnp6SXM4N2RYUXUrbmlKRWVocit5bU13WVV4?=
 =?utf-8?B?bTlTTG45VUVEYThlR3ZPQTZRVXVZVG1BeVovQ3V5a3A0eFdEYXBaUnpsTkZa?=
 =?utf-8?B?T2tIdkNRNXZ5d2o0NDFGejE3TTF3azZoeW9UTmx2L3RCTTl5NVltN0NyU1RJ?=
 =?utf-8?B?ZXNvMmlLVTNXNGNSdXd5SXo0RTQ0Y1RMTGNZSjFtVElXaHpxeGwzMEVNenh3?=
 =?utf-8?B?dUV1azdDWTlkSXhHbVMwV2dXamlzUk84aE5PR3NHMnFLTFBieGt6R281TlUw?=
 =?utf-8?B?Yys1WE5OR05TajVvdjB6Z2Nrb0h0SGFBNUNtUXgzVG5IOTBzN25Cai9wMGhk?=
 =?utf-8?B?cm9TVHRpcVl1eW4yM1dVKzlCUnNoOWNWZmsxWUlZaW5DU1dycGJ2aEpVOEZE?=
 =?utf-8?B?ZWIxODdQL2FKaXkyS2dkUHBpRTlOMzZuM3NCaHh4aXBpKzdQbnhmZ2w0YThB?=
 =?utf-8?B?dVRMZkdncE81NHkwRzdHK1ZycTV4aUVmaDE4M0plaFlVNlpRZWZHMkVVRDkz?=
 =?utf-8?B?aWkybHUwbUlqZlh3aXE1QUtwSzlIT3ZsSnRKK3ZFa2RpOVRmaVZJeDdwbTNZ?=
 =?utf-8?B?NURITXFpYWwyaEFSakpKN21RdEltbEdqc09TQXBCejdRbCs3RkFOcW1vM0Y2?=
 =?utf-8?B?VTB4K2g0TktveFA4aTVvSHhVMVBEVFUwK3NFVkIyZ2ZmQm01TGVaVEdHcUZD?=
 =?utf-8?B?SncxYU5YNkxIb2xWRFUyL0UwUTN5WmZrVTByMTNwenJPcGZuVjJMY0dNOGFo?=
 =?utf-8?B?L0FvNUtGM3dWVkkrRkRLYnRnc1YzV2Z0NjV0ajQrN2crTHRYTHY2TzJ3aFRJ?=
 =?utf-8?B?bVBGY1l6dUNhYjJ5QUplM2p1M0tpNFdkVkg4clRnQlZXejJ3MXR1bUJrNUlx?=
 =?utf-8?B?UDFleThjbkNhdmhYT2RHYUJvZVBwZTNONTJGVGx4RW90S1d5STBKMHRnWE1r?=
 =?utf-8?B?SWxVclRhVUY4bk1SRmJMWlZxZ0pKcSs4L2lRRmY1SjY5RGcvYlVyTk5ETGY1?=
 =?utf-8?B?MUp1Z2xFZWlxQ0xzc053OWQzR1p5Q1RCekxOSTB3bjdsb2xQUzRHdkNvb1Bl?=
 =?utf-8?B?ZGpNNjFDNlNTczlNdHZkaEVnVVBaQ1RwTnpYTEFaZGdvcHpnUWhSSDgwL2VO?=
 =?utf-8?B?Um52bWVmWVVjN09KcnBtSGU3UVZXQWQ2REJqY2hCelM0UEgvalh3eWVyS3dz?=
 =?utf-8?B?eUVPakVSZ2l2UzZ6UWhkNE5wWjFZalVLem5PS2hTUTA1SVVHUzc2M0V5L3RH?=
 =?utf-8?B?dndnRDZaems4d05mSTNiWExEdnR3L0g5SlpISFp1elNCM0hPVU5uajVJWnM0?=
 =?utf-8?B?UC9jTXVPZHg3dTdQR3FSMlFRcjdpWFo4cEx3T0hQWTd6N3liaHBHTXArYStC?=
 =?utf-8?B?ZERhRWR6QzZ0YURwVDVRSDJQRXZOOHhVZVVHMThMMW1BVUlXWnNobUFaRTZD?=
 =?utf-8?B?VzdQUVZheFg0NWU0b3pVejZLZ2d2Nlh2SUp3VE1RMktkdVhGODFEQWlIY2hV?=
 =?utf-8?B?Vyt6b1J0QWdNQXEyRFNFN29YVlNLLys2dGk5S0Z5YUNNMkhoS0tQTHBVT2JZ?=
 =?utf-8?B?ZkUxaitwTkFoeG9zZHYzSERXREFkUE90ZGNOYmN2S1d1MHFBekxsMlRDTmZF?=
 =?utf-8?B?blZHcmU3RUZEMlB3djcxK29pdU00QXc5R1VUaHRDZGZ6djVjOEVRUU1UOSty?=
 =?utf-8?B?R3BoL2g3STRTNldHSGhlajRRTlMycXh3OXdGRFhXQTl5R1hHVzlyMlYrU1M3?=
 =?utf-8?B?dmJudEhDTVZOMXc2N01qRDJXNnpEWUFaOFBPQ01qeldzSTN6eFlHL3FkYjhE?=
 =?utf-8?B?SXFqMG1jS1ZZV01GVGI2aEJub3AwUkU5N2I5bVdEdUxyK3lQVWhzSTdNbU54?=
 =?utf-8?Q?v5ZnaDh1qLA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MytZMW5YZ1RvQnFHL2NUNlRuVUlzOHJXUTB6ZUZaazB4VHJidWd3elpQRkxa?=
 =?utf-8?B?TGZBK0dIZ01rWVFjNjdBZW5hcytZVkdzNmJ3cERCTXBkb0svZTJsZCs5Y0t6?=
 =?utf-8?B?dmtjMXdNaHFIRVd0SEVMZkJPUDF5WDJOY1l6anNSSTJkMW5vNDhFT0VQRm90?=
 =?utf-8?B?emQxZmVQZFlicCt6MmR5RnlVd0llS0hHaGxXcVZFMmMzVjRaRG9KUE1lVE82?=
 =?utf-8?B?djJiRkNpbmNuZDFyVUxsWGozWTJzQkEwaS9xMDdUNWJBOEVPd0xOM0RYYmd1?=
 =?utf-8?B?UnhRbkNTYStBLzA1WmRKdWVYNC85OGxSSVBvSjA1R0JCSkxjUjAwWDNsWGc5?=
 =?utf-8?B?ME1GYWdyMkZLNXhvRVNRR3JwL3M5V1cvWDFmQXRGb2xXWXFLMXhZM3hob0NS?=
 =?utf-8?B?K2NPTjN5dFUzNHBQT2dFSU1pd290a2dEd0lEeG9xOUdrYmVjdlNvWjVRYjlo?=
 =?utf-8?B?N1NLeGdKczVxSnhWSFl0Uk12M1EwcVZUZWF4VzdXNHNXYVZtNVRwckk5Sm96?=
 =?utf-8?B?MW5oSnJDaVhJOE9jREwzTmYvNVlvT2oyM1d1aTh5SUxxWmpVNCtjVSsyOGJo?=
 =?utf-8?B?NGZvbTRUeklEUERRTGZmOCt5TVFpQVNSOUZ5WXJaSllOb1RMQmlnaVJlMk1w?=
 =?utf-8?B?OUJpc2xDV1ovcWtvWTNyR1pwUDBxWHQyTXoySFNwWVhDWm1hcEtxRm5ETkdT?=
 =?utf-8?B?NGJabmJ1MkxVdVhqbFc5SHUrUDFyQU9DZDY5eHllY0RMNm55NUxSU2VYa3dH?=
 =?utf-8?B?VFlScU9Yb2tySkY5Z1JHeCt1M2lseU82Q25mdlpYNmMyamhwRlRNR0trS3Qx?=
 =?utf-8?B?UlF5VkVZOTdoczFtUjdvMWE5UGQrMjRnYitqNEVQc2hhbmZXNlgvdy9CQmM4?=
 =?utf-8?B?M3A0YW5nMXdxL05CZTdFZ2xnWExaKzdLMjJncnh6RUN6N01JbFFvL0xxdTZk?=
 =?utf-8?B?MGFLRlVKUks1c1pYT09TSFFhZll1VWZFQ1kycVVjd0ZqUXNuUzR2ck1xQ1Fv?=
 =?utf-8?B?VWN3eUJhTVFuY0VnVDBwK1hEM25pblk3UU8xUndzeDNUdWRtTXNESGFhOEhN?=
 =?utf-8?B?akttY1dFc2E3bGFteG45VVByelZiY0JwdDNYbkgxRmkyeHhiZUpCTUkzUW1P?=
 =?utf-8?B?NndlTXJpaE8vZkVvak53S01lYXo2RVJLOUdHb29UUXlrbFFTVUhRdXNVc0Ev?=
 =?utf-8?B?RW14b2k5ckttUWxJeEJUOTRPa1RUSHR0R1A4a1k1T21DeGVJZ0Q3YlN6K01t?=
 =?utf-8?B?NUJRbHJWMXhrRDlpeWlGS0ZrZVduQU5SRHNHQXdyWHRYR3ZQT3NaTGVVeWVY?=
 =?utf-8?B?Q2t0K1lIamhNSE9wMjk3b1NQMm5VMjBXd0ZVZkFmTGpiMml4SW1JYlJVMG51?=
 =?utf-8?B?YVNUdGtlemorRmNiaWQ0ZmNNUWtuQ0VNUlBGSTM1VmxMUVZoUXNjUExQNkpO?=
 =?utf-8?B?bys2UmZXU3grTGpCa1BWVDgyZ0F0YnNkRHRLaWsvN09wNDQxMG13Rmc5WThq?=
 =?utf-8?B?TURtR0RQbUdPRGtVRk43aFdQNWdLWE1iT2szVnRaNjFVK1M1U0VnTDVJaE9x?=
 =?utf-8?B?TXZ3dHc5ZGt0d2thN3dHWGVkMjBodlFVMzNNK3BsS2ttdlllV0kxYlJ4QTM2?=
 =?utf-8?B?MEFISkwwd1VGc1NWYlBEYlVIVVNQN3Y4dnlMVExhMTFjajB3TDh3WnRCM2FM?=
 =?utf-8?B?UUExdVN0NFR0bEhTWGgwWUlQWWF0NHkxRDJTYk96Z3B4S0dRcU9lUGVkNFE4?=
 =?utf-8?B?ZlpLMU9JSVdzYWJGNWdyeDZxQUtqdTNwdHZtd2swYjlRUG5HSnZ3NEhMVFYw?=
 =?utf-8?B?cFdsNWRWSzFzZDBGWkxyL0NybHhaSHg2K29UR29YajZlY1J2K00xRjRiRnh6?=
 =?utf-8?B?SW9GU2pHeXFvYXR3c0ZCeHU3bHM4S3IvaGhMYlJqUGJPcWFRdm5NekRrbmNH?=
 =?utf-8?B?UGY0K09YTjlKNTlselJMWFBjTDhnb2ZQUEJOKzNIbTczTVA2MHJacm5aalBi?=
 =?utf-8?B?TklOSE1xNGtSb28yMjFDRVhGandqU3crUGxHUXZHSzBTVVZRM0ROUTNmMmxo?=
 =?utf-8?B?ZU40MEtuT1JKTWdvRVBOMXF3RXVWS0J5NVFKSFNjZ3FtK1d0V2U5M2F5MGd2?=
 =?utf-8?B?WmpUcWI2eGNYU1lZUkV6UFpzcUFUaVpoSFNranFRZ2h3SlQ5RXBoakpRLzhH?=
 =?utf-8?Q?cMoFoKf9h9svNTvZ2a7Zq34=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 036e113a-2e4c-4ea0-62e7-08dd815be0cf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 05:09:37.4078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ckmROuHUTjImuoSxzS81rCUf+8JMZknANG7lPEB3CORjWCO/16LjYarHDZyZsnDhikfRAPv3xE6oL92ZcwO9N/s/IVan9yvZA5srYk4Is7XmVHIPjS9ommsZv7H/OhB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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

Hi Karthik,

On 22-04-2025 10:35, Karthik B S wrote:
> Blocklist kms_async_flips@overlay-atomic subtest as this is an expected
> skip on intel platforms.

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

Thanks,
Santhosh>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/blacklist.txt    | 1 +
>   tests/intel-ci/xe.blocklist.txt | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 1afea1c86..5a563e84d 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -103,6 +103,7 @@ igt@v3d.*
>   # AMD
>   ###############################################
>   igt@amdgpu.*
> +igt@kms_async_flips@overlay-atomic
>   ###############################################
>   # VMware
>   ###############################################
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 506a6001e..541917393 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -92,6 +92,7 @@ igt@kms_sysfs_edid_timing
>   # KMS: Non-Intel tests
>   ##################################################################
>   igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
> +igt@kms_async_flips@overlay-atomic
>   ##################################################################
>   # SR-IOV tests too stressful or time-consuming
>   # to execute all dynamic subtests at once.

