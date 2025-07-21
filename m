Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E73EC87FC5
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 06:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9901710E478;
	Mon, 21 Jul 2025 06:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMr6KErY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5122910E478
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 06:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753079581; x=1784615581;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rs3G65gEi+R5HxJ4nc/6EH1fPeIgHPB1i83Art+8S60=;
 b=IMr6KErYRQreY9i3L7vRZTdWUa3o7PzrDO7SgAPQQcVfRAI2VmcE9nP/
 0tJthKNSa9R4qzjvsWBIO+JLsXBwLCVWGTmH6805NeWV6m9mQgIJ64FR4
 QViWovaB2UfvGE6OK1Ki+X59mzrTQhj0zSaVg+sSYCNghTYia2yZlqeSl
 xedoWYvmCxanKl3lQJw8DjxSHYA1rkyg6npl8xaxyrccu+A3JgMlZ21E1
 Rn7db4dDgjA7zTW2fedwNB01+AIqrR0Sbv/hVHHksRR11szlNnR4R8z9K
 8ZIRKGnKX14qEa8xLN8O8WSvq4e2LnkgYhFIv3InurewOseDbthWV3HZM w==;
X-CSE-ConnectionGUID: 35f5gbEYRjiiiA2Bfn6ysw==
X-CSE-MsgGUID: 76FAcEJXR0uiCgTgegGp1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="65976513"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="65976513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 23:33:00 -0700
X-CSE-ConnectionGUID: qOkVyZ1+Rci3sYT0W4KblA==
X-CSE-MsgGUID: r2wb748bT36UTASDk/Z9lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="159187275"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 23:33:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 23:33:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 20 Jul 2025 23:33:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 23:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6QcreNFqVZiiYvS3tTb2CcSFu430abE3CxTQ6z4eIZc/Ti5nL4AIQ7vM6T4vVG+eQiiDBBOkmINoG2FxiuJ21g0a0ohOLM44Qr2mdH9e9ecHDiROsyf3IuEHiEnjBITKZh8OkcifYpKSQ5pW6ueU1YXbBgsBf/vrXB0S/AjYrcFbXlLq0GmyWd2BRSDjo7xWk0jzZb3ZClh0MGbSnj+4wk3vPnvkblwGEniDBzROrdDAHcw2eiXhEfDCwrKLR4DmCvFuXj8J46Uwvf05vCzdZ3hR5k+JR/pdmVl8Aq+7yciL4fVUeUXXuWMUyargOPqibrzGt6SWP45L7oC8zdlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs3G65gEi+R5HxJ4nc/6EH1fPeIgHPB1i83Art+8S60=;
 b=epWaQ2nZmeh/DiV1t9+qpA5/OL08sqgpucRZnerXvwHGqAVuP2T0t/2eJXDus0dY9OtknFui60OxwMuZBltTwiz4vFDmwS1bcQMDyFvf9YYAA0c/L3KBCQzf1v0q1V4SLQCLDbAIkkhZ0WFRDCkDoown2KyBBmx8YMHYPQA2ppl5/MrJ3ChbeWU2XnBkg/touLvkcfUvpPx8bKnUHLoiLj4QqSrz7jtqTQ2ZgMzXmwfILhukV7e8DBVk9A9zLQ5+Dpz3UFtyiPM9vnTICeTccC7JijWR2fxY5QjHW34++5dh9ECqWRPgivBnOkvW4/ijkeDhoKGXnnPfxcCr3bI6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 06:32:56 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%5]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 06:32:56 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Thread-Topic: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Thread-Index: AQHb8WkQNyZi1yMWaUqWIssd3613FrQxhvQAgAqnYWA=
Date: Mon, 21 Jul 2025 06:32:56 +0000
Message-ID: <DM4PR11MB63121EA73D4E3A8BFDEB3C89905DA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250710070527.188720-1-jeevan.b@intel.com>
 <20250714114608.p2i7psegc5x236r7@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250714114608.p2i7psegc5x236r7@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH0PR11MB8215:EE_
x-ms-office365-filtering-correlation-id: ea0759ba-e391-46d2-4da2-08ddc8206dd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R2NyU2ZxSFNUdmV5M3pyRGZVNEpBbWpkeEVNQUF1ZzB3bkd5ZlUxQWZHYTg2?=
 =?utf-8?B?alZmbEtiTjlxeVZLWnJ1MmZNQ3ltdG9keUF0M2JlTFExR3pKWVAwZnBJNXVV?=
 =?utf-8?B?NXRmcWhqR0llQzBaaCsrUDFKenY5MHlwSGx4MmlpLzZ6Vy9YVmp0T3BubFV0?=
 =?utf-8?B?UHJ0dXJPdng4VlVmZ1pYVGdJREJJaHlwS0czWVRoTmtIMUs1Sm1IbWxGNTNn?=
 =?utf-8?B?NHB4UzlVQm10Q2xrUG9nMGF4VTN3K0NEVzJNNTUzWUp4R0ZPZEV5a2thdlZi?=
 =?utf-8?B?b3YzV0JUNFkwaE81YkF2OFNITTdmNEkxbG4wanpmSC9kTFI3REJYOXNsMlQw?=
 =?utf-8?B?TmNTN0s5d0NnR2YyTTFoZFF0NWhzZnFPQ2xVOFFzK2Z1eDQ1czcwMEFjTmp0?=
 =?utf-8?B?R3FKS2lsOGhTb0lhV2tEL0J4NU1oSGlheUVpcGZOeGF2djlRZGtyVEJtMUlK?=
 =?utf-8?B?eFBrR0ZzVi82RzYvTzZKaHpkWWxoVWJuaXZmWWgxOGhsOG1BSTRHWGFTUmh2?=
 =?utf-8?B?S29WWXlDY0h4aEo2eXIyVWVhNFRPUE1JZWlDQmVDbmtPcUliUVQ0QkdTb1RF?=
 =?utf-8?B?b2ZWTmFIY0s3WFYyUDcyeCtOWFJydjdKREp2cVVyelpVTndnNXFjZmxuUzcy?=
 =?utf-8?B?NGlzdkhYMUg5T0Q1SnlxTnFTelpCWTBSODFueVhRYVM2QzlLZW5seGlVTGN4?=
 =?utf-8?B?NE9hS2FyWnpCK3hwd2xva2ZPcENKUGVIMWdQMXp3T1IxUTFRMVRzQ2ZpbTBZ?=
 =?utf-8?B?Nm01bUdSemVZRmtkeXZPaE5YSEZXYzdsMDZwSmthMU9wSWNpNWZOWEF4bDJ6?=
 =?utf-8?B?VEljdVJ1UW5IYnYvbXdxY3NNeGtTa1lseUg2eE9iOE5FTVdpdGI2Ny9NS1B5?=
 =?utf-8?B?MFgyZkV5dFNBSFhXNDdhNUlLYk5kV3pIQnVnRGk3bHJtZlJhMzQ5ZFJxWUVz?=
 =?utf-8?B?ZHJ6VklHZU1HRFkyOGkwWWtDbzJvRklyMXppNkJoQjNBSlVOZWsxT3NVRWdE?=
 =?utf-8?B?SytqQnozZmVpd1liKzRrTkx4WTFmYS9peXpoNWRLejRYbm5EVUZQRGlaTTJT?=
 =?utf-8?B?blRCL1RnTEp6Q1VqV2FvYVNuOTgrdGlhNmhuYllLdXBULzRUVHNCcU0vbFlO?=
 =?utf-8?B?TTBKNDJZK0JhMjR4WFFaZHFvNS9zdld6UTRqQks0dVRrY2VMSEFCcU52Rllv?=
 =?utf-8?B?WnQ2UHl5d0t6c29oZkErck9NaEdZbDRGdnc5cXd4eTNhY3Jqd3RXM3cvU24w?=
 =?utf-8?B?OGpNdlp3V1FQcXhMTDBRUFJ6Wm41Zmt3dHJFeE1wWE5weFI4Zks3TGlrd0VS?=
 =?utf-8?B?RTIxenFVUlNxejZpMHB1Z050cVUya0NSMlhtc3dsYlMyU0Y3Q0xhMmN6OGx1?=
 =?utf-8?B?U0lTLzdRTm5yUFBSVWlBaCsxZUpiWHk1NWdpVlB0emVxblc4Z1IvTG5BRElI?=
 =?utf-8?B?aWFDOTl6bEJ1Q3VSR292ZkY1TFVzck5mRlo5c1JkR2Y1dGNUZVBpZzZUSmRy?=
 =?utf-8?B?d2lYYzd6YW5qQisralBVVGxrY0o1eWdBYzE4OTk3UGdDQk1QbUJiOGdXMkJj?=
 =?utf-8?B?VDhjRi9RMHhkNTBnTTBWMGVVZWdnSEtmVFh5YUpueGRBN1QvSU5yck5hU2pW?=
 =?utf-8?B?UTFYS0oxLzhLM0l1Z0lrTWRmUXRPWndXSEpSZEU2NjRZN0ZLaUU4M2w1c3la?=
 =?utf-8?B?OHZ2dmtTRGI2TC9OaG1VMnM5RUNCSmpDNEx3OU1pRkpidWtKUEdqZGdzYjFN?=
 =?utf-8?B?WHBkY3lkT0xXU0JoYmtlRENnOFIvZUFzR3RIZXRwY0U2RE9LNjN2TXpUN0lD?=
 =?utf-8?B?T1BmY2pxUk5qSVpTNEJiUGFvb3dyQ01NK0w5US82YWp0T2VqaVRIdU8yQkVI?=
 =?utf-8?B?dDFIeGJoQ3JkeVZ5dWlUWUI0K3VncGhoVWlHbVkrUVVWMnJBN2lEc3VMSXBM?=
 =?utf-8?Q?rHHeNS1ZU6U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmpydnB4RXEwcTA4WGc0NzlORTFOQUdyZnMrbVE2cEhSUFlXbVRhZWtnMlNF?=
 =?utf-8?B?ZVNPUExxMHptMHJuTG1TZlI3WmFnL0poVHl6VnlWV0V5dGVBK1d6SkdoQ0l1?=
 =?utf-8?B?aFArVVpIVjdvWEhKZnhySGRKb3lySyt2YTAvWHhWTVBFY1ExaXIzSE1OQnFs?=
 =?utf-8?B?RGU0VVVadm45MGdJTzd5bmVWRVpVM2p5UmYwRlRhaEU0MW15NEVBemtVcU52?=
 =?utf-8?B?UzFmRkJCY2pvMExpdUFGbkQ5VXhGNVo2Z2U3eWsrK1UvTWlLWXB0amprdTJD?=
 =?utf-8?B?RFNXYzJTTG5MMkNuNkhqckdnRU9GMUg1MjNYeSsvY1J0MnFJK2lnUWFiZ3No?=
 =?utf-8?B?R0NqNzlmMi9wVitHWjFKeUhReS9OdEpabmM2R3dZdUYreUxnS0FsL21WMkhj?=
 =?utf-8?B?QmE2UUQ4VHgxTEVBL29RaGtya3RUVGcyYzZWZWk0WkEwSDEvcUpXZWgxanBz?=
 =?utf-8?B?TWJoQmpRSlZDN2VkaUViWWNzT1VqSlhDQzczVms3Vnp2Q2pvenBaY1kvQnhN?=
 =?utf-8?B?MnJ0TnNMTWF2WXdzTFk0UzBjWStoN043Z0NLQ0g3MmhMN3c1OVhXNkdNdnph?=
 =?utf-8?B?TE8yMU9ldmlZdHNUbjJpODVFQnVQYW40Mmx1T2JJNmhEVTNLUE1hekJueHFU?=
 =?utf-8?B?bk16VGhtZ1RqUUVSWjNrSzZsSWw1djRmMldkV3lBTGcrZGJ2NE90aGo3OGlo?=
 =?utf-8?B?aGVRdHZzSjhOK3JtaG9DZGdvZFZpQk10V0RZMHluUlFPWFNFcXZqZHpQejBr?=
 =?utf-8?B?T2dIcE5raTNTa0QreklCZ3VzVVV0ZEZ3emhjbmtCUU9DZFFBOGVpVUhoeERz?=
 =?utf-8?B?dmFMRnNFV0ZuUUFiaWRsMUtHMStUdmtaY3RpUWZpT29RYzJDU2FZdS9UbzYw?=
 =?utf-8?B?WU9ob3Q2Ukw4TGFmMldlWTRCamRSVFFKK05YQ01MaVlIRmdIck1xWUdUTVVV?=
 =?utf-8?B?cW8ycVFacThWSitaaG85QWU4Q3hMRmVySCtYYndjWjlMSE16Y0RIZXpKSDhH?=
 =?utf-8?B?ZFRCdkJYMzJrWk9KL0hjUlhWKzdRc3dPODA3VDAxbmlHNEFPUFY0N3EyN1I5?=
 =?utf-8?B?ekswTHdvU0lWOExjcnIrSUJPdmE1ckpOS041eDZtWmJaaTk5Z0ZyK2JwZDRy?=
 =?utf-8?B?NHVIbU1CbVFpYVFndzN0SlhFOUYwTzhiOXVOaW03azJWaXhVNmZOZUIyQVdl?=
 =?utf-8?B?NFpZRzJVVERZWUk2aktndkR0VHJSUWd1VW1XdnN2bnJTUFdNVm9qaFB5cHV5?=
 =?utf-8?B?RVdQU09BOEZaLzhJUTNBQS9EQ1lqc2E4aE1iOFhjeHhEVDhWNW9FK1hDYWs1?=
 =?utf-8?B?WnUyWUxEL3FlWm1yMFVmQ3FTK05pdzV2cmN6YXgwWHFuODFySFVDb25rRFRI?=
 =?utf-8?B?cGZ5ZTBESmFmT3JNcE9ETE5jeDVHdUU3Q0FKNXFnOUU1RzNFNkpvdFBxeC90?=
 =?utf-8?B?RWM5WEd5aGtZVk0wbEFqTXN0WDkzUmxpZzg0Mi9MWlltN00yWTl3MmF0bEtj?=
 =?utf-8?B?Q2w5c3NVdTRLYm55NUNUQmpNNzArMFAyV3pCRjhnK1orbkJDUm1GbExLTFh5?=
 =?utf-8?B?MmM0UFd5K0g1Z3paWnVlc1BRNmo2ZGRnV3A1aTlKcy9NUHJ1azJMQmF2bjQx?=
 =?utf-8?B?RExkQnlnWGxhWE9WaTEyeFNyb21jZ2hCY3d5TnRKaXhsR01MQkoyQTQzeUJY?=
 =?utf-8?B?OE5iRHBzTWhkYS9BbWpVbEErU1dzTmpPb2tzK01HNTlJZDVhT2g3bzV1NnQw?=
 =?utf-8?B?Q0xqUkM2YTJJSEx5eEtQVW8yclhOazNjS2xoVzV3VVZkYkd5U21xeVR3ZmYy?=
 =?utf-8?B?dlhDNUFHbWNsaTM3YzU2UlZ6dTduYWEyam9iRTB1elBhbCs0dzZQVVlTVHFl?=
 =?utf-8?B?dWwrdE9ranNsMXpVMFpoWEtidHJ5RTB4WWdQN3pvckVVWFVYUWljWFQvZkpM?=
 =?utf-8?B?Y0hlaERWSGIxUjNYSVo4ZThKeGhKdC9LZWZEQkxjR2NzaEFydUlnOURDNnBx?=
 =?utf-8?B?ayt5VjRnM0g1V28zKzdCVW5WSlJabGFjdk5qdUNEOExva1YybHZzZW4rYmEz?=
 =?utf-8?B?TkJ4ak80ZGl4ZkxhVkRlRVJhVnlmWXZCcDNwVWNqQVJGQm4rbG5SenpyWHM0?=
 =?utf-8?Q?CC2rtY4ye4fL9H2/S587iNTrW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0759ba-e391-46d2-4da2-08ddc8206dd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 06:32:56.3585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CW35dglF7CJKDpq/P29Q8m4wkpqVAMqOpi6xeDTXSN+L+z7J5X1ShjjXAAmlj0EuOqjQOHKUB8rGwq1crXuTZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYW1pbCBLb25pZWN6bnkgPGth
bWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxNCwg
MjAyNSA1OjE2IFBNDQo+IFRvOiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT4NCj4gQ2M6
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBCIFMsIEthcnRoaWsgPGthcnRoaWsuYi5z
QGludGVsLmNvbT47IFNoYXJtYSwNCj4gU3dhdGkyIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMva21zX3NldG1vZGU6IEZpeCBjbG9u
ZSBtb2RlIG1pc21hdGNoIGJ5DQo+IHByZWZlcnJpbmcgZURQIG1vZGUNCj4gDQo+IEhpIEplZXZh
biwNCj4gT24gMjAyNS0wNy0xMCBhdCAxMjozNToyNyArMDUzMCwgSmVldmFuIEIgd3JvdGU6DQo+
ID4gSWYgYW4gZURQIGNvbm5lY3RvciBpcyBwcmVzZW50LCBwcmVmZXIgc2VsZWN0aW5nIGl0cyBk
ZWZhdWx0IG1vZGUgZm9yDQo+ID4gY2xvbmluZy4gU29tZSBlRFAgcGFuZWxzIHN1cHBvcnQgb25s
eSBoaWdoIHJlZnJlc2ggcmF0ZSAoSFJSKSBtb2RlcywNCj4gPiB3aGljaCBtYXkgbm90IGJlIGNv
bXBhdGlibGUgd2l0aCBleHRlcm5hbCBkaXNwbGF5cy4gVG8gYXZvaWQgaW52YWxpZA0KPiA+IGNs
b25lIGNvbmZpZ3VyYXRpb25zIGFuZCB0ZXN0IGZhaWx1cmVzLCB3ZSBjaG9vc2UgdGhlIGRlZmF1
bHQgbW9kZQ0KPiA+IGZyb20gdGhlIGVEUCBjb25uZWN0b3Igd2hlbiBhdmFpbGFibGUuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICB0ZXN0cy9rbXNfc2V0bW9kZS5jIHwgMTggKysrKysrKysrKysrKysrKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3NldG1vZGUuYyBiL3Rlc3RzL2ttc19zZXRtb2RlLmMg
aW5kZXgNCj4gPiA0ODRjM2E5NWYuLjQ2MjMxM2U1YSAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9r
bXNfc2V0bW9kZS5jDQo+ID4gKysrIGIvdGVzdHMva21zX3NldG1vZGUuYw0KPiA+IEBAIC0yNTIs
MTIgKzI1MiwyOCBAQCBzdGF0aWMgdm9pZCBnZXRfbW9kZV9mb3JfY3J0YyhzdHJ1Y3QgY3J0Y19j
b25maWcNCj4gKmNydGMsDQo+ID4gIAkJCWdvdG8gZm91bmQ7DQo+ID4gIAl9DQo+ID4NCj4gPiAr
CS8qIElmIGFuIGVEUCBjb25uZWN0b3IgaXMgcHJlc2VudCwgcHJlZmVyIHNlbGVjdGluZyBpdHMg
ZGVmYXVsdCBtb2RlDQo+ID4gKwkgKiBmb3IgY2xvbmluZywgc2luY2UgaW50ZXJuYWwgcGFuZWxz
IHR5cGljYWxseSBkaWN0YXRlIHRoZSBjbG9uZSBtb2RlDQo+ID4gKwkgKiBhbmQgbWF5IGhhdmUg
SFJSIHN1cHBvcnQsIG1ha2luZyB0aGVtIGluY29tcGF0aWJsZSB3aXRoIG1vZGVzDQo+ID4gKwkg
KiBzdXBwb3J0ZWQgYnkgZXh0ZXJuYWwgZGlzcGxheXMuDQo+ID4gKwkgKi8NCj4gPiArCW1vZGUg
PSAmY3J0Yy0+Y2NvbmZzWzBdLmRlZmF1bHRfbW9kZTsNCj4gPiArCWZvciAoaSA9IDE7IGkgPCBj
cnRjLT5jb25uZWN0b3JfY291bnQ7IGkrKykgew0KPiA+ICsJCWRybU1vZGVDb25uZWN0b3IgKmNv
bm4gPSBjcnRjLT5jY29uZnNbaV0uY29ubmVjdG9yOw0KPiA+ICsNCj4gPiArCQlpZiAoY29ubi0+
Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkgew0KPiA+ICsJCQlpZiAo
Y3J0Yy0+Y2NvbmZzW2ldLmRlZmF1bHRfbW9kZS5jbG9jayA8IG1vZGUtPmNsb2NrKQ0KPiA+ICsJ
CQkJbW9kZSA9ICZjcnRjLT5jY29uZnNbaV0uZGVmYXVsdF9tb2RlOw0KPiA+ICsJCX0NCj4gPiAr
CQlnb3RvIGZvdW5kOw0KPiANCj4gSSBtaXNzZWQgdGhpcyBidXQgaW1obyAnZ290bycgc2hvdWxk
IGJlIGRvbmUgb25seSB3aGVuIHlvdSBhY3R1YWxseSBmb3VuZCBmaXR0aW5nDQo+IG1vZGUsIHNv
IGhlcmU6DQo+IA0KPiAJCWlmIChjb25uLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05O
RUNUT1JfZURQKQ0KPiAmJg0KPiAJCSAgICBjcnRjLT5jY29uZnNbaV0uZGVmYXVsdF9tb2RlLmNs
b2NrIDwgbW9kZS0+Y2xvY2spIHsNCj4gCQkJbW9kZSA9ICZjcnRjLT5jY29uZnNbaV0uZGVmYXVs
dF9tb2RlOw0KPiAJCQlnb3RvIGZvdW5kOw0KPiAJCX0NClllYSwgc28gdGhlIGluaXRpYWwgMiBj
aGVja3Mgd2UgdHJ5IHRvIGZpbmQgdGhlIGNvbXBhdGlibGUgbW9kZSwgSWYgbm90IGZvdW5kIHRo
ZW4gd2Ugc2VsZWN0IHRoZSBtb2RlIGJhc2VkIG9uIHNtYWxsZXN0IGNsb2NrIGxvZ2ljLiANCmh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy8tL2Jsb2IvbWFz
dGVyL3Rlc3RzL2ttc19zZXRtb2RlLmM/cmVmX3R5cGU9aGVhZHMjTDI1NQ0KCS8qDQoJICogSWYg
bm9uZSBpcyBmb3VuZCB0aGVuIGp1c3QgcGljayB0aGUgZGVmYXVsdCBtb2RlIGZyb20gYWxsIGNv
bm5lY3RvcnMNCgkgKiB3aXRoIHRoZSBzbWFsbGVzdCBjbG9jaywgaG9wZSB0aGUgb3RoZXIgY29u
bmVjdG9ycyBjYW4gc3VwcG9ydCBpdCBieQ0KCSAqIHNjYWxpbmcgZXRjLg0KCSAqLw0KU28gd2hl
biBhbnkgZURQIHBhbmVsIGlzIHByZXNlbnQgd2UgbWFrZSBzdXJlIGVEUCBnZXRzIHByaW9yaXR5
IGFzIHdlIG1pZ2h0IHBhc3MgaW52YWxpZCBhcmd1bWVudCBpZiBlRFAgZG9lc27igJl0IHN1cHBv
cnQgdGhlIG1vZGUgdGhhdCBpcyBzZWxlY3RlZCBieSB0aGUgYmVsb3cgbG9naWMNClNvIHdlIGNh
bGwgZ290byB3aGVuIHdlIGhhdmUgZURQLiANCg0KVGhhbmtzIA0KSmVldmFuIEIgDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgCS8qDQo+ID4g
IAkgKiBJZiBub25lIGlzIGZvdW5kIHRoZW4ganVzdCBwaWNrIHRoZSBkZWZhdWx0IG1vZGUgZnJv
bSBhbGwgY29ubmVjdG9ycw0KPiA+ICAJICogd2l0aCB0aGUgc21hbGxlc3QgY2xvY2ssIGhvcGUg
dGhlIG90aGVyIGNvbm5lY3RvcnMgY2FuIHN1cHBvcnQgaXQgYnkNCj4gPiAgCSAqIHNjYWxpbmcg
ZXRjLg0KPiA+ICAJICovDQo+ID4gLQltb2RlID0gJmNydGMtPmNjb25mc1swXS5kZWZhdWx0X21v
ZGU7DQo+ID4gKw0KPiA+ICAJZm9yIChpID0gMTsgaSA8IGNydGMtPmNvbm5lY3Rvcl9jb3VudDsg
aSsrKQ0KPiA+ICAJCWlmIChjcnRjLT5jY29uZnNbaV0uZGVmYXVsdF9tb2RlLmNsb2NrIDwgbW9k
ZS0+Y2xvY2spDQo+ID4gIAkJCW1vZGUgPSAmY3J0Yy0+Y2NvbmZzW2ldLmRlZmF1bHRfbW9kZTsN
Cj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=
