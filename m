Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22932CCD193
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20CB10E089;
	Mon, 20 Oct 2025 16:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jup7fbSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301FF10E2B0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977612; x=1792513612;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wL7r4qtOIFC992/v+9PPhMrkoWNZuCRmoSqMF2clQ2c=;
 b=jup7fbSWkN51zoh+yguKPEopAarG+jh0zWQcisMwAtOusHVWlmpwvH/n
 MspP4vDfhlWJABQAQa2L3gz6Mi9RnhmzlrGuns54GUm3dcejiIY+ltOuQ
 F/J6KU6WuefTkDKdAIg9WVuNUP5/evNb6iqcpo4y9cW2iy+B3NjnwIxsP
 gg3rSDJ9N19SIar7YFgciLJW3lUfy6Ara856qQ6C8ifFkCmDN5Cguj92D
 6e3K7oqIi8GCNzu9udtu/MkRuvjUxImH/zBL4R/v5z+EFyQEnTnH042Xs
 Qihzlp4B9mSCUghg4AEeP4PakLXSwnmyndelkjxqslnR+hN14vxzdkRKX w==;
X-CSE-ConnectionGUID: bRjaK5IdRtmUndTKkGRfOw==
X-CSE-MsgGUID: 4FM/56s+Qd6geK/8oCZOjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74214565"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74214565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:26:52 -0700
X-CSE-ConnectionGUID: Kz320X7aRaeb/C4oRs5tPA==
X-CSE-MsgGUID: t0PXmRSkRDKLaGm1115iiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="184138174"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:26:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:26:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 09:26:50 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Htk5FgYmoZSZGpY92z+cyhhMlzCTnT/JyZMwGvbQZ2gSucRn5lpvdCUk3BUKSL4G1eIZlwTh1QHIcaTfxaW9giaAbvXAkm1gva/9a4KcthFMGuCbR8LIK91xqtSwxp4HCyQpYx+lVAgK6m6fWqusF6cqey03QzV21VFiy+H7YBQmnsPkA/sRi1vRw5kw0Fdmk5aGEG1PehsdyfMyADuricUT4jWGbeUcaHyRpxEQe9SBtVe2CDG8EbUTDGXItNMSkS3D60cOSYzc9g8lE8yh6XIIw/lJj3MHITyj19z8NgrU+OII1LI62KBKYw68CAWOX/2vJLnzzUpejQZKKH+wig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRn2P8/fwxu0kxyh19O1koV1kEqBSmVEif7EKyuusVw=;
 b=b7Y/SK+V+o9Dxzj+UWSXWYjzlaDvAx21YHkJE/LJ/ASE6Zv18u1/U+1aTAKykiT9XXLRJtZZinXHHQJbyqqs043vURXUnrj1S0QeUnySwnVhQ0YB40aNrwpYKWA4ZMCrgvAa+lQn3PotOR7lZmqozSpn6rw5Fa1kcmNQyxmpR7sTgg80T2W7jpZ/X49XooblrR/W34TprhKhFf1ARmZxLl6+dEO64s2aYR7Ldbx3fZx/t+QK0tZEPGAnwIkP/XMvVJRcO8r4Vc6vIoNBxTkgqNiikFmXp8Ww0LhGk0TexaHdeWBOuCeum4z1VgwFFWeXn1cCWnWd7dYcYPBO7w4zNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 16:26:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:26:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/3] Multi-tile support for xe_sriov_flr and other MMIO
 improvements
Date: Mon, 20 Oct 2025 18:26:30 +0200
Message-ID: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BN9PR11MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: 290ccf52-d3be-4c0f-fea7-08de0ff577bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VC9SRHQwcW9BMnd2WUJoS2wxbm9BWWhPc09aMjM5WXBULzlnWldpR09QSHB6?=
 =?utf-8?B?eFVlYkhRTjdSQjdVdFRtMktmMVhkWk1jZmZJc0plNUExV29XWXY3TWNyNU9P?=
 =?utf-8?B?aVVWYWVmN2lhTFRrOHRlTjhIMnRvVmxKeXNRaXVubU5DaG56aXhORTRxc0pz?=
 =?utf-8?B?MUFDT3dENUppUnpkbkczeXB1c3MwaVNtSCtwL2xTekMzcDhtRHFsc1Q2ZFl2?=
 =?utf-8?B?MG9FNnhIcTR5bW1UTlpkQ3k3OHdUUXlYTk45dVNuRkFhcXlzUjU1aGJjNHFz?=
 =?utf-8?B?ZDF6ZS9BMDhhYnpyenNNZE81OUphSjRGeG5hOFlJd1JOY2dQS1EwNnI5NWNi?=
 =?utf-8?B?Si82R2p5V2FHUXFhaDhBYWJkMkxKR09iYVVwV09CRnU5bHdGUXJ2YThOS09q?=
 =?utf-8?B?blU5TnRtL2hmVnlpSzUxb1lwZFlYSUREUjJPVng3Lzc5UldIMTNaY3dLaGs0?=
 =?utf-8?B?UnFqbmxRNk10SEFTOWVxSlpNTUhhTGVnVUIxMjZSWGFCemRURmVCc1NZak5u?=
 =?utf-8?B?TVRPdjlMMS9ncTFmMWxId3RibTVGL3VFdWtBWGFyd0ZmT2d2RnBUZnIvMndu?=
 =?utf-8?B?RVRWOWVIN1VUYmtXNVVxYWZhQmM1bjNvK1g0NHpERTJLWHJyc0JVblRKekNa?=
 =?utf-8?B?RXNuSk1UTGVZQlkvK2tzbkRvZ2xvZXdWaHUrVG82OFYvKzRNWDQyajNaQnRH?=
 =?utf-8?B?bWxaZmYzZjI2QVVqcE1xeFNMN1B3OTA1SFJ6VkRJdVF1bm1nazVDUjdvblNZ?=
 =?utf-8?B?L2UxR3BJMXp3SEEzRVVYTnZGR3FSaFIwc3U4MGdTRFJ0VExyd0RKNUR3WlJ0?=
 =?utf-8?B?ekJ6RnNnWmh1RHYvR3VVRnJYL0FKcnV1YlVFSUh1K2UwZEIrYVl5eXkwQmdC?=
 =?utf-8?B?Q01KaUNrK0MvSkhVNXFubFg5NVlSazFNVXFYUTFDcUd3REd0RmNzSk1jd2pl?=
 =?utf-8?B?NEx0SHpPYzhMQWdWKzBlY1B4RU9rRW16M203L0JEaFBkZU1SZWJWekZub1JO?=
 =?utf-8?B?U3RBZzBkMUdyd1ZFL2gwK2FkVkJFaTBXU01ER1p4R2lCQnU2TnNOYXZ4Qkt6?=
 =?utf-8?B?ci91RVhZc0Z1NEJPdDFvTkR5WjFFLzhyR0h3QzZTRmRyUXlqUzhFUkdmaU1h?=
 =?utf-8?B?RFNxL2R0aUwzWngwWTRzOXlxTDc1YU52aVRJTFdpV3FpbjgwVEFmaFJ0bVNh?=
 =?utf-8?B?RnBOSlZ0Q21WS2xaVDM1U2pheGtObVFkdHpwWVFScTY5TkhYYVZjWDZmQlhp?=
 =?utf-8?B?ZldGeDVWMTZMc25tbHpPcC9XaURtMlk1ekgySldhVjNhQjFqejNnQ3RwSy94?=
 =?utf-8?B?UFJ4bmh6YzVPbVFJYlZjOUNMOE1WRDEwZENYN1h3ZWh1T1UzZVFOZGw4Wnh2?=
 =?utf-8?B?L0pyeUE1LzIwVW8wM3p2eEV1a01USW5kTnhkTktGR0U4cGFIMU02TU14THA0?=
 =?utf-8?B?UzRwY3BWQ1ZPTWp5aUxqcE9qVnkzdzRybE1lRTFSbFBHUTM4b0FuUFVicmN2?=
 =?utf-8?B?dG92MWxDV3lubXJadldIT2ZZRXVlOUJ4Z0cxYzdVVHFPQ0N5OG1CUmEvYWxl?=
 =?utf-8?B?a0xxaGZtOTc0Z1RaVjFaV2F5QUEzM3RyeVphWnFXeVBnaFRhQUI1bUxvU21K?=
 =?utf-8?B?NGV4ajJMam0vR2R2UzNUaDVSbkplRmtWMExEaWR1NHl5TkJ4QVVNbHJhVnFF?=
 =?utf-8?B?VHIvU1J0Q2F6SXV0dGoxREFiSUhSUXhKU1JnLzJxNUt3NzNDb1U1YldNbUYv?=
 =?utf-8?B?dHdMRmk0cE1vRFJKMjNEYVhWOXE5YUtvS1FyeVpsdnQvNFVKQi95RlJvbUVl?=
 =?utf-8?B?M2FrakV1RzNpODJCd1k0aXdwYkRSRUE3ZUo5T3BYMnJmNUMvS0JjUkc2SkYz?=
 =?utf-8?B?SHk2Ni9HNVMwMkxrOCt0aWdjeUpEdDUyKzhSekF4RDJzWHpHU2VnU28xRzF4?=
 =?utf-8?Q?sN9LgzB2PPWHGm6079Dg5xIt/mmpg4gD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVHRFYwNlpnVjRMdWlOODBWWXI2aEw2SllXMlVONWpEU2YwRmgxRkxMMUQ4?=
 =?utf-8?B?NE9BeDdWY3FBYmRBNUh0b2JWa00zTEpSZGs2QTdrQjZoL2IrZitIb0ozTTlE?=
 =?utf-8?B?Q3ZxNWZidXZIaTJxblB5alRYZDJNZ0w3RjFtSVBKbjE2WHZjYUJIM21wc0R4?=
 =?utf-8?B?Tk5wbW5EVk9oOUNhT0UrQjY1UXA5VkhOa3hOczFCQVlxWGJOYUQ2RFJIUHNQ?=
 =?utf-8?B?azV6SUZWcGxCUmlOdlRyOFRiOU55MmdLRHV5WFpWemFSU3NKQm14bmRmTFkw?=
 =?utf-8?B?dXNnQjkxL2YzRXZMdUVkT2V4ZGJpNkR0d1czT3BCSWpmV1NrVUkxamdJOSth?=
 =?utf-8?B?VFJ3UDc1clRCaGNmVG01c2FVOHE0bFdicmN2bnh4V0Mwc0NFVzNkazRaME9a?=
 =?utf-8?B?VDg5QTUxT2EwYUZGeDd2Wkt4cHpOay9uQnd3NDJkaHdnSlFOZXVCenNxWUxX?=
 =?utf-8?B?OGJNdVc0SkRMRG8xVWJlUkJoN25hN1ZyLzBnL29xV2c1SC9vUDJGdVhxRkJw?=
 =?utf-8?B?OHJldUt6N2tIaGRSLyt4WjJ1b0FQNHFYRzJBaG1rZ2FtdTNGSThZejNZWVI5?=
 =?utf-8?B?ajhLdG1TN1pHZWdobkJGRG51bVNKMkVZQzJScDRNZkhVS05xek44azhaVkNy?=
 =?utf-8?B?d1lobE54ZkQzVW5acy9Gd2pZWnlBelBMa2dkZGk4MEI3RTFjbGNYMTh1clBx?=
 =?utf-8?B?L0pBdlJ5bXFKU0hOTU9wTi9yYlUycXBLY3NGZDRXckV3SHhYblBhNVJlNUJD?=
 =?utf-8?B?VXpMWVFtTmZWaXFtWEJFUlBDdTlTUm41Tnp0ZTlZa1dQR1p5bUxCMEhOOEg0?=
 =?utf-8?B?Wjg2THQ1aHIrWEdWRlEwYUpGNWZNVG9wT08vdGNvZTVGYVluRDgwUGdNbTU2?=
 =?utf-8?B?MVNEdThGeWxtS3pHaXlaMVQ4SGt4dk1YdE5ockZjbmczY0RRU0tON2l6UG5P?=
 =?utf-8?B?ZXZqY0oyQzlJMFRsRmVHNWdUMjhlbUZzUitHZW9xeVp5dk1Qanp4TlAyQkZQ?=
 =?utf-8?B?SmN3MC9HWEtvL0o0Rkl4YjJXM2J1bzl6ZVU4QkY3aWxKNERXY0ozemhnOHIv?=
 =?utf-8?B?a2dYMnQzbjQ0MlNsWHB4OWIyOU1LL3V6T2xFaGFBaitwUTJlUDdVRmN5L2No?=
 =?utf-8?B?NFJTdElNY3dqL1laWGFZYkt0blZESnZGSVRUdS80WEZ1QytRVGZQd3hvZ1Q4?=
 =?utf-8?B?TC85Tm9aR2pPT3FrRk4rVGxUQ2hUb0VFd0RiMjVCRHYvRk5EbmIrbnNWcEtD?=
 =?utf-8?B?a2s3ekowWS9EbDJHTjVRckxtM25KTUxRN0RyVFNreDMrTnBaWncvZjFsUGlY?=
 =?utf-8?B?M3ZHcmo5cTVUQ0hUQ2l6UlpzaW1mZE9UWVlldUV1aDgwaU5jTnBDRlJuTzZj?=
 =?utf-8?B?TXRNVTN5NlB3MVVVenNmb2I1U0llTFRoRXJzMkM2NGlYMFlrMDdlRGJMcHlj?=
 =?utf-8?B?TGFNT2lJQmkvTkN4NURlbWsvbFVqdGppMWFxZjl0ZW93NHc0c1lNWWpnTkZo?=
 =?utf-8?B?UXJaL1FERmw1UUZwS2tXNkpub25meUROZnFVTU9rMTJBMlhtaEJwb3MwZm5C?=
 =?utf-8?B?TnhzWXJXb3JJNWpMbElxbDlLR2lnUmh4R1U5M2x3eGt0bzVlRDV3MDd2Mloy?=
 =?utf-8?B?ejZqU1dyVVNXQTN5ckY3bkpTTWxRaDZ5bGtvTGt0VHVZK0dsZGg4VnFHSDB4?=
 =?utf-8?B?VGdqTXVNajltdTNMQzNRNWZlc0JrQy9nV3QrcEhZdmE0SENMVkNuRHFRY3ZM?=
 =?utf-8?B?NWhCbkl1Y3FnZE12TzcwZ1FWSmlvbi92ODN1NlQxd204MjZCd3d3ZXJ4eHB4?=
 =?utf-8?B?TWtUZTk4dDZEZUhTY3h5WHUveXRFWlJZNW9Lc3g2dVhpaHViNUN5VkNhWWJm?=
 =?utf-8?B?QS9lb1dkdGpkdmdySEJHdmtZNWxUcDFHaUUxOUtWTCtvdGlTWjk5R2xLeUJm?=
 =?utf-8?B?amc5UHBIWWZZdC9RTmtlMVNRRlk0bmRRV2RvR05adk54QU04VXhlUUZselJk?=
 =?utf-8?B?WGpESTdpZlBBMk5CRjh2Tmx6OUxZK3pNRXBxbnk3bEdBdll6OUM1R01BUU16?=
 =?utf-8?B?OFA2SGEwT3kwZFhNUkVOZHlVU3NPSU81aUxiZTFLbnJMYlI4OVcvS1EwUGpG?=
 =?utf-8?B?L1FhVUdjYXordnZPYkg0MHBwWUhPcGdTblNLNXJCQnN1QVN6V1pnclhNVVBy?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 290ccf52-d3be-4c0f-fea7-08de0ff577bf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:26:48.6066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrP8IP65V6y/GWKdX+TQ0SeRkl0HbGGt0pI3cjzKMwdrgeU2j5cQHbRyJ+QPa/cX/YbVfLos1krvhxUS6ljywAgo2mRdLvrifZdpsZ/a9eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series extends SR-IOV VF FLR tests to properly handle multi-tile Xe
devices and refactors related MMIO access layers for tile-level awareness

Piotr Piórkowski (3):
  lib/xe_mmio: Introduce tile-level XE MMIO access helpers
  lib/xe_mmio: Add init flag and helper to check initialization
  tests/xe_sriov_flr: extend VF FLR test for multi-tile Xe devices

 lib/xe/xe_mmio.c               | 108 +++++--
 lib/xe/xe_mmio.h               |  18 +-
 lib/xe/xe_query.c              |  45 +++
 lib/xe/xe_query.h              |   6 +
 lib/xe/xe_sriov_provisioning.c |   6 +-
 lib/xe/xe_sriov_provisioning.h |   2 +-
 tests/intel/xe_sriov_flr.c     | 513 ++++++++++++++++++---------------
 7 files changed, 438 insertions(+), 260 deletions(-)

-- 
2.34.1

