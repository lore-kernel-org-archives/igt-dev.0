Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D6CAC5BF
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 05:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54D10E10E;
	Wed, 18 Sep 2024 05:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/eg9/6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AC510E10E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 05:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726637493; x=1758173493;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=e2R+g8uGf6nBTX1jfjalKU4I1Weor/TTHguVASuaVxg=;
 b=g/eg9/6yhzudPXozp913SRe57zSW3E+ptdyIq7h5pCVn6z75PFk26K+Z
 /lzmFnxeObwRH6ZqQ2HamaSQLUi+37HhbHEpHquJKIIIBDK6rsuBopDQb
 AFhLXxCEVzkRuBwYyvTGFNtvR/SO2ksQaI8m2S38RJ71bQjnqXjCpHjaw
 mVQIohWqH2GQrKjeY1oZea6QWqPfJWNDflEvu01DSbKUwI8DfAJenzL9g
 al20Eg0+3UWjlzxu0ay74P+BvMTkxtM0d1Kp0GN4SGWs+spYcKVAceHCJ
 hGxiZ8aqz3UqM27AYzrmtCiUV2WA9988z4udgG8/vkAq5NISW6JQsGvtr w==;
X-CSE-ConnectionGUID: QMceH+AhTrasnaLsq9ch4Q==
X-CSE-MsgGUID: a7tJimBcTWK7rOancjPraw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36197572"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36197572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 22:31:32 -0700
X-CSE-ConnectionGUID: SN3ufcEWRpyrkw99BrifGA==
X-CSE-MsgGUID: 6alksFEeRMqA74696XmHgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69069401"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 22:31:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 22:31:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 22:31:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 22:31:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJJQj5qZy1cUQDKN3mie0U6ARhp1fsLeh2CNtz+Yj6UDm1mG7dbumZ8K2yMmMBsRZzAiGGqsbYnFxOP93BJczQ+ojJTfCdQ7tV4wOVVB8MQ6324d7lAIaarybmttkusBvZVHTKJrmTwcpR2otETFKWIUQ4eXaY1nS4b4gxPYPc7rhQzZSp24i/1qPC+94o243lro0EP1y58P7g02ZWAbvoOsCPohpVNYsv/L6JHy3nmtFymPPKjKdGm+Z+c9r7nLSaY/ccAdZUhyM3LhjarRqVwl/NI9RqpwH/KSlBQbbuDm/A0ITNDt17m2B9WWQx3kbniAa0TaaPZiWKpYZ63GHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2R+g8uGf6nBTX1jfjalKU4I1Weor/TTHguVASuaVxg=;
 b=wTPUjyt18101bxhE5HEohy+dmWWb+JPa5UMiHcWlmryyDca1mHe8TGU35Q+T0+dp5Y/a24MgTPlJmx8ulhUBRJUBDWM2yLH1ON0CgW7QExTzwjJtF4y9fJzg/n6n8G8XyAfMPHojg3fbHn2/RzfEzbOMK+rDXzqiKKfPh+kuPcar2TtJ9CF5kS3S58lr8EqB+IdrL6WZOYIEwdEwh7W2d0xoNX8j02eoonClOX5e3bzVnJyGAgm50BSzBqRt9emPHggjqyYQAIqqalZb3oDuamwqXOX9AWdi0Ijg8JF5hsIpnjBG/q2bdg79/oq/EOncDDbVUoN0gQyN+i9whdrs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Wed, 18 Sep 2024 05:31:07 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 05:31:07 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_backlight: Brightness test
 during DPMS on and off
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_backlight: Brightness test
 during DPMS on and off
Thread-Index: AQHauMZBgS4l13NPGkO6CMeiZZKFkbHmmb8AgHcMnwA=
Date: Wed, 18 Sep 2024 05:31:07 +0000
Message-ID: <c45e896b781241ae1bd1e2b7c67707f316c70f3e.camel@intel.com>
References: <20240607103329.16841-1-mohammed.thasleem@intel.com>
 <20240704113102.2762-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240704113102.2762-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY5PR11MB6415:EE_
x-ms-office365-filtering-correlation-id: e4668ccb-e104-44f0-8c82-08dcd7a318c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1luUngzVFM2byt3SzVBTFFESFphU3o1QXJhRVdqNUN1Qm90MHdaS2JYbnNR?=
 =?utf-8?B?eXczOVhQTG1ETVY2Z1BEb1ZlMVhrRFhSUThRV2w5ZW0yR0ZycEh2YWZiM3ll?=
 =?utf-8?B?aXI3cWgxVmlXKzEyZ1lWa2tZWThCSktpOW0yVkVtbjA3Sk1vSVJ4R2h0Z0FC?=
 =?utf-8?B?a1Mwcld4aHpnR2Y2U1ZaUmVUclQ5bC9HSVBUd1Fsakcrd015V3NRL0FUYWkw?=
 =?utf-8?B?Y2cxZmZ4S3hXMnlhYUFkNHl4NGthZ2pxbnV2V1ZFZ0tldXVoczd6Rlcva2Zx?=
 =?utf-8?B?ckM2OXVoVmlWTkFkVVRjTWVMeEN4R3dWd1pKYVJpK2ZMMEI3aWJsSFljS1ds?=
 =?utf-8?B?eGk4L1RkZWh6UTNTTEJJR3N0SnFQWHhnV0lldHMwRklGUzNSTFpFTUFoNjBX?=
 =?utf-8?B?Wk9GRS90Y0tVZnl3dU9NS2VyWEs3a0Nvb1MxNGYwVDVNODl0L21lVno5U0dk?=
 =?utf-8?B?ODc5N294WVZYb09XYVN0M3FKMGJ4bU5MeG03N3lIVis5STNKZXRxSEozcVEy?=
 =?utf-8?B?SXI2ekVVelFUZG9CdWF5eHV5akN1VERnK3dEZXFycUdDaDlXY1hYT0VmZ0U1?=
 =?utf-8?B?RTlXdmU0Wkt6K3FEaW0rVFhRbndGRmxyem5BUFJUKzMrZnJnUVovQWg5eHVV?=
 =?utf-8?B?OStwWkJQUVJhdlNrQU92NDlnSmZjbGtkVWtaRXROUjdiS3dmQnI4cVB5TTR0?=
 =?utf-8?B?OEgwa0hYbjVsQnFsSWVVY0U2Mjh2bE56bjlDZXk3bm5mZDZkSEMxa0NlSU1E?=
 =?utf-8?B?N0lEbmFELzZvSUF6STNrNzJVTlNJaXg0djlxL2o5b1RQSzZZTVlnYmk2OCtR?=
 =?utf-8?B?RVBxRlhvZU93TDI3WS9TMXFuK0RmdDl5Z0YxdTQ0R25NdXBwMVZVNk4vN3Z0?=
 =?utf-8?B?c1VxNmpqUEh3bzVLdGp4dmcwRFF5YUhscDJ1cTNrN2E3S0J2cmJqMjU5bStO?=
 =?utf-8?B?b21UNkh6bDBhRGNyaTUyaUlkK096SE9DNGhkMWV3bjJMWmF3aVlmVXhnSGt4?=
 =?utf-8?B?NTE3akJOZUx3bE0yQXpJWnNQTExQZm9waVpia2RvUVFLL203UmRiM1p4OEV6?=
 =?utf-8?B?M0NIOXZ0aTh6YzEyMEEvUlRsbDNFbEo3dUo2UW9rRTI5YzlWdDY5dUJnZG5u?=
 =?utf-8?B?dC84c3JvZ3VXQmFIa0tCR3lPM1FLdGhrVXZydHI5T1oxU2xIOXFyY0pMNHlU?=
 =?utf-8?B?OGtHMWtzUDh0QmxNaWhubERnL0RvcHkvOGxucTY1NWovSDkyWVh0V2VFYWhw?=
 =?utf-8?B?Qk0vSVRjQW9SR1hSYndEdGpTdSt0VmxpMlJ0ajlwbGlneXdOV1lHY0h6Z05K?=
 =?utf-8?B?Umo0bk0xK21Oc0tLdk1JcjAxOU1RVzc3V09hTmVGeDF5YUkrTXNuL09BN3pG?=
 =?utf-8?B?RVh2UGQxYzZJclVaQVlmZFRrVTFsT2s3M0p0N3dFSTZQK2NMbklBV3JkVk5E?=
 =?utf-8?B?M01VWVJoOXdnUUxrZEpBOXRoaVEzWGxvQU9mQ2Z0Rk5GVVB5T2Q5LzV5NXJU?=
 =?utf-8?B?TURITFJhbGVIMTdTY2ZXOFFaUVhBNHdrandvTXdaNVdoVjcyT1Buc2NaLzZn?=
 =?utf-8?B?Y0tUOGVzUEg1YStabldGZlJoOTkzWGtDeFpyR1VNbFZyVHJlMFIrRFI1Lysy?=
 =?utf-8?B?eEh6bDdLR2RJYnZCcXVuMjh5eFl3cktwaUt0UnZIUENha0hkRk5WWC9PMUd5?=
 =?utf-8?B?enZQRDRrR3RFOXV4Ym5aYmc2NjlJODh3V1pCb2o0VVRlLzIreVhMeGprT2dK?=
 =?utf-8?B?Yy9MUFI0QWJhVHFDRjJyRWNpRjR2VExIbnI4dXhDbm1iclpYcW5Fa3ZReFJz?=
 =?utf-8?B?T3MwSzZnVlNEZFdSL3g5QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTJlbTV3elVrekljT2Rid0tDa0R6UkRudHVYc3NhT0VnRkJlc21QR2cvOG43?=
 =?utf-8?B?eFFaOWVVTjU3a1luNFg1YkUzdHVBay9YNXJKSkd6OGhnL09ETTZ2eDdPZDNx?=
 =?utf-8?B?OUhjUlk0MFBjNDNwY1hYUGdOK0J0dFpYbUdMWFhXdkNSREJrUFRxdFhOempG?=
 =?utf-8?B?OTF3bGF2bVBSdnJTNEljWnJUYkRVNU1wRlJpbmd1N1lBVTJRUTlxZUkzLzk2?=
 =?utf-8?B?UEdLUWhER3lUWUUzaTF5M2hWdTN4YU1pY3ZpNU9pOVI0ZlRFUHJCaDZmb1NZ?=
 =?utf-8?B?NURnT1haU29GVnVNNW1GNHhGZmdnVW5Jc1JMQlp4c0VjdnI4RGF0REoyd0lX?=
 =?utf-8?B?SGxLcmc3KytJaTVzUkRzRCtZaTkxNm9yRjQ0b1QvaCsyamJIL3ZrSGR0RWZv?=
 =?utf-8?B?N1NwSlo1QkpuUisxbzduUEdmb2tBMzN1UHRmcXVManl5UWxBQ1FvLzlSaGdZ?=
 =?utf-8?B?dHpCT0xSNHZzcUQ1cVpOVHhFdFY2bTN4WndGdmRDOENuK3dSTkhZamh6SXRJ?=
 =?utf-8?B?c0ZoVzc1UEM1eFg4cWlPWGRnbVZuajF0TjdvY0VRQmkrdU5ObnJ5aUtubWZt?=
 =?utf-8?B?TTRiT2ZyRTdBUitvUTBveGRQZlhDUi9Dem5LeEZ4MVl5NXEydldQYkNyL0Ir?=
 =?utf-8?B?eExnb3hYMThPSnpjdDkwbm96Q0FjaXdicXRXQVdJNStYNDNCZ0o0UVZBM3Rq?=
 =?utf-8?B?UWxYaFJiYmFuaVhaRlpNVXh0Z1orZkFuaXVDa3JmMkpZUGxNRzk0RmNld0RE?=
 =?utf-8?B?Y25zc3ZVQy9JdnhhV1BxMTZGZlVKcC9XOXovVVNBVkttUU9LdlJ3bEdQYnBx?=
 =?utf-8?B?VCs5Sm1uV0h1c2xianVjYlhwdnlUTWVOR3FCVVQyT2dpaHlWNExIMmFNR1Jy?=
 =?utf-8?B?M0hWcHBUdVA4NGZDMUlqM3NzclZCeUVEajlaME5yeEQwZXplaW8ycTB0Zlp4?=
 =?utf-8?B?Y0tyc2wvWjZGbm1QSnRpY2trQU1RdEpRakxNaWI1alNZc2R1Uk5sdGRJQzZN?=
 =?utf-8?B?L0dwWG1JWTNlWlVES1gvbC9IUDRXL0haWkV2c01raXdPeXVnV1Vldnh4bk9w?=
 =?utf-8?B?VjZxN0JTNStPSGVnZUVGWTdGSUIyemp3TDZpZldRZDNVTHZJTWxYKzdheURv?=
 =?utf-8?B?emRJL1I1YmZHcjhUZ0plRjdEYlVvTFhmZWRsZnhWWWUxekFZRjk0ekJ0ZTZC?=
 =?utf-8?B?Uyt0SUZFVzdiRlc5Y2dsUTNTUEpqQUkrZGZNcXQrQ2NzejFadDhqTUtNZ0pk?=
 =?utf-8?B?MmUrdCtzdGl1bFFKdHNhUVphM3BPLzF4b1lIMm02Tk1qaFFVS2t1QzVvMy9T?=
 =?utf-8?B?YXJPZ2gwV2pCMDB1VzhLa3dWOER2MDNPUS96eTVWdHpwVFBFUm5nOHdPQ0dX?=
 =?utf-8?B?Wm5ETm05c1BvRXB2OCtSTVZwWVo3cFFEanU1bnp5UzMvT1loclZPcEdlSDJq?=
 =?utf-8?B?M3NxbHc3cm0xN01ENndTYWZPT0FwY2g1dFNBbDNVbFVVdEZPQllBNUgvNjVG?=
 =?utf-8?B?OE1CZ0tyNGtsMzE0bTZERklwNDNjR0JHekNRTlBVTXgyd2VWWVd0OXhWZmw0?=
 =?utf-8?B?K0FGTW5FK0VITHl1b0xCRExnSk5aL0c2VDZYbDY3akhVUVFHRDU2SGcyUDlQ?=
 =?utf-8?B?SnYxZi9TeFdtdGtCWVJMakpkS2lpVzYxOEkvUk9wdDBPSUFtSE1xWmFsd3dS?=
 =?utf-8?B?WjVDdmcwZWEvQTMzdGhqWGd4NjVqZVZDMytwZnVKKzg0d3J3OVd2UjdZSVRr?=
 =?utf-8?B?RmV6OEVWTURwaHhnTGFXRTVyZDdZeU54bnFzQ29URHBNYmppTXo2MGpFcm02?=
 =?utf-8?B?a1lrajNpRTJrRWlNRTNrOTdXbjZHOGx2d1VIM1R1TkdSemZoMUtsYXBxZnlP?=
 =?utf-8?B?TEgxeFJ4NWNPWU9VVXU1L2hvMndCdVVwbkUxQ1lHTTVHL2d0V3BZcHdIa0Jv?=
 =?utf-8?B?YkdkOWw5bVA2ZUhMSEIyZFFGVlV0UkR3MEhtTGRlMzM0QWs4UFZzMEg1NWpW?=
 =?utf-8?B?TWVNVU9wQ2NFWWFzKy9zY2VHZFpzOFZyZ0lBeEhGNkUzVlpKdWZJTm1Gc2Ja?=
 =?utf-8?B?VGFMZCtCMlJBREdDL3VUWDZ5NC9TQkRML3FNNXZONmc3dzVqLzY5b2dQNDVL?=
 =?utf-8?B?dFBCSk1ZUkNBWVJiQ00zbDJqNjNDUzM3SkMyeGV4OHZoU1NSK0p5eVdBaW8z?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDD624C50A401C4C9F8D4B955F6AC391@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4668ccb-e104-44f0-8c82-08dcd7a318c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 05:31:07.4542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYGDZ9U6rChQ+HCQUcNerwoyu8wRey+KgP4Lv7JeeLOzbmYnKkTAogwkAD5HYBI6g79lNpZXacpDV9Bg3jswSoXmCXCPoMaQ8wmd378kx4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

T24gVGh1LCAyMDI0LTA3LTA0IGF0IDE3OjAxICswNTMwLCBNb2hhbW1lZCBUaGFzbGVlbSB3cm90
ZToKPiBTZXQgYnJpZ2h0bmVzcyBieSBkZXZpZGluZyBtYXggYnJpZ2h0bmVzcywgc3RvcmUgYW5k
IHJlYWQgaXQgYmFjay4KPiBUaGUgYWN0dWFsIGJyaWdodG5lc3Mgc2hvdWxkIGJlIHNhbWUgZHVy
aW5nIERQTVMgb24gYW5kIG9mZiBjeWNsZS4KPiAKPiB2MjogVXBkYXRlIHRlc3QgcGF0aCBhbmQg
dGVzdHBsYW4gZG9jdW1lbnRhdGlvbi4KPiB2MzogQ2hlY2sgYmFja2xpZ2h0IGZvciBhbGwgaW50
ZXJuYWwgcGFuZWxzLiAoSmFuaSkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNb2hhbW1lZCBUaGFzbGVl
bSA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwva21z
X3BtX2JhY2tsaWdodC5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAt
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19wbV9iYWNrbGlnaHQuYwo+IGIvdGVzdHMv
aW50ZWwva21zX3BtX2JhY2tsaWdodC5jCj4gaW5kZXggODY3MmFmYTdhLi5iYjg1YzZlMjkgMTAw
NjQ0Cj4gLS0tIGEvdGVzdHMvaW50ZWwva21zX3BtX2JhY2tsaWdodC5jCj4gKysrIGIvdGVzdHMv
aW50ZWwva21zX3BtX2JhY2tsaWdodC5jCj4gQEAgLTY0LDYgKzY0LDEwIEBACj4gwqAgKiBTVUJU
RVNUOiBmYWRlLXdpdGgtc3VzcGVuZAo+IMKgICogRGVzY3JpcHRpb246IFRlc3QgdGhlIGZhZGUg
d2l0aCBzdXNwZW5kLgo+IMKgICogRnVuY3Rpb25hbGl0eTogYmFja2xpZ2h0LCBzdXNwZW5kCj4g
KyAqCj4gKyAqIFNVQlRFU1Q6IGJyaWdodG5lc3Mtd2l0aC1kcG1zCj4gKyAqIERlc2NyaXB0aW9u
OiB0ZXN0IGJyaWdodG5lc3Mgd2l0aCBkcG1zIG9uIGFuZCBvZmYgY3ljbGUuCj4gKyAqIEZ1bmN0
aW9uYWxpdHk6IGJhY2tsaWdodCwgYmFja2xpZ2h0Cj4gwqAgKi8KPiDCoAo+IMKgc3RydWN0IGNv
bnRleHQgewo+IEBAIC0yMTcsNiArMjIxLDMyIEBAIGNoZWNrX3N1c3BlbmQoaWd0X291dHB1dF90
ICpvdXRwdXQpCj4gwqDCoMKgwqDCoMKgwqDCoGlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVzdW1l
KFNVU1BFTkRfU1RBVEVfTUVNLAo+IFNVU1BFTkRfVEVTVF9OT05FKTsKPiDCoH0KPiDCoAo+ICtz
dGF0aWMgdm9pZCBjaGVja19kcG1zX2N5Y2xlKGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGlndF9v
dXRwdXRfdAo+ICpvdXRwdXQsIHN0cnVjdCBjb250ZXh0ICpjb250ZXh0KQo+ICt7Cj4gK8KgwqDC
oMKgwqDCoMKgaW50IG1heCwgdmFsXzEsIHZhbF8yOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBiYWNr
bGlnaHRfcmVhZCgmbWF4LCAibWF4X2JyaWdodG5lc3MiLCBjb250ZXh0KTsKPiArwqDCoMKgwqDC
oMKgwqBpZ3RfYXNzZXJ0KG1heCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGJhY2tsaWdodF93cml0
ZShtYXggLyAyLCAiYnJpZ2h0bmVzcyIsIGNvbnRleHQpOwo+ICvCoMKgwqDCoMKgwqDCoGJhY2ts
aWdodF9yZWFkKCZ2YWxfMSwgImFjdHVhbF9icmlnaHRuZXNzIiwgY29udGV4dCk7Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoGlndF9yZXF1aXJlKGlndF9zZXR1cF9ydW50aW1lX3BtKG91dHB1dC0+ZGlz
cGxheS0+ZHJtX2ZkKSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGttc3Rlc3Rfc2V0X2Nvbm5lY3Rv
cl9kcG1zKG91dHB1dC0+ZGlzcGxheS0+ZHJtX2ZkLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3V0cHV0LT5jb25m
aWcuY29ubmVjdG9yLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX01PREVfRFBNU19PRkYpOwo+ICvCoMKgwqDC
oMKgwqDCoGlndF9yZXF1aXJlKGlndF93YWl0X2Zvcl9wbV9zdGF0dXMoSUdUX1JVTlRJTUVfUE1f
U1RBVFVTX1NVU1AKPiBFTkRFRCkpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBrbXN0ZXN0X3NldF9j
b25uZWN0b3JfZHBtcyhvdXRwdXQtPmRpc3BsYXktPmRybV9mZCwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG91dHB1
dC0+Y29uZmlnLmNvbm5lY3RvciwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERSTV9NT0RFX0RQTVNfT04pOwo+ICvC
oMKgwqDCoMKgwqDCoGlndF9hc3NlcnQoaWd0X3dhaXRfZm9yX3BtX3N0YXR1cyhJR1RfUlVOVElN
RV9QTV9TVEFUVVNfQUNUSVYKPiBFKSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGJhY2tsaWdodF9y
ZWFkKCZ2YWxfMiwgImFjdHVhbF9icmlnaHRuZXNzIiwgY29udGV4dCk7Cj4gK8KgwqDCoMKgwqDC
oMKgaWd0X2Fzc2VydF9lcSh2YWxfMSwgdmFsXzIpOwo+ICt9Cj4gKwo+IMKgc3RhdGljIHZvaWQg
dGVzdF9jbGVhbnVwKGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGlndF9vdXRwdXRfdAo+ICpvdXRw
dXQpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGlndF9vdXRwdXRfc2V0X3BpcGUob3V0cHV0LCBQ
SVBFX05PTkUpOwo+IEBAIC0yNjIsNyArMjkyLDcgQEAgaWd0X21haW4KPiDCoMKgwqDCoMKgwqDC
oMKgaWd0X2Rpc3BsYXlfdCBkaXNwbGF5Owo+IMKgwqDCoMKgwqDCoMKgwqBpZ3Rfb3V0cHV0X3Qg
Km91dHB1dDsKPiDCoMKgwqDCoMKgwqDCoMKgY2hhciBmaWxlX3BhdGhfbltQQVRIX01BWF0gPSAi
IjsKPiAtwqDCoMKgwqDCoMKgwqBib29sIGR1YWxfZWRwID0gZmFsc2U7Cj4gK8KgwqDCoMKgwqDC
oMKgYm9vbCBudW1fcGFuZWwgPSBmYWxzZTsKCkkgdGhpbmsgdGhpcyBpcyB1bnJlbGF0ZWQgY2hh
bmdlIGFuZCBkb2Vzbid0IGltcHJvdmUgcmVhZGFiaWxpdHk6Cm51bV9wYW5lbCBpcyBzb21laG93
IHN0YXRpbmcgaXQncyBudW1iZXIgb2YgcGFuZWxzLCBidXQgaXQgaXMgYWN0dWFsbHkKYSBib29s
ZWFuLgoKQlIsCgpKb3VuaSBIw7ZnYW5kZXIKCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBjb250
ZXh0IGNvbnRleHRzW05VTV9FRFBfT1VUUFVUU107Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb25zdCBjaGFyICpuYW1lOwo+IEBA
IC0yOTAsNyArMzIwLDcgQEAgaWd0X21haW4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlndF9kaXNwbGF5X3JlcXVpcmUoJmRpc3BsYXksCj4gZHJtX29wZW5fZHJpdmVyKERSSVZF
Ul9JTlRFTCB8IERSSVZFUl9YRSkpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmb3JfZWFjaF9jb25uZWN0ZWRfb3V0cHV0KCZkaXNwbGF5LCBvdXRwdXQpIHsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChvdXRwdXQtPmNv
bmZpZy5jb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlCj4gIT0gRFJNX01PREVfQ09OTkVDVE9SX2VE
UCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICgh
b3V0cHV0X2lzX2ludGVybmFsX3BhbmVsKG91dHB1dCkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnRpbnVlOwo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGZv
dW5kKQo+IEBAIC0zMjcsNyArMzU3LDcgQEAgaWd0X21haW4KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGV4dHNbaSsr
XS5vdXRwdXQgPSBvdXRwdXQ7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGZvdW5kKQo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBkdWFsX2VkcCA9IHRydWU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG51bV9w
YW5lbCA9IHRydWU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvdW5k
ID0gdHJ1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Cj4gQEAgLTMzOCw3ICszNjgsNyBAQCBpZ3RfbWFpbgo+IMKgwqDCoMKgwqDCoMKgwqBmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRSh0ZXN0cyk7IGkrKykgewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWd0X2Rlc2NyaWJlKHRlc3RzW2ldLmRlc2MpOwo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKHRlc3RzW2ldLm5h
bWUpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZv
ciAoaW50IGogPSAwOyBqIDwgKGR1YWxfZWRwID8gMiA6IDEpOyBqKyspCj4gewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChpbnQgaiA9IDA7IGog
PCAobnVtX3BhbmVsID8gMiA6IDEpOyBqKyspCj4gewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0ZXN0X3NldHVwKGRpc3Bs
YXksICZjb250ZXh0cy0KPiA+b3V0cHV0W2pdKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAodGVzdHNbaV0u
ZmxhZ3MgPT0gVEVTVF9EUE1TKQo+IEBAIC0zNTUsOSArMzg1LDIwIEBAIGlndF9tYWluCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+
ICvCoMKgwqDCoMKgwqDCoGlndF9kZXNjcmliZSgidGVzdCBicmlnaHRuZXNzIHdpdGggZHBtcyBv
biBhbmQgb2ZmIGN5Y2xlIik7Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3Rfd2l0aF9keW5h
bWljKCJicmlnaHRuZXNzLXdpdGgtZHBtcyIpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZm9yIChpbnQgaiA9IDA7IGogPCAobnVtX3BhbmVsID8gMiA6IDEpOyBqKyspIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRlc3Rfc2V0dXAo
ZGlzcGxheSwgJmNvbnRleHRzLT5vdXRwdXRbal0pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2R5bmFtaWNfZigiJXMiLAo+IGlndF9vdXRwdXRf
bmFtZShjb250ZXh0c1tqXS5vdXRwdXQpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2hlY2tfZHBtc19jeWNsZSgmZGlz
cGxheSwgJmNvbnRleHRzLQo+ID5vdXRwdXRbal0sICZjb250ZXh0c1tqXSk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGVz
dF9jbGVhbnVwKCZkaXNwbGF5LCAmY29udGV4dHMtCj4gPm91dHB1dFtqXSk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKg
wqBpZ3RfZml4dHVyZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBSZXN0
b3JlIG9sZCBicmlnaHRuZXNzICovCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZv
ciAoaSA9IDA7IGkgPCAoZHVhbF9lZHAgPyAyIDogMSk7IGkrKykKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IChudW1fcGFuZWwgPyAyIDogMSk7IGkrKykK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBiYWNrbGln
aHRfd3JpdGUoY29udGV4dHNbaV0ub2xkLAo+ICJicmlnaHRuZXNzIiwgJmNvbnRleHRzW2ldKTsK
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Rpc3BsYXlfZmluaSgm
ZGlzcGxheSk7Cgo=
