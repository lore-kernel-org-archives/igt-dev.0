Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24166D63923
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 10:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CAD10E6DB;
	Wed, 20 Nov 2024 10:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeN1Ddei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1FE10E6DB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732098841; x=1763634841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=B6pbYzO/xHABVma2B0sut+TOd7zu18upCxiEnYPlzM4=;
 b=VeN1DdeiDHgfLafd2RD1BpkpA2jqtfX3+GcCPHu+kk7Qef7Pz1zAiftI
 PGF/RiCny3pyIAfpXoWHb0myiRHB/Qn41wKhrs+whAyIqUdiNtqbQVZrd
 lqcJBhCWeZUxTv1YSs03O3u/loNyGuljZp17Z9RPbCICfYneRjKJrFWiU
 zllXwShJBaNky2NzYQq3fG+vh+CUnKP9d0OUViDhNQtzZo7q7ZtH2KM0l
 mAMM7tImwbte63vhcTa0W2RM2+mhiUWPYl0y5R8kXc6R+37i6c0Ut1HkD
 leNUlDmdFRF7VUB8hpXgNbZEesKXz2slVKVZV4yRpgtFm9DpYPFMITxzj g==;
X-CSE-ConnectionGUID: VSVCiuTHRmS/1d63g7oD7Q==
X-CSE-MsgGUID: 3jFo5av3SHymQqsjmel6pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49677951"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208,217";a="49677951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:33:45 -0800
X-CSE-ConnectionGUID: p5JE9eooSwO188fevCoFIw==
X-CSE-MsgGUID: pHHzAse+RH6idJM3adXk0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208,217";a="90253297"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 02:33:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 02:33:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 02:33:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 02:33:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXdh8yNEpgJO338fqDEYLCXS6rz31BRDwCUh0VrsbSWZQbQf/5kpovA2uM6ujabMPQ9EMk3WX6hfhU7zfKLCU6qQAIFeLee3ei1iZDKzAOxCyZUrMkv2VNai4UtivlSUAgQ+lUcwZdbn5OLJkZr+gxBMV+Cs81pZTbm3ILCyw02D1cope08qHf4mty+yKZCzmkgjng3TvaF3Qm9h0ta7f5TsfGVN9xZ1BkV1+QRQ88qu0g0/K0R9tCYfVOEpv/LDkg5B2AfSPYhNXL1/ADQ1YrtRdm/jUj53lrkGEXP7QJNOM23Oq+KaXL/6366FUc2fPVWmsmEpMNA6c8bJ3LgtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHnuxvNM8p/coUOoq0235WBFEW3qYVwYoSlHa07aeYc=;
 b=QPsc3URAOBIo7gnNrGeFj//51alXAhVXWk4k31tzaN7m2fMUNRIDCydd8wAXuDquUP5FIOSXQmXKWsMlvfK2ZVARMESXAYEF/ZV4BQbBPP7fX7Vyd4r0Nu16h8SU+HcPYhWSKvejh0zu3PDJd4tL0bpyFRpNF30wjavGF4C1+Jp+U4dUTca1Rsc4IX0wTYv9ZUdM4Kwe8GNg6sAqHY7eoTFJkxvOhwksbZzywinho/zNVOBp71+JuJhwYyx3KwAl7uFTkq2srSP97Drjn25MxOhlhdSgtI3XsTnNNuscBnLjinDobnNCObzgLFNTgU13c7U4FTbrdrDorORV3YOhKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Wed, 20 Nov
 2024 10:33:41 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 10:33:41 +0000
Content-Type: multipart/alternative;
 boundary="------------MTeHlxutSdDxO9vXQXjMOgaM"
Message-ID: <e6c1f48c-7ab8-46e3-9fbf-78779dd3f18d@intel.com>
Date: Wed, 20 Nov 2024 11:33:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_sriov_provisioning: Refactor range
 handling and logging
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <narasimha.c.v@intel.com>,
 <piotr.piorkowski@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>
References: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
 <20241119155538.605000-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241119155538.605000-3-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: ZRAP278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::11) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7cca33-94a1-41cc-651f-08dd094eccf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YU9RTlByVW0rbHdQUmhKTDBkelc5cmZSandqcjBJTVF3cmUzTXlXVFFKaXp4?=
 =?utf-8?B?TEtQVk9DZE1qcXhwdENPT0RsNE5zWE0vTHVCTG9wWGF2bjg1QVdYME9BeG1q?=
 =?utf-8?B?WVpzSGRMTHkxVmFWdFk0ZUJ1UXhRRHRBRzVlTFQwRTZpK0kzc1RiVTkrbkpm?=
 =?utf-8?B?Tmw5RXpidzMxaTE4a1BHWitxN1dTRFRtNE1COEg2MVUvcVdnWjRsekhGREMv?=
 =?utf-8?B?MklGUkdaNWc3Sjdmc01yVS9RWmp2dnBWMXR5Q2tpdFp6REZ0ME02ZVdUQjVl?=
 =?utf-8?B?aGJId3Z1WExkR0FUZzh1SnBybHFVdkxQNzZUamxPY2cwYkU0V3prSnlWMHAv?=
 =?utf-8?B?a2F6NCsxamJCdmN4WExBYVZlOTBrWDVSSEpSOTVhTVBZT0lPcFNhZGMxSS9r?=
 =?utf-8?B?bFR3V1RmMmN1WUJJclg0amZ4NlRWTmhqNEcyQUsvenRQVUIvc2NhVTh1S0w2?=
 =?utf-8?B?eFBSUW54QmRNVjVvL3c1RGprcjdEdHdTMUVhRTVENkFwd0RWaWd1b3N4ZDFy?=
 =?utf-8?B?blhNVjBEREhCT01yVFMySnZPdkg2N1JBd013dlVyakdjbEhKZWl2UTR5LzFr?=
 =?utf-8?B?TXlUcVhMNEEyeDVpYis5TUw1TFlkdk1wUzdyQ00zUW5ERi9qSm1lNUJRSVFT?=
 =?utf-8?B?MEtkYWJ5RERqTi9kVDhWdDhzOFdobUo1bEtmMm94NDJTcXJyZlFPZU1sbDRo?=
 =?utf-8?B?REYxNmtnMi91TG51QU43SE0veXVmOUpya3AyanZzU0lXSyt5R2tCd3ZuVWlU?=
 =?utf-8?B?SHpqOUxxb0Y5eEJyTUFQNGFTSDQrLzJjRno3ZHNVZUpKUUpXMEJFWWlpcEdY?=
 =?utf-8?B?UktFRlpuZ0krazMzVkN4MWY2RlZndUtFYkZLOFdPYWtmY1BydDROY3VnTDUr?=
 =?utf-8?B?SHp1bDZhcmdNU1JUTE1aeUNkWFRYZVp2VWlsSkdvRWFZbUg4VzhqN2VPbHdq?=
 =?utf-8?B?cDQzOGFBWUNUaEtVWHF0YnA2dGVKdktTeHp0M1hBcGlSQU5EdElWL0dhWkJ1?=
 =?utf-8?B?SWs5b2FUdS9qVjQwNllWaWh6VVZKeFV4NVpqNmtkWGR3aWZNd0t3OVRYRG1u?=
 =?utf-8?B?YkZXY2NrYTVSZWZVSWJRcDRubUdFL0d1V3E3MGxBRkhKc1hPc0tBMi9xcnNn?=
 =?utf-8?B?a1kzOTQ3dmNreWFyTGI3UjFmSDYrV0hnZXNacCtTV29TN3RzK3k0WkhtVUFS?=
 =?utf-8?B?eEtVT2p4Nk9GMXJOdlFLazVzTmlISFFPaTkxVjV5enJBZWZ0cDllSkFjejRB?=
 =?utf-8?B?dGxRTk1iN2VTSy83Rm1QNXIvZmV0NDFBaVEycWhGMGhpcHRzcDVoWHpaZUFU?=
 =?utf-8?B?M1Y3dTVwWHF1WlM1Q0YyVk10aVJGU3FYWS9rVW4wS0NYcjhkaXRqSi9MbVhZ?=
 =?utf-8?B?RXZSZHg1SWJvcFJsM0lnV3YzalFReE5MWWtScWNxZlBxMkZaS2w1RlZGV0VC?=
 =?utf-8?B?b3gzMHZZYjdqbmhvamtqL0Z4MzRoVzljT0ZMckZGUG9zOE9SbWhyeFlXdTBR?=
 =?utf-8?B?RDh3RDhGQmhSdnZkYThpRklmNkdTQ25tL2wzQUZhNzAwSStIcXZwVnRDc0Z0?=
 =?utf-8?B?NkhycFZicUVuQy9kellRejAvQnRxcVBZSnRUSkZYKzlsQVNFb1VsUTAzQitj?=
 =?utf-8?B?ZERlTFdNTVdWM0FLV25uQUdjQjQrNEwzZXY5cGgySmhmZ05YV3R4WDUzU3F6?=
 =?utf-8?B?SGxHcDNnYk9YVFdTQWxXOTZCMXF4YVFYYmY1TmVaVU1GNmNMRE9JTWRWSzlI?=
 =?utf-8?Q?H/wcQHfgXMLrn348W74jVRfw6m/xlNdzA5QvHRn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnN5aXBWU0lNMEo3TGh0d3ZCQXVZWWtFMFZWTm1nOWZHUmh4Sm1kSkx1aVRL?=
 =?utf-8?B?YytTZ2V2eUprT0NCWG0xRmRHUnhjQlZCYTJGczRRei85MlNHRFVPTkhTa0FH?=
 =?utf-8?B?UmpLNXYvVmJRa0VQVlZHR056WjRmQk9lVE9SRXBHcmp6Z25pdVZTbEF2cGgz?=
 =?utf-8?B?bUFJS2piT3ZheDZpSXFDUTBBWCsveUFZVWY5UnQyVkxmQWhTT0Z5bXhwbDdH?=
 =?utf-8?B?ZU5CMlh3TCtBVWJaS0x3MWVKeWRjc1NOYUlsbTcyNzB1bU45SlZiL285dUV0?=
 =?utf-8?B?Q1k2N2RXdnhsUy9vSGZZaWdzNitCbTNDWGl0TkcwU0REYjF2amVjTlUweUY0?=
 =?utf-8?B?K1ZZaVVSOHd0SUxLdnFMQ2tYYzY0a0YrV000Snc4VnFQY2tHLzhpdE5Lb3lW?=
 =?utf-8?B?RjhHdit5ZlN0elVkWENqZU1ON2phdWVaOXpRNEN5MG5YNjRLOXVZR0NxZG1L?=
 =?utf-8?B?TVZrS0Vhc1pTdmlES1BPeTM3NE4rcjZsNmVnaTBmTHNTenJ4eml1NEdlZWRP?=
 =?utf-8?B?T0d6VHJieUZEbHpXUDdjcVdONWQwa3NSQ0RxSVBVR2xLb2R0aDJlbzZaRVp0?=
 =?utf-8?B?Y0xKYUJ1TTZGS2hOOGN0aENkZzNBQnpxRU1BckkrUURyVC8rVXIwbFI1Smxm?=
 =?utf-8?B?YWg3VEg4aHJBamJNTFFzU2tXSHdiU2hHeHVLSk9vWHJaaEdrbmdpemJ4MEZk?=
 =?utf-8?B?M0RIOG9XVVhsQU50Z0J6MVl1RG1ZQW5Ocktzck10ZmR3aHF0cWNBb1B4M0wz?=
 =?utf-8?B?YS9NdFp1OVdGUWVCS0dUUEtoUkk5VWt5VHFRckJUUUNTdm8xTjVpcnJSVEFj?=
 =?utf-8?B?QTg1RWZDSzFBNUhiNGpJSzZ1YzZBSldqU3pEb0RiMUc3STJ0RHBzZXhxRmtm?=
 =?utf-8?B?bVdIN29jeittMjcwdTh6VFdGRytzUGVxb21NQytpMnRmQ1dKcTZMc2cyaGhz?=
 =?utf-8?B?T0lDeVZLUjE1cFpIWGFIMUNETmpMYjlzWEcxZjB0YWxOLytFTkVOaGdYdWFl?=
 =?utf-8?B?VVFJL1VhK0dsUzFmSmljbnJtTUJ3S3lHbzFKYld2Mk9KR0RQS2NtWWpzZUha?=
 =?utf-8?B?VHVHcjFRYTQ2bmxLMEJDb2FxbkxJczV2cGdOWjV2TFY4UTIyWlBNVUllc3pP?=
 =?utf-8?B?NUpxSTVvU05mdmRWNnRmaml1WlM5QkhhRVN1eTFuWHBEOElSZlBzN3gxWjRr?=
 =?utf-8?B?SUd2bkpxVVFtRFN0ZlJHVzVvRzcwRDJsOUVyVlFYRzRnVGJTUko1TGYrTW4z?=
 =?utf-8?B?T0FETllIWWVOMnZORGFCRWdlL1MycWFhOVhrdjVsM052QWV2T1dnc3BOQjI4?=
 =?utf-8?B?aVJ2c1VOYURpQnhXS1dZbzI5YUtRSjJDUWJkdCtPN2t5S2RYWkZtVitiQ2ps?=
 =?utf-8?B?L0I3NUNGMkx0bU03Z0hwYjZSaUNBZXR6UkU3NURQcmhIQ0NZRDVpVWNXTGdz?=
 =?utf-8?B?SWRmRVZqVmdjZGROeVQ4S0tTckZZWGhGUEY4Y0xqRm9yT0ZDZ0duQ2V0d3ox?=
 =?utf-8?B?UkFNOGhibksvT2ZTRlRrcFJTY1J1alFvV3JyU1RsTnA0N2orS1BZL2pZa1hJ?=
 =?utf-8?B?RVlJWkl4TmlyS2haM3RIdzRtM2pDZFJkaThzSXJDRUlDMHh1NlJuaHNoQ1dW?=
 =?utf-8?B?M2xKdHlpV2ZZSm55OGZwS1o1NWJQSXNyTHNDRy9WSVY1Q1B1Sk1hKzhFcWto?=
 =?utf-8?B?cVplRmFRbnplQitJa3dGRUkxWWNzamRTOWJaL2VLVmJtWnlPbkxraTIxNmt2?=
 =?utf-8?B?VHM0V2o3Q3JMUDg0SzVoN0UzVkpyQy9DUDRxNDNmdjAxbVJGdFBvL09qaW9V?=
 =?utf-8?B?R2NrWXZ4KzV3SzQvdmlDQ3ppTWlUa21UL3ZiNHVTM1NFTkVlZk1VUlRNYWNy?=
 =?utf-8?B?WWsrNmxWN0x0Qkg0YUdyL1dhUC9RV1JaTDR1eElCZ0NUaUhhZjBva1FRbld6?=
 =?utf-8?B?NkliOUs1UGNpRjFzbVpqU2VTbWUwc2RNU2NYeWltTkd3N0lRWkZzcmFrR3Uy?=
 =?utf-8?B?WXJWK05xdDNlMXUzdy9yM2YraUFaNkhrZjlkSnpaZjRScmhuYncwbU95bVB4?=
 =?utf-8?B?OElGT2paK2NhVGJNMFZNR1ljWkY0L24yaXRadEorNmp3LzIvUkh4c0ZRVlBj?=
 =?utf-8?B?bjk3Uzh1VDN6ZmV1c3FiZ3cyMmxUMzFPS2k2cGJhdTdoZUowcFFzVVBZeDF1?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7cca33-94a1-41cc-651f-08dd094eccf5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 10:33:41.0076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3lKUdfl1qr1EN8qM0CJxlhIlLvFIQwJqIjfQ66UqMGuip6JyZCiDgWVmJYSOFpNRWFJKvMiCkSQlXLu8fm25w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
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

--------------MTeHlxutSdDxO9vXQXjMOgaM
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/2024 16:55, Marcin Bernatowicz wrote:
> Introduce an append_range helper to reduce code duplication in handling
> provisioned PTE ranges. Limit debug logs to the first 70 entries for
> clarity and improved reasoning. Enhance error handling by propagating
> realloc failures.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: C V Narasimha<narasimha.c.v@intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana<satyanarayana.k.v.p@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 71 ++++++++++++++++++++++------------
>   1 file changed, 47 insertions(+), 24 deletions(-)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 7cde2c240..66c0576aa 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -3,7 +3,7 @@
>    * Copyright(c) 2024 Intel Corporation. All rights reserved.
>    */
>   
> -#include <stdlib.h>
> +#include <errno.h>
>   
>   #include "igt_core.h"
>   #include "intel_chipset.h"
> @@ -48,6 +48,37 @@ static uint64_t get_vfid_mask(int fd)
>   		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
>   }
>   
> +#define MAX_DEBUG_ENTRIES 70
> +
> +static int append_range(struct xe_sriov_provisioned_range **ranges,
> +			unsigned int *nr_ranges, unsigned int vf_id,
> +			uint32_t start, uint32_t end)
> +{
> +	struct xe_sriov_provisioned_range *new_ranges;
> +
> +	new_ranges = realloc(*ranges,
> +			     (*nr_ranges + 1) * sizeof(struct xe_sriov_provisioned_range));
> +	if (!new_ranges) {
> +		free(*ranges);
> +		*ranges = NULL;
> +		*nr_ranges = 0;
> +		return -ENOMEM;
> +	}
> +
> +	*ranges = new_ranges;
> +	if (*nr_ranges < MAX_DEBUG_ENTRIES)
> +		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%ld\n",
> +			  vf_id, start, end,
> +			  (end - start + sizeof(xe_ggtt_pte_t)) /
> +			  sizeof(xe_ggtt_pte_t));
> +	(*ranges)[*nr_ranges].vf_id = vf_id;
> +	(*ranges)[*nr_ranges].start = start;
> +	(*ranges)[*nr_ranges].end = end;
> +	(*nr_ranges)++;
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
>    * @pf_fd: File descriptor for the Physical Function
> @@ -76,6 +107,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
>   	uint32_t current_start = 0;
>   	uint32_t current_end = 0;
>   	xe_ggtt_pte_t pte;
> +	int ret;
>   
>   	*ranges = NULL;
>   	*nr_ranges = 0;
> @@ -86,18 +118,11 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
>   
>   		if (vf_id != current_vf_id) {
>   			if (current_vf_id != -1) {
> -				/* End the current range */
> -				*ranges = realloc(*ranges, (*nr_ranges + 1) *
> -						  sizeof(struct xe_sriov_provisioned_range));
> -				igt_assert(*ranges);
> -				igt_debug("Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n",
> -					  current_vf_id, current_start, current_end,
> -					  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
> -					  sizeof(xe_ggtt_pte_t));
> -				(*ranges)[*nr_ranges].vf_id = current_vf_id;
> -				(*ranges)[*nr_ranges].start = current_start;
> -				(*ranges)[*nr_ranges].end = current_end;
> -				(*nr_ranges)++;
> +				/* End the current range and append it */
> +				ret = append_range(ranges, nr_ranges, current_vf_id,
> +						   current_start, current_end);
> +				if (ret < 0)
> +					return ret;
>   			}
>   			/* Start a new range */
>   			current_vf_id = vf_id;
> @@ -107,18 +132,16 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
>   	}
>   
>   	if (current_vf_id != -1) {
> -		*ranges = realloc(*ranges, (*nr_ranges + 1) *
> -				  sizeof(struct xe_sriov_provisioned_range));
> -		igt_assert(*ranges);
> -		igt_debug("Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n",
> -			  current_vf_id, current_start, current_end,
> -			  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
> -			  sizeof(xe_ggtt_pte_t));
> -		(*ranges)[*nr_ranges].vf_id = current_vf_id;
> -		(*ranges)[*nr_ranges].start = current_start;
> -		(*ranges)[*nr_ranges].end = current_end;
> -		(*nr_ranges)++;
> +		/* Append the last range */
> +		ret = append_range(ranges, nr_ranges, current_vf_id,
> +				   current_start, current_end);
> +		if (ret < 0)
> +			return ret;
>   	}
>   
> +	if (*nr_ranges > MAX_DEBUG_ENTRIES)
> +		igt_debug("Ranges output trimmed to first %u entries out of %u",
> +			  MAX_DEBUG_ENTRIES, *nr_ranges);
> +
>   	return 0;
>   }

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>


--------------MTeHlxutSdDxO9vXQXjMOgaM
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/19/2024 16:55, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241119155538.605000-3-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce an append_range helper to reduce code duplication in handling
provisioned PTE ranges. Limit debug logs to the first 70 entries for
clarity and improved reasoning. Enhance error handling by propagating
realloc failures.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: C V Narasimha <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: K V P Satyanarayana <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_provisioning.c | 71 ++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 7cde2c240..66c0576aa 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -3,7 +3,7 @@
  * Copyright(c) 2024 Intel Corporation. All rights reserved.
  */
 
-#include &lt;stdlib.h&gt;
+#include &lt;errno.h&gt;
 
 #include &quot;igt_core.h&quot;
 #include &quot;intel_chipset.h&quot;
@@ -48,6 +48,37 @@ static uint64_t get_vfid_mask(int fd)
 		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
 }
 
+#define MAX_DEBUG_ENTRIES 70
+
+static int append_range(struct xe_sriov_provisioned_range **ranges,
+			unsigned int *nr_ranges, unsigned int vf_id,
+			uint32_t start, uint32_t end)
+{
+	struct xe_sriov_provisioned_range *new_ranges;
+
+	new_ranges = realloc(*ranges,
+			     (*nr_ranges + 1) * sizeof(struct xe_sriov_provisioned_range));
+	if (!new_ranges) {
+		free(*ranges);
+		*ranges = NULL;
+		*nr_ranges = 0;
+		return -ENOMEM;
+	}
+
+	*ranges = new_ranges;
+	if (*nr_ranges &lt; MAX_DEBUG_ENTRIES)
+		igt_debug(&quot;Found VF%u GGTT range [%#x-%#x] num_ptes=%ld\n&quot;,
+			  vf_id, start, end,
+			  (end - start + sizeof(xe_ggtt_pte_t)) /
+			  sizeof(xe_ggtt_pte_t));
+	(*ranges)[*nr_ranges].vf_id = vf_id;
+	(*ranges)[*nr_ranges].start = start;
+	(*ranges)[*nr_ranges].end = end;
+	(*nr_ranges)++;
+
+	return 0;
+}
+
 /**
  * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
  * @pf_fd: File descriptor for the Physical Function
@@ -76,6 +107,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 	uint32_t current_start = 0;
 	uint32_t current_end = 0;
 	xe_ggtt_pte_t pte;
+	int ret;
 
 	*ranges = NULL;
 	*nr_ranges = 0;
@@ -86,18 +118,11 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
 		if (vf_id != current_vf_id) {
 			if (current_vf_id != -1) {
-				/* End the current range */
-				*ranges = realloc(*ranges, (*nr_ranges + 1) *
-						  sizeof(struct xe_sriov_provisioned_range));
-				igt_assert(*ranges);
-				igt_debug(&quot;Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n&quot;,
-					  current_vf_id, current_start, current_end,
-					  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
-					  sizeof(xe_ggtt_pte_t));
-				(*ranges)[*nr_ranges].vf_id = current_vf_id;
-				(*ranges)[*nr_ranges].start = current_start;
-				(*ranges)[*nr_ranges].end = current_end;
-				(*nr_ranges)++;
+				/* End the current range and append it */
+				ret = append_range(ranges, nr_ranges, current_vf_id,
+						   current_start, current_end);
+				if (ret &lt; 0)
+					return ret;
 			}
 			/* Start a new range */
 			current_vf_id = vf_id;
@@ -107,18 +132,16 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 	}
 
 	if (current_vf_id != -1) {
-		*ranges = realloc(*ranges, (*nr_ranges + 1) *
-				  sizeof(struct xe_sriov_provisioned_range));
-		igt_assert(*ranges);
-		igt_debug(&quot;Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n&quot;,
-			  current_vf_id, current_start, current_end,
-			  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
-			  sizeof(xe_ggtt_pte_t));
-		(*ranges)[*nr_ranges].vf_id = current_vf_id;
-		(*ranges)[*nr_ranges].start = current_start;
-		(*ranges)[*nr_ranges].end = current_end;
-		(*nr_ranges)++;
+		/* Append the last range */
+		ret = append_range(ranges, nr_ranges, current_vf_id,
+				   current_start, current_end);
+		if (ret &lt; 0)
+			return ret;
 	}
 
+	if (*nr_ranges &gt; MAX_DEBUG_ENTRIES)
+		igt_debug(&quot;Ranges output trimmed to first %u entries out of %u&quot;,
+			  MAX_DEBUG_ENTRIES, *nr_ranges);
+
 	return 0;
 }</pre>
    </blockquote>
    <br>
    LGTM,<br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;<br>
      <br>
      <br>
    </span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------MTeHlxutSdDxO9vXQXjMOgaM--
