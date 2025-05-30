Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160CCC5B549
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 10:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FD010E812;
	Fri, 30 May 2025 10:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7alfSmA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5089310E812
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748599258; x=1780135258;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KWSguA8zMISNaTVHzaZGuHrxrDDXF3/EwM0t5F/rr+A=;
 b=N7alfSmAvYmzhVJpU+JT1OEa/i0abkJ33dqIcWKPaqNkF5uWa2Xtiedq
 TBgL9Q7IKwwHMqDxWrQisgd7Z4cdYEIV9bKu26TQ4r6ejrHigzXlPMvC+
 YEsC1PVC8BjyeSUP1SeCPKcHo9numxIuTFZYsnjMiSY69HU24Ksnvv5K0
 SpJyrWZA0aIqN5Q99Zcp6d3wUyr0CjUu4J2G0lWketPr6xAym43Rc5DJw
 RB27F+LI/lmXTXD1DO3K9V0gmArJ854K1LE+1KRCgSbdgsoCBTi1mylzx
 bEnBGgfW6LdQLb3A+bgXVjNAhHTvPsL02plg8wDReQ5Z1fMGCdFOhwkdQ w==;
X-CSE-ConnectionGUID: iWMfP+jWRESHgsLx2F7JuQ==
X-CSE-MsgGUID: zodJndoOSHazEfa0yJFOxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50833547"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50833547"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 03:00:58 -0700
X-CSE-ConnectionGUID: +S7W73T4Tv+UpU6W5BMtFQ==
X-CSE-MsgGUID: p9RyNAxfSEixtOCP6NwyjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="149106188"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 03:00:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 03:00:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 03:00:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 03:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFPeEJlr+wWikCAFHD/WWSDAmxbtGtqOVeDsyENAkoX4NMtNkzFzBE2iIdQ3j49GWz0buAG0c1LVMpuwPcvzXFKU/a7S+O7cJGSCL9Jrcxpzpj+46wkIsasU0ZXhuLwXfQ6ky0F6GtNZdoW466i3IHhT3nQMNGHHLgz3kQxSiH7AfdFeKQC+H2WgCwrTYRlQj9TgnZ0FsOSfZEF3UWyxhj43Uj9u7nuopounXo2vs2Cyj1f/sdnVSEr6DElr5KR76dGRsVU3eMe3N7P31HtFQtz5BCK7ON9/UIlbDhaFK/wvJfNR4VndisnPzy6UD12jF4kH8IbaRoS28fdnNVzrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWSguA8zMISNaTVHzaZGuHrxrDDXF3/EwM0t5F/rr+A=;
 b=y8zEuJUNNQHsEAflthBeNr01Dhj1UmaCAQWJVM8smh7nLX2o044nADYuKbYXVFQYaowplZLbZIaYdBRkgFx8HJvY0U13b0EHbrFMjzL6GNu/0UY1/iBbgBKajpjZrsKM1mzeEOJQvHl/znrM5BZIj4OTGWatmsTpJ+EA06jjClEzo/IxOOLKK2e4Sge4VDhpE0yss1RBBYAa1fdCNfFUMwqalxkQpIm+jnJcAUMso+57zUousnWclwdYfun3f5YXo2/ls3nJ+lF+EDVMvPi869HXhicWT2Bh6D0cpQJ6dIxWKSkgnN9pHmIk927qhmnYTJ4BosDoCdHGKJvRb0Y0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 30 May
 2025 10:00:54 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 10:00:54 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v4 1/2] lib/igt_debugfs: Add specific checks for WA in GTs
Thread-Topic: [PATCH v4 1/2] lib/igt_debugfs: Add specific checks for WA in GTs
Thread-Index: AQHb0Tglt98YWcIOr064RfAuaSukfbPq8QMA
Date: Fri, 30 May 2025 10:00:54 +0000
Message-ID: <fda62c04b50582ea9f4d2bd32351f33e88b44fd3.camel@intel.com>
References: <20250530075811.1033-1-mohammed.thasleem@intel.com>
 <20250530075811.1033-2-mohammed.thasleem@intel.com>
In-Reply-To: <20250530075811.1033-2-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|MN6PR11MB8172:EE_
x-ms-office365-filtering-correlation-id: 34a03d5d-97dc-4d3d-15b6-08dd9f60ddf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZEhoakM3R3lhdW1hL3VrRlZpMk1FQ2NMbDNWVHc0cXl4TzROdU9tRWd2QXlK?=
 =?utf-8?B?czFDMVM1bGptRGlmSjdoZDk4NU1rRXMyOVVoelRzSDI0dVBkazdlT1YyRkwv?=
 =?utf-8?B?bjNpT1A1a1Y4NDY2cjUrZ3NDNUxRdXdMVWJ4dXRTTktmVlVQVmNERW9wZjBy?=
 =?utf-8?B?bG5vY3huUTRKdnA0Q0xVaU5ZTDZ2a3QwdjgwdVV1VmptRVZSYm9ZK3hDNkVX?=
 =?utf-8?B?cmxrVHFFNzhLdFQ5MkEzNjJtUWtIZk40VjdhZXZJSFlpNzdpNUZNOFptMjRS?=
 =?utf-8?B?UnBjWDd4cU0ydUVld2pzdkNLZVF0L01CNEFteXNQRTlCQ0lWNGJYY1VVY2VH?=
 =?utf-8?B?L3JzRXM0ZUN2aWJlRW9rSmFIR3htclFzK21OVXVTb1NlcStpc1ZkMnd6cDBH?=
 =?utf-8?B?all2KzVPcUZiUHlIK0hOMysrWDBmd1pxM3pSa0xBcUMrRWFmamg5UUw0MEFO?=
 =?utf-8?B?ak9oTHBaMFhsT1A5dWNONEJHU2JoWkgyZk1kWUV2elFDQzNCcnFVMk5xL0Na?=
 =?utf-8?B?eGlmSmtTeml6T1BScTYveDhoRG05Mit5RlRKTlh3UzZmR21oYWZPdzQ4dHRT?=
 =?utf-8?B?QlRqQWxsbXZlNW9vVWUwVTZkcTRlQWJKOTFSYUxIdDM2V1BtQzl5NmxKbllS?=
 =?utf-8?B?dGtjdk4vZHgyK0tkNkVyaC9OSDNBUHVCOW9EZm1Pcnp2QmI1VXFncVNsVHNQ?=
 =?utf-8?B?ekV1SG9KUDh4cWNXYjVmTzhiQ3lhSk9SbGlnM1ZuMkM3Y3lHQVVYYnAzNUJY?=
 =?utf-8?B?NjYxdUtMSTZyczV6a2xhdUh2MTZvZU95TXBFL25PQ1o4MC84SWg2NGFyTVhl?=
 =?utf-8?B?OWdLWnIxWlB2YmF4Tm5LUUJ5THB4aWxoTjgzd2ZjMnRzSHkxbmNTSzhUd21S?=
 =?utf-8?B?SlNaMTVrTHpGanB0NDZKYzI0bDdHYUxtdzdBRzhrb1l3ZkNSOEp2MHhqY2Zz?=
 =?utf-8?B?RGU0aUs2dUVaS01QY0N6YzZWU0kyVGdHcUlIQWFpUmk3Z1F0NVFxK1pEMmQ2?=
 =?utf-8?B?aWwvaHl1dVI0bm5YeFN0aC9jcDJzcWlvbzByek5KVmx4aFM1U2c2cktWRVU0?=
 =?utf-8?B?VkpFYThxeDF6bUVMOGZIUUl3WWtsZklhbDJBc3FuamFiNHVlY2dGQlAvOTFq?=
 =?utf-8?B?NEd0TVdWV2dqZC9BZlgxVXRUTkMrdVFmTGtuMDYzWTNUUFpBYkJXT3NMZE5q?=
 =?utf-8?B?RlR5MEtITDZycVQ3VmIvMHFLYThzaEozeFBEdkJHZG91Zk1XVFZNNnJ0Y3Ar?=
 =?utf-8?B?c1dpYUZhMGZQWk9qOTR0Z243dzNFelZwV3k3MFBMaEV0VXd6OXZTT2oxSm93?=
 =?utf-8?B?ZXNVaW4xcjlpRjFkWlc4WEE3eXpodHl4NkgwMDRzY2Yxc0x6RXVudVJNdXhJ?=
 =?utf-8?B?d3hudHNrOXV3MVh2VVdrNGltakRGMXpEdTNHb3VrejlnMVVnVGY4QXA2U0Yy?=
 =?utf-8?B?ckpXOS8rUWxhMUJKTE1mNGNaZndNM3V1MmRGZVJMcjBLU1RZbG1IQkVweUV0?=
 =?utf-8?B?T3l6T0pXZDRVQkRpdHR0d1AxYnZySThIaXk0ZTFOZnFpdUtkVldiWExEOXhX?=
 =?utf-8?B?RHhXQ2NjNTZhVFI5ckNMN0pndnFvYm5KYlhCa2JMcFNaR3dSaTNIUjdkL0tT?=
 =?utf-8?B?eHlmL0RDdmE1amRabUx4UUtHQ0VRdmZRY0syNytWYTRDaHVnS2NIRTYxMzlT?=
 =?utf-8?B?TmdwQkJjdU1IOUcxUWN4S2U1QXJZNStONklsL2ZZOEVlcU0xcVVYZlQ0bkZD?=
 =?utf-8?B?NERZWTlYV1ZEVW80bGlSREllMnNrZUdhQnQrUk1iaFJEbk1MdHlQRE55U3hp?=
 =?utf-8?B?NXRsQkh3aGZPVkVnRHEzVzdmWFVSQjFEclpabHFGRVhkcUltVWpFWFdDYVBx?=
 =?utf-8?B?bFZYRU5LN2JpZ29mNXQ2RlE1NVV2YjU4SENFVlRNMjgzenAxc1JhTEtJazg2?=
 =?utf-8?B?SWlLVW9sTHBiZjVVdXJMTnNuOFJhQVlrOURiZkU4eE9sdnFBU1hISWxIT2xx?=
 =?utf-8?B?dTZoa0wzcTV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3MyVllRRzc4NzdLeUtCMlhPcmNGeXBSUWlvRDFvdCtpb21SL0tJZGJBM2RY?=
 =?utf-8?B?Q3NNQ09TWHA3bVQwRnBvRE9kclhUMlRoNzVORlNHU293K3hSUWpzVVdDdW4r?=
 =?utf-8?B?MGlnd2RHUDcwS2dhNDBFdGs0MkZHM2JEKzBHbi9Sano2OHFDTCtjWjFDZEhw?=
 =?utf-8?B?Wi9iUmF2a1BFOVhRYWNORlFHVkVGcitFVEIvN3pYT3FLc2hrYVdRVTJoMTBV?=
 =?utf-8?B?SmRzZk03Uy94VVlHOUtZcUZhNG9OVVlOZktzbTdhQytQTHhPb0xhaXdUZFli?=
 =?utf-8?B?MGhid1VHRnhIWEd6Ync4bFdLZ3paM1hkVkdsMHlSMlA1dlBCQ2ZUOC9lL0Zj?=
 =?utf-8?B?aWJsbEpOdEpNWnlHcFZhakthTWhLRHZwSEI3QTdUT1k1QnNiR1I1YU1sU1Bj?=
 =?utf-8?B?RldMbU5nNEFBN1d1VnQ4NUpUS2dYNE1Ga0lYYmJHcDJqTmg4dHNiTEg1Z1gx?=
 =?utf-8?B?eGtDZG56d0xjRE5FQm5wWGoyK3pWdm9EMDBKMU02djduUnVDUXlkaEhnUWpS?=
 =?utf-8?B?ZEZERjVHdGpBZXhNa0ZyTU9vZ08zdWRrMDZtL0xNQkoxSkVxWmNhdVl0Q3BU?=
 =?utf-8?B?dC93ZjFtQi9tRDl6N1RmUEM5Um9qWDZQMEkwSkN0ai9CNlVYVGUvVEpJZUdE?=
 =?utf-8?B?TTR1V1pOdmVmUXpTQkhhZ3RzdlZaQVN3cmdGRjE3SmNydGJpWXYybE9PZlVQ?=
 =?utf-8?B?TlZlRkpGV2lQaGh6MmdsSWFlWlBLSWdaK1J3dngvVHVGZnUyUFV5OTZBRFdP?=
 =?utf-8?B?ZjQrM0Nhb3RaUjM3My9CRlB0T1lYdXB0c3AwMnpiTUFQUWMxRXdFWTA3L240?=
 =?utf-8?B?dDZrenlWQVFDY21Pb0dMK1BsZE10bHJXR1F6cGNSVlZCTndrb2dybmVSUUc0?=
 =?utf-8?B?M09ocnd2TDV6emxHV0pkbkZtM21PYnlRenFuWDlscFpSRzZ5SzhaZmJsc2dm?=
 =?utf-8?B?cnJEOWpkZEFMbEQ3Qm1iL3JOcmZhM3IzcDJtR3NVV05SS3NJdFlzMXN2MzBX?=
 =?utf-8?B?MDNBMnUwYTlVWHFqbmZZMU9IekxYRXJwbk53dDlhN0ZselI0cW1LTld5dWFJ?=
 =?utf-8?B?elUrSzhkcGxnWHQ2RFdCWkRGclJoYVZMRHVCWFM3RVpFamczMFRKa0VwOXVH?=
 =?utf-8?B?Qlp0MnNqaGU2RW1xTW1XTjdRTDJsdXI1ajZPRVdhMTVVeE9EMXJtazNaTjdy?=
 =?utf-8?B?MEVXK2pGMURjK1FmVzFTSThYelhuSzUzM3g5QnduSWJ6NjJoZkU1Y0JJajZU?=
 =?utf-8?B?bXVzQXhLUzJBK3hyOHFiY3N0TUpCbjA1L1oxMW9rSzNqOVRIcGhQb0ZZZVBL?=
 =?utf-8?B?S3NKSm9RL1RNaEs3QUpoTXN2Y1c3N2tMb1ltK1ZsR2tNam43TTRDZEUwakw5?=
 =?utf-8?B?ZjJic01lS0hNSjZ4VHN0aFl4eWpGMlZMYlhpRUxTNk1RcTFEdEFmWUdFK0FD?=
 =?utf-8?B?ZTd2bFVQckFEUy9wbVp6ZXEzK1QweXBFQi9ZYmlOZzN2bXFWME83YXU2L09J?=
 =?utf-8?B?d0FZTUtjWEorZ2d3M3N2bXArMUIwb3RzcWhpZW5LTVlpRVFsWWxiTzRRQ0JK?=
 =?utf-8?B?OHNxOWl6L3BNbHpCSXNJaUVxUTNPVVpqSXR0bGZWK3RWZVdlbHNlQk82c1lJ?=
 =?utf-8?B?WDZlb2xmb0UxbkxaNVhjbjRlc0NPUXFYYXp1Qm1Ib1Q3R29ybjlDdE5DUkVB?=
 =?utf-8?B?eGZLQ1NLNklQNHZaNnFnMWJ4c1FkZmpUMTlxdmIvUkhlU1BraC8rWGdVUUJX?=
 =?utf-8?B?citYdktuVHhkV2dPQUVJZkZjWHFzLytGSGJZZng2MDdleDhZTkErTzZOckdD?=
 =?utf-8?B?dnRhaGRLeXpES2NVNklYR2Q4T1FxdXFMa0tmL25yVGRNZE5lRGZ4MWRJWTRE?=
 =?utf-8?B?K3QzQ3FCcGFBZ1l1K3pzM2ozOE5VMEp4SCt4am9YcWpGSlNZRUFaU2tJb2RQ?=
 =?utf-8?B?aEtySjlWK3FqcU82TlpneUEybzlobDZnSVNOZUkrMFpuU2xKeUFNQ2V3Y1RB?=
 =?utf-8?B?QVFGY0E5L2Q3Z1I1akFHYmFTd1FubmN1QWpLTzA3SWpvNVRYT1Vnd1BvRWpY?=
 =?utf-8?B?clkrWjlhNUdOMnZEWDgvQ2F4Z2RNMFpDSGZHQm52bkMxeHlwcTVTMTViMGxW?=
 =?utf-8?B?RElJZkxRZVMySjVaYzhhQ1h2QlJGUGhQMGZoVVY2NEdCK1ROek1sOXIyY00r?=
 =?utf-8?Q?z9MBlmB6Ws78tv4DsFymBZo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E481BD023EB35043BA43C7AF71E3DD31@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a03d5d-97dc-4d3d-15b6-08dd9f60ddf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 10:00:54.5712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BseRk7FjUuArRWuB69gJupsCzBdyWRiGqnl3MiU3ZgRnE7fevKq48fpdn2/9TTmApxaRtsfbBQs9xWnyU+E/c6cgHQkDIaJVVrI718PqxdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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

T24gRnJpLCAyMDI1LTA1LTMwIGF0IDEzOjI4ICswNTMwLCBNb2hhbW1lZCBUaGFzbGVlbSB3cm90
ZToNCj4gVGhpcyBmdW5jdGlvbiBjaGVjayB0aGUgZ2l2ZW4gd29ya2Fyb3VuZCBvbiBhdmFpbGFi
bGUgR1RzLg0KPiANCj4gdjI6IEFkZCBkaXNjcmlwdGlvbiBmb3IgcmV0dXJuLiAoS2FtaWwpDQo+
IMKgwqDCoCBSZW5hbWUgZnVuY3Rpb24gdG8gaWd0X2hhc19pbnRlbF93YS4gKEthbWlsKQ0KPiDC
oMKgwqAgTW92ZSBsaWIgY2hhbmdlcyB0byBsaWIvaWd0X2RlYnVnZnMuIChLYW1pbCkNCj4gwqDC
oMKgIER1bXAgdGhlIHdob2xlIHdhIHN5c2ZzIGZpbGUgYW5kIHRoZW4gc2VhcmNoIGZvciB0aGUg
d2EuIChWaW5vZCkNCj4gwqDCoMKgIFVzZSByZXR1cm4gdHJ1ZS9mYWxzZSBkaXJlY3RseSBpbnN0
ZWFkIGFzc2lnbmluZyB2YWx1ZS4gKFZpbm9kKQ0KPiB2MzogVXBkYXRlZCByZXR1cm4gdHlwZSBk
aXNjcmlwdGlvbiBhbmQgZGVidWdmc19mZCBmYWlsdXJlIGNoZWNrLiAoS2FtaWwpDQo+IMKgwqDC
oCBSZXR1cm4gMCBvciAxIGluc3RlYWQgb2YgdHJ1ZSBvciBmYWxzZS4gKEthbWlsKQ0KPiB2NDog
QWRkIGNoZWNrIGZvciB4ZSBkZXZpY2UgYmVmb3JlIGV4ZWN1dGlvbi4gKFZpbm9kKQ0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTW9oYW1tZWQgVGhhc2xlZW0gPG1vaGFtbWVkLnRoYXNsZWVtQGludGVs
LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxp
bnV4LmludGVsLmNvbT4NCj4gLS0tDQo+IMKgbGliL2lndF9kZWJ1Z2ZzLmMgfCAzOSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqBsaWIvaWd0X2RlYnVnZnMuaCB8
wqAgMSArDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspDQo+IA0KDQpSZXZp
ZXdlZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5j
b20+DQoNCg0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2ZzLmMgYi9saWIvaWd0X2RlYnVn
ZnMuYw0KPiBpbmRleCA4YWMyMTVhNzYuLjU0NDRjNmY1ZiAxMDA2NDQNCj4gLS0tIGEvbGliL2ln
dF9kZWJ1Z2ZzLmMNCj4gKysrIGIvbGliL2lndF9kZWJ1Z2ZzLmMNCj4gQEAgLTQ0LDYgKzQ0LDcg
QEANCj4gwqAjaW5jbHVkZSAiaWd0X2ttcy5oIg0KPiDCoCNpbmNsdWRlICJpZ3RfZGVidWdmcy5o
Ig0KPiDCoCNpbmNsdWRlICJpZ3Rfc3lzZnMuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5o
Ig0KPiDCoA0KPiDCoC8qKg0KPiDCoCAqIFNFQ1RJT046aWd0X2RlYnVnZnMNCj4gQEAgLTc3MCwz
ICs3NzEsNDEgQEAgdm9pZCBfX2lndF9kZWJ1Z2ZzX2R1bXAoaW50IGRldmljZSwgY29uc3QgY2hh
ciAqZmlsZW5hbWUsIGludCBsZXZlbCkNCj4gwqAJaWd0X2xvZyhJR1RfTE9HX0RPTUFJTiwgbGV2
ZWwsICIlczpcbiVzXG4iLCBmaWxlbmFtZSwgY29udGVudHMpOw0KPiDCoAlmcmVlKGNvbnRlbnRz
KTsNCj4gwqB9DQo+ICsNCj4gKy8qKg0KPiArICogaWd0X2hhc19pbnRlbF93YToNCj4gKyAqIEBk
cm1fZmQ6CUEgZHJtIGZpbGUgZGVzY3JpcHRvcg0KPiArICogQGNoZWNrX3dhOglXb3JrYXJvdW5k
IHRvIGJlIGNoZWNrZWQNCj4gKyAqDQo+ICsgKiBSZXR1cm5zOgkwIGlmIG5vIFdBLCAxIGlmIFdB
IHByZXNlbnQsIC0xIG9uIGVycm9yDQo+ICsgKi8NCj4gK2ludCBpZ3RfaGFzX2ludGVsX3dhKGlu
dCBkcm1fZmQsIGNvbnN0IGNoYXIgKmNoZWNrX3dhKQ0KPiArew0KPiArCWludCBkZWJ1Z2ZzX2Zk
Ow0KPiArCXVuc2lnbmVkIGludCB4ZTsNCj4gKwljaGFyIG5hbWVbUEFUSF9NQVhdOw0KPiArCWNo
YXIgKmRlYnVnZnNfZHVtcCwgKmhhc193YTsNCj4gKw0KPiArCWlmICghaXNfeGVfZGV2aWNlKGRy
bV9mZCkpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICsJZGVidWdmc19mZCA9IGlndF9kZWJ1Z2Zz
X2Rpcihkcm1fZmQpOw0KPiArCWlmIChkZWJ1Z2ZzX2ZkID09IC0xKQ0KPiArCQlyZXR1cm4gLTE7
DQo+ICsNCj4gKwl4ZV9mb3JfZWFjaF9ndChkcm1fZmQsIHhlKSB7DQo+ICsJCXNwcmludGYobmFt
ZSwgImd0JWQvd29ya2Fyb3VuZHMiLCB4ZSk7DQo+ICsJCWlmICghaWd0X2RlYnVnZnNfZXhpc3Rz
KGRybV9mZCwgbmFtZSwgT19SRE9OTFkpKQ0KPiArCQkJcmV0dXJuIC0xOw0KPiArDQo+ICsJCWRl
YnVnZnNfZHVtcCA9IGlndF9zeXNmc19nZXQoZGVidWdmc19mZCwgbmFtZSk7DQo+ICsJCWlmIChk
ZWJ1Z2ZzX2R1bXAgIT0gTlVMTCkgew0KPiArCQkJaGFzX3dhID0gc3Ryc3RyKGRlYnVnZnNfZHVt
cCwgY2hlY2tfd2EpOw0KPiArCQkJZnJlZShkZWJ1Z2ZzX2R1bXApOw0KPiArCQkJaWYgKGhhc193
YSkNCj4gKwkJCQlyZXR1cm4gMTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0K
PiArfQ0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2ZzLmggYi9saWIvaWd0X2RlYnVnZnMu
aA0KPiBpbmRleCBmNDA0NGQ1NDUuLjZkNGMwOWQyZiAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9k
ZWJ1Z2ZzLmgNCj4gKysrIGIvbGliL2lndF9kZWJ1Z2ZzLmgNCj4gQEAgLTQ5LDYgKzQ5LDcgQEAg
Ym9vbCBpZ3RfZGVidWdmc19zZWFyY2goaW50IGZkLCBjb25zdCBjaGFyICpmaWxlbmFtZSwgY29u
c3QgY2hhciAqc3Vic3RyaW5nKTsNCj4gwqBpbnQgaWd0X2RlYnVnZnNfZ3RfZGlyKGludCBkZXZp
Y2UsIHVuc2lnbmVkIGludCBndCk7DQo+IMKgaW50IGlndF9kZWJ1Z2ZzX2d0X29wZW4oaW50IGRl
dmljZSwgdW5zaWduZWQgaW50IGd0LCBjb25zdCBjaGFyICpmaWxlbmFtZSwNCj4gwqAJCQlpbnQg
bW9kZSk7DQo+ICtpbnQgaWd0X2hhc19pbnRlbF93YShpbnQgZHJtX2ZkLCBjb25zdCBjaGFyICpj
aGVja193YSk7DQo+IMKgDQo+IMKgLyoqDQo+IMKgICogaWd0X2RlYnVnZnNfcmVhZDoNCg0K
