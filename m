Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FA0C02180
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 13:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278BD10E67D;
	Mon, 13 Jan 2025 13:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWFPJe4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0C510E043
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736774030; x=1768310030;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1wVtJUg0mJA/1WH+K+pCcMTN6XM/fgPmGED8ZwqD2Jk=;
 b=jWFPJe4w3O/aCA37PPGBDnCwZ5086FzLZpJf/E17/raFAvLjjgWMxYGR
 jn92l5EyyHF9MdSB250jEPFzbulObid+7a/1hlXVJ6iV60YXMHcZlQEv7
 5FlRaHBnrR6dm3lHzQdRF+9BrMHrm0aSJqaS5bFIimd+fgNbLgu5KFnCB
 KDoI40Z9sGksAI3BMlAUECP5NAMksskKrF5AWrDJewDXc3jdb6oHbYBf8
 NQWFadmhT2z1EF+6a+UY7dLLobA2uhhtcsmb3zrYUPOO/kA7f6x2u0pJs
 QAhtTPtCj+DVsnATAWte3FE4vAPR+jf3dkF0o2tIWuJmA8e5taYnbtUmW w==;
X-CSE-ConnectionGUID: bKkkl2q2RmyCyOHeDuzXjg==
X-CSE-MsgGUID: MqitKU6eTmOSeOwoNxVjpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54580832"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="54580832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:13:49 -0800
X-CSE-ConnectionGUID: uLmz21rZQFS9YMbjBsHkhg==
X-CSE-MsgGUID: +M4j47N5QdKG+9r5zvlhcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109617800"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 05:13:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 05:13:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 05:13:49 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 05:13:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLhMxdDs1wOgL5oQBejH/PMeAbizSg/UpE6pjRBBW0dmPRlzNN0csKb1bwG1r5vlaieu2HRaqBjp6xQJMNFcLuiNcy00T5dw6PRZNpMc6CoMiCCO7x9EY/GtGvBiIiMkGCVe9a8d8aB78Q7SWld0wXM0ZoKk1Od6pqVHh4DuumLvKVv+W8Hh86TGHAvbPSDIzTFs/4OaNz8Mv1ZdVZxUqxm0Qw3MS37mrtey7CniL7RzhGk3YCx5YDXiDQCUdyHcm2y2sC+je6ZEYLFE/XOSajc9OW4dKux3B5mCW9pFR0eFsg5u9WVXj+vZJBf+LPTmCY3E9S7+Z6hX4nlggYtCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wVtJUg0mJA/1WH+K+pCcMTN6XM/fgPmGED8ZwqD2Jk=;
 b=eBbEcgp8Jx40Vpw7w6C6WQ1e3iTgG7AeB3arxt+7bVTWJlCPuSn138xjt6aUX1dcQrTksmubM++LAsOGCJ3pgQDVNwnc/ttx6uhGwXSfemj1HTtQlzdotxwUjY7NC/Ae4nasKoyaYAsmwe9PZWmxSegoE2CLFq1J3YaHNUwFsb57AspVhJcs/ye7XunAOPCn7joeZrI11sQb6Oq9IK8/6Kt65RB8tpEaTYAGsV5yeD36IRMWPuLMis4cLKYuFpoeKzTBe6Nuy4ZzTkCPUj1GrDA0HRb/fXb/aMMes2eScO3EgB2ShAmDsEOzsmchiyqQkhMqMsDsjk5tTWaEiyomlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 13:13:46 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 13:13:46 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] tests/intel: Enhance the wedged_mode sysfs support
Thread-Topic: [PATCH v2] tests/intel: Enhance the wedged_mode sysfs support
Thread-Index: AQHbYZb3OmxnErtKFUy9RPqGv33rhLMP462AgATQ6IA=
Date: Mon, 13 Jan 2025 13:13:46 +0000
Message-ID: <BL1PR11MB5525D0FEF2807D23BB5052E8841F2@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250108062826.908027-1-pravalika.gurram@intel.com>
 <20250110113311.jyeuekjsaqd4m7sr@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250110113311.jyeuekjsaqd4m7sr@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MW5PR11MB5763:EE_
x-ms-office365-filtering-correlation-id: 847cb40c-35f8-4bde-5ad4-08dd33d41ca3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zk5UT0FmaVVrbVFER1c2NjFGNzZ0V08vcXMyZHZ1b09vU0NLUzhYTVV4VGdy?=
 =?utf-8?B?SC9tUDZnY00xWHg4d0pGRW1BTERTZjNCM3QrekJuK2xXempUMkZJY2lxS3Y4?=
 =?utf-8?B?NnpDdGNiSllPekYvdWVScmJWYkdVVFVzamdlTTU1N1VPaDl0VWthc2NpZkQ1?=
 =?utf-8?B?bmpySVc2My82ZW9UU3QrakUyRlRmbzViQXdici9vMmtEcm9kQkFpdVpCbGdo?=
 =?utf-8?B?MEMzajBmenpVMHFzVnl0SVR6NnJXMkxzalpmNTBycUwrV29pNU5Fa2YzaVFv?=
 =?utf-8?B?NEJZeENVRmNZR1pRSGdKWU9NQk5CNTkrb1JjREhScElxRFM2bXo0VENkQk00?=
 =?utf-8?B?TDFaUFZ2RUZBZkJzR2pqZ3oramFXUTJRcUtVMGRkZVN4STZoeXlnVE1nblpa?=
 =?utf-8?B?cWFvVXFsYWVZT2g3Qk9KbnZ4SThpb0xzNVNIMXpaNHcxUjcxMkNlT0c2Uk05?=
 =?utf-8?B?S3R0M2VLSUFkSkFEOTluWEV6N3FHSzJ3ekt0QmRFY0VlUUplTlU3N01pZEdi?=
 =?utf-8?B?cUROOSt2ZGEzaFErbHBUcUxqNjF3aURmUFpNQ0VaWlhkN0lQTGpjK0Ftckpl?=
 =?utf-8?B?RzBkL09NU1hMSThzZVJpVXdBOWt6VE1DN2c0SkpWWDE3SWpLVVhOelJTcXBD?=
 =?utf-8?B?VzRMWVN5Z2RqeENkSktKUEIxZmt2ZWVOMXptWU0wYnRJUUQvOUJVZkdXUXkz?=
 =?utf-8?B?ZmdNdTBZNDVDV24yaHNlUFE4ZDVvcUVrbTBKdUxrNWRtQlNuNE82UG94eUVa?=
 =?utf-8?B?LzFRRUVhczhmSjRpZHVDVFZ4WGVxdGp1R1VWZ21RM0RQc3YrdFU5eVArV2RM?=
 =?utf-8?B?VVpnaW01KzVTbG9NZHd6SjBTWTdqaDBYdS8wOVJhWGtyajJqcGJ5bzV3NEVo?=
 =?utf-8?B?TmxqR0pvaFRCVTJYalVhSDYzNy9rd2ZQSHpNdmg1dFNkc3FOZjBVUnkxZ3ha?=
 =?utf-8?B?Q1hWRHIyT2NMenRDQjNwN0ZNVHlyRGJ2dmp2Z3R2b2dRM2t0YzlMa0t4ZUsr?=
 =?utf-8?B?UzR6cEZUa1NYNEpxNDJzOXFEelphb1RXcGpKUGRaSmdDNnRLKzRNa3lvWUg5?=
 =?utf-8?B?K0tlb0lxbms3NUZXbjhMUS9EWVIrVmdCeVgva0tjL2N5L25EUkR0N21TdUZt?=
 =?utf-8?B?cThIdWQ5LzlCUDZVV1dvSDY0WXhMbkUvWlBuVCtqSnk2ZW5zVXJRWWFvMGUx?=
 =?utf-8?B?ZWUxeTVtaks0TGRlc1p2MFVRZDhlSlBTKzVTaGFZdHRzMkZ2NVpFeHVEemZt?=
 =?utf-8?B?U25qaFNqRzI5SEp3YXlibm5SeHdqbFNnTFF3OVVBSTVaZHNHMG9QQm1WSkxR?=
 =?utf-8?B?amhQZk9CTVFRRmJ4YzQ2b01uZXN1KzZhdGh4c2ZiZzVDSTZGeUd2eThwTE9h?=
 =?utf-8?B?dGxSK0tCMnlrbUJtMEsxRHpEMFh0TUFnMUlOZEx3dVpXNVQweElCa2FPYVJ5?=
 =?utf-8?B?NlVGdkxhbjBxeGQ4L3hzU3daVDlMNC9PL1dPSEx2ZlZBcGNzUkFMRFRXSXp4?=
 =?utf-8?B?NVJCd1dydk1KUjIxV3dTTk94MENja2EvYVNJc1hhT2xBWGlXeG1EbDlJRUsv?=
 =?utf-8?B?cFhXUzQvOEFINWJWRTRzZFhvcFZiTHR4WVZPVjRjYmdlYkxQYmtSN0JDWnls?=
 =?utf-8?B?T0lXcTlHS2NuaHhzQmZndHFHTnM0VFNGQzdOTFpwZldtdzVob2FWSjNjWkZC?=
 =?utf-8?B?NXpNb3c3a0kyNlhwdkRXMCtwMDB1cHBQYjl0cmlQQzIxYkFMWGVjSmgrbUky?=
 =?utf-8?B?SVVTWHBSWTFrMzZtaTlQemgwR2xnSHByMWcvT01uU3huNUFkbEI5MStNdWhj?=
 =?utf-8?B?RnZyRmRmNy9TM2pwS1FmRnFvSmtXSXR5Zit2eDN1d0VxenhmMTR0bVpraHZn?=
 =?utf-8?B?TnptK1ZRcU5QeDdNdFdlUlBERlAxY3Aydk9EbVROeklBc3F1RzZmazUzdUtX?=
 =?utf-8?Q?z5hdxI9X0HVvPNx7QtwxZKTVwyRuhCef?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjFKMVhLZHpQMUJ0TlNKNEVDYU03aUFwQmxPUWdienFSekE1NjlDaUIzUG4x?=
 =?utf-8?B?L1QyNktBWmdjTWlmM0U3V0wwVEYrYmJ2VHR6TnFFTkRsQzZaVjgzM1czRk9F?=
 =?utf-8?B?bktDY3JWb2Q0V0Zqa2V0eThMQVlKdVRZTG9IeDlCeHFZV3F1WkxheHhCTktp?=
 =?utf-8?B?NVpPU2xXVUVwK201MHRnQ1VlU1JBVER6QnF3UTQxWmozVytOU2JEb2toeThY?=
 =?utf-8?B?UGpCdWZpeFluYlY1V1IvYjRXbzExaC9UKzl6L2tra1pJT3FVZGpUdUlnd1dp?=
 =?utf-8?B?aEd4OUVuVzRNNVNNcTFJT2RBbWc0VlYxalRJYkNudXdTNXJDY1J2NTg4aEZk?=
 =?utf-8?B?blhPU3dqVmxnKzRjbnJ0Z1BxUktnOTg4VG9GRm8yQ0dqOFl2VFk4YVJLd09I?=
 =?utf-8?B?b3dENnlrdWNUM3NVdXRVSFkwZDBldzN3Q3VoV09uTmZtMm1UUEt5N0l2ckJa?=
 =?utf-8?B?WDNmSkxrUXZsVnp2NlpzQzVDNUJRVnRZbm1NeTRlaTlLMitFeStCN3dybGZ4?=
 =?utf-8?B?VjBydTl6QklpOCtoK2p3YnR5aWtiVExuUGlmcFBOa1FsS2ZsT3Q2Z3ltWXJQ?=
 =?utf-8?B?cXN3VThrNWN5czJ2WWNoMUQzeWVFazFMVXE5UG5xd3o4U011UUVUSE9OTE1P?=
 =?utf-8?B?VVZqN1YwWlMxUGxISmZkc0swUmJCWUFzc2J5OG9YN2tlVDRnMGNPWnJNc2dL?=
 =?utf-8?B?dDNoSzRvWWRxdE15VUFjenQ3am1aNXprOThlM0FNcXBTVjJtYUNXR3RNM0Ez?=
 =?utf-8?B?UjVXRWpFOWUzS1J0ZG1FNjFCWjBtU0w2NXM2S3ptL20rdGN2ZGNEQUhTSllp?=
 =?utf-8?B?aTgyWGorVk4waFNDRFdLZEs1bFpSUE4wSklUamFENlVGUFRLNnBiUkpJU09x?=
 =?utf-8?B?NU15c0FzZFlEaWtmTUN5M0pkRWpsNTFxSXBUMkdxK0lxWmdsdGZyTzI2RnVE?=
 =?utf-8?B?UTVvdWVPSXZHUENlT3lOK3RDL0FYdC95YkxySUFMWjhxWGFUVllKZXYrVUQ5?=
 =?utf-8?B?aGo1K3JST0lvVjBNcVZHb3BMMmxMS01DNTVJVUIwWXVhOEJNQmVVMlg2VzFh?=
 =?utf-8?B?TWRPQnJnSkFZR0w1MFJXYjhzRURGdUtpNWFidFJnczJSZU5nWXNDRzhINDBm?=
 =?utf-8?B?SEl5Z3BUZTduclYzZStwTGN4bEpLSC84Q25SaG0rWUhvQm5UamNDT2F4UWpx?=
 =?utf-8?B?b0JmYVFJLzdDWm1LV3N4ZWdobWpRc3hjWmNRQytldlFkWi9jdXFaTXkzbDhl?=
 =?utf-8?B?TjVhdXBZRmxmOXlITVdSSytrem95ZzNFUzdQa016bUt4WUU5SG9wUU8vSEZX?=
 =?utf-8?B?NWo2Zkw3SDR6clBJVlltZko0K1owTFdIb203a1pjc0VFMG5MNFBuOUZ1VHdS?=
 =?utf-8?B?VEFiWHpScjBlSkcyWjBuYzFmdFdIWk1jb2hJRVRsdVQ4ZG9Od3ZBdkpoTjZs?=
 =?utf-8?B?aHNOYkRlWGdJelBwMUk3R3NkMndmWUxENWVrS05zWmEyYWVUeUk4eTRaMjVM?=
 =?utf-8?B?ViszVVY4NGFlRDlPTEVubVJoYnZOejN0eGtWaVo0c2lYc2RWZTJ2MmRSSWlY?=
 =?utf-8?B?RzE5MXc2TWYwQmJ2UHVqT1djYmtQVFZWYlFuVitheGhRcE96ZFNUM01JQ09U?=
 =?utf-8?B?SHU5dmNCZERSQVpYYlRWL1UzaCtsRlgzRitOMWhHWUpIWFFsOWN1OFNWcnRC?=
 =?utf-8?B?UUFibjkwVnZvcXk2VzZrckRFMkRaVFU4aDAvRkxLT21LTGNCMjdsRGpMMmt0?=
 =?utf-8?B?QWNCUXNHY2hrZ1pmdE9keTY5bUVaWWsvdmlxcHU5UlFwbm00RUYvU2RKVjhJ?=
 =?utf-8?B?Q0lOVWhLQjZxSGxOV3lNYWpSUHhFL2dFNFVQTm9FL01QNms1dVFyRVJrVXUy?=
 =?utf-8?B?Zmk1OUpaMU5PTFFwOFI4VjVhdmhpVGpPN0NaMjR1QllVM1FSVDJ4V3NFZzVt?=
 =?utf-8?B?VC94dkZqVVZ1bEgybWdaUHlJcE1iaW5EcURPQ0kyQ3gzVHg1Wi8zVU5xWFZz?=
 =?utf-8?B?Y1pSZjZYWHk4eFRLTTZsMW9Vclc2L1NlYVNsOWR0elUrWnRVZVFUbWNZOVE3?=
 =?utf-8?B?aVVsZGNNWlB3VnpsclNzR3JjZ0g4MmVSdnBNSWhVMWFiVU43dFBiNW9xcDBk?=
 =?utf-8?Q?chyNih3m/GihlKTV/ImlYIhkJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847cb40c-35f8-4bde-5ad4-08dd33d41ca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 13:13:46.2996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ou4W88vv8P+VIKBKxQtwiKvsT5CTDuFNgLxTjl74/lPSawnV+J0EDMuEdI0oaKoHV5EEGxH/4UxmR5a2vYdzG0GGXXKk4XumTAOo5z/rEd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEphbnVh
cnkgMTAsIDIwMjUgNTowMyBQTQ0KPiBUbzogR3VycmFtLCBQcmF2YWxpa2EgPHByYXZhbGlrYS5n
dXJyYW1AaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENh
dml0dCwgSm9uYXRoYW4NCj4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjJdIHRlc3RzL2ludGVsOiBFbmhhbmNlIHRoZSB3ZWRnZWRfbW9kZSBzeXNm
cyBzdXBwb3J0DQo+IA0KPiBIaSBQcmF2YWxpa2EsDQo+IE9uIDIwMjUtMDEtMDggYXQgMTE6NTg6
MjYgKzA1MzAsIFByYXZhbGlrYSBHdXJyYW0gd3JvdGU6DQo+ID4gMS4gQWRkZWQgc3VwcG9ydCB0
byByZWFkIHRoZSB3ZWRnZWRfbW9kZSBzeXNmcyAyLiBIYW5kbGUgdGhlDQo+ID4gLUVUSU1FRE9V
VCByZXR1cm4gdmFsdWUgZHVyaW5nIGZvcmNld2FrZV9hbGwgc3lzZnMgb3Blbg0KPiANCj4gSG93
IGlzIHRlc3RpbmcgZm9yY2V3YWtlIHJlbGF0ZWQgdG8gd2VkZ2VkPyBpbWhvIHRoaXMgc2hvdWxk
IGJlIHNlcGFyYXRlDQo+IHBhdGNoLCBzZWUgYWxzbyBiZWxvdy4NCj4gDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQcmF2YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4N
Cj4gPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9kZWJ1Z2ZzLmMgfCAgMiArLQ0KPiA+
ICB0ZXN0cy9pbnRlbC94ZV93ZWRnZWQuYyAgfCAxMiArKysrKysrKysrKysNCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZGVidWdmcy5jIGIvdGVzdHMvaW50ZWwveGVfZGVidWdm
cy5jIGluZGV4DQo+ID4gYmNiYjUwMzZhLi4zYTgzODY4YmEgMTAwNjQ0DQo+ID4gLS0tIGEvdGVz
dHMvaW50ZWwveGVfZGVidWdmcy5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfZGVidWdmcy5j
DQo+ID4gQEAgLTI2OCw3ICsyNjgsNyBAQCB0ZXN0X2ZvcmNld2FrZShpbnQgZmQpICB7DQo+ID4g
IAlpbnQgaGFuZGxlID0gaWd0X2RlYnVnZnNfb3BlbihmZCwgImZvcmNld2FrZV9hbGwiLCBPX1dS
T05MWSk7DQo+ID4NCj4gPiAtCWlndF9hc3NlcnRfbmVxKGhhbmRsZSwgLTEpOw0KPiA+ICsJaWd0
X2Fzc2VydF9sdGUoMCwgaGFuZGxlKTsNCj4gDQo+IFBsZWFzZSBkcm9wIHRoaXMgY2hhbmdlLCB0
aGF0IGZ1bmN0aW9uIHJldHVybiAtMSBpbiBjYXNlIG9mIGVycm9yLCBpZiB5b3UgaGF2ZSBhDQo+
IHJlcG9ydCB0aGF0IGl0IGlzIG5vdCBwbGVhc2Ugc2VuZCB0aGlzIGluIHNlcGFyYXRlIHBhdGNo
Lg0KPiANCg0KVGhpcyBjaGFuZ2VzIGdvdCBwdXNoZWQgYnkgbWlzdGFrZSB3aWxsIHJlbW92ZSBm
cm9tIHBhdGNoLg0KIA0KPiA+ICAJY2xvc2UoaGFuZGxlKTsNCj4gPiAgfQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3dlZGdlZC5jIGIvdGVzdHMvaW50ZWwveGVfd2VkZ2Vk
LmMgaW5kZXgNCj4gPiA2MTNkNTcxYjQuLjg0NGFiMjgwOSAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0
cy9pbnRlbC94ZV93ZWRnZWQuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3dlZGdlZC5jDQo+
ID4gQEAgLTIwMywxMSArMjAzLDE2IEBAIHNpbXBsZV9oYW5nKGludCBmZCwgc3RydWN0IGRybV94
ZV9zeW5jICpzeW5jKQ0KPiA+ICAgKiBTVUJURVNUOiB3ZWRnZWQtbW9kZS10b2dnbGUNCj4gPiAg
ICogRGVzY3JpcHRpb246IFRlc3Qgd2VkZ2VkLm1vZGU9MSBhZnRlciB0ZXN0aW5nIHdlZGdlZC5t
b2RlPTINCj4gPiAgICovDQo+ID4gKy8qKg0KPiA+ICsgKiBTVUJURVNUOiBiYXNpYy13ZWRnZWQt
cmVhZA0KPiA+ICsgKiBEZXNjcmlwdGlvbjogUmVhZCB3ZWRnZWQgZGVidWdmcw0KPiA+ICsgKi8N
Cj4gPiAgaWd0X21haW4NCj4gPiAgew0KPiA+ICAJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmh3ZTsNCj4gPiAgCWludCBmZDsNCj4gPiAgCWNoYXIgcGNpX3Nsb3RbTkFNRV9N
QVhdOw0KPiA+ICsJY2hhciBzdHJbMTUwXTsNCj4gPg0KPiA+ICAJaWd0X2ZpeHR1cmUgew0KPiA+
ICAJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gQEAgLTI3OSw2ICsyODQs
MTMgQEAgaWd0X21haW4NCj4gPiAgCQlpZ3RfYXNzZXJ0X2VxKHNpbXBsZV9pb2N0bChmZCksIDAp
Ow0KPiA+ICAJfQ0KPiA+DQo+ID4gKwlpZ3Rfc3VidGVzdF9mKCJiYXNpYy13ZWRnZWQtcmVhZCIp
IHsNCj4gPiArCQlpZ3RfcmVxdWlyZShpZ3RfZGVidWdmc19leGlzdHMoZmQsICJ3ZWRnZWRfbW9k
ZSIsDQo+IE9fUkRPTkxZKSk7DQo+ID4gKw0KPiA+ICsJCWlndF9kZWJ1Z2ZzX3JlYWQoZmQsICJ3
ZWRnZWRfbW9kZSIsIHN0cik7DQo+ID4gKwkJaWd0X2Fzc2VydF9mKHN0clswXSAhPSAnXDAnLCAi
RmFpbGVkIHRvIHJlYWQgd2VkZ2VkX21vZGUgZnJvbQ0KPiA+ICtkZWJ1Z2ZzIVxuIik7DQo+IA0K
PiBJcyB0aGlzIGNvcnJlY3Q/IFdoeSBub3QgdXNpbmcNCj4gCQlyZXQgPSBpZ3RfZGVidWdmc19y
ZWFkKGZkLCAid2VkZ2VkX21vZGUiLCBzdHIpOyBhbmQgYXNzZXJ0IG9uDQo+IHJldCA8PSAwDQo+
IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANClNpbmNlIGlndF9kZWJ1Z2ZzX3JlYWQgaXMgd3Jh
cGVyIGZvciBfX2lndF9kZWJ1Z2ZzX3JlYWQuDQojZGVmaW5lIGlndF9kZWJ1Z2ZzX3JlYWQoZmQs
IGZpbGVuYW1lLCBidWYpIFwNCiAgICAgICAgICAgICAgICBfX2lndF9kZWJ1Z2ZzX3JlYWQoZmQs
IChmaWxlbmFtZSksIChidWYpLCBzaXplb2YoYnVmKSkNCj4gDQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICAJaWd0X2ZpeHR1cmUgew0KPiA+ICAJCWlmIChpZ3RfZGVidWdmc19leGlzdHMoZmQsICJmYWls
X2d0X3Jlc2V0L3Byb2JhYmlsaXR5IiwgT19SRFdSKSkNCj4gew0KPiA+ICAJCQlpZ3RfZGVidWdm
c193cml0ZShmZCwgImZhaWxfZ3RfcmVzZXQvcHJvYmFiaWxpdHkiLCAiMCIpOw0KPiA+IC0tDQo+
ID4gMi4zNC4xDQo+ID4NCg==
