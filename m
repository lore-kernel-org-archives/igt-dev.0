Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B0BCFC60F
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 08:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6574910EA70;
	Fri, 11 Oct 2024 08:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnMByuQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F4410EA70
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728633677; x=1760169677;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xapa96eZdqBE0w+b1eo8/1oWw2K9W87LMpeFoAQ8HLw=;
 b=lnMByuQnp3YcToBVAo/mzAhKAwu36XV8tlG9Ut27mAJDYklhpVE/IJSG
 tKWNildXmsn7E68RgNFNYfj/nPukfegnLvWXuHEZwoytUmBznzBvHFECP
 6Dp26S6BVUyQNbJkFmXNzb4DU+7RkkcFnIYbrpFKMNzpaqWs33P6/FQji
 ypwokOQe8wJP10a+TUyFAK538Qxr6BX9U56Lfh71MCN7R1doclsGflWef
 VmM4IjBi0ZNIIyGtnbRl9nTTn81IbaHhF5AELZWTF7Kw0jhS1LH15yYD+
 KovoYZP89fa318Z9pXXB4vDCUeXV4dOKp++02ijFM+CQhxsjThio1W7BZ w==;
X-CSE-ConnectionGUID: YKIp3z4HQlSfV0GEXQjKBw==
X-CSE-MsgGUID: BODChH4jT6qSs/EFwj3XJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31932948"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="31932948"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:01:17 -0700
X-CSE-ConnectionGUID: Tdmjt88DSuWrOihsDmxZ2A==
X-CSE-MsgGUID: tvwLSf6rSUu2Zcj4t0DZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="107570849"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 01:01:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 01:01:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 01:01:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 01:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8rQNH+ga+67KH6fwsV4F7HGNwfxTY1McTYgvu26h6t6zuFwoxzhX+d2AWjQGCuDf91xX4mfysIZZjh/q9B6DR4Tl0EWw2w83y6y+yVnHxBvMm8VpGjy7k87OxlwnAYsTnz1PSyosnxaNyEi78B/b6Xh5F1qoqyeHwsL3BilLe+j05bamPcfFLYtdJgvMp6l86KpBZMNQUBAMul60Lk7Z//OUI8zck9fA71/nhPi96q7uwUtWfkbrGMjcba7PlBYxlxtuZ5Up0hFMwy2johfiO+g5hMmWhXFxkloRc+rQLXpGeQP90paxj+kz5o0gS75jLOWB2CLKaKNEhpY9nFncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xapa96eZdqBE0w+b1eo8/1oWw2K9W87LMpeFoAQ8HLw=;
 b=ugOUgHG7RBl7RixsbKa3MmDVTUW6xUuNWiGTVZXJeuhV5mzdxD4q0PG9oCJ6P6vG/VnfpAX91ew0rxwAjMfY8F3aAgXqtHdCmby/HO6oO5GygS+VqnuDnkThkLJKVaCdulydldONV2WXsF3WXWZDPrnrkFDN9wcE6FJAX3NB/40gaEvI4Y99psg8XHZV7JZyE9FHP1XHaBZFOU/nNUdpQe79KP0BV5q+nT0sM3Y3ezcVZIuON+x8P4DhbCqqsEkcP4x0SBzmlcyPITMmjZT/o71VG4lS/dkmVjeLAgKlzdlirfzKnXpIy3LKH0YrAlElbTjJ4wpjDGaU9J0SGjo0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 08:01:12 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%4]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 08:01:11 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBHaXRMYWIuUGlwZWxpbmU6IHdhcm5pbmcgZm9yIGludGVsOiBp?=
 =?utf-8?B?Z3RfZHJhdyBhbmQgaW50ZWxfYnVmb3BzIGltcHJvdmVtZW50cw==?=
Thread-Topic: =?utf-8?B?4pyXIEdpdExhYi5QaXBlbGluZTogd2FybmluZyBmb3IgaW50ZWw6IGlndF9k?=
 =?utf-8?Q?raw_and_intel=5Fbufops_improvements?=
Thread-Index: AQHbGM8dOpDjQefPFU+vbUz5B30wk7KAZxuAgAC9u4CAABBpkA==
Date: Fri, 11 Oct 2024 08:01:11 +0000
Message-ID: <IA1PR11MB60971BC37E4EB18EE4D5D70486792@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <172831556479.1199107.12823113622696577179@2413ebb6fbb6>
 <Zwgt2ay9A_cRL3Qn@intel.com> <20241011070017.f7gnnoaxi4g56b63@zkempczy-mobl2>
In-Reply-To: <20241011070017.f7gnnoaxi4g56b63@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CO1PR11MB4818:EE_
x-ms-office365-filtering-correlation-id: c6f16276-a411-4eda-3e42-08dce9cadf4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?THh6UHFGbGVGNGp6UCthbnN4ZXdPYitIS3RySVdHZXVUMVJ3L3d3WDMyQ2Fo?=
 =?utf-8?B?b2N4ZFdsamQxODdVTDZYZ3JPR2xud3NuNW02dnJVVkhMYUlvbmY0dlRZelox?=
 =?utf-8?B?M1dhaDRqSnhmUVd6ZHFDcXlPOXlReDJJWEhZVTlINVhwQU84NDdlM0QvcmZr?=
 =?utf-8?B?NEZwMGFQMUJTRkphTEpsU1JzTHBXZGh4cmM1TDdIVmZmZzRWL3R5SXZoWGRI?=
 =?utf-8?B?c3VWS3ZkZ0JWc0FramRoQnVyR1g1RTRwdVZqWFVQcjVsY2R0MkpPVG85K3Zn?=
 =?utf-8?B?K0NOcGpEcWxrMFZURUgzWTNhV1QxOTJDb0ZTZVcvZ1FxeXNqNFowQ0VXU3p1?=
 =?utf-8?B?ak9DK3pENWdFSU5XMGRvdGFTeU5kelUwdExjTWt1UlNQZ0NTcW9odm51dkZj?=
 =?utf-8?B?RkRuUmF3cHA4RlI2NVdGSEpReWpTVkFVdEU5NUVkd2lZK1Exc1RSYS9Bdm1u?=
 =?utf-8?B?ZEFwTlRuRE1OdG01TGtDSFNJbE13SVdpc0JsRkFibkpwUXBNaGJvRVg2Nkhx?=
 =?utf-8?B?alUvalo5NUk4cEUzcG1vTDFpRHN6RGQxOVlIbTFodGFzYXBYdE4xVytaOVla?=
 =?utf-8?B?SDZERDNMSlNIdVRabmNSRSthL3o0MWRSNmNaZHpUSjUyTUdYTEt5aWh2djhi?=
 =?utf-8?B?bnNRNjU2VUVka0xtZjAvS05tdERHTlorTmZQalpuV2VXalA0UUFlWFE4L2Jh?=
 =?utf-8?B?UGY0TGxRcWVvdGVIdDlOeFRnS0lMTFN6d3ZCMXBjZE5oY3ZIMUNWLzhLcXJT?=
 =?utf-8?B?Tk9CS2xUZGRpV0RWelU5NisyRDJHTEhtTWJxR0drZVExdlF3aUdXN0N3c0Zh?=
 =?utf-8?B?SDFCSm5OK1JaRDVZTmVyNGkxVTA1RWFkdnBzOC9jUmMrbkNWTE0wWXpTU1ZO?=
 =?utf-8?B?N2hIaDdwZDZwS3VFOU0zK0l2enFBUUdpaERraEhJdDVzR0pUbktjdHNnRzFN?=
 =?utf-8?B?MDR6b3FkUzhIK3JGaXlJdGYvTndCWDlWWEpsUjBXZ2s2NkFUUlJ4WUVoWTky?=
 =?utf-8?B?S1dySGtiZzAxbUZLOVlCZUFiM1dOQjdmaHpuMjNyS0FWMTRxaWs2aTkzMHhu?=
 =?utf-8?B?UDRwdXU5VkhMOWFZcHZGU0ovZCtLNkErY1dJZTBWcHR4VTlZd0wrcXlGSWdz?=
 =?utf-8?B?TjRxY0RqTEhiMlNBU0ZQblpJSnEzalE0Ky91dTZ0L0xwd1FzV3dQeE1uM2Qv?=
 =?utf-8?B?V2F3UXRBbG5rMXlRY2cvS2V1STRVSWRIL3htMFRPc25LOVJ0Q1cyOGxVaHFh?=
 =?utf-8?B?ekhPbVNjdDZnVmE5R1lxNGErdnhpcG1CYTdKVWxDWkNjVngvVU9XbG0rekha?=
 =?utf-8?B?VlUxTTU3MVZOWGhoNWhtNEpGemU1RXcvLzg0STljd1ZBVmdRVWZqdUFLOVdu?=
 =?utf-8?B?SFFhSHArRCtNOTIrRXFaZkx0SW84aklJenBTQTBBazJqT05DcmtmSTBnNThH?=
 =?utf-8?B?M0V3NTdaRHk1SXNhSS8yeHdCU3UwTjN4aVY4ZFg5TjJOb1ZsdjNHeDY0d2RI?=
 =?utf-8?B?YVgzVG93SXREaW9nOHdjZXc2QU1pZDN0YkZ5Y1ZNd3h1QkxvZm1wZzBmdDdF?=
 =?utf-8?B?R1RCb2ZwM2ZiWVZUTUNQR3Z2SUtxeVd0bmpvaDlXNVQxOEpBdWR3T3Q3MFh3?=
 =?utf-8?B?cWNTNDVKV1pTZFAzOFBPUDRnTkYzOG9oKzEzQ3AyRGRMc0lzYmJBUVBzTlB2?=
 =?utf-8?B?RDc3TXY5cFVxL0NaeWV3c2hOWGZOZFBrc3VUZjVSdmdIZldPMDRlVmMvVmk0?=
 =?utf-8?Q?mxoEN9nlmr/TF68m/g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVNIZ2xSNXAvTEdQdHR3d3BHT0RBc2JYWTZaYXY3VndIcUY3UUVLNGtOYzk1?=
 =?utf-8?B?cENBbWR6WFFmZENDelhPaDNzZ1UxMi9aeW5qcW9EdUNrd21kQUdYTzBCRytJ?=
 =?utf-8?B?dnJmMm9LdTNHZlNhcXU0c2RkREJVeUVTMEtoTVhEd0U1bDlsK3hmQS9heVN0?=
 =?utf-8?B?VGpGNGZUWHZOVVNxbVRpMTNXMDl0aVRsTjJMeVpyeXEwTnRuS21sVnpDS0dR?=
 =?utf-8?B?Z3dKYVA1cEF6WFB1MElSU1F3ZjQ5eHliWkE1VzNxNFh3WU1pK3grcHl1VGhm?=
 =?utf-8?B?TjZJSllFM1FTa29pN2MxazUzL05NUm5ndXNVUUlnWmhyeDRCVU8yZzJEMnF3?=
 =?utf-8?B?TkVCdXM0Y3dNcWdwVTVKd1pOeHhSUjFYWG9STlhxMjJHTEhzSmQ0T1BvUXh5?=
 =?utf-8?B?bEpnTkhCa2VndGlMcVdpWFJIVHpnU0MzMjhjUkJlV0ZvVnR6NHdRZldPcDZz?=
 =?utf-8?B?eWpwOXJZK2NrOWZxR3BIMzhobzhLMlFqT0x1RHRmVk44V0J2R0NqcnRra2c5?=
 =?utf-8?B?ejdCR25TTUJ4ejN2WW1Ja2FzRUZ1M2VTMzkwb2pGNnhVL245MkVPTHo2cUox?=
 =?utf-8?B?NVR1VUFzcDF1ZndUc0wxTHF5aC9nZWx6RVAvRUZScUtFV0Z4RWpaK2JhQklN?=
 =?utf-8?B?WEZ2VzFtYkRWUkJqMnZlNTVaUlNPalF4bys3eXJyOSs5T3R1alJ6NGpuQURv?=
 =?utf-8?B?VnFnenFkVzdza1FPV0VTUHIwVlJ4eXhWVGNFN210NUJmVzJwQlZSWDRZL0ZL?=
 =?utf-8?B?YVRuZU1PQmRjVjBKRHZkQWlYWCtzdzZnUmpyOWd3VWNJbHg2Wi9QODZaemFo?=
 =?utf-8?B?aGlDOVRmVFRjbHlmcXNhU3RtQ2Y3NWdaN3VoYUZXTkJMS05pRXV3b3REOVVx?=
 =?utf-8?B?U0RQaFBCRlNUR0xvR0wvaHlISW5OWjUvb3lkWERsaEdUTXArbkJVUlBGdzR0?=
 =?utf-8?B?aVhBbU5CTW96dlhsMDRxL3dMMlZPbWFab3h3MDBhWnI4Q3dwN1Y0V3d3Vm05?=
 =?utf-8?B?ZzNJQWx2TUtud2FmdEJuTHRINllOSWxPYkhVMXcrNmZUSVJGU3hxd0xOcjBy?=
 =?utf-8?B?U0ZaUHFmbytnb0VZRkpMdE5kWDU5c2ozSDBYT0FZYmI4bFJ4SU1BdEcrNFk4?=
 =?utf-8?B?Z1Rwd0g2RXJYM1d1NUY3aUR0L25Oc21zNXNOTWc5dkw3d1dxMTM0ZitPWlZJ?=
 =?utf-8?B?WTBVcnErMTRwNGYvRThvaGZpZldxNld4YnNZQlNpU0p3ZXlhM0tlVVlrbjR5?=
 =?utf-8?B?WTlMdGdmNWdyQXgvaEJ3anVUdjcrQWkvbGpSa3JkaUhldDBKVjJYa2lKQ3hD?=
 =?utf-8?B?eEJYU0MrRFd2WXdUMitFTzRPOXVCK3ViMGFFTzRIL0pLRCtLdWFmYjdkTlFU?=
 =?utf-8?B?ekM0YSs3QWhrMDIzdmZXV2xwYU5ZcmFoeUxCNHFIN2hPTkdFRm83bGpadE1Q?=
 =?utf-8?B?YzhreXhFd1lqb2lHRzdkbzU1bitVMFJKN1FzVlEwMGFwYnU2SnU2VnJNQWV6?=
 =?utf-8?B?U1Bka3RVMEhKUzQ5Wks0ZlVkWlQ1QnR0VTFjRVh5RmlBSThUMUdJK0ExQU9o?=
 =?utf-8?B?ei92MGVrdlhyNXFHenMwbW1iVzllS2pHOHlqZFhtbXBkelVuTmMwQWVkaEpm?=
 =?utf-8?B?eklCamVGQkVURzN0bGlxbVNRTEpMTzJVTFZkNGlMTmRJSVdSZ3U5eXE0UGFw?=
 =?utf-8?B?UkVseml5ejc5K1lHS0Z1SDZNa0RUSXV5V1FNek1laWdQcTZBT1N0RktvWVo3?=
 =?utf-8?B?N2RqM01XT0NSNTVNa2ZMWHBEV3FRaFc0S3dtU0JvZmhVZUxFUU1VUTdXbXZv?=
 =?utf-8?B?NFVVZERpYXVDbkYvWWgzUkZEYkpzK0hlR01reHQyb09aNG5jNlpvNUZWV3BF?=
 =?utf-8?B?YUlqNUhRTTlMTVhrVkxkRFhvNXBmbU1FZm5ycEpCVEdTRW5SVXVBMnFmMnJa?=
 =?utf-8?B?aHFlUkRvQUZIL0xaeWtzZEdzbnlxamo5bjFzSW54THhtVktHeWRXRitxWW03?=
 =?utf-8?B?L2xsUUptQVQwMUUwbmdNM2c3MCtWVklnMVo2Zm9Ob2ZLODU1cEszSFFnVzVi?=
 =?utf-8?B?SFpPUkxyT1ZPYmpJZk5KaGxGNGtBR0kvd2loaWdiNU9GcFpvS1NUaHdDK0dp?=
 =?utf-8?B?d1gxNEkxRmpoTUozMUlOeGk1QWxNSG5hOXAzLy9QUko4NGRXVHdjTEIwdzRV?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f16276-a411-4eda-3e42-08dce9cadf4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 08:01:11.8400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azhkbpYa0PhapFiD1IF6mS+9hxXl0aQV3TrDWC9o8NSufNbcjm3V0xq1nBsD10XCPADd1A35CVyoatDx00u/zK39g1I0Sy6xvp3coQRlCw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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

SW4gdGVzdCBkb2N1bWVudGF0aW9uIHlvdSBhcmUgcG9pbnRpbmcgdG86DQorLyoqDQorICogVEVT
VDogZ2VtIGRyYXcNCisgKiBDYXRlZ29yeTogR0VNDQorICogRGVzY3JpcHRpb246IFRlc3RzIHdo
ZXRoZXIgdGhlIGlndF9kcmF3IGxpYnJhcnkgYWN0dWFsbHkgd29ya3MuDQorICogRHJpdmVyIHJl
cXVpcmVtZW50OiBpOTE1DQorICogRnVuY3Rpb25hbGl0eTogdGlsaW5nDQorICogVGVzdCBjYXRl
Z29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQorICovDQpQbGVhc2UgYWRkIE1lZ2EgZmVhdHVyZSBm
aWVsZCBhcyB3ZWxsIGFzIHRoaXMgaXMgbWFuZGF0b3J5LiBGb3IgJ0RyaXZlciByZXF1aXJlbWVu
dCcgaXMgaXQgc3RyYW5nZSBhcyBJIHNlZSB0aGF0IHVzZWQgaW4gbWFueSB0ZXN0cy4NCg0KS2Fz
aWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGlndC1kZXYgPGlndC1kZXYt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBaYmlnbmlldyBLZW1w
Y3p5bnNraQ0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDExLCAyMDI0IDk6MDAgQU0NClRvOiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KQ2M6IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyXIEdpdExhYi5QaXBlbGluZTog
d2FybmluZyBmb3IgaW50ZWw6IGlndF9kcmF3IGFuZCBpbnRlbF9idWZvcHMgaW1wcm92ZW1lbnRz
DQoNCk9uIFRodSwgT2N0IDEwLCAyMDI0IGF0IDEwOjQxOjEzUE0gKzAzMDAsIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToNCj4gT24gTW9uLCBPY3QgMDcsIDIwMjQgYXQgMDM6Mzk6MjRQTSAtMDAwMCwg
UGF0Y2h3b3JrIHdyb3RlOg0KPiA+ID09IFNlcmllcyBEZXRhaWxzID09DQo+ID4gDQo+ID4gU2Vy
aWVzOiBpbnRlbDogaWd0X2RyYXcgYW5kIGludGVsX2J1Zm9wcyBpbXByb3ZlbWVudHMNCj4gPiBV
UkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTM5NTU2Lw0K
PiA+IFN0YXRlIDogd2FybmluZw0KPiA+IA0KPiA+ID09IFN1bW1hcnkgPT0NCj4gPiANCj4gPiBQ
aXBlbGluZSBzdGF0dXM6IEZBSUxFRC4NCj4gPiANCj4gPiBzZWUgaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2dmeC1jaS9pZ3QtY2ktdGFncy8tL3BpcGVsaW5lcy8xMjg1MTEzIGZvciB0
aGUgb3ZlcnZpZXcuDQo+ID4gDQo+ID4gYnVpbGQ6dGVzdHMtZGViaWFuLW1lc29uIGhhcyBmYWls
ZWQgKGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvaWd0LWNpLXRhZ3MvLS9q
b2JzLzY0NzQ0ODY0KToNCj4gPiAgIFsxOTAwLzE5MDddIEdlbmVyYXRpbmcgeGVfdGVzdHMucnN0
IHdpdGggYSBjdXN0b20gY29tbWFuZC4NCj4gPiAgIFsxOTAxLzE5MDddIEdlbmVyYXRpbmcga21z
X3Rlc3RzLnJzdCB3aXRoIGEgY3VzdG9tIGNvbW1hbmQuDQo+ID4gICBbMTkwMi8xOTA3XSBDb21w
aWxpbmcgQyBvYmplY3QgJ3J1bm5lci81MjdhYTlmQEBydW5uZXJfdGVzdEBleGUvcnVubmVyX3Rl
c3RzLmMubycuDQo+ID4gICBuaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29tbWFuZCBmYWlsZWQu
DQo+ID4gICBuaW5qYTogRW50ZXJpbmcgZGlyZWN0b3J5IGBidWlsZCcNCj4gPiAgIFsxLzg0OF0g
R2VuZXJhdGluZyB2ZXJzaW9uLmggd2l0aCBhIGN1c3RvbSBjb21tYW5kLg0KPiA+ICAgWzIvOF0g
TGlua2luZyB0YXJnZXQgcnVubmVyL3J1bm5lcl90ZXN0Lg0KPiA+ICAgWzMvOF0gTGlua2luZyB0
YXJnZXQgYXNzZW1ibGVyL2ludGVsLWdlbjRhc20uDQo+ID4gICBbNC84XSBHZW5lcmF0aW5nIGlu
dGVsLWNpLXRlc3RzIHdpdGggYSBjdXN0b20gY29tbWFuZC4NCj4gPiAgIEZBSUxFRDogZG9jcy90
ZXN0cGxhbi9pbnRlbC1jaS10ZXN0cyANCj4gPiAgIC9idWlsZHMvZ2Z4LWNpL2lndC1jaS10YWdz
L3NjcmlwdHMvaWd0X2RvYy5weSAtLWNvbmZpZyAvYnVpbGRzL2dmeC1jaS9pZ3QtY2ktdGFncy90
ZXN0cy9pbnRlbC9pOTE1X3Rlc3RfY29uZmlnLmpzb24gL2J1aWxkcy9nZngtY2kvaWd0LWNpLXRh
Z3MvdGVzdHMvaW50ZWwva21zX3Rlc3RfY29uZmlnLmpzb24gL2J1aWxkcy9nZngtY2kvaWd0LWNp
LXRhZ3MvdGVzdHMvaW50ZWwveGVfdGVzdF9jb25maWcuanNvbiAtLWludGVsY2ktdGVzdGxpc3Qg
ZG9jcy90ZXN0cGxhbi9pbnRlbC1jaS10ZXN0cw0KPiA+ICAgL2J1aWxkcy9nZngtY2kvaWd0LWNp
LXRhZ3MvdGVzdHMvaW50ZWwvZ2VtX2RyYXcuYzoxMDogRXJyb3I6IHVucmVjb2duaXplZCBsaW5l
LiBOZWVkIHRvIGFkZCBmaWVsZCBhdCAvYnVpbGRzL2dmeC1jaS9pZ3QtY2ktdGFncy90ZXN0cy9p
bnRlbC9pOTE1X3Rlc3RfY29uZmlnLmpzb24/DQo+IA0KPiBEbyBJIG5lZWQgdG8gYWRkIHNvbWV0
aGluZz8gV2hvIHRoZSBoZWNrIGtub3dzPw0KPiBDYW4gdGhlIHBlcnNvbiB3aG8gYWRkZWQgYWxs
IHRoaXMgY3JhcCBwcm92aWRlIHRoZSBwYXRjaCB0byBmaXggaXQ/DQo+IA0KPiBXZSd2ZSByZWFj
aGVkIGEgcG9pbnQgd2hlcmUgbWFraW5nIGFueSBjaGFuZ2VzIHRvIGlndCBtZWFucyBzcGVuZGlu
ZyANCj4gMTAlIG9mIHRpbWUgb24gYWN0dWFsIHdvcmssIGFuZCB0aGUgcmVtYWluaW5nIDkwJSBp
cyBzcGVudCBkZWFsaW5nIA0KPiB3aXRoIHRoZSBpZGlvdGljICJkb2N1bWVudGF0aW9uIiBzdHVm
Zi4NCg0KSSd2ZSBjaGVja2VkIGdlbV9kcmF3LmMgYW5kIGl0IHNlZW1zIGl0IGlzIGk5MTUgc3Bl
Y2lmaWMuIEluc3RlYWQgb2YgYWRkaW5nICdEcml2ZXIgcmVxdWlyZW1lbnQnIGZpZWxkIHRvIGk5
MTVfdGVzdF9jb25maWcuanNvbiwgcmVtb3ZlIGl0IGZyb20gZnJvbSBnZW1fZHJhdy5jLg0KDQot
LQ0KWmJpZ25pZXcNCg0KPiANCj4gLS0NCj4gVmlsbGUgU3lyasOkbMOkDQo+IEludGVsDQo=
