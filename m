Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C096CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F37510E06F;
	Thu, 16 Oct 2025 11:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/U2VkbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BCE10E06F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760614254; x=1792150254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iDrOppsUhc7v5gyzq+z5ushowc+K93unPYAXow6h1g0=;
 b=l/U2VkbI+9WD8yR1LIcKDLxXgb6SuX7pg1cjNg9qPNt41swZmoPcd3+Z
 UeiM+2JCFICU9u6thR43mnC0cWT6oWQlnfcj7hLWYSvoQRa5JRa7dLJ/8
 nMMwrM4WNDYwLvD8CsPxjegZH3FootweHu8bDls7TwTu2OETYs+fB7fTo
 JOzPpXqCgJhjNuD2EzYBu6W4h4WNvQivYLR/KY4lfwsmQXBOSwULCx7j0
 V31J2DF2+mDLyrTYI2sfXcJ4Bu/l9j/YCDfN2gEcPT1+0A8YzAZyu6AMy
 9qvnoKusA5VZXplJGpJsw1Kngl07qXQ3GAUaJImAfLFcuKodoojn3TfZQ Q==;
X-CSE-ConnectionGUID: shfcrO9rQZWrj0KuMlvgeg==
X-CSE-MsgGUID: RjpwwK78Rt+O25IXPUJoxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62702432"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62702432"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:30:45 -0700
X-CSE-ConnectionGUID: rXWWmlAhThS5fkEw17SXKw==
X-CSE-MsgGUID: qcamaoSSQhKQJkkJtlqNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182902996"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:30:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:30:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 04:30:44 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s95tGx4rRhDfGXndpV929QK2I2rj8zF3jOTA+p6KUKhD9MlBsBjjmOik0FPirKtlv67aC9QPRxm+rOStQT5I25QHIk9Ji5b/fm/x7y6aVf21y2rnGHWU88qktqUIZRzeWCVJM9KrEoise7f4cr10rMl4hn56Ip7zUJmHr8FyWJ98t+0wtZdYbIqdDhJuLVIcVuNtVJW/CIB/+JGWRm7JGvWxR7sOgiWGZcGhSH0zLtEiDhgAt3WgEQIbIVK/6Mw9VoZgoYxIEffUrYIBszvMVUgfRiSO9xWTlO2mLIirqn5ZAdFmOIL4w5ymbGnUo8w/B9LXPXy9bvE2xgAbN7gcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDrOppsUhc7v5gyzq+z5ushowc+K93unPYAXow6h1g0=;
 b=ZUc6X8U/bbCwG15Ew1kdahC+y2Y+pFuHPMNkGZ9Vj9lHYsIFogcWjtwDyUD+0It+w4/XiJDja4lcuDafrSZwqwa1xv2V3Ru/91nDV/UqokpsVOH8IDRk6yRJbRV+HXKYpB1JuX6XCsO3PK/Taj/FmOzMQx+3J6He964vJrZOmtPj3LFcKnquCJm4GZ7sAIDadurxzhiLMTIUVR/fY3Qp4Wbd04SwwaRO6Kf/7paMMr2Dsy680vJq6LwOtGFlYv4ZDQEzgIrssEnX3/d+J7m3siwTuwpt+v8xuUklrG5wNqtmORK7Yfhxa/TRawym5nXtRMq8VouBFiN/HQ3hHA/Lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:30:41 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::2c64:563b:cffe:c186]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::2c64:563b:cffe:c186%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 11:30:41 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v5 2/2] tests/kms_concurrent: Fix for msg_queue
 failure
Thread-Topic: [PATCH i-g-t v5 2/2] tests/kms_concurrent: Fix for msg_queue
 failure
Thread-Index: AQHcOblg+6ElAq0GYEi2Rwm6Sv0k97TEqBgAgAAEVeA=
Date: Thu, 16 Oct 2025 11:30:41 +0000
Message-ID: <BN9PR11MB5433B9669415A9E21956460098E9A@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <20251010073009.821335-1-s.sebinraj@intel.com>
 <20251010073009.821335-3-s.sebinraj@intel.com>
 <20251016111234.6pggsks7dhtvf4bq@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251016111234.6pggsks7dhtvf4bq@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5433:EE_|DS7PR11MB7949:EE_
x-ms-office365-filtering-correlation-id: ac85a04a-00b3-47cd-201a-08de0ca77047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?b0FuRWtKRTJnT0hoTUNOWkNncFN0S2ZBNmFhMmhRNXUvTzdZazdlNEVOM2hT?=
 =?utf-8?B?Sm8vYit1R1BJQ2Y2SGY5YVdxbTNQNXpUL0tyL3Rab0hMTWM3Z1RFblhXbWFR?=
 =?utf-8?B?eWl0dXM3ZnBTMmE3TTcxcHNCZ2RDUzd4UW12blYzTjlMUTJKWG1ETmdVK0hz?=
 =?utf-8?B?YTl6WUhxRytKZ0xNRDM4Vm84c0NJci81bjg4WVlGWkM5N1YraEdpaXN0Q3NJ?=
 =?utf-8?B?QS8yeWwxMzNiTW5rSnFWd1hnRmlEZVMzNjlXbmpEaGIvYUswYTB0ZkZNK2xB?=
 =?utf-8?B?QjArK1hWZkFLMTkrVyszbWRaVTNmUWVMVi91RTl4bGR4TW05bHJhdnNnekFI?=
 =?utf-8?B?Q3RIbFgxUGtDTU1MV2gyY01yMW5PdHNMQm8xWUhVMGhld2dUU1V1akw3TGFk?=
 =?utf-8?B?TWs5cmprRmp3Lzhra1M1VlR6T1pyRmlkckUxVitFUTRtNHFlTGhpWkZKeFBW?=
 =?utf-8?B?Rk1XTjFJS0EvYUtNaG1sTXI2dktWMXdjb2dwKzdWT3BkN2ZWZHMybVNLcXNT?=
 =?utf-8?B?SHJMcGM3NGo4Y1FjZ2F1NXphNHFvRlNJT29ZZFBHWS9UbWtieUNlSDdka2Yy?=
 =?utf-8?B?elFuQ0dMaXcrenA1L3AvZENxc2hGTmpRVVRaTjZlWXNoNVJ6MlVMcW81Yy9m?=
 =?utf-8?B?ejEzVDRBVkNLZnA5UVczWFpsZk1WUG9nZ1F1Y3pyZElCS3BZMWx2NkJQREJJ?=
 =?utf-8?B?RE1KT3VTeWdrNU1jN29HeVhuQ09WejFRTDdVSVgwMkJlS0hBdTZCMHNYT2tZ?=
 =?utf-8?B?WnJvNHhaQThnd0tnUnFUREdtVkNwTU1URjFkZDc4VnI5cE5jeUVyUW1tZXo3?=
 =?utf-8?B?Qm05aEFrSlliMFY0U2kxUDBvT0VPVm1DSDl6WWxhRXJSUms5VnVDM3NHU28w?=
 =?utf-8?B?K3NDTjJNRFZEQU4wMjdTQW5WK2lacjZ4bXdXbEFmZEpNbDY0TGQvemt6UytF?=
 =?utf-8?B?aC80R2hzUGRNZmJpN1FGK05ZKy9ySkdmQXlqU1VGWUJvVU5RQU80Uk1SRDZu?=
 =?utf-8?B?M1BTM0c5V0N1ZHJQT1dmWHVTWE5takErUWVOV2Nvdi9vNTNNMXQxWjEyTnNX?=
 =?utf-8?B?YnBaL1hSUjRnbk52WDZRdjJraThERkVYcUZRYTExZXE0dU5nU3JsVENRQk5P?=
 =?utf-8?B?eDBaekJxYmE2Z05qQUFaSFFHWVArZndCOFdZa0FZWS8ybEFBekt4Qm9OVGJ4?=
 =?utf-8?B?ODBqWHo1cUZqM2tTcTBrRFVvU1hndVdCS1ZRQ21iWGdwcU1XM0dWNWtXRFFS?=
 =?utf-8?B?dDgyTWNoY2ZOb3VOTHpyRkVyUk9WVkFiNU5KbzlYelJxcCtLZGlFK2VPa2lL?=
 =?utf-8?B?WFNjSEp4WEI5ZERjVEJ3cExNV3ViR0pYbS9qbzVBK0luRUY0WUZhOEpiVnY3?=
 =?utf-8?B?U3VOdFRJdWZBZ2FVa3dHeG5Vck1WbXAvNGpHUUZGdW8xS3lvaDNRK3FaTVps?=
 =?utf-8?B?NDRVREVZd3htOGs1RDdBTGg3RnVrNnZjTUxVVUNOdXR2bGkrRStTZVZEdWtE?=
 =?utf-8?B?T2NlVDVhSStmeDc5dGE1SUVvTXFDaWExRlFaaisxL2NST1VJT2tkQnRLalBz?=
 =?utf-8?B?d01sczRZanNqNkVLV0JjQVFsRXM3d3B3WUVROUlHRTZxWVV2b1BJZVB0QVpQ?=
 =?utf-8?B?cHk4Mk05NTFwT3N3TzVSZ0dBMXo1Q1poQ1pvVFFqbk0zRnNCUTFPNFlSRlps?=
 =?utf-8?B?cnBxbG1QMjNLSTlYeWJsVUtHZ25Ma1NDdFoxbnhtakQ3Y3ZBTlpkR1RsUDBi?=
 =?utf-8?B?ZXN1SnM2YVFoSWdmOUVqaHVCdTlveS9GRGFwSXFnTFNwWi9ENTI0V3J4cW56?=
 =?utf-8?B?Y1E4cW9XZXY4YWJOR25tWjdUSm50a3NmZERCRDc3dUdGTlBydTR0bHE4N3hX?=
 =?utf-8?B?V3VoUkxHNkhLYlhmNG1mVnlLS1BJYmdtci9CNVdoanNpUThTamZEL1NoakVH?=
 =?utf-8?B?bUFkR3FaZ0NiOGJnUVZqeVRWdWhKRXV6M1QxWktYTGlBZnIyWGl1cUZKeFNY?=
 =?utf-8?B?R29tMzdqYkhBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5433.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1hQdmgyY09oMEZjNk1wRDdMWkFHdGN4OGhIU0owTG9Va290MFo4U2h5ZUV3?=
 =?utf-8?B?VFgyTUxlaGZvaGNTRkxyMDk1QVhFT043Y0tpVFFkM3lxeXBMbXZGU0JxNTRM?=
 =?utf-8?B?WEJwNStuNC80SSt6UGxQbkJCZGY4U1lmRDZicnltc1NQZEtyZGZNaVQzUUtr?=
 =?utf-8?B?T1BRYWtaUmI4MzlpUUhQWmE1dWNCdEZyTi9pSFlJZDNHbVBzUlpmcW5LVDJN?=
 =?utf-8?B?MUc1TXdPbnduSmNGZHNtVjN4YjViMHdqRTRxek5ETjg0MUFTSkRTKy84UkVj?=
 =?utf-8?B?YVIzMWxrUlBZTjA4M0JaVEtPelpvRGdIMlBtMlJRMU5Qa09FNVlUdmpzR2Y3?=
 =?utf-8?B?MGIyaDdMUjdvVXJsaThKOWVVUHJ0N2ZnSUhScGhOSHVFMzVZOGpkMGdOL2xU?=
 =?utf-8?B?RGFNUjhTc3hPdnFzM1BPR2hVd3pkbWNPMFNkM1JjUFBOdnFPbWk4ajNINjZi?=
 =?utf-8?B?NHVaVmFSRkpxb1JzK1BMK1YyUC9sdjVRU0JkY3lwRU5JcUhsZm1QMnRJTElo?=
 =?utf-8?B?ckF0bzc3U0FkVkliMkdZTkw2cUVkeHIreHpwck1VdmtsYW5hcVNKY0R6cFhT?=
 =?utf-8?B?VnhucW5OK0dJeGJnQllhakI5bG1Oc2RUTzNVaTcyY1ZpMldUOWZmN0xPQVRC?=
 =?utf-8?B?cjZkOWJVNk9pRDhIaDl3MC9GTE5ZNWgyRmpjMGdIZkdZR2F3VWRWR0VsWk9K?=
 =?utf-8?B?SkxYOXVGOXgzK2g2ZExmRHdQeWpxcnVWVUNSbngxcWZhekd2ci9UU3NHSldo?=
 =?utf-8?B?M296VGlZYXQwa1B0VEpWU0sxb2pFbS92eWw4UGZqemVPUEQ2eFJPNU9XRzVn?=
 =?utf-8?B?bGpqSE95WitWdFBjdDFxcURtd2FzR04rZUN5Zk43cWZJdTBiU0xtZWtrQi9v?=
 =?utf-8?B?QytNd2plZGQ1MDJrTmNtbmE0S2J2Y09YYkI2N2JkelJyZnJOTW1Bb213S1Ns?=
 =?utf-8?B?WFoyYlI1UEdJMWMrV0JXSTE2ZjBueGwxQnAvcDBXMkduSStWK2xXTlZSWTZ2?=
 =?utf-8?B?cS9jOWpFd2gxR2dhYjZFbkl2d2JTOExCTC83dDlkK0pIeEFsZkNYK0VlQ1Vp?=
 =?utf-8?B?clJOSUV0Ulczem4ycDVoVUowNC9vc1EvUnU3SUF5ZHBKYWN2ekVWUDJnbUpx?=
 =?utf-8?B?RzZVVlpuVFBRZTJlMUVyVW1RYitmUm13S3JXOVpoWWNrSmVLTzVKYXRXbzQ1?=
 =?utf-8?B?L2NURWg2Z2hIalAyUERkeUJNdkQ3alR6cjFIVTBtbzJHdk4zbURmYUlFTWtU?=
 =?utf-8?B?WmVFdTYrUjFSMFRReG04UGVmS2NOZ3VNakFKNllPUy91TkptZGFMa1dQdlYy?=
 =?utf-8?B?NEphcUdJVWlDT1lPZ2J3YlVmUnRtbkNrb0Q2QjVBNDdWR1ZsRkNabldrbzdD?=
 =?utf-8?B?SDBaeVhxK0xpMDZETkRGc1hWQ2FmdU83SldzSXRuS0haOTltQ2ZEL2cyV1FR?=
 =?utf-8?B?QVVjUFhCMDN6K2EybmNuc3orNFFiWEQ0VXlpMDhwck95V0MxcjNzSXdHSkJ0?=
 =?utf-8?B?MCtLanRuN0J4aVdFdnRiMmlaY29LdDlzTm1nenNZcXdqaG42ZTh4TW41aHdv?=
 =?utf-8?B?Vi9XVndVMEYxOCt1cE1kYWRCa0JpUWhYd2hnU1RtTTVaSzlYUDBoWWFRak5W?=
 =?utf-8?B?THhiMWh4Z2RoRnpvajFFR2ZhSGc4R3hRZkkrVERxUWpwQ21EZXEyMmkxV3A2?=
 =?utf-8?B?SE5Uek0ydWJLRjNrQmhwVjhKR1JRVHcreEpVWGY1VW5HRVBqd1I3WWxZRTBI?=
 =?utf-8?B?MlhTK05wNlF4eDNCL3VmRGFvOEdmYkMwU3NwcUVDVVA3TG95dzR4akFDUFRN?=
 =?utf-8?B?WUJFQitLOEtMMU1iWUVjWW9ybGpzZDVQb1dSaXk4UFZPRUJ1L0YzQ2pjUnJz?=
 =?utf-8?B?WHNFMmMwRHN1TWIxeDR1K01hdCtGM2xCTjNLT29GWjljeFVqSGFGclM0VUkx?=
 =?utf-8?B?d241d0JOaVkrUHR5bnAydUNPWUgvaWtMUUVMZ2FNOU5oVm9icGxZWnJRR0Jh?=
 =?utf-8?B?VHFtVmtXOUQ4djFOMjA5RmkxbGRNTktrS2NtbnZnbEhBbnNtN3J0dXZBM2M0?=
 =?utf-8?B?dGNFMk81NTNqMzFvNi8wQ2ptRndsUnZmeEhHOXFGSVkvb2x4aXdFTjkvbGF1?=
 =?utf-8?Q?tp3TDVv9VHWg5l2/8Myyvi3Ko?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac85a04a-00b3-47cd-201a-08de0ca77047
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 11:30:41.5893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjTTr/K9dkKDZWtkrBbKiJ+Jmmlxnf1Y71RxEalR5saQ8wIZOzLMEBDjo7V7EXTj9gPW6Dby6KB+QWDBovC+MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLYW1pbCBLb25pZWN6bnkgPGth
bWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+IA0KU2VudDogMTYgT2N0b2JlciAyMDI1IDE2
OjQzDQpUbzogU2ViaW5yYWosIFMgPHMuc2ViaW5yYWpAaW50ZWwuY29tPg0KQ2M6IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBCYWRyYXBwYW4sIEplZXZha2EgPGplZXZha2EuYmFkcmFw
cGFuQGludGVsLmNvbT47IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5z
a2lAaW50ZWwuY29tPjsgS29uaWVjem55LCBLYW1pbCA8a2FtaWwua29uaWVjem55QGludGVsLmNv
bT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjUgMi8yXSB0ZXN0cy9rbXNfY29uY3VycmVu
dDogRml4IGZvciBtc2dfcXVldWUgZmFpbHVyZQ0KDQpIaSBTLA0KT24gMjAyNS0xMC0xMCBhdCAx
MzowMDowOSArMDUzMCwgUyBTZWJpbnJhaiB3cm90ZToNCj4gQWRkcyBzdXBwb3J0cyB0byBjaGVj
ayBpZiB0aGUgc3lzdGVtIHN1cHBvcnRzIFNZU1ZJUEMgYW5kIGlmIG5vdCBmb3VuZCANCj4gaXQg
c2tpcHMgdGhlIHRlc3QuIFRoaXMgcmVtb3ZlcyB0ZXN0IGZhaWx1cmVzIHdpdGggbXNnX3F1ZXVl
IGNyZWF0aW9uIA0KPiBmb3Igc3lzdGVtcyB0aGF0IGRvbid0IHN1cHBvcnQgU1lTVklQQy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFMgU2ViaW5yYWogPHMuc2ViaW5yYWpAaW50ZWwuY29tPg0KPiAt
LS0NCj4gIHRlc3RzL2ttc19jb25jdXJyZW50LmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc19jb25jdXJyZW50LmMgYi90ZXN0cy9rbXNfY29uY3VycmVudC5jIGluZGV4IA0KPiA0ZjE2
ZjhiODkuLjM1ZTdiNDMyOCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX2NvbmN1cnJlbnQuYw0K
PiArKysgYi90ZXN0cy9rbXNfY29uY3VycmVudC5jDQo+IEBAIC0zOTYsNyArMzk2LDggQEAgaWd0
X21haW5fYXJncygiIiwgbG9uZ19vcHRpb25zLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsIE5VTEwp
DQo+ICAJCWlndF9yZXF1aXJlKGRhdGEuZGlzcGxheS5pc19hdG9taWMpOw0KPiAgCQlpZ3RfZGlz
cGxheV9yZXF1aXJlX291dHB1dCgmZGF0YS5kaXNwbGF5KTsNCj4gIAkJaWYgKGlzX2ludGVsX2Rl
dmljZShkYXRhLmRybV9mZCkpDQo+IC0JCQlpbnRlbF9hbGxvY2F0b3JfbXVsdGlwcm9jZXNzX3N0
YXJ0KCk7DQo+ICsJCQlpZ3RfcmVxdWlyZV9mKCFpbnRlbF9hbGxvY2F0b3JfbXVsdGlwcm9jZXNz
X3N0YXJ0KCksDQoNCj4gVGhlIHN5bnRheCBpcyB0aGF0IHlvdSB3YW50IGl0IHRvIHN1Y2NlZWQs
IHNvIG5vICchJyBoZXJlLg0KPiBXaXRoIHRoaXMgdGVzdHMgd2hpY2ggd2VyZSBwYXNzaW5nIG5v
dyBzdGFydGVkIHNraXBwaW5nLCBzZWUgaTkxNS5GdWxsIHJlcG9ydCBmcm9tIENJLg0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzODg2L2luZGV4Lmh0
bWw/dGVzdGZpbHRlcj1rbXNfY29uY3VycmVudA0KDQo+ICsJCQkJCQkiQWxsb2NhdG9yIGZhaWx1
cmUsIG5vIFNZU1YgSVBDXG4iKTsNCg0KPiBBbGlnbiwgc28gaXQgd2lsbCBiZToNCg0KPgkJCWln
dF9yZXF1aXJlX2YoaW50ZWxfYWxsb2NhdG9yX211bHRpcHJvY2Vzc19zdGFydCgpLA0KPgkJCQkg
ICAgICAiQWxsb2NhdG9yIGZhaWx1cmUsIG5vIFNZU1YgSVBDXG4iKTsNCg0KPlJlZ2FyZHMsDQo+
S2FtaWwNCg0KR290IGl0LCBUaGFua3MgZm9yIG5vdGljaW5nLiBJJ2xsIGNvcnJlY3QgdGhlIHNh
bWUgYW5kIGdldCBiYWNrLg0KDQpSZWdhcmRzLA0KU2ViaW4NCg0KPiAgCX0NCj4gIA0KPiAgCXJ1
bl90ZXN0c19mb3JfcGlwZSgmZGF0YSk7DQo+IC0tDQo+IDIuNDMuMA0KPiANCg==
