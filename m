Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E4AC677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 12:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598FF10E652;
	Wed, 11 Jun 2025 12:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiYUa60z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B8D10E655
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749645239; x=1781181239;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Xql3s/hjR7UXNWAo63F4vT1F+aIoYqS5eB4UpN4aN8I=;
 b=jiYUa60zRTLWTTjl96YP07lvRRCaXs6V6FJXiVoLgIXvzrsFGTLtbSgQ
 k0PNy5BRrTD9BoLuZFSN39PmNmkQleXUkVkA+9P5lmhZ7v1+OxMJImzj4
 ZhmdNoCucDev07gxyk2wpfgPEdL6ZirzoQ/QtkRGQbdNa9hvS1dbxhuh7
 WGgQunxB08xYWlSZZZ7EocHtr5Lv6iaUDdaXF2LNeNh7vq8kdR2U3xmRo
 cQcuyCwJ1PlnEzldR4Q2FWYCpC7UsNMG/pcXMtnm5jV5ZHGsk7PbgTlib
 1YXH4eWaPFc8FsaIqVQTSoR2jbzMklcH4BLmGENR8DE3sDvRHzV8qRxNF g==;
X-CSE-ConnectionGUID: +eQipuGOSS63WQwyLBJr1Q==
X-CSE-MsgGUID: UGtN0zm4QvW4GjKQ/e9f8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62065357"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62065357"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:33:59 -0700
X-CSE-ConnectionGUID: WOOAmXQ0RfSWgDemmn5Kxw==
X-CSE-MsgGUID: p48Z0Ni6SiKBaqX8xt/y4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147101074"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:33:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:33:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 05:33:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6dpButUpYZBDVDd4T3WcGK57snFlppRDpzz8DCs0e9oPj1H0AnKriognKWOYbJ4JrzN+zVk0klRgqEVXkXd5JCnG5oXHCewQQIz+Od/9wajO34Q65TNPb/knxpSpkt/xNU1E6UfDXsCYY+ttYOmLkTsmxGYSwIECoX1eVK7iQE7NKEFfww/T03eP9KZaLktql6XQFv7A/+aXWOr64TCUJ4lIjSo0Sc2NRDg6EXoWV2i/mNw7+vXk6OpEk0gxntxPIqBYFp/0CNlTf51O4Xxaf78AlSCs5s9POoq+RbrVoyxZfaU1vNXDZYEccq64iOp3NHEW05h7Pn+WlzmY9alTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xql3s/hjR7UXNWAo63F4vT1F+aIoYqS5eB4UpN4aN8I=;
 b=h/LlF87yw5yJ5uvunNd3TVzE/fa0YtapJHOEdEw+X2e7vIbUYMiAkzOG91v13wXyDxYR0yIlbMUSsEC6QxEFauKctBrpvJGK4R4AyKWzY8CeUk5RiogcgSxyBNO1EjV8DoIXZjGBBDMWdP3v6x03dn3UR/J9MqfiZe/QUBb2DrOx7RjKc5Da8Afs3uP8D85E6p7Q0191bHpGKzO1TIfkFF07m2hNx01+EgBxKgn7nvsVLB7GrCfmRpb9MvAwmyJpKNvLVkoX4wACj9jN136+zw1ZqzDXFWzuLW56US5HtajB3y0hEDgsnAnlUJfcnFkniyFQEWcVdHO4znNkiPh+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by DS0PR11MB6543.namprd11.prod.outlook.com
 (2603:10b6:8:d1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 11 Jun
 2025 12:33:53 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc%3]) with mapi id 15.20.8769.022; Wed, 11 Jun 2025
 12:33:52 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "rk@dragonic.eu" <rk@dragonic.eu>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [v2,2/5] Dockerfile: bump debian version
Thread-Topic: [v2,2/5] Dockerfile: bump debian version
Thread-Index: AQHb2s0WRtuRWirEikKmnyYmf/+9BQ==
Date: Wed, 11 Jun 2025 12:33:52 +0000
Message-ID: <fc8815ea136189154f7ec6371ef2a9374fd27d45.camel@intel.com>
References: <20250611-bump_docker_distros-v2-2-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-2-90791ecb953d@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|DS0PR11MB6543:EE_
x-ms-office365-filtering-correlation-id: 9c276625-66e1-461e-5059-08dda8e4396b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bUhKRmJtcFYzTXVPN0VLTGs2TkUxTkF2V1dMSG9EVm51dzB1NWZ0Vkp2WkYv?=
 =?utf-8?B?Wkk1T0JTWE5Fb3N6b1dKcXVLOGVFNU5IT0FMMDJ6S3Rhc1krNERqUWtqUnlF?=
 =?utf-8?B?c0lsN1crSytFWVl4OElFaHlKeHhhZXBOTk9Zamg1RXRlTDlhdmxYUkJHS0Zz?=
 =?utf-8?B?OFpmRHA1VUNhd3JDSnd1c3ZvaVZ3L0R6aVIvd0RPQUNGRDV5c3VWbnljRlJt?=
 =?utf-8?B?Y0VnallHWXh6V0NqdC9TSFhPdkIzM2ZsY0tZbkg1NThXbFpacjNSOERlNkxM?=
 =?utf-8?B?SGxTc01JTkJBUWd5cmx3NVBzSXNpQkRVYXhGUE5LYjNVYWZzcERWY25xZThS?=
 =?utf-8?B?Mm5mWDU0dlBlWHhaQW13cGY3aFQyTGl6WkFaZzUyaW1VSnFxdnJpY3Y2Vk1C?=
 =?utf-8?B?ZkRCbGV4V3RJUE1lMHp5ek1zK3liRXlIdWJsZXcveDR1M21yQ1BVb2lKc3Bj?=
 =?utf-8?B?cVFDU3NVWTFvNTh0eTE5eVc4ZTFCcFJDWFVCcUJYZks3N1M4L08wSU1lL0xn?=
 =?utf-8?B?eVNqUkZQVjRja2FKU01IcldJanUxSkdTa0p2OU9mUjZ3R2wxQ200YlV3NHRH?=
 =?utf-8?B?bG9ITTRUcmc5MHZQd004cWp4bnhXS3dlR0g5UW82SVZ3cFRMOGc3c0FYZzNm?=
 =?utf-8?B?MEVpVmpxSHBDZS9uTU80aXFYVENzSktGekF3c1M0SjdxYVBXVlZvQ3JVaHRj?=
 =?utf-8?B?d1JGZ2c2d1ErOEprYmEwSlBiQm1adGtuUWh5UVN4TmpUQ2JEdEdnZ0tCd1BV?=
 =?utf-8?B?R3hUbS9hamRCMXA3MHluM0ZUQmdSZVZUSVVncFJrZXJlNzQyaVFLQzQ1Wm5D?=
 =?utf-8?B?MzMxNlpUeVBzbnBwTlFPNjYxQUxQWWZDMjU2MkZYUUJhYUpqQVBWRzNlQUpx?=
 =?utf-8?B?WnVmdTVraHgwV3ZaZW1Na3VCUWFJR0ZPTFNsWXV6dFJRNDBVODZVMmNvUS8x?=
 =?utf-8?B?N3VBNUorS2JYdDBjampDbjZQYXJMZ0thMEN4dkZCUng2dGdsQk9QZldUT21J?=
 =?utf-8?B?OVg2ck04VWZibjBQQjdaUVpQVnFpQTlTczAyRTRwUDFXVnRYTnpJYjZqZG5i?=
 =?utf-8?B?YkNqNHNLaDlJZ01HQjI1VzRYUWcxOFg1dm1seVFZZmgyQjh3a2tEcFlVMklY?=
 =?utf-8?B?TVNOMGM2R0RzTGFJdnNKM0RybWhGaGRtQXltUXR0VUpVTnY2NytSQzZCakVJ?=
 =?utf-8?B?RnZib1dvbjN4Y2ZGTTdqeFBPdGNUUEhXVXlqSFprNnd0SjNlVTR1dzFvOW1F?=
 =?utf-8?B?bWxlSUpUOXNOVnNaU25QandhejFoemlnclEzME1Kb0VFTkRUQkxxTXdIZ0M5?=
 =?utf-8?B?U1hEUy94aG52RHpRV3I4UFcrbDI5RjdZbEtZQkVYWm5qWVZpK3gxMVhMSHZR?=
 =?utf-8?B?cGJwTTFoRURLdVVYWWsxV2YxRXRLTXRnWWZNWHNXVW9NVGV3c2VpM1U3d2Z5?=
 =?utf-8?B?VEdJTDRpbzl0Z2VhamJhanhSQWphQ0xvNVBLNytnZ25KSkJlNTNtejlLYjdI?=
 =?utf-8?B?SW1KdEl3NmVMeElsajFZRzNxNk1ISjAvSHBQdk0zMnZMbVkvQmhSZWFQekY5?=
 =?utf-8?B?NGw2MkJ5ekdhcm14VDRGT1ZmUzYyUXRSTTVlU2VPUVB3eE5udE14R2xqdFRZ?=
 =?utf-8?B?SkcyeXViWDRnZkJRTE5Sak54WWxwNTZoU25YMksxa09DTStuN3VVa1lyM0xw?=
 =?utf-8?B?TzVLU3UxM05MZFduVlFjUkV1aHI4eVZlazVNWUkvRExsUStTNUlnZ2dwWEFh?=
 =?utf-8?B?Q0dWV1Z6VDAzRmRocnFydHFYcDRLNng3NUs4VWtDUThsZUFsL3MyMlV5L2hJ?=
 =?utf-8?B?UEhqY3luZjZNU1I1UUdHMHc1ZGxHQU11RHhyVGhaWU5xWnhvOHNNeWc5dDZk?=
 =?utf-8?B?R1MwZGdMVWIvaWxBaWRDMnhPSkFDc25kR2R6WTVBK0NnNFVTWFlwZDZYb1VD?=
 =?utf-8?B?Ky95ellLRktPSVpyYWlNcnJGczQya2xBcExqcDA2eUREWmNEQjhCN0JuR2hF?=
 =?utf-8?Q?741H0Bz4Yk2reU+L8x3wPGhfDuMyQI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUloNlVucFNhNTV5Qkp1VXY0VUFFZWNsM2tBdU9UV0VxRXRoalplVE0yMFph?=
 =?utf-8?B?S0NmdXZpU3Q5ODRuemlNQ25EYXVScThad0JiNEFKRE5hNVRtd0J0YXFIN3ZK?=
 =?utf-8?B?VjA4RDRyN0VnVTNYdjM2bXVYT3lQcUFVVjhKS0tPS1YzRE9zR3JpOGRkN3Fh?=
 =?utf-8?B?dkt5dk8rMk9HYmh2RWd5THhBWm5tb2ZKWjllc1pIajFYeGJodXpKbk5sbzMw?=
 =?utf-8?B?YXlVWmpWRmtkd21VT2tBUTVFQmEySlFwSlBHTDRIT0s2TkFRd1o0bEZJOWRT?=
 =?utf-8?B?UExmYlVDK2g2RWcrR3lFb21SUkc1dkhPNk8zUVg0MHpYMThWVzY2T043Z0gw?=
 =?utf-8?B?WEhnaHVXY0NiZzlsQXB0RVM5VEZTMkpKTmZoVmpWM3dOOXBnUFhBa2czNUxJ?=
 =?utf-8?B?bFl5ZjRzNVhici9kVmdYQTFtcGN4Q1k4MHJrRGkzQ0pBbHhuRFd6Y2xyOUVY?=
 =?utf-8?B?VmM5V1F4WjZCTEdXRnl5NGJWOGlwQVltL3N2RlgrM0pLSjRiZ0hnMlpkWGVM?=
 =?utf-8?B?bERlYjRFMkl0U3VTUi82SzRHYUFmWmtxU2NOOGRNTEhrL0VhenEzcWRob0cx?=
 =?utf-8?B?ZDRwUGRPNFNsZk5ucEp5bkhVOHRaOUFsUTQzdnFtZnZ2Ni9ZZWVBcDdPMDNL?=
 =?utf-8?B?T2RUYllWblVmZmp5NGNUdEdxaFdJbGhET0lBSjgxcmFJMStab2RacTEvWXp1?=
 =?utf-8?B?MmVQN1FQZEtqQ3NNUnd4TkZtWjJ5ZjJPOGswQXBZVENOanE3RDQ4eWlwa1JM?=
 =?utf-8?B?bGRyeElWcThudHlIOWJkSmZrd2pJSmVPdEpTSHNyTjFtOFRYRmhYWUtocEYx?=
 =?utf-8?B?eVVWbUlmSVJyaW5IcUtDeVB1NWR6WWUwcklzeTU1Y0plZ3VqcEo0eFhjM1Jm?=
 =?utf-8?B?TUMrcjhGQWdMWWNUYTJSdVhub21DbElKNnBYbXF1VnQ3UUE5RTcwK1lNdXRq?=
 =?utf-8?B?UEoxU1V6Q1FGeVBURzNqdmJ6R2kvWEJZS3EyRjR3QUJzeCtUQkRmbmZQZlov?=
 =?utf-8?B?TGxzb21Xa3NJWENhbi9lSTVVOVk0OHVzdHo1KzYxODdYU2FsZ1lvLzl2ci9K?=
 =?utf-8?B?MytrRU5RNFNDanZaOU9ka00vVG9OVDdwMURueUFZdzRLaVNzYy9IVng1b01m?=
 =?utf-8?B?YzUyb2hUeFpDYVJYR1RuTDZQWFFoak81OWNSbCs5Q0RDVG56cm9iY1dzT1Rl?=
 =?utf-8?B?NGkzMENoWG5OTnNla0NQdFpJTU9rRmZuWUQrUFZQRTJFTGlyZjllbXJMN3gx?=
 =?utf-8?B?TkNWdFVjaC9QUEQ5aTVBa0tkZ3hMb25MM3JrOHB6ODhvaHBmMmRMVUxraVdl?=
 =?utf-8?B?V0hyZHA3QktIZjZBeEZEZjlVcjRKQ3dXMVJxbURxT2V4ZHdydEY5NWpPTmEz?=
 =?utf-8?B?NUxmUmlrQWc2eXNQL243cmV6SHk2Y2tkSWliYW5LbUlNOFBhZjAzOEtFdHhn?=
 =?utf-8?B?TDBqeXBhMFNLS1NINE5PUTl6TWY0UkhRcS9XQzMyb0ZuRG9zMkdSWGdSa3ZD?=
 =?utf-8?B?UUQ4YktHT1V1WHJ0Tloxa2FnNnRWMGloU2ZVeVZXZlRwY0paTU9EYU5PazJ6?=
 =?utf-8?B?aWhmR0RDUloyQm9iVWxrUkJJWks4ZDcvV3gxWmllVXZLRm0yajFZWlRJU1R4?=
 =?utf-8?B?ZXk0YUNLOEY4UE0vZDJWakVFcFc5T2kraXpBS1MrYUw5aEh5UGt3dVNCVVFP?=
 =?utf-8?B?MFJWMDg3ZkVVSUxXL3J2aVY5NXRWWXhPT3EwVmRhL0Jxc3FnbVgxR3dmdUtE?=
 =?utf-8?B?UGhEVEVkdThIRDJybUlObC8veVh2RCsySkZjdUdwQkViSGU3NmlQWXRMNUtM?=
 =?utf-8?B?UGVRM1AwNndLRnJERm9GRmFPRlRzSGFSR2xTZTQwdE0yRXk1dVJ1WEdxVlEw?=
 =?utf-8?B?ajgyRWR6VFZ5K25xVlhwd1VVSDBESENnblRPMjJ5VWk1NFl3SnE3UUR6K1dG?=
 =?utf-8?B?N0NPUDk5NW55VENmR3RzeVN0dGNiSkhwWVBmYWpqbElBa2haU3oySmpOYSth?=
 =?utf-8?B?QmdQVS9xM3VoRGlRN0s1MEZCTWtEc1JEZW9iR0xDVVRCY0xpZ1VWR3NaNG1a?=
 =?utf-8?B?YTdDMkd5NGI0RE9YcWhLTnpXd3d5SS9tVFYySm01S1c5UC9UVWgvY0dHK1NB?=
 =?utf-8?B?RlVEVUFHWFUxNzZLc1IyU3hkN3RNb2E0MlBCMitTSGV5VzhQdG11NEoyL2JO?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06386F7BBD95AB4AA8EB2EBAF0C33DDF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c276625-66e1-461e-5059-08dda8e4396b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 12:33:52.5630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qAdySp4huuC+snKMAf6Q16ZEifWxbYmAXdizbMeCWFgdA7IQ5cqL6ROp2RnGLAkmtD8ImbmoS6otAfmbR9ZElw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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

WW91IGNhbiBwcm9iYWJseSByZW1vdmUgdGhlIGFybWhmL21pcHMgRG9ja2VyZmlsZXMgY29tcGxl
dGVseSBhcyBvdGhlcg0KaW5jb21pbmcgY2hhbmdlcyBhcmUgY3VycmVudGx5IHBlbmRpbmcgdG8g
ZHJvcCB0aGVzZSBhcmNoaXRlY3R1cmVzLg0KDQpPbiBXZWQsIDIwMjUtMDYtMTEgYXQgMTM6MDYg
KzAyMDAsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6DQo+IERlYmlhbiBidXN0ZXIgaXMgYWxyZWFkeSBv
bGQgYW5kIEVPTC4gUmVwbGFjZQ0KPiBpdCB3aXRoIG9sZGVzdCBidXQgc3RpbGwgc3VwcG9ydGVk
IHJlbGVhc2UgLSBidWxsc2V5ZS4NCj4gSXQgd2lsbCBhbGxvdyB0byB1c2UgbW9yZSByZWNlbnQg
YnVpbGQgdG9vbHMuDQo+IA0KPiB2MjogcHl0aG9uLWRvY3V0aWxzIC0+IHB5dGhvbjMtZG9jdXRp
bHMsIGRlc2NyaXB0aW9uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhbmRy
emVqLmhhamRhQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFBldHJpIExhdHZhbGEgPGFkcmlu
YWVsQGFkcmluYWVsLm5ldD4gI2lyYw0KPiAtLS0NCj4gIERvY2tlcmZpbGUuYnVpbGQtZGViaWFu
ICAgICAgICAgfCAyICstDQo+ICBEb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbi1hcm02NCAgIHwgNCAr
Ky0tDQo+ICBEb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbi1hcm1oZiAgIHwgNCArKy0tDQo+ICBEb2Nr
ZXJmaWxlLmJ1aWxkLWRlYmlhbi1taW5pbWFsIHwgMiArLQ0KPiAgRG9ja2VyZmlsZS5idWlsZC1k
ZWJpYW4tbWlwcyAgICB8IDQgKystLQ0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9ja2VyZmlsZS5idWlsZC1k
ZWJpYW4gYi9Eb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbg0KPiBpbmRleCA0NTRmNGJjZTVlNzczMzlk
ZGNkN2RiMmQ5MGE3OTQ0ZGRmZTFiMjY2Li41MmQ3YzQyZDEzMjUwOWUzYzIyZmM0YWYwMTYyOTQ4
MmQ3ZmE0NmNkIDEwMDY0NA0KPiAtLS0gYS9Eb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbg0KPiArKysg
Yi9Eb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbg0KPiBAQCAtMTUsNyArMTUsNyBAQCBSVU4gYXB0LWdl
dCBpbnN0YWxsIC15IFwNCj4gIAkJCWxpYnhtbHJwYy1jb3JlLWMzLWRldiBcDQo+ICAJCQlsaWJq
c29uLWMtZGV2IFwNCj4gIAkJCWxpYmN1cmw0LW9wZW5zc2wtZGV2IFwNCj4gLQkJCXB5dGhvbi1k
b2N1dGlscyBcDQo+ICsJCQlweXRob24zLWRvY3V0aWxzIFwNCj4gIAkJCXZhbGdyaW5kIFwNCj4g
IAkJCXBlZyBcDQo+ICAJCQlsaWJkcm0taW50ZWwxDQo+IGRpZmYgLS1naXQgYS9Eb2NrZXJmaWxl
LmJ1aWxkLWRlYmlhbi1hcm02NCBiL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybTY0DQo+IGlu
ZGV4IDU3M2M3MDk2ZmViOGRhMTc4OWYyNTIwZTU1NjEwOWUzNThhMzUxZmEuLmNmMDYyNWFjNzI1
YWEwMDkxNzNiOWFmZTA3MmE2NDZhMTM0MDJjYjUgMTAwNjQ0DQo+IC0tLSBhL0RvY2tlcmZpbGUu
YnVpbGQtZGViaWFuLWFybTY0DQo+ICsrKyBiL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybTY0
DQo+IEBAIC0xLDQgKzEsNCBAQA0KPiAtRlJPTSBkZWJpYW46YnVzdGVyDQo+ICtGUk9NIGRlYmlh
bjpidWxsc2V5ZQ0KPiAgDQo+ICBSVU4gYXB0LWdldCB1cGRhdGUNCj4gIFJVTiBhcHQtZ2V0IGlu
c3RhbGwgLXkgXA0KPiBAQCAtNiw3ICs2LDcgQEAgUlVOIGFwdC1nZXQgaW5zdGFsbCAteSBcDQo+
ICAJCQliaXNvbiBcDQo+ICAJCQlwa2ctY29uZmlnIFwNCj4gIAkJCXgxMXByb3RvLWRyaTItZGV2
IFwNCj4gLQkJCXB5dGhvbi1kb2N1dGlscyBcDQo+ICsJCQlweXRob24zLWRvY3V0aWxzIFwNCj4g
IAkJCXZhbGdyaW5kIFwNCj4gIAkJCXBlZw0KPiAgDQo+IGRpZmYgLS1naXQgYS9Eb2NrZXJmaWxl
LmJ1aWxkLWRlYmlhbi1hcm1oZiBiL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybWhmDQo+IGlu
ZGV4IDczN2NhMzY0NWYxYmEzN2JkNjk0ZjdiZGYxOWMyYTRkNzI5M2JlNzIuLjU4YjViZTgyYTRk
YThhNzJiZDUyZGNmNzE5ZGFhMWE3Yzk1OGEzNTQgMTAwNjQ0DQo+IC0tLSBhL0RvY2tlcmZpbGUu
YnVpbGQtZGViaWFuLWFybWhmDQo+ICsrKyBiL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybWhm
DQo+IEBAIC0xLDQgKzEsNCBAQA0KPiAtRlJPTSBkZWJpYW46YnVzdGVyDQo+ICtGUk9NIGRlYmlh
bjpidWxsc2V5ZQ0KPiAgDQo+ICBSVU4gYXB0LWdldCB1cGRhdGUNCj4gIFJVTiBhcHQtZ2V0IGlu
c3RhbGwgLXkgXA0KPiBAQCAtNiw3ICs2LDcgQEAgUlVOIGFwdC1nZXQgaW5zdGFsbCAteSBcDQo+
ICAJCQliaXNvbiBcDQo+ICAJCQlwa2ctY29uZmlnIFwNCj4gIAkJCXgxMXByb3RvLWRyaTItZGV2
IFwNCj4gLQkJCXB5dGhvbi1kb2N1dGlscyBcDQo+ICsJCQlweXRob24zLWRvY3V0aWxzIFwNCj4g
IAkJCXZhbGdyaW5kIFwNCj4gIAkJCXBlZw0KPiAgDQo+IGRpZmYgLS1naXQgYS9Eb2NrZXJmaWxl
LmJ1aWxkLWRlYmlhbi1taW5pbWFsIGIvRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tbWluaW1hbA0K
PiBpbmRleCA2NGVkZjRiNDMxM2VlNDgyYjdiMmM1MjEyZmUzMWYxMDIxYzljY2NmLi4zODUwZmI0
M2U1Y2MzYmM5NTg2NjNjYTIyNWJiNjEzMGFlOTQ3Yjc2IDEwMDY0NA0KPiAtLS0gYS9Eb2NrZXJm
aWxlLmJ1aWxkLWRlYmlhbi1taW5pbWFsDQo+ICsrKyBiL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFu
LW1pbmltYWwNCj4gQEAgLTEsNCArMSw0IEBADQo+IC1GUk9NIGRlYmlhbjpidXN0ZXINCj4gK0ZS
T00gZGViaWFuOmJ1bGxzZXllDQo+ICANCj4gIFJVTiBhcHQtZ2V0IHVwZGF0ZQ0KPiAgUlVOIGFw
dC1nZXQgaW5zdGFsbCAteSBcDQo+IGRpZmYgLS1naXQgYS9Eb2NrZXJmaWxlLmJ1aWxkLWRlYmlh
bi1taXBzIGIvRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tbWlwcw0KPiBpbmRleCA5YjdjMGE1YjQ3
MDNlOGRkOTQ2MTQwNjczMWFmMjQ4YjA1MGEwYTJiLi4xY2EzZDZhZWZiZDQwMWRlMGY5MDlmMDU0
NDViNzVmOWU1M2FiYWZlIDEwMDY0NA0KPiAtLS0gYS9Eb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbi1t
aXBzDQo+ICsrKyBiL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFuLW1pcHMNCj4gQEAgLTEsNCArMSw0
IEBADQo+IC1GUk9NIGRlYmlhbjpidXN0ZXINCj4gK0ZST00gZGViaWFuOmJ1bGxzZXllDQo+ICAN
Cj4gIFJVTiBhcHQtZ2V0IHVwZGF0ZQ0KPiAgUlVOIGFwdC1nZXQgaW5zdGFsbCAteSBcDQo+IEBA
IC02LDcgKzYsNyBAQCBSVU4gYXB0LWdldCBpbnN0YWxsIC15IFwNCj4gIAkJCWJpc29uIFwNCj4g
IAkJCXBrZy1jb25maWcgXA0KPiAgCQkJeDExcHJvdG8tZHJpMi1kZXYgXA0KPiAtCQkJcHl0aG9u
LWRvY3V0aWxzIFwNCj4gKwkJCXB5dGhvbjMtZG9jdXRpbHMgXA0KPiAgCQkJdmFsZ3JpbmQgXA0K
PiAgCQkJcGVnDQo+ICANCg==
