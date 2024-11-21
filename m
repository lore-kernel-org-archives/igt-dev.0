Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ADAD6ED12
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D4B10E3F3;
	Thu, 21 Nov 2024 12:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSbg9LtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B410E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191188; x=1763727188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/4NJR4DN/A7nr4ShLpRUyhAqHqLZ8rSDtdrzPba5kv0=;
 b=ZSbg9LtG8mhqFb9Ih4G491U4CiM9zBLzb8sSW3bBp1VnHvW+bGdC+KCx
 RxUrKQMbg2xWj8mwHrwWW+NjuWG+sEbXJBKooypUYgtHTgTjOrkt7RSQW
 x8iLXZt+KSac9XFyAgYGPbFZj6PyhgoiTNRhSfDwYzCY5h+lPH7I5IR+R
 C8+FQdppQgHkhmZ1bkoHv5hB9X9INyqfgHZ3hcRjAXGQZd/MLiahh4SxY
 pjwiOM72rgUA3jLTLIoEQARK8dCdaTyQl2BRK6mx2ynM/KozsQhIHJdX4
 gID3nJ2XkCXmBXlaCiwaxWNLwc9Qzg0H/34gL6lrJACzqJNx5JiMDeCqt A==;
X-CSE-ConnectionGUID: wmoG88OsT36w2UwDkleNkQ==
X-CSE-MsgGUID: ZnPwl0xZRoumpankl3ZOaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54799425"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="54799425"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:13:08 -0800
X-CSE-ConnectionGUID: 5VvEwYJsT9avTiqWxCGPRQ==
X-CSE-MsgGUID: jEUVjR4XRnW4/dJgVvhROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="95301979"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:13:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:13:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:13:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:12:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvxxgp3y4/tBhUGAnJ/8gj5VTO60jAJukiyn1VrFeIIhKMBZMXS0cyiqK8HzGrs88y2cn99vpgp0BBUV4tG0mHLyk9sA3ujzsirPQzXrPP3bnOwp24mt6AqMvL4KCIbn6QDUKc4pKRMKXFWr6FpcDF/OKlt65HME9hX+5nx4VWQ714bGjI6SMDeR9e82QEk/GYrhTz1BNAxNo1W9zymGhSVGe4D5ZTr1aKnQHh62PvHH+KWauqU7mHtRLNAwHkYT4EtoJjIKnKYqGovPfMRVDSw0YErFsWjFjcBvHdzVKWm/eyFLllKMVRUqH0d0u34MKjpNcJg4yrTMltA3gh3dlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A10E+ABecT4/KFt7cQh7LxAWabSkF0OMwnsNx5GwB5k=;
 b=QiFKz6HLdQBbxs9VLY611PWjyAdhqmLSaOIm6SPe+zpDS61Grd64ue5vrR1f4yfawlRb1Nvl7CNh9a6qFnpIc+HMHlOzwxXLpdKR+/9r/fSPgm15XJUQSSNqKouRia/yCLeEpPrxy+XfMiWx58yPDBwymvruwIn+2JUB8ALEgCdgk+DbZMYALHaF1ck235ZEDcBv2Q5noevcfJSmsYxbL7ngAT2SRyEJ7BsV+f93OQRebDEMFC7aDZeESQ2cnxM7JKmRuY8SLmON1UD7ZzhzgjoCzoLyN7PCvxLV+KsWE59CWLB1zfWI/2aKzD0kflHeJLO/cMO73yBrhDPkGHDB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 12:12:31 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 12:12:28 +0000
Message-ID: <497ad076-0d8f-49c9-9cee-713443cbd570@intel.com>
Date: Thu, 21 Nov 2024 14:11:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
 <b010f47f-1819-4d4d-9bca-8871b2d29eaa@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <b010f47f-1819-4d4d-9bca-8871b2d29eaa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 9728a551-5a58-4823-b36e-08dd0a25c44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnNQNjFicitDZmJRUC9hbkVtdkFMZFg5M3RIdGFmSWtiWHFDL1ZxQjJhcXIy?=
 =?utf-8?B?eEl6ZjJ0ZkVCc1YzMU1CQk0rMXdzSXduMHNLKytPUlNBYW02b3gyZW9MNFVB?=
 =?utf-8?B?WFQrL2c5cHBieTNPKzRFLzRsbS8xV2lGS0M3SjlDbDNyVi8vcG9lVVlwbTlz?=
 =?utf-8?B?MjFMMjdMREpzSXZaLy9ZNWRHdU9WT3N6UUpSaTZXSVc2amM1ZTdMeU9zUUJU?=
 =?utf-8?B?V01EVXdxeWNFT1NtR2ttRnF1Z1RYVHkzbC9oQWt1a0tYaVR6N0ZmY1VhMk82?=
 =?utf-8?B?WTRic3JvakdIYjBQQmJhbk5JQSt1QTZDUW1mUkZpZDN5WmRBMEZUTm9HUjFK?=
 =?utf-8?B?K1JWWXhTSkdDdlNhcC82Q0U1bU1wWTE3V0YzZnFUdVl0eDlUT3hPU1NKbmNJ?=
 =?utf-8?B?SkZXUHNIZ1dkSzVjb0NUUGZ0dVBpRHNLR1FtSWdZODB5emhuZTBOZ3I4eWRi?=
 =?utf-8?B?Z1BxdWdVNjhTN2xNYVNQSXVkUlQ5U3lrYlJVL29GemxtUk42MUVDNlVKdEpS?=
 =?utf-8?B?YW85ZHhwMzMwVmpLcElGdm1ERkoxWHlhbUlNNlBHQk55T2JNSC9TTmZhZ2I0?=
 =?utf-8?B?b3p1ekQzR2VGV28yZ3F1RENCVG1LVTQrOHNPK3orZUdFTS9sUjE3MDRlcmxs?=
 =?utf-8?B?d2RWWW5hT3FkTXJMRzVIb0dJQ0g2cjEvQThuSEhBSWxhNzdSY0I1M3ZQNzlx?=
 =?utf-8?B?SUFTZlBQSHZWejU4N1V2RDdOOUw1alZkVDVLWFdrS204VmdwanByMHE4eHlT?=
 =?utf-8?B?dXljOWg5Yk0xQWdRbVBnamxzNkZCbjJZT0V6akwzaDVyVDNZT09TTldiTVBV?=
 =?utf-8?B?cHJzQTlzMmwwSThCZTg5VlBWNnFRbyt3Z3U0SDZoNWh2TFVYSXd0bDI2TG9T?=
 =?utf-8?B?eHFRTXdBUlVtQ3A1ZkxNaFMxWkpyNlBPQ2JnRW9abCt1NXU0QkNHYm14ajMw?=
 =?utf-8?B?dk5yc09BOGNOdEp3c1BvV2x2VkZSbzlGem5vcC9Zd2h5bVVuMkNqbmFhTkYz?=
 =?utf-8?B?WXFkSDNBbE5uTitHUk1nbDg3dEVTMHVJdnFGbENFMlVvSm4reUhZaCtaZnUz?=
 =?utf-8?B?ZXFXT2U0aXdXL3RFQ3ZOcDlycUZRMHYvQVBCMWJBam05OXBrczZZS25aVW4y?=
 =?utf-8?B?b0pNZmNIUXBuVVFuekw3MlBlSFJreUMxTmh3NDlMdGluS2RQVDFIS0tXMnB1?=
 =?utf-8?B?d216UDUxNjM5Ui9FK1E4TkE1QU9NZkhBY25KaENrMFoxUUdSaW1OK2pnRFQ1?=
 =?utf-8?B?WUhTRmpiNW5heFovaTZTNXM0SE90WDMwbzBZMmk4WE1SVWNIemlleW4zS0hO?=
 =?utf-8?B?aGcrMEFaWGI3SlFRRnVYSTBLNHEraWtvQnlTVlMvaDRYeTBvSVdPR3RqSUdZ?=
 =?utf-8?B?YkRRSU42SU53UDlNSk9wUmw1U0VaamMrQXJzY2NuZkQxc2ZIdjFidzQwRVly?=
 =?utf-8?B?bmNUcFJUbm9DUGhnbVViQjF2Z3dHUFJ3TmcxTkk5aytFbDVTUkR0WmU4cXFX?=
 =?utf-8?B?aVRBUFFSNUhQT2VORkx2a2IydFpLZllnazhLL0NDblFxUE5ESlNhR2NROUZ3?=
 =?utf-8?B?TTQrZDF3OGx0TlZ5Z1lkaTgyZUd4c3JtZDdIekdQZ1d0anYzcksyMmtDT3dI?=
 =?utf-8?B?aUlTZjBzd3VYUndGMEhqNTNGczlnMU1xdmFXNWxDNXhBbElEekEzbHJkd2Z4?=
 =?utf-8?B?eU83R1I4SENUOGNMQ3FkMVFpMU9qSlM0bUR0Uk9DdCszNW13YUFmVHhQZzQz?=
 =?utf-8?Q?9Frhfkzp2TNUzGfGLY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnVtTGtFVXpWSklCb0dCVUlrejF1SU1pNEovelE3bGpLcllCNHFBUXJyOTZU?=
 =?utf-8?B?UXBtMFdjcjBzcjNTMkRtaGdYcTlxRThqMUdTQkY1UWp3Mmd3MitMQi9RSkZ1?=
 =?utf-8?B?NlRIMHRlOVU3WHY5cnZtb1FwUHR5bHJ0U2x3aGxHNnVHOHRTYzBEdEhUcWNY?=
 =?utf-8?B?azhjTWdEZDhNTTBLOUEwdXBmdjlGUEova0E3V2FyMW5hNWdkNTVoWmRXajA2?=
 =?utf-8?B?SzJxY3NmTHZ1ampLcVN5K3pwaTIzNzJvUkVHRjYyYXY4RzJjaWVCWlBVSDRx?=
 =?utf-8?B?WmFIMmpXa25BY2dVejJZZ0RaY2NqRlJnWHFoVnJoUHQvR281alMvcmllbnI2?=
 =?utf-8?B?eXJyVjJpc1RhUk9vQlRacGFVck90cnBoY0JtUWJ2REZpTlFUem0vUnVYWEg4?=
 =?utf-8?B?aTRpU2JIMzBNL2dUOGxMYnZhcGZSTE5MNWcyVFRKbHNUMXhKbTFOSnAzTDJq?=
 =?utf-8?B?S0kzenB5L0t1aWZSeG1KalQyS2xMVmJvYTFFbFhWdm04dUtNODhaMnRHNGwx?=
 =?utf-8?B?cEN6VFI4VW4zeFVMYjBGUk1CUFp1cmN6UjJFaU81aDNwU1BxdnJ2ZzhWOTFq?=
 =?utf-8?B?ZnlZcXV5NTgyWTI4aEhSQ2s5UUNGL0VndWYvTzBHV0V5MGZSaXlteTdZaWJ1?=
 =?utf-8?B?b0hCWm9EQWljSFlJZTlrSGRkOXJ3dm1aYTlPcXFEUHdybnEybEVhOGZ2UlRi?=
 =?utf-8?B?RGpobTZUUTU5RThqTnNuY0xHRittem5Nd0hRZUZsUjBPRkFzTUkxOEJBT0tp?=
 =?utf-8?B?R3dCRUpuWG8yUlJyaXBEWVdsQ0Q0UzRZVnZrcmk4YUlEYnVjU2V1MDdaRzg4?=
 =?utf-8?B?UnpxZFY4NmhBOXZiRXpkVFhJem1JWVJrRW9DQmFlVjFXME1UUVdhaGw3bHpI?=
 =?utf-8?B?YldnK1hEdnZyVmczSk1aeDBpeGdHc0psNXVFRUo0dkpGUVo3QjNPOGtZb0VK?=
 =?utf-8?B?YVBLNTh3bVh2aFFJeDI1WXdXRWtLZ1ZqNTBUc2hqdXg2dk1uRU5RZ0xnaXg2?=
 =?utf-8?B?TWZVcThwZ2RCT2dnSXlaZUk2TzR6enV6MzNkb3dybEZNTFEwZldDbjNFaTJR?=
 =?utf-8?B?SjdJdVpWZElNVlduK3Q3TEhuanY4Qld4Q2Q4bWVjNzVHWDBQRVJDb1dBejZa?=
 =?utf-8?B?Q2FOYjJQMkY5THdSbjZxM1NaL2NtWThvRjdETGF1bVFzbGlRN0FCYndiQXVu?=
 =?utf-8?B?amNkK2FYa3kxZVJNekdUaEVuby9QWlhySi9XNU13YXhYSmhQV2RoNWExRmFj?=
 =?utf-8?B?WUt3QmNmRFJKMlRrb1J6QlpMRjJVN3hPc1RZblM2ZjFaMk1mb2tEdVhGY2ZJ?=
 =?utf-8?B?YVlKNVF5M2oyMjhjSmsvUGx0eTJnZW8xeXc2K1VHNzhUTGQwbGpxUndvMHpq?=
 =?utf-8?B?M2F0Rm9QbThIYkI0Z09qZkxqWFJtRDZmTmROOHpueXFiYXNnMGlQczdtMUwr?=
 =?utf-8?B?Tm5vRjN2UmZjRVEya1NBT1BYUHZtZmZqb0JwVW1ielRuSy9jZWdsWFNsbm91?=
 =?utf-8?B?cDZ3cTJiWTFpZXU0TVlEUGtmTWtrQjVoUXZqUEVIZ0F4OXZsYit6eGxMaFRr?=
 =?utf-8?B?U2RDbHNBY1pZYTVMMnh1NzlSSlhzVUx4M0VGRXVmWVlnVEFwYjRxcEk4ZmUw?=
 =?utf-8?B?NW5mU25OekVEN0JtQitNV2xDUHFQTk9ybkcvS2Y5d2F3cE1Zb0EyWWMya09q?=
 =?utf-8?B?Wk5aZFhObHhobWtLaXVzRTZLZ2FKU0hCWGo1bHF1RGJwWnFkUlV2ai9qVTBG?=
 =?utf-8?B?STBSR3I3OFJ0bytPd2NPc2NnUTlIaE4rVTl4aDdoUHhuaml2RVJsakhmY3Vs?=
 =?utf-8?B?YU92NDE5Y0JENnQvNmdYb2FQV1BYdHk3bHNuTEp4amNGeWUraFZsZnpBNXJ3?=
 =?utf-8?B?SlJGNi9BQXNlWjdRdUZsUXI0Umg1dVJCMkZMN0szRmFxOWlMU3MyZytXM1hT?=
 =?utf-8?B?eHgyMTUzM1ZjYXJvdk1uZ29LeTBNdXd0WG9vbXhNdlBpZXdNUG4zQW1YdG1y?=
 =?utf-8?B?ZlozNVl5ODRPejUxZ0g5VWxtNWNZTGoyaC9qS0hQdW9YOHlsVW1waDVYU2RF?=
 =?utf-8?B?L3NzczVhUjZhZS9HRDRIQStvMmVTMXNQQWhSbVNsS0k5L2JLZFUzbVlrTU5D?=
 =?utf-8?B?Vnk3aG1jZWZGSFEvVkg0cEpieTFsZW1PeWN1dTRHdHZob055RmE1NE9qSmlT?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9728a551-5a58-4823-b36e-08dd0a25c44c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 12:12:28.1562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfFuzmg5stcJl9/z5xhloys3JApqYPg0xFkeoPQVfPSn/b1nOSlpKAgxCPofVKdOTZmzASMY2MTXL6Ns0PBF+Smmbw8rQDfKQ3Xtx6zLNAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
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



On 11/19/24 5:58 PM, Hajda, Andrzej wrote:
> 
> W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
>> Add read and write pagefault tests to xe_eudebug_online that checks if a
>> pagefault event is submitted by the KMD debugger when a pagefault occurs.
>>
>> Test that read (load instruction) and write(store instruction) attempt to
>> load or store access to unallocated memory, causing a pagefault.
>> Examine the address causing the page fault and the number of eu threads
>> causing the pagefault.
>>
>> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c | 219 +++++++++++++++++++++++++++++++-
>>   1 file changed, 215 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/ 
>> xe_eudebug_online.c
>> index 0ef0d8093..eae0eb520 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -36,6 +36,8 @@
>>   #define BB_IN_VRAM            (1 << 11)
>>   #define TARGET_IN_SRAM            (1 << 12)
>>   #define TARGET_IN_VRAM            (1 << 13)
>> +#define SHADER_PAGEFAULT_READ        (1 << 14)
>> +#define SHADER_PAGEFAULT_WRITE        (1 << 15)
>>   #define TRIGGER_UFENCE_SET_BREAKPOINT    (1 << 24)
>>   #define TRIGGER_RESUME_SINGLE_WALK    (1 << 25)
>>   #define TRIGGER_RESUME_PARALLEL_WALK    (1 << 26)
>> @@ -45,6 +47,7 @@
>>   #define TRIGGER_RESUME_DSS        (1 << 30)
>>   #define TRIGGER_RESUME_ONE        (1 << 31)
>> +#define SHADER_PAGEFAULT    (SHADER_PAGEFAULT_READ | 
>> SHADER_PAGEFAULT_WRITE)
>>   #define BB_REGION_BITMASK    (BB_IN_SRAM | BB_IN_VRAM)
>>   #define TARGET_REGION_BITMASK    (TARGET_IN_SRAM | TARGET_IN_VRAM)
>> @@ -61,6 +64,8 @@
>>   #define CACHING_VALUE(n)    (CACHING_INIT_VALUE + (n))
>>   #define SHADER_CANARY 0x01010101
>> +#define BAD_CANARY 0xf1f1f1f
>> +#define BAD_OFFSET (0x12345678ull << 12)
>>   #define WALKER_X_DIM        4
>>   #define WALKER_ALIGNMENT    16
>> @@ -123,6 +128,9 @@ static int get_number_of_threads(uint64_t flags)
>>       if (flags & SHADER_MIN_THREADS)
>>           return 16;
>> +    if (flags & SHADER_PAGEFAULT)
>> +        return 16;
>> +
>>       if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>>                TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | 
>> SHADER_CACHING_VRAM))
>>           return 32;
>> @@ -179,6 +187,16 @@ static struct gpgpu_shader *get_shader(int fd, 
>> const unsigned int flags)
>>               gpgpu_shader__common_target_write_u32(shader, s_dim.y + 
>> i, CACHING_VALUE(i));
>>           gpgpu_shader__nop(shader);
>>           gpgpu_shader__breakpoint(shader);
>> +    } else if (flags & SHADER_PAGEFAULT) {
>> +        if (flags & SHADER_PAGEFAULT_READ)
>> +            gpgpu_shader__read_page_fault(shader, BAD_OFFSET);
>> +        else if (flags & SHADER_PAGEFAULT_WRITE)
>> +            gpgpu_shader__write_offset(shader, BAD_OFFSET, BAD_CANARY);
>> +
>> +        gpgpu_shader__label(shader, 0);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>> +        gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>>       }
>>       gpgpu_shader__eot(shader);
>> @@ -217,6 +235,17 @@ static int count_set_bits(void *ptr, size_t size)
>>       return count;
>>   }
>> +static int
>> +eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, 
>> uint32_t size)
>> +{
>> +    int count = 0;
>> +
>> +    for (int i = 0; i < size / 4 ; i++)
>> +        count += igt_hweight(a[i] ^ b[i]);
>> +
>> +    return count;
>> +}
>> +
>>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, 
>> uint32_t value)
>>   {
>>       int count = 0;
>> @@ -636,7 +665,7 @@ static void eu_attention_resume_trigger(struct 
>> xe_eudebug_debugger *d,
>>           }
>>       }
>> -    if (d->flags & SHADER_LOOP) {
>> +    if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>>           uint32_t threads = get_number_of_threads(d->flags);
>>           uint32_t val = STEERING_END_LOOP;
>> @@ -746,6 +775,43 @@ static void 
>> eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>>               data->single_step_bitmask[i] &= ~att->bitmask[i];
>>   }
>> +static void eu_attention_resume_pagefault_trigger(struct 
>> xe_eudebug_debugger *d,
>> +                          struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
>> +    struct online_debug_data *data = d->ptr;
>> +    uint32_t bitmask_size = att->bitmask_size;
>> +    uint8_t *bitmask;
>> +
>> +    if (data->last_eu_control_seqno > att->base.seqno)
>> +        return;
>> +
>> +    bitmask = calloc(1, att->bitmask_size);
>> +
>> +    eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
>> +               att->lrc_handle, bitmask, &bitmask_size);
>> +    igt_assert(bitmask_size == att->bitmask_size);
>> +
>> +    pthread_mutex_lock(&data->mutex);
>> +
>> +    if (d->flags & SHADER_PAGEFAULT) {
>> +        uint32_t threads = get_number_of_threads(d->flags);
>> +        uint32_t val = STEERING_END_LOOP;
>> +
>> +        igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
>> +                     data->target_offset + steering_offset(threads)),
>> +                  sizeof(uint32_t));
>> +        fsync(data->vm_fd);
>> +    }
>> +    pthread_mutex_unlock(&data->mutex);
>> +
>> +    data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, 
>> att->client_handle,
>> +                            att->exec_queue_handle, att->lrc_handle,
>> +                            bitmask, att->bitmask_size);
>> +
>> +    free(bitmask);
>> +}
>> +
>>   static void open_trigger(struct xe_eudebug_debugger *d,
>>                struct drm_xe_eudebug_event *e)
>>   {
>> @@ -1015,7 +1081,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       struct intel_bb *ibb;
>>       struct intel_buf *buf;
>>       uint32_t *ptr;
>> -    int fd;
>> +    int fd, vm_flags;
>>       metadata[0] = calloc(2, sizeof(*metadata));
>>       metadata[1] = calloc(2, sizeof(*metadata));
>> @@ -1025,7 +1091,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       fd = xe_eudebug_client_open_driver(c);
>>       /* Additional memory for steering control */
>> -    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
>> +    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c- 
>> >flags & SHADER_PAGEFAULT)
>>           s_dim.y++;
>>       /* Additional memory for caching check */
>>       if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & 
>> SHADER_CACHING_VRAM))
>> @@ -1045,7 +1111,11 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>                                  DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>>                                  2 * sizeof(*metadata), metadata[1]);
>> -    create.vm_id = xe_eudebug_client_vm_create(c, fd, 
>> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +    vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>> +    vm_flags |= c->flags & SHADER_PAGEFAULT ? 
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
>> +
>> +    create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>> +
>>       xe_eudebug_client_exec_queue_create(c, fd, &create);
>>       ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, 
>> create.vm_id, bb_offset, bb_size,
>> @@ -1245,11 +1315,14 @@ match_attention_with_exec_queue(struct 
>> xe_eudebug_event_log *log,
>>   static void online_session_check(struct xe_eudebug_session *s, int 
>> flags)
>>   {
>>       struct drm_xe_eudebug_event_eu_attention *ea = NULL;
>> +    struct drm_xe_eudebug_event_pagefault *pf = NULL;
>>       struct drm_xe_eudebug_event *event = NULL;
>>       struct online_debug_data *data = s->client->ptr;
>>       bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>>       int sum = 0;
>>       int bitmask_size;
>> +    int pagefault_threads = 0;
>> +    uint32_t *ptr = NULL;
>>       xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>>                         XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
>> @@ -1265,6 +1338,16 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>               igt_assert_eq(ea->bitmask_size, bitmask_size);
>>               sum += count_set_bits(ea->bitmask, bitmask_size);
>>               igt_assert(match_attention_with_exec_queue(s->debugger- 
>> >log, ea));
>> +        } else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
>> +            uint32_t after_offset = bitmask_size / sizeof(uint32_t);
>> +            uint32_t resolved_offset = bitmask_size / 
>> sizeof(uint32_t) * 2;
>> +
>> +            pf = (struct drm_xe_eudebug_event_pagefault *)event;
>> +            ptr = (uint32_t *) pf->bitmask;
>> +            igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
>> +            pagefault_threads += eu_attentions_xor_count(ptr + 
>> after_offset,
>> +                                     ptr + resolved_offset,
>> +                                     bitmask_size);
>>           }
>>       }
>> @@ -1279,6 +1362,9 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>           igt_assert(sum > 0);
>>       else
>>           igt_assert(sum == 0);
>> +
>> +    if (flags & SHADER_PAGEFAULT)
>> +        igt_assert(pagefault_threads > 0);
>>   }
>>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
>> @@ -1302,6 +1388,55 @@ static void ufence_ack_set_bp_trigger(struct 
>> xe_eudebug_debugger *d,
>>       }
>>   }
>> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
>> +                  struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_pagefault *pf = (void *) e;
>> +    int before_threads, after_threads, resolved_threads, 
>> pagefault_threads;
>> +    uint32_t attn_size = pf->bitmask_size / 3;
>> +    uint32_t *ptr = (uint32_t *) pf->bitmask;
>> +    uint32_t offset, before_offset = 0;
>> +    uint32_t after_offset = attn_size / sizeof(uint32_t);
>> +    uint32_t resolved_offset = attn_size / sizeof(uint32_t) * 2;
>> +
>> +    before_threads = count_set_bits(ptr + before_offset, attn_size);
>> +    after_threads = count_set_bits(ptr + after_offset, attn_size);
>> +    resolved_threads = count_set_bits(ptr + resolved_offset, attn_size);
>> +
>> +    pagefault_threads = eu_attentions_xor_count(ptr + after_offset,
>> +                            ptr + resolved_offset,
>> +                            attn_size);
>> +
>> +    igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
>> +          "resolved=%d, pagefault=%d] "
>> +          "client[%llu], exec_queue[%llu], lrc[%llu], 
>> bitmask_size[%d], "
>> +          "pagefault_address[0x%llx]\n",
>> +          pf->base.seqno, before_threads, after_threads, 
>> resolved_threads,
>> +          pagefault_threads, pf->client_handle, pf->exec_queue_handle,
>> +          pf->lrc_handle, pf->bitmask_size,
>> +          pf->pagefault_address);
>> +
>> +    for (int idx = 0; idx < 3; idx++) {
>> +        if (idx == 0) {
>> +            igt_debug("=== Attentions before ===\n");
>> +            offset = before_offset;
>> +        } else if (idx == 1) {
>> +            igt_debug("=== Attentions after ===\n");
>> +            offset = after_offset;
>> +        } else {
>> +            igt_debug("=== Attentions resolved ===\n");
>> +            offset = resolved_offset;
>> +        }
>> +
>> +        for (uint32_t i = 0; i < attn_size / sizeof(uint32_t); i += 2)
>> +            igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
>> +                  ptr[offset + i], ptr[offset + i + 1]);
>> +    }
>> +
>> +    igt_assert(pagefault_threads > 0);
> 
> 
> Why not checking if pagefault_threads  == num_of_threads ?
> 
> I am not sure what is worth checking else, I wonder if we couldn't for 
> example cause only some of test PF and check if they are reported 
> correctly.
> 
> Regarding the flow I see nothing suspicious, AFAIK.
> 
In terms of identifying the eu thread that caused the pagefault, the igt 
test case only verifies that there is at least one eu thread that caused 
a pagefault, as there is only a guarantee that KMD will report the first 
eu thread that caused a pagefault. Of course, if multiple eu threads 
caused the pagefault while KMD was handling the pagefault, all of them 
may be reported. The point here is that at least one eu thread is reported.
> 
> Regards
> 
> Andrzej
> 
> 
>> +    igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
>> +}
>> +
>>   /**
>>    * SUBTEST: basic-breakpoint
>>    * Description:
>> @@ -1383,6 +1518,77 @@ static void test_set_breakpoint_online(int fd, 
>> struct drm_xe_engine_class_instan
>>       online_debug_data_destroy(data);
>>   }
>> +/**
>> + * SUBTEST: pagefault-read
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a read pagefault.
>> + *
>> + * SUBTEST: pagefault-write
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a write pagefault.
>> + */
>> +static void test_pagefault_online(int fd, struct 
>> drm_xe_engine_class_instance *hwe,
>> +                  int flags)
>> +{
>> +    struct xe_eudebug_session *s;
>> +    struct online_debug_data *data;
>> +    uint32_t val;
>> +
>> +    data = online_debug_data_create(hwe);
>> +    s = xe_eudebug_session_create(fd, run_online_client, flags, data);
>> +
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_OPEN,
>> +                    open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
>> +                    exec_queue_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_debug_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_resume_pagefault_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_METADATA,
>> +                    create_metadata_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
>> +                    ufence_ack_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
>> +                    pagefault_trigger);
>> +
>> +    igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 
>> 0);
>> +    xe_eudebug_debugger_start_worker(s->debugger);
>> +    xe_eudebug_client_start(s->client);
>> +
>> +    /* wait for workload to start */
>> +    igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>> +        /* collect needed data from triggers */
>> +        if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data- 
>> >target_size) == 0)
>> +            continue;
>> +
>> +        if (pread(data->vm_fd, &val, sizeof(val), data- 
>> >target_offset) == sizeof(val))
>> +            if (val != 0)
>> +                break;
>> +    }
>> +
>> +    pthread_mutex_lock(&data->mutex);
>> +    igt_assert(data->client_handle != -1);
>> +    igt_assert(data->exec_queue_handle != -1);
>> +
>> +    pthread_mutex_unlock(&data->mutex);
>> +
>> +    xe_eudebug_client_wait_done(s->client);
>> +
>> +    xe_eudebug_debugger_stop_worker(s->debugger, 1);
>> +
>> +    xe_eudebug_event_log_print(s->debugger->log, true);
>> +    xe_eudebug_event_log_print(s->client->log, true);
>> +
>> +    online_session_check(s, s->flags);
>> +
>> +    xe_eudebug_session_destroy(s);
>> +    online_debug_data_destroy(data);
>> +}
>> +
>>   /**
>>    * SUBTEST: preempt-breakpoint
>>    * Description:
>> @@ -2344,6 +2550,11 @@ igt_main
>>       igt_subtest("breakpoint-many-sessions-tiles")
>>           test_many_sessions_on_tiles(fd, true);
>> +    test_gt_render_or_compute("pagefault-read", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
>> +    test_gt_render_or_compute("pagefault-write", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
>> +
>>       igt_fixture {
>>           xe_eudebug_enable(fd, was_enabled);

