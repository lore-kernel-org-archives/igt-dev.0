Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C60CAC5AA
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 07:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5610E865;
	Thu, 25 Sep 2025 07:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHBypzKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D938110E862
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 07:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758784094; x=1790320094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KvpnSOUEfBtVV998zjsIzD/1w+ZIb2dycrfkNfpnhe4=;
 b=RHBypzKT5bqtogDpm9VH5gfEYe3Ymw7Px/ToVLnv2VzLmvH4gHyDLI6q
 qR75Oeniqv6Gs02wWT7Ri5bsBsIlBnPpuSt5lbbxZT4SqlFgakbvyklbh
 dszDLnMOuW62xu3kXkooz8PpYqFAb9MCSt7/NWpCID9I3vR4Y9aEiD/T/
 0dxpO5Ko0jbKQ+pZqyKS7+L4b0iqSPd8EcvzNyHsmXQqsvJDwwXZwVM5S
 JwLo02cReINXVXYn71zYpd718ZwHgw8nr010qtWcd6cedWsptFamd6YqF
 L2pSziiHPkiHAigbsO1POTdIDL2DUH/HZRR6XwQnqeSMFJxDV2sijXzEl A==;
X-CSE-ConnectionGUID: b98Tml5tR8y9mi1SkbVJuQ==
X-CSE-MsgGUID: XarGwjiMTreJE1MaLzJLsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61260783"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61260783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 00:08:12 -0700
X-CSE-ConnectionGUID: nOjH0vWZSna2Cqr/zMibqQ==
X-CSE-MsgGUID: laewIT2wRzuzTUxc/jQoIQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 00:08:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 00:08:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 00:08:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 00:08:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5tKhOJ7acKsioPDo1n2z9tRgW+foTRhOQCTHnd1tIEwfch2WUhIquDZLeDm/KunH3NLIIz/MpWDmNr8KiK5npwT6oGRDz8jxpwlAkInByvaDSZ5VqkWhohkADZsoEFiDhgAYq0XM+26FEuAyRdNLtqmBWP2FW6jjQpCxKxx2irFbXMhRFu/HZWJ6E13v0FDaUg2J4Thd4QH3hrHDx22OCBBvNnr4ysTXUfgBauBMGoSItWNnAA36CDPnA8sJVcQ0NeiXeQ3m85z2x5qsvXGOpopZHGeVds8y2vYsD2n6hGUhz3nTvssUJ9VL5++EFQEwql6kZwpQsKxLqAoG/9JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvpnSOUEfBtVV998zjsIzD/1w+ZIb2dycrfkNfpnhe4=;
 b=j4JO5gNMOItgj5xdsIC/HqATArUNU/38ZP5B8L685td5vyTAwScwAluaYX90b+SvVNy26PPbQo6LScHfqDUUgnOn6EtW+vpK1U/QPrdtYxs/xd3rcrjkLirxgAyUbjMyvcygFooGLaexQktG2peG7gHFTrrR6oCUvwUE/y/x1BXP6P9bkfnDIoPuNco8bxffqZANIR9xPsY+qSTMyq4FqdmnXpW0D5WTcAOenAOFD0Bh9ncFvzwN1aSxGidApn/GTd1MPk4dGw/Nl+1FAN23216UThotrKEmJOhvQjfuqOOeBlmtm+ABIySFCUoxWmlosr65a9lp9eO1yTE425Fz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH8PR11MB8285.namprd11.prod.outlook.com (2603:10b6:510:1c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 07:08:09 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 07:08:08 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>
Subject: RE: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Thread-Topic: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Thread-Index: AQHcLItvYfuCcpqc+EKFz3IHwUZm77SiN42AgAAH1MCAAB3SAIABEvoQ
Date: Thu, 25 Sep 2025 07:08:08 +0000
Message-ID: <DS0PR11MB7264FC3B0F55F38AC648848CD91FA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
 <411a13c9-cb01-4d30-aad7-970497b3e571@intel.com>
 <DS0PR11MB7264F93764F29BBDCCCBA17DD91CA@DS0PR11MB7264.namprd11.prod.outlook.com>
 <49cdd67d-fb90-4cb3-8cf4-c9f39fea5bcb@intel.com>
In-Reply-To: <49cdd67d-fb90-4cb3-8cf4-c9f39fea5bcb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH8PR11MB8285:EE_
x-ms-office365-filtering-correlation-id: 9b7a6f18-f651-46c5-a364-08ddfc02483d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NmhGd0R3a0ZucXFYNFhOQ1JqM2NqajNTMERKVTljSXRrVzUwNGZseGlNUzdT?=
 =?utf-8?B?WXRPSVFYS3ljb0s1SHR5L1JJUTZTNCtGOEcwSm15NmtUU3FtUElwQThnckhu?=
 =?utf-8?B?eEcwUHlGMGx5ODRBRnZYOWR0UWpaaWIxUThtQmtucjFWa2NSZW1FOTh1ek1N?=
 =?utf-8?B?MXN0VWZLRlRBZ0p2N2xFRk9SbngxdFpoNHFXK05UNU81WWNlZ3pBVm43emRL?=
 =?utf-8?B?SGdjcU9TMCtMOUZ6VGd2R0JFa3hwOGtRcTJKVnNKVGh1dFhKREVVYitFVm42?=
 =?utf-8?B?eXFReVlYMGNlSFlodEJUUUNCeUQzRUN4YzgyYjVZUytwL0llakRGY1FyMi9V?=
 =?utf-8?B?SWJ5T3ZFU1VCVDdNVmpyQ0JnelZlcGRRT0ZLa2xHMWZ5WjlSckU2WmJzaWdi?=
 =?utf-8?B?b1lkeXc1SmJTVTR3dVc2eXQ4NjY1MmhWWDcyUTNtdGRMaWQyQ3RRa1duNHVS?=
 =?utf-8?B?YjBjOWJmOG1BdFFZYWx1cHU0ZE1ab1Y0T09jT0lPVkdxV01scml2dytIbzh1?=
 =?utf-8?B?L0RFMXhScWZ6N2hoTmQ4VmJVb1VVTlRnR3hISkFVa3prV3BLRndGTXdyU0Mw?=
 =?utf-8?B?TUE1bk81bzJKayt0NnZncCtGODZkcEh0WXgxTzNlR3duN3V4eXQra1o1dFQy?=
 =?utf-8?B?ZlNqWW1kMHZZUVJYY09ZTGVkTlJ3VVZ1cWRudXRKWGJOaEZXR2l1SUpISDg3?=
 =?utf-8?B?MXFjdHI0cDFiSkNTZFk2VnAvVmJQdnpRbE95SVJSMWNmNWM0aXJiUThWQ29Z?=
 =?utf-8?B?NktwYjI1TWV4WDNvTVFjalNRTWN5dllJaW9JVWQ1MWpKaXg5L29EaWRvV3Bs?=
 =?utf-8?B?cXh2SVJoUk5NaTF1UGk1MlBTMEFodXlzUTVPVTRWNDd0MnZaNEZzN2hkZ1FR?=
 =?utf-8?B?TXloNGMwaU44NWRmS2ZybC82NFZPT2NSWmh5alJGcXVBSkJvUk1hZXJ4Q1I4?=
 =?utf-8?B?OFRIL0VwSWxvRHU5MHAxbVNURmZmeG14QmRBV0w0Q01LRVhQZTJUMEh4b0dz?=
 =?utf-8?B?cmlxNFAvTjNzeEVZbDk3b24wS1RWZG9ydWtiZHl0MzkvbE82YkJqV2xzQ3gz?=
 =?utf-8?B?L0krbmFHdXZYRG1LZ3NvK2N5eUlHYTBjbktOcTFWd0x0aVhzbHg2bnVHbWMy?=
 =?utf-8?B?dmoxbmJzNkgra2cyb2ZIV1FuZVg4UE1zNjlyRXNHVnlkR0NjOHcvQWFFczV4?=
 =?utf-8?B?UHRzWlh4ZmFZNUJROGxoOXNtRUhlSDhoV1RYVE1QY2VsaERSQ05PYnpwRnVX?=
 =?utf-8?B?L3NCTEZIMnpoTDBpaUx4WG1FQUVCdWl2WHV6VjN1ZytBMTR0VEF1clY3NDJk?=
 =?utf-8?B?ME9JVXhFOCsvdVduZHJrR2xRL3NvL3FabUNHbm1Bd3VPek1oUG5qbkdGd3Ez?=
 =?utf-8?B?NGc5Y3krU2xPY1VpcytoaU9pblpMNlg2N0xBVE82UFVPNlNuUi9oU2RYTUd4?=
 =?utf-8?B?S213c0ZNN3c4dlo5SXV1YXRRdnF2clgxTHdWNEcxQi9Fei9PcWlTYm0xUmtV?=
 =?utf-8?B?OXJkVzZLYzJTU3ZBRHd4ZVh0TUxNRW54MjlhV3hKcERNTGVyaE1vd2g4TndX?=
 =?utf-8?B?ek1LeUlBM05uMDZhdUZYRmRTdXFLL3NRQ2creTZzTzBGZk5XeEpBaEpWQ1pa?=
 =?utf-8?B?dTVxNjhucmVvN0d3RHNWSE9sRkZaLzlSYVNBT3FTQnRjWjVKckJ0UDlJZ2No?=
 =?utf-8?B?UHRHN2JZb01LZENJeXFWOGN0YlJNZkVDcml2M2VjbzJJbFhKbGRTSTFJZDNX?=
 =?utf-8?B?RzJKTlRzUkQzWnRaazhPdDRoT3VkR0RuUWZRMGpmSWdZSDQ1Y2k4ZHdsamk0?=
 =?utf-8?B?REs1bk9hcGtYSndnc1U0ZTZUUURULzBGQnZyRWJzRDU2Y1NPR1FGYXBZajZB?=
 =?utf-8?B?RERkRnJIZ3Z2ZUxRbzlqNUtMajNsU0Qza29wbllqdTFKOHV2bVVmb2svYXVW?=
 =?utf-8?B?RS9vMW52dFplVHhVSUdLdGIydzZmZVdmUGR5SWZPRUVneThNU3dRTUxURkV5?=
 =?utf-8?B?dHhkUFdpYmRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHNuVTc3Z0gxVndmcG9VZzFSRWExa1ViUGVBeXowY1cyQmZiL2loR3Q4Tjk0?=
 =?utf-8?B?NlVOVFR2U2xBTDRQcXBQOE5paitOemFGU3htZTlRcEpKMUhzQ3ZDcmZLc0tq?=
 =?utf-8?B?ejlneC93cTVlYzRnUUR3bjVDS1lTdGhzUFN3ck1wUHRtYUJ1d3VaNzJxajJJ?=
 =?utf-8?B?bWFTbjkzSUhyZUh0RllXWUJsR29PalJvUUR1aTFNSlpOSlBRKzJuanRCdTZF?=
 =?utf-8?B?clhEaG1ybTBuR3dlMXpTQ1o4K3ZEWFNlRG9SR2tPVU8vRFloVHJOTnBqd1lS?=
 =?utf-8?B?T3dIQml0aWwxbFVHUHNYSm5QSWV1MkxsZHF5L295R25ZalNhZnpMM3ZNcFAv?=
 =?utf-8?B?bERCM2JydzNYUi9hSnJJT3ZDMGFraWxzTVpoMWJRWm1MUWkrdS9VY3ZWM21X?=
 =?utf-8?B?Q2E1dUU0ZGpRY3c5UHBCdm1UOW5mNjZxOHVmdjV0a2c0Z2Y5SzlUSzgvWEk0?=
 =?utf-8?B?aWNyRDgycEVNOTMwR2NTV2pHeTg3ejh1RWpQei9nTURJOVJSc3ZnTTBZR2xO?=
 =?utf-8?B?TndVL2pJdFVVdkFhZGVqdEtRMVlUcmkyNVRUK0ZaTGJjYmFjNHR2TVZuSHZH?=
 =?utf-8?B?cStOSVl2ZkZsWnNuQkNHTlMrK3dRa0pDd3pCUzNMV3ZvWVRmWXpPbm5oRVFB?=
 =?utf-8?B?OVhLSDJtdERzV1ZHcXZVUTY4emdQMDZpMFZMcUd3MCtUMFQxNGZiYUIwa0Mx?=
 =?utf-8?B?MEU4M21PWkZMb0pRTXljWXpjaGpWMnhOd1g4RXl3d1B5Y2kvY216dzZ6MVJG?=
 =?utf-8?B?V2pJbFpZdGp2cW93aGcxTzYybk91aGNFZ0VhaFlEZ0Nlc01JUk5qVkFxeU5Z?=
 =?utf-8?B?UUM1TmFQbXJXS2xnNFRjV28veDNIUlpkZlNjY3NhTkRvaUFycVJLRWlWajFq?=
 =?utf-8?B?bVh4YVdHZE9veDhJaWRsMG9OYTlqTTgwL0Y3anZSVzZ2VkZRbURESGg3N2Zp?=
 =?utf-8?B?Z3k4L0tCRkh6dGJWelI0REtDdkw3RWladG9nMTVKWGk2ZDlQZFNpVVozd2FE?=
 =?utf-8?B?QS9ZTkFzUTh3N0R2Z3pSQzlETEk2MEJ2Yk54RXBxTVNOTCtndSthR2J2bTZm?=
 =?utf-8?B?WmRrMGVsRHlrbVBXWXNsdVpmTUpZdnhkUmxvd3U0cCtlVzcybmtBUnNxeHdq?=
 =?utf-8?B?YWFQK20xam9VRVhnL3R6NXM3MFBRRmdWOVpBYWhsdVpUUEU4UWNudzRxSW51?=
 =?utf-8?B?OXRsT2IweW9HSk5ESFQ2bmM0VFhPU0R6ZEs2azg3dk9sV25EZG1yTENRUnNJ?=
 =?utf-8?B?VDd3bjdrQ2JSMk4wUjVrS1ZaYlhwN1pTUVg1clU2V1RXeTJvSDZxdTNxVmhG?=
 =?utf-8?B?bjBSMWNUeUdqUmw0MGZ4ZkdENnA1ZXZ3RkVycVZONEpQaDY0bkF3OSsvVDBV?=
 =?utf-8?B?bWJjN1h4K05seU1TSWNSQ2FpM3RUNFhxUmRhRW5JcWtjMDBJL0NzL2M5anFu?=
 =?utf-8?B?dmR2dlpKNU9lNkRZb2VlQ1htWndwbUlUckJiSzJ1amRPSzRjNFFSYVB4bTY1?=
 =?utf-8?B?R0FiQ2JaV3E1S25FaFM5djdsZ1RlenI1VFM0V01uTGxwVVNiajlkRnA1d1hz?=
 =?utf-8?B?WWZFRDdjUzNFZm1CMUo3Z3BiNFdOczM2aXhkUWhJenJkdGlydzF1bmRRSFZn?=
 =?utf-8?B?aXgwTC9DWSsrRTJGT0RxaVpmcW5xQ01GTmhFanQrSk5BTitNdExBRitCbnkv?=
 =?utf-8?B?ZHJ5YjRVOHA5bTc5dlRXM0JaaFhRM0phWHg2MEZSUytIaVphTDR5dmd1RUUr?=
 =?utf-8?B?T1RxL20ydnEwSUFtdS9SUlhyYjZNTU9aMndjQnlRWnVGZHF2MTNMT1FOOW9h?=
 =?utf-8?B?a2ZwRklETnJmWEl1b0lrOXVTTThMS2wrbWxwdndEUWkrL1RpSlphMWdCTVlU?=
 =?utf-8?B?c2dGcS9hRUI1QVFRSGZaMnluTk44SFJoQTFWN1R6RnYwSFJGMjNqYkZjZlV6?=
 =?utf-8?B?MVFBekdtWG84YWUyNDNsS21OdXhacGpGZnBQdVBIa2pjTHMreHE3K2ZWbmZq?=
 =?utf-8?B?cGlnZG9QR05vS0Z0dGZwTnQ0Q01vRHdKVjY4QXhPSDh0U0Vwb3JjZ3krMldY?=
 =?utf-8?B?bVlvZTNFOW9NaHlQWk9ZckNaWCtCTHEwZnpJRk5xUERaREVTMXdCUFN3ZUZK?=
 =?utf-8?B?MlRFWXBHUGxvM3N6M2JWWmRoZ25zWFF1YURCY2doNHduLzlnRm9WaTkxMjR1?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7a6f18-f651-46c5-a364-08ddfc02483d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 07:08:08.8378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vg8XDCuwM2Ev1HVDgL+3lv0iZqby4y/drm9V0OHiwgFmlJMIyw9tqf6mI0w7lPSCUp3Z1Ei3dQ+wtNKwP/xHkx2vnm8nRyiMGHVoHqaCvAWsCJggKYYkzKJSs3oeAZJY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8285
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

SGkgQ2hyaXN0b3BoLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1h
bnN6ZXdza2ksIENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBT
ZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNCwgMjAyNSAzOjU3IFBNDQo+IFRvOiBQaWF0a293
c2tpLCBEb21pbmlrIEthcm9sIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsg
aWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLZW1wY3p5bnNraSwgWmJp
Z25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IE1pa2ENCj4gS3VvcHBhbGEg
PG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IGktZy10IDQvNl0gbGliL3hlX2V1ZGVidWc6IEltcHJvdmUgU0lHSU5UIGhhbmRsaW5nDQo+IA0K
PiBIaSBEb21pbmlrLA0KPiANCj4gT24gMjQuMDkuMjAyNSAxNDozOCwgUGlhdGtvd3NraSwgRG9t
aW5payBLYXJvbCB3cm90ZToNCj4gPiBIaSBDaHJpc3RvcGgsDQo+ID4NCj4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJp
c3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVt
YmVyIDI0LCAyMDI1IDE6NDMgUE0NCj4gPj4gVG86IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wg
PGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBpZ3QtDQo+ID4+IGRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgTWlrYQ0KPiA+PiBLdW9wcGFsYSA8bWlrYS5rdW9w
cGFsYUBsaW51eC5pbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgaS1nLXQg
NC82XSBsaWIveGVfZXVkZWJ1ZzogSW1wcm92ZSBTSUdJTlQgaGFuZGxpbmcNCj4gPj4NCj4gPj4g
SGkgRG9taW5paywNCj4gPj4NCj4gPj4gT24gMjMuMDkuMjAyNSAxNToxMCwgRG9taW5payBLYXJv
bCBQacSFdGtvd3NraSB3cm90ZToNCj4gPj4+IFJld3JpdGUgU0lHSU5UIHNpZ25hbCBoYW5kbGVy
IHRvIHRvZ2dsZSBhIHZhcmlhYmxlIGluc3RlYWQgb2YgY2FsbGluZw0KPiA+Pj4gcHRocmVhZF9l
eGl0IGluc3RhbnRseSwgYXMgdGhlIHRocmVhZCBjb3VsZCBiZSBpbiBjcml0aWNhbCBzZWN0aW9u
LA0KPiA+Pj4gY2F1c2luZyBhIGRlYWRsb2NrIG9uIHRoZSBhdHRlbXB0IG9mIG5leHQgZW50cnkg
aW50byB0aGF0IGNyaXRpY2FsDQo+ID4+PiBzZWN0aW9uLg0KPiA+Pj4NCj4gPj4+IEludHJvZHVj
ZSByZWNlaXZlZF9zaWduYWwsIHJlY2VpdmVkX3NpZ2ludCBhbmQgaGFuZGxlZF9zaWdpbnQgdmFy
aWFibGVzDQo+ID4+PiB0byBoZWxwIHdpdGggY29vcmRpbmF0aW9uIG9mIGhhbmRsaW5nIFNJR0lO
VCBhbmQgb3RoZXIgc2lnbmFscy4NCj4gPj4+DQo+ID4+PiBVc2UgdGhlIHJlY2VpdmVkX3NpZ2lu
dCB2YXJpYWJsZSBpbiBkZWJ1Z2dlcl93b3JrZXJfbG9vcCB0byBzYWZlbHkga2lsbA0KPiA+Pj4g
dGhlIHRocmVhZCwgc2V0IGhhbmRsZWRfc2lnaW50IHRvIGhlbHAgd2l0aCBjb29yZGluYXRpb24g
b3V0c2lkZSB0aGUNCj4gPj4+IGRlYnVnZ2VyIGxvb3AuDQo+ID4+Pg0KPiA+Pj4gUmVuYW1lIHRl
cm1pbmF0ZV9kZWJ1Z2dlciB0byBkZWJ1Z2dlcl9zaWduYWxfaGFuZGxlciB0byBkZXNjcmliZSBp
dHMNCj4gPj4+IG5ldyBmdW5jdGlvbiBiZXR0ZXIuIEFkZCBTSUdURVJNIHRvIHNpZ25hbHMgdGhh
dCBhcmUgaGFuZGxlZCBieQ0KPiA+Pj4gZGVidWdnZXJfc2lnbmFsX2hhbmRsZXIuDQo+ID4+Pg0K
PiA+Pj4gRG9uJ3Qga2lsbCBkZWJ1Z2dlciB0aHJlYWQgb24gbm9uLVNJR0lOVCBzaWduYWxzLiBE
b24ndCBicmVhayBvbiBwb2xsDQo+ID4+PiBmYWlsdXJlIGlmIHNpZ25hbCB3YXMgcmVjZWl2ZWQu
DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraQ0K
PiA+PiA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gPj4+IC0tLQ0KPiA+
Pj4gICAgbGliL3hlL3hlX2V1ZGVidWcuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKystLS0t
DQo+ID4+PiAgICBsaWIveGUveGVfZXVkZWJ1Zy5oIHwgIDQgKysrKw0KPiA+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+
IGRpZmYgLS1naXQgYS9saWIveGUveGVfZXVkZWJ1Zy5jIGIvbGliL3hlL3hlX2V1ZGVidWcuYw0K
PiA+Pj4gaW5kZXggZGVhZWEyNWNkLi42NDdkYTdiMzIgMTAwNjQ0DQo+ID4+PiAtLS0gYS9saWIv
eGUveGVfZXVkZWJ1Zy5jDQo+ID4+PiArKysgYi9saWIveGUveGVfZXVkZWJ1Zy5jDQo+ID4+PiBA
QCAtMTA3Miw5ICsxMDcyLDE0IEBAIHhlX2V1ZGVidWdfcmVhZF9ldmVudChpbnQgZmQsIHN0cnVj
dA0KPiA+PiBkcm1feGVfZXVkZWJ1Z19ldmVudCAqZXZlbnQpDQo+ID4+PiAgICAJcmV0dXJuIHJl
dDsNCj4gPj4+ICAgIH0NCj4gPj4+DQo+ID4+PiAtc3RhdGljIHZvaWQgdGVybWluYXRlX2RlYnVn
Z2VyKGludCBzaWcpDQo+ID4+PiArc3RhdGljIHZvaWQgZGVidWdnZXJfc2lnbmFsX2hhbmRsZXIo
aW50IHNpZywgc2lnaW5mb190ICppbmZvLCB2b2lkDQo+ICpjb250ZXh0KQ0KPiA+Pj4gICAgew0K
PiA+Pj4gLQlwdGhyZWFkX2V4aXQoTlVMTCk7DQo+ID4+PiArCXN0cnVjdCB4ZV9ldWRlYnVnX2Rl
YnVnZ2VyICpkID0gaW5mby0+c2lfcHRyOw0KPiA+Pj4gKw0KPiA+Pj4gKwlkLT5yZWNlaXZlZF9z
aWduYWwgPSB0cnVlOw0KPiA+Pg0KPiA+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB3aXRo
b3V0IHRoZSB0d28gY29tbWl0cyB0aGF0IGZvbGxvdywgdGhpcyBpcw0KPiA+PiBhIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZS4gQnV0IGV2ZW4gYWZ0ZXIgY29tYmluaW5nIHRob3NlIGNvbW1pdHMs
DQo+ID4+IHdvbid0IHRoaXMgY2F1c2UgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaWYgYSBJ
R1QgdXNlciBwcmVzc2VzICdDVFJMLUMnPw0KPiA+DQo+ID4gVHJ1ZSwgd2l0aG91dCB0aGVzZSBj
b21taXRzIGl0IGlzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLg0KPiANCj4gV2hpbGUgaXQg
aXMgbm90IGEgY3JpdGljYWwgaXNzdWUsIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gbm90IGhhdmUN
Cj4gY29tbWl0cyB0aGF0IGFyZSBidWdneSB0aGUgc2FtZSB3YXkgYXMgd2Ugd2FudCB0byBoYXZl
IGNvbW1pdHMgdGhhdA0KPiBjb21waWxlIHdpdGhvdXQgY29tbWl0cyB0aGF0IGZvbGxvdy4gSXQn
cyBvbmUgdGhpbmcgdG8gaGF2ZSBzb21lIHRlc3RzDQo+IHRoYXQgbm8gbG9uZ2VyIHBhc3MgYWZ0
ZXIgYSBjb21taXQgYW5kIGFub3RoZXIgdG8gaGF2ZSB1bmRlZmluZWQNCj4gYmVoYXZpb3Igb3Ig
bm9uLWNvbXBpbGluZyBjb2RlLg0KDQpJIGFncmVlIHRoYXQgd2Ugc2hvdWxkIG5vdCBoYXZlIGJ1
Z2d5IGNvbW1pdHMsIGJ1dCB0aGlzIGlzIGp1c3QgYSBkZXBlbmRlbmN5DQppc3N1ZS4gUmVvcmRl
cmluZyBwYXRjaGVzIHRvIDEtMi0zLTUtNi00IHNob3VsZCBmaXggdGhhdCwgYW5kIHRoZW4gYWRk
aW5nDQpTSUdURVJNIG5lZWRzIHRvIGJlIGV4dHJhY3RlZCBmcm9tIDQgYW5kIDYgdG8gYXZvaWQg
c2ltaWxhciBpc3N1ZXMuDQoNCj4gDQo+IA0KPiA+DQo+ID4gUmVnYXJkaW5nIHRoZSBjdHJsLUMg
cHJlc3NlZCBieSBJR1QgdXNlciAtIEkganVzdCBjaGVja2VkIGFuZCBpbmRlZWQgaXQgd2lsbA0K
PiA+IGNhdXNlIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLiBJIGNhbiBhZGQgdGhlIGNoZWNr
IGZvciB0aGF0LCBidXQgdGhlDQo+ID4gcXVlc3Rpb24gaXMgaWYgdGhpcyBpcyBhIHNjZW5hcmlv
IHdlIG5lZWQgdG8gZGVmZW5kIGZyb20uIElmIHllcyAtIEknbGwNCj4gPiBoYXBwaWx5IGFkZCBz
dWNoIGNoZWNrLg0KPiANCj4gSSB0aGluayBpdCdzIGdvb2QgcHJhY3RpY2UgdG8gaGF2ZSBwcm9n
cmFtcyB0aGF0IGV4aXQgY2xlYW5seS4gSW1hZ2luZQ0KPiBkb2luZyBzb21lIGRlYnVnZ2luZy9y
ZXBybyB3aXRoIGEgdGVzdCB0aGF0IGhhbmdzIGZvciB3aGF0ZXZlciByZWFzb24NCj4gYW5kIHNl
ZWluZyBhIFNJR1NFR1YgYWZ0ZXIgY3RybC1jLiBUaGUgc3VzcGljaW9uIHdvdWxkIGdvIHRvd2Fy
ZHMgc29tZQ0KPiBpbnZhbGlkIG1lbW9yeSBoYW5kbGluZyBqdXN0IHRvIGZpbmQgdGhhdCB0aGlz
IGlzIGFuIHVucmVsYXRlZCBpc3N1ZS4NCg0KUmlnaHQsIEknbGwgYWRkIGEgY2hlY2sgZm9yIHRo
YXQuIFRoYW5rcyBmb3IgeW91ciBpbnB1dCENCg0KSSdsbCBzZW5kIHY2IHRvZGF5Lg0KDQpUaGFu
a3MsDQpEb21pbmlrIEthcm9sDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdG9waA0KPiA+DQo+
ID4+PiArDQo+ID4+PiArCWlmIChzaWcgPT0gU0lHSU5UKQ0KPiA+Pj4gKwkJZC0+cmVjZWl2ZWRf
c2lnaW50ID0gdHJ1ZTsNCj4gPj4+ICAgIH0NCj4gPj4+DQo+ID4+PiAgICBzdGF0aWMgdm9pZCAq
ZGVidWdnZXJfd29ya2VyX2xvb3Aodm9pZCAqZGF0YSkNCj4gPj4+IEBAIC0xMDkyLDE0ICsxMDk3
LDI0IEBAIHN0YXRpYyB2b2lkICpkZWJ1Z2dlcl93b3JrZXJfbG9vcCh2b2lkDQo+ID4+ICpkYXRh
KQ0KPiA+Pj4gICAgCWlndF9hc3NlcnQoZC0+bWFzdGVyX2ZkID49IDApOw0KPiA+Pj4NCj4gPj4+
ICAgIAlpZ3RfYXNzZXJ0X2VxKHNpZ2FjdGlvbihTSUdJTlQsIE5VTEwsICZzYSksIDApOw0KPiA+
Pj4gLQlzYS5zYV9oYW5kbGVyID0gdGVybWluYXRlX2RlYnVnZ2VyOw0KPiA+Pj4gKwlzYS5zYV9z
aWdhY3Rpb24gPSBkZWJ1Z2dlcl9zaWduYWxfaGFuZGxlcjsNCj4gPj4+ICsJc2Euc2FfZmxhZ3Mg
fD0gU0FfU0lHSU5GTzsNCj4gPj4+ICAgIAlpZ3RfYXNzZXJ0X2VxKHNpZ2FjdGlvbihTSUdJTlQs
ICZzYSwgTlVMTCksIDApOw0KPiA+Pj4NCj4gPj4+ICsJaWd0X2Fzc2VydF9lcShzaWdhY3Rpb24o
U0lHVEVSTSwgTlVMTCwgJnNhKSwgMCk7DQo+ID4+PiArCXNhLnNhX3NpZ2FjdGlvbiA9IGRlYnVn
Z2VyX3NpZ25hbF9oYW5kbGVyOw0KPiA+Pj4gKwlzYS5zYV9mbGFncyB8PSBTQV9TSUdJTkZPOw0K
PiA+Pj4gKwlpZ3RfYXNzZXJ0X2VxKHNpZ2FjdGlvbihTSUdURVJNLCAmc2EsIE5VTEwpLCAwKTsN
Cj4gPj4+ICsNCj4gPj4+ICAgIAlkbyB7DQo+ID4+PiAgICAJCXAuZmQgPSBkLT5mZDsNCj4gPj4+
ICAgIAkJcmV0ID0gcG9sbCgmcCwgMSwgdGltZW91dF9tcyk7DQo+ID4+PiArCQlpZiAoZC0+cmVj
ZWl2ZWRfc2lnaW50KSB7DQo+ID4+PiArCQkJZC0+aGFuZGxlZF9zaWdpbnQgPSB0cnVlOw0KPiA+
Pj4gKwkJCXB0aHJlYWRfZXhpdChOVUxMKTsNCj4gPj4+ICsJCX0NCj4gPj4+DQo+ID4+PiAtCQlp
ZiAocmV0ID09IC0xKSB7DQo+ID4+PiArCQlpZiAoIWQtPnJlY2VpdmVkX3NpZ25hbCAmJiByZXQg
PT0gLTEpIHsNCj4gPj4NCj4gPj4gSSBhbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB0aGUg
U0lHVEVSTSBoYW5kbGluZyBpcyBzdXBwb3NlZCB0bw0KPiA+PiBpbmZsdWVuY2UgaGVyZT8gRnJv
bSBwYXRjaCA2LzYgSSBnYXRoZXIgdGhhdCBpdCBpcyBzdXBwb3NlZCB0byBtYXhpbWl6ZQ0KPiA+
PiB0aGUgY2hhbmNlIG9mIGhpdHRpbmcgdGhlIHJlYWQgSU9DVEwgYnV0IEkgZG9uJ3Qgc2VlIGhv
dy4NCj4gPg0KPiA+IFRoZSBTSUdURVJNIGhhbmRsaW5nIGhlcmUgaXMgc3RvcHBpbmcgdGhlIGxv
b3AgZnJvbSBicmVha2luZyBhbmQgYmVpbmcNCj4gdW5hYmxlDQo+ID4gdG8gcmVhY2ggYGlmIChk
LT5yZWNlaXZlZF9zaWdpbnQpYC4gSSdsbCBzaG9ydGx5IHNlbmQgYSB2NSB0aGF0IGhhcyB0aGlz
IHBhcnQNCj4gPiBhIGJpdCBpbXByb3ZlZCBmcm9tIFpiaWduaWV3J3Mgc3VnZ2VzdGlvbnMuDQo+
ID4NCj4gPiBUaGFua3MsDQo+ID4gRG9taW5payBLYXJvbA0KPiA+DQo+ID4+DQo+ID4+IFJlZ2Fy
ZHMsDQo+ID4+IENocmlzdG9waA0KPiA+Pg0KPiA+Pg0KPiA+Pj4gICAgCQkJaWd0X2luZm8oInBv
bGwgZmFpbGVkIHdpdGggZXJybm8gJWRcbiIsIGVycm5vKTsNCj4gPj4+ICAgIAkJCWJyZWFrOw0K
PiA+Pj4gICAgCQl9DQo+ID4+PiBAQCAtMTE2OCw2ICsxMTgzLDkgQEAgeGVfZXVkZWJ1Z19kZWJ1
Z2dlcl9jcmVhdGUoaW50IG1hc3Rlcl9mZCwNCj4gPj4gdWludDY0X3QgZmxhZ3MsIHZvaWQgKmRh
dGEpDQo+ID4+PiAgICAJZC0+ZmQgPSAtMTsNCj4gPj4+ICAgIAlkLT5tYXN0ZXJfZmQgPSBtYXN0
ZXJfZmQ7DQo+ID4+PiAgICAJZC0+cHRyID0gZGF0YTsNCj4gPj4+ICsJZC0+cmVjZWl2ZWRfc2ln
bmFsID0gZmFsc2U7DQo+ID4+PiArCWQtPnJlY2VpdmVkX3NpZ2ludCA9IGZhbHNlOw0KPiA+Pj4g
KwlkLT5oYW5kbGVkX3NpZ2ludCA9IGZhbHNlOw0KPiA+Pj4NCj4gPj4+ICAgIAlyZXR1cm4gZDsN
Cj4gPj4+ICAgIH0NCj4gPj4+IGRpZmYgLS1naXQgYS9saWIveGUveGVfZXVkZWJ1Zy5oIGIvbGli
L3hlL3hlX2V1ZGVidWcuaA0KPiA+Pj4gaW5kZXggOGY3ZjY2MjIwLi40NmNkMzQ2M2UgMTAwNjQ0
DQo+ID4+PiAtLS0gYS9saWIveGUveGVfZXVkZWJ1Zy5oDQo+ID4+PiArKysgYi9saWIveGUveGVf
ZXVkZWJ1Zy5oDQo+ID4+PiBAQCAtNDQsNiArNDQsMTAgQEAgc3RydWN0IHhlX2V1ZGVidWdfZGVi
dWdnZXIgew0KPiA+Pj4gICAgCXB0aHJlYWRfdCB3b3JrZXJfdGhyZWFkOw0KPiA+Pj4gICAgCWVu
dW0geGVfZXVkZWJ1Z19kZWJ1Z2dlcl93b3JrZXJfc3RhdGUgd29ya2VyX3N0YXRlOw0KPiA+Pj4N
Cj4gPj4+ICsJYm9vbCByZWNlaXZlZF9zaWduYWw7DQo+ID4+PiArCWJvb2wgcmVjZWl2ZWRfc2ln
aW50Ow0KPiA+Pj4gKwlib29sIGhhbmRsZWRfc2lnaW50Ow0KPiA+Pj4gKw0KPiA+Pj4gICAgCWlu
dCBwX2NsaWVudFsyXTsNCj4gPj4+ICAgIH07DQo+ID4+Pg0KPiA+DQoNCg==
