Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5912C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 12:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D4210E659;
	Wed, 11 Jun 2025 12:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQWZM4D6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092B510E659
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 12:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749645191; x=1781181191;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=68gXz0nt8wONKh6yW78BCLVJ/EJ95xjM5CvbMKUl1jY=;
 b=IQWZM4D6x/kiXaMww7YZ+IT03GL8CulSh5tB6onVrZMtHaSus0gavAPb
 hoJ017zjl12eRR7zeT+WO/mvMIBqfMMBHZN/USKZ/2s0mYKcA+IwVO5Rl
 BfcSvrx+4aiFPlhZVIaUi4HaTUZjvk7/J3EaaElimAC1DGrY7tGM/CKo6
 l39pmqcBGhWUfilsirkCoFtEjP8D27qEiQW/QMJ9BlpgUbmh2bJRhteqQ
 3f1XzvOdnaaICVGB5Fn2hfiwtRGriqJsbOqLflfO7zQHVATOoBRXuuxXo
 OPVrlwr+IkcUJdEj4D6BJbDGBTg62dLsu1He8IzP1VEUU7k/u9QYl3tsQ w==;
X-CSE-ConnectionGUID: qI8vxIUGTemuPQJl3crHaA==
X-CSE-MsgGUID: 5sY2bsn6QMi3ljTcB6I6BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51008672"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51008672"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:33:11 -0700
X-CSE-ConnectionGUID: Csgz3aelRvW7JVoQ85/idQ==
X-CSE-MsgGUID: ULc4z/uZR+K/lcdje2Lgcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="151967940"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:33:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:33:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 05:33:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:33:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w18GOc0ep3u+A3lX3I6QCprj7oc5wyCYhJuRUW1rqrTIS9venrs3Q+Q1TvtJB8HCjpmWvppGofdzlZG2G2gM3T975LjOM/WeoJsfR48X2xNH6fOSDocqZs1gEmQf7gNS7MgWvtlFOHpOvC/sMJBl/aFzOYenv4TQxS1KsPeBWRwwrg/ewWsXBB6BKRBudbGIzi8Lh6AWK37WvcAmhO8p2L+QX5/aj+MXDjdY7S9BzFYaWxPPxXLyQzhM+AtHZIYBSdQKjw8d0MgCVAagWJW/Eqdn3DxCnOVZjAt8doJbkTEIvV+0eY8mdUvqq51YoyDqwcPTH215luVF9jaVtxkBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68gXz0nt8wONKh6yW78BCLVJ/EJ95xjM5CvbMKUl1jY=;
 b=BOWST/fL7dPYLFpspmuYEXkcFdBOdox0Wy68EmZZFtTyj/DnBMR/+hdr4EOo2NCEJ139DcGAO48Sou2NtyA7T+rFJbegQQKmDmGEgvNfPri5PoDF1aIITxcw08VhoJMc4GSeTYUkgHR8uz676IWGiOofyys4Z4r4IYHXD0CvxTFxur/TQofNz2S0sI0Dl1SlTq3HcsphdzQvudjX2jQLD+T2Vo8e38ewAjTZdz71+hRXIjsPEP0MpRyYHkYGUpebCWYgKIWx6r3I9Ky5ACMWYBhB6hXEAC6iwAN7fNZGkGPYf7tm1gYOl7T5jgQigxisRsah09rs6CwteGWTtEkWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by MW6PR11MB8437.namprd11.prod.outlook.com
 (2603:10b6:303:249::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Wed, 11 Jun
 2025 12:33:06 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc%3]) with mapi id 15.20.8769.022; Wed, 11 Jun 2025
 12:33:06 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "rk@dragonic.eu" <rk@dragonic.eu>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [v2,1/5] CI: create own base buildah image instead of wayland's
Thread-Topic: [v2,1/5] CI: create own base buildah image instead of wayland's
Thread-Index: AQHb2sz7301uioqTYU2YXJNsloG9CQ==
Date: Wed, 11 Jun 2025 12:33:06 +0000
Message-ID: <6ecc761ee4280bbadb0ff395fe73b25413d8acd9.camel@intel.com>
References: <20250611-bump_docker_distros-v2-1-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-1-90791ecb953d@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|MW6PR11MB8437:EE_
x-ms-office365-filtering-correlation-id: 1f8e7d7e-3c01-4b67-e677-08dda8e41e1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TU5ibFVrUjRrSnVhQ3B1RUdPVHd2QzJBbDhQZ1YwcHppcUg3K3hTemVvbDZD?=
 =?utf-8?B?NVFTRzNlZE9qejNrbWpxZWR4T1RUNmRzWkNwVWtGaFB2eGovVkNUQlNmQllB?=
 =?utf-8?B?U1A2VTlhY3lkNnVmY0xRNjQxbEFRa0RUOEZVbGtaUkdaTE5XNzQzcG9vaG1P?=
 =?utf-8?B?eDFPT05XMWpHcjBnRndCaFRBN01YbHljamxIZFo4aTBRaTBkb1BvN2U1YkZF?=
 =?utf-8?B?MlJLNkRvWndFRzlsS25YSnNjZ1pCck84VWlnOWRUdXZaU2NwMEhsSk93QURK?=
 =?utf-8?B?MWxsNklzaVEyQ1d5a1ZDdzhHK0xCZWVOci8rSC9yNnFSTHNEanNGTys3RUdR?=
 =?utf-8?B?SU9mNmdnUDd0dnVRRUZzdkhOejhFcjdxTHpNcXUrN0dkYzBVNCs0ZFBuRyt6?=
 =?utf-8?B?SHgzQnI0cHBkQjhEYTkwUjVFZjBXbnpISDJqaEwySnYweXNITU8vcWJDSHFk?=
 =?utf-8?B?T3hlNjVRWDd3K3dGbHhVeGtkcjBNYnhsdWw1YTlCdjBOUEVDZUZCekVBT1hm?=
 =?utf-8?B?SUoxVEZRV0x5ZjlZME5mTVlvTDAxWlNMQ3U3L2J3WGdXQjFDZUduV2Z4TGJF?=
 =?utf-8?B?bDFpTzQ1REYwVFVpRlhjeVVoY2xSWXRPdU1aY0VKZEE4dG42YkRJR0V5V3dJ?=
 =?utf-8?B?ZXpwQlVNMDdjUXlaNmN5c2JIbnBBZ0pQYm1Td2JONFRibzRwVjFpUHpIRDBs?=
 =?utf-8?B?UlhvYVQ2TGtKdnd1ekVON2g4Q295VkhNOGVFT1haeVIxMGZaNTZ1dk9LOHpY?=
 =?utf-8?B?a3d3aFgvRTg0bXhlS01Idkd2MnFHM2NTdGlzZWNJS3U2MlVteGI3cDlKcnFa?=
 =?utf-8?B?VmUvem5NSzhJaDhIc3ozNkJDWjU2NzJ0WVZoQzYrOFowd1BZaWF6eGRUZ1Jn?=
 =?utf-8?B?RFVqVCtBNWJCVjhzd2U2Nk5kdVQzekpaRXlkQVdkM01SUG1lSXIwNXlzb0to?=
 =?utf-8?B?dTJ2RXVoa2ZIbzNLV2x4N1RKQ1dYWnJzYVgzUUJjTDZnRG52VnRIdGh5Qnpy?=
 =?utf-8?B?SG01c09nSXNYTFVhMzhIRlFLSEVHUzFtbW9LUUVVSnZoTzJWT0U1YzVSUzFv?=
 =?utf-8?B?Y25hbHkvVUdaWHZKdXJIMU1uV2dFWUJUOUZsdWh4THh4Nmszbk5SZFlLVHgy?=
 =?utf-8?B?OGV2Zm1MZXp4MHg5amxzY1hKOXhQdUtkWGpiQXdqN2RRWkRoOVRkZHhBdmV3?=
 =?utf-8?B?OVpkcXBuSkxTT2ZObWNIb1NJQWJ4TUJBYWZZSTRNeWNYNDlFcndsSjhsWHQv?=
 =?utf-8?B?eWxxMDFFd0pMbmxna0VrUEE4S3htcXNsYzU5R0RJOGZJVEZXcVlta1drSXVC?=
 =?utf-8?B?bm5IelBNWlNsVzhpNFV6ZU9SZEdoL1RpS1ZTUGY3bmI3UHA5NGlocERZeEs0?=
 =?utf-8?B?M1ZheVNidzN6TU44UUZnamRER0lnSGJUUm9pWjRielRnWWV5K3JEQ2hBMVgv?=
 =?utf-8?B?UmIrdFY5Rmh6SlJiN0JzMDZKOGNpOGgvR0M4RnEvdDVNYlMzc09pMWpUamZP?=
 =?utf-8?B?OEZXS2tUWlF4alJTVmVrQUo4QVlYSDFkWS9MWXBQQXZNWU13RWtCQTNiWmNu?=
 =?utf-8?B?cmIwOVkwZTd6cXhkcVNVSk1mNW4xekJzUGpJZGpXMGxsM1JVSmEvT1FyV1k1?=
 =?utf-8?B?MjlqcThhZmQvYWlOa1d0Rm5tVmpMb0FKTHV2cHU1NHl5RFcwQWF5VUtuM0Va?=
 =?utf-8?B?NVdiOUtzOE5kbjY5OEp3c3hSanZ5OGpXWmJPM0xzUWpmMFp3eEpYblBPMFJP?=
 =?utf-8?B?TEE3NlJTOFUxUXZLM1FUb082cHNWRVZVcU5QMkh3OCtZRkxzV216WGVHZUx1?=
 =?utf-8?B?YXk3KzNIWnM3ZWg0a0tHUW5VdktCMWJxSTFGTlhIdWc2NXFVNjFTYy85cVhh?=
 =?utf-8?B?MGdHVUxxaG1MMjlpUHphNUtuZnMwcEJ2WW83ZHU1TzlTMUR5K0hLT3VnU042?=
 =?utf-8?Q?xlKQSwbCtS4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW9BZW5XY2FWeDFsYitQclpYNXlXV0JVaVRwT1ZKYXk0VlBNelNGbFBtZ1RH?=
 =?utf-8?B?eGprV3JWWTFmZVZwRDdRYU82RS9CNE9MaXdqRnppZ2xTOG1jOHB3OGNoSGlD?=
 =?utf-8?B?ZndMYmZZT1JVZzJFMDUrTEJrTGFXbURZMjBOVUoySGZXU2N3cFZYZGkyR2VG?=
 =?utf-8?B?bmNBcW9Ea1Jjb1dCckFjNlIweTAwNnBwUzZYNmg2Y284VTlRWTZrTjRjSUo1?=
 =?utf-8?B?VGRadER5UjhUdjRSZ0dPaHlpMVlaTk1lN0FwZ011eGZmcEdiTWNyQ3JwbFFt?=
 =?utf-8?B?NDg5Sk9va28vOS9pc0phQlBlUXlETDVsVnRPT0tsNHFjSFBnMU5raDhsdFpO?=
 =?utf-8?B?RTN4VXpFbjlEZkZhbXY4QWpPU2IwZ3RJQWFMTHZtK09mdndEWTdxVVVJRGlH?=
 =?utf-8?B?b1BhQWdVR2hlMVMyTzFBbk9yNERhcnMwd3l5R09uVmRXSkdKMm94T0lHYnRw?=
 =?utf-8?B?eHlQUHV6VHlwL29lVnAvS0dta2w3VHpBTEdjcjBQMnZCT3h6QnNiMERLWEpp?=
 =?utf-8?B?SWJGRmp0ZDROWUsweSt4blBMQ0hrVXhidE9SZmV4WDdleTIvS2djaCtDR3NZ?=
 =?utf-8?B?cVJpbzhKYVVwNkd0aTFnclQ1NW82ODNJYzlxTVdPL3V0K1YxWUlKVXovcTc4?=
 =?utf-8?B?cUpSZ3ExTXdxMHJydXpOUUtaZUFZdFhxTjZnQjlYSTFBbXpLUm9XUEgxQlZl?=
 =?utf-8?B?akp0ZVFuTjBsYW1MWk8rNWMxZTVJbmwvYWlFYVlhMG5tZFJCbUU1Q0lVbkw5?=
 =?utf-8?B?MnNqNW5LTnlNbTd0Z01ZY0JoQkcrV2VHTEdhL2ljQ1UyNHArOVEyZGdCaXhZ?=
 =?utf-8?B?dWdyTExNcVFYazExRU5FRmJnc29EeEVaQm5IMVZPcXJRRnlGMUw5dmQ4djdG?=
 =?utf-8?B?cFlPRnJzZlRkbGM1ZUlnUXN4YmNXb05MOU5jQ1NObStxblNTV1MzRTd0RzhB?=
 =?utf-8?B?L3I5SG9pWWQ0MGVjcDF2ejRCME1PZmxreXhsTVdjd01zeVdveTFVQ05Ta3hP?=
 =?utf-8?B?M2o4ZHRiSHFzUksyeE9ZUmdiSThpOVdZYTVmUDJmQXlyUC8zdzN0WDZUYU9H?=
 =?utf-8?B?NVk1K3dUcHNMeU5RMFBtOEhpaTRuWVl3bjQ0Wjk0TXdEcnlDTFJPUitTSzg0?=
 =?utf-8?B?SWhjOWxiL2NzVjNhbjROaWkvQVNiSWdnc1g5K1JXd3BWSHA4SGJpNExWcFRr?=
 =?utf-8?B?M1RvKzBWSkY1QW5ZTUo5UHV2akNZaytzRkRYam1nQ0lvaTdIZG94eXRZSVBN?=
 =?utf-8?B?Z3FvUmkxdTJJM0NPYy8zMUN4bnd1bHVQR08rUVRQa0RRTm9ONjc1ZnUrU0E0?=
 =?utf-8?B?cjFTNE9rZktCZm5TQjIweWY1ajlMTzhHdXUvRkdhUXBaYmx0dTJsbCtpQ1RK?=
 =?utf-8?B?MVNmYWZrckVOVnBGZHdNVk1ia3hPK0tKTmNJRU1MOEhEWmVUN2oxOGNPTitH?=
 =?utf-8?B?Q3lyai9odTBlb282ZElkR3VJZkRkU1MxTDBqV21BSjd5aCtEMi9JaDBRd1E1?=
 =?utf-8?B?Z2NYTGdTMG42WGI0ZVJFU3QwMVhTSCt6SzJxaG9ESW05aEZZUHdKNHk2UVJs?=
 =?utf-8?B?ZXZ2Y1FocHJyaWlHa2pUMHhlYmlZWVZhSXZkWkwyTXNITk1ENll4dG1oK05k?=
 =?utf-8?B?WEplLzhISWJLTkFlRGlpNXUxOGpzd0hBVWJGRW8venlCNDBwVzJnYmF3QXZG?=
 =?utf-8?B?WW1FZXV0K0p3aXpDczNYblZ5MDB6MTJVOFZWRlpmVTdrT1QyMmhzTCtONWVy?=
 =?utf-8?B?NWh5elZWTWU2ZDcxQWVsTXNxSHJxanNyZWNHMW1GR3VxcVdhb2JpdGdoYkdX?=
 =?utf-8?B?c0ttZUhOV1l2cjBaZjZ6cC9qOGRjRVRQOFRES04yL1NhY3A4WnVCMTYzQ2M0?=
 =?utf-8?B?WFFRZWxZVXRmNGlwdTRTNWxOMHQrNDR3Ty9QL3dpSVB5UEd6a29GM0c1eDQ1?=
 =?utf-8?B?UUM1Wlc5aTkvNjhQQ1hOZkgzVldQaXRpdk0zNHZYSGp1Q2pPMzM0bzJKZU5i?=
 =?utf-8?B?ZDZ5dSs4NVgwYk5vOCtZQU1kOUtFTklIVFRkRk1NWGRXb1hJcElha2FIR0lI?=
 =?utf-8?B?UjNJbnlXZmxCLzFmWEN3bE5ENkpmRzRsd29nc3ZYb2FqczNVeUlPRXY0YWIy?=
 =?utf-8?B?YmdvcWdNVHQ5NkJZb0dFZE9SY3kxY0JSeHBZSzhiUEw3enZHK2NYYkpTZlg0?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA32399E0A632244847B4B94D89903B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8e7d7e-3c01-4b67-e677-08dda8e41e1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 12:33:06.7068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mN9Y8GevB/b1u74OZJ6e5Tf0v9Ay4vOGqU7fOfcsUfpliVbZYmh1Zq3cJ2RHDx6IGlXYTkQH8ZyA8Fzh/v9ZJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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
V2VkLCAyMDI1LTA2LTExIGF0IDEzOjA2ICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOg0KPiBU
byBhbGxvdyB0byBidW1wIGRlYmlhbiBhbmQgZmVkb3JhIHZlcnNpb25zIGZvciBidWlsZCB0ZXN0
aW5nIHdlIG5lZWQNCj4gcmVsaWFibGUgYmFzZSBjb250YWluZXIuIENvbnRhaW5lcnMgcHJvdmlk
ZWQgYnkNCj4gcmVnaXN0cnkuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvY2ktdGVtcGxhdGVzL2J1
aWxkYWggYXJlIHF1aXRlIG9sZCBhbmQNCj4gaGF2ZSBtdWx0aXBsZSBpc3N1ZXMgd2hlbiB1c2Vk
IHdpdGggbmV3ZXIgT1MgdmVyc2lvbnMuDQo+IEluc3RlYWQgb2YgcmVseWluZyBvbiB0aGVtIG9y
IHNvbWUgb3RoZXIgcmFuZG9tIHJlZ2lzdHJ5IGxldCdzIHRha2UNCj4gYmFyZSBidWlsZGFoIGZy
b20gcmVsaWFibGUgc291cmNlIGFuZCBhZGQgcmVxdWlyZWQgdG9vbHMgdG8gaXQuDQo+IEJhc2Ug
aW1hZ2Ugd2lsbCBiZSBidWlsdCBvbmx5IGlmIERvY2tlcmZpbGUuYnVpbGQtYnVpbGRhaA0KPiBp
cyBjaGFuZ2VkLiBBbHRlcm5hdGl2ZWx5IGJ1aWxkaW5nIGNhbiBiZSBlbmZvcmNlZCBmcm9tIGdp
dGxhYjoNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xz
Ly0vcGlwZWxpbmVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YW5kcnpl
ai5oYWpkYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgLmdpdGxhYi1jaS55bWwgICAgICAgICAgIHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gIERvY2tlcmZpbGUuYnVpbGQt
YnVpbGRhaCB8ICAzICsrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdpdGxh
Yi1jaS55bWwNCj4gaW5kZXggMWFmZjVjYjAwMDU1NWJiMzk5NTYzNGQ4MTRjNzA3NDQ4OGUyNTY3
ZS4uYWI2OTY4YjU0OWQwMDI2ODY5ZmUzOGYwNjNmNjBmNTdiNWU5ZDc1YyAxMDA2NDQNCj4gLS0t
IGEvLmdpdGxhYi1jaS55bWwNCj4gKysrIGIvLmdpdGxhYi1jaS55bWwNCj4gQEAgLTIsNiArMiw3
IEBAIGltYWdlOiAkQ0lfUkVHSVNUUlkvJENJX1BST0pFQ1RfUEFUSC9idWlsZC1mZWRvcmE6Y29t
bWl0LSRDSV9DT01NSVRfU0hBDQo+ICB2YXJpYWJsZXM6DQo+ICAgIEJVSUxEQUhfRk9STUFUOiBk
b2NrZXINCj4gICAgQlVJTERBSF9JU09MQVRJT046IGNocm9vdA0KPiArICBCVUlMRF9DT05UQUlO
RVJTX0lNQUdFOiAkQ0lfUkVHSVNUUlkvJENJX1BST0pFQ1RfUEFUSC9idWlsZC1idWlsZGFoOmxh
dGVzdA0KPiAgICBNRVNPTl9PUFRJT05TOiA+DQo+ICAgICAgLURsaWJkcm1fZHJpdmVycz1pbnRl
bCxub3V2ZWF1LGFtZGdwdQ0KPiAgICAgIC1Eb3ZlcmxheT1lbmFibGVkDQo+IEBAIC0xNCwxNyAr
MTUsMzggQEAgdmFyaWFibGVzOg0KPiAgICBMQU5HOiAiQy5VVEYtOCINCj4gIA0KPiAgc3RhZ2Vz
Og0KPiArICAtIGJ1aWxkLWJhc2UNCj4gICAgLSBidWlsZC1jb250YWluZXJzDQo+ICAgIC0gYnVp
bGQNCj4gICAgLSB0ZXN0DQo+ICAgIC0gY29udGFpbmVycw0KPiAgICAtIGRlcGxveQ0KPiAgDQo+
ICsjIyMjIyMjIyMjIyMjIyMgQlVJTEQgQkFTRSBDT05UQUlORVIgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjDQo+ICsNCj4gK2J1aWxkLWJhc2U6YnVpbGQtYnVpbGRhaDoNCj4gKyAgc3RhZ2U6IGJ1aWxk
LWJhc2UNCj4gKyAgaW1hZ2U6IHF1YXkuaW8vYnVpbGRhaC9zdGFibGUNCj4gKyAgcnVsZXM6DQo+
ICsgICAgLSBpZjogJENJX1BJUEVMSU5FX1NPVVJDRSA9PSAicHVzaCINCj4gKyAgICAgIGNoYW5n
ZXM6DQo+ICsgICAgICAgIC0gRG9ja2VyZmlsZS5idWlsZC1idWlsZGFoDQo+ICsgIHNjcmlwdDoN
Cj4gKyAgICAtIGJ1aWxkYWggYnVkIC0tc3F1YXNoIC10ICRCVUlMRF9DT05UQUlORVJTX0lNQUdF
IC1mIERvY2tlcmZpbGUuYnVpbGQtYnVpbGRhaCAuDQo+ICsgICAgLSBidWlsZGFoIHB1c2ggLS1j
cmVkcyAkQ0lfUkVHSVNUUllfVVNFUjokQ0lfUkVHSVNUUllfUEFTU1dPUkQgJEJVSUxEX0NPTlRB
SU5FUlNfSU1BR0UgZG9ja2VyOi8vJEJVSUxEX0NPTlRBSU5FUlNfSU1BR0UNCj4gKw0KPiArYnVp
bGQtYmFzZTpidWlsZC1idWlsZGFoLW1hbnVhbDoNCj4gKyAgZXh0ZW5kczogYnVpbGQtYmFzZTpi
dWlsZC1idWlsZGFoDQo+ICsgIHdoZW46IG1hbnVhbA0KPiArICBydWxlczoNCj4gKyAgICAtIHdo
ZW46IG1hbnVhbA0KPiArICAgIC0gYWxsb3dfZmFpbHVyZTogdHJ1ZQ0KPiArDQo+ICAjIyMjIyMj
IyMjIyMjIyMjIyBCVUlMRCBDT05UQUlORVJTICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICAN
Cj4gIGJ1aWxkLWNvbnRhaW5lcnM6YnVpbGQtZGViaWFuOg0KPiAgICBzdGFnZTogYnVpbGQtY29u
dGFpbmVycw0KPiAtICBpbWFnZTogcmVnaXN0cnkuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvY2kt
dGVtcGxhdGVzL2J1aWxkYWg6MjAxOS0wOC0xMy4wDQo+ICsgIGltYWdlOiAkQlVJTERfQ09OVEFJ
TkVSU19JTUFHRQ0KPiAgICBzY3JpcHQ6DQo+ICAgICAgLSBwb2RtYW4gbG9naW4gLXUgZ2l0bGFi
LWNpLXRva2VuIC1wICRDSV9KT0JfVE9LRU4gJENJX1JFR0lTVFJZDQo+ICAgICAgLSAuZ2l0bGFi
LWNpL3B1bGwtb3ItcmVidWlsZC5zaCBiYXNlIERvY2tlcmZpbGUuYnVpbGQtZGViaWFuLW1pbmlt
YWwgYnVpbGQtZGViaWFuLW1pbmltYWwNCj4gQEAgLTMyLDIxICs1NCwyMSBAQCBidWlsZC1jb250
YWluZXJzOmJ1aWxkLWRlYmlhbjoNCj4gIA0KPiAgYnVpbGQtY29udGFpbmVyczpidWlsZC1kZWJp
YW4tYXJtaGY6DQo+ICAgIHN0YWdlOiBidWlsZC1jb250YWluZXJzDQo+IC0gIGltYWdlOiByZWdp
c3RyeS5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC9jaS10ZW1wbGF0ZXMvYnVpbGRhaDoyMDE5LTA4
LTEzLjANCj4gKyAgaW1hZ2U6ICRCVUlMRF9DT05UQUlORVJTX0lNQUdFDQo+ICAgIHNjcmlwdDoN
Cj4gICAgICAtIHBvZG1hbiBsb2dpbiAtdSBnaXRsYWItY2ktdG9rZW4gLXAgJENJX0pPQl9UT0tF
TiAkQ0lfUkVHSVNUUlkNCj4gICAgICAtIC5naXRsYWItY2kvcHVsbC1vci1yZWJ1aWxkLnNoIGJh
c2UgRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tYXJtaGYgYnVpbGQtZGViaWFuLWFybWhmDQo+ICAN
Cj4gIGJ1aWxkLWNvbnRhaW5lcnM6YnVpbGQtZGViaWFuLWFybTY0Og0KPiAgICBzdGFnZTogYnVp
bGQtY29udGFpbmVycw0KPiAtICBpbWFnZTogcmVnaXN0cnkuZnJlZWRlc2t0b3Aub3JnL3dheWxh
bmQvY2ktdGVtcGxhdGVzL2J1aWxkYWg6MjAxOS0wOC0xMy4wDQo+ICsgIGltYWdlOiAkQlVJTERf
Q09OVEFJTkVSU19JTUFHRQ0KPiAgICBzY3JpcHQ6DQo+ICAgICAgLSBwb2RtYW4gbG9naW4gLXUg
Z2l0bGFiLWNpLXRva2VuIC1wICRDSV9KT0JfVE9LRU4gJENJX1JFR0lTVFJZDQo+ICAgICAgLSAu
Z2l0bGFiLWNpL3B1bGwtb3ItcmVidWlsZC5zaCBiYXNlIERvY2tlcmZpbGUuYnVpbGQtZGViaWFu
LWFybTY0IGJ1aWxkLWRlYmlhbi1hcm02NA0KPiAgDQo+ICBidWlsZC1jb250YWluZXJzOmJ1aWxk
LWZlZG9yYToNCj4gICAgc3RhZ2U6IGJ1aWxkLWNvbnRhaW5lcnMNCj4gLSAgaW1hZ2U6IHJlZ2lz
dHJ5LmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL2NpLXRlbXBsYXRlcy9idWlsZGFoOjIwMTktMDgt
MTMuMA0KPiArICBpbWFnZTogJEJVSUxEX0NPTlRBSU5FUlNfSU1BR0UNCj4gICAgc2NyaXB0Og0K
PiAgICAgIC0gcG9kbWFuIGxvZ2luIC11IGdpdGxhYi1jaS10b2tlbiAtcCAkQ0lfSk9CX1RPS0VO
ICRDSV9SRUdJU1RSWQ0KPiAgICAgIC0gLmdpdGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQuc2ggYmFz
ZSBEb2NrZXJmaWxlLmJ1aWxkLWZlZG9yYSBidWlsZC1mZWRvcmENCj4gQEAgLTIzNSw3ICsyNTcs
NyBAQCBwYWdlczoNCj4gIA0KPiAgY29udGFpbmVyczppZ3Q6DQo+ICAgIHN0YWdlOiBjb250YWlu
ZXJzDQo+IC0gIGltYWdlOiByZWdpc3RyeS5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC9jaS10ZW1w
bGF0ZXMvYnVpbGRhaDoyMDE5LTA4LTEzLjANCj4gKyAgaW1hZ2U6ICRCVUlMRF9DT05UQUlORVJT
X0lNQUdFDQo+ICAgIGRlcGVuZGVuY2llczoNCj4gICAgICAtIGJ1aWxkOnRlc3RzLWZlZG9yYQ0K
PiAgICB2YXJpYWJsZXM6DQo+IGRpZmYgLS1naXQgYS9Eb2NrZXJmaWxlLmJ1aWxkLWJ1aWxkYWgg
Yi9Eb2NrZXJmaWxlLmJ1aWxkLWJ1aWxkYWgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uOTQ2MjNjMmVmNTBh
Y2EzMzBkZWNkZGY3NWExMTA0YzUzOTkwNDYxMA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0Rv
Y2tlcmZpbGUuYnVpbGQtYnVpbGRhaA0KPiBAQCAtMCwwICsxLDMgQEANCj4gK0ZST00gcXVheS5p
by9idWlsZGFoL3N0YWJsZQ0KPiArDQo+ICtSVU4gZG5mIGluc3RhbGwgLXkgcG9kbWFuIHNrb3Bl
bw0K
