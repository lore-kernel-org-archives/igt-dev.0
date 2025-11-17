Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B95DCEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 11:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A3510E1B3;
	Mon, 17 Nov 2025 11:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NONeFQXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527F810E1B3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763377823; x=1794913823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CCb+Y+7CxGleWFXeJP/IhkXtEppqLtmGRPo22uMQ9pE=;
 b=NONeFQXyOi6C1Fy269mZnERYR1PJp7Ys5K6ZvO6QpSKNa+5elHQw2giU
 JQhvLO+hv1wvc3KYAnLr6sMVT8fcLHrJ1PcUC2BvTiq+/hUO711fXlRBu
 0EoRHoUyoByL0MWYHh177CK/lQJa0skhNUvSRNvZP03enK4MPX0Eg2Tyq
 2PH4XIZl9Nt0ZHJp1H47Z73VZOG5zGgaLzVAlT6ukLBMzwSPxvqJbAk75
 vJL2jXup26h9glJIdq1bFootE7G+Bg0a4Y01j7p7Q/DTT/Jj9/h32zJWl
 NmlxNIo/rw0MyNy5xC5t592kYAxZLG0S5WCbxhUw76oc52T51p5GG8GcY Q==;
X-CSE-ConnectionGUID: l9CLr0ZeRrmCM1ukOVg3WQ==
X-CSE-MsgGUID: x7EOO3sdSFC9jx0aTscD2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90851555"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="90851555"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 03:10:22 -0800
X-CSE-ConnectionGUID: fCkBn1ZRTvKKrLGJ4oac3A==
X-CSE-MsgGUID: oI4g3HLWSh2p7u/njSkFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="221317470"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 03:10:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 03:10:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 03:10:21 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 03:10:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEFGv3twQnVedOV98qxX/jzpDAcwnih/vH7BKnvPOePMWB51dYzVPbpU/xHJ2fMYFJlVG8jnCkBlNKchzYREYbsPN6omzahdK4EKexQhvu/PeQQLdpZA8ugpdej6BpUcUh9n8ZP+/v9Jw6SErVHnuzjYNj+9410mBJFjRBTQxIKJ5X3aNfrD0zjf1dGXd3L771WWio999Pfgj12N3KkexjYpVYsMqbSJl7m97tQT/KwXqGJud0rAZRj3BWXn9Lhr/Lj+aE2Ty4YYyshQFMB0FO1aSwcFMdZpersMrnGxdDj8D//A4HS02v9iX5RXQs0Onp2yaxJF5MfP6dSEY5HAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jgc1U6cCBbZk7c4/dvQet/qe7KmOfqtWyunKro1JSVo=;
 b=Go13l464VHGhecvUjmys0n3O19joU1CKquZgmfkpJrxAiLq4WA0qR7Nwn6LK3MEe8pa/11H8uxf8m84NTVqQp6l2OgGCbl6eUg5/LjDUWOyd3Yy0NJQ7B5iJ5iqkYc47zzOmk5d7PJC4JQsq930z14sesglTtX3JxmSX58mX9DHkH0OBiCz7hMEAZ/TJXJTaT3O9ns2QvfM8sWVoKiEzOHLYzyLuK1/tcEwVUB9vMwH74pJ6llZB8D/BBUj0exIWhPtbyT3Lj/Zf0yZmKlPufKrgBFl1jzPvcy1638ddhkmhS17WRqSJTvNEmvL3TzNH+PotKxs5aly5tzg/elLEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM3PPFE8B1F622C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 11:10:14 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 11:10:14 +0000
Message-ID: <120e2ecc-5f65-4ee1-962b-18d080c717b0@intel.com>
Date: Mon, 17 Nov 2025 16:40:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/kms_joiner: Check DSC slices for
 force ultra joiner
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>
References: <20251016043157.691206-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251016043157.691206-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM3PPFE8B1F622C:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f033dc7-98d4-4d19-358b-08de25c9e1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2xrRnQ4cGUvTStpb09MUjh1T1k5SytRZC80c1VTN3QvMFZtL2lhUXVtb1d1?=
 =?utf-8?B?c2RzbzgyMFNvSFdndzI4dVBmK3NzcjF4SklFZEViK1Fnb05MQnBob01aazVw?=
 =?utf-8?B?dVlqdEZOa1E4N2FEaEJRdUVlYXowNEFYQjhScE1tS2ZDR1pMOFhIMDhyVE0r?=
 =?utf-8?B?b2NXWlcrblZpNTJVbElKa3JLRU9Hc2tuRE1MbEcwRERRL1E5L3ZsQ3AydFZZ?=
 =?utf-8?B?bktad1RHbDZyZGpuVnA1a3VncTZuQlRJZmdCSTQ5ZHQrN3VwbVZZL2twWmo1?=
 =?utf-8?B?Znp1ODdMZTJocjFBRmJNQWwzTC8xN0RtNTFBNnRTd1d0Q05FNzdvSVFoVmVX?=
 =?utf-8?B?RzArWkpoNHpVT0JtVkVNNytGaVYyRURnaThkV3ZYdXJqQ1Y0Q3BXRWpXUXF5?=
 =?utf-8?B?L3AyRjdEdUFIV25kaXVkSlhIUkp3VGJ5ejJGNzl3Yi93aElLK3hjaUl6Yitt?=
 =?utf-8?B?RnhrczZ2YXJsTXdtMzhucUh4Z005c21pTERFN2JET0pEeTRKZnNRVUFtb1FR?=
 =?utf-8?B?MFFialFxZ3duQUVEZG9nYjQ1YXMvTk5YckZxc3B4dGlRUWg1OVYxNVNTUVdh?=
 =?utf-8?B?eWwxTkMzcy9aZ3kzenhIa2hHWG1yVGdpSHlPb1lXTEc2cEk5d3FpWVRDM1I1?=
 =?utf-8?B?QytDU2E1VlRaaXhJa2gyT1A4aTBxdlRvMms1ck00a0haRjJseVZNY1l3MWYw?=
 =?utf-8?B?dEJWMnZZMy9meXNZRU0rbXJFUDUwQyt2bng2NXVyK1I4TmNrUDhFd3JQUS83?=
 =?utf-8?B?QVFWRE56UlRSMm5RRzFGazRZMkZGYUxqV2NTdjlIZnEwVW8vVU0zWFdud1Yz?=
 =?utf-8?B?UU1CWXJmK2dDUkdFYStXak04N2x1WXk2UmJvdUp0RHg2SlNEaTZjbFZwUy9D?=
 =?utf-8?B?NWxiVmZZWUtrY0NnVkR3Y1FnUFZ6dEJqOFR3a1hIR21Dcy9YNkpoM2pUNUlI?=
 =?utf-8?B?QVhGQy9BVDdHQzlhSFpDY3VuRmlBdlN3UUs0Rk5rbUk2RjJjZ295MzNRQm9F?=
 =?utf-8?B?czIwQnNPQzRWNWtVNmNnNEMybFRSMGZVNDRZV2xnN242RlZET2hRc25VQUxp?=
 =?utf-8?B?d1BtcjhSNVNpY3ZXWTVJN3BaWkxHOHZoL3RPT1hYb3pEWFdRWUVJemJvT2p2?=
 =?utf-8?B?eGNSdXhFU3BKOWtDSmszQlJ3NDRPcXptVVdxVmtWbDRqVjFhZFgwbHc5TjRI?=
 =?utf-8?B?ZFVuU25tTE5QbXZHMCtxRnJOd1pXbU1CR0x5ZXNoTytoVm83MGZTbW8yQWNC?=
 =?utf-8?B?NWkzMUZyK3hBSXlaT2FZY285eHFnNEFMb1daQTcxMk5WbC9sRnF6bjE3aEtV?=
 =?utf-8?B?RG1iM1U0UHVNSkVPK1VDcFhwYi9iWkMwUXhJRmxnN2VNL2lUb0IxcUVPOTRt?=
 =?utf-8?B?Sk5aVzBIbGRFeC9TWW1HUkhRVTlNS1J5RTFZUW50M0VjaFVjU3hTeU1YSnhn?=
 =?utf-8?B?WEVxSUFWd0dHSVlMdCsweHlQRTI4WlhyNXVwUEF6VjhPWkp5ak9yZkhrUU9i?=
 =?utf-8?B?ZWJQMWZENUYxeWVFaVJBaERvTkRJM3BSQkN2UmRkNm4zWU1uUTdBU1htNWZ3?=
 =?utf-8?B?WEl3SUVqcnJZc0hMZlJxTHZ2aWJJNVlSRWRNU0tEN3JNTDR6NDRyeVpGc0Zz?=
 =?utf-8?B?OWVNVzlXcnFBUlZqSGpSZFYxM01Qajl3MG42VjN2bEZRTEhpYkNHUnF5djVK?=
 =?utf-8?B?WXJhSGhYNkF1eXVSL3RMcDMvSEl3YzZnQmFoRXArdVNUZDA5ODZQKytMQ0Rh?=
 =?utf-8?B?Q1lvM0hXY1BpN0dndjZ2cHViZ1BFS3lNY2pOdk10QzY5U0IxQTdXNi9YcVRj?=
 =?utf-8?B?bmNMcGtmR1FBN01aUkRJZU5ObGhzeW1JZTFBSlFCMXVSN1ZTb2ZFTFkrMHRQ?=
 =?utf-8?B?aE5oQmY0eUMyOERjTGRsZzNhTUZFUFdDVTFPZm9ldThwZ1VaeHl3dS9haWZJ?=
 =?utf-8?Q?N99FY/pqv0b67j1BTwPgBgZEKhbrF53A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y21uSXBFT0ZFOVI0UXZPaW1oRHM5SkF1U29NZURETUVNcHo1M1ZWdG5zemtl?=
 =?utf-8?B?TEVpWjA3ei9qdk9YaE5BdEJSY1dNTzdlUFBQQkFzYVUxcnJOQ1ZCU054QVZ3?=
 =?utf-8?B?YnR5aHdlZGkzRXlFRllvWEgzbzZ1aDZScmJxNjJXNXFkQy8yS1BxZ2NSUllo?=
 =?utf-8?B?UisxMzhhR1JwTFZVdEJnUHJCSmdkWlZKMEtIR2xrSFVBUEd5WmFaWVhOc0M4?=
 =?utf-8?B?RHVmaFYvZWRHY004dVZBQWFKa2FwRGVUZko0NS9wV1lPMXk1OWhLVXgzVjd2?=
 =?utf-8?B?SjdGam1ZNUlORDdjZ3c2NWJyZFo2UloveHNTSkE0S0dGZnEzd2dlczFDWWZZ?=
 =?utf-8?B?WXpVREIzTWJTZlZwbDlQUTJFYXJvc1VKdDZrWmg0dE93NnBHQ2FBQlgyVCs2?=
 =?utf-8?B?Q012SEVBS1d6ek95b3ZKQzRacGVCRHRWVW10aVVDR1lOYXRCUWFRWHBDYlpq?=
 =?utf-8?B?SGtzeVdSbWd6eWRpTzQ0emtiMVh4L0FYUm5GMnZJNTRhS0Flamx0SjRoc05Z?=
 =?utf-8?B?NU9KSHFMdmR3cmZQT043eXB2R0NFejlnbDIrekh5OXpkVVV2M1BqcHoxL1Zz?=
 =?utf-8?B?V3Vwc2IzRmdGWm9KSkdKamF1bkgxQTNMS3BIVksrTXR3RTZ0QlRpbnR1OGc1?=
 =?utf-8?B?TFhLY2YzMTJyc1VrWHJwdVk2N2JjR2tDQkhrSHhLK2NjTmFHdGtlS3NPWEJv?=
 =?utf-8?B?V3VCcXNRaDFkcHhXeG1PM1kxVmZaQnpVZ2JkejhrVkF2L3pwUHoxL2k4K1FI?=
 =?utf-8?B?dkpneTVlUTMxaDVST3FUOHBaV2VmdTVVajZhQk1aRGVleU10VVh0dm5DR2gr?=
 =?utf-8?B?NzhFdENZL0pmSVhBNTlJVGZQN0JiK1dYa24wMG9WYlV6K0IxMHgyVzdoVTZ1?=
 =?utf-8?B?Z3pZOWVVWERQNUtTc01JZ0ZWdE10a2dHZ1ZrTFpQUjByQWswU2lqengwZFJE?=
 =?utf-8?B?WHZQTk9MNHc5NWYwa2dhSWozTStSTkY4Yi9oWlZFaFFyRERWRXh1SXJrdmNt?=
 =?utf-8?B?T3IyNFZuS0FoWERiMkFDQU9Ielhua2JPNDVvNFo2YmY5SWh2QmR6WnJsbU5X?=
 =?utf-8?B?OEdTZkFEVk5MT2ZXZmpidUt0d2hLRDdSNzhuNWlpaHlpeGVQVSt1SXEvekpC?=
 =?utf-8?B?Znp0cmRuaHplVFpBT1hrWW02anllWjFVTlFQV2FhVEhqN2VUZE9JWkh3UE14?=
 =?utf-8?B?eVVVY3AvNHVoWXhhSVBJOVR1S1pWVXpWSzZsek80aDJtT1lmUzh3Y2swSEZz?=
 =?utf-8?B?bE9XK2JlZHRLTS85bzZzSkE3Y1BoemhvUFBqaHJDdWYvbVNPNG9DelZNYWt2?=
 =?utf-8?B?TTliYkpoTzAxNVY4NHdqQjlXaEE2ODMvR3V2ZTE3U1VQYkVCamlaa1oremYr?=
 =?utf-8?B?Uk9VSFZnU01xd252ZzNZay9WNGdYc0t5ZHdicFEzVmI0MldoclZsdUNsU0Fi?=
 =?utf-8?B?QUsvVGFzWldEdmsvcVoyWEF1NWdFT1BBSERWc0hjQ28xSmxyRjF4Y1JMcnBk?=
 =?utf-8?B?V3FaRnA5WHFQeDgzNkdOalFDdFptekR1MFdnL0ZuSVpzd0tRODR6WWtkYWsy?=
 =?utf-8?B?Q3FJUHJxSVNVVWZveVk5ZFlsb2ZOaDN0SlVnN3E0WjZTUzI5RThZOW8zNDls?=
 =?utf-8?B?VGF4ZXpsSmNNSHpKcStrbEJGL2g4VXdMNnBkMllQUTlSZzRxZXNnQ3JrcTFL?=
 =?utf-8?B?am9ROU8zc2xYRHJyVzB2b3VEcVV2RHRrV0RIN25MVzRDTkVlcGU0bTFmNU5Y?=
 =?utf-8?B?RGdxdStvUG5SaE1mRWdaUFNPVGdFZFl4WE0xUldMVVFDaDF2bHkyZEJvWXpl?=
 =?utf-8?B?eG0wdjdGL0tqekpsdXVCUm1JbjlEdDRuc295bFUwMlEzSVo5anpleFdnY0d6?=
 =?utf-8?B?c2kxd2R2UkZwTzdNL0lwdWtodERTMCtna3ZJMWo3YkFZeFRzMUtVVFQ0MDNo?=
 =?utf-8?B?TGRXVUtMR2hqR1VnSlpKOGlsSU9PTWxGS1ZudGdRUmxFRFQzOTQ2YzVWdUJw?=
 =?utf-8?B?cmhYMU1Ta09UM1o4eTFmVFE0QUJMQVpzb2crT3F3em54UnBhdytvaXprSHg4?=
 =?utf-8?B?RDlOaXBickJzSVNESkpqZzdweGJNSjhiSUtsT3Bxb2QrNExCVk5PSlZaU09h?=
 =?utf-8?B?akZCYUhwMU9Wc291ZUwwanNCNHU0Tm1oVlVJOXhZNXdaL2xJd3FxWUpCU2NX?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f033dc7-98d4-4d19-358b-08de25c9e1ac
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:10:14.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/X3HaXGdl0FPg81VCeXMdBfGXYNwnswElu8nVYhDksdjDd0abKvX1/DI+BSjs4kqgQlvRdZNyEXFc5uWX1NMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE8B1F622C
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

Hi Santosh,

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 16-10-2025 10:01 am, Santhosh Reddy Guddati wrote:
> Check for DSC slice count before enabling force joiner mode.
> This ensures that force joiner is only applied when the sink
> supports at least 8 DSC slices, preventing invalid commits.
>
> v2: Remove local variable and check inline (Swati)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index d1ddbeb60..55bdef9fa 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -196,7 +196,8 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
>   
>   	if (ultrajoiner_found) {
>   		igt_output_override_mode(output, &uj_mode);
> -	} else if (force_joiner_supported) {
> +	} else if (force_joiner_supported &&
> +		   igt_get_dsc_sink_max_slice_count(data->drm_fd, output->name) >= 8) {
>   		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
>   							JOINED_PIPES_ULTRA_JOINER);
>   		igt_assert_f(status, "Failed to toggle force joiner\n");

