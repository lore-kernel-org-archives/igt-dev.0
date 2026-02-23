Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDC2E98DFF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 09:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0EF10E2C0;
	Mon, 23 Feb 2026 09:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEZxRQm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D222F10E2CF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771839953; x=1803375953;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yiqXXPSjKo4Z5mY9O9CrQlNP+yZxc00zxHmOnubWhGw=;
 b=DEZxRQm8O20Wvl1m76CIPSSoI3mHAyq3cr2Wr836b+mlpWDwGaeFCO6p
 1tIjEMCliQGXF0vsdCwGEMdtj0u4aumgz9D/6ox4OIrRbgn2e1A5pxQOl
 mOoWPmMuWTp6120YPq0Ufi5rPhLbJ2jwdGMpzW1DY5s3afTLU28GS4RVs
 CXfIriVkY23uugvYSP9dGKjY+aJgGyOJpgkmZnH0yrwjggvCT8s9qCZn6
 IJhnnMd2fz+Q2sSeU7zXXoVq7fqzpNJMbbkltiZ03e3O+G5Kr3hBUCkvY
 SnT+H0nMDP5ceE2Z/L9VHq/y6L4m7qGpG+iXh2BgVuG00HPud131cOdxb Q==;
X-CSE-ConnectionGUID: /od7LlHmQCmZ9/Y3TxhgLg==
X-CSE-MsgGUID: fIGgSYwYQfWUm9V9nGXf+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72869325"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72869325"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:45:52 -0800
X-CSE-ConnectionGUID: o6FQBFqMQ4aW1MQ3n61UDQ==
X-CSE-MsgGUID: Mf12bbxZSDaVSOmtni76bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214416662"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:45:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:45:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 01:45:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:45:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGktLJxtc2UkWCtN9tgMobwd4sfHRVY5NjwSFwnofZhfjJ+Fauw9RaMtGfk8xoccmHJ5OqcosuGBdhaBXl+mpHyv5jfa0YnS/h/0Omyp521H6uKfr5pc4vhHbKHXpNJP3gx5c/Ai7Pfn5mt2+SsBPuqTNci4zddpyojboq8ueAbYUb9mb+ogGIyJ2iByo/r4LluQDGTQLqcZYXhD7Z2bRAk1nPgaZYsJvM3KZwYnk1gPCt4hUrCJJsMUK8ErUu4qaszgDHtwCfBCzxu69/Odk1EW3IS8UWIH7Ria9VW6Opllr0gF3waM27KffbbsdqWlHqftkEChFP1sq3zVsgPCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPuEb+V5HqfOCjkGiQq0JNh21SQxCcy6EsL3Ukgc984=;
 b=Pz//QTM6zUNc974MWtzAc/IPMXPgkQKdrwnwuj7p2jsBPzk3oAHlwSru5fDNG2tMceWgKcT2V4IF0cqCKOHrcYnzPmviuhuPBEdCptrCJQ+FWhqGCIsm8VfXtnQmMqkiUxJC48oS490b3CN0JZA4xQ6OOJBTv1RreefmyzX5orvx6yRP+7qdXj3glF3SfDu2SQ2IoG85uBRgyqFsYUZ15vWbN6rFecfFVTS8nAV14GJ+m5t9HFaKtNYFrqSlm7XMqfylv60Z8iOYMqK/YvqDeOZWXh1HJEMXbxQO5dLxMzFMm6wUa3SD5nILGSI2qrjYB+9KAJhmUc7br+M0iCorzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:45:43 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:45:43 +0000
Message-ID: <640d2e40-ef5a-4cc5-acdb-b468b8b537cd@intel.com>
Date: Mon, 23 Feb 2026 15:15:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 5/8] tests/intel/xe_madvise: Add
 dontneed-before-exec subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-6-arvind.yadav@intel.com>
 <BL1PR11MB552517BD58B9CA1E7FC9556D8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <100574ec-a137-44f9-a4db-7a7e32bbc4fd@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <100574ec-a137-44f9-a4db-7a7e32bbc4fd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::11) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|MW4PR11MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fe01f1-24c8-441c-dccf-08de72c04fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXErRzRUaE1JY3ptTzJIYS85ck9VQVhudU95eHVXMTFFUm9kRWZDQ0VqWVNR?=
 =?utf-8?B?Qm8wNGkvTEp6c2dzUitEYnYwMHM2aUF6NjJ2L0VubDhoK2lkVTgrSTd1NHNH?=
 =?utf-8?B?a1NmSERoWllzNGFqcmdIWFppSVFod0VZOFZtb2diK20rbzBCNVlqYkRhUVZj?=
 =?utf-8?B?RnZrVUp0cWp3bHpnQ2tZKzZ0UElINmxYVDZoQnVWOUw1M1MwNEpkWS9ZRlRH?=
 =?utf-8?B?TFNjQzRpMGlCakNRU1oycUtWcXpvYTAyd3NseE9iQndqOVdSYTBTZFFiN0lz?=
 =?utf-8?B?amRGRFZTNStpYmlLTjh3TlI5MWNUNmtGdFd6aEsrSmR4cFR3OVFHRUJyTGpH?=
 =?utf-8?B?OUJkT0hjVVBUM1dvOERmK29oVnlHNTM5V1lvUmh2OUVFVlRtSE5NbXVkK1hT?=
 =?utf-8?B?TjQ2dENaUjJaRWZWVTdRRE1WeFZjbXFVNDN2OEo5S1NsWFRqZFZueHM3ZFBY?=
 =?utf-8?B?bDhpV3JHZEovc1ZtWVNsWWo4SEVQUldteFFnaUhweFoveklLQ0ZYLzV4R1V5?=
 =?utf-8?B?UFp0MUJRdHhxY1RIWDJiOVNLVGNSNytaNEVvM2dQWnFQTUdQKzhKOWhnL1Bq?=
 =?utf-8?B?OEZDVU05TGZLa05VVTNlUjF2M0RvQjdaZExNR2hRc3NYZksxQXJWNnppMjVx?=
 =?utf-8?B?eVZ1N054d2JuRmJWYmJ3Tm1VbzZJbEtjdjluM2lUZ2ZTQ2gyemNEZndpVmpM?=
 =?utf-8?B?Nlg3ZWIyM2dJTjYwQk9ITzNKOHZsK3hYVk41R3F3QzA5RDJJK1lYZlczbWFM?=
 =?utf-8?B?NVF0RHMyVngwbVBQQ0xrVUJybHUyWXdSTkVmWTFRS09wSFpseHZrMTUyZmta?=
 =?utf-8?B?dnNTUjJ2a2hNY0tVRVdCQ2VXVkdoVVlVTTFKcEZ1a3pXN0dMWWFiOGhvTUxK?=
 =?utf-8?B?eWZDNEJScGpZTkpZWDlNRFhZUmRnYmd4bVFpVXpFUnROVzVUd3puMEw4MGEy?=
 =?utf-8?B?dGhsMVlGeUtIak1GNjZKb2Y0em1PditrM09aT3g5QWhiN2ZtVm1za2wzbENM?=
 =?utf-8?B?b0ZKK1ZGRnBzekp5bTUwT09zQkF5bmdrYzRVNEZmRHNoRWNZRlFFMm1tT3Z6?=
 =?utf-8?B?OGNyd2lZeElzbkV5T1pqN0Z5L3cxRUNOeTlWWGRzRTlXdUdYRnZ4OXJEM0dw?=
 =?utf-8?B?cHZ4bEkzZDhzTC93UEM0Z3NXOXEvNU53b0tITU8xUU5xdVFjK2hNblo1UUdp?=
 =?utf-8?B?TlJuT0l1MnFUa0N3QmZyU2xsSUVEYzIrNmdIaHN3OVFiSDVXRDVRN0x3RDFO?=
 =?utf-8?B?QVVhUlhXMlVOV3U1SWh4RE1qV09hS05SdlVDeTRyczJjbWh6Vlo0M3ZrTFd4?=
 =?utf-8?B?Wk1WUXIvaVo3NGlaYjF0a0RhZzhGMkNUeWphTGZWSHpGOXZIdk9DMXF5M0tH?=
 =?utf-8?B?S0tXZ1ZHWFg5WjFPSVc4cmc3RTZOaGNOUXBUcjVDVHNKYzltQzhKZU1kbEFS?=
 =?utf-8?B?V1RTSjFtcUtLNEVJeXRWOG4xSmRHVWdxcFpNOWVEWURPdUI4ZDlUTVY4NEM5?=
 =?utf-8?B?ckZtZ1A5clh4QXg0WmthTDI3UXFIOWZ2ckFHcUt2MTlDUks2OEQwcEtPOHJy?=
 =?utf-8?B?akZEbFhKMFpKQ2JHRHBGeGhmMjlwaVBvQ1pkOEhtVGtWOGtoV0FVWHBvR3l0?=
 =?utf-8?B?TXV0c21NaGtTUXk4U2FFd3pnWWpmdm02VzE1b0liV3lRKzJjUnR5MVZDdW80?=
 =?utf-8?B?ckxTZjFPS3FCWFM2STl0UlNXWlo1TldseUcrNDI1T3laSml1TmdLbDdFRmoz?=
 =?utf-8?B?Sm5DUTk3Y3lCRnc1M0QxWnF0M2hTZlViVXVVUUVGL29yZ2xhUm1MVXlEN2dO?=
 =?utf-8?B?bEkvR2sreTNpQWZwaWMrV2NyWk80MmgyMnRPcjkxeWNkNWhnbzVuNFFxR3BJ?=
 =?utf-8?B?Z2tqekdqdVFUTWdNanBhNEFaYUFVdmdvM0RWcmQxMGg4M055YWdkN28yMlhs?=
 =?utf-8?B?Yll2a0VTU3dlUkhNeE9zOHUwNUNaSGFLUml1eE5lckVSdytRQjA0bEg0dHFC?=
 =?utf-8?B?S0lzZWV3dFVOcXRZZjFSaC9GbkI1ZlltMWZ2QUdROU9OWkgzYllCdGdyS29V?=
 =?utf-8?B?WmJ3YkUveHg3Nzl3QjVvcWh0K2dyV0JDVUpobFVmTDM3ek1ORVMrYmFvUjVG?=
 =?utf-8?Q?qFbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkNJS0RrV0V0SFdaTHhLMHJ4VFNFU3hDTitJc2VZUnpTYjZETUxyc05tZkhH?=
 =?utf-8?B?Z2JCaVlJWHFqTVQrMElGTjNiUEowY0lZNXBleUdUNlAzS1UrSzRyN1dHcy8z?=
 =?utf-8?B?d3V2TW5rOEk2VEdBVWY5YmxRV0h1NWhad044dGg1cHUzTGhjODNNT1pxazlH?=
 =?utf-8?B?bVIwWUtyTGl5OHRDY0EzU0N3OHEwQWw0TXlZeERYTDNVVjY4eXFsNFA4anJx?=
 =?utf-8?B?SlR0TGRyeS9yL3pCbnVOM2MrT3o4elVIVkRnR0ZsQkRpaTFIc29FNXQ5Q2gw?=
 =?utf-8?B?bjFuQWhaTldvNTdFMkZ3UFpQMGdDN2xham13RDNQK1luTitTa2pkWGJMdlFu?=
 =?utf-8?B?QkRZcERPZlkrdmxiOTd0NkVVSGNsU01ZQUFzSy80M2dqeGRTL2F6RE1nQWVz?=
 =?utf-8?B?bGYyQTZza2MyaXVCeFpSbWtPM2syMVRBT0taWmZhaGpzS3M1YzhWS0RzUWty?=
 =?utf-8?B?SWF6L3dXa29hZkc1b1RDUkdualF6dXczUFd3c2VTendmTGxJa3hBVWk1QkdW?=
 =?utf-8?B?SktXQllZZ0tTcmFLeGxLZXlISy9yaTZVRjczV0RKcjlMaTZtSGsya3k2RGdL?=
 =?utf-8?B?WlM5YVBDaXFtQ1ppQko5UFltbVZLQklEYlc0eE9NdUFTcnIyZkx1M1luUTh1?=
 =?utf-8?B?dURGYzhESmVoSVlKQ1ErS3M5YWU0N0dMQ2lWZE1YUjNHUFh0MElabmdXU3o2?=
 =?utf-8?B?cXNjZmN6c2UrU3VqNCsyd3FaSG4rVks0Q3A2dm1UVGR4YVJzSWZrSFg5YitG?=
 =?utf-8?B?bUUvY21mc1RhR1ZVejBKd3pleTFiQnhWd2UxN2VJOUZ4bnlIb3Y1MkRjTGla?=
 =?utf-8?B?U3p0VCtGbnZIMS9rTjF6OUh2WUJpY01Fd0ROcDZ2aTQ0SWVsaHJQRUs3M3Ix?=
 =?utf-8?B?aWFMZ3Nua3QwS3VsYklseW0xU29LV0hDMjF6TE1qdHFFUkEzZzhpaXdXSDI0?=
 =?utf-8?B?VFlnMjNmeWRSRFdDdm9XaC9mLzFnenNlMVc0WkJvZEV2c09IeE52cStHSndC?=
 =?utf-8?B?L0l1QWJ1aGZpQVJvSklkMzAyR1dKYm1DMGF3Z2xrajF6SlJralo2aWk2TTI4?=
 =?utf-8?B?SnQ2Yi8vS0VTTlV2U0ZGaGd6bG5VcDZ3RG90dFRPTWJ1YlZPUHhlQ2hXRnNC?=
 =?utf-8?B?M1hXZjgwMUMwMUJ3bWR4aTRhcXZWalIvZWNnZkdsM2lDeHJ6NWhCd29SYkVl?=
 =?utf-8?B?c0ZRL3UxUEE1am50TDJIZU5aaWFGVm51ZTljQWtyWUZqWVNrMmlWYlJZakw0?=
 =?utf-8?B?WGNKY29EM3V4UWNmdGNyZVVUbFZacmNtRkEyRnFuU3pnK2F1UUpZYzdDdmhh?=
 =?utf-8?B?TzE0N2hjL21BK2VDLzJSWEN2VE1hNjh1aDF3eHF1Y1VGYUxNSFIyYTFoVjZa?=
 =?utf-8?B?bmFpMUI5SkRwajVnVmdYbU1OUnBXeklyU0E4RmhXUWN3UkZObWtiKzNqMkg4?=
 =?utf-8?B?blp2WksrYTFDSWpraytPK0FHRVduSzJtdVZ1WGVXUlJBbGNlenpvLy9jSWh2?=
 =?utf-8?B?VCtJdkFwcnhrWC9jWnh1cXQwa3lLdEwrbjlMc1FHNFE0Y2ZoRHlnWDllbThv?=
 =?utf-8?B?SEs0UW84a1RxWlBvWjlhYTFXSUZDK3FIelZyciswZlhUM1BWenMyNkdaMEZy?=
 =?utf-8?B?NHNpK09sSGJmZlVla1J0cE5xdHJJRlVnMys0Y203c1BkWllQcXlNUnB5VE1n?=
 =?utf-8?B?UGdOdCtPWjNJOUtBdFNVekcwVlZ4UUU4QUdLUTBrL2R3aEFQTHdUay9NaVl0?=
 =?utf-8?B?aHNaSTFCd1JJak1GcTFJVHZ5eDJ4WmtQZTY1cTJ1bUJIWDg2d2pYSzhZd0NW?=
 =?utf-8?B?VFcrNXBSYUp2NjNuMDA4SnNybXpOemR4Snc0ejFFTnBKYkIwVkpDaFdSNnJ6?=
 =?utf-8?B?YW9OZ21XTm5rNXoxZEpVNmQ3T2xSc0RwU0dzSmFLcWJLeFg0aUJUbllQcFo4?=
 =?utf-8?B?RitPOURwME8wRW1LUExOV2VGdTdxMXpnYkpraEFUZ1NtcUJhRm5DZE5CZ3hv?=
 =?utf-8?B?WEI3OWZNVXYwVGZGR255RHpkWHZDQk1xcm9WUS9SSHJLcG1xRzloOGFEaWZU?=
 =?utf-8?B?Uk1TOERGZXVTdFVmSEJKKytLZ1NVUDVudHZ3TC9PU0tyNk1KWmF4MjVNNzY5?=
 =?utf-8?B?NEhrOHIvWnhoWnVnNjVBZFhvVXB4a2xmTE1tWnB6eTRxQk92YWNERE9BUG9L?=
 =?utf-8?B?eWVYeStXbXdPV2xLYThUT0dOblA3dVBIaTBnTHVuMG93bzJ5d2kvak1IYTI4?=
 =?utf-8?B?djc5WnNGMmMyNExhb1M0TmQ4OXdvNnBZYjdtZXRSblVXSGcybzdPcXg2K0xh?=
 =?utf-8?B?VEpkdjhLMlk4cHJuMlphT2VVY0R4MmZaV0NCeFFQMW44YWhYWFFwdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fe01f1-24c8-441c-dccf-08de72c04fbb
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:45:43.5855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93QV9M3ZcrKUiwyQlyuKcrl+MuJDIK9g2RFXW6tFYPkWXwxDgalQFpVCNk64GFa9SBmdsalMXIJsqz05oUCQ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
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


On 23-02-2026 11:36, Sharma, Nishit wrote:
>
> On 2/23/2026 10:40 AM, Gurram, Pravalika wrote:
>>
>>> -----Original Message-----
>>> From: Yadav, Arvind <arvind.yadav@intel.com>
>>> Sent: Tuesday, 17 February, 2026 08:04 AM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>>> <pravalika.gurram@intel.com>
>>> Subject: [PATCH i-g-t v3 5/8] tests/intel/xe_madvise: Add 
>>> dontneed-before-
>>> exec subtest
>>>
>>> This test validates GPU execution behavior when a data BO is purged 
>>> before
>>> submission. The test creates a batch that writes to a data BO, 
>>> purges the data
>>> BO (while keeping the batch BO valid to avoid GPU reset), then 
>>> submits for
>>> execution. With VM_CREATE_FLAG_SCRATCH_PAGE, the GPU write may
>>> succeed by landing on scratch memory instead of the purged BO,
>>> demonstrating graceful handling of purged memory during GPU operations.
>>>
>>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   tests/intel/xe_madvise.c | 140
>>> +++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 140 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>>> 5c6a24553..42cf1b3e5 100644
>>> --- a/tests/intel/xe_madvise.c
>>> +++ b/tests/intel/xe_madvise.c
>>> @@ -19,7 +19,11 @@
>>>
>>>   /* Purgeable test constants */
>>>   #define PURGEABLE_ADDR        0x1a0000
>>> +#define PURGEABLE_BATCH_ADDR    0x3c0000
>>>   #define PURGEABLE_BO_SIZE    4096
>>> +#define PURGEABLE_FENCE_VAL    0xbeef
>>> +#define PURGEABLE_TEST_PATTERN    0xc0ffee
>>> +#define PURGEABLE_DEAD_PATTERN    0xdead
>>>
>>>   /**
>>>    * trigger_memory_pressure - Fill VRAM + 25% to force purgeable 
>>> reclaim @@
>>> -144,6 +148,62 @@ static void purgeable_setup_simple_bo(int fd, 
>>> uint32_t
>>> *vm, uint32_t *bo,
>>>       xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC); }
>>>
>>> +/**
>>> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs
>>> +for GPU exec
>>> + * @fd: DRM file descriptor
>>> + * @vm: Output VM handle
>>> + * @bind_engine: Output bind engine handle
>>> + * @batch_bo: Output batch BO handle
>>> + * @data_bo: Output data BO handle
>>> + * @batch: Output batch buffer pointer
>>> + * @data: Output data buffer pointer
>>> + * @batch_addr: Batch virtual address
>>> + * @data_addr: Data virtual address
>>> + * @batch_size: Batch buffer size
>>> + * @data_size: Data buffer size
>>> + *
>>> + * Helper to create VM, bind engine, batch and data BOs, and bind 
>>> them.
>>> + */
>>> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
>>> +                       uint32_t *bind_engine,
>>> +                       uint32_t *batch_bo,
>>> +                       uint32_t *data_bo,
>>> +                       uint32_t **batch,
>>> +                       uint32_t **data,
>>> +                       uint64_t batch_addr,
>>> +                       uint64_t data_addr,
>>> +                       size_t batch_size,
>>> +                       size_t data_size)
>>> +{
>>> +    struct drm_xe_sync sync = {
>>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>>> +        .timeline_value = PURGEABLE_FENCE_VAL,
>>> +    };
>>> +    uint64_t vm_sync = 0;
>>> +
>>> +    *vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
>>> 0);
>>> +    *bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
>>> +
>>> +    /* Create and bind batch BO */
>>> +    *batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd,
>>> 0),
>>> +
>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +    *batch = xe_bo_map(fd, *batch_bo, batch_size);
>>> +
>>> +    sync.addr = to_user_pointer(&vm_sync);
>>> +    xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr,
>>> batch_size, &sync, 1);
>>> +    xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>>> NSEC_PER_SEC);
>>> +
>>> +    /* Create and bind data BO */
>>> +    *data_bo = xe_bo_create(fd, *vm, data_size, 
>>> vram_if_possible(fd, 0),
>>> +
>>>     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +    *data = xe_bo_map(fd, *data_bo, data_size);
>>> +
>>> +    vm_sync = 0;
>>> +    xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr,
>>> data_size, &sync, 1);
>>> +    xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>>> NSEC_PER_SEC); }
>>> +
>>>   /**
>>>    * SUBTEST: dontneed-before-mmap
>>>    * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>>> SIGBUS on access @@ -244,6 +304,80 @@ static void
>>> test_dontneed_after_mmap(int fd, struct drm_xe_engine_class_instance
>>>       xe_vm_destroy(fd, vm);
>>>   }
>>>
>>> +/**
>>> + * SUBTEST: dontneed-before-exec
>>> + * Description: Mark BO as DONTNEED before GPU exec, verify GPU
>>> +behavior with SCRATCH_PAGE
>>> + * Test category: functionality test
>>> + */
>>> +static void test_dontneed_before_exec(int fd, struct
>>> +drm_xe_engine_class_instance *hwe) {
>>> +    uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>>> +    uint64_t data_addr = PURGEABLE_ADDR;
>>> +    uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>>> +    size_t data_size = PURGEABLE_BO_SIZE;
>>> +    size_t batch_size = PURGEABLE_BO_SIZE;
>>> +    struct drm_xe_sync sync[1] = {
>>> +        { .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>>> +          .timeline_value = PURGEABLE_FENCE_VAL },
>>> +    };
>>> +    struct drm_xe_exec exec = {
>>> +        .num_batch_buffer = 1,
>>> +        .num_syncs = 1,
>>> +        .syncs = to_user_pointer(sync),
>>> +    };
>>> +    uint32_t *data, *batch;
>>> +    uint64_t vm_sync = 0;
>>> +    int b, ret;
>>> +
>>> +    purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>>> &batch_bo,
>>> +                       &bo, &batch, &data, batch_addr,
>>> +                       data_addr, batch_size, data_size);
>>> +
>>> +    /* Prepare batch */
>>> +    b = 0;
>>> +    batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>>> +    batch[b++] = data_addr;
>>> +    batch[b++] = data_addr >> 32;
>>> +    batch[b++] = PURGEABLE_DEAD_PATTERN;
>>> +    batch[b++] = MI_BATCH_BUFFER_END;
>>> +
>>> +    /* Phase 1: Purge data BO, batch BO still valid */
>>> +    igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>>> +data_size));
> Resource cleanup?


Noted,

>>> +
>>> +    exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>>> +    exec.exec_queue_id = exec_queue;
>>> +    exec.address = batch_addr;
>>> +
>>> +    vm_sync = 0;
>>> +    sync[0].addr = to_user_pointer(&vm_sync);
>>> +
>>> +    /*
>>> +     * VM has SCRATCH_PAGE — exec may succeed with the GPU write
>>> +     * landing on scratch instead of the purged data BO.
>>> +     */
>>> +    ret = __xe_exec(fd, &exec);
>>> +    if (ret == 0) {
>>> +        int64_t timeout = NSEC_PER_SEC;
>>> +
>>> +        __xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
>>> +                 exec_queue, &timeout);
>>> +    }
>>> +
>>> +    /*
>>> +     * Don't purge the batch BO — GPU would fetch zeroed scratch
>>> +     * instructions and trigger an engine reset.
>>> +     */
>>> +
>>> +    munmap(data, data_size);
>>> +    munmap(batch, batch_size);
>>> +    gem_close(fd, bo);
>>> +    gem_close(fd, batch_bo);
>>> +    xe_exec_queue_destroy(fd, bind_engine);
>>> +    xe_exec_queue_destroy(fd, exec_queue);
>>> +    xe_vm_destroy(fd, vm);
>>> +}
>>> +
>>>   int igt_main()
>>>   {
>>>       struct drm_xe_engine_class_instance *hwe; @@ -266,6 +400,12 @@
>>> int igt_main()
>>>               break;
>>>           }
>>>
>>> +    igt_subtest("dontneed-before-exec")
>>> +        xe_for_each_engine(fd, hwe) {
>>> +            test_dontneed_before_exec(fd, hwe);
>>> +            break;
>>> +        }
>>> +
>>>       igt_fixture() {
>>>           xe_device_put(fd);
>>>           drm_close_driver(fd);
>> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>>> -- 
>>> 2.43.0
