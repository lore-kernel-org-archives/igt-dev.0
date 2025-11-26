Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29563D1039D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A316710E5A7;
	Wed, 26 Nov 2025 10:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="US80Z2vq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8AD10E5A4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152929; x=1795688929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eh8aEt5P+W/tJ+wf1cyCpW2W5oRMTCSdH4UYZcdsGuw=;
 b=US80Z2vqIswpmkIXgMrc73+oOJ5ryznOxa+FsGvOGJ1y9SeEWRa+6GHi
 Nuy4Zk7+oZLeombvs3P2SgXoFWVQbL9OMgvSAK8v5TXCjiLI+M3CRkUOy
 BLwOm9pf9DPy/9vz+/tbOoYAUEkfN2zIxIeDoBAnmFOovUozASlVwNzRR
 QH9VAEAe2TuXL8Lu0S1VKkwVoqSaITiv5HpNMXYlOLfWx+btcpx/xIRmg
 IzEvIOGN4LunhPecVJA8irqR7a2hHUQ7gyNLD4zQmdZavJmRkYwBpNKQW
 CjoeJ0XCICWs3dN6zVAkccpRuY7+4kAXlXqP6jnd9UWpyNWXTphHWhimj Q==;
X-CSE-ConnectionGUID: 440HPuPuTIK88JbF43QkcQ==
X-CSE-MsgGUID: L7Oz2moHQ2qOI7UJV7CICg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65893758"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="65893758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:48 -0800
X-CSE-ConnectionGUID: w0ikz5jFS16Bnr8zpSQTYA==
X-CSE-MsgGUID: 2jF58MBpQ2+MznxuAmsiYg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:28:47 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EluV1Yxx69hNrA8nif4klNg11WyfHgtWynnK8sYIZRMyKxmLmNl25TXzRetfeUuScZZ8/S2m31FAPu25IXquZ/qzsq/EzP+OFiQtS/STcRhUCtsae2ri/3SEjwizbZSNOwziQ/p1w0RrvcKHMHiv/lKCQXyvDZn8DPB+4mo2/zR+hOK1YkcsYAnwEHf8+2eUYlkKKeO4O3pPO2lrk1YBG0LruQBQWSp0t5HIpsROKTYlX5JjgpSPY6vy/+9gSm9DIsuHzuZVJ2zYGicf8ySlKiJfqfTg+OMowgZnESbrUjyrIkY5UYgLYst6imtuKK9M5K7HqfiO4vXqerRrI6x0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+joSVe0CRTGJvyW4+f85veKZLF0qZV0oLqiLBa0XWM=;
 b=qnE/IEcf0srf/m56YtR7bEATmXf6ElyH3PetX/u55ODPMG2/e0HlF0MVboUyvYtRWG2DTLVbSl/waj5L11E1uUSb2k/b++v195dTB3tGBdIMyjTWRtGzUPzRkvNgJSgF59CdcIr3F2O0eJqx1vWPsw4NmIFqdNelnEHOXIvSxWlVOiDWS/KZFinTYspE/2eCpVvzItRP9ayBgfRV3g0C3hBy3O2MfxtZM3+E7yfO3qTbIQ672m/Ne23lLCaykypNsIj0cVhw4C6F5aRhykd5sEqAZzrqiNqd+LCoO3dTazfLJeTA2TiSXc/SjtQT02XqY2pwYhRKffo62LEm0zFKNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:28:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:28:44 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 3/5] tests/intel/debugfs: Rewrite tests to use array-based
 required debugfs file lists
Date: Wed, 26 Nov 2025 11:28:25 +0100
Message-ID: <20251126102827.47844-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102827.47844-1-piotr.piorkowski@intel.com>
References: <20251126102827.47844-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 415677c0-ea51-4c00-6176-08de2cd693bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlE1bmJFYTJVV3ZEKzRNNkJTRmVmc1pWelg1NnR0VG1SWm1yeUFhb2U2YTBM?=
 =?utf-8?B?T294SnNvZHBlQmVSZkVzeE5yMlZSUzVZdGg0dzFWTzRPMS9qdEJlWkR4bXNI?=
 =?utf-8?B?dU9iZDVXSFQvaGNsRXR2clpzZmtMakxXNFRDeW5wVytjZEgwbE9sQ1ppZk1C?=
 =?utf-8?B?cE00K1VHNVFMN2pVVlFFYkVxWThLVkpIZi9wcUpSRURER3lQTE9CSjF1c2Zi?=
 =?utf-8?B?Sms0K3RybFpZYTMyNDl6MS84NzdzdjArYk0rKy9KMmVGam1OYWZHVlgzV05U?=
 =?utf-8?B?KzhUcG03Uk5IVmZRVmZSeXkrZ1BhMlZTSUh5U1JnU1loamt6dE1CeExqdjFz?=
 =?utf-8?B?b1VSNlBaeStNVHpxRncwNEd0NytjMlc0b29qQUsvSGt2bytZRmloUjhaZHZS?=
 =?utf-8?B?VmczdFU4VW1JS0RWVmdtWHBVRDltL0kvclBGQUNBU2M3RktuVHdZVEpkeTkx?=
 =?utf-8?B?OGJYdkFMM3NBN201VWgwNmJnd2NmSGU4aXhnUFRuMzNlMnZuaDlPd2lZdHRV?=
 =?utf-8?B?Lzk5QUR4aWQzazljLzhaMHZrUk5HZVBiWUVGelNsQTcrMXV5eGxBa2VIYzZC?=
 =?utf-8?B?bzc2cnFQYklYME9SNkZNc01CUEJxQ1NrdmhnR2Nhd3V4V0lhcmxsSHpvWWFS?=
 =?utf-8?B?NWFwMFFnL1NhdG0xZjE4MDlqSDBWbmtRVkZqYW9zdkFid3VBZ0xieEpWYWdx?=
 =?utf-8?B?VTMrajNkUi9wZ2UzTU0xeGZKVHlXelkzSUU5UlY1S2RUYUFpS1k0V2hvNG45?=
 =?utf-8?B?QUt0NVRpRFhoVDUxeUw5TnBneUUwRDREME1TYkIzcmh0YlA2QXBxVWhKR2k2?=
 =?utf-8?B?cG9UUUVHeFBUOGhDeXUvdU5Fb01WMHA0TDc0U0s5bTNOOXVtb1NJMDlzQkNH?=
 =?utf-8?B?VzJvT2xHd3E3NEd4blozY2laQ09YY1A3L1RyTnhRR2lseEpFL2Y3dmJQVEtJ?=
 =?utf-8?B?Q2lvRFNvYXBiSEZQaDFKenZFcWFYbG1hMWo2RDY0N0g3ZUNsNVI1dURjOWlH?=
 =?utf-8?B?ODhhREdOUDBGRlJETmkrcHkzM2gzeU9mTzdaRnBzTzRTY2xQTDdHN3JEWjF1?=
 =?utf-8?B?YXJZOUpDVHZOaEVwZ0duNUhxaFhENVlVdEFUNWZGM0FHTFZSRWVWU2d6TXFK?=
 =?utf-8?B?RXY1NDhPdXZBS2JSQUFxQWFKV3doUVJaV2NXRDNlRGF5WGJhYkcreThWQUM2?=
 =?utf-8?B?d0tkb0VKTEY2V1ZvU1dWMkxFRWZKN2RWT1d6czNaTnFhSW0rcjg1bHFHVzJh?=
 =?utf-8?B?dmhyVm1qMnNIUnFiTUdnZ1pEM0VBZzVBZ0JQeDNuOWZKblB5RXBLdk1GWmFr?=
 =?utf-8?B?T3prOU43b2dJYW9XOTVkL2VMNDdWcXI1M2RZY21TNWtFTUhsL2JtQUhIY3Yr?=
 =?utf-8?B?bnV0aDkyUVpFL3M1dXBrbzNuUmFObjUzLzRnYXBDT2RtcnhBUzVCTlNrWVBR?=
 =?utf-8?B?S0RhV2hydTVjK3BTKy9TVnpHa3RuSkFydUVNdEdDTGxBQUREUFVyellHUXNl?=
 =?utf-8?B?SVRTL2lhK0R3SENsYUdHNHR5ckJ5TlVJa29JZk5JRk9semIwek0xcWZSb2VW?=
 =?utf-8?B?VVUzQ01KekNteW43bEtQUlBUZy9wNmRzbTBSMEtMOVFKVGcrd052TTBFSFI5?=
 =?utf-8?B?aWY5L3hzRzBLRmd3UWszaGhkUjU1ZG5JaTVzK3V5UW85WVpEN2FyRjlGR0Ev?=
 =?utf-8?B?RStabkFjS0xvMVc1eVZ6Q2xEdW5wU2p2SEswZmJUOGExQ1hkaHgxU28yQlJ0?=
 =?utf-8?B?TUtpT1lDM1RqZWh3WDZtelhYcC9NR08yd2pNOENXTnRxamdOd0FicjBsN0w3?=
 =?utf-8?B?dVNYQmFBZUM3L1g3TWNPZ01TQVVCd3pEcVJidjJDQWl5eWh5WFlDb2tvS1pT?=
 =?utf-8?B?Y2F3QUlOQ285VlhmcndZWDAzRVFEdE4zSzAyVlo4VWNaK3IvRjBLeE9iOTU3?=
 =?utf-8?Q?gaRYrxpwnpGYnuDdcKxHM+po/tpatx1W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2ZQZU9BbnRXREl1QXhIMTJTaU5UWEhWMUJnaUJPb09oVk1OWGZtV0lUMnRJ?=
 =?utf-8?B?UmUxMHVOMWlrMmJ1bzJGMG9QMU9NYmxkNFhsY2dncXpXVDh6b2JXcW5tb3g4?=
 =?utf-8?B?Mlk3VVRUL0Y3TEhESmdZYzU2RFhJY2JBN0xHbGQwYmJKaTEwWHNGVGFta3VQ?=
 =?utf-8?B?NEZDN0x0eFltNHhrMm5ScmJ0TktmM1NYT01VamVQd2lFRkl3bjdJa3RlSm9W?=
 =?utf-8?B?d1VLeEI2SGd3UE16N2Z1eU1FTUJEYm9HMnJaY0JkWXVtWU0wUFYwaEo1a2d0?=
 =?utf-8?B?Y3BrbkN6a2tra09jYjNOa1dPWERGVjlBRzVmc2lWWmtCaVozTDc4emxMYmdL?=
 =?utf-8?B?bTNLcmEzTHoxSzFpKzFld2x5RlovbnYwTWJOVEdKOW9EdmhVRnFMVkJobzBs?=
 =?utf-8?B?SUtxODZsOGgySXM2eWJzcm9YWHpnbFBoUG80amVwcmNtZUZtcHBDTUdRSFpu?=
 =?utf-8?B?bzR3amdMekkyVjlPN0JNRXUxV2lwYm9TVk96WFMyQlVBN1pVbFhMZ0JBTEpQ?=
 =?utf-8?B?ZzJSWStqSHkrU2kvZDEvMFBVemthVjluNXV0UEkvZkpHNzVPc2k1Wm5EU3pY?=
 =?utf-8?B?b2wrNzR4eWxIUGFFK3F4U1VMUE5aQW9Lc0RkZlVGTkxjL3o4Zm9uUlVoQ0pr?=
 =?utf-8?B?TDVVM2VFZGJwczFPMnM4U3dTUUNCTTFrMTF0WXFTYU54K3JmKzh6aXNwZ1Nu?=
 =?utf-8?B?QTlERERaU3hZYk1qazg5dGdpd2pGOTB4ZjR6STdIemIzVmhMblM4bHJPMVJX?=
 =?utf-8?B?THZXenY4SGdQQjNoblprSERiWVByWjRHeVRTZ0gwaXErbFI4UVdwZ1Y1UnNn?=
 =?utf-8?B?UmJoQ1RVMFBoRWs2ZmFJOU56WU12S2xJZnNOb2kwNE43enVQdVFxcWE1NCtH?=
 =?utf-8?B?TWg1OHFQODkxLzZOcEZlR3Fqenh0anUrbmVjZk94YmVSSVhjWnpJaGRSaDE1?=
 =?utf-8?B?eDcyVjQ0WGhDVU90NHp4UlIwTUM3Q1pJdDZCYTRTcDFybmEvMG1wdUpaZGdx?=
 =?utf-8?B?SXBtZ2tSekxRdjdpK1FaTUNDS0dEVHJjekhDaWV5dGF0S2p0ejdGYWdHUS9C?=
 =?utf-8?B?ZmxHYlVnTk5IYzljZmVwZmd2d2dYQ0FRNlJIK2VnaWZlSkVnRXEvK2ZYTmJh?=
 =?utf-8?B?UUxlbWkzOTQ4d1huYkg4cWRuMTFjZFpLWERGUVZraW5ENWhjTy9ZdG9yNUJL?=
 =?utf-8?B?ZzBHK3BleEVjU0JhR1dlVTh0VTNBZTBDdTkrdkZtVkl6bzloT2Y4UFE1QTc3?=
 =?utf-8?B?cjlIZmU0cUZCbTVJTjdCTks3RDZsWGdiUFl2OEtjYkhFazZsVWN5dndrQnFL?=
 =?utf-8?B?M0d0K1NGbXk0WC9kZVR2VzFYaW82M0poNHArdmlxYzc2WkJKRlVqenBwRzdX?=
 =?utf-8?B?V1R2SUw2RU9uRjVZZDNXU1RIMEQwU0I5M2NxZzFyRmxOVVQvQTVaUVN5VGla?=
 =?utf-8?B?TDRydWZtTWFrMFc4aUFkeFFNUlhlRnVuOStVcXFsNEVCK0FKZU9XemJPSklO?=
 =?utf-8?B?d2lOSi8xUDlienNvWFFXdFJvcFpzZ1Jyd2ZDQXFiUEN0Nnh5c2ZGWTVEa2J0?=
 =?utf-8?B?S0VZSEVxUm5Qa1JMaW02ZSs2ZlFib1dHYTkvZmw3Wng4UHd4Q3hQMTNQV2Mv?=
 =?utf-8?B?YllranlERTIzM01aNnEwaVFpV0Z6ZTRTcmUwTUE4QTBTdTJZcW5EQ0UycHhM?=
 =?utf-8?B?TEU2YmhaRFY3d2pzTzBPSzdLQlpVNkxaZldxY3ZHVmliV211SU55c21ZSVRs?=
 =?utf-8?B?a1VqZUtCRkhLK1FwWG02M3VZRkY1bGtTSjAwd1Fpdzk4QUtMNE1teG1nMEpQ?=
 =?utf-8?B?dU4yQUpLQVhzVmI4L1oxK1ZhMWx3R09sZHZWQnBHWDhLVkEwWjc4OTVlL1d0?=
 =?utf-8?B?S0UzdnNENmJqVFo4R3p1eE11Y05PVS85MXg0bkVUMHI4bVpGYUJMdWU0Kzd0?=
 =?utf-8?B?MEVHMExhVmZmQmE1aGhZT2VFb3FIaUhuTGNZNmVTVjVDNlJ3MENwc1ovZjVN?=
 =?utf-8?B?WW9WRkRUSjRNN1BhT3JNbXBwRG4zTEpVem90eGU2OTlPWk9UR1ZiT1dOaysz?=
 =?utf-8?B?eTYxckQzUkdJczB3WXlYOTh0bFBDcjhkMlRJZ1RwcjZ3Y2JqUVBIWnNVNHRs?=
 =?utf-8?B?VTBZdU1TNnhnRVVxajRmbVl0eWkzNnJHU3VkckJNeHIxdVdDWXg1WlFuTnBX?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 415677c0-ea51-4c00-6176-08de2cd693bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:28:44.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm1Uam2RHvo8HBpUfx9aWHNvQkzhVbJ2Y36fpKL+t6J3Mtct+K2DRaKmJyQ/IWZx5qTX1FysDFEfTeOk7SjLk7z3usLk6utxv0nc0RUbdpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The previous version of debugfs test contained inconsistent logic.
Lets rewrite the test to use a single array-based list of required files.
Add support for conditional requirements and dynamic index generation
for entries like gt and tile dir.

Also split out a dedicated subtest for validating the contents of the
info debugfs node.

v2:
- a few corrections to the for_each_set_bit macro (Peter)
- s/find_no_tested_files/find_not_tested_files/ (Marcin)
- drop xe_device_put in igt_fixture (Marcin)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_debugfs.c | 385 ++++++++++++++++++++++++++++-----------
 1 file changed, 283 insertions(+), 102 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 1005047132..cf464c5cb2 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -30,75 +30,284 @@ struct {
  *
  */
 
-IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
+IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
+
+#define for_each_set_bit(__i, __mask)		\
+	for (unsigned int __m = (__mask);		\
+	__m && ((__i) = __builtin_ctz(__m), 1);	\
+	__m &= __m - 1)
+
+struct check_entry {
+	const char *name_fmt;
+	int mode;
+	bool (*condition)(struct xe_device *xe_dev);
+	unsigned int (*iter_mask)(struct xe_device *xe_dev);
+};
+
+static unsigned int gt_iter_mask(struct xe_device *xe_dev)
+{
+	return xe_dev->gt_mask;
+}
+
+static unsigned int tile_iter_mask(struct xe_device *xe_dev)
+{
+	return xe_dev->tile_mask;
+}
+
+static bool has_vram(struct xe_device *xe_dev)
+{
+	return xe_dev->has_vram;
+}
+
+/* Validate the format of debugfs fmt file, allow only one %u literal */
+static bool validate_debugfs_fmt(const char *fmt)
+{
+	bool found_u = false;
+
+	for (const char *p = fmt; *p; p++) {
+		if (*p != '%')
+			continue;
+
+		/* % at end of string → invalid */
+		if (!p[1])
+			return false;
+
+		/* must be exactly %u */
+		if (p[1] != 'u')
+			return false;
+
+		/* only one %u allowed */
+		if (found_u)
+			return false;
+
+		found_u = true;
+
+		/* skip u */
+		p++; /* caller loop increments p again */
+	}
+
+	return found_u;
+}
+
+struct hit_entry {
+	struct igt_list_head link;
+	char name[64];
+};
 
-static int xe_validate_entries(igt_dir_t *igt_dir,
-			       const char * const str_val[], int str_cnt)
+static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
 {
 	igt_dir_file_list_t *file_list_entry;
+	bool found_not_tested = false;
+	igt_dir_t *dir = igt_dir_create(dir_fd);
+	int ret;
 
-	if (!igt_dir)
-		return -1;
+	igt_assert_f(dir, "Failed to create igt_dir_t for debugfs dir\n");
 
-	igt_dir_scan_dirfd(igt_dir, -1);
+	ret = igt_dir_scan_dirfd(dir, 0);
+	igt_assert_f(ret == 0, "Failed to scan debugfs directory\n");
 
-	for (int i = 0; i < str_cnt; i++) {
-		int hit = 0;
 
-		igt_list_for_each_entry(file_list_entry,
-					&igt_dir->file_list_head, link) {
-			if (strcmp(file_list_entry->relative_path,
-				   str_val[i]) == 0) {
-				hit = 1;
+	igt_list_for_each_entry(file_list_entry, &dir->file_list_head, link) {
+		struct hit_entry *e;
+		bool hit = false;
+
+		igt_list_for_each_entry(e, hit_entries, link) {
+			if (strcmp(file_list_entry->relative_path, e->name) == 0) {
+				hit = true;
 				break;
 			}
 		}
 
-		if (!hit && opt.warn_on_not_hit)
-			igt_warn("no test for: %s\n", str_val[i]);
+		if (!hit) {
+			igt_warn("No test for: %s\n", file_list_entry->relative_path);
+			found_not_tested = true;
+		}
+	}
+
+	igt_dir_destroy(dir);
+
+	return found_not_tested;
+}
+
+static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
+{
+	int fd = openat(dirfd, file_name, mode);
+
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * Return: negative error code on failure, or number of missing files
+ */
+static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
+				    const struct check_entry *expected_files, size_t size)
+{
+	struct igt_list_head hit_entries;
+	int missing_count = 0;
+	int err = 0;
+
+	IGT_INIT_LIST_HEAD(&hit_entries);
+
+	for (int i = 0; i < size; i++) {
+		const struct check_entry *check = &expected_files[i];
+		unsigned int mask;
+		unsigned int j;
+
+		if (check->condition && !check->condition(xe_dev))
+			continue;
+
+		if (!check->iter_mask)
+			mask = BIT(0); /* to iterate once */
+		else
+			mask = check->iter_mask(xe_dev);
+
+		for_each_set_bit(j, mask) {
+			struct hit_entry *entry;
+
+			entry = malloc(sizeof(*entry));
+			if (!entry) {
+				igt_warn("Failed to allocate memory for hit entry\n");
+				err = -ENOMEM;
+				goto out;
+			}
+
+			igt_list_add(&entry->link, &hit_entries);
+
+			if (!check->iter_mask) {
+				snprintf(entry->name, sizeof(entry->name), "%s", check->name_fmt);
+			} else {
+				int ret;
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+				/**
+				 * XXX: We ignore the compiler warning, but
+				 * validate fmt at runtime.
+				 */
+				if (!validate_debugfs_fmt(check->name_fmt)) {
+					igt_warn("Invalid debugfs name fmt: %s.\n",
+						 check->name_fmt);
+					err = -EBADF;
+					goto out;
+				}
+
+				ret = snprintf(entry->name, sizeof(entry->name),
+					       check->name_fmt, j);
+				if (ret < 0 || ret >= sizeof(entry->name)) {
+					igt_warn("Debugfs format failed for: %s\n",
+						 check->name_fmt);
+					err = -EINVAL;
+					goto out;
+				}
+#pragma GCC diagnostic pop
+			}
+
+			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
+				igt_warn("Missing debugfs file: %s\n", entry->name);
+				missing_count++;
+			}
+		}
+	}
+
+	if (opt.warn_on_not_hit)
+		find_not_tested_files(dir_fd, &hit_entries);
+
+out:
+	if (!igt_list_empty(&hit_entries)) {
+		struct hit_entry *entry, *tmp;
+
+		igt_list_for_each_entry_safe(entry, tmp, &hit_entries, link) {
+			igt_list_del(&entry->link);
+			free(entry);
+		}
 	}
 
-	return 0;
+	return (err < 0) ? err : missing_count;
 }
 
 /**
- * SUBTEST: xe-base
- * Description: Check if various debugfs devnodes exist and test reading them
+ * SUBTEST: root-dir
+ * Description: Check required debugfs devnodes exist in the root debugfs directory
  */
-static void
-xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
+static void test_root_dir(struct xe_device *xe_dev)
 {
-	uint16_t devid = intel_get_drm_devid(fd);
-	static const char * const expected_files[] = {
-		"gt0",
-		"gt1",
-		"stolen_mm",
-		"gtt_mm",
-		"vram0_mm",
-		"forcewake_all",
-		"info",
-		"gem_names",
-		"clients",
-		"name"
+	const struct check_entry expected_files[] = {
+		{ "clients", O_RDONLY },
+		{ "forcewake_all", O_WRONLY },
+		{ "gem_names", O_RDONLY },
+		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
+		{ "gtt_mm", O_RDONLY },
+		{ "info", O_RDONLY },
+		{ "name", O_RDONLY },
+		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
+		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
 	};
-	char reference[4096];
-	int val = 0;
+	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
+	int missing_count;
 
-	igt_assert(config);
-	sprintf(reference, "devid 0x%llx",
-		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	if (debugfs_fd < 0)
+		goto skip;
 
-	sprintf(reference, "revid %lld",
-		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
+						 ARRAY_SIZE(expected_files));
 
-	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
-		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
+	close(debugfs_fd);
 
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
+		      missing_count);
+
+	return;
+skip:
+	igt_skip("Failed to open debugfs directory\n");
+}
+
+/**
+ * SUBTEST: info-read
+ * Description: Check info debugfs devnode contents
+ */
+static void test_info_read(struct xe_device *xe_dev)
+{
+	uint16_t devid = intel_get_drm_devid(xe_dev->fd);
+	struct drm_xe_query_config *config;
+	const char *name = "info";
+	bool failed = false;
+	char buf[4096];
+	int val;
+
+	config = xe_config(xe_dev->fd);
+
+	igt_assert_f(config, "Failed to get xe config\n");
+
+	snprintf(buf, sizeof(buf), "devid 0x%llx",
+		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing devid in info debugfs\n");
+		failed = true;
+	}
+
+	snprintf(buf, sizeof(buf), "revid %lld",
+		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing revid in info debugfs\n");
+		failed = true;
+	}
+
+	snprintf(buf, sizeof(buf),
+		 "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing is_dgfx in info debugfs\n");
+		failed = true;
+	}
 
 	if (intel_gen(devid) < 20) {
+		val = -1;
+
 		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
 		case 48:
 			val = 3;
@@ -106,57 +315,38 @@ xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
 		case 57:
 			val = 4;
 			break;
+		default:
+			igt_warn("Unexpected va_bits value: %lld\n",
+				 config->info[DRM_XE_QUERY_CONFIG_VA_BITS]);
+			failed = true;
+			break;
 		}
 
-		sprintf(reference, "vm_max_level %d", val);
-		igt_assert(igt_debugfs_search(fd, "info", reference));
+		if (val != -1) {
+			snprintf(buf, sizeof(buf), "vm_max_level %d", val);
+			if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+				igt_warn("Missing vm_max_level in info debugfs\n");
+				failed = true;
+			}
+		}
 	}
 
-	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
-	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
-
-	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
-	igt_debugfs_dump(fd, "gtt_mm");
-
-	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
-		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
-		igt_debugfs_dump(fd, "vram0_mm");
+	snprintf(buf, sizeof(buf), "tile_count %d", xe_sysfs_get_num_tiles(xe_dev->fd));
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing tile_count in info debugfs\n");
+		failed = true;
 	}
 
-	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
-		igt_debugfs_dump(fd, "stolen_mm");
-
-	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
-	igt_debugfs_dump(fd, "clients");
-
-	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
-	igt_debugfs_dump(fd, "gem_names");
-
-	xe_validate_entries(igt_dir, expected_files,
-			    ARRAY_SIZE(expected_files));
-}
-
-/**
- * SUBTEST: xe-forcewake
- * Description: Check forcewake debugfs devnode
- */
-static void
-xe_test_forcewake(int fd)
-{
-	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
+	igt_fail_on_f(failed, "Some required info debugfs entries are missing\n");
 
-	igt_assert_neq(handle, -1);
-	close(handle);
 }
 
 const char *help_str =
-	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
+	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
 
 struct option long_options[] = {
-	{ "--warn-not-hit", no_argument, NULL, 'w'},
-	{ 0, 0, 0, 0 }
+	{ "warn-not-hit", no_argument, NULL, 'w'},
+	{ }
 };
 
 static int opt_handler(int option, int option_index, void *input)
@@ -174,34 +364,25 @@ static int opt_handler(int option, int option_index, void *input)
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	int debugfs = -1;
+	struct xe_device *xe_dev;
 	int fd = -1;
-	igt_dir_t *igt_dir = NULL;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_XE);
-		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
-		debugfs = igt_debugfs_dir(fd);
-
-		igt_dir = igt_dir_create(debugfs);
-		igt_require(igt_dir);
-
+		xe_dev = xe_device_get(fd);
+		igt_assert_f(xe_dev, "Failed to get xe device\n");
 		kmstest_set_vt_graphics_mode();
 	}
 
-	igt_describe("Check if various debugfs devnodes exist and test reading them.");
-	igt_subtest("xe-base") {
-		xe_test_base(fd, xe_config(fd), igt_dir);
-	}
-
-	igt_describe("Check forcewake debugfs devnode");
-	igt_subtest("xe-forcewake") {
-		xe_test_forcewake(fd);
-	}
+	igt_describe("Check required debugfs devnodes exist in the root debugfs directory.");
+	igt_subtest("root-dir")
+		test_root_dir(xe_dev);
 
+	igt_describe("Check info debugfs devnode contents.");
+	igt_subtest("info-read")
+		test_info_read(xe_dev);
 	igt_fixture {
-		igt_dir_destroy(igt_dir);
-		close(debugfs);
 		drm_close_driver(fd);
 	}
+
 }
-- 
2.34.1

