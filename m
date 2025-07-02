Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC09C7EE30
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 03:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB0A10E63D;
	Wed,  2 Jul 2025 03:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxhIo8RS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD22D10E66F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 03:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751425658; x=1782961658;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=x1nnGQ2Z/QTSCXIYv04YUqO50CtmX/TICwZZo/dcrO0=;
 b=CxhIo8RS6d9aZt0eJwfg3xCeiaadWgIqyJnqlEvQf23aqi2uwsIR/OVF
 EWT9gyL1qJ0EtXBJBVpME/GKGn4cV8R6kfKbY8x/pw//G2EvwtDpY0lc/
 chRFM/9qC4trgmjN0G3NOSmjm9ORptzY67LQRUKZO2naUCVhHPTlH2Moi
 Qat0nbWTiQJYk+nlkImTO5b1QurslUOryj1ZAhGu/vfzQTOerRKjGSX74
 kvksUkxEbN9rnyVk3gDWG16blCPKWpOdMXN8HPmcm2llk8DN5HTIwYjEZ
 49owa0bo4zWf15yixhTI/NEffGdeCN/voQdzPtPKqns092Qlh2qpLE4M3 A==;
X-CSE-ConnectionGUID: 9I4kminDSr2ZP4K7QVXJ1g==
X-CSE-MsgGUID: Ova7cWWyS9GWRYaRid8DZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79149301"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="79149301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 20:07:29 -0700
X-CSE-ConnectionGUID: jQ2bRt/ZQPeX3L1VRQjeNA==
X-CSE-MsgGUID: 2MEN8OesR76v41KdulW6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="158207370"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 20:07:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 20:07:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 20:07:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 20:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRQdfY4l2kA6DSlwdj3NmheH4pU9i2hQAHukd9/2JusCqY/YjZlLRKDWlH5CPKFw6MCgGUncb0NC/3jxzyZ885V8ldBbew4qCAPLUXFB7PhoN4Cf+zyhkgWdpdmuDqkKf6IYO+HxC0t2p5cPYTpcW3uBJmZ71CAfhd/W9VxTZMbrvlUo2qoJYntnN7lKkbbsjeHi3KznfzrTuW5HsczGLmHHdliCrXZj6XDoYxAlGTr8cYODPr+/MvF6mRFVA9/nU/+oJOkantLsf2AYXXZlAcITnzmuQp+E907pdYAGjRpMOoYsSby+f3MGFJQ/2QYJ8JrS0X6Dx9qDwMbud2swVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1nnGQ2Z/QTSCXIYv04YUqO50CtmX/TICwZZo/dcrO0=;
 b=vRUwOzurIMkb3Zin+SjUhqPayJg3KhSKOQMr+azGnIX5kYn73e8LU8zrGtaRxWH6oBO9Q4bNhVHahTXyVYUOG1XhWMREyWh1A23wg2E6er5jf6DnYnjDqsxphpKKswIJD5rn/ZTgMYVmWpayDMHVQ65XO75aLTZvXYWB/T07ACrBV2Sp30eW0Bp4uEiR9xH/txgVpPEUSyEoaM4gYo/bUYjuTD363ttwa9NnySeZnkTRv0/bynz8SodvXkczLwnJYfNhEihevL0FphBgnuASnidM1MO2yzB5chARAJmX+cmaIwghWQPq+q5mjcEmleyag9v/xQlj/eItxx/v4s+IeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.19; Wed, 2 Jul 2025 03:06:42 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 03:06:42 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v4 1/5] lib/igt_sysfs: Usage of Original debug mask
 to read/reset
Thread-Topic: [PATCH i-g-t v4 1/5] lib/igt_sysfs: Usage of Original debug mask
 to read/reset
Thread-Index: AQHb1RDe+UnNud3oVUmr4j5mF9FukrQd4PYAgABuOqA=
Date: Wed, 2 Jul 2025 03:06:41 +0000
Message-ID: <PH7PR11MB6053A670F91AC2A20B6DD598E740A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
 <20250604053046.1702233-2-pranay.samala@intel.com>
 <0b145bc7-973f-4bb4-a830-b5426554182b@intel.com>
In-Reply-To: <0b145bc7-973f-4bb4-a830-b5426554182b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB6502:EE_
x-ms-office365-filtering-correlation-id: ef28f081-25a3-4eff-4b62-08ddb9157847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?cytaTHRMeStTSFNJeWhmdGVMakp0VjZSbkpZb3ZWdmt3eG1ZdE5WMktrV2tL?=
 =?utf-8?B?WW5LOHI1NHdhcHVFZGYrUGE0UkpMUmJnY0ZpTnlSWkRaRkZLaEFqLzgvdjlT?=
 =?utf-8?B?clcvN2NESHNyL1kyOHNNVlhuVXNmVkxOQXdMaWlHMFhQZUxkTGk3STJQYzJ2?=
 =?utf-8?B?UXB5eTdxd3FsaG1ISDBOeEJTSWk5SFdENHJzY3A0ZzVhY3ZlankzMGVNbVVP?=
 =?utf-8?B?dGI2ZVRJZUNkYWg5RVJ2eC9YOHhTWk9HVVFubS9VdDlJMmFtTTVUeXdQbnFZ?=
 =?utf-8?B?S1BJVHE2WTJTYURRcTBHWmg4Sm9vSEcyb0ErbU16RGJXM0cwU2YvREplT0Vj?=
 =?utf-8?B?L3EyckN6a1V6akdkKzFtTjFaZkI4T213R0pSRFNEZXpKd0pwVm1CUlVJdHEr?=
 =?utf-8?B?ZFY4Ry9RaFJEaHpnN2J2dXNMTXROTUkrNjFIUmxzU1ZwT0hVS0NSNUEwd2ly?=
 =?utf-8?B?RDdHMDlkcU1CQ1duQStoZ253RUxuanJkMWNaSXRSQmx5K1lZNWd0VDdZSHE1?=
 =?utf-8?B?eWN1OURyOHVVNmcvMFJXYzByeW9PY245c2gyK3FnQWYyMTZDN2ttd0lCRWFU?=
 =?utf-8?B?RW45M0krZjVLczY2cFRsYU5zY3diWjIrdE9JNUhrSkRMeWc4eGxTRVB1bUhq?=
 =?utf-8?B?NThCcVpBZkNMYVRWaU5wS0xnWWdVVzM4bWNVU0JhamVNVDVoeStVMDhEQ1Vi?=
 =?utf-8?B?ekdMSVRSWmRwU0gzUjNTa0tRcE14VnJBYnliRkdTWGhYVkVkQ2R5aVRweG9v?=
 =?utf-8?B?dUswMFgyZHI0WmVnN1ZqYXRBT1BnZnRwNU5wZmhUM0xtaTlJZFlNRy9BNXlm?=
 =?utf-8?B?VG5HVkNua1RJZVFjSE0zRVc4RU1vRGhBWXdJejk5Q0ZKeWMyeHdMalVyWTd4?=
 =?utf-8?B?bmtMZlpUOHg4VUZ1OHZDdTdYclE3cnhHWHc4VUxzTzlOQTlqemlyNzN4Umlm?=
 =?utf-8?B?YjEvK25EZ0NSeDRPcjNkOUY2STJuby9QQWNxbTB6aXpCTlZKWTFFbXpLdTMr?=
 =?utf-8?B?bXVyUThEUkxvVTJnOGhPenMzaHg5eFU1a0pldTR2YzlNVDJtV3dOM0t1dGQ3?=
 =?utf-8?B?NGFOcEEwRDZhVGFKNm9ocXY1TFZ0NTBiaGJYVmNIM1kzZjRGd1A1RmUrQnpp?=
 =?utf-8?B?RTAzbWhCK1BHbGdlNldrVzhNelNkMlN3ZHF5cDdGY3d1cmhEbmNySjNOWkx6?=
 =?utf-8?B?K1dodVBTVmtrUEsrbmFMQ0hiUDVqUXFRc1E4TVNNRzNrS2ZSSUVBZjYrS1Jz?=
 =?utf-8?B?L3BsendrdnNIRkV0V1J5QlJ1WHhuRUpBRUN0RzhlOE8rYWpqTFY1TGgwU0ph?=
 =?utf-8?B?OUk3VktIMDhrM3FPNHZUVm8yVXFuT3lVYnJ2NzhNTkV0T0ptaGtNbkp5eGNs?=
 =?utf-8?B?UlNNOHdaMm80amkvdUFmdUdGSy9UaXJTSkc0VUsyU3dHa05ZSlkxRFUyMFBr?=
 =?utf-8?B?Y05tK3JXdVdrNHJHYlJGWkZEMjBrZUhFVVh2RGdZS0E3NWlKYmZpUzl4dDRB?=
 =?utf-8?B?TzFLdDQ1RU9Ud3FlTnhMaWFvZnRxZG5pOFJycG9rZGdSYnNlUjQwdjdOc0tQ?=
 =?utf-8?B?a2RDWW1reGFOU1plOHh2T29paS9zYjdJNkd2QUtBNFNVb0tsdzNMak0xV0JT?=
 =?utf-8?B?UjJlTHFBWk1GTVlENzhNaFg0S2oxeFBpWDRoaEdmRFZJckF3L3FGWmFRVW8w?=
 =?utf-8?B?YUdpWHJvWE8vemE4dFNaSVNrK3RjU1UvTVNPdytIM2cxSE5nMHYvZjMyckRX?=
 =?utf-8?B?bXVFUUZ3bW1ZZmh4Q2VGV2g4WE5rL1BuTERyclJPQ0hXbFZyVVYybkZLWHhH?=
 =?utf-8?B?NkxMZ2VpZGgvcWJOQlZhdGMveDZGOTNJcWZKWjhxcmcveHVubEtsYTNWTzY0?=
 =?utf-8?B?MmdJUDJ0ZjlqNC9GcnhwdDBoS2tBanE0Szk1eFdTd3BzYkJqcjhkUG15Q1JM?=
 =?utf-8?B?ZnBwejIzWHAzVm1SU0pwZXh5Y2xORzJpTEhoRE1WUnhYaEZ6OVJtQlpqYWho?=
 =?utf-8?Q?SOVbnCrVICWxdcpaCM3VUE6KK8UgWQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlplazByR1N4QVpOSDlTQzNPWUs2UkpKY1loK09FZWFEQjQ4NDc1bmJzU243?=
 =?utf-8?B?L3IzeThGc3JmUS9MaTAveHFoTUNrSHFhSmxtZk03ZXRVZkV3cjB5bTlGQVN1?=
 =?utf-8?B?UG1xN2FCRE1acWpPUndpeWVPZThjbWhwcktWRk51RTM1VWl6RTkwZEtOWDJ0?=
 =?utf-8?B?c2dHYzUzU29XeEE3WHRiMTlVdkc2VWRaL0J1dU92Qzk3R213bEZRdWFmTkN1?=
 =?utf-8?B?bHpvUFA4d3dTL21mRGcrZS9UcDdScGxwWFEvWmFBYVNMRDZ6VVFUQ0t2ZmFD?=
 =?utf-8?B?NWp5Nm91SWJSZjN3TXZKNjFwQzBSYWFhTktlUW5qTHc1dTZxTVJ5T0hWMmxo?=
 =?utf-8?B?WENNQ3V6K1BYMitQd1gydi9ub0pFVExDMmZ5eXIvMUljOTQyZHkyOVUvckFY?=
 =?utf-8?B?bHY2ZzFRMFQwL3ZOdHIrYUxydlcyVTA5dllCcXQ2T0dWSCsxRjRva1lSRllh?=
 =?utf-8?B?dmltZ1lNdWwvSExZN3h6TkE0VjQyL1ZxSlFsZzJmMFM2dUxNVnJHdnZEOUdN?=
 =?utf-8?B?a0JWdlFyOTBpaUZDMnVTemtHYldPT2phOFdEZ1JZeSsyNkZZT1N6R3VzYjBX?=
 =?utf-8?B?N0xhMXllYkM4V3ZCM1cyNisxdEtQNGpCamUzN2hFMDFuWmZaZ0hvcnhQRVBa?=
 =?utf-8?B?K0hnSEhVUVhuYUpWSEZYQXdoSGRlb0kvWE4zYk5LS0JuSmhsblZqOHZlUHZQ?=
 =?utf-8?B?QkdQRGZuR0VMTzdreHcyUG1ROTI2QktDK3RmbFJaRUVzL2VlV1I0b2JVNGNC?=
 =?utf-8?B?MnJablpBb3VhaWpBdlpRMEw1ZnRoS2xaZGM5VS8yRHNrWG00T2l2aHJCb2lm?=
 =?utf-8?B?MnA3ZUNjQkhuUE51M1ZqS2VRQm5CcGQwMmM1SlJuV2k0aFkyWkZTU3lzU2Z3?=
 =?utf-8?B?VGJsM0RsRlNSTHUrbWcvTGcvM0JMZ0tjZkhVb2d1VjNSMVdjZWp5MWVFV1Zk?=
 =?utf-8?B?RDdmb0Yvd1h6WEtjYk9GZjIzUllNcW1HQlNobnBHQWtaakwzbnZ3cFYzZ04z?=
 =?utf-8?B?M1Rab1NPZVNoQitTaDNUeVFMK2trRWNSMXk2RzZNV1VoU251aE84a1dLVENq?=
 =?utf-8?B?bEVnV0lWRHJuOW1POGpscGlHQ01LVFQwZUdYMmtudmZyemhoU0pUQm13bkpN?=
 =?utf-8?B?c3dCM3E4VzJQM0dLcTdmVGQ2aVRabUNjTGFEYVNqbnFLSzJLTTBOM2d5a3pD?=
 =?utf-8?B?WkFWSXc3Z2FvY3oraTlTTExpWlAyZ0RUSUl5dy8xQW5xZlVDYnlrditWc2ZY?=
 =?utf-8?B?YlFtMXdTYXgwUEc2MkVWSEdRbDhwZjU5NHRwRXFMLzFaS2lXTGlGL1F2bmpw?=
 =?utf-8?B?Q2pWczRxaUJJMXQxU2hpeXhnYklxZWgzWUZxZWpCSjRSZW5ZUTQxaGxRMHpV?=
 =?utf-8?B?WUlUQW5kR1VzMWJYU2hPcDJIZjBOYWFsRng2SGxoVjRGbE13MHhGYXZiUzhB?=
 =?utf-8?B?akZiVFNUWmJzemZHdVRsUEl4TE1KTEhLNHBZcjhRRmo5cnFERXRWTmk2UGE2?=
 =?utf-8?B?bW1GSFErUFRUVjIvOWVCRU5CSnEzTDJCME5nZ3ZqM3JxUmUraVBuY1J4a3NR?=
 =?utf-8?B?ZzJHYmpsVUJESzIwNERXYUErTEhxR29renc4Z3pocURWeVdEeDZVSFAzdGtp?=
 =?utf-8?B?MXcxeEd2dE85a0dPWkxHVTZpTU0xV3hOQmNvdzZLOUlsVTIrZWI5SVR4UFZF?=
 =?utf-8?B?T2NBUGlxdHBJQS9GSHJiUjNVSUNuOWR3MFNKdFpnZVpnV0VjS3BKdGc2Kzl2?=
 =?utf-8?B?dGxiV1ZPTSs3bThjUDdWc014TE1kOW80T2xpMnIxNGZKV0xUUjRjSjh3RTBB?=
 =?utf-8?B?MHRDTkFZNFFhYlJnWTRROUdJR0xMTjg5ODdETGZkSSswN3N0cWFZRFE2eUt0?=
 =?utf-8?B?aVFUSWlna3hQSjhMUldxcEJiVDVrTEhLLytlVWVwZkc0OGo1SWRYbUdJYXBk?=
 =?utf-8?B?QVcydlFRZWFqU1BEeFg2Lys3U1JnVHpxV3pZcXdiY3NoWitNNVBPTVhIcExL?=
 =?utf-8?B?SEJsVDkrTUpERDAzWk11ZHZObk1scGVvRlJhV1cxT1E3aGhGWlpKck44ZGo3?=
 =?utf-8?B?TDFhc2M1UExuU1NxVy9xanZNNmhLN0phbjVIS2FTcVFNM3hDUmZqcXVpbmlr?=
 =?utf-8?Q?/lWP/16Ts8OlVmtHCZ3Zb9elC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef28f081-25a3-4eff-4b62-08ddb9157847
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 03:06:41.9669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FSCer0RvffpbVbh8a7rBTuRuMOuS/A93Xw2d6BprZ0xPDBy8DpvsITuBb80zWEqdYgmactbTJ3YyF+9SRz+kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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

SGkgUmFtYW5haWR1LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGln
dC1kZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBOYWxhZGFsYSwNCj4gUmFtYW5haWR1DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyLCAyMDI1
IDE6NTAgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggaS1nLXQgdjQgMS81XSBsaWIvaWd0X3N5c2ZzOiBVc2FnZSBvZiBPcmlnaW5h
bCBkZWJ1ZyBtYXNrIHRvDQo+IHJlYWQvcmVzZXQNCj4gDQo+IEhpIFByYW5heSwNCj4gDQo+IE9u
IDYvNC8yMDI1IDExOjAwIEFNLCBQcmFuYXkgU2FtYWxhIHdyb3RlOg0KPiA+IE9yaWdpbmFsIGRl
YnVnIG1hc2sgaG9sZHMgdGhlIG1hc2sgYmVmb3JlIHRoZSB0ZXN0IGFuZCB3aWxsIGJlIHVzZWQg
dG8NCj4gPiByZXNldCB0aGUgZGVidWcgbWFzayBwb3N0IHRlc3QuDQo+ID4NCj4gPiB2MzoNCj4g
PiAtIFJlZmFjdG9yZWQgZm9yIHJlYWRhYmlsaXR5IGFuZCBhZGRyZXNzIGxvZ2ljYWwgY29tbWVu
dC4NCj4gPg0KPiA+IHY0Og0KPiA+IC0gSW1wcm92ZSB2YXJpYWJsZSBuYW1lIGZvciBkZWJ1ZyBt
YXNrIHNhdmluZyAoS3VuYWwpDQo+ID4NCj4gPiBGaXhlczogNTZiOTExOTNiODI1ICgibGliL2ln
dF9zeXNmczogSW1wbGVtZW50IGR5bmFtaWMgYWRqdXN0bWVudCBvZg0KPiA+IGRlYnVnIGxvZyBs
ZXZlbCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBsaWIvaWd0X3N5c2ZzLmMgfCAxNiArKysrKysrKy0t
LS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfc3lzZnMuYyBiL2xpYi9pZ3Rfc3lz
ZnMuYyBpbmRleA0KPiA+IDJiYTk2Y2E3Zi4uYjdjYTFmMmI2IDEwMDY0NA0KPiA+IC0tLSBhL2xp
Yi9pZ3Rfc3lzZnMuYw0KPiA+ICsrKyBiL2xpYi9pZ3Rfc3lzZnMuYw0KPiA+IEBAIC00NDMsNyAr
NDQzLDcgQEAgaW50IGlndF9zeXNmc19kcm1fbW9kdWxlX3BhcmFtc19vcGVuKHZvaWQpDQo+ID4g
ICAJcmV0dXJuIG9wZW4ocGF0aCwgT19SRE9OTFkpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gLXN0YXRp
YyBpbnQgbG9nX2xldmVsID0gLTE7DQo+ID4gK3N0YXRpYyBpbnQgc2F2ZWRfZHJtX2RlYnVnX21h
c2sgPSAtMTsNCj4gPg0KPiA+ICAgLyoqDQo+ID4gICAgKiBpZ3RfZHJtX2RlYnVnX2xldmVsX2dl
dDoNCj4gPiBAQCAtNDU4LDggKzQ1OCw4IEBAIGludCBpZ3RfZHJtX2RlYnVnX2xldmVsX2dldChp
bnQgZGlyKQ0KPiA+ICAgew0KPiA+ICAgCWNoYXIgYnVmWzIwXTsNCj4gPg0KPiA+IC0JaWYgKGxv
Z19sZXZlbCA+PSAwKQ0KPiA+IC0JCXJldHVybiBsb2dfbGV2ZWw7DQo+ID4gKwlpZiAoc2F2ZWRf
ZHJtX2RlYnVnX21hc2sgPj0gMCkNCj4gPiArCQlyZXR1cm4gc2F2ZWRfZHJtX2RlYnVnX21hc2s7
DQo+IHJldHVybiBwcmV2aW91c2x5IHNhdmVkIHZhcmlhYmxlIGlzIG5vdCBjb3JyZWN0LsKgIElu
c3RlYWQgYWx3YXlzIHJldHVybnMgdGhlIGN1cnJlbnQNCj4gZGVidWcgbGV2ZWwgdmFsdWUgZnJv
bSB0aGUgZmlsZS4NClRoaXMgc2F2ZWRfZHJtX2RlYnVnX21hc2sgdmFyaWFibGUgaXMgdXNlZCB0
byBzdG9yZSBvbmx5IHRoZSBvcmlnaW5hbCBkZWJ1ZyBtYXNrIHRvIA0KZW5zdXJlIHRoYXQgaW4g
Y2FzZSBvZiByZWN1cnNpdmUgZGVidWcgbWFzayB1cGRhdGVzLCBhdCB0aGUgZW5kIG9mIHRoZSB0
ZXN0IHRoaXMgb3JpZ2luYWwgDQp2YXJpYWJsZSB3aWxsIGJlIHN0b3JlZCBhbmQgbm90IHRoZSBw
cmV2aW91cyBvbmUuDQpJdCBzYXZlcyB0aGUgY3VycmVudCBkZWJ1ZyBtYXNrIG9ubHkgYXQgdGhl
IDFzdCBpbnN0YW5jZS4NCg0KQW5kIGFwYXJ0IGZyb20gdGhpcyBub3doZXJlIEkgYW0gdXNpbmcg
Y3VycmVudCBkcm1fZGVidWdfbWFzay4gSSBhbSBwYXNzaW5nDQpUaGUgcmVxdWlyZWQgZGVidWcg
bWFzayBmcm9tIHRoZSB0ZXN0IGl0c2VsZiB3aGVuIGl0J3MgaW4gdW5kZXIgQ0kgZXhlY3V0aW9u
Lg0KPiA+DQo+ID4gICAJaWYgKGlndF9zeXNmc19yZWFkKGRpciwgImRlYnVnIiwgYnVmLCBzaXpl
b2YoYnVmKSAtIDEpIDwgMCkNCj4gPiAgIAkJcmV0dXJuIC0xOw0KPiA+IEBAIC00NzksMTUgKzQ3
OSwxNSBAQCB2b2lkIGlndF9kcm1fZGVidWdfbGV2ZWxfcmVzZXQodm9pZCkNCj4gSW1obywgVGhl
IGZ1bmN0aW9uIG5hbWUgc2hvdWxkIHVzZSB0aGUgd29yZCByZXN0b3JlIGluc3RlYWQgb2YgcmVz
ZXQsIGFzIGl0IG1vcmUNCj4gYWNjdXJhdGVseSByZWZsZWN0cyB0aGUgaW50ZW5kZWQgYmVoYXZp
b3IuDQo+ID4gICAJY2hhciBidWZbMjBdOw0KPiA+ICAgCWludCBkaXI7DQo+ID4NCj4gPiAtCWlm
IChsb2dfbGV2ZWwgPCAwKQ0KPiA+ICsJaWYgKHNhdmVkX2RybV9kZWJ1Z19tYXNrIDwgMCkNCj4g
PiAgIAkJcmV0dXJuOw0KPiA+DQo+ID4gICAJZGlyID0gaWd0X3N5c2ZzX2RybV9tb2R1bGVfcGFy
YW1zX29wZW4oKTsNCj4gPiAgIAlpZiAoZGlyIDwgMCkNCj4gPiAgIAkJcmV0dXJuOw0KPiA+DQo+
ID4gLQlpZ3RfZGVidWcoIlJlc2V0dGluZyBEUk0gZGVidWcgbGV2ZWwgdG8gJWRcbiIsIGxvZ19s
ZXZlbCk7DQo+IHNhbWUgaGVyZS4NCj4gPiAtCXNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICIl
ZCIsIGxvZ19sZXZlbCk7DQo+ID4gKwlpZ3RfZGVidWcoIlJlc2V0dGluZyBEUk0gZGVidWcgbGV2
ZWwgdG8gJWRcbiIsDQo+ID4gK3NhdmVkX2RybV9kZWJ1Z19tYXNrKTsNCj4gc2FtZSBoZXJlLg0K
PiA+ICsJc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiVkIiwgc2F2ZWRfZHJtX2RlYnVnX21h
c2spOw0KPiA+ICAgCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NldChkaXIsICJkZWJ1ZyIsIGJ1Zikp
Ow0KPiA+DQo+ID4gICAJY2xvc2UoZGlyKTsNCj4gPiBAQCAtNTEzLDggKzUxMyw4IEBAIHZvaWQg
aWd0X2RybV9kZWJ1Z19sZXZlbF91cGRhdGUodW5zaWduZWQgaW50DQo+IG5ld19sb2dfbGV2ZWwp
DQo+ID4gICAJaWYgKGRpciA8IDApDQo+ID4gICAJCXJldHVybjsNCj4gPg0KPiA+IC0JbG9nX2xl
dmVsID0gaWd0X2RybV9kZWJ1Z19sZXZlbF9nZXQoZGlyKTsNCj4gPiAtCWlmIChsb2dfbGV2ZWwg
PCAwKSB7DQo+ID4gKwlzYXZlZF9kcm1fZGVidWdfbWFzayA9IGlndF9kcm1fZGVidWdfbGV2ZWxf
Z2V0KGRpcik7DQo+ID4gKwlpZiAoc2F2ZWRfZHJtX2RlYnVnX21hc2sgPCAwKSB7DQo+ID4gICAJ
CWNsb3NlKGRpcik7DQo+ID4gICAJCXJldHVybjsNCj4gPiAgIAl9DQo+IFRoYW5rcyAmIFJlZ2Fy
ZHMsDQo+IFJhbWFuYWlkdSBOLg0K
