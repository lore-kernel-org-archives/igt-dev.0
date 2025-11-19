Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02289CF3959
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 16:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AB410E66A;
	Wed, 19 Nov 2025 16:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnukmS0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42A110E66A
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 16:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763570371; x=1795106371;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BTWZFdMm7u+VJh9RKWq1QZbAJbj5E2zd3jtPHEm/x78=;
 b=LnukmS0Wh14kiiYCkbCxqX86fihUP0GqZ0ezupbBy6qliM+PePV4wNeo
 +9JpUNPMggE3XMI3ZLA2HD/QHukwOHR/okYQgt9CbAs7CGUuG4YrVXRtU
 mELX20g3GMSRDMUueySt5fZRm3riX7v0qD/l9M+cGk3ubX/Jn5cgcB+jS
 rsENmC5PvkcEHoMUPosZOoPozViCjTyiVlnoUYDywHoC7QZQcM4gYE8c5
 BiPklush9XV5NrU0czGajQ6D1OZaA0evt0ZDRIT4nP9XjvnsX3VYYIWwH
 RUgxdeeJH7mL1H65L+nAmVgrUOiaK8h7GSWZ2svxJXOum6K0FVoz7po6f g==;
X-CSE-ConnectionGUID: p1UYX2GHRumIaY+rEZtzbw==
X-CSE-MsgGUID: X8kl7iT5QiqM+cfjbTbgdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69485334"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="69485334"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 08:39:30 -0800
X-CSE-ConnectionGUID: Ceo5v9WRQfita5PFYluTGA==
X-CSE-MsgGUID: gtGymWJbTX6nCJymuT8kSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191139533"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 08:39:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 08:39:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 08:39:29 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 08:39:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkBm4k5Iggk9XJrL5fUxJyYL8DVvZlW88cayZ7yUi6g91hTN4zQ6O3AFXrp17O4QWU26XGaTD9yi7j0/ayGkTFgeJzDSSMkgpSctdXZKaSIuH7JJu8Y4rahUDpsyNHYx3CHm4nvCUS68eXdE493V0wI/hGYLoQ+JJMnZnz6GODZOeYrjoDAYvnFcrk0MSEA7JsaE7rgbrA75CY3C2BB77I8al2MAclFFjqvRcAV+E2357Nq73fgDXQQKtRspGGyV22qIcG4j26vg6vMqhntNzJJM5o7JQ87Om3n+yjCgy8k/AZcoCy2RHd7EJnH+mtOYtL9qsXe5HjWqGFtmnCDe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTWZFdMm7u+VJh9RKWq1QZbAJbj5E2zd3jtPHEm/x78=;
 b=t/I3WNSSBe8rzwweI6Fc2wiami+FvOhwsWGzd+TTl+/rXxVHKQbKGj+w8PR8757Merc5eMWdeKd5uk+g49uHXIiog1BNX40Gmuy8Pwq+B/YiQOmKGrUbPHNH0pKJgZPAbNiAA2lf8TQYlThDvS3Uc2uqQMl5cs4OHK2TA8DVfv/l7a0T8OOdAb6ykDWxu7bJUMAjznnpWc6sTsRwdgpcV/jdXzVfkt8kwM76VEO6TIwN/i0HTr7YRAM12HWek04ixwnkJjBut+MY6DwgugateMANpqK6HZzz2izp2R/ma5pu68tR6WicnFJBT4F1XEfqqcXSKPqfRtdO+u1Fayfa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Wed, 19 Nov
 2025 16:39:27 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:39:26 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe2
 platforms
Thread-Topic: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for
 Xe2 platforms
Thread-Index: AQHcWJchwMEdGjLqbkigFiOSoquCWbT4r4kQgAFHDYCAAD2q8A==
Date: Wed, 19 Nov 2025 16:39:26 +0000
Message-ID: <SA3PR11MB80464E069FB8D679B69877E186D7A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
 <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
 <SA3PR11MB8046AA5502D6CCE3930773A986D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <aR2-bUaoRjDBsO93@bvivekan-mobl1>
In-Reply-To: <aR2-bUaoRjDBsO93@bvivekan-mobl1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|DM4PR11MB6527:EE_
x-ms-office365-filtering-correlation-id: 827ccb0a-9a1e-4478-cb9b-08de278a3439
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?U2NVL2RFaFAvd2VEd1lqNFJCMEV0N1JKRHdKWlBqc29wWUNaL2ZLN2tnNXNq?=
 =?utf-8?B?RkJ1Nk9WQU4yU2pFelJHNmNsSnJUblZtUFg3UlpZVFAvaG43dVJhOU1WbzdZ?=
 =?utf-8?B?MmcxbE1zemFzbkZUNk12TCtYV0k3aXpyaGpCWDR0Rm5WOThtNmg4K2RGVzU0?=
 =?utf-8?B?eHFXcUdObEVXeXZSNHd6ZXlSNnhUUE1ONGZyRUdyRmU2eC9xUjQ5WTFQdVUx?=
 =?utf-8?B?YnRxcHVjeWFNZk05WjdMc1ZScHFmcmtjOFFhbldOc1dUMGZsQ3NJN2pIbWlT?=
 =?utf-8?B?QzVMb0dYYnVmQ0Z6OTBmWnNvdEZJRjdtUFB3dU00My94T0tNeUlNbXVndk5n?=
 =?utf-8?B?ZGVSTzhRWm93VlFIRWZIdmFCZGl4RWgvb3dvNmJmOS93d0dUc2tpQ3NEUzQz?=
 =?utf-8?B?em04VU5YTExMaUJBS01UT21YM09qNmZjZFNlMFc5SHJucXBJUWROY0dBUW5X?=
 =?utf-8?B?eFRvOVFZVWtpQlFjZ0txYjE2a2JqMEVKbU5SZHMySTV4KzBGdnBaNURTck1T?=
 =?utf-8?B?RytxV2RLclJPQXNLUVlYTi9tZkZ0YXZ0b2lCSTZpS0RXQlpxaXI5WTFmQTA5?=
 =?utf-8?B?UGFoRFhhZUExWGNET0tXRzdGR0luVzVRRU9xc1p3eVQxSjRiTjVQUm5XVXAw?=
 =?utf-8?B?cHBSQzFRd2ZnZk9JcmsreVpSZzdId1NMcmRySFprL1gwV3JmOG9hK1lhYk5V?=
 =?utf-8?B?TGVVZXNHTXd5ZUp6WTdVT1p3RThUaGdkV3FrN3NPdEJWaEY4TGVpYWtIL2ZW?=
 =?utf-8?B?a1kxYjd1THZFYlp1aEhBcXFhVkNuRERYdSszV2JxakFUOWpxMmh1eUQ3alZN?=
 =?utf-8?B?aVc4Mlk4UWVpdHRDcVhWZ1JrbEdUKythcDl4ZnJOYlN2Kzl4TkxVMldHWUQ3?=
 =?utf-8?B?cHFhQXRKWnJrWm5nQzZRUUtVakxWQUJ4MGhCblFvdEw3dlA4WmUxT1N2UzVl?=
 =?utf-8?B?aGdZNFp1Q1ZyOEpaV0lzdzBCNENTM3FFYlRVdGhmT1ozU2RIclRNS2pDTFFW?=
 =?utf-8?B?RWxPOHJFRGZ1WHlMZ095cGtJQ1Iva3ROS2xld2FyeUhNeUZ6djJNeUVUMjdj?=
 =?utf-8?B?N3ZoQmN6UWFrSXFVenJpUFdieFljNUx5WUl3SFU1NFZLVkNkWmFRQ3JHbUhD?=
 =?utf-8?B?alkrUGdRVFI2Y0xUQkM5cWVST2NrVy9jQWNIUm1YelpYd1NUb2JkcVFodzM0?=
 =?utf-8?B?WGxvaCswZzlCNzErK1FoN0c4VWlUT3lIS2hkNGdpZnA1bHZ5OTRrMGtrZ1Fu?=
 =?utf-8?B?eDdZaXNyMzl2UjZZbVZuaVpRd3NTV0pOSkl0a1VJcm9zSG5pWkhROGZmbHZM?=
 =?utf-8?B?cWgzWENGaTBTOEpncWU4bm9jbFQ0akp3Sjc5am4zSnZ1Zis1WDN2OGR2c2hZ?=
 =?utf-8?B?cmFFdmJCWnlINTQ3Y29KMUFaaVloRHN5c0U5MVNONWEvbDhGNnoyS0NTcEpE?=
 =?utf-8?B?K3BXcFNISUdJY0pKRk55TjhIMFcvZzdKM0NlczhoaGxZSWx5STZmbElnMzBT?=
 =?utf-8?B?MVY3N2RHN2IweVpMV29YMGFzQVR6RXpZZkxPZzlBQmxpbENSdDcyWWZwYTJO?=
 =?utf-8?B?QXc3T1BsK2FjWnJha2lwaXlVZ0p5aXh4dzRndmVkelpuZE1SL0xDdGVzWitG?=
 =?utf-8?B?aXNHeWl0cTRUU2RRUXhiampSL3FBQjRGT0taTXhITUFVTm56S0Jjd2lBTVNZ?=
 =?utf-8?B?M2VxL3hrK1cxYWd2YTh6aVphRFFNWTBKVTF3cHk2TjgyQkg5OXY1LzhuYWVD?=
 =?utf-8?B?ekJxb3Y4ajAzVCtaSFNDQ0RCVE5iZEd2SWsrWFRFL0EzN0xlUWM3R3ZWa2Fv?=
 =?utf-8?B?WUpCbXRYbklOcE96aDYweG5KeVdYcmhEbkR0OGgxOWdwZ2JLYnpBdEhFemdO?=
 =?utf-8?B?Y2d2S1dYUzNVcSswUW1RTFFFSnZxbTkvS1NWclBPSXVXajA0NmJhdUVwdlY5?=
 =?utf-8?B?VG5xZTFRTUh4TjlhajVjSGxBQlU3ZDBRMUtSUWFuLzMxL3k0N29ndUpCMW5G?=
 =?utf-8?B?c2FTVG9rL1V6MGxHMmRyNVozalRiUzBaNWRtRVhUeGpsYnM3S1hSby9QMUhh?=
 =?utf-8?Q?7UOi5L?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHBFZkhyQ0RqaCswamlpM0lzWEVrZU00amxhNWRSQjI2TDgyMVhKMkhPUmZE?=
 =?utf-8?B?OW02UFZVYzJrUm5ZYkhQaUtSM2wwWFVNdm9teXp1YSsrTWNaVVVjYkpSVkhz?=
 =?utf-8?B?ckt0aW94K1lPa2QremFJRUxvcjZFNTZEUzlYRitSTUxtT0J4dWlVaGc5L3JU?=
 =?utf-8?B?Nzg3ZjNKZ1lvOGpmY05tWWF4dGJhUTVrMmhkSDBnQmNWMnlVNTM1Z1JpUUR6?=
 =?utf-8?B?WGdINU9pcVRiUFFrbHNPUnpwWkFTL2hLaWp2QlZNSS95WVBFNi9EMFNHQUFh?=
 =?utf-8?B?Z0pUUmtFazQyd1Yyb1hzN3lZZ1k5dGFmc1BnMUREdlZNWG1VbktiM1p5QjRI?=
 =?utf-8?B?ZUVUckh0T0FvNklhNHQyYVFuM0t6SHUvckhaVjg3WTVlaTM5V1RvdENTck5n?=
 =?utf-8?B?a1czREFXeWU4YXBSc0NPQWc4QWRCcjlOcXNkalJZNkRiQ2FZT1d2bElnTG9Q?=
 =?utf-8?B?S2xvUXdTZXNIVEx5d1laQTBQaEhCUlU3QWI1bzRLeThGWnVZaWhiS1J3SXAy?=
 =?utf-8?B?T0tEczN6K2ZHT0E5Uk81ak0yWlVadkQ5OExmbnArVjZHdEVKRmQ3a1JHckh2?=
 =?utf-8?B?c1pNdnUzSzk4QWg4eGNBTm5aSXFvcW10eGwrNEdnb1JSMC9UcnVzWkYrUmtw?=
 =?utf-8?B?dFMyT2pJOExEMkFXTFdndi9HRUoyN0tiNlhxZzkralRjUnlZRFFSUmR3aXY1?=
 =?utf-8?B?VVo1cnJ5b3V0RXdVN1gzeWhqZmlWeVd5U2JrTzVacHVlUnlyRU1zQnVVeDEx?=
 =?utf-8?B?UUQ3amVxNzdkdXU2T0daUGJBMU9PVHNIZU1yTG1OcEcybTh1b0VHQm9qTDlX?=
 =?utf-8?B?WUxkbEF2UnE1d2RCT2R2NXd5dnZZd3M4ZldDMlJRaFBVMUd5cmhsTEJ4cUp1?=
 =?utf-8?B?THc0bEdQbUM1Mks5TlNnZ3B3eWJpaTBqOTA3L1ZjMll4S0Y5UllwdTdMR1E0?=
 =?utf-8?B?NmZUTnV1N2EzL1pYS3dBcGZOT0I0eXJLWVdlU2FJNXA5ZldKWUFDdVk5Q09h?=
 =?utf-8?B?T0FVNUd6UnNySExEaHVEZXYxdjFWc29EMzVucGZ1dVAySWpMc29kYVFIblg4?=
 =?utf-8?B?QnNrMkdOTEJWbHVMY01NNjhadDRnL0IreGZPcFVJZFFOTENGbU9DK1FvL0w1?=
 =?utf-8?B?VlJ5L2hkQVQ4T0RYMVlHSWRaTlcxViszWHpyYW1kZklVQlIwWis4ejdaLzE0?=
 =?utf-8?B?MkkrbUY3Tk9ncnpYbkNJcTdOaW9PakpjQkhFNlVCQVgwb2wwMXlTTUFuWHJm?=
 =?utf-8?B?MVJ4VUFwMmRkRmUweHlRWHhyQzFKNGFlMy8wNDREYkdZckFSTjgvZENGM0RB?=
 =?utf-8?B?MFo0R21PMU14RmptZ3lmS09Hc2NiVWxxNlFabFZ3d1VGaTZCck5jWmI2M3Bu?=
 =?utf-8?B?MUYzYmJlUkd2YzAwNURxQ3RXRHFjZVpZUkFpcU1HNXliMzUvN2FiUVVudldj?=
 =?utf-8?B?bzFFemFkN1dnOS9iTzV6dUpIMmloVFZVL0ZMbjhzc2ZzWVJqS0tjOWlpbWNr?=
 =?utf-8?B?VWRRN2h0YkhJTHR5bmczUlREcWc5ZkowTWJHMWhPbm03K1BndUtVM3lLZU42?=
 =?utf-8?B?U2NRS0xSeG9DNjRETmRqUFBuOVdxL3pCYXVEZ1dwWUZyeWlXNGxIVjFDcUNp?=
 =?utf-8?B?S0ZucHBaNTJlUHBQSTNhUmIzV2JqU3E0Uk51bDduT0g5eVp0SmcySktTQmNl?=
 =?utf-8?B?RFBVL1FUUXdmOEE1U0VrWFBpMGJUSmhLLzE1aE0xaFFzVUZSR01KV3hHU1hu?=
 =?utf-8?B?TjdEVTdHWC81UjZqNDQ5OUpOeTNFaW9XS1hScjNuRmsxWTRnNmdScmFPMEMz?=
 =?utf-8?B?WHQ0MXB0SGh3aXdlbENvY3IvS2o1Wjl1TXVqLzNDQU1CK2RTZXc4ckZpb0h2?=
 =?utf-8?B?Zmh5NWtsbkZyQjBoT3NmWEpudklnWnF6eko2YnhKc0tlRWlmVkxQeWM4R2RL?=
 =?utf-8?B?b29VQWRweTVrVTJwaVpYWTFhaHVyS0J1dm5IYUFzTzVGOWlyUWhRdy9iMmZG?=
 =?utf-8?B?THByYkNLSFBKVzZENysvazZYM0I1Yk1Fb2grdDVvc3ZYcGc4ZVo5WXpTbk5J?=
 =?utf-8?B?NFpQQVprd2c1NWJ6cGJwRzNOaFlPb28xMUtsVGZ1K1MxTnBMNnRLeDh4akg0?=
 =?utf-8?Q?OwWE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827ccb0a-9a1e-4478-cb9b-08de278a3439
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 16:39:26.8038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qt/rofGYStV+CfwOxxiPLmlcwYQpMTbKafX22aVHmPe8+mu5vUrRIQIn0SYRtmn5Xf+Gfo7X0cCN2r8/FHJcnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2ZWthbmFuZGFuLCBC
YWxhc3VicmFtYW5pDQo+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTksIDIwMjUgMDQ6NTYNCj4gVG86IFdhbmcsIFgg
PHgud2FuZ0BpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
S2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBE
dWdhc3QsDQo+IEZyYW5jb2lzIDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIvMl0gbGliL3hlX3NwaW46IEZpeCBtb2NzIGluZGV4IGZpZWxkIGluIG1l
bV9jb3B5IGZvciBYZTINCj4gcGxhdGZvcm1zDQo+IA0KPiBPbiAxOC4xMS4yMDI1IDIzOjI0LCBX
YW5nLCBYIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YNCj4gPiA+IEJhbGFzdWJyYW1hbmkgVml2ZWthbmFuZGFuDQo+ID4g
PiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxOCwgMjAyNSAwNjoyNQ0KPiA+ID4gVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBDYzogS2VtcGN6eW5za2ksIFpiaWduaWV3
IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBEdWdhc3QsDQo+ID4gPiBGcmFuY29p
cyA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT47IFZpdmVrYW5hbmRhbiwgQmFsYXN1YnJhbWFu
aQ0KPiA+ID4gPGJhbGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGludGVsLmNvbT4NCj4gPiA+IFN1
YmplY3Q6IFtQQVRDSCAyLzJdIGxpYi94ZV9zcGluOiBGaXggbW9jcyBpbmRleCBmaWVsZCBpbiBt
ZW1fY29weQ0KPiA+ID4gZm9yIFhlMiBwbGF0Zm9ybXMNCj4gPiA+DQo+ID4gPiBUaGUgc291cmNl
IGFuZCBkZXN0aW5hdGlvbiBtb2NzIGluZGV4IGZpZWxkcyBoYXMgY2hhbmdlZCBpbiB0aGUNCj4g
PiA+IE1FTV9DT1BZIGluc3RydWN0aW9uIGluIHBsYXRmb3JtcyBhZnRlciBYZTIuIFNvIHdlIG5l
ZWQgdG8gY2hlY2sgZm9yDQo+ID4gPiB0aGUgSVAgdmVyc2lvbiBiZWZvcmUgcGxhY2luZyB0aGUg
bW9jcyBpbmRleCBpbiB0aGUgaW5zdHJ1Y3Rpb24uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQmFsYXN1YnJhbWFuaSBWaXZla2FuYW5kYW4NCj4gPiA+IDxiYWxhc3VicmFtYW5pLnZpdmVr
YW5hbmRhbkBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBsaWIvaW50ZWxfYmx0LmggIHwg
IDQgKysrLQ0KPiA+ID4gIGxpYi94ZS94ZV9zcGluLmMgfCAxMSArKysrKysrKystLQ0KPiA+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2JsdC5oIGIvbGliL2ludGVsX2JsdC5oIGlu
ZGV4DQo+ID4gPiA1NGEwOTZjMDMuLjJmYWUwNDViYw0KPiA+ID4gMTAwNjQ0DQo+ID4gPiAtLS0g
YS9saWIvaW50ZWxfYmx0LmgNCj4gPiA+ICsrKyBiL2xpYi9pbnRlbF9ibHQuaA0KPiA+ID4gQEAg
LTUzLDcgKzUzLDkgQEANCj4gPiA+ICAjaW5jbHVkZSAiaW50ZWxfY21kc19pbmZvLmgiDQo+ID4g
Pg0KPiA+ID4gICNkZWZpbmUgQ0NTX1JBVElPKGZkKSAoaW50ZWxfZ2VuKGludGVsX2dldF9kcm1f
ZGV2aWQoZmQpKSA+PSAyMCA/IDUxMiA6DQo+ID4gPiAyNTYpDQo+ID4gPiAtI2RlZmluZSBYRTJf
TUVNX0NPUFlfTU9DU19TSElGVCAgICAgICAgICAgICAgICAgICAgIDI1DQo+ID4gPiArI2RlZmlu
ZSBHRU4xMl9NRU1fQ09QWV9NT0NTX1NISUZUCQkyNQ0KPiA+ID4gKyNkZWZpbmUgWEUyX01FTV9D
T1BZX1NSQ19NT0NTX1NISUZUCQkyOA0KPiA+ID4gKyNkZWZpbmUgWEUyX01FTV9DT1BZX0RTVF9N
T0NTX1NISUZUCQkzDQo+ID4gPg0KPiA+ID4gIGVudW0gYmx0X2NvbG9yX2RlcHRoIHsNCj4gPiA+
ICAJQ0RfOGJpdCwNCj4gPiA+IGRpZmYgLS1naXQgYS9saWIveGUveGVfc3Bpbi5jIGIvbGliL3hl
L3hlX3NwaW4uYyBpbmRleA0KPiA+ID4gNzJiMTNlZjQyLi4xYjEyY2U5OTENCj4gPiA+IDEwMDY0
NA0KPiA+ID4gLS0tIGEvbGliL3hlL3hlX3NwaW4uYw0KPiA+ID4gKysrIGIvbGliL3hlL3hlX3Nw
aW4uYw0KPiA+ID4gQEAgLTU0LDYgKzU0LDcgQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhl
X3NwaW4gKnNwaW4sIHN0cnVjdA0KPiA+ID4geGVfc3Bpbl9vcHRzICpvcHRzKQ0KPiA+ID4gIAl1
aW50NjRfdCBwYWRfYWRkciA9IG9wdHMtPmFkZHIgKyBvZmZzZXRvZihzdHJ1Y3QgeGVfc3Bpbiwg
cGFkKTsNCj4gPiA+ICAJdWludDY0X3QgdGltZXN0YW1wX2FkZHIgPSBvcHRzLT5hZGRyICsgb2Zm
c2V0b2Yoc3RydWN0IHhlX3NwaW4sDQo+ID4gPiB0aW1lc3RhbXApOw0KPiA+ID4gIAlpbnQgYiA9
IDA7DQo+ID4gPiArCXVpbnQzMl90IGRldmlkOw0KPiA+ID4NCj4gPiA+ICAJc3Bpbi0+c3RhcnQg
PSAwOw0KPiA+ID4gIAlzcGluLT5lbmQgPSAweGZmZmZmZmZmOw0KPiA+ID4gQEAgLTE2Myw4ICsx
NjQsMTQgQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdA0K
PiA+ID4geGVfc3Bpbl9vcHRzICpvcHRzKQ0KPiA+ID4gIAkJc3Bpbi0+YmF0Y2hbYisrXSA9IG9w
dHMtPm1lbV9jb3B5LT5zcmNfb2Zmc2V0IDw8IDMyOw0KPiA+ID4gIAkJc3Bpbi0+YmF0Y2hbYisr
XSA9IG9wdHMtPm1lbV9jb3B5LT5kc3Rfb2Zmc2V0Ow0KPiA+ID4gIAkJc3Bpbi0+YmF0Y2hbYisr
XSA9IG9wdHMtPm1lbV9jb3B5LT5kc3Rfb2Zmc2V0IDw8IDMyOw0KPiA+ID4gLQkJc3Bpbi0+YmF0
Y2hbYisrXSA9IG9wdHMtPm1lbV9jb3B5LT5zcmMtPm1vY3NfaW5kZXggPDwNCj4gPiA+IFhFMl9N
RU1fQ09QWV9NT0NTX1NISUZUIHwNCj4gPiA+IC0JCQkJICAgb3B0cy0+bWVtX2NvcHktPmRzdC0+
bW9jc19pbmRleDsNCj4gPiA+ICsNCj4gPiA+ICsJCWRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZp
ZChvcHRzLT5tZW1fY29weS0+ZmQpOw0KPiA+ID4gKwkJaWYgKGludGVsX2dyYXBoaWNzX3Zlcihk
ZXZpZCkgPj0gSVBfVkVSKDIwLCAwKSkNCj4gPg0KPiA+IE5JVDogY291bGQgd2UgdXNlIHRoZSBl
eGlzdGluZyBoZWxwZXIgaW50ZWxfZ2VuKCkgPw0KPiA+ICBpZiAoaW50ZWxfZ2VuKGludGVsX2dl
dF9kcm1fZGV2aWQob3B0cy0+bWVtX2NvcHktPmZkKSkgPj0gMjApDQo+IA0KPiBCb3RoIGludGVs
X2dlbigpIGFuZCBpbnRlbF9ncmFwaGljc192ZXIoKSBhcmUgYm90aCBjaGVja2luZyBmb3IgZ3Jh
cGhpY3NfdmVyLg0KPiBpbnRlbF9nZW4oKSB3YXMgY3JlYXRlZCBmb3IgbGVnYWN5IHBsYXRmb3Jt
cyB3aGVyZSB0aGUgZ3JhcGhpY3MgSVBzIHdoZXJlDQo+IGlkZW50aWZpZWQgYnkgYSBnZW5lcmF0
aW9uLg0KPiBNb2Rlcm4gcGxhdGZvcm1zIGhhcyBhIHNlcGFyYXRlIHZlcnNpb24gZm9yIGVhY2gg
b2YgaXRzIElQcyBsaWtlIEdULCBNZWRpYSwNCj4gRGlzcGxheS4gU28gSSB3b3VsZCBzdWdnZXN0
IGluIGFueSBmdXR1cmUgY29kZSwgd2UgY2hlY2sgZm9yIHRoZSBJUF9WRVINCj4gaW5zdGVhZCBv
ZiBnZW5lcmF0aW9uLg0KPiANCg0KSSBkb24ndCB0aGluayB0aGF0IGRpc3RpbmN0aW9uIGlzIHF1
aXRlIHJpZ2h0LiBpbnRlbF9nZW4oKSBpcyBpbnRlbmRlZCBmb3Igc2NlbmFyaW9zIHdoZXJlIHdl
IG9ubHkgbmVlZCB0byBjaGVjayB0aGUgbWFqb3IgSVAgdmVyc2lvbuKAlGxpa2UgaW4gdGhpcyBj
YXNlLCB3aGVyZSB3ZSBzaW1wbHkgbmVlZCB0byBpZGVudGlmeSBYZTIrIHBsYXRmb3Jtcy4gaW50
ZWxfZ3JhcGhpY3NfdmVyKCkNCiBjb21iaW5lcyB0aGUgbWFqb3IgYW5kIG1pbm9yIHZlcnNpb25z
LCBzbyBpdCBpcyBnZW5lcmFsbHkgdXNlZCB3aGVuIHdlIG5lZWQgdG8gY2hlY2sgZm9yIGEgc3Bl
Y2lmaWMgZGV2aWNlIHJldmlzaW9uLiBCb3RoIEFQSXMgYXJlIHZhbGlkIGZvciB1c2Ugb24gbGVn
YWN5IGFuZCBwb3N0LVhlMiBwbGF0Zm9ybXMsIGRlcGVuZGluZyBvbiB0aGUgZ3JhbnVsYXJpdHkg
cmVxdWlyZWQuDQoNClhpbg0KDQo+IFJlZ2FyZHMsDQo+IEJhbGENCj4gDQo+ID4NCj4gPiAtIFhp
bg0KPiA+DQo+ID4gPiArCQkJc3Bpbi0+YmF0Y2hbYisrXSA9IG9wdHMtPm1lbV9jb3B5LT5zcmMt
DQo+ID4gPiA+bW9jc19pbmRleCA8PCBYRTJfTUVNX0NPUFlfU1JDX01PQ1NfU0hJRlQgfA0KPiA+
ID4gKwkJCQkJICAgb3B0cy0+bWVtX2NvcHktPmRzdC0+bW9jc19pbmRleA0KPiA+ID4gPDwgWEUy
X01FTV9DT1BZX0RTVF9NT0NTX1NISUZUOw0KPiA+ID4gKwkJZWxzZQ0KPiA+ID4gKwkJCXNwaW4t
PmJhdGNoW2IrK10gPSBvcHRzLT5tZW1fY29weS0+c3JjLQ0KPiA+ID4gPm1vY3NfaW5kZXggPDwg
R0VOMTJfTUVNX0NPUFlfTU9DU19TSElGVCB8DQo+ID4gPiArCQkJCQkgICBvcHRzLT5tZW1fY29w
eS0+ZHN0LQ0KPiA+ID4gPm1vY3NfaW5kZXg7DQo+ID4gPiAgCX0NCj4gPiA+DQo+ID4gPiAgCXNw
aW4tPmJhdGNoW2IrK10gPSBNSV9DT05EX0JBVENIX0JVRkZFUl9FTkQgfA0KPiBNSV9ET19DT01Q
QVJFIHwgMjsNCj4gPiA+IC0tDQo+ID4gPiAyLjQzLjANCj4gPg0K
