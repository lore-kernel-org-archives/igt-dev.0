Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A9C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 18:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE7610EBA8;
	Fri,  7 Feb 2025 18:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYlyuMsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC0F10EBA6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738953392; x=1770489392;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=F+a9m0Gp2XYytxkh6KlUNGsImFL97apx/PzfSEd6Lh8=;
 b=LYlyuMsN3rgdcN+rInTYruJwTMybUT9wTwCVGQ//zr2QyvkMyKvU7OCz
 xuHqCaPbatXilRcijDIDZswJnB/oj60C4M1QXhMB+uYC0o9YslzzbxJ+J
 q/WQZ8YdISvliYSNgKhEz6Jn3IV9eTVTz4RFMOdsffWxpIchPU5+Xq+JM
 izUaUSKz3vjMKrNvB1F9JkBHfgtelOfYZa34FpNvvVDjJcdCWB4vcfhqs
 v81SrLPBy/PEzM7Mq0qR31bowoB4Ltr0vmJk03Ish7N07r2osKcZxWJA3
 TrIpWmrSHtaT7ujbRFBAt899WndVbRf6w7ieHNv3M2KeFOKrXFPeoBs8l w==;
X-CSE-ConnectionGUID: r+SS3ma8SA+InhZq46CUbQ==
X-CSE-MsgGUID: gnfLPMMKQLifrAeKVtQpaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38802318"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="38802318"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 10:36:31 -0800
X-CSE-ConnectionGUID: yzh2HeZYSleHu/IZkTRHXA==
X-CSE-MsgGUID: JQcjONjlSiy+QGVzpnGb7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111509707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 10:34:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 10:34:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 10:34:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 10:34:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMJ6yyyPH5bSZ/OMzSMjX5T4yaZQCAzTrWIPFz205VS1D9f3aNFh/88Jihaj/Ctr681hQSI307YDiNB9idel8yNdkg3jc1SlwwbDmfsXeZQJzftRcU9YYOXyInGegoVqdYPXrAHbI/IIxWgtse9OmgSwGWyc4j7erRo1dlMsRtRyE7x3vHI89Z2W4ngjVEBcPBItZ+ZHqxA82NgwLb9Af5/Z7XIJ8uomgcTozXsC7tTHMCCGYjIX3FlFG6M4aGXa5jfUGvBkNEQWQ4E/1OrNmCW+Iuq2WJp1ftbFa8LMCriioYw2uONvX9jlNIXP6vB94m+/GCa1ax+ik50B2YuF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUn1nwp6dgLVC69FSzf6qhbhkJjjEQNH7rHMnC4on7I=;
 b=XxwdAKxv/yG7rxlqi2Fq/xNe20H8IdbETwjI5tktkTTixKvic22bkYFF1MxexJP0T6Csbse07znOYUjPbY79Uo9CdMUjpqKe0d0z7d2puXdFOVSk5G+wl4UN52dFHaM5aQa06Cq6gc2HSw3VgreXCSRVNZH7BgYKv+cFMA/7CDyLDRK6NzLGYg/fhLkxIExhe+0CAUeMum1s+NT0T+G70/MmmBdAWR69OXpboZnO4Z8RcpwWhMqnioVX2Q/55MEXBsJPoJPzQxac06r+suAqLXDGyZJs0r4y8PO1LWZTqTkeesAPUZGNNUb54t05USZ0p0bxMEKm3u6RLrJi7DpA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 18:34:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 18:34:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250130172149.3657144-5-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-5-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 04/10] runner/settings: Use wrapper macros for
 each type
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Fri, 7 Feb 2025 15:34:04 -0300
Message-ID: <173895324435.1963.14054712798532007872@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA0PR11MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc98f6c-70ad-409e-7b58-08dd47a60280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjJ4cEcvRTFqK2xCNGgyem01S2tpN0JXYW9OMGVEcU9EeHBPUnJ2ZVpudEll?=
 =?utf-8?B?Z3dkWEdIdm9pdENRSmtBMUJDQzZmMlBaTFJ4K0d6WnlIT2JBaWVnZkkrai9E?=
 =?utf-8?B?OHNnYmRJb0tBQ0I3cUZGRDhDaGpCNHpxQ0cyZC82ZTZ2WHlqTkF3QzJQdVla?=
 =?utf-8?B?QStjcktDUCtTdHBkTzhrMUJVUERTcW4wNkxuSE9YVGJpcmNmQ1lkUGVCSm9r?=
 =?utf-8?B?Z0dxM0lmTkZjckhaVExBRktPYy9naXFRRDZ1VlVtYVFBYkhOMXJOSzVkR0cr?=
 =?utf-8?B?aG4rR2dNUllFbk1rUnZlSitGZXROK0FhVU1tT0VJcDVuRTQ5dWttSEV6QVN6?=
 =?utf-8?B?MGtYZWI3Q0dmS01uQWd6MS9TUUVQN1pKMm00QVcxZXR2OG1IalNwdC8wVys3?=
 =?utf-8?B?M0JUSjlCbCtWTnEvYnNkUXRiZGZlZ3l2YS95cTVWb0Z2WXdpQys4OUFoaElx?=
 =?utf-8?B?NnZUa01xc3ZOSGpmY1ZWSUxtVmNWdXFRS1lMb0JoNHBWTU4xU3ZMWkRQL1g4?=
 =?utf-8?B?WWtQK1hHY1BkeTFOQU9nRkFXRExGZXo4N3VqVjBxY2RScTlaVEtjYWpGR3pw?=
 =?utf-8?B?WXEwNWFubStoODdDUmI0M0RFT2Q3eXE4Y1l6d1NXUDlnMUdkL1dhYmI5L3ZM?=
 =?utf-8?B?eEZvSU8ycG9DamJXU3FzRTFZYWdUdEZvNUtWUG1TOWJJbEpPclpwUmNYNGRn?=
 =?utf-8?B?U1lkYUg0MkpIeUdMZ2ZBZjZCaXJQQk50YjJhcXJVMDVZYit6VWNaTkdZZGRr?=
 =?utf-8?B?bTg1Y3kwaCtqaGVyRGgrd1p6NEFBdG16aENQTkJBYjFMcHZFcEtsYzlKUndo?=
 =?utf-8?B?NEFwa1M3SmJnRjRQbk5adHJrSnNZWDJmRGZaVWY4U2lMUktsZnExTTB4Q3Rz?=
 =?utf-8?B?VzBLclREaDcwZGxkV0FjTVZ0Tm1jdW56bnhpL1RpaFpqNnQxYUpvRnd1Tm9n?=
 =?utf-8?B?b21kUDJaMjhpY0dSN3ppc2Q4R1BzMDlndDRwd0x0NFNPMlBLdWRZc2lFalVo?=
 =?utf-8?B?alNzenVOMkcvMVpudVdud25WN1YyVDBnOUdnd05KQkRWN1RRSTdhZkgrakNi?=
 =?utf-8?B?dmVvbEdiMFd6L3JiMmhqM2NyWGpIM01Vbi80T2F5SGJ0eU1HQjJRT3h3S1JQ?=
 =?utf-8?B?eXpNbStTY1d0d3VLWVQ0RFQ3NDkxdFJ3bWRsL1VKNFZYZUM5Y1ExTWlDeGNE?=
 =?utf-8?B?K1hKQ3FRWUlCbHoycUVzRnhCZGVOaWdDZmcvUW8wbnVScW5CN1lvN1Z0TmpB?=
 =?utf-8?B?VXFhc2RlKzdBeExCUThLNjJ5ckJJa0ZOQm13Z09nbllCZTIzTWIxbXZuNk1y?=
 =?utf-8?B?VHJ2R0NZc0V5dDVEeU1lWFlLZ3NXdGd3WXQyMGJZa1lFcE1GVnpjS0M1TXhu?=
 =?utf-8?B?UXQ0THZBNEpmM1pwdWNJNVJicVdkeEUxUTlOMVdhbmZrbXpXdDlPTGs1eTgx?=
 =?utf-8?B?Q2RDSEd0dEd6NnBOZnpxMGdmVUNPU3krdkY3Qnd6UVdzRFE3S2haWkI3UzV1?=
 =?utf-8?B?STIzT2JLTnVnZ2JEVlZ2WVBXV2ZBUE5HVFRRYjUza0xad2pNeDNyMWJidXZT?=
 =?utf-8?B?U0hNemJ3Sy9uWDIzbXgxYURqcDhkUHZBdVdJOVgyZ1E2d2NQdWJPTkpVeEc0?=
 =?utf-8?B?QzdITjFRbSttYklRZzV1WE9UUFQ4SkNDeWY5M1J6TWFDV0FtRFM5Zk95eXhk?=
 =?utf-8?B?OVJBWjduV1NjWXRJZnk3QSthZ0ZyVTNab29xN3k0djZueHdaTDJPQm14QWJv?=
 =?utf-8?B?aEF4ZVcvTFFRdFBqSXFwNmRPcVJScWxiaGFKZFVHSGxXbFNZejI2MmNJNmt6?=
 =?utf-8?B?OUlvaGh5S2RWRk5LaVF3UjBPY3RNM2VPU2pTODFqUW1NcDBwdWJnTlhuOStX?=
 =?utf-8?Q?2nJ4Mc7Wr+5FX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2F2dXBDSEd6KzlDNSt6K3JsTjhwSGhmR1haZDFnQk1Md25sWVAxd1pzL281?=
 =?utf-8?B?UkR0MXA4MkZDNHRzbEtnQThmaElUdGQyT1FoRklsS0c3bVdVQ3hRVGsvQ2Ux?=
 =?utf-8?B?S1dHM3dRRi9NNGdOSWpZUjJPQkdmYlFrN2tIbHVjWU4vMzJiUHFXRUZybDFS?=
 =?utf-8?B?eitmajQ2dTBJU1I1UmhQYkdLQ0JqVFY3bjRrOVlVUFFSVnVicXc1V0NMNlAw?=
 =?utf-8?B?ZWJGcDRvT2N6QVVqOGRJRDJYMWR4UEs5N0ZlcHkzcDNhZlRQT0lpell3Mm16?=
 =?utf-8?B?QTY5a0Z2Sll2N0RhWjV5a256V3QvUnJOeXFFV0QrUE0vQVA5UlkvU1RlOXlS?=
 =?utf-8?B?OEVzRWlpaHFwNkMwbFVyR1RoUTFZWkh1MUVRZllUaTdrcGcvWkRnQ0tCRlc5?=
 =?utf-8?B?ZlAzVm5YTDcvc1ptZFBqajhVWjlRVHhKQUJMUTMyNmdETnNiVFppUHNHZVF5?=
 =?utf-8?B?RmthZnBxM1NGaWl6QmtCOTUrc3poQkJ5MnVDWGtHbzl0VWFja0poelpuYXJP?=
 =?utf-8?B?RTRuUjZTQlE5N21yU2ZpeW9YMzljcXN0bEJPeVdTNklVWGdEclIxRDcwbmtK?=
 =?utf-8?B?RVduUG9ENHFpVDdLV0FSZXpnSEhKaVRXTHpwcHMvL09qY01QZFlOSEhOc1Zz?=
 =?utf-8?B?a3ZPTk1aZDhiOXhicXlOYW5Oa0xoL0lsMzVYeXRpWGszNERPbFArWmxzaFUw?=
 =?utf-8?B?YnZja0ZkOWpnTEViaGV5ZDRxT0l6ME9tZjNsSjFlUVVOWVdUYW55dkVkbW9G?=
 =?utf-8?B?djBiejdVSXlacHdsOUgva2htMDBkUjhrWnhmeEJwck1HbndwTXZhWWhoZ3hZ?=
 =?utf-8?B?T3RFb3pqZW0vcHZ5cERDWmRKL3dQbFhJZFRxakpXV0IrOTlwNXNDYThTME9i?=
 =?utf-8?B?MlNpNDRkeXRUam4zMHhmY040NXV2WG5YazkxNnFURFpLMTYzamlnWStObk40?=
 =?utf-8?B?VTVvbVFFbkg3M2l6MVNJSU9EQWFuNUtZNk1xU2wydEYzMDZkSUpUZ3BqQlYv?=
 =?utf-8?B?S2M2dVRYUitIWU94RzdUMG8vdzdSQUVnYnVuSDFVZU5la0xRdklqMnlySHcr?=
 =?utf-8?B?cTVBbjNlRVM3MUd3OFUzTmlTSTVPRmZQclRnSThjUFJuUzRhOStJVTVrb2VW?=
 =?utf-8?B?K0tMZFBlaVVMbzlRRHRPYkV2YkxLSmMwaURCU1NlamcrTmJLcXRNejVyOWZX?=
 =?utf-8?B?L3ZzZTc4ZHhDTlgvV2h1eEtsajR5cW1OL0d5SVdpRVp6WlMxSE0vS1d2Y1J4?=
 =?utf-8?B?OEtJQnhXY1FjRDFGMEtLZUZpdXBtR2FPNkJIRG9KVCt3eGRLb0xTOEVXUnNS?=
 =?utf-8?B?U1FGVWNIalhqaGdTRzJweFpaV0JXc1FGSXh0ZVZNUEVXOXNzb3I3eEFvazR6?=
 =?utf-8?B?S0dEb0RUQnZLTTNmYzMzZlpzUXRPWDV5cFpod0NaVUZaQkhuMFRFSWlGeXB1?=
 =?utf-8?B?ZnJ3akUwY1lyUVI1cnJvc2s5cUhyRHhycW9UOUpUa3JlUFFZNmQ2cExLQ3h3?=
 =?utf-8?B?V2swOUgzNGp1cklEaWRMQ1dBODdFYmVYSkFTSUlDVnpicy94cytTdFBtVjhs?=
 =?utf-8?B?YTdTcXY1N2Q0NHBaNm11ZkdUMWpBbHJxN0lFa2EzVTRNNS9HVXRDUEl5Qmov?=
 =?utf-8?B?aVV3ZEJXM0pwMVRmdkpYRzZSV1BCU01mVjZKMjArQ1dGNzg2VzBxVmNOY1NC?=
 =?utf-8?B?ZmtkUldIenJHeDR4SGNJbGF1blUrZzg3a1MxOGZ5WG9rTGxBbEoyTjBYYmtv?=
 =?utf-8?B?dVNRTUcwOWNMMSt0NFVDbnEza0o0bmtwb0g5b01aWjdoZmhZMnRjYXJJTUhr?=
 =?utf-8?B?ZlBsaXhmVHRiR0Urak1RZXg1MGc5Rlh4WHRMYUhydE1mQWx0RW4wMEUrL3Fi?=
 =?utf-8?B?OEhEMXFGVzUrcXZaaDZiUXQrTG9HZFpPMUxpMDJRUWNwMXVBdFFudzVRbGc4?=
 =?utf-8?B?OE53aUF1OFMyRERvdUpZbUJCZmpmNk5IdUJLNjc2bHBzc0VjanNjRVRlSk85?=
 =?utf-8?B?amwzZDZLUGVSeUlteFVOd2R5VFNGNUdUNzZJS28wOTFUWUJrdW5MYmttdGEr?=
 =?utf-8?B?b1B4bnJaRHZDUXJXMzlkUHFkbzZVbTZDZDhPbW1yODY3OWNGRTNMRjFsTmF0?=
 =?utf-8?B?bFpUM3V3cW9IUTAwcW1NcHVSc2luZklKa1pEeENzbmlraVRJWUpoZEpwSzMr?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc98f6c-70ad-409e-7b58-08dd47a60280
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:34:09.2217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3asovBrZVjzSLA42hhfsFATBiTxJ+S/mpFcT99jL87GMTy3PgtsVo5SVT/C9eYGvXKZvF+MZxY9V9ANtDPxhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7187
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

Quoting Lucas De Marchi (2025-01-30 14:21:43-03:00)
>Simplify assigning the variables by using functions called by wrapper
>macros. This avoids calling atoi() on every iteration and will help
>future refactors on functions parsing the values.
>
>The pointer to the value is passed to the parse function since it will
>be useful later when parsing a string and leaking it to the settings
>struct rather than duplicating.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> runner/settings.c | 78 +++++++++++++++++++++++++++++------------------
> 1 file changed, 48 insertions(+), 30 deletions(-)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 89df4990e..340d3802a 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -1153,43 +1153,59 @@ bool serialize_settings(struct settings *settings)
> #undef SERIALIZE_LINE
> }
>=20
>-bool read_settings_from_file(struct settings *settings, FILE *f)
>+static int parse_int(char **val)
>+{
>+        return atoi(*val);
>+}
>+
>+static unsigned long parse_ul(char **val)
> {
>-#define PARSE_LINE(s, name, val, field, write)        \
>+        return strtoul(*val, NULL, 10);
>+}
>+
>+static char *parse_str(char **val)
>+{
>+        return *val ? strdup(*val) : NULL;
>+}
>+
>+#define PARSE_LINE(s, name, val, field, _f)        \
>         if (!strcmp(name, #field)) {                \
>-                s->field =3D write;                \
>+                s->field =3D _f(val);                \
>                 goto cleanup;                        \
>         }
>-
>+#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, &val, field, p=
arse_int)
>+#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, &val, field, p=
arse_ul)
>+#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, &val, field, p=
arse_str)
>+bool read_settings_from_file(struct settings *settings, FILE *f)
>+{
>         char *name =3D NULL, *val =3D NULL;
>=20
>         settings->dmesg_warn_level =3D -1;
>=20
>         while (fscanf(f, "%ms : %m[^\n]", &name, &val) =3D=3D 2) {
>-                int numval =3D atoi(val);
>-                PARSE_LINE(settings, name, val, abort_mask, numval);
>-                PARSE_LINE(settings, name, val, disk_usage_limit, strtoul=
(val, NULL, 10));
>-                PARSE_LINE(settings, name, val, test_list, val ? strdup(v=
al) : NULL);
>-                PARSE_LINE(settings, name, val, name, val ? strdup(val) :=
 NULL);
>-                PARSE_LINE(settings, name, val, dry_run, numval);
>-                PARSE_LINE(settings, name, val, allow_non_root, numval);
>-                PARSE_LINE(settings, name, val, facts, numval);
>-                PARSE_LINE(settings, name, val, sync, numval);
>-                PARSE_LINE(settings, name, val, log_level, numval);
>-                PARSE_LINE(settings, name, val, overwrite, numval);
>-                PARSE_LINE(settings, name, val, multiple_mode, numval);
>-                PARSE_LINE(settings, name, val, inactivity_timeout, numva=
l);
>-                PARSE_LINE(settings, name, val, per_test_timeout, numval)=
;
>-                PARSE_LINE(settings, name, val, overall_timeout, numval);
>-                PARSE_LINE(settings, name, val, use_watchdog, numval);
>-                PARSE_LINE(settings, name, val, piglit_style_dmesg, numva=
l);
>-                PARSE_LINE(settings, name, val, dmesg_warn_level, numval)=
;
>-                PARSE_LINE(settings, name, val, prune_mode, numval);
>-                PARSE_LINE(settings, name, val, test_root, val ? strdup(v=
al) : NULL);
>-                PARSE_LINE(settings, name, val, results_path, val ? strdu=
p(val) : NULL);
>-                PARSE_LINE(settings, name, val, enable_code_coverage, num=
val);
>-                PARSE_LINE(settings, name, val, cov_results_per_test, num=
val);
>-                PARSE_LINE(settings, name, val, code_coverage_script, val=
 ? strdup(val) : NULL);
>+                PARSE_INT(settings, name, val, abort_mask);
>+                PARSE_UL(settings, name, val, disk_usage_limit);
>+                PARSE_STR(settings, name, val, test_list);
>+                PARSE_STR(settings, name, val, name);
>+                PARSE_INT(settings, name, val, dry_run);
>+                PARSE_INT(settings, name, val, allow_non_root);
>+                PARSE_INT(settings, name, val, facts);
>+                PARSE_INT(settings, name, val, sync);
>+                PARSE_INT(settings, name, val, log_level);
>+                PARSE_INT(settings, name, val, overwrite);
>+                PARSE_INT(settings, name, val, multiple_mode);
>+                PARSE_INT(settings, name, val, inactivity_timeout);
>+                PARSE_INT(settings, name, val, per_test_timeout);
>+                PARSE_INT(settings, name, val, overall_timeout);
>+                PARSE_INT(settings, name, val, use_watchdog);
>+                PARSE_INT(settings, name, val, piglit_style_dmesg);
>+                PARSE_INT(settings, name, val, dmesg_warn_level);
>+                PARSE_INT(settings, name, val, prune_mode);
>+                PARSE_STR(settings, name, val, test_root);
>+                PARSE_STR(settings, name, val, results_path);
>+                PARSE_INT(settings, name, val, enable_code_coverage);
>+                PARSE_INT(settings, name, val, cov_results_per_test);
>+                PARSE_STR(settings, name, val, code_coverage_script);
>=20
>                 printf("Warning: Unknown field in settings file: %s =3D %=
s\n",
>                        name, val);
>@@ -1211,9 +1227,11 @@ cleanup:
>         free(val);
>=20
>         return true;
>-
>-#undef PARSE_LINE
> }
>+#undef PARSE_STR
>+#undef PARSE_UL
>+#undef PARSE_INT
>+#undef PARSE_LINE
>=20
> /**
>  * read_env_vars_from_file() - load env vars from a file
>--=20
>2.48.0
>
