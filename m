Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FD5D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 14:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA33110E607;
	Tue,  9 Dec 2025 14:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kB8/HAf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6058910E60E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765289847; x=1796825847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rDcI3mjXI60kU12kqW2ufa4F/GfywAt9jxyvPJNxzno=;
 b=kB8/HAf1apmPuFjd9bynt+KIDGhWT/EwnOJqzxwf/69wTr70VPwm/gzg
 F2JduFiZ6/X1IiSXaFAv8YZSHecOmmBaf65JoDBQvkwC1nVYXBsIyFcNb
 6TfNJko4RlaT+i2k9lK8X6b8p3hI/Fa67SeqA/47w1l2/gFU2h9ihhmEq
 ZoIzYY1R4XsXDLJhOz5TjjpAW2M1XOg0IewS4sN2YqF9axts61gg9QvPS
 VyOMvNqoJWMHcvnZ4JqwfqV4uqvLqii6TAlIzC14aJTHhWU9EAf08crWE
 l7w8St61l0juW8SR1y+6C504euYSnSWdbGSocYjWikWgmTaVSmYPZsH0z A==;
X-CSE-ConnectionGUID: UMdUiNa1RduWSsAPs1VZyw==
X-CSE-MsgGUID: xlXmGaZoQlOWcjdbAf15mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71104742"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="71104742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:17:25 -0800
X-CSE-ConnectionGUID: 4NIXgaSsQamvOmr8V+0vwA==
X-CSE-MsgGUID: 8A7qmd4sQLyTr/3F+pOv8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="195503101"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:17:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 06:17:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 06:17:23 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 06:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKkTlhDNGzZnn5AhQgoS2oiVTCJINTN28UaA3RRc9XpS7FvFxsxgKg17r3yn87++PIEuZX4DBVjHULkAbVhwThSQELYBmI/lBltYt0UA3eiUw2TZSXCjTWHntpQxbUxjua+1/gSeC6RlI2lsmJXfeXmjWDdvcJS/RdcMATQrLrm8XU8e8p2tUS5MR0hZzBrDKvcU7FzdriqZ+44EnScPOk29149otldh7utZ+fKDsBZUeM9YOuoGi7I/9I/qsaVrzyi7Z6s+lKykZkiUsN+HjEAHvxDwN99qg27bUro3qtV92JwsM8BrBuYqHj5zhkKRwqpPqfvhoJUC3AAgjkDQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDcI3mjXI60kU12kqW2ufa4F/GfywAt9jxyvPJNxzno=;
 b=yWMY2iKxGguJHCfGHLFmnvFwzwsVN7dh4K6lNAwGmANJCgU+K48JwMftFUUcJvakXuelaOlGX5+HmNQpbkEVSq5Oc6IqrqWJvCdpQ3iG0b4VNGpUwDr8cQva2iDs4ocMf+za/buEkbsuNFPWLGoutROAEFOxp/Cqk2jSVPUfPF3hzxRYwrI4RkR1btEFHXxISjLnmdMIyVht1rXGHJl31k3P6eYr5ZK+ArxSMuCG2Fb22SdNzcYpPmGjodOfPsulzV0XVs+FIaOBZaN1jKYbi0NPnHr+FIwdbrkzkk2k/dHVIcIDQ/E6Sce7D0ug3tBWNDKWXZtC4bRQItQfki3foQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by SJ1PR11MB6300.namprd11.prod.outlook.com
 (2603:10b6:a03:455::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 14:17:21 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04%8]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 14:17:21 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "vitaly.prosyak@amd.com" <vitaly.prosyak@amd.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "rob.clark@oss.qualcomm.com"
 <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH i-g-t] scripts: remove symlink
Thread-Topic: [PATCH i-g-t] scripts: remove symlink
Thread-Index: AQHcaQqXeIdDPtl8xECpAXBoXCiQMrUZWvoA
Date: Tue, 9 Dec 2025 14:17:21 +0000
Message-ID: <290ce4323438a48211f26235d3d35f53378c3657.camel@intel.com>
References: <20251209125130.22657-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251209125130.22657-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|SJ1PR11MB6300:EE_
x-ms-office365-filtering-correlation-id: 275e5e9e-8fc1-4928-3833-08de372daac1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UHQ1bFhaWUI3bW9RQXprVGJwR3ZxVEZSVHgyRGZLc1dlZm5QTDAvZCtUeElP?=
 =?utf-8?B?NkQ5VFk4MFNqZjlrODIzK0s2dHkzbEwzcnFuQU9wWk82Y1dFVkNFeXlSOXRi?=
 =?utf-8?B?NnFoVU0wZHdULzR1RFJOMFA1d1h6ZUlLVmRGSW0rdTdQckk3VnBhRzQ0THFs?=
 =?utf-8?B?VGdEQVJHbEZZY0tkcGtmZ3Jmazd0MUkzRDl6YTJobEdxMWZ5TTl1S3JaM2x2?=
 =?utf-8?B?aFNaT0Q4U2dYZDFBU3FXUWloZDZZa3l5bWV0YmJFS1F4N29CZFhVV1ljWm55?=
 =?utf-8?B?dFJ3V0ZhcUhvZ2IxTkpnSXkxbzZtSk9qVFJ1ODFZMTBPOFZiWkFzNnNYZ1FM?=
 =?utf-8?B?N2FzUnp1cnd1aTlYMFc4ODVqcUVtaTFyMUx0bDlCaXkxUE16TmhzdTZWcUc5?=
 =?utf-8?B?QURqTStVQTVxVWoyNlNGQnZJMEVvczdVUTRxZmI3TTRZYmpUSWw3M2wxVGtW?=
 =?utf-8?B?bUV1OEZHemdwLytFNlp6UjUyU1dWWG4vSHhaTUFzaDhqQmdHYXN0eDF0b1B0?=
 =?utf-8?B?QWtENXBTdFlTSXc0MEtQL3N5Z0xKaHNBbUpSMjJpc0lRVjgwTTVmSUxvU0NQ?=
 =?utf-8?B?NlN6OXdzVFM3ZmRQMFkyTnM0bHhLR0srRUdTbVMrYkJ4YkhvcVBGZm5taWln?=
 =?utf-8?B?dm95dlNTWTNJTjI3NWRBUzNZSDF1YWdLZlJjdHVRYjhOV1BHeW5SZUFQVk8v?=
 =?utf-8?B?c0ZtdTM1Y08xREhybkhmSm13Rzg5SWtvcE9IWE50WVJRa0FBc0RHTHRDUWha?=
 =?utf-8?B?TURPeUdOS1VMRys0dGVnZFBIZTJLY1lNK0NVck1kVFFYSzUzL0d4VlY0N2lY?=
 =?utf-8?B?N1Jxa1BxSU4rb0daUE9vS05SYVVjaXpoTTJQbkZaNzdhV05RZlR0RzRWaFVy?=
 =?utf-8?B?WENsdlNFbHpzOXoxZnRIRUIrUm9hVWg0Wno4NmZQa0RlTzBmT3ZtRkVGNXNE?=
 =?utf-8?B?M3JQOGNOaFNGOFpYN295czFZOWJwdWg0RmpDSXZwZHFPRUIvNUEraGZZMjVR?=
 =?utf-8?B?MUQ5UlVnMFJKenFBOGNjb0Z4TEdpZURUa0U2WUpjaU1oNmU5Q3NtdnZHdm9m?=
 =?utf-8?B?bUFNVmdScVp4eFBOL3p0OTdqNGNVR29pTUJOOVgyTEYvamkxK3FxcWF0WU55?=
 =?utf-8?B?VDBQaEQ2Q25uUlN6RnBNZDlQY2t0ODNzVlpPczhpdFFSZE9IYXdWYkhYQmdS?=
 =?utf-8?B?WVZnTjBINlEydGxEWFI3elM1SGoxdVBIdS9xaDNQL2xhemFYTmN1S2haMjNC?=
 =?utf-8?B?akJsclRiWlE1WWM0ZjkrL29mMk5yNWZvSnlEQjU2T0RQU2x5eThtMlVrUjc4?=
 =?utf-8?B?NlpsSEhvamNGbTdaVUdnR3FPemIzWGJvemhPbC9kSTQ3a25UQWpHTFhJcGN3?=
 =?utf-8?B?L2QrNDVRckZacHpWZHBLNjNUTzB4MXJnMjFOUWVzQ2xveWErODZqT1creHBE?=
 =?utf-8?B?b2hHOEdpcklUd1ZRR0dXTG85K0ZiSGkrZ1p6Yjk1d3pXUm12ZDE5eUEyS0da?=
 =?utf-8?B?aWtxM1k1KzAwSm9VNE9CNE56bUEvT3J3WWwzd2thaGh1eGgwU1RQR3o2cVpG?=
 =?utf-8?B?VnBOUG1uOWd2eUxmMnBjSWxtVDNzZER0SGxYYzB0L05sNmdOcnAvd0pOc1Jo?=
 =?utf-8?B?bFljVXJUa2VaMG1YaDc2VHZURncwYjZVSWprOTAyZFpiNEpLQjVZZmZPN1lL?=
 =?utf-8?B?Vjk5TCs1eTkwMUdJdXlseFVKb0RWT3RUTWNmT1BBZHpOd3lMSGlZNEg4S29a?=
 =?utf-8?B?eExSdFR4VnJ0SlMwelVMT2NraG5TckhjVnNnWk56Q1BVYUhjbGFiZ29zK0Uy?=
 =?utf-8?B?L1ZTQzhrY3ZsUVRxZ0pkakZsMkZSUG91K21lUDE3NzNFcW50Rm1rQ0Qvc3ps?=
 =?utf-8?B?ckVZaWtjL3YxbXQwMnJVWWZJODlGS2lLakhybUNsMnpXTEVXRDhKNlVPdmpl?=
 =?utf-8?B?UXpRcjV5eHRZc01LZ1c0b2Jvc2hJWkV0bjN2cXJycWFDNWdGTzRiUHl5ekti?=
 =?utf-8?B?YnlpQks3Y2w1aElXT0o0WHpvb0pjZGVtVVdJS21zVmlkMExKbjV1MWU4NCtR?=
 =?utf-8?Q?ea7OI4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azJFajk3T1pWUTNHelVwOWJjOE1NZmJKclplUHNwWWUrMHJaVlhSNGRwRXdF?=
 =?utf-8?B?Y1VlM2NObDhDbThpNHFMb0dkeVVTSnQwckczbHNqbk1seDZBSWk5ekFBRENR?=
 =?utf-8?B?Y05mQjFyRWJtTW1VRUMvREI0ZGExRU5hb2xrc2xyUE1lSXhnV2xHWmtWaVM2?=
 =?utf-8?B?TjVLUW9YelFwR29HVkVERnVGbEVJR3YzcVNySitWZ1lKUEVSSVYyU21WNERq?=
 =?utf-8?B?VCs2NU5FTTF1ZDZNaUVVYlQvQllSQURuUWtON09yMWgwSWdNQVdhUGZkRWdH?=
 =?utf-8?B?dFlDOHVJUjFiUGxPZUdwZUQxSGtSSElKMGJ2ZTJ0ZEJzOUlGLysxWUpFTnJJ?=
 =?utf-8?B?NU1WL2RrUjc2OTM4K3poZlJGYXErcTZ2aC8vQ0ZxMS9iTUQwNmN2ZmgzV1J0?=
 =?utf-8?B?eis2VW1tNmVkUkZMeWxCemtGOFh2ZXQ2c1hiWGo5K3MwNSsxVkM3dUxlWE9H?=
 =?utf-8?B?YTBaUzFnT2FrRmk0OW1HaFkxQWt4WVkxMXNuaXR1enhXbC9SWmJRaXgxWlkv?=
 =?utf-8?B?Wk9oNWd2REVrdXVKSW45YVU0aEh2akRzRWx3djZkZ1BMZVlDKy9rd1FrUjBO?=
 =?utf-8?B?NXdTalMzWDVqR3FBcHJ1b2YyZzRnemcyZStzeW9vNERNaVJheSs0cmZpZjQr?=
 =?utf-8?B?QXlPeUlvMGI4c09lY2RSL29FUmlGYUdqcmZjRnN3aS9rcTJ6RWNDY3h0N2Zq?=
 =?utf-8?B?R1NYR2cvTFkzSno0MHRUcmRxWWtMd3dNOHpxL1A1ZzVhRVF4M0wyTVFNVFM4?=
 =?utf-8?B?WDlyN3AwRktocmczb21GUmVmR2labEhSMks0UFpya2ZvNHY1NUFUNjJEZVpY?=
 =?utf-8?B?NXFGTFAvbnUxKzJDUWJaVnQzUk9PN2ZjNXl4a2U3RThTYjdRUm53VDZzaENB?=
 =?utf-8?B?b05WWnlFeEExZVA3RUIvQllvOHdJb3I4blJYaWhKS2VZZWtKTzloVmRoa3pO?=
 =?utf-8?B?VHlrTE9iaVVNd2ZEUG5jVmpIV2R3a1hxVUhZUWRvZjQ4YmluWnd2SG9JQWdS?=
 =?utf-8?B?VjYvUXpicnVDTXR3SjJ6Y3pEK0l5eHdkaVU4dFg2SEV2NFgxTkJmSi9TMVp5?=
 =?utf-8?B?ZUpuN3VwN2lrRXF5WExRRWhUVWY3NGEvYmJVRmc0ZTBYZlBySWpnRkwrMlBT?=
 =?utf-8?B?Wlh0VDIraEd0cXJwUlpUSzY5SlZmcGcyb1kwaklNeENMZEhqcFhoUGVGZ3lZ?=
 =?utf-8?B?dTdEcVVOQlVkNjdFQjhlQmZmQW9KYVFDOTlvaDRERGxVV0ZhcExsK2k4UU5G?=
 =?utf-8?B?dlhvUnFFU21yUFdFN0Mxc2hCVktudnFwdlc1ZFU2eVE4NnJST1Fxc2xraEg2?=
 =?utf-8?B?Zzk4dE54aGNGaHlMeVpUYmZ2YzJkMnFaZmowc1cwSEhEWnZFNVNjdTY1ZGJJ?=
 =?utf-8?B?TmhDYkYrb1JJZys3TDVhUEZvY1FGc01tb1Z3NnpMcFA5OHpmanI3UzAveENP?=
 =?utf-8?B?eW5DK0VMTGF5MktZZmJvdTRleHFPbzVvV0hubU5EQ0ZJMG1mOUtzdDVPZVBV?=
 =?utf-8?B?NHZ4SFRpNnV5dGxHZnZyM0JzRk02cmxhT3pKR294NzZKaWFHTEJJS1FPdHFM?=
 =?utf-8?B?bEgwNWk1dkx1UHZrR0FKL0VEWEZMNFU3c0RsUUhRMnVaVW9iMDl0V2trL2Qv?=
 =?utf-8?B?bGhsaWxTUmJUcVZjd0FTNGxuTmgybUpxd0dIZ2RNdDlLcnhnbjlNdWhWMFJX?=
 =?utf-8?B?R05kR3RZdEQxeklFU2ZSZktaaWtvaFlENUZBTTlIZms2L1lYWnJKTWtac0Qx?=
 =?utf-8?B?NEtnNFZ3U2ZQNFNreUNuZ0QrdENyL0ZEUEFBU2hBZ29HSUw0ejBjUC83Vjk5?=
 =?utf-8?B?a1NGeGh3b3E4ell4cGgySHowNWV2L0lyS0Y5TFpRRlBUR21INjlpYmFtRjZo?=
 =?utf-8?B?Qmp1eWdXaERLVWRQMkNDRTZRSHN6SU11UmFDOXJEWkwydUFnUDZOeVJIWUhJ?=
 =?utf-8?B?OTg0THp4ZDZMVWtRSXhkOWJTR3RJdXZRMjhhU0p6UFl6Wk5NYS9EaWZLaEEv?=
 =?utf-8?B?ZnpDbjFNVXpEWnVzMDBMSk93aDI3ckdXQTZZS3huTit1dlUxTm9KZFdsZkdG?=
 =?utf-8?B?SFBJYXRlaVYwNWdoQnJvcG40VEdaWWptNHlza3BEdzMyRlp3ZS9JZFVRQ2pL?=
 =?utf-8?B?K3dBTzVWWVdSM1JCYVg1Q3NweTBTTWw0eEIrTWNvcHlWOEYwV3kvcGdwRmpE?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BD2EAA8835EBC4E8AEBD6044552E0AA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275e5e9e-8fc1-4928-3833-08de372daac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 14:17:21.0725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cyVzsfI1EfPSOnIitHqCbr0PEafUJx2VJT6RHypcB901QuQBpHjF3CjvU1t4LW4ddoEEKdW7Y73vZYGuLnHVBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
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
VHVlLCAyMDI1LTEyLTA5IGF0IDEzOjUxICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+
IEdpdExhYiBwaXBlbGluZSBub3cgcnVuIHdpdGhvdXQgdGhpcyBzeW1saW5rIHNvIHJlbW92ZSBp
dC4NCj4gDQo+IENjOiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4g
Q2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQG9zcy5xdWFsY29tbS5jb20+DQo+IENjOiBSeXN6YXJk
IEtub3AgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+DQo+IENjOiBWaXRhbHkgUHJvc3lhayA8dml0
YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxr
YW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIHNjcmlwdHMvdmVyaWZ5
LWJsYWNrbGlzdC5zaCB8IDEgLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4g
IGRlbGV0ZSBtb2RlIDEyMDAwMCBzY3JpcHRzL3ZlcmlmeS1ibGFja2xpc3Quc2gNCj4gDQo+IGRp
ZmYgLS1naXQgYS9zY3JpcHRzL3ZlcmlmeS1ibGFja2xpc3Quc2ggYi9zY3JpcHRzL3ZlcmlmeS1i
bGFja2xpc3Quc2gNCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTIwMDAwDQo+IGluZGV4IDdmNzA2ZDYx
Yi4uMDAwMDAwMDAwDQo+IC0tLSBhL3NjcmlwdHMvdmVyaWZ5LWJsYWNrbGlzdC5zaA0KPiArKysg
L2Rldi9udWxsDQo+IEBAIC0xICswLDAgQEANCj4gLXZlcmlmeS1ibG9ja2xpc3Quc2gNCj4gXCBO
byBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo=
