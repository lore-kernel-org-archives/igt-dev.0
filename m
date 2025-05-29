Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4D6C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 16:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AEF10E087;
	Thu, 29 May 2025 16:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCiyjPZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAAA10E087
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748534728; x=1780070728;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Gw5RsV9vcc6DeAhZgsCiMNHLBr123Xje8v3ZwVqoiQA=;
 b=mCiyjPZp1qYMdX3wK7viarxEv6fr7KkN6W2Re/8TKeCf+pRp47xoG4D8
 3fpHmVUqxTagwuUnrDFjJgyNCEM+hG0SII/oDhD+e6msyvKMPqc6QDcQu
 DUy5Bne6W3nkDoe/RQTfzSOGufph8s4lXa5D6N6nmy7Gb/0Ld0lEL7rr5
 c51mnfjmUh9R3bwBvoIIXw4aFqQ1G5qx7RANAT+XlwkfFQk3dN1Ur5mnN
 t5R0i4wbnYzl6XfSRLyU4dnAQr/tqyeSiEJdg+0BuA+gU9PW+dMoUrBVh
 gsuHbLTnhiW4CeE41lU9XYRMgA3/QF9Hc7Sozm5E+gwwYJ329XxO9sdTY w==;
X-CSE-ConnectionGUID: ddqiV5jFRTOLFaGdXlIEMg==
X-CSE-MsgGUID: GNiITjhhS2GuOBJ8w6t2zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61239636"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="61239636"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:05:27 -0700
X-CSE-ConnectionGUID: FKSAR7B9TnWET9EZlA3dRw==
X-CSE-MsgGUID: I4vlH8lcSXiohSCyw1HZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="174610673"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:05:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 09:05:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 09:05:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.86)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 09:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4GBS+6zL4rR7ABnIaE/ROMzxNk2Yvu+3zOBsyIBqLRDvUyDv0bvw5u0N0XAZFkziy0vNOOVr9vyFdNFDxztAFztazCJNt8xKkiMcNc1d4eXXhampxbHOJSpYpvIMDCILsOzT2yUHqguB0wvcrBVtX5kV49dA3f0izrlC3Tfqrv6uDTW/0lPIvqID6c6HS7VPA1XSo2jRVQSmtDZae64SgRPpJzyyVc+5waoP3jlDf1jATlb/7ZeF+XLLBe+Kk6j8EH3v+OKynN0x5EOcGU6ddpBYVAz+AoOuNxg61fN95GWHZDKNlbBR3fMJnbn6PYf9bAJlyLm9KNaKJoEUPEQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nm+utpLqlNS5pkSPE6DI7QdvKSFHellY4txhSLzQUA=;
 b=ha5+59CK1fihaxbbVBPQHsugx3tCdqkGHRvQckpCrnatVUErDZ7O3wuST/KnFvUqaNSg26fZWOM6quFecfvKSypv//PbTBxebAzxHAexTGBpR422ekIII3SpbxGUK/g4DfqvBy8Jw4u5Nsemd6EpM2wN69YLbzb1+qZI8jcBnRrBH5/UQhswc9VzqgkaLObFJxy3j5nUGF+vCa6Quh+6vKT96bH5my0x3FhVEnQ5X35knLmQNPvLpYNGWWR7j8vrPN5FMEm/KmgkE68mhYaVwgEhH3UR92Bl5jC1qXUIKBXklvPPfHqobNzG+Nq+pGssOT8rhUKH/Jc5n1HpHACAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA4PR11MB9417.namprd11.prod.outlook.com (2603:10b6:208:569::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 16:05:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 16:05:06 +0000
Message-ID: <3b05595e-7444-4df1-98a9-3feb72ee8df8@intel.com>
Date: Thu, 29 May 2025 12:05:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Fix typo error tab
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250528141454.2729293-1-zhanjun.dong@intel.com>
 <20250529122517.o63lxkk4jbgbie2j@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250529122517.o63lxkk4jbgbie2j@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0348.namprd04.prod.outlook.com
 (2603:10b6:303:8a::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA4PR11MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf90ef1-6669-421a-502b-08dd9eca9410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXJCVFFIN0VRR3Q3c3VVbE9CSzFsUGFhejdWWktpb0dPQkM5MzVsWmZ6Y0Vo?=
 =?utf-8?B?QXF6Sis5aXRZRHlEUVRKNzlxTW14RUpUU2t4cnNVY05UMll1cTB4SlJSWlI3?=
 =?utf-8?B?a21qUjlWY0FDWkFPUkNEZjlFVEVDVUdKdzVYWnRKYnMwQU1xcHVBd204WVNE?=
 =?utf-8?B?L24vOXpHL21lMldvSGQ3eHZVMDEvWnNVazAzUWMvOUtPUkhGTnlXeXp2azV3?=
 =?utf-8?B?R0FVMG1RSGYvU245aUJOSWNkR2xJMUpVajc3TDltWG9ZNklHUitXREdsVUhJ?=
 =?utf-8?B?bkdxaUhCK0l6OUtDVXlvNDJ0dTIvMy92dEM1TmFEaHJaYXpjUTNsaGtER01K?=
 =?utf-8?B?cE9NOHdWYWIzWENoU3VjMlBwRGFzczNxVWYzQkxjK29wMXJSVVkrTjlwV1ly?=
 =?utf-8?B?bkRmRmhoRytFc0pxN3lzSXE1d0E5cmZ1YUp0M1ZZSnBmdlNIS3FUQTdQdVhm?=
 =?utf-8?B?VFZXMjI3L0ZkV1d2aEs5eU5oSVNSZzZWbjV2bk1NcFJKbmJaYS9ndk5kT0h2?=
 =?utf-8?B?Wkx2dHQ5ZHJPb05MQkg2U1dQZzR6aWNZZmh4VHpaOVZ2TitobE10TTBYbGRl?=
 =?utf-8?B?d0JvemxROXFadENCRzZjUThkb2dyL2dac3ZGOGdBR2FpMWYvYkxPc3pDdEJ6?=
 =?utf-8?B?SmhNUXh0L2hEbS9tNEMvY2wvdlRDeVYrNE1iSiswNDZGM0ppYzJQTXpicFJi?=
 =?utf-8?B?cVZVeGd5SjRmQldJYW5jM1VJWjBOb3RKVURWOTVXeWhVZU8rQjV5TWtTZDRi?=
 =?utf-8?B?MklLVk9wU0pyRU9NWUZjK0YrbW1vUnlNdHFHM0dOLzlGcEI5dFEraXQ2L3hB?=
 =?utf-8?B?bjl2dHRNaDJ2K1I4TWJBdXR6Zjd4RWdDUWxsc0xDQjBOMk03VXduYlFFdzUv?=
 =?utf-8?B?YlBpQnlHb2RFT2hHR0VOZllONUhSRnNoZ3FWVm8rVjJ6RUhBdUZNRU1rUlBK?=
 =?utf-8?B?RDZCMUdGZlp0cXpjcUdCQzNraW0vSFM5R0VINUtLbExFOE10cHczVkkvY1BT?=
 =?utf-8?B?U3I2R2l1bXFnQ2p6RFhTV2RpMHV0RUZUeUVTMXVhb3ltY0JwV2lkcXdOeUFh?=
 =?utf-8?B?dlBkeXpWeXZrcjNHekZkTzJQc2oxM2JpcFhDVU9lWEZjUjFWWXFOTEVWOEl6?=
 =?utf-8?B?NnJTdWdEQ0VnYjBMbGtUa0ZqMFpIQ01sMEdIQ2tmQlNSM1ExWFd4ZC80S3pB?=
 =?utf-8?B?Z3U4aDM2N2VqWHVFR3NybFdSNm5wYmxBdWhXenBEMVREZ2ROZE9RdjVaVDNH?=
 =?utf-8?B?ZS9lRlB3dnloNUliVS9MM3JITFkzV1JHc1RLV1VKajl2em9RQy9zUXV5REly?=
 =?utf-8?B?RUNiWUZOYVhOS1RHUDhGU1NZN3YvZ3FVUUFNVXdYbTQzbjZsZ0twaDNubGUr?=
 =?utf-8?B?LzBlaWFDQXFGRU9ZUkhyWGJScFMydmJGdWIxeUZwOXM2N0gwWmdSakRQOTZB?=
 =?utf-8?B?KzFCbHdnVXBwaTBFVWl0TUkzRnJSSWV5S1paTjVIMFlTT2U2WnlEUGxYSS8r?=
 =?utf-8?B?YUF0eXY0UVhWWGovdFU3aGE4ZWxTRjFVVEh0NWxGRGxacmNZeFdMYWI2akxB?=
 =?utf-8?B?K1ZWZFdLZktXNEE3R3dFR0w1ci96SWw2RHhQYXQ5WXFDcmdpODBTWUFJS1NT?=
 =?utf-8?B?MFBmeVZqanFua0tnRTdrZm1NMFU3RVU0bCtzMVNuNCt5RHpXa2taMUx3bWxI?=
 =?utf-8?B?NXYwcVRuMVNpZDhNWVRGVFNXa3MyMzBnRHNwaThKTDk1bnIxbEwzZGI1T2FM?=
 =?utf-8?B?Um8rUzBhamZQZG84RlJjQVczbzdvc0VRM1A2QjM1ZkFadDR5MkVCL2ltNm5D?=
 =?utf-8?B?UWdNdmFCdGM0eXc4cHlFUjllTWN3OWJPUWV6NEQ4QVVORitHUEE5aHVEaE4v?=
 =?utf-8?B?VHFCZ2RWQ2ovaDlxbUNLeEhmeDU3T2d2c3lFQ3BFSHFkcm14YzAyWE5SVW5F?=
 =?utf-8?Q?P2QSDAv5tP4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnlGc1N6aWxJVmlVTVh6anhDZzVGWUN6ek92a0dvbUx0L2JDVFZNaTNyM0k0?=
 =?utf-8?B?MHplMlZZR0dJTUtMNG9qTy9LWEhUZGEwMzZVUGZqWFlpd0kzWnM1NE9DZ1lt?=
 =?utf-8?B?TTRzdndKZDJKSXd3cmpFZUNJTnFIdjk2T3B1Vms0ck5ZN0lWN0dWWlRvTHNI?=
 =?utf-8?B?WEJpdERvWE5nMm55WTRRbm4yNHJzdkdXT29NWUpOekxXTDd0OFJmekxOWkRF?=
 =?utf-8?B?NlhXSzdZY2hyRitVVVdud1MwZkNzY0FORmRtd0tKU3N1dGlLQ2FTUVNiY2JL?=
 =?utf-8?B?UDJzS0ZVYVd5R2dqVXJHTzBCY056dWxBMFl2SFR5WTl0WlpXNTBwckUraWhX?=
 =?utf-8?B?VGpvSUF5MHExNW1UT29kYllOQUJRNlVMaTh3Wmh2T2JYSVord3hqYlR1WUFY?=
 =?utf-8?B?L2dZYTlpNitTTFUwK3ZOdFA0NHZKRGRNUkpsc0lQMlhNenc2bENtYXY4SC94?=
 =?utf-8?B?NmNIQ0NOU29FUm5YR3hjTzRuWkFFc1FlQmJ5azllSjN0RkNrUjdpeXZtNThM?=
 =?utf-8?B?bkRrcHpyU21NNmV0enBwWmUvZUp4ZFFGemY3cjMvZU9ic3o4alB2dm5QYWRG?=
 =?utf-8?B?VDExcXJmTTNuOC9tUDM5NENWMXE4dDkrOHlGRDVCLzlQcnNiVjJGb0U5YW9i?=
 =?utf-8?B?QjlaZHo1aXN4bHBiQ3dBb3pFaFEvSk5ROW1JNU13NlpEQ2poSE1HVm54cTBQ?=
 =?utf-8?B?VVg2NEV5ZDhZMEZTWTRWU2doeEFvYVVka1RxRDF2Qi9Qc2prTWNqWGtONEdM?=
 =?utf-8?B?My9PMXVDc28wTEJhUThYQTdBcEdXTWNSWkxDWnpOeGVEOWE0dUFzbjFBQy9P?=
 =?utf-8?B?TUpWSysxWUtKMDg4bGtORmJIV2syVmJhZVZQdTBQNFJKM0FZZ2RsQlAwZmlV?=
 =?utf-8?B?aTViY3NZckFQR2g3eU03STFia0RtRjFyK2FEWkVQdlU0YVBGVHJxTDVxaHNr?=
 =?utf-8?B?ZmxTMXdtSkR0L3p0MTRPa1NsOE5UelIwOHRmYW1kekJGYVE5V3FPWTExZkVZ?=
 =?utf-8?B?NWZaV3A5dm13U1RJdVVGNjNCeEVPem5lZFNxUFIzMW8raXhLbGRYSDJlT3pL?=
 =?utf-8?B?RHZTTmZxOS9TYS9VTkU4cVpkUVJpeTdlWXhVZDUzK3Rub3ZvTDF2QUtRM0Nn?=
 =?utf-8?B?TlR1TlNBT0VxY3E4ZFFEUVdubWl5dEM1MlJzV1NwVmJvd0JxeU5PUkdTaE54?=
 =?utf-8?B?RXR1SzFaaklaU3E1YnVadDcybHl5SS8rNkpZd2lxN2ZnN2oyTmVwM1ZaOUEy?=
 =?utf-8?B?d3Jsb1k0Ti9OMUdVMldMQmhpSThCay92L1ZyNFgzc2xjTEo0WWh5YUNnOHRX?=
 =?utf-8?B?WTRobWN6V0pJS2JhWkNoL1F0WllIS3ltS1g5WDgvellDWTlDSEJoRGxRa1pM?=
 =?utf-8?B?OC9POHZJcGQwWjZtT2NqUXp1VEJSenRORjRvR1lQaUkwTlVJcUV2dk1oOU5s?=
 =?utf-8?B?MDg4VDVyQUZHdTllcVhMQWZ0NmFPOEM2bjhmMTQ3ZjRLWHh5NGNVMWRWTG5p?=
 =?utf-8?B?bmZ6SGdOSmFCWjllbVN1SVJyTU84OGVwbWpDM3dKS0ppemFiTWJ1OFBQdCsz?=
 =?utf-8?B?elVETmd4dnBEVTdmVjJSaDR0M25HRjNHUmYvY1gzZHg5Mjhld2cybE5Id2Q2?=
 =?utf-8?B?VFZTYlc3WWEwcEEvK3NjMkU4c3RETUhEM2MzWSt5MW9NRHJBYVVsR0VJanJL?=
 =?utf-8?B?K0szeUs5ZWtacGV1SEV5UHA4dzdsYXJDK1grSDlvT05ac0poTUdmODVUd0Nu?=
 =?utf-8?B?M1VHWEorRVgyMVVlN010Q2RrbWJnTDNHZmNXMy9adE5kbmZNMW51SmhheDg4?=
 =?utf-8?B?Kzd6Qm4rcmNISENEdWQraHZQOGJwVUZScHRCblRacUtsNnlQdHpRVEE4bFFV?=
 =?utf-8?B?a0FvbmdIYUYrMUY4cHFHNjVuTkdyUWEwT3hUbGxkbDFYK0gwTkNMYXNDdmxK?=
 =?utf-8?B?bmFuUmg4dk5oUW5Wdk1FK1hzUk5EcHhiZmltWXE2WGJhUEV0T0pRaDlSNTZO?=
 =?utf-8?B?b2g1NWkwY1lxUW1POHlBUE1GQXMrSE9IY2c1TmpEMUFmS3BiOGVSdXZzMTh4?=
 =?utf-8?B?NjhOMVJiR3dsa0pheFB4WXh6OHA0eTJkeDN4Y1hFWThJVWY5clB4NzNMaTE3?=
 =?utf-8?B?TW5weU9UdElyRmZVdlFNOHdqaUNkWDBocDdnMW9lNC9Xc1ptblhkMlNGVXNt?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf90ef1-6669-421a-502b-08dd9eca9410
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:05:06.2983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZczZhH4bm9p9mPHnYHo904mC2bnH8o6H41dkrhg6jqafB5gKe+/6XVNGOSPuK1+vAVv9kfuWnJmzmHSJSUJh9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9417
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



On 2025-05-29 8:25 a.m., Kamil Konieczny wrote:
> Hi Zhanjun,
> On 2025-05-28 at 10:14:54 -0400, Zhanjun Dong wrote:
>> Fix typo error <Tab> to <Space>.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   tests/intel/xe_fault_injection.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index f9bd5c761..9fe6bfe35 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -83,8 +83,8 @@ static void ignore_faults_in_dmesg(const char function_name[])
>>   	if (function_is_part_of_guc(function_name)) {
>>   		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>>   		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
>> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
>> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
>> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
>> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
>>   	}
> 
> Nice, maybe '\t' should be replaced with dot '.' in igt_core.c function
> so it will be ignored if someone in future will made similar error.
> 
> Regards,
> Kamil

Thanks Kamil for review this patch.
For these 2 messages, We already has one "." before -ENOMEM,
"Failed to enable GuC CT..-ENOMEM"
Normally 1 wildcard is safe, but put 2 wildcards together might cause 
unexpected matches, like
'Failed to enable GuC CTB(-ENOMEM)'
to be matched, if we have it in the future.
For now, I don't expect these 2 messages to be changed.

Regards,
Zhanjun Dong>
>>   
>>   	igt_emit_ignore_dmesg_regex(regex);
>> -- 
>> 2.34.1
>>

