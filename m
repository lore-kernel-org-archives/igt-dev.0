Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B930C87FCA
	for <igt-dev@archiver.kernel.org>; Wed,  6 Aug 2025 04:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF31610E16D;
	Wed,  6 Aug 2025 04:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fcqs5u7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472FE10E16D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Aug 2025 04:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754456086; x=1785992086;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EP5pjRL4fDHzWMHpStusSVKy78hooW5O4hOeBbFSm8c=;
 b=Fcqs5u7RBrKCSsSJRaCnLUUVIu1YFjrV6H/qIRu5jpxdIsJDwmKyqjSy
 wfQu/eGI0d9HecB4ZKA/sY2eCd62hcmovIqpaaEOTlC5P3S6JTJYU7+48
 g/jti5ZQ9M4WwSXGRqypXeCE6izWbOIw9jzrBwydjJ6FSLCY+zaXCOwHV
 9Bhio8rm9b9MoX/I1T58MIMztnvLHWRrK341ca6qPcAyNEAWG5cl7y8y3
 UGHGdrwymSkiqAAOxEYOKblRqb8kMC6hmxTQlyj0s/wxd8NaOBDZ8aQD3
 MnFYTMOUU/Brc5r+tlIG3d2lv4sgkulb6Ga/TsGoTBuvG0gIY9WFCG43W g==;
X-CSE-ConnectionGUID: HHoekcXST5KVBU237YaTdw==
X-CSE-MsgGUID: VwWzlEjuSAe6kHqGaZy8PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79311147"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79311147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 21:54:45 -0700
X-CSE-ConnectionGUID: bDR5bJbvT96YHjf4AL4XOw==
X-CSE-MsgGUID: 2doTshB0RseSP8qhH67XUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168811972"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 21:54:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 21:54:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 21:54:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 21:54:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ld62ddlLWStJzZMCm3qpCNDcrjFKwsPoO+rsR9odOGz8tpXYfLff5MNsZwkMfVLoL70x+U/hDelvLXLp+NsqXjDzbzmqaGk0KpKhTI21f2FeEG95ecRXVCxdQ0wmtPl33r1/NTSq4MiODXkT/01ZagvWc34Fomn5k99gBIw/5WiuwBjXMK1n2J6BzZfxVAJk8vfHtigIQntikA9CEa6JZoLCubsGe9QFgWtE7oG8dLls4LNFFZD3ivgarBZLJMDoNg+XxmGqAkJH1+Q+noy2OR+yg4YYsWm9+omys49bJU7dDVML8H83J38VM4FLP2tOFxhOJiqrPhHpmcWVcM3+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP5pjRL4fDHzWMHpStusSVKy78hooW5O4hOeBbFSm8c=;
 b=JmTc4epnpdtA6uQgd1SpT/vYx4Mdn7BzoPy/aiOIeZJCFMC72HtA/3apM94bJGZUAum2/oPT2iFwMFEKRHT/jT2lI6cG+lOrgGZT2iI6op0ZXrLmRAm73VY8fruMoJ4ph48Mqxzx1AD+BIVRNIoYkKxvqXOk9+LoaaP5UYdFiGmy1MGjwtjyrgjEFRpigCLKDnK3ZnAu2ANK50ys6Nz1DGFBbHP1fPt/1rWa2HE0TVGneM9mZu6c32QEVbQpss6CM41ZtFU1qtq/ovF5mgDofno12L3STdWlp1BDm+MQNhFG8yGpETCLV5APOBz1uC8X9r0XGFDikXvtxQ8WEG/HnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 04:54:42 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 04:54:42 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
Subject: Re: [PATCH] tests/intel/kms_psr: Do not test frontbuffer rendering on
 cursor plane
Thread-Topic: [PATCH] tests/intel/kms_psr: Do not test frontbuffer rendering
 on cursor plane
Thread-Index: AQHb+8F3GNfDbgfEsk29Qz/jiBa3CbRUD/cAgAEU9QA=
Date: Wed, 6 Aug 2025 04:54:41 +0000
Message-ID: <cc607fef02dc7682eeab960182c9a82834f53160.camel@intel.com>
References: <20250723110319.2012982-1-jouni.hogander@intel.com>
 <b51ce7c6-576d-4493-b20c-ef08daa9c8da@intel.com>
In-Reply-To: <b51ce7c6-576d-4493-b20c-ef08daa9c8da@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB6933:EE_
x-ms-office365-filtering-correlation-id: 11ddde40-95c6-4ba8-5eb6-08ddd4a55b2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eWJSMFRteHBGVS9xb2FWSHgzQ2JiL0xmY1g4dHhWaUxGTnhWV3JjaUorK3p4?=
 =?utf-8?B?UjVYajhNRmZJVXlneVNwMWVReE9ONmpaeGp5b1p4dmtkMWo2bk9wSmFkamRs?=
 =?utf-8?B?MXUyaFJnb2lEeFhJWU5MN3NWNjVNeGN2Zm0wRlJvZnRuaSsyeHZvVDVWQjAw?=
 =?utf-8?B?OVo3dkw3QUxURXJMQlltMW9kVEZxcG10c0pQc0xMdFJ0MTNBRkpnUmpSdkpT?=
 =?utf-8?B?MElwMWtjTm9wai9JVWhMY0FWRHcyOC9RM2N0ckNHcEVzMTFDdkt6c3B0RzdN?=
 =?utf-8?B?N0pwZGNES0ltWkUxMEJmem9odi9JV2FNblF1VzJLNmdlV3NET25nSGtIQ2xT?=
 =?utf-8?B?NEI2OHZZZmhVMmxBajdzS3dXMlhjRXRwU0pZL2lyTmRweGRuSUoyVmQrMDhk?=
 =?utf-8?B?TUtDeUJBVkVTYXNkNTAxRVZJU2t2SVhrMDY3bWwzUDFpOUVjQmJ5blNDVHcx?=
 =?utf-8?B?VUFNdDJPRm9IWTBKSy8zYS9PMlJydm5WbVdjNHE2akJXOWxFcm9DcnRva3N3?=
 =?utf-8?B?SEppN2RJNERXRCtEMGcwMDdpSXNzM01MU01laXVCenFQMVRrSUtrWjF5RWYy?=
 =?utf-8?B?WHlaN05WUTkwRFFpY2phdEVqdUsvczdzUCtZc0NGTTc5YVhtMnVRQjMvYUtm?=
 =?utf-8?B?dHk4UTl1RGRUUUwxTUs5ejkxcStrKy96cWtMQjFheEtlSUhib3doeTljQ2dQ?=
 =?utf-8?B?bmo0ZWlDWURpa1NVM1ZsaGlEY3kxSUR5aUQ3Q0NoV3NRNDFZWUlSTEkvOVo0?=
 =?utf-8?B?SThFanJySWp3QndYSmR5R0xZUlJTdVBTODlZcnZBMTFwdkVUUFNSWEtMbDda?=
 =?utf-8?B?NjdFTFRNL3o3Tzk5eXl5a0RRMTl0WHNyWmtyWW51Q1crS2lkbCt3WmtKeStF?=
 =?utf-8?B?NHVrWEZDWVVVK1F0QjBDSzBoaU1IMXFEVUh3QXk5YVdXRjU5ZWYxanhSVXJa?=
 =?utf-8?B?OWUyOFFOUldobjFSYVRLYldYMHV4bk9UMFpZdVdIWW1qYmpwZTdmUGtEZTJG?=
 =?utf-8?B?V1VDQTMwbGFWa2l2SVd1NmpFU3RtbFU1c085dU1OWU1oYkE5VW9qeFZYUzRj?=
 =?utf-8?B?RkxiRnl6MWlBWE8wd1l6cnBHcWVpd1h0Tkw5QjFxNFNiN0Q1anlNdFkxSlVK?=
 =?utf-8?B?ZFdQWTRnb1U3aTRKbUF0enkzb2liSUZBUGVsNVdkb0FiRUtuRU53TmFmY2J4?=
 =?utf-8?B?bERpdjlrRUtMOTBuczE0Y2lkdW5qUWF6bVlkd3B4em9FRkFqaSs1amRlZXlG?=
 =?utf-8?B?dmpNVDNiQ3pmalQ0dWhrc0NFS1Vad0RjMVhGWHNtNzE4bU9CZHRDaTU3clh2?=
 =?utf-8?B?c1Y5bWZKR2dIa3NsbVFHVHNNMlQ5RTA0d3pQZ1B1OWxzOStJc1V3MFN3RS9W?=
 =?utf-8?B?NVp1SGlGUjlZTlhybVFVNjR2NFJVY0Nwc0xkUUlGWjQvNG5iNUEyOFpxLzVn?=
 =?utf-8?B?d0ZJbVg3VE9QOEd3dlI3UTB2Q1I3dVl6T0RDbXU0MVNGTFhzVDlrZHhZVXdD?=
 =?utf-8?B?YllXbXM4aHZWWUxERnRSdGo4RFRsNEFLZExIWXBXTmZsRWUxSzRmNVBQbEtT?=
 =?utf-8?B?NjNNRjV3anJpQVllOG1tL2dJeDIyemtYa0cvVUJudCtZNTJPcTk0WTZlOHh0?=
 =?utf-8?B?U08yQytqVzB1Ly9aYWV1VU5nZTRydVRFKzNmYWFIeWZTY2hIU2FaSDBWZEda?=
 =?utf-8?B?TzZuUGZMcEU1YTYvdFRJMmVNWlpDc2p5QUZzZUZuaW5SVFpWQ3Z3Tm1nN2oz?=
 =?utf-8?B?VzBpZFVIMVN2K0VNRkNwbTBMa2wxdWo5UVU3c0NMNUYvSHFkUDdKc1Q4VnNO?=
 =?utf-8?B?MGNYYXdKbC8xRTZtVWhlUUM5VER5NkVBQW5NdmxCZW5xWnN4Nkt1VGN1WDFh?=
 =?utf-8?B?NmJJa1h5ZndXVzViTUhYcGJPUC9EZlRZbUpBQ08zZk1jSDJtWmdqWkNMSTJm?=
 =?utf-8?B?cS9rYmxwdkZ6U0dkeXFzVU0zdmNDbTRYSXlvTHdhVnRvQTF6Uk5vZVA3MlNB?=
 =?utf-8?Q?kcybrKPCLqXG+/qVaGYG6gQ5D2XHlc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHJEZ2dHQWtuTkFIemVLUE1TVFhCRnZONE9GQk56L21iNXo1S2Z5TWNzT3BX?=
 =?utf-8?B?TUVLcTVvSUV6SHY2SDhzUldIMmR2N2dRMGovZFppUTN1SEFhOVl1d2h1SUZC?=
 =?utf-8?B?bG9ueDNYT1pmVE1KZWFYTWtLeUlxcE1vemtJbkN5YVh0QXZEcGpESXlhMnc2?=
 =?utf-8?B?bXFqaFhIT1dCTDY3dGRpUk5PVjdYNEJZR3BqU3NwakpnR0V2ZEJqSzNsWnRi?=
 =?utf-8?B?RW1EOHZrN3pzUThLUDhGWE1jTldDQUdSRXpDTytndDRiVzVOM04vOHc5M3Vt?=
 =?utf-8?B?aXNrZHpwcERZWEU0cTh6WXJrVHZoZko5dDNENUhRUHJuRTlnQmdkdDJSZ1RQ?=
 =?utf-8?B?ZDU0bSsxa1dUVzMvVkE1N0pHNXRtU2w4RjRNaDk0YWFqRFZRS2Y5MUZ0MzEv?=
 =?utf-8?B?eFNwT3dLWUZjVjdsaGZjZ3ZELzFkSmxZbkJYeTlSWCtOcGVjeXRaOUI5dEtH?=
 =?utf-8?B?T1ZqOTNONjFqTDh6eGo3UVEzeUxEeWVWMUhLT2lidDAzdXhwKzMzaHcvcEEy?=
 =?utf-8?B?cmJEam1UNk4waU5GUW5NWUlYbnlpdzNFdnV1cnlpeVMvZDV5YkxLdE5HcGpN?=
 =?utf-8?B?eGdJNDFyaGxOc2Y3Q0ZhOGxzV0FGQXhMVXZvbHVyejlnOXdHZGZ3Q0xlY3gy?=
 =?utf-8?B?Vml5djFSYTBJeURPQkZtVUxFa0lNdjAwenZHNkhPOW5tVzdreC9hSWcrWEU4?=
 =?utf-8?B?Ym5HUG9KcEhaOWQvNUJoSGZVQ214TTVIUGd5cU9JM1JxZXJLTVpXaEQzMnc3?=
 =?utf-8?B?LzVsMXd3SGtxR1gzYjY5QkFQQWNyQlU2UWlNeVJkN3V4MUx5c1V6d1FlcmFp?=
 =?utf-8?B?ZnFmK0YzcEJYcjhFU25YV2FVSmFWQVdYZnV2VU5MaXV4OGNoWHU0bkxyTEtw?=
 =?utf-8?B?OWFXdktKaEtvT2MvNm9zN0tiSXpNOGQyaUs1TE9VaHJWM3QyM3RraTV2c0V6?=
 =?utf-8?B?alJabHVlcmQxN2podkl6REIrYk1oc0FVdndZSTN4SjlSWWlmaDdqWmc4RGN1?=
 =?utf-8?B?M1hjcytZK3V2czBJdDBaNnVHYWRsUzAyeHh0NVNscVk1RDkvYWYwL25tMjRk?=
 =?utf-8?B?U2EvV296ZEFBbGFpd1B5di9KR0xiNGdpcGRIK1pIeW93TDlXRVFSU2RtejZ6?=
 =?utf-8?B?RCtoVVhHWlRpaFRvTFZtUk85eUVGZTRGUzc4bFlBKy9rUmYrNTBvQ1hmMjNq?=
 =?utf-8?B?Sm1ncjVLZXhiRnNHVmMzcjA3dXEzMzNHRzZVWGhidVJaUFdjcGFTYlZsMU1K?=
 =?utf-8?B?UmNWMXZHMUZHQU9HM3BUWEQ5QkhoQU1rZENCNmdoL0VLWkUza2t1Z1kvLy92?=
 =?utf-8?B?c1pGcExodTg5VjNpWnd2NG9tUHE1SjVVYjFsalUwQ1NmaHJTdVZhY2NLVlVW?=
 =?utf-8?B?dHkxV3EzR2NjL041cjJScTh6T0JielRkNnNMR2RWbU05eGVtSCtOMk9hdjdG?=
 =?utf-8?B?QU9aTUNlZHhPcEVRTlFSVUlSZ2pmWVhySWNOSjc4RE1ZdXYvWG9Hc0FEalFN?=
 =?utf-8?B?emh0Z2ZraW03dk1NVzNpRkp5VHptazhaL2ltTEUwTTRrZnh0LzFaeGJvaVlO?=
 =?utf-8?B?S2dVR05QUldXQ2NWOHRGNDRzMFp3aWJXdzBNenlDRWFPWEZWcjJoRGd4RFZa?=
 =?utf-8?B?SEpsUjVXbUNRTmVqTkV1QlBSRGJuV2RpeHVyenVTUTY5YmszTFFXVHR3Z0x3?=
 =?utf-8?B?cnUyWk1RMEtiR0dycWFSREtJMjJYdmtDemtGVXI4MVNtRnJVOVhwVVVrSmI1?=
 =?utf-8?B?cW5wOWVwZmJPRHdkVllDSVJUeThCdGZvVHZpTTgzUW1ObFFHU0o1TlRTTy9M?=
 =?utf-8?B?K09BaWZwa3UyUmV6Z1ZNblo2N3FJaWV5K1JGZlYyTzltSVI1UnNTQ0I4YURr?=
 =?utf-8?B?MHRQYmlqeldkcUJaQWdXdUV3Nm1Ga2dteWVqZEo5SHVZQ0cveGFPU012R2Ux?=
 =?utf-8?B?dmpVR0tscGM3VTFzYUl5U20vOXZrRDY1VWcxUFNBSHQzeGIzODR6U2lUNzc1?=
 =?utf-8?B?WDkzQkxaWDZsbVZ2SGFrWjd6dVhTVkM2L0I5NFdUTmxLVm5BeDF5T21FMlE1?=
 =?utf-8?B?Z05MeWlEZnQ3Z2dkOUlJekJMY1dTQ08rSXFLaXdGTDlKd3YrQTM2ZDlWT2hI?=
 =?utf-8?B?cG5IUnAvSE5SZjRDS3FTd2lQUFErM1pZZkw4RWttZjBGQVlTdkpHZm9DTjB6?=
 =?utf-8?B?MzAxY1BOVE9vSFZJZnluaUYyMEoySkFjSzI4RlNSdW45d3lzdk1IaDJlK3JZ?=
 =?utf-8?B?SkNqZ09iK29aK0k2QzI3YmMveEh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FB24F8EDFD41246BD0F516DA35DD701@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ddde40-95c6-4ba8-5eb6-08ddd4a55b2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 04:54:42.0422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJIy3kfqY8Nhb3E4ad6W0G/r8ArIODAxadYyD6GIGkY+lLPqntLU17FAdi6x5yw1Zt3aTXQmdlSxbaM4BGTx698Pfhq33k8vJ4S3RoS3uVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
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

T24gVHVlLCAyMDI1LTA4LTA1IGF0IDE3OjUzICswNTMwLCBTaGFybWEsIFN3YXRpMiB3cm90ZToN
Cj4gT24gMjMtMDctMjAyNSAwNDozMyBwbSwgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0KPiA+IEN1
cnNvciBkb2Vzbid0IGdlbmVyYWxseSBzdXBwb3J0IGZyb250YnVmZmVyIHJlbmRlcmluZy4gVGhp
cyB0ZXN0DQo+ID4gaGFwcGVucw0KPiA+IHRvIHdvcmsgb24gaTkxNSBiZWNhdXNlIGk5MTUgaGFz
IGZyb250YnVmZmVyIGZsdXNoIGNhbGwgb24gcmVuZGVyDQo+ID4gY29tcGxldGlvbi4gV2UgZG8g
bm90IGhhdmUgdGhhdCBpbiBYZS4NCj4gPiANCj4gPiBPbiBYZSB0aGlzIG1vc3RseSBoYXBwZW5z
IHRvIHdvcmsgY3VycmVudGx5IGJlY2F1c2UgYW55IHBsYW5lL3BpcGUNCj4gPiByZWdpc3Rlcg0K
PiA+IHdyaXRlIGlzIHRyaWdnZXJpbmcgdXBkYXRlIGFuZCB0aGF0IGlzIGtlZXBpbmcgZGlzcGxh
eSBhbmQgUFNSDQo+ID4gYXdha2UuIE5vdw0KPiA+IGFzIHdlIGFyZSBtb3ZpbmcgdG8gdXNpbmcg
dHJhbnMgcHVzaCBtZWNoYW5pc20gdG8gdHJpZ2dlciB1cGRhdGUNCj4gPiB0aGlzDQo+ID4gZG9l
c24ndCB3b3JrIGFueW1vcmUuDQo+ID4gDQo+ID4gU3RvcCB0ZXN0aW5nIGN1cnNvciBmcm9udGJ1
ZmZlciByZW5kZXJpbmcgaW4ga21zX3BzciBpZiB1c2luZyBYZQ0KPiA+IGRyaXZlci4NCj4gUGF0
Y2ggTEdUTQ0KPiBSZXZpZXdlZC1ieTogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVs
LmNvbT4NCg0KVGhhbmsgeW91IFN3YXRpIGZvciBjaGVja2luZyBteSBwYXRjaC4gVGhpcyBpcyBu
b3cgcHVzaGVkIHRvIG1hc3Rlci4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gwqAgdGVzdHMvaW50ZWwva21zX3Bzci5jIHwgMyArKy0NCj4gPiDC
oCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19wc3IuYyBiL3Rlc3RzL2ludGVsL2ttc19w
c3IuYw0KPiA+IGluZGV4IGRhOTQ3ZmViNi4uZjA2MmQxODRhIDEwMDY0NA0KPiA+IC0tLSBhL3Rl
c3RzL2ludGVsL2ttc19wc3IuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19wc3IuYw0KPiA+
IEBAIC04OTMsNyArODkzLDggQEAgaWd0X21haW4NCj4gPiDCoMKgCQkJCWlndF9zdWJ0ZXN0X3dp
dGhfZHluYW1pY19mKCIlcyVzY3UNCj4gPiByc29yLSVzIiwgYXBwZW5kX2ZiY19zdWJ0ZXN0W3ld
LA0KPiA+IMKgwqAJCQkJCcKgwqDCoMKgwqANCj4gPiBhcHBlbmRfc3VidGVzdF9uYW1lW3pdLCBv
cF9zdHIob3ApKSB7DQo+ID4gwqDCoAkJCQkJaWd0X3NraXBfb24oaXNfeGVfZGV2aWNlKGQNCj4g
PiBhdGEuZHJtX2ZkKSAmJg0KPiA+IC0JCQkJCQnCoMKgwqAgKG9wID09DQo+ID4gTU1BUF9DUFUg
fHwgb3AgPT0gTU1BUF9HVFQpKTsNCj4gPiArCQkJCQkJwqDCoMKgIChvcCA9PQ0KPiA+IE1NQVBf
Q1BVIHx8IG9wID09IE1NQVBfR1RUIHx8DQo+ID4gKwkJCQkJCcKgwqDCoMKgIG9wID09IEJMVCB8
fA0KPiA+IG9wID09IFJFTkRFUikpOw0KPiA+IMKgwqAJCQkJCWZvcl9lYWNoX2Nvbm5lY3RlZF9v
dXRwdXQoDQo+ID4gJmRhdGEuZGlzcGxheSwgb3V0cHV0KSB7DQo+ID4gwqDCoAkJCQkJCWlmDQo+
ID4gKCFwc3Jfc2lua19zdXBwb3J0KGRhdGEuZHJtX2ZkLCBkYXRhLmRlYnVnZnNfZmQsDQo+ID4g
wqDCoAkJCQkJCQkJwqDCoA0KPiA+IMKgwqDCoCBkYXRhLm9wX3Bzcl9tb2RlLCBvdXRwdXQpKQ0K
PiANCg0K
