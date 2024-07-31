Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9B3C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 09:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2492110E027;
	Wed, 31 Jul 2024 09:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWOK8gOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EB910E027
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722417747; x=1753953747;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9U9DkXYYBntW8ZeEs3lQVIRluboEMe3Aiq/lMwD6WtA=;
 b=kWOK8gOTAcjxL81o3hViGP+dW01sKQ3RCaNd9Di/VV51YsfqYMv7ZOSD
 MFp1qIUY9l+FY03XYEPXyRPsKGbivel+YkD/9kAAsInbX7A9n1Zt0Xnl9
 TPp+/85dlIu/eao4R1FYxQRhDJyY1DU8Yxud4k1A4gEMW91sbbBmyy2ak
 wNS2/tv8+8jKBA80kNdkQ2DmCtWKkNc8aaNxiemGkamtxL6TWtWP6rLAb
 G5GNjPhqwkJlU2Vaf19PfK6BnPHRdRiSSgZD0no5XeWFTGF75KSBjhCpn
 s9v3NKPjTQohgXSxnOJnfef1oVqEaYGSiUbH7Xc8q7+v2H86if0Dz+Pvh w==;
X-CSE-ConnectionGUID: w9oOLvR8R/e8PmKUN4OfWw==
X-CSE-MsgGUID: GxAiUv5JQYmHuereNEt5/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24045144"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="24045144"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 02:22:26 -0700
X-CSE-ConnectionGUID: 54fsngfkQyy07PNJ68gp7g==
X-CSE-MsgGUID: 3CWdwyODSUmD9PKufqMWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="55432081"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 02:22:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 02:22:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 02:22:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 02:22:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 02:22:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fmv02kBOZX5hhDXuoDz8bexuANOWD7y90VvTQzcXjO4y3s2L1IvJNpDhbCGQDH37qV8FirMwLXyaL6sbMz1uXTH0kPPgKu6PBTPdrnqzsCX5A2lfSRcEs3D9N1QSp8kLJxbEgYNQU13vGojNrVpRYSY5Z2Dt7/qhLgdnIZTSaFvBL/yWr36kEc83lnP4jXjxdrLgEFFoZAergZKFQGIJxwKkT2JhRRPN+rTzDrP0v+eq+cOQa6BHngzEqiaq34tF/3aJBd3rhyRyDYVEikvcw8S2ldd9ZtNHaLUrLwUJf4d4yhrcP2F72jVckU94UWqOJY+wHrCsZBhcfQ9JueOOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U9DkXYYBntW8ZeEs3lQVIRluboEMe3Aiq/lMwD6WtA=;
 b=GsKm2SO9uA3p1HsfC661S2upZG8H4KftpZut/mKnEAK/yEkiPQ+yaJeOf8gQ32xlIrNrOmtab3hbVCIfCgGXT2xwDHglxEcaDaf5c+zNtirB4C7BvgGcFbAtBKivffjzYLbujiU+OkcOU1UwEOnVjK7eibERq+N83qV3xdPVwNGBSp6/5VddZsmrTFWoBXgAyqAbhwWPci+SJpLu/3BV9n/B7xxnMqfyL9+hvBceDumkITtdolOAn5ESyszu2rGSS0jEC3gxkZkgD9jGojgybL36uprPjvFB9ma6wJiHZxoeFeOlPa1zL7odx67JW6Upd7nCZaPqQEyMOK8P0snd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 09:22:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 09:22:22 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
Thread-Index: AQHa4llgslLaj6o45UK2/uJO4sKmELIPN6EAgAFXl2A=
Date: Wed, 31 Jul 2024 09:22:22 +0000
Message-ID: <DM4PR11MB6312E4F4A6B7CE935CB56E8D90B12@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240730083111.2897557-1-jeevan.b@intel.com>
 <20240730083111.2897557-3-jeevan.b@intel.com>
 <0256f62e-e27b-490e-b414-88cca0fcd18f@intel.com>
In-Reply-To: <0256f62e-e27b-490e-b414-88cca0fcd18f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB5889:EE_
x-ms-office365-filtering-correlation-id: 87d64304-778a-43bb-358b-08dcb14248df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OS9qUnhSNFZGaEl4cjVXcE90MUNmM2l5L0Y2bitLeE14K3VSNjFZMzVGa2hS?=
 =?utf-8?B?WHVVb2x6Z0NnV2NWbFRPcWs0U0FtTExiWmgzdVl1UWNwR1NtMCs1Y0RFbkR3?=
 =?utf-8?B?WEs2d2pHSThBajI2REQybEVyd3BuQnk2NUNQU3gveUhFbDBZTlZ2eitjdGdx?=
 =?utf-8?B?Z2ZjeXZvR0toK3FtWHQ0aVlTVXh4Wk5VUWpHcmgrMmp6cy9WUlgzSFRiY1Qz?=
 =?utf-8?B?ODlMcDgwM2tyVm9DU0kxYVlzeGYzQmNkMGVJc1BZOTFyMkdmWnpvMm92dnN2?=
 =?utf-8?B?WXZpbnlNOTBkOXhabEpsS2hSWkY1N0hlb0xKdHZwdTZxbnl3YU1XVWJPTG0r?=
 =?utf-8?B?U2hnVmdEUnhobFFCaFVXbk9nekhKMTFvZEVicFN0dHhaWXlwb293YzFNd1B1?=
 =?utf-8?B?dmx4RkRUcEJpQ2Jxa0g3V1djaEtTY1I3ZUhvSURGZHZnbk03dWZGQXYyS1RI?=
 =?utf-8?B?MmZDZHhodFptWEpSc0J4dm0xYUFWVERZTk5BRzJyMUpUdFZTSExSeC9xaGh0?=
 =?utf-8?B?MDg5RDRZbEZ1VDBMZ3RhMHpmN1ZVWHl2T0FpVVRHekloaXB4UjN3c0FYaFpU?=
 =?utf-8?B?MnIwbWtaWHVVMitFWDhmTDJ4dExmU3NFSlo5WmNKOWpXdmFZYUFrMFd0K2w4?=
 =?utf-8?B?bFlUZ3ZiTzBmZEV1R1haNXdsdEpwelJIbFgzMnU0WXB5ZHR4dllGbWV2d2NM?=
 =?utf-8?B?a21yWkNnT25oUFNXenhaUHhrTU4vcUxXWktpbldxd1lPYk9GcVpsN3B6eEJK?=
 =?utf-8?B?S3puRjZHU1B3ZEl6elVTc1dHa1J4c0hDZGlKVUxiNHpaSkcwcHNWYUVrOC9r?=
 =?utf-8?B?cVluT2l5UXl0V2doalNiSWlaOCs5RkRXZ0ZNcU5uSURXUGlkem9YaE16UC9Q?=
 =?utf-8?B?bW1QSUlvZ2RoeFk4eWQ5ZTMvUjgxMEE3YmN5bnc3QndDb2Nodm9ZNE9SU0py?=
 =?utf-8?B?a3VTN2h5elNBdVVXU2N6OHcvK0lTVzY2VXNDQVNUZjB5N3hvZElMbldTeWJy?=
 =?utf-8?B?QVJkMTF5R3BMcW9FSkxpNGVhYWI4S0YwS09vUlllVU1mNEViSWIwczZLVE1w?=
 =?utf-8?B?QU1lM013Qmw2QXFtR2pTZEF5VGpYUHJGYllVN2NqVjFHTEljLzJpZjlmTTk5?=
 =?utf-8?B?eXlFcWYybnBJcVByOWJZd3ZHTVFPSzczY0YrRVBaWEpKekR1RE5NdFlZVFR0?=
 =?utf-8?B?WmowT1EzUnJoSjA1aUp1aWpaV05tdXdwbjN3YTZZS2ViOExGMFRMMVo4cVZ3?=
 =?utf-8?B?dmtZL2tYSGtxVE0wT0pnVGxnNEdqbnZCV0hLWnZkbXNsaGowUzlRU2dDR0ZH?=
 =?utf-8?B?R0g5YmhyZGhkRWFuRmwwa0dVK2ExRjFraHd0MnEwRmo5SXJFUzdPTk1PcVlZ?=
 =?utf-8?B?eDM0d01UYmdTbXhqb0dPbjhUZ3VUa3Evc2hDbjI0REVEaXcranVaRnZPdXdH?=
 =?utf-8?B?TnloS21qS21OYWJ1UG94aU45ZkRsU2JjMmoxSWZLQkFmUm4zVzc1Z2ZaeUwz?=
 =?utf-8?B?aWtGbkhERnZISGZDYWU2blNSQmpHRWlYcjhWTDFZaXd3RUdmSmt1cytsTGdS?=
 =?utf-8?B?Vk03eEovVjVmMmFibGhjUCs3eUJGclEyenh2QzNHN0RXR21FSmZHSWtvZlY3?=
 =?utf-8?B?cG5lenRRSE5QdkRjYzU1bVQ1NUdLZDVFTkpNdEd0dVNaOHNwL2hTQzFDSjZR?=
 =?utf-8?B?MDRrN2ZZVW41T3UyLzBqODhRTGlnSmN1YWFueVJoRFowd254aDMrYmZqY3Fk?=
 =?utf-8?B?QVdHMCtCZ0VZbVF2UGlWeHF0MGsrYVJJNzhYaVdUYnN3Skhxd0xrbHA3a29W?=
 =?utf-8?Q?+6AmOmSluwoS3OczHWAaM+/w3Gl/AS/zhSlkQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODdaa0NoVmpidng4bExWS2xHQ2QzaTBZdXJqN2VVYThsK21qUTdLSDI1amE5?=
 =?utf-8?B?OHRESStwcHhVUnBoR2IvenpuZ0tIb00wRVQ0WGVIK0xZOFZnM21LVnd0OW50?=
 =?utf-8?B?dzhDOUZSYmViOUVTNjYyczZlR1FRR1REYmpMQ3g2dTJOcmdWcHVQcSs3OE9m?=
 =?utf-8?B?cXJmMGdMUDEyU24rV09HRkM3Zms3Z01vYnEzUzE2Zit3a2pXWDRSZFhBRmpu?=
 =?utf-8?B?REQrTXF3dzB1bkZ4OFZiNElQTWg5czNaak9YZHhUS3VGbkhsOFNvZldNWTAw?=
 =?utf-8?B?Y25jMXozb2xyYUcvU2NCOURZZEwxdEpqZUpXalFwY1ZwS1pZSlp3UWFlMHVT?=
 =?utf-8?B?cGZJWW9JdUtVQUs1OXRPdjEvenFGSXYzZ09ZY0hkMmplRXJEbGlDenBCcTFC?=
 =?utf-8?B?UnhNWnZTMExCMkZXSmdXVTdMSTk3c1lUWGg2VEJ0Z0lIcUw3ZnpkejgyUUx5?=
 =?utf-8?B?cGtzdEYzY2t0Nk1tOU9aaGxqYjBzM3B5a3ByQXBhRW1XSUgxZktobTE1SVZC?=
 =?utf-8?B?enpCODFnMUVydTZMYkpOZW9TaG1UTjN3elIxQ2djUmdibHFWT1h3bVdQWko4?=
 =?utf-8?B?RFBOVmZLN2dVR3hnUFcrcFZMZngrSFNzWUhDejNaMXdXQVB6OWE1YVFyNXZK?=
 =?utf-8?B?aVROdUErOFRYRnlRdTByZUxlZW5PalhUZXFhd1BqODlGZnJkclVZZXdyUDdw?=
 =?utf-8?B?WUwwY3JOL2lKS0FnZlRMR3ZxRWRSUzFibVVUbkFRVEdUbk9uVnE4NFdySUJx?=
 =?utf-8?B?N1gyU29DRzdwRHZhM3VodHJnV2pEcktJeEhjams2RlZBZURSeFVya29aei9J?=
 =?utf-8?B?UmNsZ1BvMVRVb2ZvdXg4WHUwUFFmRzVRK0Q1SHh2M0xaS3lPMmpQQ0RBSXVK?=
 =?utf-8?B?N0JqMjdJRVAzU2RoTTlSaFJCckIybFhvZTFpRlBoc2ViOHd2WWtFck9ZOHlx?=
 =?utf-8?B?cGFkaGdwUkZyaytmcW8vSWtsdmpkaytveExmWllJeFBCQmZoRWQ4YnY3WWIw?=
 =?utf-8?B?Vk40VElPOVI2VGo1dGdZb2pHbGZqMXVyRytZaTFrMmFVRW8rZ1pyTDd6dlov?=
 =?utf-8?B?aEZCU0J3VmtGV0tBY0lnanFxVnVVaWsyWnVZaG9Sa1BCak1SelNiQzJWR1R4?=
 =?utf-8?B?SHMzUTNXTG1Yc0tuSUt6bWdnR2lwMURDVkMwWklGeTdaTmNpcXgzNnFJTk9I?=
 =?utf-8?B?dDJRQ0QwVVhpaDNjT1JtYm16eUh4YThMOGpRbzNaNFZMWHhEbUt3VWQyM1p3?=
 =?utf-8?B?ZDRpTlByblJIcWcrUytBa0hpNlcrRzRraW5PMVp3RWdkaDR6dTZkd2pkcVAz?=
 =?utf-8?B?dGpROUxzMmFMYVBvWXhrMm1ZcE5qYWZUT3FmVCtEWlZvdEs3TFhiNVIybXhx?=
 =?utf-8?B?ZmgzUEk4M0ZjOTdoU252a3h5dUZiUDNxSVptS3YxeGxWUURoQWxvUURSZ0pT?=
 =?utf-8?B?Ym4xTk93N0xJYlgwZzlleVFTanp1Q0gzR2xNTllPMEt0VEZYakpJQmFFK0Rj?=
 =?utf-8?B?L2FKa01zQjVDRHQ5dE5TZGNLMUIrSSt3WXBqbVhPVFNISTQrZmtnazE0dXQ4?=
 =?utf-8?B?bXEzM3Y4TmkzZXk4UGpuV2ZlZlBxQUQ5YTU4bnFuYmVCUmMvRzNnUURjY0hE?=
 =?utf-8?B?ODZsNnBKWithTE1ra1FSQ3ZXOVpTMVRNOTB6WEZhZkN0YmtXc3pYTXFwNlkz?=
 =?utf-8?B?TVcxSHBNQ3ZuaDQzL3NYcVRqam4xZ0x5TTA4MFlCUDVjbUdRSWlJK0tja2Iz?=
 =?utf-8?B?UkpWZ05mOHo0cjVWTEFscDlra2Q0em5BYWJ4Ym5QcjVYeWZRWjNxV3BObWkz?=
 =?utf-8?B?ZGtCeUllUEhTaEdHMnorQnhMZXp2eVljbVFHcmNrVUlVcUFObWNsTlYyTGxE?=
 =?utf-8?B?VEMveEJicGxLZDRneDdFb2tvN3h1NjdDcWZaTDB3S1lTUmRaTjQ3aTdRdE85?=
 =?utf-8?B?K08zSnVFMmNWUzZPL3IyV21PaXJOeHU0anQvV3RNeDdUdENUVFdzRitKb1E3?=
 =?utf-8?B?NGUrTmRHZUp6bUZ6SHp4YlRZVUVBdEltQTI4SWJlZ3h6OG81TTZrNDRJemNt?=
 =?utf-8?B?aWpsSHNPb1k1K0doTGFFdkVZL3BrSnoyTFVlM01HU3FpMjlLZktWd2l1anhm?=
 =?utf-8?Q?RL/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d64304-778a-43bb-358b-08dcb14248df
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 09:22:22.8233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3IaTXFfjNYqrLJetXbH3SxJm2eBlScHcx4BMh0bqllD21JZzFRjspsZ/nq0XcatzNhQ5/9RpabB374n8OS2c1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNb2RlbSwgQmhhbnVwcmFrYXNo
IDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDMw
LCAyMDI0IDY6MTQgUE0NCj4gVG86IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPjsgaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEpvc2hpLCBLdW5hbDEgPGt1bmFsMS5q
b3NoaUBpbnRlbC5jb20+OyBNYW5uYSwgQW5pbWVzaA0KPiA8YW5pbWVzaC5tYW5uYUBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgMi8yXSB0ZXN0cy9rbXNfdnJyOiBBZGQg
bmV3IHRlc3QgdG8gdmFsaWRhdGUgTE9CRg0KPiANCj4gSGkgSmVldmFuLA0KPiANCj4gT24gMzAt
MDctMjAyNCAwMjowMSBwbSwgSmVldmFuIEIgd3JvdGU6DQo+ID4gVmFsaWRhdGUgcmVmcmVzaCBy
YXRlIGNoYW5nZXMgdGhhdCBhcHBlYXIgdG8gYmUgc3RhYmxlIGJ1dCBhY3R1YWxseQ0KPiA+IGNo
YW5nZSBzbGlnaHRseSBpbiB0aGUgVlJSIHVzaW5nIHRoZSBmaXhlZCByZWZyZXNoIHJhdGUgZnJh
bWV3b3JrIGZvcg0KPiA+IG5vbi1QU1Igc2NlbmFyaW9zLg0KPiA+DQo+ID4gdjI6IEFkZCBQUiBj
aGVjay4NCj4gPiB2MzogVXBkYXRlIGNvbW1pdCBtZXNzYWdlIGFuZCBmaXggY29kZSBzdHJ1Y3R1
cmUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMva21zX3Zyci5jIHwgNjcNCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDY1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
dGVzdHMva21zX3Zyci5jIGIvdGVzdHMva21zX3Zyci5jIGluZGV4DQo+ID4gN2U4ODg1ZjE2Li44
ODg1NWIwMWQgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMva21zX3Zyci5jDQo+ID4gKysrIGIvdGVz
dHMva21zX3Zyci5jDQo+ID4gQEAgLTMxLDYgKzMxLDcgQEANCj4gPiAgICAqLw0KPiA+DQo+ID4g
ICAjaW5jbHVkZSAiaWd0LmgiDQo+ID4gKyNpbmNsdWRlICJpZ3RfcHNyLmgiDQo+ID4gICAjaW5j
bHVkZSAiaTkxNS9pbnRlbF9kcnJzLmgiDQo+ID4gICAjaW5jbHVkZSAic3dfc3luYy5oIg0KPiA+
ICAgI2luY2x1ZGUgPGZjbnRsLmg+DQo+ID4gQEAgLTc2LDYgKzc3LDExIEBADQo+ID4gICAgKiAJ
CXdpdGhvdXQgYSBmdWxsIG1vZGVzZXQuDQo+ID4gICAgKiBGdW5jdGlvbmFsaXR5OiBMUlINCj4g
PiAgICAqDQo+ID4gKyAqIFNVQlRFU1Q6IGxvYmYNCj4gPiArICogRGVzY3JpcHRpb246IFRlc3Qg
dG8gdmFsaWRhdGUgbGluay1vZmYgYmV0d2VlbiBhY3RpdmUgZnJhbWVzIGluIG5vbi1wc3INCj4g
PiArICogICAgICAgICAgICAgIG9wZXJhdGlvbg0KPiA+ICsgKiBGdW5jdGlvbmFsaXR5OiBMT0JG
DQo+ID4gKyAqDQo+ID4gICAgKiBTVUJURVNUOiBtYXgtbWluDQo+ID4gICAgKiBEZXNjcmlwdGlv
bjogT3NjaWxsYXRlcyBiZXR3ZWVuIGhpZ2hlc3QgYW5kIGxvd2VzdCByZWZyZXNoIGVhY2ggZnJh
bWUgZm9yDQo+ID4gICAgKiAgICAgICAgICAgICAgbWFudWFsIGZsaWNrZXIgcHJvZmlsaW5nDQo+
ID4gQEAgLTEwNiw3ICsxMTIsOCBAQCBlbnVtIHsNCj4gPiAgIAlURVNUX0ZBU1RTRVQgPSAxIDw8
IDcsDQo+ID4gICAJVEVTVF9NQVhNSU4gPSAxIDw8IDgsDQo+ID4gICAJVEVTVF9DTVJSID0gMSA8
PCA5LA0KPiA+IC0JVEVTVF9ORUdBVElWRSA9IDEgPDwgMTAsDQo+ID4gKwlURVNUX0xJTktfT0ZG
ID0gMSA8PCAxMCwNCj4gPiArCVRFU1RfTkVHQVRJVkUgPSAxIDw8IDExLA0KPiA+ICAgfTsNCj4g
Pg0KPiA+ICAgZW51bSB7DQo+ID4gQEAgLTEyOSw2ICsxMzYsNyBAQCB0eXBlZGVmIHN0cnVjdCB2
dGVzdF9ucyB7DQo+ID4gICB0eXBlZGVmIHN0cnVjdCBkYXRhIHsNCj4gPiAgIAlpZ3RfZGlzcGxh
eV90IGRpc3BsYXk7DQo+ID4gICAJaW50IGRybV9mZDsNCj4gPiArCWludCBkZWJ1Z2ZzX2ZkOw0K
PiA+ICAgCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KPiA+ICAgCWlndF9mYl90IGZiWzJdOw0KPiA+
ICAgCXJhbmdlX3QgcmFuZ2U7DQo+ID4gQEAgLTc4NCw2ICs3OTIsNDUgQEAgdGVzdF9zZWFtbGVz
c192aXJ0dWFsX3JyX2Jhc2ljKGRhdGFfdCAqZGF0YSwgZW51bQ0KPiBwaXBlIHBpcGUsIGlndF9v
dXRwdXRfdCAqb3V0cHUNCj4gPiAgIAl9DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQN
Cj4gPiArdGVzdF9sb2JmKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHBpcGUsIGlndF9vdXRwdXRf
dCAqb3V0cHV0LA0KPiA+ICt1aW50MzJfdCBmbGFncykgew0KPiA+ICsJYm9vbCBjaGFuZ2VfbW9k
ZSA9IGZhbHNlLCBmbGlwID0gdHJ1ZTsNCj4gPiArCXRpbWVfdCBzdGFydFRpbWUgPSB0aW1lKE5V
TEwpOw0KPiA+ICsJdGltZV90IHNlY3MgPSA0LCBjaGFuZ2VfdGltZSA9IDM7DQo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLV4NCj4gV2hhdCBpcyB0aGUgZnVuZGEgYmVo
aW5kIHRoZXNlIG1hZ2ljIG51bWJlcnM/DQpXZWxsIHdlIHdhbnQgdG8gcnVuIHRoZSB0ZXN0IGZv
ciA0IHNlY3MgYW5kIGNoYW5nZSB0aGUgbW9kZXNldCBhdCAzIHNvIHRoYXQgaW4gcmVtYWluaW5n
IGhhbGYgc2Vjb25kIHdlIGNhbiBleHBlY3QgdGhlIExPQkYgYWN0aXZlIHN0YXR1cy4gDQo+IA0K
PiA+ICsJaWd0X3BsYW5lX3QgKnByaW1hcnk7DQo+ID4gKwlkcm1Nb2RlTW9kZUluZm8gbW9kZSA9
ICppZ3Rfb3V0cHV0X2dldF9tb2RlKG91dHB1dCk7DQo+ID4gKw0KPiA+ICsJZGF0YS0+ZGVidWdm
c19mZCA9IGlndF9kZWJ1Z2ZzX2RpcihkYXRhLT5kcm1fZmQpOw0KPiANCj4gUGxlYXNlIG1vdmUg
dGhpcyBpbml0aWFsaXphdGlvbiB0byBvdXRwdXRfY29uc3RyYWludCgpLg0KDQpHb3QgaXQuIA0K
PiANCj4gPiArDQo+ID4gKwlpZ3RfaW5mbygiTE9CRiB0ZXN0IGV4ZWN1dGlvbiBvbiAlcywgUElQ
RSAlcyB3aXRoIFZSUiByYW5nZTogKCV1LSV1KQ0KPiBIelxuIiwNCj4gPiArCQkgb3V0cHV0LT5u
YW1lLCBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwgZGF0YS0+cmFuZ2UubWluLA0KPiA+ICtkYXRh
LT5yYW5nZS5tYXgpOw0KPiA+ICsNCj4gPiArCWlndF9yZXF1aXJlKCFpZ3RfZ2V0X2k5MTVfZWRw
X2xvYmZfc3RhdHVzKGRhdGEtPmRybV9mZCwNCj4gPiArb3V0cHV0LT5uYW1lKSk7DQo+IA0KPiBJ
IHdvdWxkIHJlY29tbWVuZCB0byBtb3ZlIHRoaXMgY2hlY2sgdG8gb3V0cHV0X2NvbnN0cmFpbnQo
KTsNCj4gRXg6DQo+IAlpZiAoKGZsYWdzICYgVEVTVF9MSU5LX09GRikgJiYNCj4gCQlpZ3RfZ2V0
X2k5MTVfZWRwX2xvYmZfc3RhdHVzKCkpIHsNCj4gCQlpZ3RfaW5mbygiUGxlYXNlIGFkZCB5b3Vy
IHNraXAgbWVzc2FnZSIpOw0KPiAJCXJldHVybiBmYWxzZTsNCj4gCX0NCj4gDQpTdXJlIHdpbGwg
ZG8gdGhpcy4gDQo+ID4gKwlwcmltYXJ5ID0gaWd0X291dHB1dF9nZXRfcGxhbmVfdHlwZShvdXRw
dXQsDQo+IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOw0KPiA+ICsJaWd0X2NyZWF0ZV9jb2xvcl9m
YihkYXRhLT5kcm1fZmQsIG1vZGUuaGRpc3BsYXksIG1vZGUudmRpc3BsYXksDQo+ID4gKwkJCSAg
ICBEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+ID4gKwkJ
CSAgICAxLCAxLCAxLCAmZGF0YS0+ZmJbMF0pOw0KPiA+ICsJaWd0X2NyZWF0ZV9jb2xvcl9mYihk
YXRhLT5kcm1fZmQsIG1vZGUuaGRpc3BsYXksIG1vZGUudmRpc3BsYXksDQo+ID4gKwkJCSAgICBE
Uk1fRk9STUFUX1hSR0I4ODg4LA0KPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+ID4gKwkJCSAg
ICAxLCAxLCAwLCAmZGF0YS0+ZmJbMV0pOw0KPiANCj4gUGxlYXNlIHJlLXVzZSBwcmVwYXJlX3Rl
c3QoKSB0byBjcmVhdGUgZnJhbWVidWZmZXJzLg0KDQpPayANCj4gDQo+ID4gKw0KPiA+ICsJaWd0
X291dHB1dF9vdmVycmlkZV9tb2RlKG91dHB1dCwgJmRhdGEtDQo+ID5zd2l0Y2hfbW9kZXNbSElH
SF9SUl9NT0RFXSk7DQo+ID4gKw0KPiA+ICsJd2hpbGUgKHRpbWUoTlVMTCkgLSBzdGFydFRpbWUg
PCBzZWNzKSB7DQo+ID4gKwkJZmxpcCA9ICFmbGlwOw0KPiA+ICsJCWlndF9wbGFuZV9zZXRfZmIo
cHJpbWFyeSwgZmxpcCA/ICZkYXRhLT5mYlswXSA6ICZkYXRhLT5mYlsxXSk7DQo+IA0KPiBJbnN0
ZWFkIG9mIHRoaXMgbG9vcCwgY2FuJ3Qgd2UgdXNlIGZsaXBfYW5kX21lYXN1cmUoMyBzZWMpPw0K
PiANCldpbGwgc2VlIGlmIGNhbiBhZG9wdCB0aGF0LiANCj4gRXg6DQo+IAlwcmVwYXJlX3Rlc3Qo
KTsNCj4gCWZsaXBfYW5kX21lYXN1cmUoMyBzZWMpOw0KPiAJaWd0X291dHB1dF9vdmVycmlkZV9t
b2RlKGxvd19ycl9tb2RlKTsNCj4gCWZsaXBfYW5kX21lYXN1cmUoMSBzZWMpOw0KPiAJaWd0X2Fz
c2VydF9mKGlndF9nZXRfaTkxNV9lZHBfbG9iZl9zdGF0dXMoIkxPQkYgbm90IGVuYWJsZWQiKSk7
DQo+IA0KPiA+ICsJCWlndF9kaXNwbGF5X2NvbW1pdCgmZGF0YS0+ZGlzcGxheSk7DQo+ID4gKwkJ
aWYgKCFjaGFuZ2VfbW9kZSAmJiB0aW1lKE5VTEwpIC0gc3RhcnRUaW1lID49IGNoYW5nZV90aW1l
KSB7DQo+ID4gKwkJCWlndF9vdXRwdXRfb3ZlcnJpZGVfbW9kZShvdXRwdXQsDQo+ID4gKyZkYXRh
LT5zd2l0Y2hfbW9kZXNbTE9XX1JSX01PREVdKTsNCj4gDQo+IFdoYXQgaXMgdGhlIGV4cGVjdGF0
aW9uIGlmIHRoZXJlIGlzIG5vIExPV19SUl9NT0RFIGF2YWlsYWJsZT8gSSBjYW4gc2VlLCB0aGVy
ZQ0KPiBpcyBhbiBWUlIgcGFuZWwgYXZhaWxhYmxlIGluIENJIHdoaWNoIGlzIGhhdmluZyBzaW5n
bGUgbW9kZSBbMl0uDQo+IElzIHRoaXMgdGVzdCBub3QgYXBwbGljYWJsZSBvbiB0aGlzIHBhbmVs
Pw0KPiANCj4gWzJdOg0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14
ZS94ZS0xNjg5LQ0KPiA3ZDdjNjQ5NGFlN2RjZmIxNTk5OGI2NDM4N2JhNjZiNDlkYTE2Mjg2L2Jh
dC1sbmwtDQo+IDEvaWd0QGttc19waXBlX2NyY19iYXNpY0Bjb21wYXJlLWNyYy1zYW5pdHljaGVj
ay14cjI0Lmh0bWwNCj4gDQo+ID4gKwkJCWNoYW5nZV9tb2RlID0gdHJ1ZTsNCj4gPiArCQl9DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWd0X2Fzc2VydF9mKGlndF9nZXRfaTkxNV9lZHBfbG9iZl9z
dGF0dXMoZGF0YS0+ZHJtX2ZkLCBvdXRwdXQtDQo+ID5uYW1lKSwNCj4gPiArCQkgICAgICJMT0JG
IG5vdCBlbmFibGVkXG4iKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyB2b2lkDQo+ID4g
ICB0ZXN0X2NtcnIoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlwZSwgaWd0X291dHB1dF90ICpv
dXRwdXQsIHVpbnQzMl90IGZsYWdzKQ0KPiA+ICAgew0KPiA+IEBAIC04NTEsNiArODk4LDE1IEBA
IHN0YXRpYyBib29sIG91dHB1dF9jb25zdHJhaW50KGRhdGFfdCAqZGF0YSwNCj4gaWd0X291dHB1
dF90ICpvdXRwdXQsIHVpbnQzMl90IGZsYWdzDQo+ID4gICAJICAgICFpbnRlbF9vdXRwdXRfaGFz
X2RycnMoZGF0YS0+ZHJtX2ZkLCBvdXRwdXQpKSB7DQo+ID4gICAJCWlndF9pbmZvKCJTZWxlY3Rl
ZCBwYW5lbCB3b24ndCBzdXBwb3J0IERSUlMuXG4iKTsNCj4gPiAgIAkJcmV0dXJuIGZhbHNlOw0K
PiA+ICsNCj4gPiArCWlmICgoZmxhZ3MgJiBURVNUX0xJTktfT0ZGKSAmJg0KPiA+ICsJICAgICBv
dXRwdXQtPmNvbmZpZy5jb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlICE9DQo+ID4gK0RSTV9NT0RF
X0NPTk5FQ1RPUl9lRFApDQo+IA0KPiBJbnN0ZWFkIG9mIHdyaXRpbmcgYSBuZXcgY29uZGl0aW9u
LCB3aHkgY2FuJ3Qgd2UgZXh0ZW5kIHRoZSBleGlzdGluZyBsb2dpYyBbMV0uDQo+IA0Kb2sNCj4g
WzFdOg0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMv
LQ0KPiAvYmxvYi9tYXN0ZXIvdGVzdHMva21zX3Zyci5jI0w4NDYNCj4gDQo+ID4gKwkJcmV0dXJu
IGZhbHNlOw0KPiA+ICsNCj4gPiArCWlmICgoZmxhZ3MgJiBURVNUX0xJTktfT0ZGKSAmJg0KPiA+
ICsJICAgIChwc3Jfc2lua19zdXBwb3J0KGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwg
UFNSX01PREVfMSwNCj4gTlVMTCkgfHwNCj4gPiArCSAgICBwc3Jfc2lua19zdXBwb3J0KGRhdGEt
PmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwgUFJfTU9ERSwNCj4gPiArTlVMTCkpKQ0KPiANCj4g
ZGF0YS0+ZGVidWdmcyBpcyBub3QgaW5pdGlhbGl6ZWQsIGhlbmNlIHRoaXMgY2hlY2sgd2lsbCBu
ZXZlciBwYXNzLg0KPiANCj4gPiArCQlwc3JfZGlzYWJsZShkYXRhLT5kcm1fZmQsIGRhdGEtPmRl
YnVnZnNfZmQsIE5VTEwpOw0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgCS8qIFJlc2V0IG91dHB1dCAq
Lw0KPiA+IEBAIC0xMDMwLDEzICsxMDg2LDIwIEBAIGlndF9tYWluX2FyZ3MoImRyczoiLCBsb25n
X29wdHMsIGhlbHBfc3RyLA0KPiBvcHRfaGFuZGxlciwgJmRhdGEpDQo+ID4gICAJCWlndF9zdWJ0
ZXN0X3dpdGhfZHluYW1pYygic2VhbWxlc3MtcnItc3dpdGNoLXZpcnR1YWwiKQ0KPiA+ICAgCQkJ
cnVuX3Zycl90ZXN0KCZkYXRhLCB0ZXN0X3NlYW1sZXNzX3ZpcnR1YWxfcnJfYmFzaWMsDQo+ID4g
VEVTVF9TRUFNTEVTU19WSVJUVUFMX1JSKTsNCj4gPg0KPiA+IC0JCWlndF9kZXNjcmliZSgiVGVz
dCB0byB2YWxpZGF0ZSB0aGUgdGhlIGNvbnRlbnQgcmF0ZSBleGFjdGx5IG1hdGNoDQo+IHdpdGgg
dGhlICINCj4gPiArCQlpZ3RfZGVzY3JpYmUoIlRlc3QgdG8gdmFsaWRhdGUgdGhlIGNvbnRlbnQg
cmF0ZSBleGFjdGx5IG1hdGNoIHdpdGgNCj4gdGhlICINCj4gDQo+IFRoaXMgY2hhbmdlIGlzIG5v
dCByZWxhdGVkIHRvIHRoaXMgcGF0Y2guDQo+IA0KPiA+ICAgCQkJICAgICAicmVxdWVzdGVkIHJh
dGUgd2l0aG91dCBhbnkgZnJhbWUgZHJvcHMuIik7DQo+ID4gICAJCWlndF9zdWJ0ZXN0X3dpdGhf
ZHluYW1pYygiY21yciIpIHsNCj4gPg0KPiAJaWd0X3JlcXVpcmUoaW50ZWxfZGlzcGxheV92ZXIo
aW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLmRybV9mZCkpDQo+ID4gPj0gMjApOw0KPiA+DQo+ID4g
ICAJCQlydW5fdnJyX3Rlc3QoJmRhdGEsIHRlc3RfY21yciwgVEVTVF9DTVJSKTsNCj4gPiAgIAkJ
fQ0KPiANCj4gUGxlYXNlIGFkZCBvbmUgbmV3IGxpbmUgaGVyZS4NCj4gDQo+IC0gQmhhbnUNCj4g
DQo+ID4gKwkJaWd0X2Rlc2NyaWJlKCJUZXN0IHRvIHZhbGlkYXRlIHRoZSBsaW5rLW9mZiBiZXR3
ZWVuIGFjdGl2ZSBmcmFtZXMNCj4gaW4gIg0KPiA+ICsJCQkgICAgICJub24tUFNSIG9wZXJhdGlv
bi4iKTsNCj4gPiArCQlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoImxvYmYiKSB7DQo+ID4gKw0K
PiAJaWd0X3JlcXVpcmUoaW50ZWxfZGlzcGxheV92ZXIoaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRh
LmRybV9mZCkpID49DQo+ID4gKzIwKTsNCj4gPiArDQo+ID4gKwkJCXJ1bl92cnJfdGVzdCgmZGF0
YSwgdGVzdF9sb2JmLCBURVNUX0xJTktfT0ZGKTsNCj4gPiArCQl9DQo+ID4gICAJfQ0KPiA+DQo+
ID4gICAJaWd0X2ZpeHR1cmUgew0K
