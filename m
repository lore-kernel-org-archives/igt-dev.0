Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C3CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 19:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DEB10E32C;
	Thu, 30 Oct 2025 19:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Io/wdaRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563E610E32C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 19:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761852839; x=1793388839;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=YTSDQpHZQJJRhCx3F2LIbc8jI9AMvSZcsaq4TzeCDk8=;
 b=Io/wdaRobWLOlOJ3Jfy9X1bKrFeM4kXQusYdE2KAr0FvOuqcw6aqaotW
 0AO3uPyOapExkqtmC0LE5MGH21ZE1xEUpxosi1gPS+oN0SrWNLBRYn96n
 MKE4uL/WMzirlOmk55V+rTpJpWNyhswf0ce1ydx2+6uBS/OkZPUJtENyA
 YxXMC1qWKoO6j10C6ZUsPc/sIvGJKIaGWZXUIjKhPKqnp3yLgjkzqiSZX
 i9pb4GgyKQcpl5HqdSx49AnYNmupUQa2QnQaY/ZKAssIvzqmS0i2TZC9S
 oUJ852ZWHc1YufFP8nE4kxvvMkEui/Mhn3KXi9NX88Wgp27yODX+SmS/H g==;
X-CSE-ConnectionGUID: 1TEYXrwNQLOZ+8MbZnvVpg==
X-CSE-MsgGUID: d3AyczlaS5iwzR2ebNDVyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74299888"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74299888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:33:58 -0700
X-CSE-ConnectionGUID: fVCccoFVTUu/FgVBMzxBcg==
X-CSE-MsgGUID: lc8h22tzR9Ck/EjYglnBrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185250029"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:33:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:33:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 12:33:57 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:33:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhTVuqzc8714C4duzjX6TIQ7PuuJ9FU/7z32G5isLsEiow8Qk1W9unx28ARV72Sz/MlfjOIvp4jQ5BeQpl6KZ9zirzl/Du+3D3W0i9Zz413cAg1yZTQvKUzAkiG/v2HkOkrF8J0n7LGdtcll+1TvO1PZf/B5+76zgABgXBk7OpuP6m4vPJiqjWaauBosnN+hD7166PID745eY6wAAEDooAkNWkNlWC56xycUEDtnikoIGh7LBqmljWIWFj1mPHlrvvMY0q++kAUM4frFVT71KxsRurSkGLTIuliA2Aa1/17K8xiFdYJdawvR9aucY7lluNZuE5DCiKJe6L+hFS3B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh4YykEGdgsmDAr+gaFOv+eysAguPKFI6Hunbgp8f80=;
 b=WQA3XomRRhDKtsLFjxUI9w/vQxQOC5iTzcobvPm4Op/FnUAHkcD7yN8SgEUKeSI6gbr36xq7YehcP1jL0atLzdn9/BeEB2WLDW8kTDk2/XXerLrO7R8O7E4YaLe66Sghk4NmoZ8pEf8o9q/2Kakx0UdCy/JkAbNEEa3fnn/1C7IEDFgNMVKwvhqPtklnXOSiUwP/Onf299T3A55XZFaDZA4uGvhk+aJUZkCJozla+MUXFLRBF0G6GdjezNy6jxDmHSAu5tbCippEpZOxLE95EPrLph5CO97Sx0aI/BNCCz+6zGbyTh8oH1Sm3fDYEHTDqWY/RKsJAGVW9VfQkYFsow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 19:33:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 19:33:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
References: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_atomic_transition: Fix dynamic subtest
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 30 Oct 2025 16:33:51 -0300
Message-ID: <176185283180.3303.10612741209970133886@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 857265d2-bf48-4bb0-80fd-08de17eb43d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm1HVUpxR2NWZEZVYU0zYjgvMjUwY3I1R1dnZmQ3c0hFdXRjeEdaL09LQm54?=
 =?utf-8?B?Rk8waWthYnZicG5aRGtHc21YS1ZmdDBDK1ozODYyR2hWbUZEc3hIUlFPRE1T?=
 =?utf-8?B?Rk1TZkxwR0JrQTVyK2JWRG91OGNPZE96amtXeitnT2FPVWwrZTFKQVJuY3VC?=
 =?utf-8?B?ZWRRMWJPZzFsR1AyY1J6dCs1TEdDYTdHWHBlVHVOZm9aRU5TTWx2UzNmV1Bh?=
 =?utf-8?B?RjQwTUV6K2VDNUc4RVEyYU1hTWpBL2hldnhpbk11ZGR1ck1UNG1OenoyL3V6?=
 =?utf-8?B?cDN3WmlQOHBMZmdTMmZETUxWY0lxMm4zNWZIdFRnV3Y0cWhENks0bFhCN0U5?=
 =?utf-8?B?TitxcUZyOUYvWWF2bDQxMktLU2JsOTA2UFlBSXhab29KbG5LMWFjNjZFZ05N?=
 =?utf-8?B?RHV2Yk1rNm5mMCtuVUMvVmttRjl1SXV0eGo5OWpZMUVUTGpIV3V2QUkzZGNz?=
 =?utf-8?B?UDFnQ3lUQjRQWThmWmIyMFBvbzRkZEpVeitEb2h0T3UyMnlvWUJWSlVLZlB3?=
 =?utf-8?B?NjNxb2pkMW54TlpORmZMeUR4YnJPd1R4bzhwWlpJN3U0SzQ0U1lpRU1LNFpt?=
 =?utf-8?B?Tm9XTUZlaGE3QlZwWFR5NnE0Ni9vUURhOXRCWlo4ZXFWNW44eGswUTcwWTJX?=
 =?utf-8?B?N2lPVUE1NjFZeHlXU2hPcTZRbXhMb01lanJKL0hpSUJuWmdndHNJQjVKaG9o?=
 =?utf-8?B?dnM0dUdBSjgzNkFWak9xYzVMZzQzS3BKRFZSSU1JdllzTThka1AzMDRrVlFx?=
 =?utf-8?B?MU5pZEF2VTNGdDBwWDJKKzdybkRuZE1xdTloclVsN2JOYUdtYUU0dzNMN0VB?=
 =?utf-8?B?WHZZaitBamZJSVRkVUY4VVhTR1N2TklmKzRON0lGRWcxaDhzTDhDcXo4QXhG?=
 =?utf-8?B?VVNtM09PMzBCTDB3d2ZxaGo0R3RhaDdMVEN2WXh2WXYyWmh4bUdKQnVwZUhE?=
 =?utf-8?B?dDl6eWE1UE52VTRWSjQ1ZFNkbUhsQngyeUI3bTRNRmpLem9XYmMvZlM1N3lC?=
 =?utf-8?B?RmoyZkhDVjlRZUVidlBDWG9zZllzL2V0MzRkUUtOK3NGOXRZMFRpem9LQTZB?=
 =?utf-8?B?VlI3WDlwVmkwT2xDWWkySUU5SitLVHNlOWFienpLejNQUnRTejVKUTM4MGdB?=
 =?utf-8?B?UVB2SG1MdEw1Z21Bek85bk5QdGdBdXY5dDlzVVc3czZBM3dIY3krbW5Tbm05?=
 =?utf-8?B?SmQ2Y1FkSjJMSEE0aTZ4cWJUc0lhanhhY3huZE9nSUMxN2dGSlJRRzYzZkJE?=
 =?utf-8?B?QktmN0lLMWNUTU1EOVp5Z0k2Y0EzZHl2VVFXbHJKV0dBWk5WRWdLWFhRSFZ2?=
 =?utf-8?B?VWZSTURJQjdDb3FvN3JJMmlaSHhRQUphQzZ1QW1qcDhjcWpDT0lEcEx1a3Rp?=
 =?utf-8?B?MG9weWdCNUpBV0pLWDA1ZDhjSHBKTk9KR3lDYWJJTENLb2JjTHZNMnV4THIz?=
 =?utf-8?B?Z1pRTnFnTXVLUDdISmRuSFBhY0dXSS9TNGFEK2ZnVFFMUnRxUFh1WGhzSVFH?=
 =?utf-8?B?RXBOTFhEUzg3Zk9WcFNzSzdoVGwzYmlIZlN5Zkd5SjNtVEVzeUIyaDBUcTVT?=
 =?utf-8?B?UGFVbW1mVFZKbGhDanVHWjc4ZGdLYkhuZGJFbU1KUExMRVI5N1NOR0ZicmVB?=
 =?utf-8?B?dGMyZE1xRG4vbFVWa1JSZ3gySThMZGdDai8rR1pzV1NxaFBkcmo4ai9aaDNR?=
 =?utf-8?B?N1hpL2NIbE5OdkZST1JNWmpoUnNjMTE4YVZHYVJ6UFo0c2RrRXQyV3hTVHJm?=
 =?utf-8?B?Z0IzSmEyQ2c1OTZ0NldkdkdxNVJRaVdsYWpDK1JWT2VhSFJOSXpVanlrMFJV?=
 =?utf-8?B?ekh1cm1MMlM4Q095RlVzaFpzcVpjdDA5WkVqZkk4TjdJZS82dkZpR0FMVnkw?=
 =?utf-8?B?WS90bGZJUTk1NnZlWEl3QzNQRnltN1R2THhiVHZPNkFLY1pGOHN5QlBEQzdm?=
 =?utf-8?Q?/i4v2Kd0idyXEcPaP19DqnL6pSrFH/fH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmhqeFhrc0g2dzhSMUtFYlJHZXdjVjlkTDVUYlRvMGM3V3AwTnlXUHBBNWtJ?=
 =?utf-8?B?RS9vTmZtaExJYzJlRG4vZEd5QzJJNFJxWkE3OHZpNE0xTzNaMUtGU2xleVk4?=
 =?utf-8?B?RDcwbG53c2taUSswYWg1U3NHYUFtcHllT0NPZERYblY5cjM1UVZIcHc4M01u?=
 =?utf-8?B?MDlpNmwxSGR3NHhvVkFmOFNsODZuZ2o4ZHpoSU1kekg4V2gyVnIyZEFIY1BR?=
 =?utf-8?B?Y2tFT0ZaWUxBZXJIc05Od1dJK2NXbkpEQ205ZnVlWFVFbkg0eHVvTnVjTTd2?=
 =?utf-8?B?NzNFeXhhckNEaERXSHp1VVZ3UlNYUUhBZnB6ajR4K2JWVnIvb0dVQTRXMmFY?=
 =?utf-8?B?cUhpRUZmWXJ5Wnh3SGhmNWVtWDJNTEd0QThIN2lSeFczMWpPZnhyS0hycmll?=
 =?utf-8?B?bUc2WG1hd2Z2SmFvM29UNmVnNW1oeUlkOHFWMlN1VTY1V2NYTkZuc3FPOXFI?=
 =?utf-8?B?NzBpWWQ0RlFocXFUS0hYU2ZLWDVJckMyWWhUQm1QNU54SnJuNjF2b0E2ci9D?=
 =?utf-8?B?SUdJNURISURodGxIM1M2aGl0VkNYYmQvZ1J0QjJyYUNPTGVKS3NMalRzSlZQ?=
 =?utf-8?B?WE83bDQyNGtVeCtDWENTZ3JmejlQQ2pKWWhlZ0I5MjhGQk1PalVSS3NmTGJs?=
 =?utf-8?B?Qm1vU0UwdkVRRmp4SHk5cjhMQzBxTko1anhaVkZ6QUwzZGhtbmorYjNCMFJu?=
 =?utf-8?B?WEliVjJCL3QxQktQZnN2RDhiV2F3aWFhZGwrRUl4eHVsVFo3RS9aME8yYk9U?=
 =?utf-8?B?cmprNDF1dk9aL0d1QlpOMFJoQytwZWlIMmh0SzZ6eWRtM3ZINkhZTWRQK0RC?=
 =?utf-8?B?WHUxUGpCbEFjMmJSdC9mVGRGQjJSdWZ0UDJUcHZSQ0ViQmVONmUyTGdqS1VK?=
 =?utf-8?B?Q0QzY2svejBSUTUyUFV4b1d4QlNyY09FOE9WSU1yM0taZys1RXlxSXp4RTdF?=
 =?utf-8?B?MFFRQW5NdkI0YmxSTTdBMXNPZzg1eHJKMHNWTDBnMjUrTHpTWHB1SnNRVDg3?=
 =?utf-8?B?Mkwxc1pucHlLSFF3YnZCbkFiVjA1N1hYb0NhRzJ4eno3UkJSbHNSeW9yMG1m?=
 =?utf-8?B?Y1Q5bExOS1ZnaHJLU0EyMExjY3BZdXhjelVlUnF1UlBKZDVkYVZjYnV4OXdI?=
 =?utf-8?B?R0dTdlN5SytIaXpWWkVlYjBwY3Q1bE9CejdLVnAyUUdoZmxJMmdCNmQ3Um1w?=
 =?utf-8?B?MGVvTVhibzhyZEdyNGFJTDF1RVpWaW52VG9XN0RveFFuUUdmc1pGN2U4UWtu?=
 =?utf-8?B?dTlOTFZFK1NxU0RnWC85QmQ2WVFvWnFOSTZFaW4rWmlwRzZwUGk4N0Z1Ykth?=
 =?utf-8?B?MHdUMDRnMlQxbGhzQ1NNcWJ2QlZ1OEp1WmRVcWQzNmN3M0U2QmwwbHNQblJ2?=
 =?utf-8?B?VlJmbkdsSi8rdC94cThCYzQvZ0kwbXRoQklZdE9udXRnNEIvVW5PN21Cb1hl?=
 =?utf-8?B?VkFSbGhKbCtnQ2R4TXE2NWpYOHVPM2VaejNRSUpsS0xLYUxwY3drQ21pZFJt?=
 =?utf-8?B?bVV4Z2hGMUN6bnlTM3pQdy8vYjNkVkRHS0dpTlpXM1FwaU5GZG82QnNQRU1V?=
 =?utf-8?B?YzF6a1BFS3hTTDJ1WTZkSjAxM0hVZ2Q2emI4TGEzWUZzaEsrQXQvN05HS204?=
 =?utf-8?B?OWJlNXdTem9NRDBZczRBRzg2L283VDFZNTVEc3FvbUNaeFZPU2NKeFNvd0dE?=
 =?utf-8?B?TGxqajNIL3NYaC9LbjhPTXJHcVZ0WjZidkxYZVg0WlU4eldMb0FlNUgvRlI5?=
 =?utf-8?B?d1JDTWhHMmN3WmoxUi8xZzlTWW1YaHd1RWxPS2QraU9FMWRabS9jN0J6UE44?=
 =?utf-8?B?TUVINExnRUJCcnJTalI5WEhXOUZKRHgxMzF6MWl2ZWQvUmZBNEhkK3NHSnEy?=
 =?utf-8?B?bUZjdCtJRVk4OHArYmZ3Zzc3NDA1MnBnSnRwRWh0QTJjdFNydFY1WXhIRXpa?=
 =?utf-8?B?c1gwSjJnQmpMZGR6aEh1RXlrQkY4Yi9TRUw5MUkvTFoycVZrdnU3dkRjUTVF?=
 =?utf-8?B?amY0ZlY1L2ZsSXdqWVZtU1hlbGVvZTFmQXpjSlQ2VXNRTzAyYTlRRWxmSVFN?=
 =?utf-8?B?Vkp1dldwZDUveERLb2NlMXkyS2lHdHJ2MkNKOUxVbmxBMkRxNGxhdEh1Zngx?=
 =?utf-8?B?YTZaQjFVTGV6ZWxLSGxmTmVXWTJHUGxsdGI5dlAyVXltbVdXcU9OaFBLN05x?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 857265d2-bf48-4bb0-80fd-08de17eb43d1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:33:55.9453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlD25smzBgTP40JbLIZcVa6gyubZlx1/bP0M/BKdhuemnoJWfY+23IRcLwDVn5LtcBubU+3elXDdQ/HsUWh1sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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

Quoting Ngai-Mint Kwan (2025-10-30 16:15:50-03:00)
>Fix Segmentation Fault when calling igt_pipe_crc_free() due to double-free=
ing a
>dangling pointer.
>
>This occurs when a system connected to multiple displays executes a test w=
ith
>"1x-outputs" dynamic subtest.
>
>Example:
>kms_atomic_transition --run-subtest modeset-transition --dynamic-subtest 1=
x-outputs
>
>v2:
> - Move test cleanup inside run_modeset_tests().
>
>Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>---
> tests/kms_atomic_transition.c | 25 +++++++++++++------------
> 1 file changed, 13 insertions(+), 12 deletions(-)
>
>diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
>index e1387bd89..419afe4dd 100644
>--- a/tests/kms_atomic_transition.c
>+++ b/tests/kms_atomic_transition.c
>@@ -899,6 +899,7 @@ static void run_modeset_tests(data_t *data, int howman=
y, bool nonblocking, bool
>         unsigned iter_max;
>         igt_output_t *output;
>         uint16_t width =3D 0, height =3D 0;
>+        enum pipe pipe_enum;

Nit: I would have just gone with 'enum pipe pipe', which seems to be the mo=
st
common way of doing it (according to

    git grep -oh 'enum pipe \w\+' | sort | uniq -c | sort -g

).

The change itself looks logically right, so:

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>=20
> retry:
>         unset_output_pipe(&data->display);
>@@ -1033,6 +1034,18 @@ retry:
>                         }
>                 }
>         }
>+
>+        /* Cleanup */
>+        unset_output_pipe(&data->display);
>+        igt_display_commit2(&data->display, COMMIT_ATOMIC);
>+
>+        if (is_intel_device(data->drm_fd)) {
>+                for_each_pipe(&data->display, pipe_enum)
>+                        igt_pipe_crc_free(data->pipe_crcs[pipe_enum]);
>+        }
>+
>+        igt_remove_fb(data->drm_fd, &data->fbs[0]);
>+        igt_remove_fb(data->drm_fd, &data->fbs[1]);
> }
>=20
> static void run_modeset_transition(data_t *data, int requested_outputs, b=
ool nonblocking, bool fencing)
>@@ -1067,18 +1080,6 @@ static void run_modeset_transition(data_t *data, in=
t requested_outputs, bool non
>=20
>         igt_dynamic_f("%ix-outputs", requested_outputs)
>                 run_modeset_tests(data, requested_outputs, nonblocking, f=
encing);
>-
>-        /* Cleanup */
>-        unset_output_pipe(&data->display);
>-        igt_display_commit2(&data->display, COMMIT_ATOMIC);
>-
>-        if (is_intel_device(data->drm_fd)) {
>-                for_each_pipe(&data->display, pipe)
>-                        igt_pipe_crc_free(data->pipe_crcs[pipe]);
>-        }
>-
>-        igt_remove_fb(data->drm_fd, &data->fbs[0]);
>-        igt_remove_fb(data->drm_fd, &data->fbs[1]);
> }
>=20
> static bool pipe_output_combo_valid(igt_display_t *display,
>--=20
>2.43.0
>
