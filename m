Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2156DFF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 04:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54CA10E08B;
	Thu, 30 Apr 2026 04:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnoJWXUF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA0410E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 04:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777522025; x=1809058025;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rZcvc4qKNGfmp7x6P9FyWoc0xvauNYgznYb8j5HZbWU=;
 b=MnoJWXUF3i5pDaWDZwnbSDNi5xcXgPuNjsveVXWv/yQPjYfetaxX4/Lr
 /JKH1VyB6AP6bOuNSzk7478zL92nCnQDspsPTAkXVjD2H2C8qxsdeeRYb
 qni2DpMi4k4wNzAjjNopzjRcOibJ6hQlb8G0GTOgG067eMM/bDBTDRnnM
 cwW/6HNkpnXbYeWnHhl9CD17rj9FEeJqqjri5F3RX4dThQwTtfZYYmyN+
 ei46Y0XPD+4oc/ib9cBh/P04swB7WcCHRdn6upTV5BMrPCo+J7CezHpao
 ozLl1m2gIj2q+jXM/o6fEul7op1o80QxEZ2y6WGfREat9VeVMagbI0/Ld Q==;
X-CSE-ConnectionGUID: +N7Ru7cWTCCSZACuKgCzAw==
X-CSE-MsgGUID: 55DdZj7wTw+iGfCRY2NiJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89154235"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89154235"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:07:05 -0700
X-CSE-ConnectionGUID: /n6TxZHdRD+2qLvNp70XLg==
X-CSE-MsgGUID: d6UZJbxfQZyP4yLAyG68pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="230110220"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:07:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:07:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:07:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvuFXU74cNUot0A0Zuad8uF9n5Ox6NxIusz5P1tvMSp5wBX5iqOO61iU8mZ62M+mqNlZCoAUFoORcYDvUYDIjofwb7MKyCdhfFwLapnrOi94xrVVelEB8gHeYkfRnMYCzpVCIKuugCv0FhDfqU1JMCbXe62Ine6jd2MXF+QZjtz6diNjrXc4SHt3DZPhGXV0pV4mowWB+WJ9fMcgfZiWSndARuTSwe1PCA+I1NmbBvAIm5tfLlJFxOsb343GDufuU+MQZp1Zu9TNOGWoqYt3MuRyqG97GP+BpkLx3JeL7pEtyGaRPOj8325kchMWtWWPpv3FTQys8Jxx1CXK/clwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZcvc4qKNGfmp7x6P9FyWoc0xvauNYgznYb8j5HZbWU=;
 b=W3EdnbaS59LuZ4Vdu0dUQmVWJR0yUmF9d2Ae7lhwq48xnc8a4Ru1kbOZz7weR7w3Ml1oa3sjeut/kpsA7W+lOv3FKWZrQFzW8ritEKufcKyKMI2uE/QKxzpg8waXONMVghmiD3TlugVRmaIXkxGzUSekrUrraoawUyNOLdgUIOk1uL9w6yQZ9mMnb9R6pW54FHScUKjy1N7qTDkS9jAzQF3F1KIVmTBSbQZ6f0m0B7L1dkAsMxHBlX01VQQ/2pufMz1/BX9XJiS9WZe9XH5uG/mrlXRUUYeLSjGl1eJOMGNELWJkbiJ+ShsfFbT0+8WCZzj2p+c/irxiWNUoqfKKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 04:07:01 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 04:07:00 +0000
Date: Wed, 29 Apr 2026 21:06:57 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_multi_queue: replace sleep with
 barrier queue
Message-ID: <afLVYeTiGaeiLCD0@nvishwa1-desk>
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
 <20260429020856.1857656-6-niranjana.vishwanathapura@intel.com>
 <ab23ef9a6e8b9c8efb500cde38824b9aaf21ef5c.camel@intel.com>
 <34b7c49d-18d2-4f8a-8afd-0487b1c72c4c@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34b7c49d-18d2-4f8a-8afd-0487b1c72c4c@intel.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 12db5cdf-2740-42e1-89fe-08dea66dedfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: wQq1S0tnibSMbgR9ALKCidnwlIV2mk+w/ox9cbPR+e1ldcEW8E/xmJed32NWcNzAhgGBepwGeKIhQ8AcV8tAr0hzcrbXz8Yptnq7IbjW01Z9nkGHcC05neC7RvbLUEzYp8LOZ2CIovSzMXkhHvpifQaINvUtAF4FwIdxXvgPOwB2PGJIrsyZKsU5Vfably/RgmtWu98mq6xEWmo6OXKB7nuShcKPU72SSFkNaClC9B5HbTE6t3t1Qot0QSMz6cxafoXSQ785EcMmQKsnJ3oCZIq7a/iuC2AqRYwpFwHdVl5Rd8Vf7HTW/97FCYi0ucEOQvoX8R+8iPhVTXyX0y69vrTg8K1WwiAxdpf86Z/ofqrL5TgBOb+M7oiC8g2kTlZ8I3ENB3wRuJ8xZpTz2jFncYr9qNXbBou7MzaJn/aW/JxBh56R04hbuWMhc+hRXuOhsevubcUl9151xAGYKbU3Z8K3X82GR+E6ix013Q9r3MppQhI8XCmCAyMR8m8BV5FoJ6QbfJ7qRBd5crqQtd2use0xbbRdbmjdnlHKUNyE8Dck/aZX2ompXsC6PvSznT7IXlw9IawzKSJKakSfuW9rA2uF9jQVhUcU5++ohYWBnh0cLB9AqVnIOQPoxP6KI05cwLPEI4hkd+tWB66gUSdqRjpiuUqKVLxNhvQqP8Lnt/ipjvZkqdVEsduV4sgDtlLFsZof78wdCO1vb+dyJNYOU01VHV2AepQqhClmR9rmitI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVQOFc1SWVoU1A0dnpkWWx1OGpVdVh6alNrdW41d3ZDZVNzay82aHJPV0tN?=
 =?utf-8?B?djYzaDJHT1hFTGwwSzMreXBadVBQVUZ2N3Z4a1I4Ny8yRUlJak0zVHRSVGY3?=
 =?utf-8?B?RllZaTlRcEtHYmF3NUM5Nkg5RTN3Qjg3eHRmWFk2dkdYbytuNlBWVm1CbWlO?=
 =?utf-8?B?RXorYVBwSCs0Q0JhTWRvbWRzZUI4bTMydnpPOGlWTE5pZ2tXeHlobHNZQUZR?=
 =?utf-8?B?ZUNQbE81UVU4TVBtQVltYlU2bDdkZXh0NUVHZGVSTHBlZTY5UGF5K0RDZmEz?=
 =?utf-8?B?bnlmSWN2WFNHMFErRlJESmQvSnpIaTRCcjV3VDQrM01pYkgrNEZXRGV6aEZs?=
 =?utf-8?B?RDF1ckJhZ0d3ZmcwSDk5TVdwM1hFaGZMSG82cnJna1F1YXQ0bGtzNk9ZMkdK?=
 =?utf-8?B?WGZNYlR6T3lDSkZSNThRYTFqK0NOdnNlaGVadmVXaE1LY0tvUnBNbTBsMVJG?=
 =?utf-8?B?d3R3SzZ4eUJmaDN6QlBoWTc2dlRjTFJFRjRYbStJWmZNbzZNZmVrTkhLcXpa?=
 =?utf-8?B?dnhsZjhZOUV4bUR3R2xiMWtVMXhiSERSY2M3ZkJyMFVpOTZyMDJINWpka3V2?=
 =?utf-8?B?MDNkd1NpOHlFZWU0TTlmV1M0YlJUTGZVMTlsVGtINWFzZTlqaXN0VHhORGZP?=
 =?utf-8?B?UGNWWFc3RkdQTEgwU2NYSmdIMnpjT2h6QWJJUnpsbEhqUWFhbGQrdHY1L2RY?=
 =?utf-8?B?MSt2bFRBN3czVkUwY0M0akRxVmp0cVY0VEFPVE56ZXlUQWpCTHc0N2h6blVW?=
 =?utf-8?B?QUFVYkZ2VC9MaTdKMnBpWXR3Z2RzQlVIVzUwbFRKODlNTUhKRUwvSWhOcnhO?=
 =?utf-8?B?aWF5R21VRHkyM29aYWZLYUxLM0s4bDJqNk43MHUwdFlhVG5wWkhzU1BBdTFU?=
 =?utf-8?B?UTFiMmFaekZiYXBscUFMV1VVb3hoNHVsTmNOaHdDc2lvYnhRR0dkMmlNUlhj?=
 =?utf-8?B?WHNCaWk0Um5ScThqdXJtSVh5ZFI4amMwc3cwMWN0Mmd2a0kxWHJzZVc1VEsr?=
 =?utf-8?B?RzJjWEE1V3kwcVgrOHdWSkFtRXBTMXRuMUg3ZDJTYlN3enNGYmZpWGNjWXB6?=
 =?utf-8?B?Y205cHhnVjlQOFBCVkJsSitmQTJ2UVFYV2xrTmtQelRkdGdMcW91cUZNQmQ2?=
 =?utf-8?B?Z1BnUWh3YmIydStuUmZhSHFremFKNXRuQkpMb3QzSlliaTNOd3hEUU5yV01r?=
 =?utf-8?B?OG5SelZyVFhDdWhSZS85VUhNZDZGb2xOcGxUV0RwOW5YNmREeWdXdzRSRzEv?=
 =?utf-8?B?TllsMjFqUzFGZEdrZ0lqeXhxYzAwQ3NNWkdoMmZ1Slg2bXNGeGNUZGpKRUxF?=
 =?utf-8?B?RitvTjZtK1RiVW5hOGswS0Y1WGgwbUNDb0p2aXI3d3dTaS9JcktDRERMcGZZ?=
 =?utf-8?B?MkNnK0I2cUJzRzBESy9oZzIwR2VwWTFlMjc1VXpEOGwzbGZ5cDcxNzJLMmZN?=
 =?utf-8?B?WG9lbVhleEdFL3lyS3A5UTQxUDJYQjJQK2o3Q21Xem94MHlBcVJPTFplWjhh?=
 =?utf-8?B?RlVMT2lDME9scCt6eFlRbWptMHUrYmlDY09DdkRGR2ZCdFRGMk5oSys2MDJ0?=
 =?utf-8?B?T2pMZU8zVTdvZC9qQUZ3Tk9XRXlDQSsxYVh2KzBheDZSTFdsdzNkNG9rbEZt?=
 =?utf-8?B?T3J4NTZGTXBPQ2hLdlVhSnliRkNxaUVlS1oyaTNQNjlxK3JzNE5xcTR1dVRa?=
 =?utf-8?B?R3RnRXU4aFp1elJ3ZGQ0bVpENGR2dU14YnZZZzYvU0l1T3d6QzNKT0VITmVl?=
 =?utf-8?B?NkZPL1FndUpUTFpxQXh4clRFZFZITWRjMXdIdkJXeHdYNnZ2algxbjdPdjVS?=
 =?utf-8?B?VGpFbytoYjNBMTl6WTduM3BMbGUxYk9hZWEzZjJzNHlieEVZU3ZRUXNjOU9H?=
 =?utf-8?B?V3RHWGkxd2tmVmsxRDFkZEp4WitaOXJVMCtNWWoycEpJbUNSbWQ1TXh0c2t0?=
 =?utf-8?B?TkxoYUhVNDR1Ly9zNkJiRFhHN1VXTGg2alM4SDBxMDM4MXhhSVlwR01zTmtY?=
 =?utf-8?B?VkRmbmpjeExRcWhPUWlvQUZXbFRqQjhrSHNPeW5qTjJXVzdQKy9IZ1B6UkpO?=
 =?utf-8?B?NlRveWVVK3FBUG42aTBhLzRBTTFkTEgza3QvMHhaOENUS3FvL3dQTTVVa0hp?=
 =?utf-8?B?NVFuVGp1aFhuREd0MVFocGNQOHZxcFJrRnpYZEE5cmtXSzR2NE5UQ2E5K2lk?=
 =?utf-8?B?ZzFzVzdFODhjc0pyZk5ySFNYQ04xT2lkajBUaEY2TDhxMDU3SzV4a0RVRzlD?=
 =?utf-8?B?YmZ1d3hOZjI3RUhSMWoxaXdWakFVYjNGZlViOWM1UUNEa01xMmpoNVhNWTRP?=
 =?utf-8?B?RG9PWEVUUWxKOXFxcUNkR2dKcG9UWnR6SXIyMkN1eXFES05WT0ZXN0hNQ0pH?=
 =?utf-8?Q?STcjsSkYmDmW3FGIsXLDdOgGbAuJ+6fwMzmZY?=
X-Exchange-RoutingPolicyChecked: gO+/7G0tdO1U5njHVmvWGpk7lZ2IrLtxz5QVlhWx9Qw51+s3ErRfIp6QQLKxhMY2TWx0WMKEKns3XX9A00PpCqexwO7L1giWP/kfQyqkW+3/cdOJCzJoYbA/hT++m9Kxx1ychdt90gRfpqdSIhcw+dNFlxCwJufaBMAQoayzgSLYBmsVP/eMlDjR2Fwt8X28c+A2uIFU4Zu4k5HrOpT9uKU21udgo5tOZTBHS6YfKaSkVK1wQ83K+3KRSTeu/1u0DcXnveU4AwYGwaK3ba1PJKoY/2DpkLmWV+N5R0u2chx1jqqjKEbTxJ4IauJFZvrwW1dzJKmT0TKNPs6IHTJ9rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12db5cdf-2740-42e1-89fe-08dea66dedfb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:07:00.8786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGpUEPvBzjmev6KTp57eE0y9AaxwSgCM7cfMsUIEPrukrxLeoCd7KUmS7zqdU2UKAZtSkmGOfX7lHK4kbHINQRBG9fmNQReUgk4nCn0TLcGG8/mT2eqe2OtHwqXVKJHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
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

On Wed, Apr 29, 2026 at 01:52:05PM -0700, Wang, X wrote:
>
>
>On 4/29/2026 11:27, Summers, Stuart wrote:
>>On Tue, 2026-04-28 at 19:08 -0700, Niranjana Vishwanathapura wrote:
>>>In __test_priority() DYN_PRIORITY case, replace sleep() with a
>>>deterministic barrier using an extra queue in the same multi-queue
>>>group. After assigning priorities, submit a spinner to the extra
>>>queue, end it immediately and wait for its user fence to signal.
>>>This guarantees a full scheduler round-trip confirming the priority
>>>updates have taken effect before releasing the other queues.
>>>
>>>Increase exec_queues[] and spin[] array sizes by 1 to accommodate
>>>the extra barrier queue slot at index num_queues.
>>>
>>>Assisted-by: GitHub Copilot:claude-sonnet-4.6
>>>Signed-off-by: Niranjana Vishwanathapura
>>><niranjana.vishwanathapura@intel.com>
>>>---
>>>  tests/intel/xe_exec_multi_queue.c | 37 +++++++++++++++++++++++++----
>>>--
>>>  1 file changed, 30 insertions(+), 7 deletions(-)
>>>
>>>diff --git a/tests/intel/xe_exec_multi_queue.c
>>>b/tests/intel/xe_exec_multi_queue.c
>>>index 382705d065..8c6fbb2d18 100644
>>>--- a/tests/intel/xe_exec_multi_queue.c
>>>+++ b/tests/intel/xe_exec_multi_queue.c
>>>@@ -381,8 +381,8 @@ __test_priority(int fd, struct
>>>drm_xe_engine_class_instance *eci,
>>>                 .syncs = to_user_pointer(&sync),
>>>         };
>>>         uint64_t vm_sync = 0, addr = BASE_ADDRESS;
>>>-       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
>>>-       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
>>>+       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N + 1];
>>>+       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N + 1];
>>Since we're only really making use of this in the dynamic case, should
>>we have "+ !!DYNAMIC" instead of "+ 1" here? I.e. we only care about
>>the extra barrier one in the dynamic case?
>>
>>Thanks,
>>Stuart
>flags is a runtime parameter, so + !!(flags & DYN_PRIORITY)
>would make the array size runtime-determined — effectively a VLA.
>Even in userspace, VLAs are generally discouraged due to
>unpredictable stack usage. The cost of one extra slot is negligible,
>so always using + 1 is simpler and avoids introducing a VLA.
>

Yes, we allocate enough space required to handle any scenario.
That is much better than making the code complex to save an array
element.

Niranjana

>Thanks,
>Xin
>>>         uint32_t vm, num_queues, num_queue_priorities, bo = 0;
>>>         uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
>>>         int64_t fence_timeout = NSEC_PER_SEC;
>>>@@ -403,7 +403,7 @@ __test_priority(int fd, struct
>>>drm_xe_engine_class_instance *eci,
>>>                 .value = DRM_XE_MULTI_GROUP_CREATE,
>>>         };
>>>         uint64_t ext = to_user_pointer(&multi_queue);
>>>-       int i, j, sleep_duration = 1;
>>>+       int i, j;
>>>         void *bo_map;
>>>         num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
>>>@@ -415,12 +415,12 @@ __test_priority(int fd, struct
>>>drm_xe_engine_class_instance *eci,
>>>                  eci[0].engine_class, eci[0].engine_instance);
>>>         vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>>>-       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
>>>+       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * (num_queues +
>>>1));
>>>         bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>>>eci[0].gt_id),
>>>                           DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>>         bo_map = xe_bo_map(fd, bo, bo_size);
>>>-       for (i = 0; i < num_queues; i++)
>>>+       for (i = 0; i < num_queues + 1; i++)
>>>                 spin[i] = bo_map + i * sizeof(*spin[0]);
>>>         /* Use the default priority for Q0 because we are explicitly
>>>waiting for it below */
>>>@@ -430,6 +430,11 @@ __test_priority(int fd, struct
>>>drm_xe_engine_class_instance *eci,
>>>         if (flags & DYN_PRIORITY) {
>>>                 for (i = 1; i < num_queues; i++)
>>>                         exec_queues[i] = xe_exec_queue_create(fd, vm,
>>>eci, ext);
>>>+               /*
>>>+                * Create an extra queue in the same multi-queue
>>>group, used as
>>>+                * a barrier to confirm priority updates have taken
>>>effect.
>>>+                */
>>>+               exec_queues[num_queues] = xe_exec_queue_create(fd,
>>>vm, eci, ext);
>>>         } else {
>>>                 struct drm_xe_ext_set_property mq_priority = {
>>>                         .base.name =
>>>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>>@@ -474,14 +479,28 @@ __test_priority(int fd, struct
>>>drm_xe_engine_class_instance *eci,
>>>                 xe_spin_wait_started(spin[i]);
>>>         if (flags & DYN_PRIORITY) {
>>>+               uint64_t barrier_spin_addr = addr + num_queues *
>>>sizeof(struct xe_spin);
>>>+
>>>                 /* Assign increasing order of priority for secondary
>>>queues */
>>>                 for (i = 1; i < num_queues; i++)
>>>                         xe_exec_queue_set_property(fd,
>>>exec_queues[i],
>>>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>>>                                                    i %
>>>num_queue_priorities);
>>>-               /* Wait for priorities to take effect */
>>>-               sleep(sleep_duration);
>>>+               /*
>>>+                * Submit a barrier job on the extra queue to ensure
>>>priority
>>>+                * updates have taken effect before releasing the
>>>other queues.
>>>+                */
>>>+               xe_spin_init_opts(spin[num_queues], .addr =
>>>barrier_spin_addr,
>>>+                                 .preempt = true);
>>>+               sync.addr = barrier_spin_addr +
>>>+                       ((char *)&spin[num_queues]->exec_sync - (char
>>>*)spin[num_queues]);
>>>+               exec.exec_queue_id = exec_queues[num_queues];
>>>+               exec.address = barrier_spin_addr;
>>>+               xe_exec(fd, &exec);
>>>+               xe_spin_end(spin[num_queues]);
>>>+               xe_wait_ufence(fd, &spin[num_queues]->exec_sync,
>>>USER_FENCE_VALUE,
>>>+                              exec_queues[num_queues],
>>>fence_timeout);
>>>         }
>>>         /*
>>>@@ -566,6 +585,10 @@ __test_priority(int fd, struct
>>>drm_xe_engine_class_instance *eci,
>>>         for (i = 0; i < num_queues; i++)
>>>                 xe_exec_queue_destroy(fd, exec_queues[i]);
>>>+       /* Destroy the extra queue */
>>>+       if (flags & DYN_PRIORITY)
>>>+               xe_exec_queue_destroy(fd, exec_queues[num_queues]);
>>>+
>>>         munmap(bo_map, bo_size);
>>>         gem_close(fd, bo);
>
