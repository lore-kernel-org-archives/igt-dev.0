Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AE7C54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 04:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26AF98EB1;
	Thu, 22 May 2025 04:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0gZfgQ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D402898EA7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 04:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747889939; x=1779425939;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ik+iSf1FR2FYRDlb6ObG9VGzCzpPFiDA0kMoUtKevLc=;
 b=J0gZfgQ6KAf46It7pcSwcoNlEntThxao7e5KMp7DAaxOga4BkG3hZdTW
 mamvsmgM9UEsT037djD58fydQbVu4S9RoceSoFZ7LLz91FwHxp39qmE0m
 G4UmgJp0H1X8IsOlkNAV5VTvFQp4A1/y4X+BUYPiQlfQRuvkXBLooSqgH
 pKN4dhAEdyYfeY3qpjIu5IrF/hRLjJkcarNaIru+s+rGTreDpWpkW7xC0
 bW+skskTAPDWZymj9Ctyqdch6yYRHovNRPTPT9C02uhiVgdPfnHNMa9QM
 u1QzwbJA8rWhGLhpC179AhAXQYxSiVwLDdb/idokAWTLkYqRZvysiK9nC Q==;
X-CSE-ConnectionGUID: XAARCYd1QdmzCwNgIpUq9g==
X-CSE-MsgGUID: 60sclsKhSNqC/4hN+Y9ZSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50000009"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50000009"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 21:58:59 -0700
X-CSE-ConnectionGUID: nvZKLfzxSWeLb8tO30cZ4g==
X-CSE-MsgGUID: P7dzQqhFRr6mizKIq/nlNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="145381716"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 21:59:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 21:58:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 21:58:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 21:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4c8i7IQ3FdoBLz5UdqtgmWXgJZWbRlJZ2EjoxMhmTwAoGOvYQoHP1mTw5V36LobBfuoRSaqykvAi05kFTDQVKSQeb54mHcx8xnreu958PhEzivkppOUHQdD8bi8Hxx/SnsVJeCaFDwDFgQuG0gvIvn2nDze0YX+Q6S/Rn59BElblAYOb8HtdPkmmPDd/dod9q8nNPrzqJ0Tuae1EAZ1Ejb5kp/nHjJOFkVGLAWMG4EFEj5PY9XbisdepxQwLZGwLEOPoYhotosu2DcGE3EMYy4Na8/X5l60uA6t8HnyDf+iSd3Oriu3+KU0x8SXQLvYjqUV1NPE/1wcwKW4poLnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpxJ/XzMkbx8ZxwD3MiXcpf8bo/Eol7R9QqcMshCoK8=;
 b=OOdkBceOm8Nsnjoghc6U/kpTLVu00jtxxeKwO2jWCdVrTnP9XHDkru9sEGA4rMYlTwJhVzo404OIJva9b52BmgHRlKZJi2E8ACG+1L6hVfWXgPOR4lULC0MrS+vazJFOgWErpKht/A+FsHbMxqT9zSq2XLxlYnVkr9fSVt/m7NPx9AAFNW9m6PM3dJ3tqr7B/vIgyckcr5nsT4xpimVNYFvyn4jTtn01j07jGOxmy+nZfXmrgK+YJ6E/qjI04XquW2lb4OBmegkZ5XFjD2c0tfvunIPRhyCfjBfKbh/Ec3tKsqx8NMDbVJldpJ456wXU6JX0WCjvD3JRxywrzc/5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 04:58:43 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 04:58:43 +0000
Message-ID: <77117a19-3fcd-4858-837c-443878e77dea@intel.com>
Date: Thu, 22 May 2025 10:28:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_core: Workaround igt_thread failure when
 libunwind is not present
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250521183120.87121-1-jeevaka.badrappan@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250521183120.87121-1-jeevaka.badrappan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 661e6547-6271-4b47-9a98-08dd98ed538c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEhIMEl5cE0zTDNGdzZzL3JiTnZabDd1bTJOY2hkaVJwT2VXN0Q1UUo2STJC?=
 =?utf-8?B?WHpXbXJWTnhueWlKQXhLTDZ2dDZ4QmMzTlhkQytWcXJSZEtOcy9XTmtsRnpF?=
 =?utf-8?B?MnRXd2dBSllaMkVyT2J3eHpQUHdVK3lHT24zUEt6Wk9JeVRPL0NCaDlFdnVl?=
 =?utf-8?B?YVFpUTRQMzJxVHp3b3hRZlRFamVGamIyaWZub3lOczdqZjJFQUs0NnF4dDRa?=
 =?utf-8?B?cWRRa2F3NjV5MHJMV2RlNmxpOU1sU3RUN3c4VktVZHNzUzlubFFTZzJtQ2Fq?=
 =?utf-8?B?bnI5S2xNOWtQOFN1b0ZTV25qajZYNkhZMXFNQ0pIOVhOSjg3MmRBVlRTM0p4?=
 =?utf-8?B?SzRjTnRhdTF3UHJoaCtPUFJsUDFjMHFydTVNbTlxRVdadnZzTjlyRElCRW0x?=
 =?utf-8?B?WkU3b0FQcUg3aUhEcUtlbFBtQTJ3YTduZlQrSzBDeUErNklxSlBmTXNXL211?=
 =?utf-8?B?dXczRGVzaWtRRllBRmYxQThOQWVDTDRJU1RIOG9welJGbmhoU2F4N2gwNDVW?=
 =?utf-8?B?UjBmZzdwS00zUk0rb0JRYWE0ZkM5UlhhekpNU3ZHTHAzZFRHejY0dFdma0Uv?=
 =?utf-8?B?cUZ1K0ZPMElpRlJsN3pvUmR3U2RiaDZiM0ZCdTdxbTRBN3R3b2dTOVRBV0t4?=
 =?utf-8?B?VjJtMDUyZm95TFluTWxIck9NaUVwZElzNk5qc0h4dTZqZkJxOEpoU24wM2Fi?=
 =?utf-8?B?M1ozbkF2aVUydFZ2cTJpdnJmTmFNOXI5SjE3RzdPS09IaGtLa0g2enNVb1N2?=
 =?utf-8?B?V0VvTXlFVkpObUE1dGgweFA5bGtQZWNtdVcwMDVoWjV2dW1ZR09WMUszUS9G?=
 =?utf-8?B?eXdZMkNyUUE4b0l5U2t4WW9GaUJvd3RvblcyTGhZM0tzSU52NS9yOERoUm82?=
 =?utf-8?B?WEpidW9nYlpLZWNyWmYwZ0lFY0d6UGNmV083TVZXSWVWYXdKR0pwbllrVFAz?=
 =?utf-8?B?WGJPdzdKcG5aOGxZUnFiZDdpa3pVM2t6Tml4STdUTC94SmZRS3paVDQzVkpT?=
 =?utf-8?B?OU5xU1g0cTIwa3JhazVIY2liaXlkdjA1V3d3YWd4MVNpQnlHczZzOS9hTEpU?=
 =?utf-8?B?WU0rUVppUlNuT0FaVG83bXVHcjh1cUVXejRROHpkZDZuQkRydWVVNkVhMDhH?=
 =?utf-8?B?eEQybkNLWCtzL1BoVFZQNnlwbHdYTUVFcEgzSmcxOFQ4dE9UUHIrc2p2V1Q4?=
 =?utf-8?B?NGNnNkhoQjFFWUVBRHNIdEhLc2s5SndUaFlqYnpyNXpHRG53cHlCbkVDQTFL?=
 =?utf-8?B?UHpBc09jZzBGb3BaN3lPWlR1SHhNaXEwN21EZFdJajZjdFFXZ25CbXBHdlEx?=
 =?utf-8?B?SnZzaXJlMHM5MjdncDJkVW4rUVNFeGRFQnQzcHNVdGNmM3VOajlCQkZZR2pG?=
 =?utf-8?B?Tm9VYWRjdDhibUFpdmwvSjBkbzVDVmV6Q09xTy9Vc3NEUnhreld0aWZ6eURt?=
 =?utf-8?B?dktCVTdVV0x6RjlCQW5uS0VFNVRsbVdaeFhFMDdtT0FDM0hCdlhxeEJ1UFpD?=
 =?utf-8?B?WVAxa1JPekliZmhKRHpPSjJuZ0hISm5CM3VPS1labEZTL0EyWFVtTUl3cXRN?=
 =?utf-8?B?Q1g1dlY1TVc4eGZra2F5a1k1dE43Z29Ydk16OGlVeDdqbzJLNkdMTHJBTUQv?=
 =?utf-8?B?a1ZBd0QyTjlRbXY2bUhnaEdCbm9Dd2l0WEJtUktlSFBoZDZyOVpzWFQ5Z28z?=
 =?utf-8?B?dS9QSlhIYWNFTHZXczJaU3Z2OU9NMnpmaVlXemtiemdOemUzd0k5R3IrL09N?=
 =?utf-8?B?NFNORmFlNVI4MnlCZGU4QnpVbkl1ZFBhTDBrR3R3SDAwekpkdFRrU3VyRzl3?=
 =?utf-8?B?RWsyVS93N2V5b0lDNE9VY25CM1V6azYzMmZ3SE9hVXM1QmkrcnR5V1hGMEJT?=
 =?utf-8?B?NHI1eEQ4c2l0RUJJMjJsZ2lENlRYZ2N3UDB2ZjRhRkQ4T1IvOUYvU3VscFps?=
 =?utf-8?Q?SX14QsWxeP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVllUTI4a3pTNjEwQkI1TG1NU0gySkt3TERkVG1aTXZLNXc3MWdOZ3VGb2lN?=
 =?utf-8?B?R0dmbEdXYzZiWnFFOFE5L1dMUHg4LzNPQTBUN1o4N3lZVVRXZHdqK1RtRGxw?=
 =?utf-8?B?aytVNzBxTGZKRFhsWktBVUZReEluZE5iRGUvWGVaTDZackRKRExJRjkyekxH?=
 =?utf-8?B?Y1ZYQjZSTnVUUFFXaGI4T2pYSmpNOExYZWZlYWRuUmJ1N2Z2ZVEzN2pzc2lP?=
 =?utf-8?B?RWJxTXl2dUtzRXZLTHBRZCsvaVBScXBzWHViS1pldWVub09HejNFT0k2dXhu?=
 =?utf-8?B?cnZPRlJEdVQvR0NyNk1UYm9xb2ZuMGM0VG1pb0VJZy9yQ1NzamRDbG9hY2Jt?=
 =?utf-8?B?a0lYcmx6MHpBZUpJUGJqYXZIUmNVR1FJVExEZ0RoNVVpMUhEQlJvS0tFVUNa?=
 =?utf-8?B?OGphZWRLSVBEWkcxakIvOU5ZMjYzYWJkMVN3dlc0THQyVHNnVDE1bnZMU0s5?=
 =?utf-8?B?a0V1RG8weCtoVjFvRkdQVWNCUHlqaUNCY04xTFVraGpHTUxLUlljajBwelVP?=
 =?utf-8?B?Y1p6MHdZUmY1QlFWeGU1ZU1May80R3REN3ZrY2xLT0dIdG9IR3dvdEJKY0VL?=
 =?utf-8?B?bitoV3FhMkV2MXppZ2NXSHhzVzZ2ZHZwYndvcUIrRkpGMGV2cFB0Vy95VjJM?=
 =?utf-8?B?Q2pjaXduOGVyZjljdVJJS0tZMFFwMW9uaEhMMGR2ckpKRWJMT3lJSDFjRmJv?=
 =?utf-8?B?cFBkNjB4TFJWRGRHT0pqYlhaQ0pRc1BKUkRJZWwvNHo4QmVtdHd6YU9KZ29P?=
 =?utf-8?B?THlGZzdrVUZUS3ZSNzM3QnNaSkZJeXVpak5aYjgxeEorUmpJbTdjUjJRTjlY?=
 =?utf-8?B?OFFkSjJIbWU0RDd0ZElCSzd4RUhwcmJ4K2lVeWIwRnZBaHU3aGxGNkdhNWpq?=
 =?utf-8?B?bWZPdXRNbWVqMGk4RFh5MG9Gek13YXNDZnNQNXN3djJYNEYzV2J6RUNJcUt4?=
 =?utf-8?B?SXhucm9zbzdXY2ovdklzdHNvL0VGckVJbE1CRC9IVlB6VW9SK1M0c0VJbU5U?=
 =?utf-8?B?aXBJU21jSndTQytIU1E3SFUyWFVEUjJQTUNZQ3U0cVg5YjFoVEpyQ0tlRzRh?=
 =?utf-8?B?cXBWRWhldXQ0NUNrZk1VSTk1WFhkWkh5NkJNZVp4akRJRGFseVhHQmlmdG5D?=
 =?utf-8?B?ZDhCV0VBR3p3YytWaXlOd1NPRmF0NnRiUnB2a0c5NzVMTkVLczFqTWNsMEZv?=
 =?utf-8?B?b1J6QUJ5K013enJtVi9TMFNsaFlrNzk0TWZpYUppWGZHZkFlL01JOTlrYUt1?=
 =?utf-8?B?Y3V1SldGNDE4anpINElXNllweEhjaWJrUG1OVDVTUktWa3U0RDdBWFY5em1Y?=
 =?utf-8?B?YkpCbGxzZGVHTHBzQ09LQml5WmVMbGN3YUxkazEvbUFUMTh4OXN6R0tEOVho?=
 =?utf-8?B?U0RCYVpqSGtVckFZdkNoU1JPMDRLNHNxVnA3eFZDRE9tOU1TSStGUUltT0ZV?=
 =?utf-8?B?bmNBQWROTlNSajVFSnBLRjl2bEFCcnNXWW13Q0tKWmQwVFM3Y21ybkZwUk5s?=
 =?utf-8?B?MW55YlF3dE1BTzNvcGtIWVZSajJCSkpHWkZFWEVQYjRnVCt6Z3BHZ2ZoT3NT?=
 =?utf-8?B?TzdNL0FWWmdxZHkrSkhvaWNLSms4VkNTbkV0K1k0eGRzcUphVko0R05HRlMw?=
 =?utf-8?B?QlpJT3lXTTh0TDVHK1Y2ekE5TGZycW5JcllabG56RzBxVDlUZStYOXNnRGVj?=
 =?utf-8?B?UHFjNEpEKzhHZVdtMkVieTUwaWl2V2xYeFVEUXVjdFNEbkFhdmU1SFE3Tlls?=
 =?utf-8?B?NTdTOHo0bmV0amRlQTVtdXJ5QnZGaEFtK1p6cEtoWU5hS3J2Mm13Ti9iVEdu?=
 =?utf-8?B?QlZqYTZMZjFQWk91SUJQRUFNekErRndJMlNQa2ltd2d4bHFKcmhMSDJSdmJv?=
 =?utf-8?B?b2ZhZlFrSnIrQnB3VDN1cm9Zc2pMdzFHaDJrVXhlanRuOHBkbHVxdjJqVHZ1?=
 =?utf-8?B?RjZhczhXeWxrVzRRZzdURytjaHRhR0F3K3RmVFRWZHFhc1RYTHJoSHFKSG9B?=
 =?utf-8?B?RS9lTWlTcmxlWUlYbXUrWHhZZWxKWWRzTStxdzVsUXl6cStaelpSZWNWc1Fl?=
 =?utf-8?B?Z2FaRVdQQlhNRm1UWFNpNmJtMXVIRGJoeHk1TXVzUjA5MC9XdCttVFl0ZmN0?=
 =?utf-8?Q?fvj+siRHT1yMNfKDB9DqLiHpV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 661e6547-6271-4b47-9a98-08dd98ed538c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 04:58:43.6190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKjfCX2Klq0HfyQD42ZMqyZ/rHjJZxuEL7hwyVEyMkaPXkzfKoB2QuPjZbP+E3lmwDdvZJBB8LanO381n+1XVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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

Hi,

On 22-05-2025 00:01, Jeevaka Prabu Badrappan wrote:
> igt_thread test expects the test failure accompanied by a stack trace
> and it matches the trace prefix "Stack trace: " to determine test result.
>
> With the commit "Add a dummy workaround when libunwind is not present",
> this trace prefix "Stack trace: " is not printed, resulting in an
> igt_thread test failure.
>
> There are 2 solutions to fix this issue:
> 1. Print the trace "Stack trace: not implemented"
> 2. Run the failure test only if libunwind is present.
>
> This patch implements the first approach.
>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>   lib/igt_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index f698494e1..b06cdfd89 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -378,7 +378,7 @@ static int _igt_dynamic_tests_executed = -1;
>   static void print_backtrace(void)
>   {
>   #ifndef HAVE_LIBUNWIND
> -	igt_info("backtrace not implemented\n");
> +	igt_info("Stack trace: not implemented\n");
>   #else
>   	unw_cursor_t cursor;
>   	unw_context_t uc;
> @@ -2242,7 +2242,7 @@ xprintf(const char *fmt, ...)
>   static void print_backtrace_sig_safe(void)
>   {
>   #ifndef HAVE_LIBUNWIND
> -	igt_info("backtrace not implemented\n");
> +	igt_info("Stack trace: not implemented\n");
>   #else
>   	unw_cursor_t cursor;
>   	unw_context_t uc;
looks good to me.

Reviewed-by: Sk Anirban <sk.anirban@intel.com>

Let's wait to see the full results from xe and hear any additional 
feedback from others.

Thanks,
Anirban
