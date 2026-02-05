Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D8EA7945
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 02:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB4A10E798;
	Thu,  5 Feb 2026 02:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUXd5zpq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5C10E798
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 02:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770260127; x=1801796127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l1wZFMHytQyVMCOMoyeVtxTIhf1i3CqOPtHFSNEQI8E=;
 b=iUXd5zpqWpxwwdHhGJ0CvKdIKDQbHpmgfMSksT3n+7e2rrP/+zRBgxRK
 AnuUFZueiVXGd8w3MYVsyOKDit4s+tDGMOXRPkv+3mSyhHkYE8l9LQEXj
 0IhtEEmuUPFxV6hBxma9CjbWHmYEZwuOMRW7EizUMt7mvcJafhM5Hof2B
 lSw2SEcr9xcGbqqBQeE4NUC6UMk2QRoyp0Zmeo0UgTkCSPmWjzzZ5lSIz
 hthe5/FCkS7OhjEX+g3I+qG2NAgXSzGx0BjT6TuoJXqNaL8PGmuVFj1gW
 A+m24/hZbd8hytQYydfsfvVZXBEOrKUyeEns85wmLCMJr2G79odXubW75 Q==;
X-CSE-ConnectionGUID: 2r691TByQVKlkpl0+Bu1Wg==
X-CSE-MsgGUID: hu5qF4KcStm3lSgg6CA8Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71442489"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71442489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 18:55:26 -0800
X-CSE-ConnectionGUID: pQOwQcY2Q3C/0jaL6rZAFA==
X-CSE-MsgGUID: w4t7OABRRrGbyrY8ZaophQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="210384575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 18:55:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 18:55:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 18:55:26 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 18:55:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddOSX1JExqC6vNkr9u3Ytloh8bobn3IUIE5y4nLp4Z5Mg4r7cZbzTafS60SyOJQxg8SKwoZxSSpwR99MSCXivhTkVOFCAFyiYC54beB2Ygk2WXOMQhxYQgJRHx+VBA2WYgdPAdEl8twr1xB9XPpBAZZvhVCHZ/UDeE7I5g5kagjmkyoVqMaxxuZAjBZMetM45vS60NYQ1uXiol/xvRWc7HdWpIxBbP95pq6AsyAaS7bZ+zVPVVo5XYdzf0LRCS0Jl58JqfsJFH39OwGFiIGNrQAuBlYHVxBlULCPqgP0F4hOwRQMhiPPoHegXBrnCFetyluwLq2m+cFKWHDnIGizjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gb5b5vC5yS8/vVPYS66Gx8cF8ZdGWMQYJTQdrggNqhU=;
 b=M4i8f1yZ0gRYr0Q+M3gRFHo6M7bWDhDu0zET3ciAlYpqLW6PaPXvEKkC4+mooHR1y3j1KLouq0pqgOBGrWstzu9ZZBAzWAiJXOwiR5D5yJ4L6OCWXnH2JNpEVUt+vWDHb9ujwph8j6YQ5z6QwvFjPBrqH5iysdD9G7iuDw+J2pXqwrrUG+aPrIJA9t/R2DQnHwaGeQdwCr8LVbJYmRFx+doSiORtsoJ/oW/siH3f4j+/XXlP0CMDGJ2XVH/pkywzrMKk8Z1I05uTNd3N/X9FLtKKxrcmMRngely7D7S/M7zxIS+LaNTIfYdhcvIjbAHywG2/wi5gwE5AzcSHlxCUlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5200.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 02:55:23 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 02:55:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v8 6/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Topic: [PATCH i-g-t v8 6/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Index: AQHclfdxyL70to/TGEmZC7Szi2qhzbVzaauQ
Date: Thu, 5 Feb 2026 02:55:23 +0000
Message-ID: <DM3PPF208195D8D200FF6957709008CC21BE399A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
 <20260204171819.292327-7-sowmiya.s@intel.com>
In-Reply-To: <20260204171819.292327-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5200:EE_
x-ms-office365-filtering-correlation-id: 863de134-2d05-4b5b-9939-08de6462020f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?0Q8a9aZP2/eyp82XGs9AzF10BdbiS0lGx7T+EHQzr5iQFo3P8wovP7gNZcWz?=
 =?us-ascii?Q?6HCYSEmaIqMN/pxqKdvS4pwQ19tN9onzvAH6878dQeM47QaD0ZcBV0aRZerY?=
 =?us-ascii?Q?kMFb0liJn3AU2k0W0yA5EkuEWtFcnXeMpFudosaMwfDTlLR3Jy/vqmQgvMwd?=
 =?us-ascii?Q?TKVI04rUgBRz2bh6CB8WGzqx8BkTwtDpb2CXl3DCk0Op3mu3Vlb+PS25/g1J?=
 =?us-ascii?Q?GmH8Qwv+3HIgKuoOlID6K4msfybL7YUaUwT2Iqq/0fJLoLH3wXr14Teb9ngY?=
 =?us-ascii?Q?8e7GBhSX8c+OuLiWZLfrrZtymSWcx4h+otdssmz/tJc5oiD5Uh7EP8u2bqap?=
 =?us-ascii?Q?1f1uVKLPzRbqwYpjTXDTF7vWlT93xwjWWcyiud5JoWoAV+8L4Gl+s6/wS+NK?=
 =?us-ascii?Q?khDIFpWqwctemEyUgCT+9PGUMO9mQZ+OYWGrG5kMmDXooPLn17vKsws/NYlE?=
 =?us-ascii?Q?czLIcQrXx8AfXI7XVa/o8h6x99LT7YUVqZ1dD9XJ41o3ziSg/OZsiEktM229?=
 =?us-ascii?Q?LI1JW87RW/pQx1z1LjfdB0VG15VoCvx86NEUxPem/9GlrdvMdGir3O/PWopg?=
 =?us-ascii?Q?UNjQxoODuMbhUdW8hpbCgr8L+w6dfzdLEp2yj1wn3pOIsVPCuT+l5b+ICt49?=
 =?us-ascii?Q?1F9Bu2trLjLo/gWK61Xv8cobo3G20xctUkSAk/CC3jeFEyhW220hbvY7cA3c?=
 =?us-ascii?Q?K36Dn9p0fENDPBNQ+Eu1mOW3DTvpBdXanfK4HJrcPSFUnDG7abm0C8ALU2ET?=
 =?us-ascii?Q?ZEhkI6bdX2WZOmZOghCBoDP8wLRQjCCKN0oFpfFVkIN/glkzR+ZhLnMyqSiQ?=
 =?us-ascii?Q?vzAfxLUH3PkK6BvgTI29H7qsC8UneBuTHmN1SIIDBSPPn5Td3BCGGxBqjJrk?=
 =?us-ascii?Q?3KBDTNZc69ASaVcNVWiHL+mh0AzE9wzm8YkCytJ845gjvmSzgIM/lKPV1+Gm?=
 =?us-ascii?Q?LTfPG51QjXMhtsU4q7g4BmqymaeW5wMNeTrNDXGTQzdSlg6i1slLnj4T37kr?=
 =?us-ascii?Q?1Vu/2PTU5w+hLaRNJQq25Wtmg7UqX73euMQojAHCEaltq37sX1uxmaab4Rfu?=
 =?us-ascii?Q?6wzRc3JtsUE0JBfF3FivyP1uA/Ddukn52T0d4ulKVQqob57LMIUq4zQM9v2G?=
 =?us-ascii?Q?N7LSjMgJO5MIgBctTkLABSpXSuFbop5J+7cTqjO8Q2f7JdRMwI2JPg2P4zqZ?=
 =?us-ascii?Q?nf/xcy+H7IJ4lW97hLYBX04CdoyDk0G/TiCp6G1YVQp7WoRABTILv+1AXq3o?=
 =?us-ascii?Q?IshwVs+8G1OznmP6kdcHSJL7f3mUzd5bVdY2krIVNTqosSstdfEJNPQZhsy4?=
 =?us-ascii?Q?igiiANoDpISyqGtkpxKdRi0TBHMxnYxDlOetjA+j0ZrhuNB/8hHfwmNC40+h?=
 =?us-ascii?Q?SV3kRXOBosbZZ4Yn45FxwbKowEGf5RCRetnVSylwlIAxBFTDxh8rZWO8licC?=
 =?us-ascii?Q?mxzY95oU2RChty++aNCN+2Xz88p1AZqtK6MLnw4c1C57ienwocH0UnTn12Ge?=
 =?us-ascii?Q?pTvjQExEkqNutZVAaFe0O/eYY54m3DYlDKDE2/1ShN7d6QzMHSivTAIXMwJv?=
 =?us-ascii?Q?lkwjEcIrhOv7dJ9wydJsIf9scScrehgJCQG7VHEgFrkgTFqqi0V7mAro/ufc?=
 =?us-ascii?Q?U/XfJyN9AmnMJvBzK+nO/98=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WelMgZWs168DSX+5/UyxHAqc5/0/9nYLi2i9ghA2rGz0dCgzqATx3ZUGG7Y3?=
 =?us-ascii?Q?GkgJrShF5QZIMXA4R5hKoVzazM9rNLIJ1/zS8EDpkQFFUh5l5+ChbFsS90G/?=
 =?us-ascii?Q?EkJGF0NlxwQ1GF4PyfVKvSR+HltNdPDIzqzSrVubfaGBRzb1bICBZw0rEf4f?=
 =?us-ascii?Q?ncJ64bUK6XZ/HkAiuR5XKbWrGTslfutSvLxW50sYBEkIbFc9MLNJllFnFPIx?=
 =?us-ascii?Q?Xrk1EZsS0yXKZzZ38wblZRYne0d3pYPFcxCAQ1B+Fayj6SwlD7UPg2uVDLZm?=
 =?us-ascii?Q?5TmAK5FIrnKdEpQASMjoy41GI7VQ4igIAW1Hj13LbXb3GaLjErz4BE9K07sA?=
 =?us-ascii?Q?kbSq2bUIFN88WqGxFNVlXr+xIauj8iFH28ruO76CmbaNBh2x5iNNx5CmIMta?=
 =?us-ascii?Q?tIaWRAxJw7wYIw7lEllLz9+i29K3e6ku+zo7KzaIXea+ArmXLC++LsMPEZAj?=
 =?us-ascii?Q?TCLlNh+lyS4NW8oe/oo4jI8AuDQj8MvBxEPMivqTfTmY6yE/6g+hwqmRqz0B?=
 =?us-ascii?Q?ePmiAJQ8ztZt+Th2tDpE3UIUcIjjKQTUUlSxicEZ8kHDvgUC/y7miVotoWeW?=
 =?us-ascii?Q?QRGy5eLGtuAWc2lpLu6D2BOHJTKIrX1QjfCPNGMHzXW7nVRoS93NPezXdhhE?=
 =?us-ascii?Q?UCdrQVnKHcLiuFkKIhypaZAyxPyzXiYdHt7YEplNHOhi0tl2BFYxW+Klr2BB?=
 =?us-ascii?Q?YahXoiy0bzgjKTMtoB9Awag4ePa9jbE2DnxH6+dMrseGvlyE2dg5MHEX9BW0?=
 =?us-ascii?Q?2KPIT18/i1L3BbbHHDHBaPmlYZlOl1n7eJW2R2SypQyWmtqunbFIuBh7gfln?=
 =?us-ascii?Q?Ar8YUP4Ap7vXPI4XijES/8fNoFU8RQrgBmGClhtLjt+y6CW0pOkXpvP6zJ4U?=
 =?us-ascii?Q?dKoJi3sLbk5zwW/g3MZXRxT8401QBD4JYLsHwWxeE6aEmVt4JSH9z393LZCQ?=
 =?us-ascii?Q?x4DnGuGai3uUOun0ZlABV7gOTnZBqBJLon//01DcxtEYTdvDrt+8xUDzmRam?=
 =?us-ascii?Q?3zTdDpd5tEDHdcCWETtA6ofMDl2br3dSlGmM3v3vCyStePtGk1tiMhnmp2y3?=
 =?us-ascii?Q?poIi3CoYmkxNxeH7g+1AqA0KK3nwMkq6u22Af13WwK7FL1zDKXbUVymsxISC?=
 =?us-ascii?Q?qUhVCLMGu+m21+c73Rp0p56ItC1oi/xsWlkELsWxho01wEeVjzvTT8qjF/wG?=
 =?us-ascii?Q?FS3HPwFF+ToNEmkZtCVOgnxzoGitzcUPw2VDeVgWlDDTDxR3rd2dnJq9JJlR?=
 =?us-ascii?Q?hcKJBRxAA1aSNXsLj2npW6yaFxL2m9sqkce8UqZ3bsiwWa8bcWdzEOxOLQuy?=
 =?us-ascii?Q?I2gJD9NBtrFoHWUS1LkuZQckWOI0ULBKrA7+wlXKkWxX5L9YFVZZVc0PUs4c?=
 =?us-ascii?Q?tzfLHXXMWnc0wHTq4K+X78nifPlrXFMOmwRfMyjCnBO5q9wEQKAL4Uj6lTYb?=
 =?us-ascii?Q?iThF2aRm0ktswV/Fbprz9Ds86MoXyekrqa0VixZF4I9lv3r55gQo3BJWuUfE?=
 =?us-ascii?Q?PUJgOivQvNw7xUFfc4guAq1ulWC2K4LFsyF4v2HNId6rGsbajxCN/tyvgM4l?=
 =?us-ascii?Q?J1qIvWTdnGygI9ncge80Z5iTr+27tPfhUU4f4IjS+7dsXVPSC/oRg0lhQsxP?=
 =?us-ascii?Q?yXZ32xjywhOtQYHYeao84QPMjrVxasXqUdUn3l9iT4tsi7e/ukAKVQrZoVP9?=
 =?us-ascii?Q?htuWDKAy3zJGBfmz0gCCZDxRZJoLrhHckQTxEDpqW/gwsfx4JRWaiWTaW8AJ?=
 =?us-ascii?Q?wop+qnsDoQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863de134-2d05-4b5b-9939-08de6462020f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 02:55:23.6748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07ntniUmIj5VLxcYmX3gHCPB6a30ALk0Qn5y5tI7vB6bzLZqK1+8j0rSGzEJzPw//bEkxZYHsLRr7GOWIS8q6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
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

> Subject: [PATCH i-g-t v8 6/9] tests/kms_writeback: Remove unused invalid_=
fb
> parameter
>=20
> Remove the invalid_fb/output_fb parameter since it is not used anywhere i=
n
> the test.
>=20
> v7: Remove invalid_fb in a separate patch as per review (Suraj)
> v8: Move this patch before refactoring writeback-fb-id test (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_writeback.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 63917bf4f..0c423d58c 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -300,7 +300,7 @@ static void test_invalid_parameters(igt_output_t
> *output, igt_fb_t *valid_fb, ig
>  	}
>  }
>=20
> -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, ig=
t_fb_t
> *invalid_fb)
> +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
>  {
>=20
>  	int ret;
> @@ -701,36 +701,16 @@ int igt_main_args("b:c:f:dl", long_options, help_st=
r,
> opt_handler, NULL)
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
>  	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
>  		igt_skip_on(data.dump_check || data.list_modes);
>  		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +		writeback_fb_id(output, &input_fb);
>  	}
>=20
>  	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and
> invalid options");
>  	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
>  		igt_skip_on(data.dump_check || data.list_modes);
>  		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +		writeback_fb_id(output, &input_fb_10bit);
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

