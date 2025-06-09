Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C18DC5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 14:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFF010E3A7;
	Mon,  9 Jun 2025 14:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViEX5cVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8747D10E3A7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749477936; x=1781013936;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KwqwW+iiqE/rWr2L3JsM+4aCniRGvhbjhlhqONIYW0U=;
 b=ViEX5cVnWEs8mYu9irGCODHLUxtnzyQorY1KusN301/z0spphl8QlbBK
 S6axecCR9GdoV7mbeF5QZyfFUeS0UIXVLfJR3kwdDjYKHwvataXehVdDM
 0oWAlZB2qWt+K/r6+q1K22Wj9WjccBX+upPHMUzblZyUOk+82jZC0CVWX
 ykLVfmnfSO0JEmzio8Qv00cK22H2+X9AK7PLeLk0TK1a/iiJLHxWf+eGR
 lhdCxr4FRHk5/+duHTbSvC4/ksyN/sgt+lXOD+6XqVJnnkuVvRNZ0XlXB
 ccuoHQ14xWC2wfn8utb/KcVZfAtkuEa6+pq1FLj+UqzikVDFEslsx/WUA w==;
X-CSE-ConnectionGUID: l9C1bzIySlWYj7dHH7UVwA==
X-CSE-MsgGUID: VnGQoIaLSrCh5Q8Pq9tGiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61821985"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="61821985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:05:32 -0700
X-CSE-ConnectionGUID: n0/itTr4TnaZ03CQCFRZiQ==
X-CSE-MsgGUID: q+dp+2D8SrWIWBlombneaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146440749"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:05:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 07:05:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 07:05:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.51)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 07:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qeq665aWT3ZxGdR5+TlymfPV/nkgqGdISw9pF2wIbOuNtWfIRAmyI1+BipQSqTADsAmTp7SjRJRL+Z65ra6Gv+zvC3VP5LNAEexoCdlIaCShaq4eqjstJWMmi3n3yPETwt8/Q0ZkMBu2y2kepYw8y2OBJz7/mZLkDHDH7Uu1a/jZSkk9yW7gAgQ/CV9QmpwEmReRT710Ia/jCKr4ZvZH8pEAL9L8IJIpEL6shesgogIBzHIvmy1ih9vUjnP+t1suKWF01xElznnbsLAENnG4yt0BdjAL2DWznwiMoZWpC2wAtsOdtkT548NymB6KCYnltSePWRWmEaAORHAnBqNVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIqtmaiY6uf4pu9JsaWPcLsLO4buE7hGX3nO2QAuEBg=;
 b=X+Ex+J1LyGJ8y3/lKS1TZD8kxUAsdFXXd4JgHBhuwMaNd9yinjlJmcN+zBcbHLAngWkrfI+3qq7wgBAsuoWSbLDBNHluTziMqfiCT2fawqxddpCOS6siB/Pzn7XW3ncjqkQY4UK2O2wzob5fSqMwPQJ3WOTAdO3VLPLnELf1lngEiUPrgTGUtJwVyuPv53HM+Zeyplz7PyJzRkuExyS/3HXMgQtihSxBcP/aBs6CxHPlTWb+FLyAM5Vl5NIRbsghh6RtqNS8ocZX9zGCsabzuC7m9lawX5lhSCgD96hVdhMwBAt4aSvpe5etQ+v8n0ednwot2ZNS4+UUB2hOGwwVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 9 Jun
 2025 14:05:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:05:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot const
Thread-Topic: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot
 const
Thread-Index: AQHb1xHMerHA9B9DREuQIinR0LmI0rP6gxqAgABdCpA=
Date: Mon, 9 Jun 2025 14:05:26 +0000
Message-ID: <CH0PR11MB54442F0E7F39C295C1206D8AE56BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250606183519.78736-1-jonathan.cavitt@intel.com>
 <20250606183519.78736-2-jonathan.cavitt@intel.com>
 <LV3PR11MB8695DF2397145A212A0A54C3F96BA@LV3PR11MB8695.namprd11.prod.outlook.com>
In-Reply-To: <LV3PR11MB8695DF2397145A212A0A54C3F96BA@LV3PR11MB8695.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7747:EE_
x-ms-office365-filtering-correlation-id: 561e4c1a-fb27-49ff-4f8f-08dda75eaf78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BP962AbTGSaTiqtSdVyI0vdtSaEUlY+M3+Ks1tpsZ9YIUP0q3NcgafpDKSGK?=
 =?us-ascii?Q?XaZLblZllcvz44FUsHVz2lYAvOeuJPh/HXBnnUi2NIck4sqCR7qvgGNEfL8T?=
 =?us-ascii?Q?f9IfibkxnjJevXxr9756gw92lI/evZ9v8KaoGWZ/JvqltpjFMxtFs+V1vHis?=
 =?us-ascii?Q?nlH25PODa/RLo5STbJrxGOkMm1zbBZvuAB/c4XW7E5WVES9iOcpJQHgStuch?=
 =?us-ascii?Q?K17uVhT+rvzHQzmnmfoqs16aG4ms9AOmQcWhbbhjUc44eEYGbc7yVKxOoDvr?=
 =?us-ascii?Q?m2vBEi56PzBrT396pRuL6o0qbmqtzw224vhWRmSbXzI/CHLuRQv4+0dQRE5o?=
 =?us-ascii?Q?7mgpcLxcTOsgR3RYOm/wMIH4u5S6kt9Gc9Suj9rw6c5FNfSO55M+WPh328UF?=
 =?us-ascii?Q?omQul43eaFsajTGVeTucpw7nZB803oldkkFXgxpQYR1DwImXGkIEe0A4JLYZ?=
 =?us-ascii?Q?yrwJXxhok5wGdDP/8anG77mBAxF5Hy8eKURxzZ4GtIzXbFIvY68OJETJiq7y?=
 =?us-ascii?Q?qVLeha3E0gRtIQLzzxAmRievs6hGnIl1aXWiNtfYk3uBydTz+nZoQd5m0RHh?=
 =?us-ascii?Q?DEEATvJYa0UQrqhPFMsQTf8FoR89tp8AoP/ls9qWOSYZSOa0KDzrO0i2V9rr?=
 =?us-ascii?Q?DsYivoe1Dwd4aLBzblxWNCW9G6PoMNrFWqstzMDrdpoY4HRzrRHkD007wwhV?=
 =?us-ascii?Q?DXgu52T+MQTvz5eT1SklMFQm+f2P1wdNg016XjWk1SqSuDDV8+nNB1S+UBqv?=
 =?us-ascii?Q?mqFv7Nfaw3NmD6ufEo/eLaDMmK3O5T+nDALcwSM2K+I+yt3h/hEx7HXUSmN/?=
 =?us-ascii?Q?wl+GfRelXWHWSoQX8dYdoKSeUyDWLIrRsoLSgYiNyMZUlRiDM4dj5lFlZq5F?=
 =?us-ascii?Q?ngdoxyfqqgvm/fTrppQVxLl/bMSR2cV7A1hWEZKw8c0NVC+s7GnMJLW+6avk?=
 =?us-ascii?Q?KKkDC7Hr9QFRwWZzX7wrx5c46Dm2UPjdm5BtVd2yiZJYYBa3JhjGOcgqUPqY?=
 =?us-ascii?Q?sqtkNJHYI0b4iT6eSAqWdCBrKbrWz1x4nqzCHBGjsG88o2xfgR/x6wNeAyxs?=
 =?us-ascii?Q?ClLPPB+ZnyfsiP5aQXTv+0MO89s05Yp95/ckyaddQabn6dtnn8uT2SquWxal?=
 =?us-ascii?Q?1uCYDqxDzmCs2J3XFY/Uq03zQSBrr8o/PhZJMW28LvAbLyXuzojISsDsE0nG?=
 =?us-ascii?Q?0IQJhXx7VP3Wx3kttCM6pK7FOdPAN49FYTGn+3353NP3dhrf2p3sAPVQGEeS?=
 =?us-ascii?Q?11i2VMJqAQVLe8uEl5X9SxiqHenhD7YLUcHFD0LsGbM6L+1ErnurYf4Ld+Re?=
 =?us-ascii?Q?yT32Tj85fzrTAsKC8o8ehnAIHbVPzbr4yRsMhcuSxjWSFhxln8gBpWg/QVAN?=
 =?us-ascii?Q?1R3U6PagLtn+iHkN1gGRAZIsFc0jPirYPeQCq6dQvfGrfIxayJNoj9yU7I8m?=
 =?us-ascii?Q?270EOl1RUwL/p1pS6tUMz5woxjEMqQ77YsQdPXazZmz5mEaXoggry/dYtFKb?=
 =?us-ascii?Q?ux6Mdiwhi9dFNZE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rcJ44rwbczNMje1L3n83CiQykmgXNyNb59f7hfMedrMDiGRvatbuG+KWRjiu?=
 =?us-ascii?Q?2YV+fdAsnd0ftBRVoDz1huTNiqFJGwnfoVVFparL5sk2sybKXgmQ93sEs4rC?=
 =?us-ascii?Q?aNZk3pjRqixqVqH2RMYjw2LdOIBzg42ciaWc1EiJF9Y9HgklasOAV4XAnkOY?=
 =?us-ascii?Q?1OFOr9+xfurkZ9pkielNQbFjOJwErmLegCgUGVxQtaZISaJtl5HpCxN/d5na?=
 =?us-ascii?Q?rDz5TrxAdM7xlr5+9hNeqIWrNbF0nsS4E//g8nwZU3UxlfrDC9Jr/GWdv9iS?=
 =?us-ascii?Q?P9azLT7fdHU4vCNiGHdM7DnZ7o3BZSYKbIsmfUJfL4qRor/YOezbBYZCrQVS?=
 =?us-ascii?Q?JDFswgeAPaU8pl3HXw1jZuImjmgfI3e2+JYBhrq5Fhktqd3lIhtrlYWdFR3S?=
 =?us-ascii?Q?jhPpwW6ldK2iXXnLZ42pgXseyrPQpMIwSSMrxxtVOJQ8vVPfRHLLacKYCB8z?=
 =?us-ascii?Q?GDDLewn172F7qVRCdpHejV3HmMwdDUb9ehciJBL/9bAYxawD4biYjHy8l8oP?=
 =?us-ascii?Q?qBeTWSsvD7G8cBEImed1TzDwYmKUj+3km7xuRax3lnCmxerW9MDkCUZSBST6?=
 =?us-ascii?Q?yb1m7omaP7hCeWRH95/OUpwz6Jb6N40GlLW+oiz7JKB6Td7ejPeZOZTqxSEu?=
 =?us-ascii?Q?19pPc2Iee9TcXJW42hK0SnFWfvmqwM40l3AAZUCUZXJsakst5aYcWckvt4Cy?=
 =?us-ascii?Q?zTTiEe659NNypBfSmVrHT3Ts2aEQkT80kQxyWUd1wacbC+1PvVEfwNc4Q5Qc?=
 =?us-ascii?Q?Ml7twNUqoYL9sjVbkX3x1B/j9u54zJqFYp7eQtdQklfM5auZJBpGL3KlLrSf?=
 =?us-ascii?Q?D7gxZG3GFUw0pDFEAyrc7+dagkPBiSDy1m5I1v+lQg40vUlBpG0FfArNhuOh?=
 =?us-ascii?Q?aAu/k81foNllcO4lD2UVY1c3Jwhb2e3EYAjZZVGuBZTgcMxfI915ozMCGLoi?=
 =?us-ascii?Q?oNFghAfBaV4cDEU+/mYmdpAmVvApWzEjEMlQpdMVRlvGXCd6oWi6y+nD4c3v?=
 =?us-ascii?Q?+6jfS1JUF4IAmCTherS1ElLN+dCPrfzacPjwF6F+gKv6k9Pi9HY3+LM7UC15?=
 =?us-ascii?Q?RuwIkwSNCf3YA9BNOy6/s6ABfVYNvRq5g7jKIyRUeqZWASRSoIvGZrVE5ymP?=
 =?us-ascii?Q?8DVSFSG/UIjrpneMrYJEhS0tEOXh+9CIvIJ3XUCQgZDX9MiKUGXiK33sroPP?=
 =?us-ascii?Q?g+1MrN9uepdh6/6L7JdSXZufJ3hwD4EnDJggZ7pL3x6R5j07jNl5vBZoVXEZ?=
 =?us-ascii?Q?AFjdKs39LZEf2xU258JoQGwnosXE6bF+0OHoV7rb5vULUvARhw9mX82Gk99A?=
 =?us-ascii?Q?sXBnbjCVQNOVOkVKnVLaDN0moE7Eh8kY1dfE4cuN/X6yNXrE/Q1HvihRNrYI?=
 =?us-ascii?Q?vGjjGKvDuuqrN2q61FIE09kelbS/dG4/uNQwMIoHt4UYPW7a6Pq89+J8jMOD?=
 =?us-ascii?Q?k626nJXdHD399sdHy69chTY0F+KgPQKJWg/sphllQYpVLyIyI3FgYEW2QMkg?=
 =?us-ascii?Q?DUu//7LMbUwG0sjAJ/EN3xSz1rj+WsJG1Y5d9wZcaGh7HyCEkdcIjs8boz4i?=
 =?us-ascii?Q?xEF9PUFEfu8Ow40Gfp6tPeaUvZhBW7GQAggaOZLl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561e4c1a-fb27-49ff-4f8f-08dda75eaf78
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 14:05:26.8967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6RPzZsQN3PGqfvrLHd7xRxkQqVmWMW1mI/3GtpSmgs1UyvRX7KQuOsQSrziync7Aa9labF0haVfGY9rvvqBp/LA2ROF3Tc0JdH9dESCR874=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
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

-----Original Message-----
From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>=20
Sent: Monday, June 9, 2025 1:30 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop=
.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Ceraolo Spurio, Daniele=
 <daniele.ceraolospurio@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.=
com>; Dugast, Francois <francois.dugast@intel.com>; Vivi, Rodrigo <rodrigo.=
vivi@intel.com>; Harrison, John C <john.c.harrison@intel.com>; kamil.koniec=
zny@linux.intel.com; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot c=
onst
>=20
> > -----Original Message-----
> > From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Sent: Saturday, June 7, 2025 12:05 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; K V P, Satyanarayana
> > <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>; Ceraolo Spurio, Daniele
> > <daniele.ceraolospurio@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Dugast, Francois <francois.dugast@intel.com=
>;
> > Vivi, Rodrigo <rodrigo.vivi@intel.com>; Harrison, John C
> > <john.c.harrison@intel.com>; kamil.konieczny@linux.intel.com
> > Subject: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot c=
onst
> >=20
> > The pci_slot string is passed to multiple functions in
> > xe_fault_injection.  It is also unmodified in those functions, so shoul=
d
> > be passed as a const.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: John Harrison <john.c.harrison@intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_in=
jection.c
> > index 9fe6bfe351..7a14ad1729 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -228,7 +228,7 @@ static void set_retval(const char function_name[],
> > long long retval)
> >   * @xe_wopcm_init:			xe_wopcm_init
> >   */
> >  static int
> > -inject_fault_probe(int fd, char pci_slot[], const char function_name[]=
)
> > +inject_fault_probe(int fd, const char pci_slot[], const char function_=
name[])
> >  {
> >  	int err =3D 0;
> >  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> > @@ -255,7 +255,7 @@ inject_fault_probe(int fd, char pci_slot[], const c=
har
> > function_name[])
> >   * @xe_guc_mmio_send_recv:     Inject an error when calling
> > xe_guc_mmio_send_recv
> >   * @xe_guc_ct_send_recv:       Inject an error when calling
> > xe_guc_ct_send_recv
> >   */
> > -static void probe_fail_guc(int fd, char pci_slot[], const char functio=
n_name[],
> > +static void probe_fail_guc(int fd, const char pci_slot[], const char
> > function_name[],
> >                 struct fault_injection_params *fault_params)
> >  {
> >  	int iter_start =3D 0, iter_end =3D 0, iter =3D 0;
> > --
> Why to create a separate commit for this?=20
> Can't we add these changes in the other commit? I see pci_slot is added f=
or many functions in other commit
> "tests/intel/xe_fault_injection: Ignore all errors while injecting fault"=
 and this is also related to the same.
> Any specific reason to create this new commit?

Because it's not related to the other commit.  We're just incidentally fixi=
ng the improper usage while we're here.
-Jonathan Cavitt

> -Satya.
> > 2.43.0
>=20
>=20
