Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFEFCCF9FE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 15:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125AF10E07E;
	Fri, 31 Oct 2025 15:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEoiYEvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CC610E07E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761924097; x=1793460097;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vHYkIyaqS0XXvFBJM1WWK5+SSytSKNBzthEmQUoNvDc=;
 b=IEoiYEvUNYYkIwHbnWvJxtQsgFIZlbQRGOyqL03ogaoUquARJDC3d0tC
 s9fO2KOJbr7QBxqkmMLP9ICuXSH/+9kFIn84Pn4qeITPouUerUMWAFeho
 Vhe6X59nFTGL8gy0iSeYRi07yJbK09ALIgZRx7Q8bgouopURag1mOMN0H
 54dixeF36PcGu8LeFcUnjBGvN1Kp4zhecfmnT/gZGNv3eNuHtMprsExk8
 /WTIYLc/QORTqSn8mXLXa/dX0XscF6AcsWPM1wsG3pi3hm5/bvdHkUfgW
 M46Ah7kKcpylTV9026OnC9/genV7RDg1jmkW97twNxpL9XoWi4bVEoWKB w==;
X-CSE-ConnectionGUID: 6ynRDJMbRcmFBmfoBPumcA==
X-CSE-MsgGUID: /vEktBkuQ7e84E8409TY1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64128284"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64128284"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:21:36 -0700
X-CSE-ConnectionGUID: yiohK/EhSoyeH/3+H0MUiA==
X-CSE-MsgGUID: piOXoeq7SPy1rBtwQ/goTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185920846"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:21:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 08:21:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 08:21:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 08:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T95gYsiyyvSMbXjOVNuZOj3y0YbYDCOTvv6WoU4/HDTE4JQnU0dHejhDNEd/RAEjL/PEXfwaEahKCzmJqxYFKymS+PuHzB4mMGITa2S93yxeZ/lQ8bjUcsw8gabdLvOHCb+RKTN17yALQ5cMWhrKbw3zSV2X3SbIomfP1JoyXlHmreuXmjbgnpMd7DFqdluM6YQI5WjvKWT3NwlRut/IN0xlNb+pxon3q7l0BUjTA6Q4O+9INd+xY95eBhFBRjpokSBkHcPUDruX5ohnGw/U34Y9sqqV+Z0SYJ47b7ZH4bNDm2qgaCIOp9l1eFViwp3Bq2LLVPISTlKxdgiGnepSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHYkIyaqS0XXvFBJM1WWK5+SSytSKNBzthEmQUoNvDc=;
 b=Wfr55X7ibeA0qnA13nMkbUW3O6lE4JHjpsQEr8NPkGtY7dLIScCmYhEKvR1xY1WqQ/oXCi/D3g1zDx5Vf6b9WCfWvpdbK2CRe7bGqNqc3MP73r836c3Et3cK6kYuBwXQYSf7cXPlb1knukjBxoL/TS0V/+iXuhcS802zEQPmA7TwsPdk67ollbLzDQk3Y7eV6DWsa61xYdg9bR3/Nw7aZ/bTMUbML9UGVr3lZ2DpQVyMXTUbEV97m+qGJZDSUyC/t9dYR6tiGntOmr2OFRtV/Vl1Kv/W7EGLfSdJ9YMMf680P1nu4QN7vv/h/8kKJ8DTnJPZ2PDGG/HG7G+avWRkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 31 Oct 2025 15:21:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 15:21:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wang, X"
 <x.wang@intel.com>
Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Topic: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Index: AQHcQhcatR0K/TlKU0+H4wlIwGnBo7TbObkAgACPxoCAAKZlAA==
Date: Fri, 31 Oct 2025 15:21:33 +0000
Message-ID: <9a164a08e1c3f6848a5de76f9452b23d66c21b44.camel@intel.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
 <6636a57ddbc6cd74848b3dfac6ecc1576f0a65a6.camel@intel.com>
 <SA3PR11MB80460D3EC48F6FE8384579D686F8A@SA3PR11MB8046.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB80460D3EC48F6FE8384579D686F8A@SA3PR11MB8046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB6173:EE_
x-ms-office365-filtering-correlation-id: 25a378f0-53be-4ce3-ab38-08de18912cb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?SkhaaGpvQXV4b3UrZ2t2UUxaNnJQSE0yWmcxOEQyK1dRMzE2bmhhbVduYVF5?=
 =?utf-8?B?QUprdU41ZytIMHY3d0l3Y0dUSWg1clBwMzRzM3J2bFJleHphRUxBTGc1MFRn?=
 =?utf-8?B?YVdzVlBhenJoek03SkdNa01CbXdiNW1YWnBmOTJwb3RaQ0NpOWlIdGpIdHBG?=
 =?utf-8?B?OTQ0d3VQcEZFYnYzVjNqV040T0VxcVA4Q3ZZUHppbHRDaGxxMjNHdjM5eTFW?=
 =?utf-8?B?cWw3V0YrTnJXa0VPUjM1bjA5M3ViVG5CNTN6dnhVK1hsYmVta240aHFUbThL?=
 =?utf-8?B?VndlanN0eDZoY2RZRFhMRldoTVRIaEw2TzAyZkxITExvUnU4N1duNzh0WGVP?=
 =?utf-8?B?K2FsM0F4aXMxZmNQQW4xR1dlZjFRbHY1UjBxcHpZdjBpaXRUS081bkpTU1J2?=
 =?utf-8?B?Z1FidHl5TDMxU2hJZmNiS2QwVWRUOGRKSWdsK1pLc1VoTFpmcHF2aU9TWmpk?=
 =?utf-8?B?VFlNNFB2NUVuNFZoUnljYmorZXVVRmRWNXhvVWI1VzJWNDFlL0psSGw0Wm9k?=
 =?utf-8?B?Y2JwNHlVamxKRTh0c0VrY0tRaTJDRTdZaUwzN1kwL2lwMm4vczVyeHNQRlNP?=
 =?utf-8?B?TXRGTjE1MUpxTnozbWRLMzgrUjJoODNOdk93TXdKYkpndk1ETm9XZjNkR3Vo?=
 =?utf-8?B?YytvZTlESlNUWnQ2dnFVU1BsdHBZd0crUHYybmoyT3RSMm1RVDZiUnl6TkxC?=
 =?utf-8?B?UjZoZm1VS2pQQlRvZ0RhZ3VsZFpDNkhsMFYyRisxc2JIWVRERW5yNG5RQ0xy?=
 =?utf-8?B?TGlNa2ZQWVp4THBNMGYvV29XZnNFazF5MzIzSkN2SFVZeU9heXlJWVFLaGVR?=
 =?utf-8?B?a0plMDQ0eUZCTitQNk9ja0VPUExQNFVjRGN4NCtCZ3VRb2d6UXduVGNWNmJE?=
 =?utf-8?B?dDJsSXpuVmsyTDJEc2lKUkswV2JTZ3ZqdmN0U0t3emhJbEJrWTRvMmNWTE44?=
 =?utf-8?B?cGtjdTk2czI4NXc1L1RXUTZPKy9CbGNPdXEzVnhIc3pVa1Q1WHFRWXl5VVFL?=
 =?utf-8?B?dkhibER4cWliZ2JTWEorWWJLYjYvUnRBdm1FMVJ5dWFENTgrdVU5THQ5Uldy?=
 =?utf-8?B?TnR4L3dDL28ya1ByQ1p1QTMxUlBBc2JXYVg5d3pSU0xVVmlDTDllVERkUUhs?=
 =?utf-8?B?K3ZVeWJjeWsvZEpHMVp1QStOTlN2djRoOVU4VDY5aTE3T1dETlZEektzNm95?=
 =?utf-8?B?T3dmdjRuRE9Icm14N0JTaGRBaGpOQnV5TWI2Q0twdDExeGJscVNTTXRDOTBZ?=
 =?utf-8?B?NDJJRFhvdEFxalVHZ1lhN0xRWCtqRElxREE5SXV1cU1LOEI3MVFoK2lqdHU1?=
 =?utf-8?B?eFlKK0oyOHBTZTRRWXNMZS9KV093VVNsUSs0dXdacUlNVGx4YVc4Rnd1OFg3?=
 =?utf-8?B?bnVFTXdjRGhBUVBJd3Ntb1pjc3g1U0lTMzZ2SHp2MSs3bWl5dXp6SE9BMTdm?=
 =?utf-8?B?REJNYnJ5K0VRYXRjSzZ6QmMyVkVSQ2dYYm04Sk1OUnlFbmRGSFdVcExlVXNX?=
 =?utf-8?B?ZXVaY0lDbCtONHJGakM4Qk14Ny94eUt3WmlXWkZSNTFScmdOTkVVZmxCQkZT?=
 =?utf-8?B?QXJ0QlMvY2tmV084MlN3ZUtUeUJhYVBPNS91VTZDblllUkRJaFBsWmlmK3ZX?=
 =?utf-8?B?Mm1Zam9PbzYwaUJRU0pEZnJwWlkzQ2Y3SndaODM4SHlsdHBVZHVjdkhudTIr?=
 =?utf-8?B?dG1kdVgxdG9nZU13a2hHS2FrRHpGVXNETnhhem1mK3JzeTBOTVlDTlE4NndQ?=
 =?utf-8?B?eXE1c01SWU5CNGpwWStnQTYwc1pId3RZSTlZNUxYOTBxZ1VYaUZVTGhEQmx2?=
 =?utf-8?B?SnN0dnRnYVVCOXZjaEwvbXN2OU1NUzREbkNJeG9TcE5EVGdJdzN4Yk1EZ3o2?=
 =?utf-8?B?cG5QMWNzckYvUG81NlRzNFBwbXFrS3NkQlpReklrbmtSMkZvR295bWdFMkhr?=
 =?utf-8?B?ek4zRXExelVZbFlxWlRVUDd6QW1kZ0UrMmxlbFovcUFnVkNmQ3J6ZHdDM29l?=
 =?utf-8?B?d3ErR0dZTEFmZllOV2lTbUs2eWRWVzFRaGZGWmd3K3J1L2RHbzZ1K2dEN0VW?=
 =?utf-8?Q?yde0Qh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWFkdUZtYi9VMklVZDVDVkxhWDdDUUdpMi9rdklMcFJQRDdlQTlVTWc2WTd0?=
 =?utf-8?B?cnR5YTRuRWt5MnZ5aGRiNVBRMXV3aXgxd1pqR0UvL3NyVU00TGZ1eUtOMzRK?=
 =?utf-8?B?YWxmZU5TUjlVN0kyQi9uWWlMMVR5UEFLZWdvWGp3MmR6OHppOUdtRHJrOVll?=
 =?utf-8?B?aXM2Y253Qk1ueVdncmF4ODJ1UVlRS0tWTmFybGxuajlSd1ZiSXFEQmRDZ1pO?=
 =?utf-8?B?NWJBdGhHOHdqYXcrUUlVZEQ3RUlycXdVd3FaVkVEeXk3dXhoMDE3WGU4d1RW?=
 =?utf-8?B?MTB1OFZZaDlybTY5dWpFdGpVdk5MZE50SGtjZWpHaE5EZVZTd3VIMERlZnl3?=
 =?utf-8?B?aThoY0M1eTJhRDZSZnBlQzBReHEyMFlCR3RQckpqcWRvSzFuUGUwcEFNQ2ZM?=
 =?utf-8?B?UWtidTRiZHFDZm1yRi9oK2FlSDduQlh3dkNpV0FreVQzeE9zT2ZxOVUrbHM4?=
 =?utf-8?B?WkRyWlhnZTVoSGVFV0dEUE5PNjFndWROODJUdFVKTFBiYWxiS2V5ako4R3g2?=
 =?utf-8?B?TmJQOE5oQlVqTlBYVVFWU3ZGSWRPRGRmSDMwOHZmd2FyMEpRSGlWVFUrMnlS?=
 =?utf-8?B?WjJNWSt0UkVQRFFXUWNiOHJhbTBzUk9qQTdUZWFPZWhIMlNxTGk3Q2ZPZlpI?=
 =?utf-8?B?Nys4SnFRV2JtTmhYZ3NxSEREZTJlczg2dEFKYmZrdXF6ZUVtWmNJeXdzNzVD?=
 =?utf-8?B?Nkxaek03ZFRyWXNyc1NXVnB4OXlXSFlVcWQ0NlZPMEE2T1g3NUVkWTAvTVRZ?=
 =?utf-8?B?aFB2S0FZbzc2NlkwUHh2S1ZXOTRkNlpVSy9oeEJSeGIzbmRzaGxuM012ek0w?=
 =?utf-8?B?MGF6SzZudnNoanpzNklhWGRiQk5xT3JBMUNhKzZDcjZGYzdyU2s4MTZNc0dV?=
 =?utf-8?B?YlFHVkxrM0NIeE5LU29rMk10anUxTGtEMkIxZ2RkVGRYdjBySzJnSTJwNmdp?=
 =?utf-8?B?eWQxcmdLY05GUnA3YlpkYlRCV0dPTXBkcXZhOXRLYXQreEs3ZENjUERlZy9s?=
 =?utf-8?B?U1NORzVPNFE4R0t1Z3lSRWdtZUNZVFBVYVQzcHhhQmtIZndBSUNTVWYxYVp3?=
 =?utf-8?B?d3FkeE9DQW5vWmtCOU04VTJlUlpsZEdlbEZQK1YzRXJMVW9qQ2prT2ZTUHlm?=
 =?utf-8?B?VU0zNmlYbEcvWWtaY2d1TVJDMi84M2NwVG51NlU4b3V1VmNVMVVQSGNIV0dX?=
 =?utf-8?B?bXU1RUFFMEdZQzZ0WjQvT014UHU1VENBZTM3azY2cG8wNGZVUXp5d1BIRW5W?=
 =?utf-8?B?MDBjcFc0cXNxRWNjeEZZRjNvY09rZHVubWtmSE50bHkwQWRMOCtZcE1iU21l?=
 =?utf-8?B?V25ZZ3J5dXA3dmRONm54ZmJNWnl6QmxGVENncVdUL3k0VVFzd3RPbGtjV0Nn?=
 =?utf-8?B?a05IbzVEVk9USmJGU0lVMWNZUHNpbXRwUWVaOFJRTlZRTERVQzl2TmVVWXlW?=
 =?utf-8?B?STR0akc1cy90aXhNOG5EUStWV2c0ZUY1ejRZNFdpa2NFcFJnVVFYdmswclpv?=
 =?utf-8?B?MXpJbis4WEphQzJveG9rYUlaL2pHSkRVakxzSTRoOUQxTmlUbTIxOHFWVE53?=
 =?utf-8?B?TkFXZFVOZHpHQ05Ea3U1ZGM0amxJKzNMVHZzK1ZLRzhMeFlCWWVDa3FIc0Rz?=
 =?utf-8?B?Y2RxZWRNK0FHTm0ybXQ4MEJPSjFnS0Z6SVI0QnRDbENhMUNyNmtBZVJZN3BR?=
 =?utf-8?B?RVNkakdoQWNGWGk4cDFSSHRoMmxQWDVOTG9NOERGSHM2UkZtWlg3K2ZrU3p0?=
 =?utf-8?B?NnVGMjE4RW9INk5uSWNaSUVPT0hjM0pnZ090dlNtaHF2bGxIOC93NUVhb1ZD?=
 =?utf-8?B?djlWcDlBeWhPbFQxSlhLejZxZG5GQndMcERWbkQvdGVHN0lzWjkzUUoyRTZs?=
 =?utf-8?B?SUF0VWh3ckx5dW40REUvSFVGYk5IcTNSbi9CUDFQM2xjK3lkMUNoNTJtUTZE?=
 =?utf-8?B?L1ZDZldRbVJpRkRKTGRINzdMdm92UnhyRXdkWG1xOThqa2J2Z3dCUisybVhE?=
 =?utf-8?B?QVBIakY3WnF2VE41a3lmMDlCRlN5c3dNdVphL3IzK0hiSVRKYmlFeGRVeEQx?=
 =?utf-8?B?eVU4bE1LR1AxSmo3a085dllsVjAyVkhKZnRHSGNYUmRnMkpPdUZ4aEF1Vzg2?=
 =?utf-8?B?MElNMWxzR1gxZm9YNTVGd1RDeVBDallIZFQ5SzVNQ2tGUGhEcVc4eXk0bEti?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F5BA00820A60145B92046293ED9B17B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a378f0-53be-4ce3-ab38-08de18912cb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 15:21:33.2251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/wtua1rz7/syu4vM/a+lV+fWNKi14s5hO/GoOAdls7T14IWsImuOoKmE/ymCe3TSar3w9T5ZVt/cj3c2+fWj5nxOXyjyh+aQQwC+NYmizg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
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

T24gRnJpLCAyMDI1LTEwLTMxIGF0IDA1OjI1ICswMDAwLCBXYW5nLCBYIHdyb3RlOg0KPiANCj4g
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBTdW1tZXJzLCBTdHVh
cnQgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiBTZW50OiBUaHVyc2RheSwgT2N0b2Jl
ciAzMCwgMjAyNSAxMzo1MQ0KPiA+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
V2FuZywgWCA8eC53YW5nQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDIv
Ml0gbGliL2ludGVsX2RldmljZV9pbmZvOiBRdWVyeSBydW50aW1lIHhlDQo+ID4gZGV2aWNlDQo+
ID4gZ3JhcGhpY3MgdmVyc2lvbnMNCj4gPiANCj4gPiBPbiBNb24sIDIwMjUtMTAtMjAgYXQgMjM6
MTIgKzAwMDAsIFhpbiBXYW5nIHdyb3RlOg0KPiA+ID4gRm9yIHBsYXRmb3JtcyB3aXRoIGdyYXBo
aWNzX3ZlciA+PSAyMCwgcXVlcnkgdGhlIHJ1bnRpbWUgeGUNCj4gPiA+IGRldmljZSB2ZXINCj4g
PiA+IGluc3RlYWQgb2YgcmVseWluZyBzb2xlbHkgb24gaGFyZGNvZGVkIHZhbHVlcyBmcm9tIHRo
ZSBQQ0kgZGV2aWNlDQo+ID4gPiB0YWJsZS4NCj4gPiA+IFRoaXMgZW5hYmxlcyBhY2N1cmF0ZSBJ
UCBtaW5vciB2ZXJzaW9uIChncmFwaGljc19yZWwpIGRldGVjdGlvbg0KPiA+ID4gZm9yDQo+ID4g
PiBwbGF0Zm9ybXMgbGlrZSBYZTIgd2hlcmUgZGlmZmVyZW50IHN0ZXBwaW5ncyBoYXZlIGRpZmZl
cmVudCBJUA0KPiA+ID4gdmVyc2lvbnMuDQo+ID4gPiANCj4gPiA+IEltcGxlbWVudGF0aW9uIGRl
dGFpbHM6DQo+ID4gPiAtIFVzZSB3ZWFrIHN5bWJvbCBsaW5rYWdlIGZvciB4ZV9pcHZlcl9jYWNo
ZV9sb29rdXAoKSB0byBoYW5kbGUNCj4gPiA+IHN0YXRpYw0KPiA+ID4gwqAgbGlicmFyeSBjb21w
aWxhdGlvbiAobGliaWd0X2NoaXBzZXQuYSwgbGliaWd0X2RldmljZV9zY2FuLmEpDQo+ID4gPiB3
aXRob3V0DQo+ID4gPiDCoCB4ZV9xdWVyeS5jIGRlcGVuZGVuY2llcyB3aGljaCBhcmUgdXNlZCBm
b3IgaTkxNSB0b29scw0KPiA+ID4gKGk5MTVfcGVyZiBhbmQNCj4gPiA+IMKgIGludGVsX2dwdV90
b3ApDQo+ID4gPiAtIFByb3ZpZGUgYSB3ZWFrIHN0dWIgdGhhdCByZXR1cm5zIE5VTEwgd2hlbiB4
ZV9xdWVyeSBpcyBub3QNCj4gPiA+IGxpbmtlZA0KPiA+ID4gLSBGb3IgR2VuMjArIHBsYXRmb3Jt
cywgcHJlZmVyIHJ1bnRpbWUgeGUgZGV2aWNlIHZlcnNpb25zIG92ZXINCj4gPiA+IHN0YXRpYw0K
PiA+ID4gZGF0YQ0KPiA+ID4gLSBGYWxsIGJhY2sgdG8gUENJIHRhYmxlIGlmIHhlIGRldmljZSBp
bmZvIGlzIHVuYXZhaWxhYmxlDQo+ID4gPiAtIFJlc2V0IGNhY2hlIG9uIHF1ZXJ5IGZhaWx1cmUg
dG8gYWxsb3cgcmV0cnkNCj4gPiA+IA0KPiA+ID4gUmVtb3ZlIGhhcmRjb2RlZCBncmFwaGljc19y
ZWwgZnJvbSBzdGF0aWMgdGFibGUgZW50cmllcyBmb3IgeGUNCj4gPiA+IGRldmljZXMNCj4gPiA+
IGFzIHRoZXkgd2lsbCBiZSBwb3B1bGF0ZWQgYXQgcnVudGltZSBmcm9tIEdNRF9JRC4NCj4gPiA+
IA0KPiA+ID4gVGhpcyB1bmlmaWVzIGRldmljZSBpbmZvIGhhbmRsaW5nIGJldHdlZW4gaTkxNSBh
bmQgeGUgZHJpdmVycywNCj4gPiA+IGVuYWJsaW5nOg0KPiA+ID4gLSBQbGF0Zm9ybS1zcGVjaWZp
YyB3b3JrYXJvdW5kcyBiYXNlZCBvbiBhY2N1cmF0ZSBJUCB2ZXJzaW9ucw0KPiA+ID4gLSBDb25z
aXN0ZW50IGRldmljZSBpbmZvIEFQSSBhY3Jvc3MgYm90aCBkcml2ZXJzDQo+ID4gDQo+ID4gSSdk
IHBlcnNvbmFsbHkgZHJvcCB0aGlzIHJlZmVyZW5jZSB0byB1bmlmaWNhdGlvbiBvZiBpbnRlcmZh
Y2VzLg0KPiA+IFRoZQ0KPiA+IGltcGxlbWVudGF0aW9ucyBvZiB0aGUgcXVlcnkgaW50ZXJmYWNl
cyBiZXR3ZWVuIHhlIGFuZCBpOTE1IGFyZQ0KPiA+IGFscmVhZHkNCj4gPiBkaWZmZXJlbnQgYW5k
IGNvdWxkIGRpdmVyZ2UgZXZlbiBmdXJ0aGVyIG92ZXIgdGltZSwgc28gdGhpcyBpc24ndCBhDQo+
ID4gdHJ1ZQ0KPiA+IHVuaWZpY2F0aW9uIGFueXdheS4NCj4gPiANCj4gPiA+IA0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogWGluIFdhbmcgPHgud2FuZ0BpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
IMKgbGliL2ludGVsX2RldmljZV9pbmZvLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKy0t
LQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jIGIv
bGliL2ludGVsX2RldmljZV9pbmZvLmMNCj4gPiA+IGluZGV4DQo+ID4gPiBhODUzZjlhYjQuLjg3
YjEwNjliZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jDQo+ID4g
PiArKysgYi9saWIvaW50ZWxfZGV2aWNlX2luZm8uYw0KPiA+ID4gQEAgLTMsNiArMywxNiBAQA0K
PiA+ID4gwqAjaW5jbHVkZSAiaTkxNV9wY2lpZHNfbG9jYWwuaCINCj4gPiA+IA0KPiA+ID4gwqAj
aW5jbHVkZSA8c3RyaW5ncy5oPiAvKiBmZnMoKSAqLw0KPiA+ID4gKyNpbmNsdWRlIDxzdGRkZWYu
aD4NCj4gPiA+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+ID4gDQo+ID4gV2h5IGRvIHlvdSBuZWVk
IHN0cmluZy5oIGhlcmU/DQo+IA0KPiArI2luY2x1ZGUgPHN0ZGRlZi5oPsKgwqAgPC0tIE5VTEwg
ZGVmaW5lDQo+ICsjaW5jbHVkZSA8c3RyaW5nLmg+wqDCoMKgIDwtLSBtZW1jcHkoKQ0KPiANCj4g
VGhlIGNvbXBpbGVyIHdpbGwgcmVwb3J0IGVycm9yIHdpdGhvdXQgdGhlc2UgMiBoZWFkZXJzLg0K
DQpBaCBzb3JyeSBJIGhhZCBtaXNzZWQgdGhhdC4uLiB5ZWFoIG1ha2VzIHNlbnNlIQ0KDQo+ID4g
DQo+ID4gPiArDQo+ID4gPiArLyogV2VhayBzeW1ib2wgc3R1YiAtIHdpbGwgYmUgb3ZlcnJpZGRl
biBpZiB4ZV9xdWVyeS5jIGlzIGxpbmtlZA0KPiA+ID4gKi8NCj4gPiA+ICtzdHJ1Y3QgeGVfZGV2
aWNlX2lwdmVyICp4ZV9pcHZlcl9jYWNoZV9sb29rdXAodWludDMyX3QgZGV2aWQpDQo+ID4gPiBf
X2F0dHJpYnV0ZV9fKCh3ZWFrKSk7DQo+ID4gPiArDQo+ID4gPiArc3RydWN0IHhlX2RldmljZV9p
cHZlciAqeGVfaXB2ZXJfY2FjaGVfbG9va3VwKHVpbnQzMl90IGRldmlkKSB7DQo+ID4gPiArwqDC
oMKgwqDCoMKgwqByZXR1cm4gTlVMTDsNCj4gPiA+ICt9DQo+ID4gPiANCj4gPiA+IMKgc3RhdGlj
IGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyBpbnRlbF9nZW5lcmljX2luZm8gPSB7DQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzX3ZlciA9IDAsDQo+ID4gPiBAQCAtNTA1LDcg
KzUxNSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4gPiA+IGlu
dGVsX3BvbnRldmVjY2hpb19pbmZvID0gew0KPiA+ID4gDQo+ID4gPiDCoHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaW50ZWxfbHVuYXJsYWtlX2luZm8gPSB7DQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzX3ZlciA9IDIwLA0KPiA+IA0KPiA+IFNvcnJ5IGlmIEkn
bSBjb21pbmcgaW4gbGF0ZSBoZXJlLi4uIHdoeSBkb24ndCB3ZSBkbyB0aGlzIGZvcg0KPiA+IGdy
YXBoaWNzX3ZlciBhbHNvPw0KPiA+IFRoZW4gYmVsb3cgeW91IGNhbiBqdXN0IGVpdGhlciBjaGVj
ayBpZiBncmFwaGljc192ZXIgPT0gMCBvciB1c2UNCj4gPiBpbnRlbF9nZW4oKT8NCj4gDQo+IFNv
bWUgSUdUIHRvb2xzIGRvbuKAmXQgYWN0dWFsbHkgb3BlbiB0aGUgeGUgZGV2aWNlIGJ1dCBzdGls
bCBuZWVkIHRvDQo+IGFjY2VzcyBpbnRlbF9nZXRfZGV2aWNlX2luZm8oKS4gSW4gdGhvc2UgdG9v
bHMsIHRoZSBtaW5vciB2ZXJzaW9uDQo+IGlzbuKAmXQgcmVsZXZhbnQuDQo+IFRoZSBtYWpvciB2
ZXJzaW9uIGRvZXNu4oCZdCBjaGFuZ2UgYWNyb3NzIGRpZmZlcmVudCBkZXZpZHMgd2l0aGluIHRo
ZQ0KPiBzYW1lIGludGVsX2RldmljZV9pbmZvIHN0cnVjdCwgc28ga2VlcGluZyBpdCBoZXJlIHdv
buKAmXQgY2F1c2UgYW55DQo+IGlzc3Vlcy4NCg0KT2sgYW5kIEkgZ3Vlc3MgdGhpcyBhbHNvIGdv
ZXMgd2l0aCB0aGUgYmVsb3cgY29tbWVudC4uLg0KDQo+IA0KPiA+IA0KPiA+ID4gLcKgwqDCoMKg
wqDCoMKgLmdyYXBoaWNzX3JlbCA9IDQsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmRpc3BsYXlf
dmVyID0gMjAsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmhhc180dGlsZSA9IHRydWUsDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgLmhhc19mbGF0Y2NzID0gdHJ1ZSwNCj4gPiA+IEBAIC01MTcsNyAr
NTI2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbw0KPiA+ID4gaW50
ZWxfbHVuYXJsYWtlX2luZm8gPSB7DQo+ID4gPiANCj4gPiA+IMKgc3RhdGljIGNvbnN0IHN0cnVj
dCBpbnRlbF9kZXZpY2VfaW5mbyBpbnRlbF9iYXR0bGVtYWdlX2luZm8gPSB7DQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgLmdyYXBoaWNzX3ZlciA9IDIwLA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgLmdy
YXBoaWNzX3JlbCA9IDEsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmRpc3BsYXlfdmVyID0gMTQs
DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmhhc180dGlsZSA9IHRydWUsDQo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgLmhhc19mbGF0Y2NzID0gdHJ1ZSwNCj4gPiA+IEBAIC01MjksNyArNTM3LDYgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbw0KPiA+ID4gaW50ZWxfYmF0dGxl
bWFnZV9pbmZvID0gew0KPiA+ID4gDQo+ID4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxf
ZGV2aWNlX2luZm8gaW50ZWxfcGFudGhlcmxha2VfaW5mbyA9IHsNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAuZ3JhcGhpY3NfdmVyID0gMzAsDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqAuZ3JhcGhpY3Nf
cmVsID0gMCwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAuZGlzcGxheV92ZXIgPSAzMCwNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqAuaGFzXzR0aWxlID0gdHJ1ZSwNCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqAuaGFzX2ZsYXRjY3MgPSB0cnVlLA0KPiA+ID4gQEAgLTY3NSw2ICs2ODIsOCBAQCBjb25zdCBz
dHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4gPiA+ICppbnRlbF9nZXRfZGV2aWNlX2luZm8odWlu
dDE2X3QgZGV2aWQpDQo+ID4gPiDCoHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdGF0aWMgX190
aHJlYWQgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICpjYWNoZSA9DQo+ID4gPiAmaW50
ZWxfZ2VuZXJpY19pbmZvOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0YXRpYyBfX3RocmVhZCB1
aW50MTZfdCBjYWNoZWRfZGV2aWQ7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdGF0aWMgX190aHJl
YWQgc3RydWN0IGludGVsX2RldmljZV9pbmZvIHhlX2Rldl9pbmZvOw0KPiA+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IHhlX2RldmljZV9pcHZlciAqaXB2ZXI7DQo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgaW50IGk7DQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoY2FjaGVkX2Rldmlk
ID09IGRldmlkKQ0KPiA+ID4gQEAgLTY4OSw2ICs2OTgsMTcgQEAgY29uc3Qgc3RydWN0IGludGVs
X2RldmljZV9pbmZvDQo+ID4gPiAqaW50ZWxfZ2V0X2RldmljZV9pbmZvKHVpbnQxNl90IGRldmlk
KQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGNhY2hlZF9kZXZpZCA9IGRldmlkOw0KPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoGNhY2hlID0gKHZvaWQgKilpbnRlbF9kZXZpY2VfbWF0Y2hbaV0ubWF0Y2hf
ZGF0YTsNCj4gPiA+IA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGNhY2hlLT5ncmFwaGljc192
ZXIgPj0gMjApIHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpcHZlciA9
IHhlX2lwdmVyX2NhY2hlX2xvb2t1cChkZXZpZCk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKGlwdmVyICYmIGlwdmVyLT5kZXZpZCA9PSBkZXZpZCkgew0KPiA+IA0K
PiA+IFdoYXQgaXMgdGhlIGV4cGVjdGF0aW9uIGlmIHdlIGRvbid0IGxpbmsgaW4geGVfcXVlcnku
Yz8gU2VlbXMgbGlrZQ0KPiA+IGl0IHdvdWxkIGJlDQo+ID4gYmV0dGVyIHRvIGp1c3QgbWFrZSB0
aGlzIGEgaGFyZCByZXF1aXJlbWVudD8gT3Igc2luY2UgdGhlcmUgaXMgYQ0KPiA+IGRlcGVuZGVu
Y3kNCj4gPiBoZXJlIG9uIGlndF9kZXZpY2VfZ2V0KCkvcHV0KCkgd2Ugc3RpbGwgd2FudCB0aGlz
IGJhY2t1cCBpZiB3ZQ0KPiA+IGRvbid0IGNhcmUgYWJvdXQNCj4gPiB0aGUgdmVyc2lvbnM/DQo+
ID4gDQo+IFNpbmNlIHRoaXMgZmlsZSBnZXRzIGxpbmtlZCBhcyBhIHN0YW5kYWxvbmUgbGliIGlu
IElHVCwgc29tZSBpOTE1DQo+IHRvb2xzIGFscmVhZHkgZGVwZW5kIG9uIGl0LiANCj4gRm9yY2lu
ZyB4ZV9xdWVyeS5jIGludG8gdGhlIGxpbmsgd291bGQgcmVxdWlyZSBhIGxvdCBvZiBjaGFuZ2Vz
LCBhbmQNCj4gdGhvc2UgdG9vbHMgZG9u4oCZdCBiZW5lZml0DQo+IGZyb20geGVfcXVlcnkuYyBh
bnl3YXkuIEnigJlkIHByZWZlciBub3QgdG8gdG91Y2ggaTkxNSB0b29scyB0aGF0IGhhdmUNCj4g
YmVlbiBzdGFibGUgYW5kIHdvcmtpbmcgZm9yIHllYXJzLg0KDQpZZWFoIHRoaXMgaXMgYSBnb29k
IHBvaW50LiBXaGlsZSBJIGxpa2UgdGhlIGlkZWEgb2YgaGF2aW5nIGEgY29uc2lzdGVudA0KaW50
ZXJmYWNlLCBlc3BlY2lhbGx5IHNpbmNlIHdlIG1pZ2h0IGVuZCB1cCBtb3ZpbmcgZnVsbHkgdG8g
YW4gRkQtYmFzZWQNCmltcGxlbWVudGF0aW9uLCBtYXliZSBiZXR0ZXIgaGVyZSB0byBqdXN0IG1h
a2UgdGhpcyB3b3JrIHdpdGhvdXQgYSBodWdlDQppbXBhY3QgYWNyb3NzIGEgbG90IG9mIHRlc3Rz
IGFuZCB0b29scy4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IA0KPiA+IFRoYW5rcywNCj4g
PiBTdHVhcnQNCj4gPiANCj4gPiANCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgbWVtY3B5KCZ4ZV9kZXZfaW5mbywgY2FjaGUsIHNpemVvZihzdHJ1
Y3QNCj4gPiA+IGludGVsX2RldmljZV9pbmZvKSk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rldl9pbmZvLmdyYXBoaWNzX3ZlciA9IGlw
dmVyLQ0KPiA+ID4gPiBncmFwaGljc192ZXI7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rldl9pbmZvLmdyYXBoaWNzX3JlbCA9IGlwdmVy
LQ0KPiA+ID4gPiBncmFwaGljc19yZWw7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhY2hlID0gJnhlX2Rldl9pbmZvOw0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhY2hlZF9kZXZpZCA9IDA7DQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQ0K
PiA+ID4gwqBvdXQ6DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGNhY2hlOw0KPiA+ID4g
wqB9DQo+IA0KDQo=
