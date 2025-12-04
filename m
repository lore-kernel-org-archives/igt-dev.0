Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08C4D2A53B
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 20:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A7710E089;
	Thu,  4 Dec 2025 20:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/SfPmZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77C310E089
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 20:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881956; x=1796417956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AdGXN4/CDVtlhYBxbpyEXwnIeRHJKRQzb/qyruBovjM=;
 b=a/SfPmZdoz7H7QCFwciEWYUg7b8Q14+3JARBjmAwHgpMHtYii5v3FW3Z
 fUL+/0G6y0KI3420bgJVY7bHe/qGTfko2Pg/YP9/EvsfHLdg+zzMiJ/WB
 lC8tXsvePjDF0B/eJNzskbscZ44Nx9QcPrkOYIoFuJvVEZuNCYG+zv7Ro
 uJryvwFaa7rFQlgnYNQlzMyF8761soDgq/72CBp78ciVxZUdTbgHNwGXm
 zikLaPjkfjE9MYk394cz6ZPE94eOULqk/67pyApbJBsrtWESYq7GoxPKg
 sbSzbW2Z9tjVu90inDxOhEOVeUCFzbq9FxUM4KPUAoU/CX0Hv0XSGhSHR Q==;
X-CSE-ConnectionGUID: ChfwzFeAQqqAc1dYakWagg==
X-CSE-MsgGUID: b+hRboeJTA2Z2gJymuAHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65913746"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="65913746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:59:13 -0800
X-CSE-ConnectionGUID: YqV/Zr/wRdOzTAVKcLFTvA==
X-CSE-MsgGUID: 6qtpFOArQBi4kP6O1KF+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194748660"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:59:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:59:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:59:12 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:59:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJQGlr2KzOTajbiWqx6LhPr71CIHyxNCEAlDvlDEyjfR37RCRbqUYWqbyiSGcWCBX0ArzuzFC9/r40/Cosw/CgCA//+FsfheLfKTpDdayCdB/kvRHf/zVAl42VsaIvCucP6O9NmkmHzswnDHai4A0QqUychky9DaMpwCgnpGhTBgccaIbqMVLio3cg6rhkyWxEUTKTudnv1Q3sbGsPGro0VHWqDIDwylwDo8G6tvqjqZQ1j/PXlQ5BYuiZm2XTpQ079BeV7DtX7El3nJaMKXlq8ABImGrEHKzitrPCYTGgNk5jPvpfWAKJK9uzCCgGo9iR3dTFBarC+Qhdd7uVOtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdGXN4/CDVtlhYBxbpyEXwnIeRHJKRQzb/qyruBovjM=;
 b=FZ8QS9u1D+ylZ9P9QAMJEMYznWVbms4lQ0z2XZOoKUOukbF1xE+OwpeY5BCf/Dz6Awc0IuSpZ+Pe8Omtr58BYDVSj6LNSrELtlGSiZot1O6r0MGJ9+dJLKsjwX310gZskFP7YXa7gLyP/XLYbCyrKJgLiZlZDCtCXXskbxBWWPx+Hw8hbnb9wiFtIyoKhS3BoXtRluzY8SXQZu6/otf3kI4Z/tr1lHrwa6rX38ofvmv33I0brn/qli2cwsoUIsq9YiSzS/h+Fp7kWbhXxaevfMrXd0276uhq/0pourmliJa9aNA919o+Ah4yXuS5OmIIO6BHnOGKVeZZHd7Wwb7r7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB8504.namprd11.prod.outlook.com (2603:10b6:510:2fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 20:59:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 20:59:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Topic: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Index: AQHcWpr/am1+v01wQk24qso2BepcNbUSDHKA
Date: Thu, 4 Dec 2025 20:59:09 +0000
Message-ID: <b3859a79cb9f643b1978d05aee064fc936384c79.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-33-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-33-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB8504:EE_
x-ms-office365-filtering-correlation-id: 75457232-010f-4064-79d7-08de3377f83c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bkV5UWYxNW9xMmRBbGozY3p4WFo4VDdvWjNraEs0cDViL3Q0WGNjUVVyZC9P?=
 =?utf-8?B?K2ZBelNsM3MvdENyd0tZMm5Cc2hyZG9RVkVBR1pxT083U1dST2dkb1NKemNJ?=
 =?utf-8?B?bW1TT2VvNDhLRmZHNkdGdUpaanRuYm1lem0zenBoK2wyeDIzQXNNa1Y0cC9E?=
 =?utf-8?B?SzlnYU1jdFpUVkViOHZBbm5BalFWZHFKK1dpK1JGcGF4UnpMOFRPSXpEWW9Z?=
 =?utf-8?B?Ukd5S28wSURVd2E5YVE2VVZVMmFNSXNUY1pBc3J2Nm9JWXhNN0xOcEVvUHZj?=
 =?utf-8?B?WUNMdzZkSHRma0F5OWs3K2svL1pDSDZ2aWN2RzVPTmVMZllQRUx5c3BiM3Iw?=
 =?utf-8?B?akIrTEtmaStkZGdmU1pzTEdXRHpmdldpQnZ4anhZQTdKWG9Ha1cwV3BSeFB2?=
 =?utf-8?B?Z3NIbStsRWtLM2Z1ZzdzTUtMM2RQeXFrblovekF3N3FYclZEcmt5T3Bhdi9H?=
 =?utf-8?B?L0VKYi95SkhudHdHSjZNMmIwcDlOTDBWUkJVRHY2clVIQzRrMFlKUDk1cTlm?=
 =?utf-8?B?WmUzWS9KbDh5U2RzQStNanJpUjdGMFlpbGlla2lqZ0hKMUtxejJvOXY3NmJV?=
 =?utf-8?B?VGdGcjREL2l3ei9CVldrVEs5ZWNOeTQ4bllQYkpVM1FhOUtPWTFjcE9rNUdZ?=
 =?utf-8?B?WTFlaXIwc0tWTksrQVk5dkR1c05kMjVsN2hpa3FLNUhGaFFRUFAvQVZwNEF5?=
 =?utf-8?B?STNNY1JmTkF2K1pCV1c5UDcrVThNK1NxbkpvZkZEM2ZEKzEvemU5RDIrNVcx?=
 =?utf-8?B?ZzZaaG9GRXZpMnlIZ24rTVB1czk1TzNPcmZBM3VIVzlHSm9xWlMxenBLMXl1?=
 =?utf-8?B?d1ZpSmpOYVBSTGlBVkFxYjBBWW9XQ0pDYlN5alNZa2hIZkJDZ1hjSVR4UUdl?=
 =?utf-8?B?b0ZReEVYR2RCbUZHZjU5NlIwcHZISTh2YUJwSmkrMW1JeU9DZ2pwVFRjckFp?=
 =?utf-8?B?OWQrNUl1QnltZWVQK2l5V0RKNHVGeVFkNjk3amUzZ0hJN1dJZnB4enkyTHdw?=
 =?utf-8?B?N2RXMEZsT251VEdTUFZaN3JiMnpIY2RDRnVUWk9qQlhGbms2TTUxMVZ1RFZl?=
 =?utf-8?B?V3FrSDRWV0oxREZ3aXhGYmx6dGY2ZU90TmUyend4SUpJQ3BMOTVWYmtSWkti?=
 =?utf-8?B?bituYzgvRTI3WWFSUnZNc3lWc3J1blc4VXdFZjg5eDlvL2pKdlNvT2RxMm1S?=
 =?utf-8?B?VEpPS2Q0Rk52SW5UTVkzSXRCUk9OWWpUQ1RJMklZTW1Dc3EraXR2bkRKQzJ1?=
 =?utf-8?B?QXJRVzFJNGo4WGhTSzlsci8zVWE5bG9sdmhTa3VDODZhQUZWQ2t5Ny9QUUp2?=
 =?utf-8?B?UzJlaUlrZi9HVXlBYXV5QndlUVk4cy9MNUVScDBKRGpoNm9BNGphaUhSUFFH?=
 =?utf-8?B?L2pYNDMvWHprWlpNTlNEU0ZzV2RzVDFsQVFIRlNiRE5ZbStKZ25iaXlpc3pR?=
 =?utf-8?B?bG1vU3QrYk1CWEtDeTFOT29qbFh4RVJJTFBDMVIzTFRIZEhFaU90QTY0Wnhm?=
 =?utf-8?B?OG1wWU1wU2RzcW10NW9WNkNNNlFRYWo4K3hkV0hZQm9COENkL3RwL1ZvaGRG?=
 =?utf-8?B?OURXOXFOZ2lDd2QzUTBYOHFTcGNQV0p2MDlGcTFNaGtGWE5uY0JKSnFtZ0w2?=
 =?utf-8?B?SEQ0K3NxMVdSNFd1OGVjS2lqbUtDWXZmcUV1SVFUNGlnQ3R3Q1ZHWktVcEhp?=
 =?utf-8?B?WEZXdDlsNDRCMGZvTmRNemFuTElMS2xER3NMdnJoT0RqbVlZRFl0UG5mVkdk?=
 =?utf-8?B?aUN4azA3NU42MjdESGF1RU9YclYwMVVqWUcxS2JWZm11Q0VydHh4ZVpuRWRU?=
 =?utf-8?B?WEkzUmdIMEZadWJ5YmVidStURkhUTGVieEdGVEpLSmI2cmk4UDBMemxvbmMz?=
 =?utf-8?B?OG1Yb0RmZXIrUlZJQ0NmMnBRdVJEdE5qRE1Lb1Z6TEg0NSsrekllYzJ0NlZt?=
 =?utf-8?B?NTE1UVRLZkpzbXYvY1hMbGZlc1Q0ME5EQkkxS2NiSTVoRVRCZ3BEN1JLVXRY?=
 =?utf-8?B?N0lNc1AzbklCVHMyMWdDLzlUSTlDa1BHY04xWmtodXNyY2x3NVdXdk5VY3dy?=
 =?utf-8?Q?34Py5N?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzRSRkRQOHczS1MvZGxzaW5jQ2FhNlhMVUIzQ0p4RFZtaHNQRm50M1U4MTI1?=
 =?utf-8?B?RFhKeE1YZ0ZFd1prbFVXZnYzeGRadFVrWlJMczk0TWx6ajZzL1dwdHc2dmlZ?=
 =?utf-8?B?NHJVVVdkN2hud1NPVnYyUEJwczcrazNORlNzTzUzWUZkQU40azZoNmtvT2c1?=
 =?utf-8?B?aXhreEIvSFRIMzZwcTZJMjMwTG9mUkl3Qi9mQ2d5MUMzSUtxT0wxK3dKSVlx?=
 =?utf-8?B?cGxDV2NCU0tCanU2eGNTQ2hodlZGMmtxUVFQS0h3K1JhQkRrWTB4WjdaSjlC?=
 =?utf-8?B?SUxJWDJKRXhTK0RhT0x5T2Q3eHRlZi85Vml5V0FkSDNZUldubTQ0YmFDdVFG?=
 =?utf-8?B?R29QbG0wWkYydFhPNXVDblcyemlYbnc3T1B1NkdncTRNNzhaRHYvWVBXMjg2?=
 =?utf-8?B?Q1NnYWpSYnNabWw4TVdSbi9rVVBuRkNnQXp5OTVCVDNGZ1BabStmK21pdUY2?=
 =?utf-8?B?OW1BYlFnaEF1ZDB3Ri94VUtlZ3RXOFJHZVhPaG1MMVR0cEZxa1FXSk1kOVFu?=
 =?utf-8?B?cVRJREZsRUd1YitQQVlES3dnRTdZOHdnblVMQ0NTSU5yc1VXNlMrMWcrNGMr?=
 =?utf-8?B?dmNrbGx3TFdoRG9rMzBiM1ZXTmlqTWhkWnBTL2xHWGdOU1VRU2NmWDRyT2hm?=
 =?utf-8?B?N01BMWxRUU5pSG1ZazlGVUVwRWt4TUl2ZHBySUp0bld2RnMxTlQ0Nk9rajla?=
 =?utf-8?B?YkJKWUtGUWpJcm0vUWZuUEcvdW1hKzRSbnYvTzllVll3MGZmeVk5b0ppUzUr?=
 =?utf-8?B?WlNZL0dIOFhSMmx4QWNwS1YzU0NXWnlJcXVXZmRFMmFDaUNueTBvQU1nRzk0?=
 =?utf-8?B?cmJkZ1c4MkQ3MVFZczZKckVtaEFPMlNKMzFvSHN6SFhOT09LaWhQUE5XdXZw?=
 =?utf-8?B?TWs3dGRqR25zVHhMSWpRR0NzVnh0UjJaa1BTa0RoVWh6MmYvanBmRldpMGx2?=
 =?utf-8?B?Ny9QYWhIQU8wNWpoSGdVdG1rcHJERnl1WUczdUpNSmhkWkd5YXhzcWVsOTZx?=
 =?utf-8?B?bUI3ZlluZ1ZxemcwUzZOSitDeGhrNHhBL1U5cVRxdEljSjloc2p6NnNMR0R1?=
 =?utf-8?B?R09mb1lidlhVSkh4WFJDS0RsVXZoTmwvN3J1Q1VoL3Z5VHRIUXV1WDR4Nk5Z?=
 =?utf-8?B?SHJWVDY0dGdZQWhldENWQmhXbzNiQ3ZUVzF6QU1qSEp6M21ZRjY0ZnV0TWFD?=
 =?utf-8?B?VE0zTmppalk3YzllQ1RsRXlsOGt6TWthK0pINThuU0wxdkYxaDhiVjFGVXpl?=
 =?utf-8?B?VXA1eno4SGd2VFgyd3NwVzFDWjJEajBGM0NHcmZsN0l2TlY3VVY3emhsS0Ra?=
 =?utf-8?B?R1BZOGhZK3BQeEU3cVB2RVRNODN2WURxa05meW5lSTFLa21oM0VzTjhEbnZr?=
 =?utf-8?B?OTA1bitBQ3R4dUdDVGtINjg5VGd4UG4zOHVWYzFmaTE4c1ZCZyt1blY2Q1Vk?=
 =?utf-8?B?eWF6TmQ4akVoMWVPRWI5RXEySmgwbDJubFZoRVd1TzRqdmFsUUpDeHBRdFNv?=
 =?utf-8?B?UzQvWDAyQW9aN1c1QWIyVDdtdy9YNGN5eXBrZ2NtUlQ0aGFzWmN4MFZ5ODJw?=
 =?utf-8?B?U1pQTmc4enpObnJjcHZ0eEVEdGNTU2lsYTIvcWFNNEVMWk1HNkxlbFR0L29P?=
 =?utf-8?B?ZkVNMlZjcmpCSXMzM1BSQXJDdExCUloyckV1NGdQbmwydlN4Tml4eEJWdm15?=
 =?utf-8?B?Y3lYclNlZWRMNmpqV3pCbXZ3cE9xaWNHT3lVSDYvR2ovWnVNeXB5enkvdzlw?=
 =?utf-8?B?eE9YZVNqMzU3RGRlSmVCMmpjQlYxdFNnTG11OXkwVm9mTU5pVUpnV1lkMDFl?=
 =?utf-8?B?S1BXM1ZQQ0NJb1d1SGFXQ3FRQkRabzlMV2tNcURoVXFTNmY3TVloczhOYjk0?=
 =?utf-8?B?RURST1owMUt2Y2wxdkQreElLS04yUlNlQjBoYlE3MDY4dS9uVDVpMkpRNjZv?=
 =?utf-8?B?WFBFUG4wZnhhNlRpNzRpVkFZeFp6SXhJWGtjZSs3dDZIdHpmbzZBMk9PVjQ4?=
 =?utf-8?B?VEgrU2JVTk5KMVg5SkZBRFpsRzFnelhzYjBxMnhSZENrbDNZV1JES0U1R0E5?=
 =?utf-8?B?cmFTNzdUQzR2bld4VGNPVXZCOFFrUmlxRk5hb0x2OERidFVwcWM5cm05dUJi?=
 =?utf-8?B?QytNZVVTUkc2L0d3Qkl4NDFOdC9sZTkxL3Ewd1BWcVFYQTR4RnpGSU9GZm5i?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D30DB97071DDB4498EBEAB7C86D7995@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75457232-010f-4064-79d7-08de3377f83c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 20:59:09.1539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AS8MbYYVUxQeXxryP8+mOP3omm3QkCgExQs1RgC//rDM6sYDZjbkRMw+Hg6c+dX4Ng+p5B1t//AlFWKWePKneMm9f8gcJWIQ9Flcxsxbx+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8504
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEZyb206IE5ha3NodHJhIEdveWFsIDxuYWtzaHRyYS5nb3lhbEBpbnRlbC5j
b20+Cj4gCj4gVGVzdCBtdWx0aXEgZnVuY3Rpb25hbGl0eSB3aXRoIGZhdWx0IG1vZGUuIEFkZGlu
ZyBhIGZsYWcgY2hlY2sgZm9yCj4geGVfdm1fY3JlYXRlIGZvciBmYXVsdCBtb2RlIHRlc3QgY2Fz
ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmFrc2h0cmEgR295YWwgPG5ha3NodHJhLmdveWFsQGlu
dGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4gPG5p
cmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwv
eGVfZXhlY19tdWx0aV9xdWV1ZS5jIHwgMjEgKysrKysrKysrKysrKysrKysrKystCj4gwqAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rlc3RzL2ludGVsL3hl
X2V4ZWNfbXVsdGlfcXVldWUuYwo+IGluZGV4IGFhODZmOGEzOC4uZGE4MTE3ZDU3IDEwMDY0NAo+
IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+IEBAIC0zMSw2ICszMSw3IEBACj4gwqAjZGVmaW5l
IFBSRUVNUFRfTU9ERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDMpCj4gwqAjZGVmaW5l
IERZTl9QUklPUklUWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDQpCj4gwqAjZGVmaW5l
IElOVkFMSURBVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDEgPDwgNSkKPiArI2RlZmlu
ZSBGQVVMVF9NT0RFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDYpCj4gwqAKPiDC
oCNkZWZpbmUgTUFYX0lOU1RBTkNFIDkKPiDCoAo+IEBAIC0yNDQsNyArMjQ1LDEyIEBAIHRlc3Rf
cHJlZW1wdF9tb2RlKGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqZWNpLCBpbnQgbnVtX3BsYWMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZk
ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWd0
X2Fzc2VydChuX2V4ZWNfcXVldWVzIDw9IE1BWF9OX0VYRUNfUVVFVUVTKTsKPiAtwqDCoMKgwqDC
oMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUs
IDApOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChmbGFncyAmIEZBVUxUX01PREUpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLCBEUk1fWEVfVk1fQ1JF
QVRFX0ZMQUdfTFJfTU9ERSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxU
X01PREUsCgpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gdGVzdCBvbmx5IGZhdWx0IG1vZGUgKHNlcGFy
YXRlbHkgZnJvbSBvbmx5IExSIGFuZApMUitGQVVMVCkgaWYgd2UgZXZlbnR1YWxseSBwbGFuIHRv
IGRyb3AgdGhlIExSIG1vZGUgc3VwcG9ydD8gV2UgaGF2ZQp0aGlzIGNhc2UgY292ZXJlZCBpbiBv
dGhlciB0ZXN0cyBhcyB3ZWxsLgoKVGhhbmtzLApTdHVhcnQKCj4gMCk7Cj4gK8KgwqDCoMKgwqDC
oMKgZWxzZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0
ZShmZCwgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUsCj4gMCk7Cj4gKwo+IMKgwqDCoMKg
wqDCoMKgwqBib19zaXplID0geGVfYmJfc2l6ZShmZCwgc2l6ZW9mKCpkYXRhKSAqIG5fZXhlY3Mp
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChmbGFncyAmIFVTRVJQVFIpIHsKPiBAQCAtNTgz
LDYgKzU4OSwxMiBAQCB0ZXN0X2xlZ2FjeV9tb2RlKGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2Vu
Z2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLCBpbnQgbnVtX3BsYWNlCj4gwqAgKiBAcHJlZW1wdC1t
b2RlLXByaW9yaXR5OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBy
ZWVtcHQtbW9kZSBwcmlvcml0eQo+IMKgICogQHByZWVtcHQtbW9kZS1jbG9zZS1mZDrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcmVlbXB0LW1vZGUgY2xvc2UgZmQK
PiB3aXRob3V0IGRlc3Ryb3lpbmcgZXhlYyBxdWV1ZXMKPiDCoCAqIEBwcmVlbXB0LW1vZGUtZHlu
LXByaW9yaXR5OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcmVlbXB0LW1vZGUg
ZHluYW1pYwo+IHByaW9yaXR5Cj4gKyAqIEBwcmVlbXB0LW1vZGUtZmF1bHQtYmFzaWM6wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJlZW1wdC1tb2RlLWZhdWx0LQo+IG1vZGUg
YmFzaWMKPiArICogQHByZWVtcHQtbW9kZS1mYXVsdC11c2VycHRyOsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9kZS0KPiBmYXVsdC1tb2Rl
IHVzZXJwdHIKPiArICogQHByZWVtcHQtbW9kZS1mYXVsdC11c2VycHRyLWludmFsaWRhdGU6wqDC
oMKgwqDCoHByZWVtcHQtbW9kZS1mYXVsdC0KPiBtb2RlIHVzZXJwdHIgaW52YWxpZGF0ZQo+ICsg
KiBAcHJlZW1wdC1tb2RlLWZhdWx0LXByaW9yaXR5OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHByZWVtcHQtbW9kZS1mYXVsdC0KPiBtb2RlIHByaW9yaXR5Cj4gKyAqIEBwcmVlbXB0LW1v
ZGUtZmF1bHQtY2xvc2UtZmQ6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJlZW1wdC1t
b2RlLWZhdWx0LQo+IG1vZGUgY2xvc2UgZmQKPiArICogQHByZWVtcHQtbW9kZS1mYXVsdC1keW4t
cHJpb3JpdHk6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9kZS1mYXVsdC0KPiBtb2Rl
IGR5bmFtaWMgcHJpb3JpdHkKPiDCoCAqLwo+IMKgc3RhdGljIHZvaWQKPiDCoHRlc3RfZXhlYyhp
bnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksIGludAo+IG51
bV9wbGFjZW1lbnQsCj4gQEAgLTYzNyw2ICs2NDksMTMgQEAgaWd0X21haW4KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByZWVtcHQtbW9kZS1wcmlvcml0eSIsIFBSRUVNUFRf
TU9ERSB8IFBSSU9SSVRZIH0sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJw
cmVlbXB0LW1vZGUtY2xvc2UtZmQiLCBQUkVFTVBUX01PREUgfCBDTE9TRV9GRCB9LAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAicHJlZW1wdC1tb2RlLWR5bi1wcmlvcml0eSIs
IFBSRUVNUFRfTU9ERSB8Cj4gRFlOX1BSSU9SSVRZIH0sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHsgInByZWVtcHQtbW9kZS1mYXVsdC1iYXNpYyIsIFBSRUVNUFRfTU9ERSB8Cj4g
RkFVTFRfTU9ERSB9LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0
LW1vZGUtZmF1bHQtdXNlcnB0ciIsIFBSRUVNUFRfTU9ERSB8Cj4gRkFVTFRfTU9ERSB8IFVTRVJQ
VFIgfSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAicHJlZW1wdC1tb2RlLWZh
dWx0LXVzZXJwdHItaW52YWxpZGF0ZSIsCj4gUFJFRU1QVF9NT0RFIHwgRkFVTFRfTU9ERSB8Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBVU0VSUFRSIHwg
SU5WQUxJREFURSB9LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0
LW1vZGUtZmF1bHQtcHJpb3JpdHkiLCBQUkVFTVBUX01PREUgfAo+IEZBVUxUX01PREUgfCBQUklP
UklUWSB9LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUt
ZmF1bHQtY2xvc2UtZmQiLCBQUkVFTVBUX01PREUgfAo+IEZBVUxUX01PREUgfCBDTE9TRV9GRCB9
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUtZmF1bHQt
ZHluLXByaW9yaXR5IiwgUFJFRU1QVF9NT0RFIHwKPiBGQVVMVF9NT0RFIHwgRFlOX1BSSU9SSVRZ
IH0sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7IE5VTEwgfSwKPiDCoMKgwqDC
oMKgwqDCoMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IGZkLCBndCwgY2xhc3M7Cgo=
