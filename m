Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1928FE7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 13:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08F310E3B0;
	Thu,  5 Dec 2024 13:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYIB5kou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315F910E3AF;
 Thu,  5 Dec 2024 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733403712; x=1764939712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hELXyRRdK2wyfMG0JDWF9L7KzQGnaITsDx+vHzkyRfw=;
 b=ZYIB5kouzKm+tb95AhDP8NWJbyJQMELLbdNOM5mbTE97LgEua3xELkCi
 0oKbTod8wiP2RYOnUs5EBWxYJaTFRdE1hoivDbbI2m66ABSj7J1V/aJqq
 oM3Pk1l2VlU/vUz6Tx7IFR6q3N+aKGTH3GXW8vE+zahm1BDhzn/rVqTYJ
 A/KCGQG3EDK33L5UttWU51RsU21/P6qzqc1pfd4uK/Mja+JrGAUEmTesn
 BP9PSHnbU/L2zIRB4Udu+bF6fHPxHmZkw21ictNWP76c4pWAZfj09Nlul
 77WSF8rcOfupOH+4Oq5A5ZsAoapgPrZZSsFJ507EJ3yyYyfYeZbsm1ulz w==;
X-CSE-ConnectionGUID: fgubnShETwanzPYe684Qkg==
X-CSE-MsgGUID: 3eAXSt8mTJCLH7V6n4v56Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33450689"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33450689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:01:52 -0800
X-CSE-ConnectionGUID: u2Y+LX3CQMGdpETCXuVJ7A==
X-CSE-MsgGUID: QlbF3A7JRCaYoTC2vVF2gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="98161468"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 05:01:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 05:01:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 05:01:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 05:01:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx7V5NaPzje5CVuK7dlSqlt/iqbiHkFIxWi1WP7AG8/mMRmMilUeQRJi10X7Ssg5ei2a7HDXx3O6pQAufS8mLhwfryug8+RSVa5FZuszJRpjEQClbn0jdbJajzyY0sSM28CzQaBf0Gf6L9eaZHC1Y2SkBpARt0x2oMRpV+omg9u29m2xLkZcaRexGTkua84/N4drXTdtK2EFr0qnWjixNy1HMYAZvRTpV8HyUqkoW7kIEh/x4frHzdlh83acK0knt4uX9JvNOU+PIQdr+ogkFSJhCyEbeoXiBR6m2Jyxhiq8OP3Z6KD5XT+z4nl9VBmXEuA4IfTFDbDQBnRR3tuJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hELXyRRdK2wyfMG0JDWF9L7KzQGnaITsDx+vHzkyRfw=;
 b=vVBjYrdySB3XICjbo6rxJcL4zrwGLvsIGGO0y/0yL3EY8lQhugSCNufD2h+eDGM9LHZrV9CxBNkSa5o6oo3j9CdWOMqKHb99bJRgEgvcuBq6hfOLxPYWhxmmXN35fSmDawgwIQ9mK9lwkoWaFyDNMc0ss/eoQZgM59ZtOFvN2ttzEvcyzXumG67+vCurG6KL+HuxkKUqKr6aeemM+FzqRVmwOhhjQ7KNaqTiIIHFSb4sf1+YEzRWb9nLiN0nmQFw6ZR8h/ui75aQKE6TKM4bWd2yCzKJiptza3EWsh91NQpYStmWL7TyUYF1/rlUkWccHaCzF7lwYl95UOP0OfPMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by SJ2PR11MB7647.namprd11.prod.outlook.com (2603:10b6:a03:4c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 13:01:46 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%7]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 13:01:46 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndC1ydW5uZXIg?=
 =?utf-8?Q?fact_checking_(rev10)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBmYWN0?=
 =?utf-8?Q?_checking_(rev10)?=
Thread-Index: AQHbRuMmbQXjYol/3kyj2SR9ON7amrLXTdyAgABPgWA=
Date: Thu, 5 Dec 2024 13:01:46 +0000
Message-ID: <PH8PR11MB67533049EC9ED4A3BB3C83B6F2302@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173338191997.2861566.1498806692876857674@b555e5b46a47>
 <5cda0f86-f498-4828-83bd-8899cffdb74c@linux.intel.com>
In-Reply-To: <5cda0f86-f498-4828-83bd-8899cffdb74c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|SJ2PR11MB7647:EE_
x-ms-office365-filtering-correlation-id: 19598165-0af3-408f-2e21-08dd152cf977
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MW1DY0pRejFpdzJucHRad0VMZ2JBWGZRVU5CVitaUDkwci9hQndDYnZUZXVJ?=
 =?utf-8?B?TVZTTUJvRGU0NmljZVZLb1dMd3dveENlZE4vZFVsMG41SnQxWWZuTFFSL3Fl?=
 =?utf-8?B?YWkzMTRnMjFMOHNvL2lFTUR0ejNuUXZvMFVaY1k5NUtSN2FxakdZRUpZTk9r?=
 =?utf-8?B?MkRSaWdweEdFNGZ0SUZXWmVnRGdpUDcvMWRONm5hYzlacTM0UDEvYW9kc0FO?=
 =?utf-8?B?V3NRVjZCSW9leDFWREkrd1VMdldUeVYwQ3QxWVV0ZkRIa1l2UXJCTWhJRHZy?=
 =?utf-8?B?UzVYOW1VYWwxMEFqdURDZnlkK3F3dGtZVElmemFCZUphLzROSUJJQkhFMkE3?=
 =?utf-8?B?Y1R0cy81bjMveXE4ZktWbkdBZVcwL1E2N0x2c3pIK3dBejFKVE83Z2J6c3ZD?=
 =?utf-8?B?SHlBQWw4MzAxKzVaQ2x6OHkvRlg4NlpJU3YyV1ljYVd0dEtWOTc4d2NJdlZy?=
 =?utf-8?B?MWlZVkVEUzFNbnYwR3VtaGFYR2o4M252QTMweWZhVERkd3R3N0lHVHgwS3BR?=
 =?utf-8?B?S3pIMzJEUWxnME9EQ2kwYk5lQjhOZUs2NXhlZkVTYk9US1hUeFpwd090YW91?=
 =?utf-8?B?QitaSytSVVJ5bUNjWEhBMmFtRTVZRmJsOVYrNmVxcU5XNFRnNDZjRFd0YnhF?=
 =?utf-8?B?S2lzdXl1MUZCUXVnc2FLWWdFNXAzMjZMVGdkK0l6ajFBb3JzQ2lWME96QXNK?=
 =?utf-8?B?WnFOdTRaanc4VklNVldJYWZqZ0RaSGlaUnZ0SndQUjlFdVo0ODFLcVR6WHdy?=
 =?utf-8?B?d0RycEpxVDBqbUFUVSs4NHZHT0I3UkY1dkc4ZUFsKzYrVGhNZmRKcWRMMmhE?=
 =?utf-8?B?Wlk3RWFpNCt0N0hHN3lMb1hsQUVkYXIyWnNFYzd1LzNPR2t0b29vM1lvd2x2?=
 =?utf-8?B?a0p5R0FUUFpqT2xuN1Zzd2wyT3NScGhSNnZkeDdQQzRZVnIxeDFXWnVkUmt5?=
 =?utf-8?B?ZGNad2hEcjdncWFDOUYvUEIxRlY4aGY5N3BQdkgrRy8xS25YM2p5ZW5ZUW1a?=
 =?utf-8?B?bUNyb05BcTdoQWYxbS91dWxtcStuYVAwZ0s5Qmp5WmtpeUxQay9NRXBLeEZZ?=
 =?utf-8?B?U1NKS0ttM3M3dnliLzNIQURWM08zVHlkbDlnV1F6MGFQY3g3dTlJSk05WXV1?=
 =?utf-8?B?bGZyQ09DbDJ1Z0FrU01KOFlDTmt1TFVRNi83L2VkTTRMWWVoUFVFelArTVRt?=
 =?utf-8?B?Q3NEQ0FNek9rT0JVUmtuVkE4eXJKOWhKREpHZnQzWWpGcC8wejFQZDQxcmYz?=
 =?utf-8?B?N0VRNW5ZdmpwT1dRcWNRNzVhTkZLMDRoNTZCSlRmOHNheGlQNkh3UFRvckgv?=
 =?utf-8?B?bkVFcVcwNWRqWkhXRVpXSkJvcjVQckdrMS9oZVR4RTQ5OE9KYkRmN1VIT3A5?=
 =?utf-8?B?clY3YzdNU0dRWVVVeGJRcWg4ZDljU3lvRnFSNHlYTGRtSEdlWVRYNzQwVGFm?=
 =?utf-8?B?S2d6U3ZvTlIxZWtPMmw2YWtxRWxuZkltaVJYdXN3QjhQS213OVJKWXR2elF6?=
 =?utf-8?B?S0hUbk9GTERkTURqM2FqZVFudENmLzZQZlB6N1ZqSGZRS1NmdEsrMWpKMmlW?=
 =?utf-8?B?K0NRQUdDRTk5dTZqdndFTXZMS0haOUVzKzRSaG5NZWNYaGltQ2Q3aEtWZlNX?=
 =?utf-8?B?Wk45eWI5QWNzRStRSWxVQ1NROER4NDM4RTVEZnlPaVVGakFpbkVNKzZWakRY?=
 =?utf-8?B?UmlSV3c4VjJQaVRkUldkRDJOdmZnK3I4MmlKUjZYSFFmVzYxVjRadlh3NFFw?=
 =?utf-8?B?MTROTzRxcEFWMDR0L0xodENYZ1lZVDRtQlNSMlRyUXhNYXgrNjVtWjhxUEdi?=
 =?utf-8?Q?UxczbBzd/R2DdyshLOJITzHM691w3KMr6QyGw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rkx2RFNhcyt1KzdpR01zSmtwKzJPc2c5ODg1UzdJNGk5RzVPekJRV3Vja0Qw?=
 =?utf-8?B?eTN0WEgxTnpvVlM5UC9UUHdlNDdNYjdhRzgzTFhTQms4V2NRQzFvUWlrMnNS?=
 =?utf-8?B?OTM2SUh6OFF0aDQ4b1lpeEhMRTFlOUIxcFoyQ1ZQN3VDWUhkaTZNeDRPZUZC?=
 =?utf-8?B?T2I0SDZML2Q3VXZoTjJzeVJmTGEvWFI0RWtkWG8xb2IzNUp1aHVuVExiMDRt?=
 =?utf-8?B?clF5QzZiLzJsaVgwZUcwYzNUOFJGeUZsTjdPY3VtT0syZkxUVGZiTktWTFds?=
 =?utf-8?B?czF5ZGZpYmsxajJxV01OcE1qMmhsalJnU0dBNHVhL1hRRGU1YnkwazkwWG52?=
 =?utf-8?B?QURpdytMLzV1UStIWjRLK1h4WXdFcTBUOTh4TkhkcDFjK1NSV0IwZXZuVGhV?=
 =?utf-8?B?S29SZkVWZm5nRkhJWVZTT2ZBUmZZZmtkeGVEVUxpMzhtTy85bEdUalR4U1Fh?=
 =?utf-8?B?NWNYK1Q5QjhoaXNwZGZKUlAyQ1F2L29ZdEtMUlhRMFZ5WFk1bEpmdVNxeUlS?=
 =?utf-8?B?T3V3UHJ4WFlGYlFMdWZFNnpkc3pXQnlDTFpMZ05obmFLQ0ZleXBFWm5sU0Rj?=
 =?utf-8?B?QWNkbUJ2Z280dGpXb2k4NkJGZUVqZEs2d3VvM3Y5UldUalcwL0JFYzh4cE1q?=
 =?utf-8?B?TVhCU25PQ1BIa2FEa0hFN01aUnFMb2hJeWJqcEdnMHFONzE5Nmc4R0FlNGZp?=
 =?utf-8?B?Ui9PdG1CdDlVM2dNRWdYT2V5WGtRcmlBZzFaNkZmMVQ4djBDVXdXWjB4WExu?=
 =?utf-8?B?ZzJEZnVBZ2JGMXJXL0VJcEI1MWVncUp1YWFrNEVLajBDUzJsTTR2S3dIWm5s?=
 =?utf-8?B?MGdqYmZVckYvd0lLZDNBTGhEYk5NejMxOVNsanpoWHJ3bmlMSmh6Q0hMdWda?=
 =?utf-8?B?Tll1MzlobEZFRlgxbjlqUXRadmNIREZCUU9KNEZURjRlMldmS2VvVHFPVlFo?=
 =?utf-8?B?ZG1uYUluc1BaTWp4cTlZQjJoTzVZT3FBQTJkNHNmUm9DVnIxMGxtQjA3bzVM?=
 =?utf-8?B?RDNBMi9OWXV6d2hJWGdJSXEwQlR1b2tQYUtvL2MwbWk3QVBIOE1NeFJIVE9X?=
 =?utf-8?B?UTIrMlFxWklMdEI1MlNucWJqMTVVaU9Fc2J0Zngxa1V2Wml4c2tkK3pvVFBv?=
 =?utf-8?B?TWhtWXEraW15ZFNlR082YStNL3ZuSUFkOXc3T0orV2ZhMGJmdkYvMm9kelNJ?=
 =?utf-8?B?YmMxTVBmQzREUTBmQk1zZndzcm9NRHZYK005WDBjZjk4Q09XN2hPd2FDUDFY?=
 =?utf-8?B?SWR1Zk96ZTNrUmpSekxlYlBqeVhyekoyRC85ZnhnYVpiMUZBNzdaaC9IRDRW?=
 =?utf-8?B?WlZHSjVoNm8rVXdSM09RNzgrQXM3dnpPc1RJM2krUEtqb2kzQWUwMjBKN1Ez?=
 =?utf-8?B?Q2xVNElJdXN5dzFJK2JpZkg1TGNUSVJmU0FOeU56RGxDNC9qNkZWL0p3Ym5v?=
 =?utf-8?B?ckVvV291SnJzMHRYdjZueDVscG5QcHlCbnVWdldGbzd2YVcxT2FWekM4d1RW?=
 =?utf-8?B?UmhwdloyODF2aVk2Yk0vRHlLMEdkZTd6M1Rqd3duNVVFRGtZNmt6d3owN3VE?=
 =?utf-8?B?dTgrZ25ZZk9nZUsvcnRqc1BPSzEwRHVBTnJCNkFUNk1GSjBSUm5TRms5NzZZ?=
 =?utf-8?B?UWxsUkFzM3U0a0NCNnRxWHg5bmdLL3lITEdiV1FmbjhsY1Nsd1haNWZGRGV5?=
 =?utf-8?B?bWw4cFdpLzZzSWY4K3doclFqTFZmNk53elBRa1VPMm1xQ2ZXaWREUXFvTDdU?=
 =?utf-8?B?SGkyME1ZemtzSk45RGtpTDJMaDRnc0ZoZmozN3djb2pGOGEvOFBHakpsNkRZ?=
 =?utf-8?B?ZjdOTUZiZ0VjaUFNUUVoV08zQk1peC9EYXhWNm51eW1iSmtRZnhPa1BWRkt2?=
 =?utf-8?B?SGIrT05aQmx2NmovbUdGdk0rTTJ6NFNBN21aUkh0Y09sdjlMZmt3RXFyYlFn?=
 =?utf-8?B?bDdyc1p2WGxMVW1RUTFUa2VjOGZGZzFrZW1ESlhPYUJWVThwcTM5VStZVHlY?=
 =?utf-8?B?S1ljS3Y5cm9lYVV5YWZqU2RkNjNyb1BaWm9IbzkxNG5ZM3YwTVNlY3JoZHpl?=
 =?utf-8?B?SFkxQTJJdUwwSzNEUzcvZVljTnU0a1ArOGdUMkp6R0pRRlBQR1JURDhESXJ2?=
 =?utf-8?B?eVRXWFlkSnFxb3ZBS3V5dzc0ZEkyeFN2VzM5ZWE5aUc4N3VuTDRmM2JjT1FL?=
 =?utf-8?B?NVBQbnlIblF2anZXTGc5aDJvcktNWXdyU1kvZis3RHRMb1JDWTdKOVVzbkJD?=
 =?utf-8?B?MDJObHNLUm54cGFmWW1rbFVmOWJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19598165-0af3-408f-2e21-08dd152cf977
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 13:01:46.4366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5DDAnDB+s4t6YPAm2QXhlSQC5jtjp9wQ1HcVFKj1iYFnwMsQUtEqMq1Lf9iO6yguX7WyDjbG1CRRxeYeAqogAX4Wjs+hxzy0XuS3IGGKMsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7647
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQwODQxLyNy
ZXYxMCAtIFJlLXJlcG9ydGVkLg0KDQpYZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBY
ZSBjYW5ub3QgYmUgcmUtcmVwb3J0ZWQNCmk5MTUuQ0kuRnVsbCAtIFJlLXJlcG9ydGVkDQoNClRo
YW5rcywNClRlamFzcmVlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1
LWNpLWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IFRodXJzZGF5LCBEZWNlbWJl
ciA1LCAyMDI0IDE6NDUgUE0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBQaWF0a293c2tpLCBEb21pbmlr
IEthcm9sIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6
IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndC1ydW5uZXIgZmFjdCBjaGVja2luZyAo
cmV2MTApDQoNCkRlYXIgSTkxNSwNCg0KT24gMDUuMTIuMjAyNCAwNzo1OCwgUGF0Y2h3b3JrIHdy
b3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBpZ3QtcnVubmVyIGZh
Y3QgY2hlY2tpbmcgKHJldjEwKQ0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvMTQwODQxLw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1h
cnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gQ0lfRFJNXzE1NzkxX2Z1bGwg
LT4gSUdUUFdfMTIyNDhfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoq
RkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElH
VFBXXzEyMjQ4X2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFs
bHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90
aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjI0
OF9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcg
ZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+
IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTIyNDgvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0
cyAoMTAgLT4gOSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE1p
c3NpbmcgICAgKDEpOiBzaGFyZC1nbGstMCANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2Vz
IHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEyMjQ4X2Z1bGw6DQo+IA0K
PiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMj
IyMNCj4gDQo+ICAgKiBpZ3RAZ2VtX21tYXBfb2Zmc2V0QGNsZWFyLXZpYS1wYWdlZmF1bHQ6DQo+
ICAgICAtIHNoYXJkLW10bHA6ICAgICAgICAgTk9UUlVOIC0+IFtBQk9SVF1bMV0gKzEgb3RoZXIg
dGVzdCBhYm9ydA0KPiAgICBbMV06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzEyMjQ4L3NoYXJkLW10bHAtNi9pZ3RADQo+IGdlbV9tbWFwX29mZnNl
dEBjbGVhci12aWEtcGFnZWZhdWx0Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9wbV9ycHNAcmVz
ZXQ6DQo+ICAgICAtIHNoYXJkLXNuYjogICAgICAgICAgTk9UUlVOIC0+IFtETUVTRy1GQUlMXVsy
XQ0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzEyMjQ4L3NoYXJkLXNuYjcvaWd0QGk5DQo+IDE1X3BtX3Jwc0ByZXNldC5odG1sDQo+
IA0KPiAgICogaWd0QGk5MTVfc3VzcGVuZEBiYXNpYy1zMy13aXRob3V0LWk5MTU6DQo+ICAgICAt
IHNoYXJkLXNuYjogICAgICAgICAgTk9UUlVOIC0+IFtBQk9SVF1bM10gKzEgb3RoZXIgdGVzdCBh
Ym9ydA0KPiAgICBbM106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0t
dGlwL0lHVFBXXzEyMjQ4L3NoYXJkLXNuYjEvaWd0QGk5DQo+IDE1X3N1c3BlbmRAYmFzaWMtczMt
d2l0aG91dC1pOTE1Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2FzeW5jX2ZsaXBzQGNyYy1hdG9t
aWNAcGlwZS1jLWRwLTQgKE5FVyk6DQo+ICAgICAtIHtzaGFyZC1kZzItOX06ICAgICAgTk9UUlVO
IC0+IFtGQUlMXVs0XSArMyBvdGhlciB0ZXN0cyBmYWlsDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIyNDgvc2hhcmQtZGcyLTkv
aWd0QGsNCj4gbXNfYXN5bmNfZmxpcHNAY3JjLWF0b21pY0BwaXBlLWMtZHAtNC5odG1sDQo+IA0K
PiAgICogaWd0QGttc19jdXJzb3JfY3JjQGN1cnNvci1zdXNwZW5kQHBpcGUtYS1oZG1pLWEtMToN
Cj4gICAgIC0gc2hhcmQtZ2xrOiAgICAgICAgICBOT1RSVU4gLT4gW0lOQ09NUExFVEVdWzVdDQo+
ICAgIFs1XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTIyNDgvc2hhcmQtZ2xrNC9pZ3RAa20NCj4gc19jdXJzb3JfY3JjQGN1cnNvci1zdXNwZW5k
QHBpcGUtYS1oZG1pLWEtMS5odG1sDQo+IA0KPiAgICogaWd0QGttc19mbGlwQHdmX3ZibGFuay10
cy1jaGVja0BhLWhkbWktYTE6DQo+ICAgICAtIHNoYXJkLXJrbDogICAgICAgICAgTk9UUlVOIC0+
IFtGQUlMXVs2XSArMSBvdGhlciB0ZXN0IGZhaWwNCj4gICAgWzZdOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjI0OC9zaGFyZC1ya2wtNC9pZ3RA
aw0KPiBtc19mbGlwQHdmX3ZibGFuay10cy1jaGVja0BhLWhkbWktYTEuaHRtbA0KDQpUaGVzZSBh
cmUgdW5yZWxhdGVkIHRvIG15IGNoYW5nZS4gUGxlYXNlIGZpeCBhbmQgcmUtcnVuLg0KDQpUaGFu
ayB5b3UsDQoNClBldGVyDQo=
