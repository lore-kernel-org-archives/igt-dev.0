Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AF8CCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 06:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABA110E12B;
	Wed, 12 Nov 2025 06:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdFFmm6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705B10E12B
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 06:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762929974; x=1794465974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ph9TazaPdUqyUw/5Cn8IiMD/Y610JOTzo5BZTbSyCRs=;
 b=EdFFmm6x9PbH/AUQ6CtaJQKKfxssincleMUq19vJqHXD2T7VPjDJufm5
 XPLor3REcYxb7iL5fRNkDmSukib7AUMUB3QwYnec0KAqYi+onMQgcB6Fr
 GlTRP7mhi+i094xx6nl6wYn9oH/L3TYxFsq5Odv7nnPOIG5IgXbIkSbjb
 ZisDHSULGX137hlvEUo984VdVP4XSJoqJWWfrNa044YQ9bnqIZ/43elxR
 q3D6iQ4gfWBWOhRT9YDOAcVTmbiP4x6k3Lmh7FXhj2kFUWrI5fqi54pw/
 sdQeSHXW05v7ZorgMZ8N3gg3GkUgzhnJNll2p4czNqNYb+1vfCXprzA9H g==;
X-CSE-ConnectionGUID: IUpcmE+NQ+eDhJQH743LCA==
X-CSE-MsgGUID: kGQYl0h1Tgec9NhtDeNOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="63993392"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="63993392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:46:14 -0800
X-CSE-ConnectionGUID: NftVI/Q1TuWOAT2lpOqtBA==
X-CSE-MsgGUID: eLbQNRl8RnWUilB28mKzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="194342634"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 22:46:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:46:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 22:46:13 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 22:46:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yY3m6HXVqPi2MkAvbC4+ngEfiJ3HJiFgyhId1PMYMrIm1uIO8gBW8KY0xJ03BNWQ+Sct4x8twifqAF3+tFKOJPFOb/sZS0FXHTZ+ZLSotaAFN4F9aLsmwQBZriK5lIjKwPw8YRjuCurllzamJF+qreXu8hD0YCTBGBMyFxTPuqF+3K5QY3aGnJu3FIJlTDXxWMVo2qiPCxpRZz9wuCHEHme6mo8IYef3gDO1nF5ByaNmfAEJ6qtBHqso9L7v1NNmv9Kzu6w2YR9Vx1Hxaqg6wXr4o8cy58Fo2xzNxGhibd4NimVXnECCSyvKTnTYDbo7ZpAeXNNNc2xc/TkxmHbUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph9TazaPdUqyUw/5Cn8IiMD/Y610JOTzo5BZTbSyCRs=;
 b=NSAy2/dJj8M13QFlBXSHiQDJc5CX4pNYyaBWVjHinSnGuQCeQYjqT62uUSXuqL6yukDc4ZNBkL5zwqoK7kA7aYINtbSG9k7TKtg1P3DS3V66oUQ3HRRARXF2LtrEKteSIJGQ0a4cQ0rHBlDF++UPwMkpbOYJ3U0PNrFrQWMrfnWZciol7+KrBxwwmAP7nCHSFQK/EUdABf2DgFzAE7OZuoEQK4VjZSW/6dUC+SQ5h1HK5/xxhEFbqWGRsEquHZMs+m2KXfZDrnCeaIyIL7B2BAs+GDTEvqSTAdG5xZ5rrBySqWguy3cwa7tSqs+I673v5cZR+xZri/Pe2pHpvTG3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 06:46:05 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:46:02 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>
Subject: RE: [PATCH v2 2/8] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
Thread-Topic: [PATCH v2 2/8] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
Thread-Index: AQHcT+GJkwRvUJt9I0uhOd8YYCRBC7TuoBjw
Date: Wed, 12 Nov 2025 06:46:02 +0000
Message-ID: <CH3PR11MB84346E0EDBE77D009D8E7A408DCCA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
 <20251107-xe_query_helpers-v2-2-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-2-ec66ba6af1c1@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB6936:EE_
x-ms-office365-filtering-correlation-id: 63e555c9-5161-49d2-0ff4-08de21b7253a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?blo4RHJ1bkFwL3dkMkNFV2dsNCs1eEl6TGNPdnFFSjNnVXprQzByY0pmL29R?=
 =?utf-8?B?UHBpZjh1bzBrS2swMk41cW9LZEludUFxMnZZQzRreVhpZVgxNkNVV29Td1d4?=
 =?utf-8?B?N3pmU0YxWDY0dnFBK2Z2WTNiUkRmcXRPYTQ5M2NWeERzZnNSZHBpSWUxbith?=
 =?utf-8?B?KzVQOEVEL21EWEpaelNHYWduZDdNLzg4WVE1Ui9TSkd5czIyZ2xiV3pzR0VE?=
 =?utf-8?B?MVdJSUdVZHlKa1piOS9lTllvSDl0amNvRFYxU3lpRHg4SnQ3bEhkVXM3MkxT?=
 =?utf-8?B?NXkzczFhSjBQUGlhdEdiZmRYQ1o0U25jSkdmZGZobE5vWC9TeVV0MVprRDlG?=
 =?utf-8?B?OFhvcllkWGpERDdXeTFZaEREOFY5M0hDY3ZwQnBzUHIxSjJiT25raWlvcHFo?=
 =?utf-8?B?Q3dvY0Z4TUdaTFNibVdOd3hNMjFqQTZqUmpLY2U0b05mNU42TG5LbmM0WmZF?=
 =?utf-8?B?V0IwVGo2L3JQb2ZvcUxYbVNRVlB5aWRBV1ZJMm9DdUNNaGFQUVIrek4wVHhS?=
 =?utf-8?B?Nzg3VzZTek1yblpKaHIxL3MxTmdETVMyMzk1dVgrYklrZWlhajRCbTlMN0VG?=
 =?utf-8?B?Wm12Szl3amt3TXZUQ0l3TEFaUVJOSEVZRmhacHMxS09aa0N1TkM3Sy9wVDZU?=
 =?utf-8?B?TlY3dWtPTjg0NWtMUlYramRtNm1za1hYM3B1RzhycUtRbFVoU29uVDJkSS95?=
 =?utf-8?B?b29LdmN5M0RyNlp4d1krdDh0VW5XK1plNDZ6SEpmdm1JcmNEcEJGWkI3NVEy?=
 =?utf-8?B?eTcxQ0Z6RXMvSG9ybVZxN0FLckdKYkQyU1hQMWxsU1FVSU5EUDhXVlVLNDg3?=
 =?utf-8?B?cHJ2bFlTalVUcHRDUERPV0hKLzYvSjZhSFRLb2EyaWd5Smh3VUUrYkpGT2Zo?=
 =?utf-8?B?UElZRDhFS1haVFQ2TS9qbHpJYjFwUkFVL3FPdzlOU0tVYXM2c2VRY2pIZTRZ?=
 =?utf-8?B?NkVqTTNSa1RKREFONHBlRDd4UFIxZTdUZklQUVdPY2h1QW1OZ01Xby81Wnor?=
 =?utf-8?B?a21OK2dJOWZsL0lhd3JERG5NMVRVaDBXUS8ySkZvdTBhR3NUc25aeGhIcFA1?=
 =?utf-8?B?TitiMEFmTWt1TzhTeXVBR1JrWk1lYjdDMGhMdWkwTmlNWkdwZHFkazVYbzVi?=
 =?utf-8?B?ZUdiVysvOHplajdITmZDUkJqQTZEZnJ0MFU0MjV0c3FyNVh5aFJweDNJa25D?=
 =?utf-8?B?L0sycWJvdHJZWWNQYUhua1daaCtzTHZNaUZPNUc2N040cFBNZGJvTVBIRVFm?=
 =?utf-8?B?aUp1VmpmaTNGMDRJUkxhbXZZNGhZVUpjeDN2Wk5yYVMzdW5iUmpyVkJwdDlU?=
 =?utf-8?B?ZnpvTWtlazdCaUZZbnRKdHdBeXpjSUxxOExLNVJBMmIrQ0RLaTNnRWRLcEhw?=
 =?utf-8?B?K25MelRpT0drc0ZkUXQ3VWlxUFZzODUyN0hraHRlcW5hRWV0c05zL1ZOTXgv?=
 =?utf-8?B?SFc1YzJPTnlIMFd0b3VzYTBCRk52dTBnWEFoekRRK3FWZDlINThNNm5KbDdp?=
 =?utf-8?B?UkQxeWdzMG91N1gyUU9DTGZMR2tKZXZtRGhHZlgxK3BydjVURlE4b0dBNkVU?=
 =?utf-8?B?SDZwUE11dXQyVzlKTWxRb1BrNFhtbW9JZWJLOXd2RkRwMmZqT1QxWmV1bFNS?=
 =?utf-8?B?RVFteHpWNU93MDhZZUQwbEFJaTRhOXdFOUo3QW92L1E4OUFrb245dGlMa2V0?=
 =?utf-8?B?WGQxdGZGa3lTdlVxSnk1MUgwVUJXb2trWG4reDdOZy9ZUVVmcjgyWUhMWWpW?=
 =?utf-8?B?MjlITFJKWVdhL1Vjd1JoOHBpSHlKdTYyRDZDY2Y3bDN3WVQvMkFxR1NCWUdK?=
 =?utf-8?B?dlVmdys2VTd4bitXc2JXMC9Nd2VHKzFIL3M3ZzRXVlJuRlhzUXNUWVVjN1Qr?=
 =?utf-8?B?czVrSFZCaU1IM21jSXBrYzNiaXVIZW5JMk5ZVE9raStVMUhFSWZ1NjBNSHJZ?=
 =?utf-8?B?QjhwbTR2RnM3ZlBGV3BxVDJienpuZ2cweTh5K1ZxenJJc1VsaVhneEhjYkYz?=
 =?utf-8?B?M3plZmd2UytFNlY0Mldjb3FONCtrU3dRVFk4enVpSEJBMVZIcjBpa0QrMHM2?=
 =?utf-8?Q?AEo3CP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1VYWXBpS0h4cWFoT3NaZHY3TXRNMk4xd3d0TnhhUVRvTjhjS25LMk9QN3BH?=
 =?utf-8?B?bkdCV0tnT1liMytlUXo2eWMyQ0JwK3VTcWNmR1RhK0NDZDkwdW1NR1JzVEJQ?=
 =?utf-8?B?dXkxbHBtdjZxVlFVV3lkb0VvOWtDOTlQckgrTHJrTEZWZ0ZiNGdHL2g5aDdo?=
 =?utf-8?B?aTZuaUdpRERmTXFmOUFnYzRmbGF2NE5yVXovWXRDNU5oNXo0S085OHY1WmVx?=
 =?utf-8?B?WVU1ckE5ZVZjN3BYWkMxbm12aE1QdlVKTjAyMXJuUFdEOTVqcFRwZ0NBbHJO?=
 =?utf-8?B?eFFCM2RUem9JOFFRcmFtZkR6RWtLbTF5M1JnV2h4SWk1MnI2OTlCOHdoOG10?=
 =?utf-8?B?UFlNWldacm9OendlVmVWa1BWL1h6RTUzaFdBeUg1djRCL2U2akU4aTF6TC9D?=
 =?utf-8?B?YzNRaklIcWhDKzlqMEJhZjFwS1RrZEVvQzhHVjhjVERObEhMVjBOYURXMlFS?=
 =?utf-8?B?SnFMM0lpL2VKejVaSUVBb2FzTWRMOVYwV2YxYndFMmRUL29QZ1h3MVFDNlYw?=
 =?utf-8?B?ZGhiZ2Y0Wk1KdTQ2RitxS0RzUU05bENXcHFVVmthQjAvZnRKV29mU3JGbkE1?=
 =?utf-8?B?NDZQaWRGdHhWa0NGb3h0SnIzR0ZIMEpBeEo4eHZQNHBKOFd3YlBqRE1ZRU1y?=
 =?utf-8?B?M0tFdGlNY0NZQ09yZm41QXJzL1R1NUJQTlFKemJaVXZhL2dERytKbUhXMFFM?=
 =?utf-8?B?RTgwUFZMTFRmUjkvVVhyekRydXVhcmozTENRYytzMi8yYzd3anNLUUJJMXo5?=
 =?utf-8?B?SmhKSWlONnBFK3U1M3Roc2Y5TkJISnVoOXY1eUZESzRJdW53bExRdElHeFll?=
 =?utf-8?B?VlFQK3NPaXlBalMrVmZHQlFkMm04OU95U2I5OUxTK044ZitpMWlBanF1WDNI?=
 =?utf-8?B?ZXY0RjFXMlNZK2ZJbXBrMERCT0xyUTZMMWFhc2lkY0daL1ZwbmduZ0NQRk5y?=
 =?utf-8?B?RmJNclBibW9IVEZ2d2NpSVNWTzYweXlYeDBqNjAxUnFYUjk0TzRFOTNnQ0t5?=
 =?utf-8?B?b2dRWUhzakZwZXk0bEZ1eThsZ2xkY2dlTW5NRGhZWWhMcXNDQWtrcEJad2hv?=
 =?utf-8?B?MzlFUzlyMXdMczE3Zlh4dENRZmRsRGxpL3ZjUDVRUXlMczlYV2Q3Nmlvb2Y2?=
 =?utf-8?B?U0tqTUs4Q3pBZldFem9kcis3K3FoUktTMUk3S2tpTStDcDdjM2dhdW5sYlE2?=
 =?utf-8?B?TzFkYWRaU3FNeG9nWCs2UWtkbFNHaUJCeEV2SjJ2WnlZZmdib3QzRHQ0WVFR?=
 =?utf-8?B?eWFabE5TdGJabWxxNWZNZ1U5RVcySmdvSE82UFBOV1BKd3M2VHBkMW5yMUJu?=
 =?utf-8?B?ZU0zMnRRb2t2d2dpWDlnUUZoTDhSNWNBVnNucUlBQ281R0JCWlZIS3phSGZK?=
 =?utf-8?B?LzMwaE9sQ1R6WkM5WW4vWHBTRFVFSjhRUCsvK1hZSUdNTlplY3l4T0EvTk50?=
 =?utf-8?B?Wmc1QUtJa2NhMWlvNVRHTnNJMXB6L3A0MC90cnZTL3l3Z2hZNWg1djZHd25w?=
 =?utf-8?B?WnVMME5DVzRwWUFXdDdsaUdKUTJMV3lmSjZyb3p2MnFPYksxY1o3UGFtL1Ri?=
 =?utf-8?B?dkhPZElleXhCTWQ2QkVNU3MyMkRPSzNsVUpoZlRRbXlyMzhqYytzc0JMY0c4?=
 =?utf-8?B?ZmpyQ0lKcFNHNHNFVzY0WEN5NVVDYUQ5V3hoS1lrczVxRm4rYjBZeDBMd1FC?=
 =?utf-8?B?eSt2YzFObG45Mk9JSXdPQU43eVYwTHVKb1gyOHRzdGgrK1R0Sm9MUmNkT1JC?=
 =?utf-8?B?OWtIc3Irb0hEUWJldlBGZTVXam1QSlNqRnVjYW56aitmTXF1M0oyQ0R1b2th?=
 =?utf-8?B?bUhoQS8vUFVVdmJJdjhQUG1aWU1PU00wazV6SlZ1THQ5bFZJVTNqT0diM2Z5?=
 =?utf-8?B?eGVOVEJSZUt5OXVicm15eXkvQjVOQ1JaalN3b0lMSUhtSjkvR2hvcGhTbW90?=
 =?utf-8?B?RFF1Q0tic2N4OGVnKzJBcWZjdW5JVzRubVlsWDdaeENiaDFPMXBEOXNsUW1Z?=
 =?utf-8?B?eUVseGhHRVFyNHVSUGprcklhTzNldmRmK0NSQmNIWENyZnF0RGlHa3ZobjUw?=
 =?utf-8?B?QmR0RXA0ZXAzTXNxZ1NqRVo2Si84VHNRQ3hicmx0SjdNV3NHdXl6Vlg3L1Fj?=
 =?utf-8?B?VUFZWkJXNkNWU2R1NmVDNTh2RjdxMzZRRCsyNE1sclRIRWZkeHY3VDFSS3RF?=
 =?utf-8?B?VjBSUUNDalFTVzBmMnpabEZ2QmVtQmhVTXlzMFcvV3d6WVBEUTJlb2VQRTVY?=
 =?utf-8?B?aEdKc3NJTEJTd2NmUmszeW5VbG5nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e555c9-5161-49d2-0ff4-08de21b7253a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 06:46:02.0162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P96pmos4w0VnOkKnPAlyDreBVAFGIK6ZvEIZugpGXhfPNs8WpQ3DFY52eYRvxE9k+FQy4dWsN/NqvjIj2Y8KaP+pgycpTDi0y7jT7lsdbZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFuZHJ6ZWoNCj4g
SGFqZGENCj4gU2VudDogMDcgTm92ZW1iZXIgMjAyNSAwNTo1MyBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVj
em55QGxpbnV4LmludGVsLmNvbT47IEhhamRhLCBBbmRyemVqDQo+IDxhbmRyemVqLmhhamRhQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDIvOF0gdGVzdHMvaW50ZWwveGVfZXVkZWJ1
Z19vbmxpbmU6IHVzZSBoZWxwZXIgdG8gZ2V0DQo+IGh3Y29uZmlnIHZhbHVlDQo+IA0KPiBSZWNl
bnRseSBpbnRyb2R1Y2VkIGhlbHBlciBtYWtlcyB0aGUgY29kZSBjbGVhbmVyLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYyB8IDExICstLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gYi90ZXN0cy9p
bnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIGluZGV4DQo+IGUxNTE2YzIwMmYxNWQ5YmI5MGQzY2Yw
ZjZlZDMwNzAwYjU0NzlhZjkuLmVmNzAwYzI1OTEyOTFmOWEyMjg0OWMyOQ0KPiA5NWM4M2NjNWVj
MGFjNmQ5IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+
ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gQEAgLTExODIsOSArMTE4
Miw3IEBAIHN0YXRpYyBib29sIGludGVsX2dlbl9oYXNfbG9ja3N0ZXBfZXVzKGludCBmZCkNCj4g
DQo+ICBzdGF0aWMgaW50IHF1ZXJ5X2F0dGVudGlvbl9iaXRtYXNrX3NpemUoaW50IGZkLCBpbnQg
Z3QpICB7DQo+IC0JdWludDMyX3QgdGhyZWFkX2NvdW50X2xlbjsNCj4gLQl1aW50MzJfdCAqdGhy
ZWFkX2NvdW50X3B0cjsNCj4gLQl1aW50MzJfdCB0aHJlYWRzX3Blcl9ldSA9IDg7DQo+ICsJdWlu
dDMyX3QgdGhyZWFkc19wZXJfZXUgPSB4ZV9od2NvbmZpZ19nZXRfdTMyKGZkLA0KPiArSU5URUxf
SFdDT05GSUdfTlVNX1RIUkVBRFNfUEVSX0VVLCA4KTsNCj4gIAlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5
X3RvcG9sb2d5X21hc2sgKmNfZHNzID0gTlVMTCwgKmdfZHNzID0gTlVMTCwNCj4gKmV1X3Blcl9k
c3MgPSBOVUxMOw0KPiAgCXN0cnVjdCBkcm1feGVfcXVlcnlfdG9wb2xvZ3lfbWFzayAqdG9wb2xv
Z3k7DQo+ICAJc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgcXVlcnkgPSB7DQo+IEBAIC0xMTk3
LDEzICsxMTk1LDYgQEAgc3RhdGljIGludCBxdWVyeV9hdHRlbnRpb25fYml0bWFza19zaXplKGlu
dCBmZCwgaW50DQo+IGd0KQ0KPiAgCWludCBwb3MgPSAwOw0KPiAgCWludCBpLCBsYXN0X2Rzc19p
ZHg7DQo+IA0KPiAtCXRocmVhZF9jb3VudF9wdHIgPSB4ZV9od2NvbmZpZ19sb29rdXBfdmFsdWUo
ZmQsDQo+IElOVEVMX0hXQ09ORklHX05VTV9USFJFQURTX1BFUl9FVSwNCj4gLQkJCQkJCSAgICAm
dGhyZWFkX2NvdW50X2xlbik7DQo+IC0JaWYgKHRocmVhZF9jb3VudF9wdHIpIHsNCj4gLQkJaWd0
X2Fzc2VydCh0aHJlYWRfY291bnRfbGVuID09IDEpOw0KPiAtCQl0aHJlYWRzX3Blcl9ldSA9ICp0
aHJlYWRfY291bnRfcHRyOw0KPiAtCX0NCj4gLQ0KPiAgCWlndF9hc3NlcnRfZXEoaWd0X2lvY3Rs
KGZkLCBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZLCAmcXVlcnkpLA0KPiAwKTsNCj4gIAlpZ3Rf
YXNzZXJ0X25lcShxdWVyeS5zaXplLCAwKTsNCj4gDQo+IA0KTEdUTSwNClJldmlld2VkLWJ5OiBQ
cml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+IC0tDQo+
IDIuNDMuMA0KDQo=
