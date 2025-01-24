Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96185C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 10:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FE310E008;
	Fri, 24 Jan 2025 10:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICVOiTKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F15D10E008
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 10:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737715658; x=1769251658;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=dlO9eElmWIVI+f5gDz1fsrpK2DhSn1MY/wgmmy+UL6M=;
 b=ICVOiTKXfKtuKhv+5ri1izHS27A4EySqB42+ZxWHh5muQgYxrUCz7osl
 HE9eFlnfq9+J+0pfofrrV+wqoOajJChWfCgpYsZlYWRGxGMB/7CxsrSb2
 9+8duOqO589SaLM79nzyqwOEqw8t4IftMVHTPjtHc+0ckB9W6DHb7qx4r
 DJsFxbtlQf9OHrZd5BXRVjexwz3XYqRM7PLo2GJAh4v2ehmkF3jTiMzMg
 784O3r3KTplhs/m8n6xW22kUIi0mFdpmriOM//IXC8Gvv/8BAjghxJfWs
 2GA6M18+FdOdBkXdY+ZZnAxBpsEXimsBotZ49dngVoO3RyO8IUxUPB6Rb A==;
X-CSE-ConnectionGUID: coExFwZrRCiGUPC2eoMj3g==
X-CSE-MsgGUID: D6KZIFtZSMiDm+aSV18fHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38410765"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="38410765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 02:47:38 -0800
X-CSE-ConnectionGUID: YK+8jqRORiaGnd8BCMIDMg==
X-CSE-MsgGUID: +/AwOUXJTQSPfZgGCUmExg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108280234"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 02:47:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 02:47:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 02:47:37 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 02:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcZxIVvACy32K4vSJOect/Bx3Af/TPXP1Be888Yh5rJMdGnG9YdAqNq3ZZSauSjRZoIRBxa/gaRwQWu+FUEF+VhZhbTqErKUAu/IUgpwq+V2NOJaKgH1JBhvb+8so1lklQQ/pw3zM/QohUogyBzi9yg/A6l450u3N0szOj4hEcleY+od7y38jbJ4t0wu1z+IDah/lngVNzjevpirtlXHdYm1J15iGLWmbmpDA1KidoqtRpKQO9ze/zl8bjvDzst63kLbet95O6OQ5F7zgrWSQW7/7JzXqhIs9wnJFaAH0rFJcc38bBA1bqNrGz7XVls7HBqhllxNM9TPd3aE8A5IpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlO9eElmWIVI+f5gDz1fsrpK2DhSn1MY/wgmmy+UL6M=;
 b=AqjGhgtiW6yfUL9i6cvpbMxKOr2NAMn4/0fitPdWTkwkbOgmZP9k/PLjljpjU1F55uWVpt1h6Z0EC/ByTIZ3PovOS4/n5rzAwM07jDMWM9uOIP5RDiDMo/erv6UorY2F27G4moVfSwqhrlMpziVCheLxkVwljAU5g07Sqqg3l2MD9qfN7/u+cMClXDlsXm6arvoRJZGSlPI4Mpk2W3hPJTTONFWF6UTwnRSmhVJ8gMJHUsmYEEwv/aF/hZWdH7y0YTwLc4Eg9BeCrJYS71NRvgXnFIIno/SYcCgVXLleQiHZEMtJ0XjqTMP2VBcD2mn+uBA0F3BcCerwquv14BdeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 10:47:36 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 10:47:36 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_eudebug_online: breakpoint-many-sessions-*
 add delay before resume
Thread-Topic: [PATCH i-g-t] tests/xe_eudebug_online:
 breakpoint-many-sessions-* add delay before resume
Thread-Index: AQHbbkyKaMRI9NajqkeCw7Ew2FyvfrMlviQA
Date: Fri, 24 Jan 2025 10:47:36 +0000
Message-ID: <00452bc5736cf2ba6b367003b28c8b84340eaf55.camel@intel.com>
References: <20250124104107.3626601-1-maciej.patelczyk@intel.com>
In-Reply-To: <20250124104107.3626601-1-maciej.patelczyk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CH3PR11MB8342:EE_
x-ms-office365-filtering-correlation-id: 716980d8-d993-4091-47e8-08dd3c6483b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U0FpMnFadkRHYVFXWitlZFhMTWVpMER4ZE1yc0VBOEludkY5V1RSYkc0ZDJS?=
 =?utf-8?B?dDgvTkI4aFFjeWllSFZkT0tUZzUzRGhVd05vUWNFY2lOZTVyWGN1ZFkwMVVD?=
 =?utf-8?B?VElWWnpjL0hYS256RkhXcVJNWUFXTTd3RlhNMUtUMDNNenhGMDNrQW1Ralcy?=
 =?utf-8?B?dk5mQXB5R3J5Um4yR3NlT1MycFRRMElWTlp1ZG1rOHdDYkc3blRtNWJ2dTRQ?=
 =?utf-8?B?bXVlR0tuMHBXdEJiUjNScTBFeHlHLzJPSE1aTlZpTmZKUCtQQUJQRmcreU5F?=
 =?utf-8?B?eVNNQ3FHWXRyYTMydk1FRFcvRFlZZWVVNW9VU0k0aHd3UHJ1WTdJTERtYjRW?=
 =?utf-8?B?NmhsTmRRZTlvMjkwb3hpRVI2UWxzMnpOM2ZML3VHck4rclJCaTdJcHYwaG5h?=
 =?utf-8?B?SEl6NUNqM1FSY0M0L3FrSEZuSHR4YjJkbGxUZW9kSzJ2bjNPTEJaMHROQ3V3?=
 =?utf-8?B?cCtCbTd4ZHFkTlUzRFdWZzgzOUJMbGZ1dC93REFXNEdFbGxRT2F0c0hrU2U1?=
 =?utf-8?B?cnFlcU81RUJKVWh6SmQ3Vk1iU1hscDVCSE9yVkxzRnhLMGNBR2tVQ01zTis4?=
 =?utf-8?B?UUlubDFlNExKZHRaNW5NblgyaENIS3QxeE93aUZKQlhtR2VPazNFdUFldStZ?=
 =?utf-8?B?MENsQnZLQmpFOWJBMzExZU0xZHFmMjdtVzZFd1pHUEJOalpJNDFiLzdUbFho?=
 =?utf-8?B?bzdwZFRDS2cvTFI3cUFiSENEdTNvdjVQOUZHcStwWGdYeXA4RlpzUUhNVW8w?=
 =?utf-8?B?Nm9pdExiTktOaTg4UWhaV2VRRGErRDZUZllOb0c2Y0ZYcTlsanRnK09FbDFN?=
 =?utf-8?B?TVYxSG9wYzh6VXM2dlVreEJSRGs1Vzh1ajFudkhjVUZhRDREZnhLNnE1MWIy?=
 =?utf-8?B?c24waEJ6UnRreFZSVzgraVN4cTFnUUdPaG5FYVVpL1M2eDZ6STh6QnZoS3dk?=
 =?utf-8?B?WVZScGduS01lSVB4S2pRWndIZGpheENFdEMxc2F1YVdBQXdvRG9VdnV6Y2dI?=
 =?utf-8?B?U2FUWW1yMkFZdnRpRTd0MEhpOW1tV0R3NnVSc2xxUTRhRjVMNktLclNIdXR5?=
 =?utf-8?B?TC9rWlNVQ3ZnK3VCTEQxWisvZFhPQW9SaDd4bEZoazNrdEFZbVRVcThEWWtl?=
 =?utf-8?B?bEIvL2tqc0JGMWJuMkJ0Um1VU2hxSituS0Myb011MFdvOWxNRDJXaVBWN25L?=
 =?utf-8?B?OVU1Q3lSaFRlUk5SbGFGaHpOeWNiOGtzdlArb2FVdlRjTERta3lSU2R1d2lZ?=
 =?utf-8?B?d1ZrTGhHTUIvMnJCNGVhczBMSmV4WjdpeXFxaElpQWswbE9JbjVvanpTQU0y?=
 =?utf-8?B?cnBtZUZEaGVnZGRZUFkybzVYd3NZMW55OG80NXRMUUF5MzJaUWxXVzE2elM2?=
 =?utf-8?B?Y3BSRHlXNkFsaXRsOG9LaExpSFJNUU0rb1FQS3BabFljdzhYdjdFYWxHRWpV?=
 =?utf-8?B?akFaRC9wTWMxRjgwVGlIV0hhN1g0M1hnTzZSMDdBWVk2MXBxYmxyNWhBc1lt?=
 =?utf-8?B?WFhwandhNzZZUTUxR2hkYy9mNXkwUmVuT1YyVlR4WVhHU2xWcHI3cmRGS2xC?=
 =?utf-8?B?cDBLdFBHVUp0NHFEQmNNT0o2K1FNZ3BPVE5FMXV0VEVOMWdXaGJFd0lLNmJ3?=
 =?utf-8?B?VitvN2Q2b3Qrb3JLYkdERko5REtvUEd1SnBHT2xCRWl3QVQ5WXE0N3RxYlFP?=
 =?utf-8?B?RFR1KzdHRzBaV2o4NG82U29HekhMc1lWZjlsVWJHQVV3cWlueWl4K1c1V2xp?=
 =?utf-8?B?WXpKcllwZG96RVY1VkE3a0laaEh2dytvcUpOcFdEZ2VNbUNDMEZnZHEyTDJQ?=
 =?utf-8?B?YmNaQjlGUDJ5RWErZFVPU3F0NnV6R3BpVnh2TXBVL291MWU4YjRrWVkzdHRw?=
 =?utf-8?B?cEorUjBVMDI0cU52Y1VBSzZES1N6dHNLamFuT1Q5RTRJam5PbU5Lc0QzOWh6?=
 =?utf-8?Q?+rRFWz7CT3ubPNvG3L+LTeib837uXtOn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXVuOGEvWmxUcXRKZzBXcEM0bkNsVys0cjI4QXVtT0hrU3Q4SWl1UnFNKzg2?=
 =?utf-8?B?akJUUm5ISjEzQitNZUFRYlN5RUk5SGE3SklNRDlBa2FWdTVWRmZlQ2gvVERt?=
 =?utf-8?B?N1BqdTBubktLbzNTZkRPZWRwV21zVVE4UjFtMDYxQ2NYd0w4TWRyY242azN5?=
 =?utf-8?B?dUpVSmRDQWhYVTlBMDcvSktVOGIrL09ZSSsvRXF1Z01VbVRVSVBzcmV5OWIx?=
 =?utf-8?B?NkhhTzB3dXZJbERzVFdONVFIMkxTd2pVSXVOQzRYRGU1dFhRY2RJbGgvNm91?=
 =?utf-8?B?dDBtY0tmTnROR1g4bHY1ZkUxc0FZcGhaMDdoSjVPU3I4RXUrOHd2VXRWdnR3?=
 =?utf-8?B?d0ZuanNBaGowa0JMZkQ3UTA5aW52c3lDY1ZOWkNUTTFaWGw5b3N6VDM4eVZa?=
 =?utf-8?B?MU5xYllCSHlzaHI5L0tLcWtKWWE1SlBmUWM5cWVLNTg0eG9MTFRQSUpNRThH?=
 =?utf-8?B?Yk1xT1grTys1bG4zZFVhb0xzWkFqeXQ1ZG9vaGJ5bmlIOEMyMmhNc2Iwb0hM?=
 =?utf-8?B?d0tlWWhJeUZRZFBFK0srVm9rcUkyYXZhZE8zdGFiSmN2anNMT2t5ajI4ckxQ?=
 =?utf-8?B?bUlIWVpEaVVoUEZ0ajFSUHhsUklrL2xwbFFTY2JaWkh1cTV5V0NOWnlxZmg1?=
 =?utf-8?B?cHdmbSsvdHdmM2dxS3BrV2dFbjZWelFxNzlONitPR1dpSHB2TThEdGUvVzgy?=
 =?utf-8?B?MFNmU05qT2U4N2RvV1lXZDlwQi96N1ArNkUyRDdseUhxUjkycG9tMDc0QTBB?=
 =?utf-8?B?bEZGVFlPVHNhMFoxMjhhNlFSREtzMVZ1ZmQ2bGxrQWIzck9YVVRjUmF0bjlT?=
 =?utf-8?B?REpUektzbzExZERhWjNNVXpleFhLVmxNUU9FVEtCUzFMQWY1SkNFVWd5TG12?=
 =?utf-8?B?MFhiK0x0VlJXTVZhMlM1Mk5rNFBwUTgrcElkaDdHamRRSFJ6bmliU0g2dmpD?=
 =?utf-8?B?eWlKZ0lQak84REl6S3hmSEtOWW5ld3U0MkxWbncwcUVrNzFiZ05NWi9vbWwv?=
 =?utf-8?B?Q3I0dzUyV3IvRFpoKzFMaGxENnExUGowMkxndFc3YThKV0h1dzhmRCswR3lw?=
 =?utf-8?B?OGlYZFFCckVKYnFsNThqWkF4RitoV1pLeHRwRVl0SFN2OUR6ZVlMS2xmVnRK?=
 =?utf-8?B?VkRkS29PWHJSNGpHUWMzQXl4NUlzWGllbGE0anY3ZE1veGgvQkxqd0FxZW9X?=
 =?utf-8?B?NDNyelUrZ1VINlA5OVE1ZENvNk5DRERDK0tzcHBmbVJ4MnNNeDY1RVZMTFFV?=
 =?utf-8?B?c2JQbHdXdmVGTUJPbXdlbkJ2SXZXMWJTNktLc3l0Z3Y2Y21hSkhXcEhsT3RT?=
 =?utf-8?B?S2J3WkhqUTU2VnJScVpUcVpRdkg1c0JtRytlTUx3c1BqWGtUamZVRUxMNVJN?=
 =?utf-8?B?bEREdEVCakxyNkx2VHR3RUU2M21GRGFOY1A1ZFdOU1VVbnRCbmVCeWdoWEEx?=
 =?utf-8?B?ZEMzd2ZKeGJDTWdEc0RZKzVUMDFYdWlETXlGRkZDbEJwVHpGaHN5UmtXUU5P?=
 =?utf-8?B?NlF1aVg0UE1oU0tLR1RwM29CZDJTMDZvWWdPYzN2U1MxanNhdUJJREJObXAr?=
 =?utf-8?B?Q0pnb2ZrOTZPbjdQSWVJQ3FJNmZJY2pJRjlMci9hMTlhZ3AyNmNsV2didlo1?=
 =?utf-8?B?NVdDVXRUNlljaUZrSTJrdGkwV2x3c24wTXY2NkRCUDVGc1RHRmtuYUJKTkpN?=
 =?utf-8?B?UVFmWGtnQ0l2Y2t4c2pYWUxRV3QrL2RIRjZMd3VIbjhjci9wNEcrTy9DZmtw?=
 =?utf-8?B?TklsQ0MvR3ZNME9lQlZYQWhJMFJ4a2NtNlA0aG54ZmFEekkvR3J1L2lYNDZM?=
 =?utf-8?B?dUF6ZVFZSVpFZEd4OExBcW1XTEhMOGk0U2VOTXFyWWp6dk0rNzRiUmc4cXR1?=
 =?utf-8?B?UThiZjN2dGtZNzZrZ3dWV3lZMThhNy8vNWNObW1xR0VZdTJaTnVVekM0bHg0?=
 =?utf-8?B?MjMzY0JOYjgwSWpaZFJYTjhZQStsN0VQYzc0Z1RCaWJKZFI5TzJsQ1Z4YXQ0?=
 =?utf-8?B?VGlUZG9PY0tPZ3UvbHFlNU9kVkVySGNQQXJ1YW1VeUtRbVdlQTRQOVM2eUJX?=
 =?utf-8?B?SGJQWk5TQmlnU1hpaWdqdWxlNUx3a2JiVmxjUTMrZ3VsaW51Z0t2U1h5NXFr?=
 =?utf-8?B?blJqYmtYV2VTMkVHUFp4M3dPVmVtdThhdEF0T2F0eHpmNFlna2NLYSt6OXg4?=
 =?utf-8?Q?QWWNwSrP+VU/4UYxGxlppGU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E94628F7DED98542AD5941ABB959A1BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716980d8-d993-4091-47e8-08dd3c6483b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 10:47:36.0140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KS3Swy8c24ZTVbUAVjyXDFZ4Opj18VFmOgoF9OEWccy9Xtf1ajr8GfLLXcnqhK4HK65k9mkVNm48SJV4f9aKy9Ng7MVJY5L1CV0P9Uzo0qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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

T24gRnJpLCAyMDI1LTAxLTI0IGF0IDExOjQxICswMTAwLCBNYWNpZWogUGF0ZWxjenlrIHdyb3Rl
Og0KPiBGb3Igc2luZ2xlIHRpbGUgd29ya2xvYWRzIHVuZGVyIGRlYnVnIGFyZSBleGVjdXRlZCBz
ZXF1ZW50aWFsbHkuDQo+IFRoZSB0ZXN0IHF1aWNrbHkgcmVzdW1lcyB3b3JrbG9hZCB0aGF0IGhp
dCB0aGUgYnJlYWtwb2ludCB3aXRob3V0IGFueQ0KPiBkZWxheS4gVGhhdCBpcyB0aGVuIGNhdGNo
ZWQgYnkgdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlcmUgc2hhbGwgYmUgYQ0KPiBicmVhayBiZXR3
ZWVuIHdvcmtsb2Fkcy4NCj4gDQo+IEFkZCBzbGVlcCBiZWZvcmUgcmVzdW1pbmcgd29ya2xvYWQg
c28gdGhhdCB0aGVyZSBpcyBhIGZvcmNlZCBnYXANCj4gYmV0d2VlbiB3b3JrbG9hZHMuIElmIHRo
ZXkgd2VyZSBwcm9wZXJseSBleGVjdXRlZCBzZXF1ZW50aWFsbHkNCj4gdGhlbiB0aGUgZGlmZiBi
ZXR3ZWVuIHdvcmtsb2FkcyBzaGFsbCBiZSBsb25nZXIgdGhhbiBzbGVlcC4NCj4gDQo+IEFkZGl0
aW9uYWxseSBmaXggdGhlICdtcycgdG8gJ3VzJyB0eXBvIHJlcG9ydCBpbiBjYXNlIG9mIGFzc2Vy
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBQYXRlbGN6eWsgPG1hY2llai5wYXRlbGN6
eWtAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMg
fCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMg
Yi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+IGluZGV4IGY1MzIzODdhZi4uZDU4
ZjdkNjVmIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+
ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gQEAgLTIzMDUsNiArMjMw
NSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfbWFueV9zZXNzaW9uc19vbl90aWxlcyhpbnQgZmQsIGJv
b2wgbXVsdGlfdGlsZSkNCj4gIAkJCQlhdHRlbXB0X21hc2sgfD0gQklUKGkpOw0KPiAgCQkJCXNo
b3VsZF9icmVhayA9IDE7DQo+ICANCj4gKwkJCQl1c2xlZXAoV09SS0xPQURfREVMQVlfVVMpOw0K
T2ggd293LiBOaWNlIGNhdGNoISBQcmV0dHkgc3VyZSB3ZSBoYWQgdGhhdCBkZWxheSBiZWZvcmUu
wqANCkl0IGhhZCB0byBiZSBkcm9wcGVkIGFjaWRlbnRhbGx5IGRvd24gdGhlIHJvYWQsIHdpdGhv
dXQgdGhpcyBiZWxvdyBjaGVjayB3YXMgcG9pbnRsZXNzLg0KDQpSZXZpZXdlZC1ieTogRG9taW5p
ayBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KPiAgCQkJCWV1cyA9
IChzdHJ1Y3QgZHJtX3hlX2V1ZGVidWdfZXZlbnRfZXVfYXR0ZW50aW9uICopZGF0YVtpXS0+ZXhj
ZXB0aW9uX2V2ZW50Ow0KPiAgCQkJCWV1X2N0bF9yZXN1bWUoc1tpXS0+ZGVidWdnZXItPm1hc3Rl
cl9mZCwgc1tpXS0+ZGVidWdnZXItPmZkLA0KPiAgCQkJCQkgICAgICBldXMtPmNsaWVudF9oYW5k
bGUsIGV1cy0+ZXhlY19xdWV1ZV9oYW5kbGUsDQo+IEBAIC0yMzI4LDExICsyMzI5LDExIEBAIHN0
YXRpYyB2b2lkIHRlc3RfbWFueV9zZXNzaW9uc19vbl90aWxlcyhpbnQgZmQsIGJvb2wgbXVsdGlf
dGlsZSkNCj4gIA0KPiAgCQlpZiAobXVsdGlfdGlsZSkNCj4gIAkJCWlndF9hc3NlcnRfZihkaWZm
IDwgV09SS0xPQURfREVMQVlfVVMsDQo+IC0JCQkJICAgICAiRXhwZWN0ZWQgdG8gZXhlY3V0ZSB3
b3JrbG9hZHMgY29uY3VycmVudGx5LiBBY3R1YWwgZGVsYXk6ICVsdSBtc1xuIiwNCj4gKwkJCQkg
ICAgICJFeHBlY3RlZCB0byBleGVjdXRlIHdvcmtsb2FkcyBjb25jdXJyZW50bHkuIEFjdHVhbCBk
ZWxheTogJWx1IHVzXG4iLA0KPiAgCQkJCSAgICAgZGlmZik7DQo+ICAJCWVsc2UNCj4gIAkJCWln
dF9hc3NlcnRfZihkaWZmID49IFdPUktMT0FEX0RFTEFZX1VTLA0KPiAtCQkJCSAgICAgIkV4cGVj
dGVkIGEgc2VyaWFsaXphdGlvbiBvZiB3b3JrbG9hZHMuIEFjdHVhbCBkZWxheTogJWx1IG1zXG4i
LA0KPiArCQkJCSAgICAgIkV4cGVjdGVkIGEgc2VyaWFsaXphdGlvbiBvZiB3b3JrbG9hZHMuIEFj
dHVhbCBkZWxheTogJWx1IHVzXG4iLA0KPiAgCQkJCSAgICAgZGlmZik7DQo+ICAJfQ0KPiAgDQoN
Cg==
