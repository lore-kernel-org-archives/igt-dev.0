Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A904BC61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 12:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A35B10E652;
	Wed, 11 Jun 2025 12:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcSKAzxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822E110E652
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749645268; x=1781181268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WL/8XST11lqQ9kOXXShjDk52MNWUxevvmKXCYaWbevw=;
 b=XcSKAzxmPliNo9InxfhSMAUah5rJSM2xb77ldpLWPid49iWAnEU+cE+H
 EdmkkB7ek1JVl1mVER9TVikjb8vfidBiML9ekXG2SuTc4O5Ls61djHvI8
 XTnp1VuaTJW2GwZroAorfWT9RK0FFsc5ujm20oLG0me9YAwEpLCsieQ83
 793I+Ds45L4egZsSbGP9EahCqCaH1GtfclYQTHdZGvy9eu5DjTGSOBp/l
 mcdhCU0aliVIH9oSbcKyai/b3xcJVx/DWFtPAo/ayKpG7E3INFB23xU7n
 bEdcAuT4ANGcsyZAz3bRP3qYoz99synxlhureHy/bjb54zQlKe60/DEad Q==;
X-CSE-ConnectionGUID: VmYcFiikTKqJUE2DjzolgQ==
X-CSE-MsgGUID: HXBXYnufTb2brulYvoULhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51008767"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51008767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:34:27 -0700
X-CSE-ConnectionGUID: UD0r9RorQq2aNsfBNciXsg==
X-CSE-MsgGUID: vUgkQzqnRB+ucWAv6bDVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="151968672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:34:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:34:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 05:34:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFECMshZEgxN4m05wawUhtpi21TfAPIB/n408DtHNboBmEp0s+5sapxOHgjlJ3KYOzosCu+lfgPU0SDRZokRk6GkVJlQGQRkpUdOlpWYyHeEDaJ412x/J/YRMgzHD1FaZDj6AE+pbARgwoCm3b/13LMIehZ85ZeCc4vSt5BCdoMWUumOx+EGqYbC8/Bce37GFIP56x7BLXbdJNsRuuXrVeR32nIiIJasiC2fiiktmC/4C0HJQ8tUZGuGVd+auHGU8LaCLdSDAHvK5H9VtVrC+Nw2z8Cjpi9Wb3ZlnWrTDJHynqJHVeLMAEG64XGGzGvIIfWoHzlC2VSismbT0Lnrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WL/8XST11lqQ9kOXXShjDk52MNWUxevvmKXCYaWbevw=;
 b=ls364g21VUGotHOonkav0ZnYDP22+394YzCZiKEhxEZVwkSvdSN7wXLHi478BzpbA0BCGds5Uay2WINh6P5osOxZdfUVMh4ngQVxI+ptrPB2jbzmon4d1vfcj03EZeJmjEUYXIwawdNScT62BLkYC0GVx4F9LHldVQMlKSVG/WflH0E/t2l98fvxmcS0c6ZRqzOGI7gbO4eh6u/GpjdrMy+7zIvtj3Kqq+vg2RVwGatSfo+9HYvnzhe035EDc/t+jNzYBtcaDLrpF4lsC/ittsZgL2lehJVfrW1KEJJDuU6OMr/BzFLWDglSAylqfPO1arwb/RuD6a5GkYFddAGGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by DS0PR11MB6543.namprd11.prod.outlook.com
 (2603:10b6:8:d1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 11 Jun
 2025 12:34:11 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc%3]) with mapi id 15.20.8769.022; Wed, 11 Jun 2025
 12:34:11 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "rk@dragonic.eu" <rk@dragonic.eu>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [v2,5/5] CI: remove podman login
Thread-Topic: [v2,5/5] CI: remove podman login
Thread-Index: AQHb2s0hanqbkIPXvEiiUECEy8G5Sg==
Date: Wed, 11 Jun 2025 12:34:10 +0000
Message-ID: <b5acaa0173e2bc2be4b6fce60b05ee97375fd9df.camel@intel.com>
References: <20250611-bump_docker_distros-v2-5-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-5-90791ecb953d@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|DS0PR11MB6543:EE_
x-ms-office365-filtering-correlation-id: 1978cb4e-7b0e-40b3-11d0-08dda8e4446e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NThNM2tkSW8rUlVQNSs4ejhwdlpmczU5cHVKQzM0Tzg4azZFZkxTL2lsZU1Q?=
 =?utf-8?B?WkxCcDlDM0d3T1RFdjllZmI5OTFsdHRlM0l0K0lYMnhmcXVIcDB5VWUwTFRq?=
 =?utf-8?B?MGxDeXg4aGNLU3dhdkNYNVFIYTUxMTlBYStadFFyOFF6ZjFKMnpQNzZ0RXdX?=
 =?utf-8?B?ZVBoQnlIK3RJTktUcDROK0I2THZIU2ZnYlFuU01CT1hQOUh4RkhwMEg1TG8y?=
 =?utf-8?B?V3hGRWNpRWFRKzcrRmR1TTUzZTZuamxOQUpoTkxudzFFa1NEd29XTXdxRHo0?=
 =?utf-8?B?ajhWNjB3d1Vqc3U5S3VKV2E1c1dVOFhmV0dQNi9qa1pLaEIzaVJOM1BlTWhB?=
 =?utf-8?B?TGIxOTR5SlFDYTcydTdXbjJrOFV5YmhHWWRZN0RVVnNUbVAzU3RZWlJBRjJy?=
 =?utf-8?B?RmhFOUllSmVoMHBEcnB1eTU1SktiWWRvdTNjTkZUVUd3Vjh3ZG54dnlyS0FC?=
 =?utf-8?B?TUVJdVREK2g3TFRMSnZCWjJHR0VRaHBhb2d1ZjVaWXdoOHRXVk1GUGR2OGdE?=
 =?utf-8?B?RWxmQm9ML0ZHSjQ4UEVsV0pwNmRPODE3QkpvNkhRN0l2dW1nQUNzVjdDa2Jl?=
 =?utf-8?B?amRYYXZ4U21ZSGdyRTBZNkZKY3NPQTBZcHF3cHJmY2tKcnI1ZjJMdXJQREM2?=
 =?utf-8?B?ZzY0MEVtdldQUHRuZHpBQVZtb0Jra1EvQTdyRzVzSDZVRExvS2hDZlFsSnZU?=
 =?utf-8?B?c3IxTG1Xci9PNmRZL0dSY1A1TndpR2ZXNHVwUVAySy9NenZVcGc3empUUENk?=
 =?utf-8?B?TnNkcXhLamhqSUk2bGtneHoyL2dxWWJwMk9BMHgzTnYvQXlPeFNVdU9FY2pI?=
 =?utf-8?B?TUVZMEM5Q0tRYmdhM0Y0NndzaUVWdjJpeDJZRVM1Vmp3VWRyNmE5clBXQkw3?=
 =?utf-8?B?amU0ZytpN1lFMVhPYTdYMXpiUGF6eFZhVG1ZeDhSYnBzUDVWY1RERno3eHZh?=
 =?utf-8?B?MU9HeWhWRW0yODBwWFBiNFc0RU1ockNmTG1TM2hyWTdDRldrR3NBTkhUUVZh?=
 =?utf-8?B?V0xISDVIYldTYnJ4dC9IcnArVHhSRHdFekg1LzZWTFhoUy90eThwVjlHL1Iv?=
 =?utf-8?B?dnZ4YmNScTFscWl0b29zUnBtNHNGTWEyRFVHVXVnQzd5Q1AxVmZZcGRRQ0wz?=
 =?utf-8?B?U1NmSnJlZUFWSkcyRTV3c2ZWejAwd25oQy9oVjBvcWhsNERxRDkvV0pNSXUv?=
 =?utf-8?B?YXFiRXhuQTFwYjJUSU1EWDZRRm96QXVvMDZvMzk3Zi9CM0xzbHJRMjhLQVZU?=
 =?utf-8?B?cE5JL3VLSElmb05pV0toQlRXeEo4ZlFiYnM5dDVFOXBGeVErQTRHWE5EMTFt?=
 =?utf-8?B?Z1ozWEdneFpYcm9CTGVMdmVZaEdkckRtbUlSWnllUm5ORE5Ya0ZHTWpVcFV4?=
 =?utf-8?B?bFV0Wm5sM3lIazFTRW9QRm85THQ0eWJXN2ZkSzBNNGFaaVEwY3F3dFYxcjBY?=
 =?utf-8?B?amN6dGpjR2M5N0hJTmQyNHV5OGc1NnVDcExmTGo5dWk0WnhhMC80ZGVvKzJN?=
 =?utf-8?B?UEM4cWUrNk8rUFFuU1VBbzJ2UmVoTUZFMEZ2VDMrRWloM2hRT0taQzc3czU4?=
 =?utf-8?B?TlVFVTdVSmVNY29adHdSWFFSQ1o4MkJFa2xIcmdpNE1WTURaMHd2ZmdOVmZK?=
 =?utf-8?B?TWZKUGhFV3pYV013T2dJdkZwT1NuSlZHVG1lQ1RzWGlVZTlxMWU3T1J5ckdn?=
 =?utf-8?B?c1Z6ZGphSXk2SG9SWGg2cDhvajJaM3lMVUxuQ2lMRzFPYk1KS1hhT2pMM3pn?=
 =?utf-8?B?eHE4NllnMmxvTkxQSUNqTzlmR3kyRnN5MGxOcTNVakpMZjJEeWZGZjJjUHQ5?=
 =?utf-8?B?ZG5RSUVqem5UdVF0bU10amR1VDJLbGp5M0orbVdHZVBSZHZpWlhaVnluak1l?=
 =?utf-8?B?UzBlVHBKc0xtS3FtMGE4RGYwRWREdUVxVFdEVFEvQU0xcmNQU1UvZzNadFFu?=
 =?utf-8?B?Y3hJUzFTOTRkYmowTmhjdXcwYlM4RmRpSEZQTEg0K0UwSzlZay92NXZQemtT?=
 =?utf-8?B?Ym1ablB0T0NRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEJkL3JMZTFGTnFPdTljWFFMdEd6T1Z6VS9VaGxJelFzcG5NR25BbXdiR1Rw?=
 =?utf-8?B?NHJmSnhXU0xpLzQ4d2ZSS2lhWDlYbU9NL0psRzVBUitCU2t4SG84Y29MSE5m?=
 =?utf-8?B?bWk4czNQb3pnbk5FNTdibkhOeXFYYUZEZGhCSVcrSGtaZmszUXFtSWNKd3Jt?=
 =?utf-8?B?TFgrREthWmt5MHhoQ3Flc25GM0FoM1ZJSS9CcnZKSS82em9rbWdORURrUjkv?=
 =?utf-8?B?SEZubmpYNDJmbWRLUjlqbjR5SzJGNncrNFZiUzFvamZUVnZ3Z0tsVEZkREJV?=
 =?utf-8?B?T2NHeE5nT2RNRExLdDVYNzJBSWdCZm01L3VqQ2hWVnVWcU85WitxQVNRb3Jk?=
 =?utf-8?B?S0Y4YVNDbHhld1dzcHRGaDcwakM0YVVmSVlIWVpEelo5N0RjbGlFbldrWUYz?=
 =?utf-8?B?SDlZVGJYVzlYNkg1RGFBa1MxMXpFbU0zZjRmcTRWUzltMElpYkNTRHFYUVVW?=
 =?utf-8?B?Z256b01lT3VFcWg1K3FXeEZ3RmMzZXhDUXlVSHh5aVFTbkwzTS9mcmFvZXNi?=
 =?utf-8?B?V3pibHFobWk5RFlHQ0U5NUVnWDRiMDhKVVEzN01yakczenVucjBvYTFRQ3dP?=
 =?utf-8?B?REh4V3lEbnY4Zm53QnRmdUJVUE1mUDNUci9FYTNYaG16cUEwcnBXRmVpWTND?=
 =?utf-8?B?WTFvTmFsY2xTNHE1L3JBVkRoTHU3b3VzaXJNVUthUDNmQktkQ1J3eVZaSVVl?=
 =?utf-8?B?dy85TCs5emhuR1ByMmNWeDVSUzJyQjdDSHN4ZUsrZTZ3VElZOXgzT1RoSDFZ?=
 =?utf-8?B?ZngxdW5JWHZiSk13RklqVmxRS294WWZTNit2MUhWZUV0cFR2ZDZBNjVDN1BZ?=
 =?utf-8?B?SHhmZVFLNUZzUTY0QlhTVHVjU01DZGhBUjVpWThNRis3TS9aWjNPTm1TdWx6?=
 =?utf-8?B?YUdYU3hXZEd2SjZmbWM4NlM5NkU1cGZXNEQySFBYWXFhRkplU1JQWlAyTmRv?=
 =?utf-8?B?czkzTjBIeVlXbUlFbHB6Ti9KQkRtWmRCWmhsdE00a0hrT0ViK2d4UjExWGRr?=
 =?utf-8?B?SlpRcFVFUnpzd2R5WS9wTUNLMG5jR3hZMFgxM0xZMHZyU1k4N0YrSUZHWTlV?=
 =?utf-8?B?V2J6N2pTcnFJTmF3d0g3TlNIbkF0MVhjOGN4RjlDV2djczlrKytGMTdTMnR2?=
 =?utf-8?B?SXprVlJWajVtWlF1UHFHTkxUQzJHTjFla2ZjbTlPVmNmUVdhdURvTWtGOEpD?=
 =?utf-8?B?VTZjYlk0dGxWZVZHcWZSK09FOFE3RU5pOWlGeWlnZ3J1cVV4MWFCQWFOSGsz?=
 =?utf-8?B?d1Y3NVFpRWhsbCtYRjBHTmxEdnR4cFk3ZncyN0hqcG5vSk1qRTF0UllxZzE0?=
 =?utf-8?B?TXZFVGhaclVlVFBTOXdWeU9GZnpyVHpZUndid0RrOVgvVkdPZ2hLcE1aNGZQ?=
 =?utf-8?B?OVphREFONUh1RXhjUE5ybWUyS2t4eXRMdit6ZDZrcUEzNUZsWXZobmY0SFV0?=
 =?utf-8?B?YmttK0dnYlY5NVpvekNiRjg4akRIK04yVEZZbDVyQzk1dzRwem1iNG4rb200?=
 =?utf-8?B?Y1FQNXRsc3lyc016SFpKdVFERXJNZkRWcGJBakYxTFI4azRuYmE4SmJYZVNF?=
 =?utf-8?B?NGxtcytOYUdCNXkrbDhtcDQ5V2dUQmVrYlRjRFl5cXRNR1YzUTJQRC9jV01r?=
 =?utf-8?B?UDNCWnI1WC8ybEFPR0d2U2R3eUE5M1FPa0k0NVpsMDYyQmwxUCtsQmsrbUQz?=
 =?utf-8?B?eGxmN1IyNjJxL0VxdU0rL0xCNmxrTWs5UFFmeXhtNXpoRG42Y011WnVjZHpB?=
 =?utf-8?B?TVFFVDJQWklSOXUyTDJzYmlJMVFBTmpkd2tEWElRb3EzaTlHcGFaQkF4MzN3?=
 =?utf-8?B?aHpxZUxBbW5nNUFUdHpKQ1BlRGJLNnBKMXVKL3E5OE1uWDlHNmNFMXdjNUd4?=
 =?utf-8?B?M0o4QzY3bHhmdXh5RmtDYi9BM2NHU1VhdFlqK2t4NnczdnhodndXaDhGSktU?=
 =?utf-8?B?WC94dUNEeHkwTzJCWGo3bml0S0gyY3NFNGhrSUN2aWtkU3F0QjFyMVlSL3V4?=
 =?utf-8?B?eW5Pbmd4U0JVajJDQlo2NTFILzdsazV3NnphNHNXa0VGajQxd3luNkh3UDZQ?=
 =?utf-8?B?ZTliN0daZ0ZsVnk3cWV1OGY2MVVIcXYyM2dvTFYzZ0RRNjdnOWVMZWZuK3oz?=
 =?utf-8?B?OE83dHRXdEpWa0ZCbm03TTVYSFFXRnkvay9jdFFiVEJIL1UxWk4xbytVS0VR?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0550435522C8EB45A3C8DE4E4E089423@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1978cb4e-7b0e-40b3-11d0-08dda8e4446e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 12:34:10.9921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlRgpgp9uv3RYF/xO3xg6UP6VMz0+oPXWJJ9MqhqHBeCTbapmM8yN/5MP53s3S1fWIc3EmGOuegmLPRXVcw4pA==
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

UmV2aWV3ZWQtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCg0KT24g
V2VkLCAyMDI1LTA2LTExIGF0IDEzOjA2ICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOg0KPiAi
cG9kbWFuIGxvZ2luIiBpcyBpc3N1ZWQgZm9yIGV2ZXJ5IGNvbnRhaW5lciBqb2IgZXZlbiBpZiBp
dCBpcyB1c3VhbGx5DQo+IG5vdCByZXF1aXJlZC4gTGV0J3MgZHJvcCBpdCBpbiBmYXZvciBvZiBj
cmVkZW50aWFscyBwcm92aWRlZA0KPiB0byBjb21tYW5kcyByZXF1aXJpbmcgaXQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4g
LS0tDQo+ICAuZ2l0bGFiLWNpLnltbCAgICAgICAgICAgICAgICB8IDUgLS0tLS0NCj4gIC5naXRs
YWItY2kvcHVsbC1vci1yZWJ1aWxkLnNoIHwgNCArKy0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS8uZ2l0bGFi
LWNpLnltbCBiLy5naXRsYWItY2kueW1sDQo+IGluZGV4IGFiNjk2OGI1NDlkMDAyNjg2OWZlMzhm
MDYzZjYwZjU3YjVlOWQ3NWMuLjUxOWVkYWI1ZmY5Yzc5ZWFlMGRlNzFlNzFlM2YzNjQ1NDMxYTE0
NTkgMTAwNjQ0DQo+IC0tLSBhLy5naXRsYWItY2kueW1sDQo+ICsrKyBiLy5naXRsYWItY2kueW1s
DQo+IEBAIC00OCw3ICs0OCw2IEBAIGJ1aWxkLWNvbnRhaW5lcnM6YnVpbGQtZGViaWFuOg0KPiAg
ICBzdGFnZTogYnVpbGQtY29udGFpbmVycw0KPiAgICBpbWFnZTogJEJVSUxEX0NPTlRBSU5FUlNf
SU1BR0UNCj4gICAgc2NyaXB0Og0KPiAtICAgIC0gcG9kbWFuIGxvZ2luIC11IGdpdGxhYi1jaS10
b2tlbiAtcCAkQ0lfSk9CX1RPS0VOICRDSV9SRUdJU1RSWQ0KPiAgICAgIC0gLmdpdGxhYi1jaS9w
dWxsLW9yLXJlYnVpbGQuc2ggYmFzZSBEb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbi1taW5pbWFsIGJ1
aWxkLWRlYmlhbi1taW5pbWFsDQo+ICAgICAgLSAuZ2l0bGFiLWNpL3B1bGwtb3ItcmVidWlsZC5z
aCBiYXNlIERvY2tlcmZpbGUuYnVpbGQtZGViaWFuIGJ1aWxkLWRlYmlhbg0KPiAgDQo+IEBAIC01
NiwyMSArNTUsMTggQEAgYnVpbGQtY29udGFpbmVyczpidWlsZC1kZWJpYW4tYXJtaGY6DQo+ICAg
IHN0YWdlOiBidWlsZC1jb250YWluZXJzDQo+ICAgIGltYWdlOiAkQlVJTERfQ09OVEFJTkVSU19J
TUFHRQ0KPiAgICBzY3JpcHQ6DQo+IC0gICAgLSBwb2RtYW4gbG9naW4gLXUgZ2l0bGFiLWNpLXRv
a2VuIC1wICRDSV9KT0JfVE9LRU4gJENJX1JFR0lTVFJZDQo+ICAgICAgLSAuZ2l0bGFiLWNpL3B1
bGwtb3ItcmVidWlsZC5zaCBiYXNlIERvY2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybWhmIGJ1aWxk
LWRlYmlhbi1hcm1oZg0KPiAgDQo+ICBidWlsZC1jb250YWluZXJzOmJ1aWxkLWRlYmlhbi1hcm02
NDoNCj4gICAgc3RhZ2U6IGJ1aWxkLWNvbnRhaW5lcnMNCj4gICAgaW1hZ2U6ICRCVUlMRF9DT05U
QUlORVJTX0lNQUdFDQo+ICAgIHNjcmlwdDoNCj4gLSAgICAtIHBvZG1hbiBsb2dpbiAtdSBnaXRs
YWItY2ktdG9rZW4gLXAgJENJX0pPQl9UT0tFTiAkQ0lfUkVHSVNUUlkNCj4gICAgICAtIC5naXRs
YWItY2kvcHVsbC1vci1yZWJ1aWxkLnNoIGJhc2UgRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tYXJt
NjQgYnVpbGQtZGViaWFuLWFybTY0DQo+ICANCj4gIGJ1aWxkLWNvbnRhaW5lcnM6YnVpbGQtZmVk
b3JhOg0KPiAgICBzdGFnZTogYnVpbGQtY29udGFpbmVycw0KPiAgICBpbWFnZTogJEJVSUxEX0NP
TlRBSU5FUlNfSU1BR0UNCj4gICAgc2NyaXB0Og0KPiAtICAgIC0gcG9kbWFuIGxvZ2luIC11IGdp
dGxhYi1jaS10b2tlbiAtcCAkQ0lfSk9CX1RPS0VOICRDSV9SRUdJU1RSWQ0KPiAgICAgIC0gLmdp
dGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQuc2ggYmFzZSBEb2NrZXJmaWxlLmJ1aWxkLWZlZG9yYSBi
dWlsZC1mZWRvcmENCj4gIA0KPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMgQlVJTEQgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIw0KPiBAQCAtMjYzLDUgKzI1OSw0IEBAIGNvbnRhaW5lcnM6aWd0Og0K
PiAgICB2YXJpYWJsZXM6DQo+ICAgICAgRk9SQ0VfUkVCVUlMRDogMQ0KPiAgICBzY3JpcHQ6DQo+
IC0gICAgLSBwb2RtYW4gbG9naW4gLXUgZ2l0bGFiLWNpLXRva2VuIC1wICRDSV9KT0JfVE9LRU4g
JENJX1JFR0lTVFJZDQo+ICAgICAgLSAuZ2l0bGFiLWNpL3B1bGwtb3ItcmVidWlsZC5zaCBpZ3Qg
RG9ja2VyZmlsZSBpZ3QNCj4gZGlmZiAtLWdpdCBhLy5naXRsYWItY2kvcHVsbC1vci1yZWJ1aWxk
LnNoIGIvLmdpdGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQuc2gNCj4gaW5kZXggNGY3NzQzMWI1MmIw
NmZkNTk3MWI0N2VhMWFhZGNmMGU4NWU0ZWRhZC4uYWExYmRkY2RlODhkOTI3YTg5MjUwMTA3MWRj
ODQ4YTM2YjJmMmY4NSAxMDA3NTUNCj4gLS0tIGEvLmdpdGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQu
c2gNCj4gKysrIGIvLmdpdGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQuc2gNCj4gQEAgLTQ3LDcgKzQ3
LDcgQEAgaWYgWyAiJFRZUEUiID0gImJhc2UiIF07IHRoZW4NCj4gIAllbHNlDQo+ICAJCWVjaG8g
IkJ1aWxkaW5nISINCj4gIAkJJFBPRE1BTl9CVUlMRCAtLXNxdWFzaCAtdCAkRE9DS0VSTkFNRSAt
ZiAkRE9DS0VSRklMRSAuDQo+IC0JCXBvZG1hbiBwdXNoICRET0NLRVJOQU1FDQo+ICsJCXBvZG1h
biBwdXNoIC0tY3JlZHMgJENJX1JFR0lTVFJZX1VTRVI6JENJX1JFR0lTVFJZX1BBU1NXT1JEICRE
T0NLRVJOQU1FDQo+ICAJZmkNCj4gIA0KPiAgCXNrb3BlbyBjb3B5IC0tZGVzdC1jcmVkcyAkQ0lf
UkVHSVNUUllfVVNFUjokQ0lfUkVHSVNUUllfUEFTU1dPUkQgXA0KPiBAQCAtNTcsNyArNTcsNyBA
QCBlbGlmIFsgIiRUWVBFIiA9ICJpZ3QiIF07IHRoZW4NCj4gIAkjIHdlIGFsd2F5cyByZWJ1aWxk
DQo+ICAJc2V0IC1lDQo+ICAJJFBPRE1BTl9CVUlMRCAtdCAkQ09NTUlUTkFNRSAtZiAkRE9DS0VS
RklMRSAuDQo+IC0JcG9kbWFuIHB1c2ggJENPTU1JVE5BTUUNCj4gKwlwb2RtYW4gcHVzaCAtLWNy
ZWRzICRDSV9SRUdJU1RSWV9VU0VSOiRDSV9SRUdJU1RSWV9QQVNTV09SRCAkQ09NTUlUTkFNRQ0K
PiAgCXNrb3BlbyBjb3B5IC0tZGVzdC1jcmVkcyAkQ0lfUkVHSVNUUllfVVNFUjokQ0lfUkVHSVNU
UllfUEFTU1dPUkQgXA0KPiAgICAgICAgICAgICAgICAgZG9ja2VyOi8vJENPTU1JVE5BTUUgZG9j
a2VyOi8vJFJFRk5BTUUNCj4gIGVsc2UNCg==
