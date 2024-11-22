Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C21D75E57
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91D510EB96;
	Fri, 22 Nov 2024 14:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZmsRlH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7210EB96
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732285795; x=1763821795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FaUelksle3Odm9D06TAZR35OPN8XonJcDDh7WEPSP84=;
 b=KZmsRlH+Odf/oIpLMeWAcnSPxin5zrBdl3XrF8N9stXEJYxCOhkY7Frs
 r8BOl4ZV8eediCub/DajaxA5tm1WkSwXwB07lX/pmJ157uUFUqoEKGdUe
 /vxvwhHCPzF++5PbE18pUGQORvomQyPwoXNAaYQ38OzLDkytwMzGxdVhx
 l4xuzdnGgKtKZf2Q0n1Emg9oPPxMr8EAKYhPreuIYoT+PqYOndPTWb2ZX
 0jwp4ikB4jVpyEt9dlUT0f5nOipQcTkl84jOWNvE0IggaqUSpagx30AiG
 rINr4Gi3rqKCkZhTTxgraa/pxKfPd/u7Tx3AYsTRlmEigdOhMv9ZrvUYe A==;
X-CSE-ConnectionGUID: eVZmXWwYQXqwZG8pWz+uag==
X-CSE-MsgGUID: l1k+qnhJQa6K7b7MXgMIKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="57844329"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="57844329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:28:55 -0800
X-CSE-ConnectionGUID: RgvsSq6HSdOTfBgam12uLA==
X-CSE-MsgGUID: Mf8C/qwXRyCKVEY1zbSrog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="91004612"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 06:28:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 06:28:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 06:28:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 06:28:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC1WveTX/Bxut7HLETtXxRwXC7nh2GMkkxaRv2T3yWfkz7U1LsBxsMB4cnj67RlBjyjvBvnuZp6nC2WE8ufyabWEKnZ2/0pxyaF8FptsJ8o60HmP/gAsV2KrCgznnVzjKKmHi6D5ooQ2vpnavCHPcC8w+6uXT01kN68mV7b6w9nL+b6R/E4JcrF9gZKh0cUsxiwJY2R/ev43dtS190DmQwWeVn70kPaJHP4XHruJ11IMpDYjM+Fm+OfOe2jX5VUDs13r1Rz97S5L9Xn/gbRbPGNUnggUipvnEWx34psDLsHOz8CH3Q7wlPBdOhOO6qrUjN4kxwT9of4mIpUccIV9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLPh9mEwAYfx1OIqXa8Ku6H40aiNF+t23WDwMqGknf8=;
 b=nayJgotiSBowdFpRkRUr2LMqIptJGvtp5tsb6hiJ2q5O11rUGZKmu4UY7ySmbH2t2eqWXijA1ENv6Ak2Y/3sx1i0AX6/WvpLWY+HRREfmcBpy+tUIHm9Sc9bCgffdEui2TRdwe2wWeRW6gCwMJts7xByE1ttZW0G48XRN7UUIOorgAWRuM1u8DVgGWphVJ5+eZ97SOBPT9wOX7ZQzmrUb7rY89q3tPndNqeoXlTjUH90OjofClNcUXJvRZIJCIOBzt8/culMyxdTUcBuEQsx8Yt5HIAQsTJvoT+x99bUNCz4egp8OyqtM+Ee7TklbZmxHy0U8ozNGzei/TvEtErjBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 14:28:52 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 14:28:51 +0000
Message-ID: <546ceac0-ecc6-4d9f-a09a-ebd5205fe384@intel.com>
Date: Fri, 22 Nov 2024 16:28:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/gppgu_shader: Add write D32 to ppgtt
 virtual address
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <christoph.manszewski@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-2-gwan-gyeong.mun@intel.com>
 <119dcb83-dca7-446f-bd0b-d028c76f54c5@intel.com>
 <b4d29d9c-b828-46c6-abcc-313f6653cf16@intel.com>
 <741fbc09-652b-4ab3-a6ba-699f9ab5b900@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <741fbc09-652b-4ab3-a6ba-699f9ab5b900@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 919e8c37-f1df-4711-e2f9-08dd0b01f4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0dtd3Zvd1Jtb0U1Rms0b2JzNHcrQTgwcGRDU3Bvazh4NklQN0dtMUw5bkk0?=
 =?utf-8?B?WkJXWHlRZGc1Sjk3dlBRME5kVi9TVnkvNDNMMWl4NmxSMW5aazgyUVdFU0xG?=
 =?utf-8?B?N3Boc253SWhPb1E0TFJ0elUwZVgzQW1vT21ueTVnZnVjZ1FNTVgvTmdqdFl3?=
 =?utf-8?B?cjZzUGx6cWNObjBnc0NGYUFKUUdobHhSa0JPRlByOVBST004aWEvcWlpdGRr?=
 =?utf-8?B?TnpZdXFSUHllRkdSdDdSdjhFNDIwd0NlUEt4dUsrVlNQclBFWmVCd1ZMWEdW?=
 =?utf-8?B?dmJ4OE9Obyt6cFJ4L2czR3F3cjRLMUlzWFR1ZWZFdllReFZxQU5FVW54T1pP?=
 =?utf-8?B?S2hXYlJvS1JqOFg2U3hDdTcxSkpGZGc5Qm9zcXZzcjVGdCtRV0tYUWZPZDcw?=
 =?utf-8?B?emJNeDNiS2FmeG9yZlcvSFJoK0xSQTRUNndSNHViRFlmRUk0UmkyMU51ZStE?=
 =?utf-8?B?cUlmOW9xWHd1TXlldFNZQk95WHdXWUVkTm9Qb2Nsd205RXo1c0IvdFFUZ1Z4?=
 =?utf-8?B?Rnk4bVRZdVVZa2NpMVJEL3RwYXB0c3BuSWMrZjlyN084Y1lwNWxyamU1ZkRy?=
 =?utf-8?B?Lyt1MEd4bXA0OVVzM0dOcXVxMGkrcnZqeTFUREdqaHRYVWduOVZHS08rd2NH?=
 =?utf-8?B?RUdsNHlLN2hjVkFuUnRZMVBmOWg1aU40T3M0RGZScW13d0M3VkMwVURvd3dl?=
 =?utf-8?B?ZUZQMjJnVlNITmI4NTc1ajZWRi83RmF2Z2RtNy9kTGV3U2ltTVpuUUxkRGlW?=
 =?utf-8?B?MmkwZmM5aVVLbTVnT1NpcEJZaUlBS3ZEQklEb3E0NTJxdWRTV1RBaFhMVlk1?=
 =?utf-8?B?UnJObTJmWEJ2SXVHK0YrME1zTjA1RDQwY3RhTlhpdW0ra0Y2dlJERUxMYWtu?=
 =?utf-8?B?dDhodWFTaklKNDlheEhJeWNRcFJIVEJhTGt3Q3VzQUpkYXJkTGQ1bzRmQUE1?=
 =?utf-8?B?SFhhZytDVDlDYTRQMW5CMlZJR24ySHRWb25nbmRwc0NpL1V0WGIwWTJqUnFE?=
 =?utf-8?B?L05rODN1bjlLbmhQSXhTRFVDUVdlZytTbHJ1Z3AyMXVVOFN6UC9QSTh4cWo0?=
 =?utf-8?B?TXF5QnlaR1lpdUQyT1cwaDdBQmN3blJ3WEpIbXFadUpPaTFWTk9TemhiRXVa?=
 =?utf-8?B?SUdEZ2haY3B4UnNnMGdsdDkzeU5HbGhoSnYxT3RZak1iRllGZTBvMDlLd0dI?=
 =?utf-8?B?SnFwMVB4em14aExaZDVLZVpxb1ZNWDFGWkxVVWJId2YrbHBtSnNiZzN2Nnph?=
 =?utf-8?B?U3FpUFhBSDk4RGhkdUhpK3BpZ2t4OEVkOG5sNWNHeUttc0lXeEkrQjBYUS9Z?=
 =?utf-8?B?WnB0UG8wSDB2bmloRkM5dFFOZnllL1YrNjNGQVJEL1pMcHdjaEI2enRPcjlK?=
 =?utf-8?B?QUZQR0JiZjhLdjVJREF3RVRZejViYi8xaEMvVXFFMnJkaEp4aGV0VmFaNTlD?=
 =?utf-8?B?RlJqMnJvYzBuWEZmaTZIUkhNWUN2dWZyb1drbnFuNHlOZ09MM2Z6V3hJVTVl?=
 =?utf-8?B?K3NKcHdYSEVaOFpRZ3BqVlJxck9EaCtPM2NEbTRIU25PRVcxYndtcXRKeWxi?=
 =?utf-8?B?dy9Rbmo3OWZIeVM4RVFYbWdBVGFxdmFEY2pCejlmVXJGWGFtR1N3M0djMEZJ?=
 =?utf-8?B?QjlpMCtSRmY3UTd3eDlnY0MzWEFrSE5sRkVwSmhQTHhvaUxRcS8wMCs3QlpF?=
 =?utf-8?B?SS9rU2cvbUZ0RWZnZk8rdWJIRm5lSHNqaEZpOWtWOG44L3hhSktUTEUwbnBh?=
 =?utf-8?B?cmxqQW96STV2VG8yMlR1c0dkdkVpMXpocCtpbkE2WHhUMmtnNmZIV1BzZXJK?=
 =?utf-8?B?UDM3MkJ1RjMwWHFidFBQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnQySWRCd2RRS3IySnhRTk1PMSsxajZnZGIzTnJvT1RrR3B3L3JYcEtaK1Vq?=
 =?utf-8?B?NDNKQnQ1d0ZMMk1HVXpyN3g1a3NWTy84cGlVakVJck1MaldyaDNwMHh4VjRH?=
 =?utf-8?B?YUtJekZyWm04OFhFUlFJRUxtc3d2bDVDd3hGK0ZVQjN0L3RNbXFtU2pMems3?=
 =?utf-8?B?VHNEdmZmQVZHcTJtaDVqa1k0blE3cHF0RGV6TkhFNnVORmFOc2dqdnhQL1dR?=
 =?utf-8?B?c2U5czR2bzVMWENsS25QZFEvSjZTcnplczJjenNMK3hNeDlyek51T1U4MExv?=
 =?utf-8?B?TGRoZ01nVUYyNHR0NzNjOUVEenVINVRvaDVEV2NRSTI5LzVrN2JGclYrY0Rw?=
 =?utf-8?B?UUJXWHRwUDYwcDZEZnNDdHkvd2NMbS9SZVBFa0pWTzRDMnpKVzRSWjJKcDFt?=
 =?utf-8?B?L2xWS1hEWE1oQWlWaWZJYXZ6dTlwb1VrTXRZYUJpQURTRmV2SzlSWUFjRmd6?=
 =?utf-8?B?NEhCZlRvTTJZRk9sMzd4Vmt6cTJpVWo0cStVNTUvb01BY2I0RVUyNSs5MGpz?=
 =?utf-8?B?NXVNYzRscU9wYll4QkRmQTg4T3RpTjM2VmVZV3BuUWVNdXd1L21sdk1qU1FT?=
 =?utf-8?B?YmtCMUc5WHM5VjRHeVg1Wk8xV1N4c1JWbEJ3dFdGcmMrWWpPZzJSeFR2RXdq?=
 =?utf-8?B?ZWpCdmlLYzZqWVhQOXJYUzBsUVpyNytlR09jLzAzaGVpNG1XYWdJNkVZTDJU?=
 =?utf-8?B?dnV6eGRvOU05QVBwTTN1MnpwZUM0bDdCaVFmOHdxR3JPeDU4d0kyeWNpNU44?=
 =?utf-8?B?UE1ESGdmT2tBVi9KclVvTGtNZG92M2FZNVYyMXhSKy9oa3htL1IzVGExOXpQ?=
 =?utf-8?B?Z0xTTTJ1dEJJSUJjQlVhaFJsc1FDSytDRmJ4eUhVVThNR1lqTnFuU0FRc0VI?=
 =?utf-8?B?S3IrU2pPcmZSYjVCUE1TVTV5bjN4eUROam9iUVEzV0JZQWI5Y25mSnU1MjRq?=
 =?utf-8?B?Y2lucXN4UWdRSDVxWkxKSDZpRGpKVHJhdWV2Y0VvS2Frcm5HUVY0YTlqeUJB?=
 =?utf-8?B?dnhBMUxvRFB4MDF5WGpYdHdpM2YwTXpUYjByVkRUSlNZa3JwUkFpaWtnNWts?=
 =?utf-8?B?VWFTWlRRUld0VUluV1d2dk1IYnZqY0sxbk4rVjAwUHUrME4zTHNMOTNnd1c3?=
 =?utf-8?B?L2JIZm5vRE1PbU5FcTExZ1NtM2wzUE9jaEp2a08vSUh3WmhQemFIQzlzdFJh?=
 =?utf-8?B?V0owQStaQUJ5aGNPVVBRdEFUN1B2bEpjZEFKMEsrS21FZGFyWGE1eS9sRkxu?=
 =?utf-8?B?NWVObjBONEJIbDYzbUg3SHBnUFVBOVBDbGRVdHhBZFV5Uzh0VFlRRVE4Qnl0?=
 =?utf-8?B?YWZSbDg2ZVRVRS8rNEQ0Z29yZHdHSWV0N2dmY01KdGpCREpMTlhHWDlhQjlx?=
 =?utf-8?B?MC80d0htYkplMlhEeWtMT0dYemhJVXZxaTN5bys0T2pqMys2cGdTcjNsL3do?=
 =?utf-8?B?cDZZeXM0WFE1QVFSbU53QzdFYUhkTlFLZFpjK0VOUDJ0TDVpaTZ6SGZscHZP?=
 =?utf-8?B?WjB4Z1V1b1ZVYlBpTlkwSjVlTksyRHZzeHoxM0ROOUxYRHdyaVZQdHdaRm5Q?=
 =?utf-8?B?Qzg4eGE5QVhSUXd0cHBQa00xaGJPUTJ0VWJ1MkRPZ2VKTVgyZFlFVkQzS1Y5?=
 =?utf-8?B?blZjNmRBOHhXRnVOMXdQalBZTlVkRzJseUpzZk1ZQkk5VUo3czhOdndhTEdt?=
 =?utf-8?B?R211NUZMcytoUjNHZWJwanhHVkdrdVVVOUpJNlByNFJyU0w0YTBBSXd4VXg5?=
 =?utf-8?B?Lzlwd1pkL2ZwaFdvSE1LeStVQi80UGRvN1MxZzR1eDI3UlBGNFhLYk1WWElE?=
 =?utf-8?B?OEo1OUUvNDVHdXNid2NlMVFCUWRtUGFQb0k2Wlo3Ymd0TGVhL0gzd1RTVE1Z?=
 =?utf-8?B?RDcwU0NUSlJzcVZwd3RNalNYK2ZHNHkvckNoakpMUjErTzJJSUUvT2lLVkpi?=
 =?utf-8?B?dFUzMGExN1o3ejFqTWlNeXNRck5Id3dkQk9UMUpOeEpBSFVuV1RVbktiTkFh?=
 =?utf-8?B?NC8xREpWLzczQVRqOUdSckZEbEFodG1yL3FPZk1CUHRCVVY3cStLZ0txcjVO?=
 =?utf-8?B?cmx4a0hGTGkveFQ1c1lXbjlZSEd1RHE2UDZHNUxrbHlnQTFlM0MrN3dRZkZT?=
 =?utf-8?B?TDRjTFhCb3Y0WFQ2dVQ2aGw4czBxZ0dLM3VObnFsTEZuOThkU1M5TVk0OHBX?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 919e8c37-f1df-4711-e2f9-08dd0b01f4da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 14:28:44.0395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvioETtiZ9TRAYEZLgkaQ05oRTh1CEA9uFj5hzFsr8ozBTSvXZc3zbCnL4jZzRIEgEylrfmdyG6hl+SAtlU+9ABnvb7KB1GfNOxGvI9EOoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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



On 11/22/24 12:47 PM, Hajda, Andrzej wrote:
> 
>>>> +{
>>>> +    uint64_t addr = CANONICAL(ppgtt_addr);
>>>> +    igt_assert_f((addr & 0x3) == 0, "address must be aligned to 
>>>> DWord!\n");
>>>> +
>>>> +    emit_iga64_code(shdr, write_a64_dword, " \n\
>>>> +#if GEN_VER >= 2000                                \n\
>>>> +// Unyped 2D Block Store                            \n\
>>>> +// Instruction_Store2DBlock                            \n\
>>>> +// bspec: 63981                                    \n\
>>>> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies 
>>>> both        \n\
>>>> +//    the block parameters and the 2D Surface 
>>>> parameters.            \n\
>>>> +// src1 data payload format is selected by Data 
>>>> Size.                \n\
>>>> +// Untyped2DBLOCKAddressPayload \n\
>>>> +// bspec: 63986                                    \n\
>>>> +// [243:240] Array Length: 0 (length is 1) \n\
>>>> +// [239:232] Block Height: 0 (height is 1) \n\
>>>> +// [231:224] Block Width: 0xf (width is 16)                    \n\
>>>> +// [223:192] Block Start Y: 0                            \n\
>>>> +// [191:160] Block Start X: 0                            \n\
>>>> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 
>>>> bytes)            \n\
>>>> +// [127:96] Untyped 2D Surface Height: 0 (height is 
>>>> 1)                \n\
>>>> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 
>>>> bytes)            \n\
>>>> +// [63:0] Untyped 2D Surface Base Address \n\
>>>> +// initialize register                                \n\
>>>> +(W)    mov (8)            r30.0<1>:uq 0x0:uq                \n\
>>>> +// [0:31] Untyped 2D Surface Base Address low                    \n\
>>>> +(W)    mov (1)            r30.0<1>:ud ARG(0):ud            \n\
>>>> +// [32:63] Untyped 2D Surface Base Address high                    \n\
>>>> +(W)    mov (1)            r30.1<1>:ud ARG(1):ud                \n\
>>>> +// [95:64] Untyped 2D Surface Width: 0x3f \n\
>>>> +//       (Width minus 1 (in bytes) of the 2D surface, it represents 
>>>> 64)    \n\
>>>> +(W)    mov (1)         r30.2<1>:ud 0x3f:ud                \n\
>>>> +// [127:96] Untyped 2D Surface Height: 0x0 \n\
>>>> +//        (Height minus 1 (in number of data elements) 
>>>> of            \n\
>>>> +//        the Untyped 2D surface, it represents 1)                \n\
>>>> +(W)    mov (1)         r30.3<1>:ud 0x0:ud                \n\
>>>> +// [159:128] Untyped 2D Surface Pitch: 0x3f                    \n\
>>>> +//         (Pitch minus 1 (in bytes) of the 2D surface, it 
>>>> represents 64)    \n\
>>>> +(W)    mov (1)            r30.4<1>:ud 0x3f:ud                \n\
>>>> +// [231:224] Block Width: 0xf (15)                        \n\
>>>> +//         (Specifies the width minus 1 (in number of data 
>>>> elements) for this    \n\
>>>> +//         rectangular region, it represents 16)                \n\
>>>> +// Block width (encoded_value + 1) must be a multiple of DW (4 
>>>> bytes).        \n\
>>>> +// [239:232] Block Height: 0                            \n\
>>>> +//         (Specifies the height minus 1 (in number of data 
>>>> elements) for    \n\
>>>> +//         this rectangular region, it represents 1) \n\
>>>> +// [243:240] Array Length: 0                            \n\
>>>> +//         (Specifies Array Length minus 1 for Load2DBlockArray 
>>>> messages,    \n\
>>>> +//         must be zero for 2D Block Store messages, it represents 
>>>> 1)        \n\
>>>> +(W)    mov (1)            r30.7<1>:ud 0xf:ud                \n\
>>>
>>>
>>> Shouldn't this be 0x3:ud now, for dword ?
>>>
>> No, r30.7 needs to set 0xf:ud.
> 
> 
> 0xf mean block width is 16 bytes, it means 4 dwords, in the description 
> you says one d32,
> 
> to source register r31 you enter also d32, and zeroes the rest.
> 
> So what is going here? Writing one dword, or 4dwords (one provided, and 
> the rest 0) ?
> 
Good catch.
Yes it should be changed to use 1 dword from 4dwords as you commented.
I'll update both read and write functions.

Thanks!

G.G.
