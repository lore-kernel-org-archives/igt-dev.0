Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0909CA0FE9
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 09:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655F810E613;
	Tue, 26 Aug 2025 09:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQYijsmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A8110E281
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756199763; x=1787735763;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=XPVZENvu1ssG/Q2QhfhWo+lhIJtXFcFfQ/kOWQpTReM=;
 b=dQYijsmZ+SNWpx1aCNuCDiJ+3tzvYl6q3Ckm+d4fpm3sXBqKIcKZUKoY
 pom3Kc2Ig9MjIj4jQGH9mBZUdRqGKPUZwzbRrY2/Fmr7Tk+Pyn/KaONBU
 ofY726zS06BrmaIb59cHvvmf7eNpMK8Y7/bNdbdyysb/eNQPGGywc9HvK
 JXn+e8N417ZBRkoY8+ccbkRTtiuoi3UF+MgcrLjQ1Km49Ak9OrnDTakyg
 HVfILfex4MyP+Q1BNa8HVohvYztzLV8qB3NYDClA7SM4Miy5LGR3BWV1W
 PfZJYCYcdpitZ9DFsgMslw8YlClZ8hFKlD51N0F9Fkq4YeMUF1nGrzHdR g==;
X-CSE-ConnectionGUID: X2bYrGsnT+G4H2tENbfBBg==
X-CSE-MsgGUID: tDHmAG1nSiGcmbQ59ql9Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58286210"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58286210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:16:03 -0700
X-CSE-ConnectionGUID: EMvroeA3RyyZMRZsZKr6Ig==
X-CSE-MsgGUID: zGpp5ewJQu+10xYCe5k04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169909174"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:16:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 02:16:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 02:16:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.58)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 02:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qw9fBRl+RLr7UB6oYkHdFR4TPmIozQAierPet8GfoYw2UGB0hpw8Gdlpc+Sg2QR9d9fuF1dtYOi3EkYXE8y+Nm8gKYIGmuHSMTZRGNkbBao68oRIDvuWPbxmZUfULdN5Ls/j8b2wdkB0dpcn8WylNMiKe/AXysusBoiq77WZc9/po5I67H+4mXQ6A8M0kxFJ8aZNH/NA68fbqTsLiZlR2rPsB+dEmQy7ri1wSggcRNoU8/y5RS2xX3ptPxCZIeqhyR5WvsVJ8dHQJScqkpFsagzKxxN4fkF+V2nBv0ILYLg+z6H902pc8zRsMNJ1IRsvZ8+cmewVfpEOeij+yL4XlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPVZENvu1ssG/Q2QhfhWo+lhIJtXFcFfQ/kOWQpTReM=;
 b=LotE2q1Fr8nclVRt8gz0gnHtkDNHpeC/P/8xObFv8qoVcHG0yYCR+JG2/DPdxoBWDlQDI7xyvL7+2TAyHH2g49r/1FNppm+J7FdvveI/9u1lnXEUCdtbgTIfbFvTpd2O9GupeKAqvDelsGmzIpELClRopSiCYgkeJRERRVQrE9sbvVZG+NLEJ9Mm1Qo5cIwfHKc0LbbIwlkrNdikfqLVSjBrYyZRg3+St63O8milY5cxLSwcasOABKs8c/9Y81VazD9VK4uyVZt6P5XqKj1EZ5s0M1YjJ0dkfFnTDhB1QxkI4Gh8lM5OYdbwkNgI+qzr0vlXHleaPclGgFMdFo/KGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB6492.namprd11.prod.outlook.com (2603:10b6:208:3a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 09:15:57 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:15:57 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Grzelak, 
 Michal" <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_frontbuffer_tracking: pass
 non-NULL output pointer
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_frontbuffer_tracking: pass
 non-NULL output pointer
Thread-Index: AQHb9XzkUSf1AU5VfESFRkwbrLCoErR06RQA
Date: Tue, 26 Aug 2025 09:15:57 +0000
Message-ID: <49470c32ccc3d613a81fdc7a1292c7f96e823088.camel@intel.com>
References: <20250715113822.831686-1-michal.grzelak@intel.com>
 <20250715113822.831686-3-michal.grzelak@intel.com>
In-Reply-To: <20250715113822.831686-3-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB6492:EE_
x-ms-office365-filtering-correlation-id: 301b2ed9-3e86-402e-60c0-08dde4812af2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OFRhaUJXVlIxRjVaSzhjMzdyLzN4TDR3ZXFUSndkYXE1Q3RjOHlqU2tJUzl3?=
 =?utf-8?B?UXdvTktxRjdteE8vMnppSjVVd1Nlc0tESDN2U1h0a3NmUnNUNDJxVndmdktH?=
 =?utf-8?B?N1RtQUo4R2NKMGJQQkhxSElCYTdWV284Nk9aNUEvRkxTcHdLd3FVZkloZVJp?=
 =?utf-8?B?M2NlMWpaZ2krLzhsazIxdTlxK052eFhCTDE5TS9QcC91NVVqNWI3MERmVEY5?=
 =?utf-8?B?N0dlL2EzUHF1ZW1kNjZET3p6VTZCNU94aUJIRzVQUmtHME9BK09USU1jY080?=
 =?utf-8?B?eTJvWFNodXF1OXFaeW9qUnhoYWpZSVdqTEFSbXF2WTRUcDcyTUNXZTJvRnNY?=
 =?utf-8?B?b0JXTjNIWjk1eEU5VW5ZWGFlTFp6Q21saXNzVDlCeFlHd3F4bERvaFEwNHZw?=
 =?utf-8?B?elcvZ1dWbXNMck5JL0UrR1FwRjRnejVMSGg5ZVRRcWY1NjhDY0g2RTFYVmtL?=
 =?utf-8?B?Y2FLRjRFcHRaU0QzNFZ6dnYwVUs0M2JQVWgwQmoyQjlJRGc1RnUxeUVFdEVp?=
 =?utf-8?B?UW01UmtYLytnYjV4QnVUdGd5WTBRQ0JPOXMwbDJUdXU4akozYjZQWTFDMkZM?=
 =?utf-8?B?bVJWM1ZReWNQNUhVQVdOc20vNWMrTnNKVFBvb0tnVkI2OWF0MzJNcDVkWUdr?=
 =?utf-8?B?V3dPVlg4OGJBdnlnUXI1UkZoWGh6ZUFGTy9PZGhnaFlRRStJd1kvaCtpSkQ0?=
 =?utf-8?B?MzM2YktGOTBzaDhVSkJzbXFmTno4RmNZWGNxSFhIdlNwbmhDdWtEbjl4VGVP?=
 =?utf-8?B?WjlVdjltVTRTN2lDQzFZNzgzZkFwMVg2MTZsSEZyMlV5UkZOQ1hPZjZRYWcv?=
 =?utf-8?B?YVZGMG9NS1RPME9XY0EyMU9QbUhTY1JWYVpSTE1HSDI4OE5hbk9RdllsY0Vz?=
 =?utf-8?B?UG9HckFseWRJQ0pKV1A3ZEs2eFBRQkM4cWVPdVFQSnVSQllscXZQOUtIdm4v?=
 =?utf-8?B?Rk5SaCtlLzdlY0ZpaWhCQldtVW1Td29MdWMrTU9OOFI1MEdLUTZqM0t0RURr?=
 =?utf-8?B?Z0gwRDJmSzNvK3gvUmpXbUhtTVV1eFY1U205UmNTQTRVVVdvWDJ6WVd3em50?=
 =?utf-8?B?cktZaDRDMGdUbDFQdC9YbEErVlhDd2J2TU1XNmU0WEVjdGZyRmk3ZlRsd1dY?=
 =?utf-8?B?eEREeVE2dzBoNk9WcHJOck9Mb1lQTTcxZndsLzMzMDA5SW5YWE5ZTldJejFR?=
 =?utf-8?B?bytVQjdXUHBCQXlCTHlRcHRHTGYvUmlZL20wMXJwQzJ1RC8vejNRSGNHVXN1?=
 =?utf-8?B?S3hPV0o0a01wd1N5Q0xPOGVUVVg5MXRXaGxMb2VCQkZiWWxxenNVVk55VmxI?=
 =?utf-8?B?R2xxa0orWlJxL3JRREdQcjRzVjhOV2RFbzJxYklNUk4rQllJMWJBUzF5eFdJ?=
 =?utf-8?B?b3RLMnhHWmxoekl6c3BneDlYcTA1OC9rYnR6YTlLRG1jVVVvaHlxdUFyZHEy?=
 =?utf-8?B?T2JOWUFCOW02ZDFtOHcxSUd6SlhzeCtOdzdnemZRTHBUMWphMEptb1dXY3Fh?=
 =?utf-8?B?eStocjgxTHFyQy9MV0syY3RuYU9CeS8vOFNSc0gzdUkxVWh3TGJKdC9RUVZZ?=
 =?utf-8?B?azdDOG9jaDE0SUhIRmVpbHZPUkVlSU9lZUE0TnpORnA2Umc0cDhzN2YxMjVi?=
 =?utf-8?B?V1RtT0NnSzViTTVtWWxDVnVWeWczRllZWUxCZkNmMGdOaHVBdkNXYkgrZjY5?=
 =?utf-8?B?a2lzR2JsS1Z1Mkx2OGY5aUd2NW1Ua0txR0Q1a1F2NzdiWWxRYVo5eUpod3dy?=
 =?utf-8?B?RUZpNHIzMkg3U2xCTkx6amQvcmhER1dUY0hkdjgwOHQ2NmdWZHF1dTYzRGcr?=
 =?utf-8?B?U05iOEIrcTRDamtPUGxZeTEzN0NMWUZWWnN2NXRVZXVjSWdMK0VXbUhPNWlE?=
 =?utf-8?B?TjhVZlIrY053b3lnVWw4aXpXcVE2UC8zbDdqNzBoS0tKSlM5MUV6SHlzSUhh?=
 =?utf-8?B?dW5yRWh6ZGRlRkRhR0NPOEtQU1pKOEp4b1A4aUxlTStMOG9LYTU1QmlwREto?=
 =?utf-8?Q?2rk9Q0XNF6vaiV0ISW5XUSkvJ/zg0Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZU41bG01dHdISnpTTURsaWdqS0V6bkJiYzFrT1lTNTRzcFBGbHNPRUdhaEhD?=
 =?utf-8?B?a0xwUGg1VFVoK1dSV3dzTTlFNVR6NTEzMjQrdnhhOVFSOWlIc1pzdUxJNG9R?=
 =?utf-8?B?Wm1HbnF5U2NZamJpcUJobmYzbVo5NXMvWUJmVUFKTGxUV1VpNmszdms3aHBU?=
 =?utf-8?B?anJMM1hwT3hENmczYmRicXBiSkdEdFA5cnM3YlI4MnE1WmFpNktOSEtpL1ls?=
 =?utf-8?B?cFIyMmkyejgvUGx1NmhoYkhvNDI3RU5OOTJZZVorb0MyS3p1aHNaZjJHWXRP?=
 =?utf-8?B?QkhSa3FYdlU2Q25zemhjM0UxeHhLd0MyYU9rRW5YVXNkSTk0Sm5GdDRZR3Fm?=
 =?utf-8?B?V2dwTlhjdkphR2p3RnBWc1FwMWVlRUZodFc4RFBBTFVsczF6R1VDaWJNNEhX?=
 =?utf-8?B?a0pRUWprU1duck1ZTy9KVC9DaldzWWZXdTdObnNaa3J0ZmllWi9OVFdMOThD?=
 =?utf-8?B?aVJKbW11S1JHMEJ6U2hJYzFCeElzcWJpUzdSWE9ETUdtZGdqc2ZDN1NZQWpO?=
 =?utf-8?B?NWtWRSt2a1BkQ1A5d1IxbnFnVmFRMHkycG1Ecyt6eFB4c2kvQlY5OG1LVGVo?=
 =?utf-8?B?bWY2MWVaTkNJZkRqUjdWOUNQbWRoRE9DQmhGcHlPaEpYckwwSFJvNzd5RVRT?=
 =?utf-8?B?RHJVc1ZJN2J6bFpFVldObFN0a05BNmZUbGJZcVJwL21kR3NJZUYxRFdhcUsr?=
 =?utf-8?B?ME40OWhoWXp3R3M1bjZiVmpjS0FnOHpJb3FqQkFUOStKNENzQy9qTmU1eGJR?=
 =?utf-8?B?RHpadlljM0l5aHZKcmhIeDlrSU5tUDAzRGJWZ3MvZ3N3TWlJVVJoT2tEZVhj?=
 =?utf-8?B?OERFNk5iUXNtdWxyVFl4VVdXbVFNTlZ3Q3pDdCtiL3lIWmcwaTY3ZGJ2TUNH?=
 =?utf-8?B?eDBWajh6Y3pUM0xKRmhIT2pvbmh2akpMRVc3Si9XVk9laWh4U1hmZ1c4cHpl?=
 =?utf-8?B?eWpoeU91VVlHTm0zRzRNMmlwajN4RTNTRWFObURGREN1SHREcUtsZS9selht?=
 =?utf-8?B?YzBWYVRieUNleUw1blVkcXlLS1NzbW1WSVZMcmFWVk5aZC83Rkw2QUk5R3dt?=
 =?utf-8?B?ejg5aHhOOEgvTUJJNHQwYmtKNkV5eHZ5bXI4eXE2NFBoSXI5VUFickRhNVl5?=
 =?utf-8?B?VEErNU5qMjIyWml0REJ4VGIydHNQdGl1NHN4SHZGSTkzcmgrenJYZktkZTZk?=
 =?utf-8?B?R3JQQk9BczZhS1RkTld4SXpicXRHaGh1T3NoS0tYeVFqbHVXbG10WVkzbzFE?=
 =?utf-8?B?SUJRZU5aM2w5WEZ2VFZXQ0lESHU2ZWMydC84ZEo5dTJkTzBUUmJUOTR1c0xM?=
 =?utf-8?B?ZkFmZEpDV29qb2xXYXBxc0o4NGowVzR3dUd4cm9QWFRLZ3NRSGJSaGR0dVRR?=
 =?utf-8?B?bWE0cENEQll0UTg4RE10UWtNQzVDVFhHMTRnSjhielpjSk9PMmxaYVR2Um1Q?=
 =?utf-8?B?Z1pITUJGdEJjNkdqazZTODUvNGVVT2xGY0NVd3ZnZTdzZEhYeGk2R0JqR0ZT?=
 =?utf-8?B?K01OTURwWG1MeEVTMVowdHBlVmRNSHZZdDZIOXlnbjBTMVdRelhoU3p3SVdu?=
 =?utf-8?B?ZmJLa2Zpakp5eXNPMkp5Zm8rYTBLeVJ0OTJMVjU0RXJXOUo0S0trdmhmQWpz?=
 =?utf-8?B?dzVua3NQdmVvWXFrZUpvTStSU1BEc1FFakNpd3hNZ2xCMzJOSjdmaW9SZzF2?=
 =?utf-8?B?bXkydjJQR0ZRYVd4b2FpdGVzVWFpZVZaREZHMWFRUytoaFg3MWpvaE83aysw?=
 =?utf-8?B?aDJvekI1dXk1c1dnYitoczZNck5HVXd2QTZCd2ttci9JbTkvVXNoLzV0YzN1?=
 =?utf-8?B?dHNva3M1NzdybUJvWmdCVnU0OUQvRmdSL2hVUzRKcjVLTEpLeGRncDNqemU1?=
 =?utf-8?B?SzNvOVZ2V0lob0UyWFcrSHlNb2lCWmFiUmJYUDRTVHFLRzY0R1hTa2g1QUhk?=
 =?utf-8?B?OXhuVEhvQ0NTZWsyWjJaVmQrNUVZcHVublhxcno5TitxYXNhVlc0RjBHcC96?=
 =?utf-8?B?M2VoYWN5QWR0VVNmdWdDTnJEYVBJbWppMHpFZWFRK1BUN0RhbWtXZDFaRnZt?=
 =?utf-8?B?RnI1cS9DUEQ1RDZsM1UzVjJ6RVdSQzZEOG9uUEdDa2JjYTlFcEJoV2tuN1Yr?=
 =?utf-8?B?UlBkRXdURUdZKytMYW8wdUNnWFp3SHlzdjY4UzlwU3QzMmE2Q0tYNVhwSlJ4?=
 =?utf-8?B?ZUN6WTE3M3cxTDRuYi9QL1Bxa0FjWmJ0dHl5NEt0aCtvaDJjcnFHRzR4ZjV0?=
 =?utf-8?B?eFRlMWcrVU9pQzNzWTAyRHpOVSt3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61663D42280E3A4B9BD0BA23F53B7ED7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301b2ed9-3e86-402e-60c0-08dde4812af2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 09:15:57.8833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sr3PS9jwI7aYaEtR+bK8Q7CmgyZSOWFG1H6Ntf8BPNBkcgyDBR9PI/K4s+ZiYPnF6YT1hRS0HX8xapdtHzABwnij9XhUGyR2SXj49i2KT1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6492
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDEzOjM4ICswMjAwLCBNaWNoYcWCIEdyemVsYWsgd3JvdGU6
DQo+IEN1cnJlbnRseSwgdGhlcmUgaXMgTlVMTCBwb2ludGVyIHBhc3NlZCB0byB0aGUgdGVzdCBh
cyBvdXRwdXQuIFBhc3MNCj4gbm9uLU5VTEwgb3V0cHV0IHBvaW50ZXIgdG8gdGhlIHRlc3QuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIEdyemVsYWsgPG1pY2hhbC5ncnplbGFrQGludGVs
LmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMg
fCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5n
LmMNCj4gYi90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiBpbmRleCA2
NmRjZGMyODEuLmM1NWIyOTZlYyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2Zyb250
YnVmZmVyX3RyYWNraW5nLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3Ry
YWNraW5nLmMNCj4gQEAgLTIzMjksNyArMjMyOSw3IEBAIHN0YXRpYyB2b2lkIGRvX3N0YXR1c19h
c3NlcnRpb25zKGludCBmbGFncykNCj4gwqAJfQ0KPiDCoA0KPiDCoAlpZiAoZmxhZ3MgJiBBU1NF
UlRfUFNSX0VOQUJMRUQpIHsNCj4gLQkJaWd0X2Fzc2VydF9mKHBzcl93YWl0X2VudHJ5KGRybS5k
ZWJ1Z2ZzLCBQU1JfTU9ERV8xLA0KPiBOVUxMKSwNCj4gKwkJaWd0X2Fzc2VydF9mKHBzcl93YWl0
X2VudHJ5KGRybS5kZWJ1Z2ZzLCBQU1JfTU9ERV8xLA0KPiBwcmltX21vZGVfcGFyYW1zLm91dHB1
dCksDQo+IMKgCQkJwqDCoMKgwqAgIlBTUiBzdGlsbCBkaXNhYmxlZFxuIik7DQoNCkRvIHlvdSBo
YXZlIHNwZWNpZmljIHJlYXNvbiB0byBwYXNzIHRoZSBvdXRwdXQ/IE9yaWdpbmFsbHkgb3V0cHV0
IHdhcw0KYWRkZWQgYXMgYSBwYXJhbWV0ZXIgdG8gaGFuZGxlIERQIChQYW5lbCBSZXBsYXkpIGNh
c2VzLiBQU1IxIGlzIG5vdA0Kc3VwcG9ydGVkIGJ5IERQIHNvIHBhc3NpbmcgdGhlIG91dHB1dCBp
cyBub3QgbmVlZGVkLg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gwqAJCXBzcl9zaW5r
X2Vycm9yX2NoZWNrKGRybS5kZWJ1Z2ZzLCBQU1JfTU9ERV8xLA0KPiBwcmltX21vZGVfcGFyYW1z
Lm91dHB1dCk7DQo+IMKgCX0gZWxzZSBpZiAoZmxhZ3MgJiBBU1NFUlRfUFNSX0RJU0FCTEVEKQ0K
DQo=
