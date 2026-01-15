Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B653D29FFA
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 08:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D5010E6ED;
	Thu, 15 Jan 2026 08:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRaKxi8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAF510E6ED
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768464249; x=1800000249;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XPypvsMa36CVCDEcUnnEsJeKEHSJjG+Iwq8my+gYLyo=;
 b=TRaKxi8SK3aofd/2I6rPK9gRVbkgFFUg0s6iNNoXkCxdGkvAe0UvgFjC
 7hDLHz+a1mcEE/0PbJlGLwLx6N7sWRFYUfixQXi6vqQohPiX6fFfwZAbe
 pI/g4RweL8rAqTu9go0zUrnc4SIoxuKYoAy7BRL/INJz+khzkS92Q2aXS
 zSFy9qgslp+H/ZOFI8uFeFTmrOMFJ+S80YHjM5rZtUhuUQevDPlNLz5t7
 P+OT0usSTxy8408GPgUR++VlUZkOfw5JVnLgVsFCVq2lPvWgRInLKGVMD
 jrPO3OqCzuknnXt/ArZHPKuV7c/JduFoSdiAhIGqT6fQRUehDz0VKrVS0 A==;
X-CSE-ConnectionGUID: 6YaiM44cRjCd7sJPiQEW3g==
X-CSE-MsgGUID: luluoFm/Ty2pP/l2PFhfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69824354"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="69824354"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:04:09 -0800
X-CSE-ConnectionGUID: oFWjxGp8RtWkJ/yaiuJyqw==
X-CSE-MsgGUID: y7GBEfGsQWOhwE4IdzI6fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="209400649"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:04:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:04:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 00:04:08 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:04:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkOM+DOms89ZRVchitYNPBjGHSs5uhB/2znKGj8NbVnP4UQRR1osLBEocuYqur5W9OjUO00lMY7IRthZrxsoKmIra2L3XqLOfFpAClegHZVQKxYQQRkLxytoqArabmopjRGHaMaqgGTXD3oYA6aTTGyXB0zeBZYSKYwpb4A37NlMzcddAes+BPwD4+Ton3Lu5LAILhzV5e1uyQMrrPxq1r28MlDhXmgtz/sRn7O5nM07m9ohDtgIblXwDf5iBwgSiRQDQs7vE76aCQSmAdVrXcAyC+Ff6/NLMb+zaUf3QfNHl0lAEEcJFJQrQnFHwoNMfDw3kePI3wQJAwL1GB0AHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fw+OAFB23d5wXGnFoI4THIMIAuen0MC0iC0oMpV+brA=;
 b=sSKVWqexxgTSJaxLzw04zsS8xlfOjTtRCg9izPVaostwyChQrPDiyeMK6/g15n0xtAOV+OTLb/DhRhk2zWVkzVMHESipHNYh7TOFS7o4UNR8zuzLXdGWDXEmxMaXULWCtTJ/e0oIl0Vn1taZ8eMxF/JOlhjBus3HUpiiDpvR0VVGSYJDL+7MbRMicLCHVqiMav/lbSXmVKStmVVoIOAe8dfoncUpVCq/LENFvNZeP9TnQuaHbaZfmnwn6yw7ghJL7yachcXVOiOXxk/8JwcqdpBpY6Wkv+K7En1OrDCDe4iM83Y/bcPxPSAhvR1CSsQ5+RxPlNc87hrP9hmU1XmSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 08:04:06 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 08:04:06 +0000
Message-ID: <0e12874e-fdf9-4e5a-bcbb-294b82765c55@intel.com>
Date: Thu, 15 Jan 2026 09:04:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 04/10] lib/xe/xe_sriov_provisioning: Add sched
 priority mask to string helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-5-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0102.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::31) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e685d3-d2c9-4cd0-53ec-08de540ca78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzhYMmh4T3dVVjJvNUVVTjI5NzdpaTZwenp3d1BmeEt4TE51cXFqbUFmOGsx?=
 =?utf-8?B?dGlRUXVQd1NnSjgvV1F5azdVNVI3OW9sbTI2dkFLTW5GdXRsQlVTVUpkdE4w?=
 =?utf-8?B?M2ZBdkxoYUlZcHBtMzJDaDhVdFcwejVzM2xoMEdmTzZXRXZBZzVNTEFkaFhp?=
 =?utf-8?B?a0lCK1ZNb2IyeS95Z3N6dzZxWDZkOXdhcnpJNUw5U1BIYWpGWFg3V2p5TGlp?=
 =?utf-8?B?T2NEdlRQQTRXaWFQMklORUZBeWdaNTRPSmQxUnllL21PYllScTVEQnBQMlV1?=
 =?utf-8?B?cjJMSzZkb1BaekRXZVRiVVcraU5aUWVUQklZM3c1Zy9oSTdXdGYzckdhY05I?=
 =?utf-8?B?QmladHFvN2hidWVGb0hKUVR0UU9rTmluQWtwZlRaUFRWNmJjc083Zm9xeCsv?=
 =?utf-8?B?ZmRXRUwxUlJvUEdYcnQ2RkZHaTNKT01lZy82eTNKTHl5WWtNQzNDK002L2JK?=
 =?utf-8?B?WjJpdXhScUplWnN6Z3Q5TTk5cm9vVkdHdHdrUHE0ZHhjV2YzQ3N3OXNwQ1dj?=
 =?utf-8?B?Z1dsZW9DT2xTU2t1TWlIZ2M4a0I5SlVmUCtGT3ZpTm5PM0VscXlzV1hGL3dz?=
 =?utf-8?B?enYzcUljWjlUQVRjOHZaa0tBRXpFa1M5RE5JUWN6Zlh2V3lBaHhyVE93RnZv?=
 =?utf-8?B?RlRzdW8wckdjUnFoZlI4U1YxZ3Z4Qy9aQ3FhME5ja0dTaVN5NUcrMm4reUFx?=
 =?utf-8?B?OVFKSGpqaUgrbjU4SEloNHprQWc1K3VwSTVEMk1HT2taMHR3amtoTzlNNk9r?=
 =?utf-8?B?N09WbUhKWUxsakhvK0tJV3d3WlRIOTIra1NmaUZIN0lFSVI2RlNUeGFPeGNP?=
 =?utf-8?B?WHhzRit6QmxRMGM5RUhoWFg1bkhldVpiZStNUHdRcTJNWTdtRTV5dVRXelVG?=
 =?utf-8?B?b0R4bHpzekxDRVRZa29KOHBSTWN0MWdjQ0Q1amNWSVJKRk40MjZPQmpYUlBk?=
 =?utf-8?B?MnROQUxxWUxXQzZFRHBpOWxQMHE0aEhWSFVQNUZFZTQyUWFFZGh0d1VLZXo1?=
 =?utf-8?B?a3R6ekwwU3BkWFgyTTV1WlFCK1JnRlA0ODRBOWVPQTZLa1N5RTB5UjVQL2JH?=
 =?utf-8?B?WXBGaFRHSnUzSEgwTXdzRWdIcnVjZXBPa241cWxCQ0NLcUxyc0RvNDR6N3Vm?=
 =?utf-8?B?UTdDbmJQVDFFYTRlTDVrcDQveS9WK0g2NDBjTDNhL2V0T1JMS3pJdkJWWVJs?=
 =?utf-8?B?MDRraUVoSDF4Vkl0NjM3R21uWDZYY3M5YklkaTNIMVU1Z0dPZGxHL2Q1SHdM?=
 =?utf-8?B?U3c4UGkvbE5Bak5wZGdpUFNVYnNmSUhCYnVVSi8zQ0VYajhScHo0akcxcXlo?=
 =?utf-8?B?RXpKRjBneWxveE1nWmM4Y04xQWgvbWxycFZTVXc0QkFKOFpZNVIvTDA0UFBi?=
 =?utf-8?B?MWhQdSt4anhiVDBPVWZsUzg1VkZJVzZidy8xSTNJb0VDMkkzUjFJdjlUZFIz?=
 =?utf-8?B?Yzl3UDJtOVd0Ly9zQWd6RDE0TU5xRStaTXFPQThUV1gzbC91SUxqZUtRME1J?=
 =?utf-8?B?RWpSUnNNTWdnSFNVaHUvTklZbk1sZ1hHZUZSMldHQ3NtdWVpNkkyN0lJbC8x?=
 =?utf-8?B?QnliUmlIR3VrczJ5eHdsREhFQlpOVG1XSjAzSkUya0xYSVBla0RTR1p3YlA5?=
 =?utf-8?B?OWJIK09WeGpzSmFGNHplUzhaYk9uNytjRmsrdlNwemhBUXNtTEVSdzJCNEkw?=
 =?utf-8?B?d2lKUktjeWF6Vk5kdHBNb1hYWXNoSWF4N1lPQTdEbzI1VUlGZEZKNEloOS84?=
 =?utf-8?B?cDE4eHVpSjZFRG9WTjc4UlpBZERpdWZEMkVhRmw5aFl3eVduaEt3dDJvVTdS?=
 =?utf-8?B?MWpURVloQjJocjBCK2FRb3BBa2FCWUJZcWl0QjZKODVuSS9GbjFtMEFKM2pB?=
 =?utf-8?B?TVF0RHdlTmlEeW4zMTZhWTFLNDV5cmpRNDR4eXd5eEF1NW5KNUw3aitRejNM?=
 =?utf-8?B?UU9nVUNGbnlLbFZjb0dUK2MwWGY3akI5RVpSajgyYUNxN2hwMVZnS1dXaWdK?=
 =?utf-8?B?VUU3cW9qTWJHNzFkT2hiSmpJNDlmQ3kxS0VIVStmVEs0V3BIdGV3ejhOanZv?=
 =?utf-8?B?QlYrL0hxUUJxQjhCYjlOTmUwVGltYU9NVzlWd2RNeWVHWktjejdEY2hOZnkx?=
 =?utf-8?Q?BNQ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VUMVJrdkx5MEVUZ0NqQzhyc1VZRC80TnVubFZjU0dLcXAwd1REbjYyMWtD?=
 =?utf-8?B?NGdSbDUrUm8xb2RZRytZN1F1YUcrWW94M2l2dko4RTFLZkpLRnRUQThGZ3ZR?=
 =?utf-8?B?Y3V0WjNTMi9qVVMwRURHZi96R3cxdFU4aXl4S1lueHk1cE9mWTNoVnkzS2Fq?=
 =?utf-8?B?WVE0b3p3ZGl0RzdSbzgvZVRBTnErZ1gwZDZjY0dFckhrQ3E3WVh3R2h6a25q?=
 =?utf-8?B?ay9kVEM4R2N2RlVuRjJlZkRCNGFXYzg2WVIzOW5ReFJHNXRYb2l4VEw0Lzhm?=
 =?utf-8?B?a2VIZ09Scy8vT2k3RWlPa3dnZEgvOEQ1RllnclFFUUFNWmdLcWtOVW9LYmgr?=
 =?utf-8?B?OTg1UXpQTmpYOUwzeE5LRmZCdE4vdGg1Q3NsMGJGTUZ1UHV1KzVVdlFERGdo?=
 =?utf-8?B?Y0VQTkdvWTIyczRlQzlldUtHaWJ5UUxUc2NQV3BtdC9LNzFLV0pyTlYvR1gy?=
 =?utf-8?B?ZENidnVvbXJQU2JzVnA1bU96c2V3SFBOZ2pMZC8rdUxBODIxcDl2NUhVdjB5?=
 =?utf-8?B?U0YyM1B4RXZ1R2xCdkpsbWtPR2JTR2NOMmN5cDZhV2pVRktuNXYvaFovSjdJ?=
 =?utf-8?B?eVJFc0VtVkFpV2JDRk5jT2tsRm1PdzlDTUIrU0NvV2QxYjloMXRrMXNMbGVK?=
 =?utf-8?B?QlEyOWdwdXlFakJEaTFNSHFHcXBWbWU3OXlCbDRiaUlLRkJHRkRIdHlxRXcy?=
 =?utf-8?B?bWZEd1N5NFV1L1VkMmhJZE1Ydm56em1CdmlPdHg5dVEwckFtWDJRMlpoUVZJ?=
 =?utf-8?B?NW1iUFBIeDgvRURnaE45a1VmTXovbWQ0UG1qZVpzdGQ0QjR4MEhyUkVzQkRt?=
 =?utf-8?B?L1FYbmE4Ymh6ZVh0Ly9lNjNXL3JidDNydUF4cXl4U1Z4T2ppdmNmT0dEaFEy?=
 =?utf-8?B?Rk9BSTZrM1NtS3RCOWJEU3d5SHZ3RzQvak5Ga0IwY2QvVDZ3VS9FcHdRNWcv?=
 =?utf-8?B?UG1oc2x3MFBxWU51Y1dPRytydUpUMmJ2R1RhK0tmeGRQUUhBcE5hbG1BYndH?=
 =?utf-8?B?TDVPSGhMem0rYlFIeGFXNjgrUG9nVVpCQkVtQmE5dDUxYUluMkxCYUJRT1dB?=
 =?utf-8?B?aDh5N01KRWtROHRocGpvVm9jdEIvWE1SbmtCd0cxMlkyL1JZQUhwK0VoMTlF?=
 =?utf-8?B?bHQyNUtJdjQ3WHFqRGR3ZlZ6QWZIWng0WEdUMG1kVGxadDZ1OW94bUR1Q2dD?=
 =?utf-8?B?VFRRL21McTY5TTFTaGo4eTF0MC9QUWxxdzhOa0VFQ21RZ2x0U2RUNDk1dDlv?=
 =?utf-8?B?RldITzVVbENEelFkMGNscnZVVjd1OUo0MnBKUGxSQVd2ZW5pallLRnZQS0xp?=
 =?utf-8?B?dTNEOVYzN1pydjFaVHF1b2dCandPZ3pOYXlrcm4vU1ZaRE9DRUVaUzlIRHRB?=
 =?utf-8?B?aFRuVUF6MHZVelk3TFk0ME9VbWl1SldVYlBtVG95aVNpaXpUUHhEQ0ZyMEp2?=
 =?utf-8?B?SU1ZOUtYa1dLMHJ2VTJITmx6L3c5d3J1WTd3b0V2Yit6NiswemFNNzNRNWw2?=
 =?utf-8?B?OUJKMVVPQWhmdWRlT1N6Mm1idFJ6Q1R3azZPRkhiZFdsWTJmL2xyZkNXSy9T?=
 =?utf-8?B?bzFlU0orNE5ueTYvMDNXclNlN1ZxbzByRUhKTWNtQWV2cjNQbUt1NFlQREh1?=
 =?utf-8?B?WUQ4Q24yS1MzWlQrUklPYnlzd2x1VWxTT2JiWnRkV255T0E1RWxYdEpTYjhM?=
 =?utf-8?B?Q284S2JrNi8zREc3eDhnQ3Q1d1FPaUtzNndiRDJkMlAzTEdabXFvLzlTS3Zq?=
 =?utf-8?B?UENiTWRZUHBDaXZUOE9CL0JYelJFQlpLdTFyZ0wvcGhWTFhiR1FjaElYZHRq?=
 =?utf-8?B?aHF0NnhqVXBWaEh2L1hTQ0RYc3BvdThWb29JZ2JNQXlWSzZKZFNUSnZrS0FU?=
 =?utf-8?B?cWo0ajk3TTh5RkI0Y2ZEZDY1ZzZ4QnZBWXU1V2hBWGZMRGJDc01QYXNiaWUx?=
 =?utf-8?B?N29UUzQ0UFhOT0x6MmRzazQ0NXlvS2VJTHBMSUxuazNudGcrblBQOGNieGl0?=
 =?utf-8?B?MnIzU2FXeWZMeUJwL01BaHc2eXVYN0c4NVI2b2NlbThvMHQ2Tll0eVdmVi9T?=
 =?utf-8?B?SzZIWWtuc2tZc2JDbTVWUVJQOENqaGl2Z0NTR3NsSEVxNXNxanNaUnVDa1Y2?=
 =?utf-8?B?N2gzZlBlWDRXZFV3ZEZlZlVhT0ZBNXpsQ2pQNEZRcTJZVzhhL29CUlM3QkVG?=
 =?utf-8?B?OWF0bXpLajdvaFFSTnFMRmluY2t2NE9zM3AxV0FPMDFWYzlwYkJrZmo2c2lR?=
 =?utf-8?B?MHhuTFBYN2Q2K2NMUXdwdlZPVUxCSDVsZEJZc0FHNW1DQTdWRlNxblBnOXpB?=
 =?utf-8?B?bXNRVWJnNVJ4aDY1eFRaTklqSE00QzhaQUpBV2FsTTNlZEpCMjBpQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e685d3-d2c9-4cd0-53ec-08de540ca78a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:04:06.2157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOhnAcW6kvQnGw23Wrn8QuaG+oAWtHm3RmbgD6krKhER/ZnouNG/N6NWpVQCPRU4ekbwg7NonJc3VegCqi/RUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
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
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2:
>   - Use BIT() macro for sched priority masks and drop static asserts
>     (Michal).
>   - Converted both helpers to thin wrappers around newly introduced
>     generic igt_sysfs_choice helpers (Michal),
>     avoiding the need to export the static array of priority names.
> ---
> ---
>   lib/xe/xe_sriov_provisioning.c | 32 ++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h | 13 +++++++++++++
>   2 files changed, 45 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index c2a1db4bc..929863059 100644
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
> @@ -657,6 +659,36 @@ int xe_sriov_sched_priority_from_string(const char *s,
>   	return -EINVAL;
>   }
>   
> +/**
> + * xe_sriov_sched_priority_mask_to_string - Format priority mask as text
> + * @mask: Priority bitmask.
> + * @selected_idx: Index to highlight with brackets, or <0 for none.
> + * @buf: Output buffer.
> + * @buf_sz: Size of @buf.
> + *
> + * Converts @mask to a space-separated string of priority names. If @selected_idx
> + * is >= 0 and present in @mask, that priority is wrapped in brackets, e.g.
> + * "low [normal] high". An empty @mask results in an empty string.
> + *
> + * Returns: @buf.
> + */
> +const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask, int selected_idx,
> +						   char *buf, size_t buf_sz)
> +{
> +	return igt_sysfs_choice_format_mask(buf, buf_sz,
> +					    xe_sriov_sched_priority_str,
> +					    ARRAY_SIZE(xe_sriov_sched_priority_str),
> +					    mask, selected_idx);
> +}
> +

missing function doc
And I think it would be better to define choice_to_mask() first.

> +int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
> +					   unsigned int *mask, int *selected_idx)
> +{
> +	return igt_sysfs_choice_to_mask(choice, xe_sriov_sched_priority_str,
> +					ARRAY_SIZE(xe_sriov_sched_priority_str),
> +					mask, selected_idx);
> +}
> +
>   /**
>    * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
>    * @pf: PF device file descriptor
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index c9b321d58..c4a11e4c0 100644
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
> +const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask, int selected_idx,
> +						   char *buf, size_t buf_sz);
> +int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
> +					   unsigned int *mask, int *selected_idx);
>   int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
>   				  unsigned int gt_num,
>   				  enum xe_sriov_sched_priority *value);
