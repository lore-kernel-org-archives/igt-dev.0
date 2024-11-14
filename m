Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0A1D65C42
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0974710E797;
	Thu, 14 Nov 2024 06:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUr/Q0pY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD9B10E794
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731565351; x=1763101351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iC3KqglNKNXySlC0Xb+hcG7lg3rQUJNhuamC6RiBGok=;
 b=cUr/Q0pY9bgSJVKcue2bqH6NLVbgiiOFTQ9kiZrUm9NdC9/y1vJcUE1N
 CF39x2airvDXR1Ch/hGXOM5znGgbTVnt4VA9juCGm1Wv0Kp9yDsu/3d6i
 cHaYv8N0rDGAqQBM/TzbkS0Mbgg6Wtn49Aflyj6leoKWrzdv5JPBPs3GR
 u26BeJi6qCrxPZvq9OHpYUSPJmoIX6KbFxDoLEWlQ5ebbbNEB997p2lyc
 6v+vItqFDkqWhsKZer9lOi5ecCh7aluUeKIkiKrWZ6fYAukrwB9ktAcAN
 XaFcwzmgLDIGXrciX61PmaB5uk/ltEcZSmueRjXEQXN2AlkOQKz77xXCq w==;
X-CSE-ConnectionGUID: wL51uztXTjWL4I7kh7pFpQ==
X-CSE-MsgGUID: 5T0BTN3mRUu44PxZh932Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31726963"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="31726963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:22:31 -0800
X-CSE-ConnectionGUID: 9A8r4Vf0TaGFUAjx9IohAA==
X-CSE-MsgGUID: wNvYOR9tQKiRAB0iRnbHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="93043058"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:22:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:22:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:22:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCi42LhG5EEM/F7f4jkIbwNShPwl0zy/qsendWjB+rOBy4/A5h5ytuyC5v2200e6GpHjtJ8Fz/Yhq40W18bSXjEklLnG8b/XeVDHxnER1xOYH9aU9KRcfWvGY+/8rrMCj86cT1ChBgvTU6xZdAVxZQSsjJ56v83wrX2JgezvFLOOIoIxNtvwVL7s92/7UvpXMJuTQxb69uHC2ZfTVKBnbHCvkOHfa+0gs5z226DreInxqIc54Ocz0vFgpiM1+ZjPisSx7OgUhE+60/83OrU90iMpDZ3/c8zriuEUW1OtMUf+CNWKFK3ERqImS+JuZaRLvAAZHo2Jh8ywZRVmvOqksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjlutfM2mrFfq8YwEjsm9qtwOsrFUNen2dzYtoYRKAA=;
 b=QktSJQmRDfFrVq0CKYGnTYlVdl2lBVPXJRJEwufOPku76KJmE8BcGOgBavKtqyR+qgOKAbFvfPUXCvy7S+EiGahJ65eYy6lbTJdBi94/Y0daPB/bXSJu0Z15SgNqYmxSEmI4eLKDPjindRH5sUbDyiBadfMezqELHBGD/Fnc0prfTWwAksZ/OGDczLiG1luM+w8MkVETuGiO4hv3FR/8gE2rEcT0e2fz2YowKLRS/plhKI1WbWyXNF3jZ3krhHzVPPJQ5e5vl8biRDEQ/faRDZ3QJNipJLw20SsmM/7ksgLtMyZcH3RheIAPHux99e4y8i4KLr4geSLk/EGWe4JHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:22:22 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:22:22 +0000
Message-ID: <1c085de7-2afc-4892-9f79-d9c471272c42@intel.com>
Date: Thu, 14 Nov 2024 11:52:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_async_flips: Skip Async flips on
 joiner output
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>
References: <20241023031620.3632362-1-santhosh.reddy.guddati@intel.com>
 <20241024111105.2261777-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241024111105.2261777-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN2PR11MB4550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5edefa78-1cd3-48b3-a1d4-08dd0474b31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTRSRVpXdWtmUkZNbG9MK0lJaDd0emc3Nng3cWdXTTJWbzFkRmdZT2RISHVW?=
 =?utf-8?B?RmhFZVljeDNtdzdpdE5NSHR2RnhJK21PTGtJcklrQUN5THFBU2JlbG1aTmZs?=
 =?utf-8?B?dmFPalJ5NVNyODJKYzd2VjRQNlFuMnNNWXJRRFlFYUZvZm9Sd1NQcU9FdzMw?=
 =?utf-8?B?SGdCajJrczZQa0NOblJEZjBlL3c1Z3AySEZoK1JnTlE4VE5hM0U4bjBHZ25N?=
 =?utf-8?B?QlpPdVA4TXpnTkl1eXVvU3E4TkkzNU9XL2J0T2RCS3loaGpnQUp2Zm9lbWtx?=
 =?utf-8?B?V0crUDV2bDh1NStJYlk3UTRsNFRleXJVYjJMcmtVOUxkd3A2YkxHZHVycHIx?=
 =?utf-8?B?emVTZnZLZWNyaHhMTEErMVljUkZPZmV3cVQybUNwTlRmTmNDanU2bXJsVDlH?=
 =?utf-8?B?bnh5dTBCb0d3bmhYMVBMYjJHRWZ6YzhVWG9rdDVPTDRiQU0vdlIyYXlhSHMz?=
 =?utf-8?B?RGZ0bU81VGd3UVlxYnVBVmpDU281TERsbEl1cE45MlRLWlJHUTNFUGMvbHdX?=
 =?utf-8?B?NWlXSUp2ZHJlcUkra2V0bll6YmdhM1RBQllZNU1TczA4Y0lRcm1kbU9IMlNy?=
 =?utf-8?B?MFM1cjhGQTVKZXlRUHBKYmtMYmxUTVB0Rk5lSVdnV1NWNUZxRVFSb21jU0VK?=
 =?utf-8?B?VnRuR3VaL1BTS0tnTGxVTmVrb1FEQnJaZGxlQ3Rkbm1GMWRFbHlKQStRNGwr?=
 =?utf-8?B?QVFqVDAyVSt3UEpVajdjakJGOUUwTHNLL0oxdm9teFlJUXBNZ2drdUozTHpN?=
 =?utf-8?B?aDJHVkRibzhQSDFYWXBqU0V6bE40ZmpnY0txMCtGRElkVERBc0RIcE01QVdx?=
 =?utf-8?B?VE45cXRTcVdZNjM3eFlnZk16WEF1cWIzbzhHdXJvYk9LYklvZmFTM0hSbk8x?=
 =?utf-8?B?bVBHek95RUJQY1kxUUM4ZFk5NVNjT2F6elpuQnBQZWh0SEZuT2RyK2RqUVRR?=
 =?utf-8?B?VkNhM2o2NWZCNHovVFluWmtJRDg3MERPNURlUFFTaHpZUDdjNURJVEswaDFH?=
 =?utf-8?B?aTJTeDlXSjRESXNWRUkxMFlJeUwraHl5d1hiZWFRbjBrUVJEOGYwZ3IxTUVY?=
 =?utf-8?B?djBMR3J1RVJGN0VvOWdycjVzTE9IWW16aks3Vjc4SkNqbjJBV1VHUWZKVlZs?=
 =?utf-8?B?TnBtcmx6V2ZVcjFlQ1dURE85OE9DNWswWFJqZzZMeGJhSzVwU0x2WjY5Rnpj?=
 =?utf-8?B?Sk1VL2RXenV5Uk41SmFSMllJem1Jc2NkOWk4SzErWk1KcExBbmtaS2o0dXRw?=
 =?utf-8?B?YUppeXBqT0hkNHZYQUdtcWFoT205OE1zdmdRRDF6NlV5Ry9yZVFOOWFWeUVV?=
 =?utf-8?B?dmx2bS93Qzl3ejAzN01oa2wzcmQ3YVFOakdQSzZyYVBpTlJlZ0pnNWtRZ1l1?=
 =?utf-8?B?NUVTVURoMHNiNE55L0hYclg1TFBjdnpUR0x1dlIwL0xMSDhSUm4wWmkwY1o2?=
 =?utf-8?B?elZGQkluakVCSHJFU1RCajE0MTJOWXFEeGphREpPY2xYdFU3N1VYbWpZMHNo?=
 =?utf-8?B?ZHM2WGVWOXh2aEc4MDBUaW1sWFVWWlpxK3dNYXJjMExCRGlsb2hvUUplM042?=
 =?utf-8?B?bVZBVzliODlnMHFwM2NBb01YbDhUNHFlY0E4ZHdDU2JIaW1OSFdmTTF2UERN?=
 =?utf-8?B?QTZuSU02MEdaVU5HY3Bva0UyWEFrdElGNWJGbFYyR2hrbXBFV0NtWGRhejNV?=
 =?utf-8?B?bk1TZXhhZ1plTlQ3VzVNZVpWTmwvVkhuZmJ2bzZPR3VuU2JWbW9HaE5CNUkx?=
 =?utf-8?Q?t2XEFAk6qarkHUwD3rIBqB99ny9n/GBcOKTSvm1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhFaXVoM2YwTk4rYkJkQUxwMkVOQjZtNU96Y05FbktHMHZlU254czYrcng4?=
 =?utf-8?B?QWFqd3JBTTJrK3R1MURpcEhxOGNoanFKMjZqYU5SMEViYVhRaGpZWkttU0po?=
 =?utf-8?B?K2phaERPcUxENUxIdExTRTVLTVpueUVlYVNINGtxWXNIN1BvdW9BN3JVNXQ1?=
 =?utf-8?B?SkpBbGNDTTh1TDJvQ1hZRFgxQWtRY3YyNlJBRHZ4bjdITnFGbjAyNGl4Qk1R?=
 =?utf-8?B?L1kzYWNZdDl2NXdXbDhDTEUvYWptTzk5am9id0FaRHN4Q3BESHhTRWZMbXNi?=
 =?utf-8?B?OFRiRWc2eFc1dlhCNDR2TWlicWtNbm9VcjI2SDhLdE1mdS9HMk5vNGZiTUpq?=
 =?utf-8?B?eGgvSkpoRGJGeEpwNXR6VWhzVTNLdHFlUGZqemdhZ09JM3J0N1RZR0NwZFhs?=
 =?utf-8?B?VWJHeXErenV3bTFOR29TN2pMTU5OUU9pTVdQOXA4clFMNk1lRWYzaHhyQjFp?=
 =?utf-8?B?R3VmdXJMbzdld2hGY1hHUXI0UkhwUEZGdWxuR1h2bGErZFplYzhuOUNYblFq?=
 =?utf-8?B?R1lNd3lDZVdpcmI5SFZTemhZN0ZNaDRzcU9JT1hQOXQrWHZZYVdCNUgxdFJQ?=
 =?utf-8?B?NWpiRVV6RGIyRWZuejlQeC9HVFl3bzRwam53cjRweUJzRHlNZjVKd2lTUk5X?=
 =?utf-8?B?elcyUVZReHhKWU1hVjNCR3NNMkZDcGpEbXczcTQ5VG1LK01QQWhSZVJBaXJq?=
 =?utf-8?B?Q3g2UEx6eWJxdEVFaUxEZkJzQVhtRVBEUGdxZXdyci9xY3Z0RXJLZjh6bko1?=
 =?utf-8?B?WVZzN2hscit2S0I1Y054NzhHMXBma2hxQlh5M3VRaXNFZjdrZDlMWkFCcUtF?=
 =?utf-8?B?VGloeFJnTENWbVBsRzhzYmhwK09lejR1Tzk3OEZvRDF5dklHWXdnakNtaTlL?=
 =?utf-8?B?aktyZW1FWUp5bVEyZWxneHFmdCt3cGM0T2d1MEpoSGw4enRMeTVNdWd2bXc4?=
 =?utf-8?B?ZHRHYS9DcFNkTWpOMjV1VHJQeGNzSGxvQitwbnZQMnpER1c2TGpWZVpvZ1FT?=
 =?utf-8?B?R2MxYldyVTZFL3dXTWVxL1JvbC81U0lzVW5mMnZFY1NlOEJ3ZW5KNVd3OHBt?=
 =?utf-8?B?NVk3MFRpM3ZqenJCTVh4RUJ0bmpPNFRjU2dyL3JSa1NyOU1HcW13MXJXQmxE?=
 =?utf-8?B?NTFzbm9hS24wbUVyVDA0LzdueXBmWm9HdUFlUFh1TjlEUWx3bGtLK0FFb0ZJ?=
 =?utf-8?B?RmRacmpadGR6RWh6eXNaMmxwRXZCQVZJQU9qSXpMRmZhdU12Q1g5eStRdldr?=
 =?utf-8?B?ODhxZnk3bGoyRW0vTWhBb1gxN1dlSVovQzJUc2V2ZlJaZVNQMkYyRWFFZy94?=
 =?utf-8?B?U1llbzd4R3c5YTRkUlRIUXVXWWdDZXUwTG5IbUhQMDN5NnBkYUkxL25vYUJk?=
 =?utf-8?B?dU9lcm1wNk9ERmlTVHREdkF5cXBOMHFZK2N0czdueTdXS0c3bW13QzBnYXFo?=
 =?utf-8?B?akpscnFEL2h3YWpSbExpbHB6NTZzS1ZHYS8rS1N5Um5aYTBtdHdrVGhtTzlX?=
 =?utf-8?B?b0dnMHdDcWhTc3VaTldNZDVWakN5bmNGeDEvVTVFZjNsemUzcXEvYWNmb0hF?=
 =?utf-8?B?eHVvMnlGQlRFdUtmMDR2ayt5WFFIcWlGK1NZRWdzSlZRV1RSSjBBZk1ET0ZU?=
 =?utf-8?B?bndRdkd3ZUJUK2ZqNGZ0b0lkSk5BdFFDR1o4NUczS2tBZStlZlJxQkErSVpo?=
 =?utf-8?B?VXhtMW1JTTlUSXZwVzN5NFc0UXZQc2FyQThpTFRBZjY0WDh6bU1iUzB5dnVN?=
 =?utf-8?B?bUlzcld6VzQrTU4ybUhYblVvWjE0ekh2UTFBelRJaG0xQUpZeUoydzkvMFFn?=
 =?utf-8?B?WXhRSjNuMFM4dTFaTXVKbDFqRU1oU1VDZVVoTFp2YlJvSmF6Qyt3OWwwbURn?=
 =?utf-8?B?ZndiSDBqY2hkU0p1VzJKMnRaR2h3ZGZqMnQ5SWxIV3pwNkl3amdrclh5NU5T?=
 =?utf-8?B?VzF2QmJlMWNQM2J3Z21HQXFCNjd5aEprb0tpTzZ1ejRKZmZTVDdaS3NETXdC?=
 =?utf-8?B?U09hRFFJRFBnUGxxaEYwVHZtbHFJaUJ5dW1LUXBVZDVMWTh1cUhaM2lveHcr?=
 =?utf-8?B?S2tVc05XbG9QbkQzS0UyaFpUTlFYM1hKNmM0RmRXbVMwbVNqL1JHc01aaDN6?=
 =?utf-8?B?TWlGWE1GdXU1N3Y0Z3Jla2pqVXBQcWdUbXpsRlhGS0FUYXltaG1hRXdyZ3dm?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edefa78-1cd3-48b3-a1d4-08dd0474b31f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:22:22.7559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 643IAHM4YyCuFrKHDZyxrdmmCMUQv+zrh4TnhjlFN0AwJVVCrOOwPvYHCy/jI0+31GGuR5iARTt789cqPPl5wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
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

Hi Santhosh,

Sorry missed few comments.

Add bspec no. where this condition is mentioned.

On 24-10-2024 04:41 pm, Santhosh Reddy Guddati wrote:
> Async flips are disallowed with joiner, but the test commit still
> goes through and causes failures. Update the tests to skip on
> joiner outputs.
>
> V2: Skip tests only on joiner outputs (Kunal).
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5dec71291..77f68b773 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -638,6 +638,27 @@ static void test_crc(data_t *data)
>   	igt_assert_lt(data->frame_count * 2, data->flip_count);
>   }
>   
> +static bool is_joiner_mode(data_t *data)
> +{
> +	bool is_joiner = false;
> +	bool is_ultra_joiner = false;
> +	int max_dotclock;
> +	drmModeModeInfo mode;
> +
> +	max_dotclock = igt_get_max_dotclock(data->drm_fd);
> +	is_joiner = bigjoiner_mode_found(data->drm_fd,
> +					 data->output->config.connector,
> +					 max_dotclock, &mode);
> +	is_ultra_joiner = ultrajoiner_mode_found(data->drm_fd,
> +						 data->output->config.connector,
> +						 max_dotclock, &mode);
> +
> +	if (is_joiner || is_ultra_joiner)
> +		return true;
> +
> +	return false;
> +}
> +
>   static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_display_t *display = &data->display;
> @@ -653,6 +674,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   		data->allow_fail = false;
>   		data->modifier = default_modifier(data);
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
> +			igt_skip_on_f(is_joiner_mode(data),
> +				      "Joiner mode found, skipping the test\n");

Can we make this more descriptive? Something like subject "skipping, 
async flip not supported on joiner mode" ?

>   			test_init_fbs(data);
>   			test(data);
>   		}
> @@ -674,6 +697,8 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   				      data->output->name,
>   				      igt_fb_modifier_name(data->modifier)) {
> +				      igt_skip_on_f(is_joiner_mode(data),
> +						     "Joiner mode found, skipping the test\n");
>   				test_init_fbs(data);
>   				test(data);
>   			}
