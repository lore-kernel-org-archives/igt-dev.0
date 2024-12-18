Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D9DE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 11:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F395F10EB7E;
	Wed, 18 Dec 2024 11:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCRDTTR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C071510EB7E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734523060; x=1766059060;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I8bON4GeAPfuPbu6pGOToOp1+GF/NUcstyM1gynTNN8=;
 b=cCRDTTR73It6Z0x63dPbl7VqFwkBmkpx+YB6BwyTr8HTm7qawDRr8DIx
 LfK4mBE391nMuuwAgxQkB7BISA1iJHCUekeLLCEKVNabkNslqQhAyhgB3
 Tu806ifNp1aoh3hUhO0C3v7ytpx3xpIaQRimyFU+SzxRJI68ypwjhyR9/
 N4vVv4cZY/m2igidWbkBAoTmKQaD+7POabS2sZlVE6G2MK7Hg8qo38aDT
 NGkYA95giRxpktL7zb/UAOhqg5ZUS5WsB2aHHOZbrQQUM/bI7Qe06nRFA
 8D22I/J17SbDGinLaMEBYeHOejEPlyhyW1xLU05ESqKMaXY50HMuSoYBD w==;
X-CSE-ConnectionGUID: 2EcNSV8wT5K0AvRa6XPf7w==
X-CSE-MsgGUID: VgGqmCJ9QIuDfzHyjd3mUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38930200"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="38930200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 03:57:39 -0800
X-CSE-ConnectionGUID: qiqFJtvhRheL4giWlQegCQ==
X-CSE-MsgGUID: 2kwHV+/hSPOpWTJomjfTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97628808"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 03:57:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 03:57:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 03:57:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 03:57:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSmpAVAz/31cjfwqBzvue7G2aP3su52Uu5Lx4DeuHHTC2UfrGs9VDtZI+IxXq+Jaa290fj34noraXjs1wSi/XM9sAqx8xMDJuDl09FHFw11OLBYGoPtQ1xWcTGuAEPlIAncJ1BPgFt+3fhDIFDMmmkKokMQVE9xx5dUHw4uVotyQNoNp26MPMXlRAn+zGy+p8PWxUMRmLW+l+StDy+wu85B8L6seMVZ1FERjspM1FWZjDrlISr/RQbj96BlYf61Wz5vKeXscb7vLDnvRBsOxZOaTa+z0/X9gVTGhd7lNEjtqZyyB/Wk76f3+adZy3Yxkmam06XQlDNicrnEgZtJE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8bON4GeAPfuPbu6pGOToOp1+GF/NUcstyM1gynTNN8=;
 b=BYFIj/VzOFvzB+0oWuwhjHzJu4G2do7TOSpkmlwmuzSG7iamTiQWSHkrbpiMnpezfFaZ+pu//gEx3Ir0ETuCJU9erwAzKRpH1+wwjFK5JlUdk2rS40qI7J5nrtNs2pZHTIMKbqw/9Lf68MD0dF1/RUH6peQ07937eyw2gUMzME4BGcTikxicWLsThaHxbAYK8LSED/eaLitcY1qAa2Vi60pA/59nMA+eyzn/bOxoJNdLgfqHs3C8uy5pyZSzTuWUfuJalEsrHRHDdYlfVpprIxvr4lDa2dq11v0dNPXrbrnPVWpRTNMuKwF6RhfhBC6VokIc9RSo9lRD//Bg4WHO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Wed, 18 Dec
 2024 11:57:34 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 11:57:34 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Thread-Topic: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Thread-Index: AQHbUIvtbGeU9Btf7USQIGmd/sEedrLrtFMAgAALNwCAAAe8sIAAHurg
Date: Wed, 18 Dec 2024 11:57:34 +0000
Message-ID: <BL1PR11MB55258BBC7DA922DF4D9DCC8C84052@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
 <55894817-9c88-4e95-b648-72e3f031e10c@linux.intel.com>
 <17f7620a-c797-447a-8eea-f9120e8af98f@linux.intel.com>
 <BL1PR11MB55254606B8D1785DBE18402E84052@BL1PR11MB5525.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB55254606B8D1785DBE18402E84052@BL1PR11MB5525.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-Mentions: matthew.brost@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA2PR11MB5036:EE_
x-ms-office365-filtering-correlation-id: 4328db73-4e8f-4341-299d-08dd1f5b28d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UXM0b25rVGM5ejg4N1pmdzB4MkI0VWNZMWM3WUgrd0RlekVWamwrYmdkVVc2?=
 =?utf-8?B?czlRelRxU0lrblQyU2FQQ1IxRkdBVEk4L28zTWI0K0t3VnRRVUlGekdRdDVT?=
 =?utf-8?B?WHN2b2tiVVdUTzhub09qc1JTN0VYS05BZmdjeG95Y0p0eWZsOHRlNHNiRDRQ?=
 =?utf-8?B?ekVwRWNXNzc3cm9zekgrbXk3SnJZVEtmaXdsZThXOWh6aXNLbFQ2N01EUVFL?=
 =?utf-8?B?Qjhoa2hubEpIY3RuQVJhNjhDczZ6YmNyZ1RtbWNtd0RGeEd1cVc5M016WGtO?=
 =?utf-8?B?WTNtQ3pCUndjcXpZRnU0czJIaHNsNlZYamJqUVh2dzdLM1dqV2RqcHNlU0NW?=
 =?utf-8?B?K09yVzhWTzFsNUNNL1VjaGR2Sjl6OTViSndDU0ZoaEtIV3JkY1U5bDhUc2dP?=
 =?utf-8?B?Y1M4WGprS0J1dFNBK0NuWTVQM2ZFUjhNSHVLbEg5WUE4QVQ3SGdwWUFMcXJo?=
 =?utf-8?B?d2d0SVA3MWRDM3pkOGlNNnYrZDVUdnRWNEg5bmJzWU9mUmxQZDNuUmRjTkI2?=
 =?utf-8?B?Y3h1NzRlYmtQM2RUUFp0cnBCRjQ0eTVpRCt0ajd5MTg3dzJlZ3BVU0hBTVEw?=
 =?utf-8?B?akFjbkx3YWlxYjRZaVBZaGt0QVBGN3FZQWx2TXVTWDRsRlIxdnhIbkJCUnRw?=
 =?utf-8?B?SjFndUNha0NkRlZPQ2U4aGlLVHVtWGt0aWNkUkxPNGdjZEhJVFJYdHJUNHQ4?=
 =?utf-8?B?eXZwZHc1OGg5cVZiUWhGQ0RObTc2eDFhN2l5WXdoMmVMMlFCK0ZFT0o0dkFQ?=
 =?utf-8?B?VkVzMmY0Uk1VNEZuYkRWa3BGdjVzeFdqK1B3RmxrZ0w5WFhsWVFCSXI2TVdR?=
 =?utf-8?B?SGt2MFFJMWZwVENpWlZERXp1UEtJNmNFVDhvcXU1WHZnTVZFNlJvQ1ZmUEx1?=
 =?utf-8?B?WkpINE5pTlhxOHY1YTNKZWF5V2M0RzVqUTI5NWlrNE5TUFE1WWFkNVdGTmk2?=
 =?utf-8?B?eHQ1S3dmMk9aalZyK2V6SUw3dDdzcmFSNmx4Kyt3VW11V3N2WTJacHBlZFVM?=
 =?utf-8?B?NzlSd3I0UElPMFY5UHBDYm13cFZ2d0l2cnRwQVdQSk1wZkw0YkhCSkJ5K21i?=
 =?utf-8?B?dWpVclg1YzUzcVFLRi9NWHF4cWU2L3IyOFQ4MUYrcGV5NTZBeVQwVUdKSnVx?=
 =?utf-8?B?eEpoV1FrM1B3VlAwZldHZklpZjhNREg0b1FFRzdJV3JPSndlUUswVFljZU9G?=
 =?utf-8?B?NlUxRWFnL1ovUGluMG1LRjdXM21sMmJHa2x1dHVObHZWaDY2OUpVaXZXY2Zo?=
 =?utf-8?B?NVUyNDlEckw2cG5laWRhcGZVYjFYcFRLWmYzRVhRWnRvbW5xeDc4OW5leVda?=
 =?utf-8?B?UXFHbG41b2RjN29XQXVkNW9YL3ZrdnQ1MG9WcjluOEljYWlndlFVS051MWs3?=
 =?utf-8?B?MkFpdndUOFplZko3WWlQUGJYRUZ5N3haRlkzeEE3RllUTW5LSUNOenI0U2Jt?=
 =?utf-8?B?dktxNktKSzdwUFBWUXp5K0VEUXpHVGdvWXVsa05WN0VjRGxVU1FnTitJM0tv?=
 =?utf-8?B?UVl5cHNLYURGaTRGZU5idUFzT3c2YTVrYTlCZ0NYTDlPMjhSTUNSU2h5VVBV?=
 =?utf-8?B?eWpRK3Y3aG0zSzVCOHQ2UFRVdEozOTFibC9hV0pYNk9MYURNWnFDSTNKeWZk?=
 =?utf-8?B?YW1Zd0Q4a3N5TS9ydDFNNkZkZUcyaDczVkJFODYyeHV6MkgyNGhZYnA4a3Y3?=
 =?utf-8?B?RWZlc1hsYnFUMTZ4blZvMzJ6UXZVYnFCaTAyZlZWVVZnVExwanN5a0gwUTIy?=
 =?utf-8?B?dEY5cUk5VGhKS0lVaktBVllvZWxuNlE2WmVsNTgwVDd5QVA0Zk5vMTRTZG9q?=
 =?utf-8?B?UGpRNysycHI1OEtQMk1UaEJ3em1zSDBGeW5XYXRWQzc1dzErcEd6c3JmMWQx?=
 =?utf-8?B?Z0k3MWhXa2N6SURhSytwbnpqOFRKNFZIamdtK0RkdUx3V1hIWGs3ZnZ2RFho?=
 =?utf-8?Q?ddBfN+28vGFbGTyMYTVCwcEpmGQacHTG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzNrbVRDMFU3dnNtV29oMUhXYXlFNDBSbDBGVFk3aGJHaE5UOWZaellBNDdv?=
 =?utf-8?B?dVFDV3lwcWhhVHpJd2ZYMHNEWVBtSTdTblZ5QU12UVMyWG9ERiswbVcwaXhy?=
 =?utf-8?B?dzQxcXpGdStPbElIVjQwOENaZWlnOFpUTjhGNnp1eGlFTmZkeS9raTZRVHhh?=
 =?utf-8?B?STczU2VkZG9RWE80UWNkYjNuZ21kNnQ0Qm5jSitLWGR1a0FaZldkdGM2aWVs?=
 =?utf-8?B?ZFRXYXhEZGpxVS9ndEF2MjYvdFhCbzB4UXp4UnNLODlobGNIUjBrbEVJdlcr?=
 =?utf-8?B?clY0cDdRWXROZmU2aCswczE3eUFxRVE5Y1lYeWo0QXc3QUhSc1BZdlZ5c0JY?=
 =?utf-8?B?bFA4VXBsWUU2eXR3TGlPY1JGRjE2bThuRkxQY084RVhpMnN2c3Q1UVRLeFlS?=
 =?utf-8?B?LytNSjRSMDVRZ1JhSmZ3T1VhRUxHb2ZsRzNKeWRJM2FmNnpNc3VEN1p5Smo5?=
 =?utf-8?B?bnFGN0JzY1lDZ1pmdFNGSGtBTjAyRjZPc0RMOG4wK0Y1NENnRmg5T3BhaXJV?=
 =?utf-8?B?TDBadGJsTnF3YkNxSWdGV0lZT2ZlWFJLbW9UL3NZOFM4UGU0M1ZXZ2VaTFdG?=
 =?utf-8?B?WkxJK0p0d29mQVRrOW5PbjhHWnN0UEFEdXp6RUcyL2RHcUxvMlhGYmI5eEls?=
 =?utf-8?B?aTR2SVJBQ2YxTHhhR1ZvZDM0RmJpMkducldjZElXQnVxdU5oVHZ1WVZqK1E4?=
 =?utf-8?B?dEpWRU5hWUltcGhsNDd6VFduZm5CNFVTTDNlOHBYbm04ZDJ5b1FObG8vSUxk?=
 =?utf-8?B?TEc2U1dHNDNmbHloNmJwT3FZQ2Z5M0lFUXVjazd1QnRlcVlqa0hVNnlFekpw?=
 =?utf-8?B?NFhoY2x2c2FJZUZXZzM4Q1RKZ3RFQ1NJcFNTVnNRa0t1dDdkV0tNOGtqeGY5?=
 =?utf-8?B?N09tVzhhT0dsVCtTU1NFc0dUbVVYUEdzMzFJMVpwTktramdERjRiSlM1ZkZ3?=
 =?utf-8?B?SkgwUml0KzJJVVp4Tlh6SUp4RHdHY3psQzBRUWRieTFWK29yKzdhbWhIdXlj?=
 =?utf-8?B?M2tSRHJKS2ZEUEtaTGVuTGdpemEvUnkwNjhRamdVdEdkSlF5QlIxSUg1MlZ5?=
 =?utf-8?B?WU5aclVsb0pXd25sdHpYTDlkRTFsdk52eDFmWVA2b0tEMno3Um9mSmFJbHFZ?=
 =?utf-8?B?M0RZRzBGTkN3V01YT0FzN0JKdmFuY0x1cWVSVlZteEREYXFyYkpLQWJsdGRp?=
 =?utf-8?B?b0RESFlleEhjY0lIVjRaUVYweVVMTFM1dUliY3BraDZseWVHa0Q5YVJYSGJv?=
 =?utf-8?B?NWwyMXNqZHZUeWwvK2kzcFZCVjFSNzNlb1R0Skk4dnNZOHE3Vzh0T2NvcGpU?=
 =?utf-8?B?eVJpQVl1ZmlYRjhhNVRnZzN0TEVyaXRsUFFPcnFwMHBlblgrYUZyNGhrRzV0?=
 =?utf-8?B?MGhZbFNWVnh2ZHZDUXZ6VmVWRnZYSjFBNE14MjBZd25YY3hnaGhUeXNTYWpi?=
 =?utf-8?B?QWZMZDJhb0J6ei9lQkNpMkdTQ0NoOHhXQmxBQjI1Z0ZtTWNhR0hVclhYUWxK?=
 =?utf-8?B?NXdLaXhRQUdzenpZY1c1TzcyUFBHMmFuOCtJS3d6dC9hRFErYXd4T0Q0Mmdh?=
 =?utf-8?B?dWs1eVVQZytoQis2SmJ1OGhYSTV5WFd0WWpCSWd6dk5ucXk4L0UrR2t4K090?=
 =?utf-8?B?RVJEaC9lU0xYQkhTV0QwNkpIYjVicHNyUXplRHhFVjdxUFl3d1p6bktKdzIw?=
 =?utf-8?B?ZGpmQzBnUjM4WVFNNHN5QS9oMks0TVV5d2tPTVhQaFRiNGIxNDI2ekE3MjV4?=
 =?utf-8?B?N2J3akFWbHN4RFBtMVM1MjVZMzhkb1ZPUjc0VHdpalhvcXRid1E4ak5vcDk2?=
 =?utf-8?B?SlJ5VGhTY29JUFh6M25QZ1BYd0JjZ2hSYnBKaFNzTi9RS2pwTjFMRFlNc0l1?=
 =?utf-8?B?WGFCUEV5T0hGY3I1QXpXYWxMQzUvWXVwRE81ZzN0ajM3eVBucDdaaEptUzdh?=
 =?utf-8?B?YkFlWTd4eXYwM2tveTU0YmlabG5xUVF3ei9SK3Rqd21XWnJ6cEoxdFFlendw?=
 =?utf-8?B?SmdzMWJZazRKZ3R1MGhsNkdLaGZDdWw0R0tneWNoc1IwclNweno0NjBvNXlF?=
 =?utf-8?B?NmZKZjFkcG1zTlVncmt4SnlieXhsU292dzlIanhTalFFaU9tM2VvQ2lVK1ZX?=
 =?utf-8?B?NDBrWTNidTdqNW5kSmRFeTdaTG5NUFdTUE1BR3paWkYrblZvQnRYaldtdTZ0?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4328db73-4e8f-4341-299d-08dd1f5b28d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 11:57:34.3160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pSuFh1+l1EMzSJxX41nyXmwAPj8CqyinDyb/ldZ2aOagci3/s+glVNsn4opnvA5JpHl+cJUcvnmz2Hs7DNnI21A5fjD3oBATFKh7jj4Z00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VycmFtLCBQcmF2YWxp
a2ENCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxOCwgMjAyNCAzOjQyIFBNDQo+IFRvOiBQ
ZXRlciBTZW5uYSBUc2NodWRpbiA8cGV0ZXIuc2VubmFAbGludXguaW50ZWwuY29tPjsgaWd0LQ0K
PiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjFdIHRl
c3RzL2ludGVsL3hlX2RlYnVnZnM6IEV4dGVuZCBndCB0ZXN0IHRvIGNoZWNrIGZldw0KPiBkZWJ1
Z2ZzIGVudHJpZXMNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+IEZyb206IFBldGVyIFNlbm5hIFRzY2h1ZGluIDxwZXRlci5zZW5uYUBsaW51eC5pbnRlbC5j
b20+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxOCwgMjAyNCAzOjA3IFBNDQo+ID4g
VG86IEd1cnJhbSwgUHJhdmFsaWthIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT47IGlndC0N
Cj4gPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MV0gdGVzdHMvaW50ZWwveGVfZGVidWdmczogRXh0ZW5kIGd0IHRlc3QgdG8NCj4gPiBjaGVjayBm
ZXcgZGVidWdmcyBlbnRyaWVzDQo+ID4NCj4gPiBIaSBQcmF2YWxpa2EsDQo+ID4NCj4gPiBUd28g
bW9yZSBjZW50cy4NCj4gPg0KPiA+IE9uIDE4LjEyLjIwMjQgMDk6NTYsIFBldGVyIFNlbm5hIFRz
Y2h1ZGluIHdyb3RlOg0KPiA+ID4gSGkgUHJhdmFsaWthLA0KPiA+ID4NCj4gPiA+IFBsZWFzZSBz
ZWUgbXkgY29tbWVudCBiZWxvdy4NCj4gPiA+DQo+ID4gPiBPbiAxNy4xMi4yMDI0IDE0OjU2LCBQ
cmF2YWxpa2EgR3VycmFtIHdyb3RlOg0KPiA+ID4+IFJlYWQgYW5kIGR1bXAgIGJlbG93IGRlYnVn
ZnMgZW50cmllcy4NCj4gPiA+PiBnZ3R0DQo+ID4gPj4gcmVnaXN0ZXItc2F2ZS1yZXN0b3JlDQo+
ID4gPj4gd29ya2Fyb3VuZHMNCj4gPiA+PiBkZWZhdWx0X2xyY19yY3MNCj4gPiA+PiBkZWZhdWx0
X2xyY19jY3MNCj4gPiA+PiBkZWZhdWx0X2xyY19iY3MNCj4gPiA+PiBkZWZhdWx0X2xyY192Y3MN
Cj4gPiA+PiBkZWZhdWx0X2xyY192ZWNzDQo+ID4gPj4gaHdjb25maWciDQo+ID4gPj4NCj4gPiA+
PiBTaWduZWQtb2ZmLWJ5OiBQcmF2YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVs
LmNvbT4NCj4gPiA+PiAtLS0NCj4gPiA+PiAgdGVzdHMvaW50ZWwveGVfZGVidWdmcy5jIHwgNDYN
Cj4gPiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPj4g
IDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+ID4gPj4NCj4gPiA+PiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwveGVfZGVidWdmcy5jIGIvdGVzdHMvaW50ZWwveGVfZGVidWdmcy5j
DQo+ID4gPj4gaW5kZXggNzAwNTc1MDMxLi5iY2JiNTAzNmEgMTAwNjQ0DQo+ID4gPj4gLS0tIGEv
dGVzdHMvaW50ZWwveGVfZGVidWdmcy5jDQo+ID4gPj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZGVi
dWdmcy5jDQo+ID4gPj4gQEAgLTE2Miw2ICsxNjIsMTYgQEAgdGVzdF9ndChpbnQgZmQsIGludCBn
dF9pZCkNCj4gPiA+PiAgCQkicGF0IiwNCj4gPiA+PiAgCQkibW9jcyIsDQo+ID4gPj4gIC8vCQki
Zm9yY2VfcmVzZXQiDQo+ID4gPj4gKwkJImdndHQiLA0KPiA+ID4+ICsJCSJyZWdpc3Rlci1zYXZl
LXJlc3RvcmUiLA0KPiA+ID4+ICsJCSJ3b3JrYXJvdW5kcyIsDQo+ID4gPj4gKwkJImRlZmF1bHRf
bHJjX3JjcyIsDQo+ID4gPj4gKwkJImRlZmF1bHRfbHJjX2NjcyIsDQo+ID4gPj4gKwkJImRlZmF1
bHRfbHJjX2JjcyIsDQo+ID4gPj4gKwkJImRlZmF1bHRfbHJjX3ZjcyIsDQo+ID4gPj4gKwkJImRl
ZmF1bHRfbHJjX3ZlY3MiLA0KPiA+ID4+ICsJCSJod2NvbmZpZyINCj4gPiA+PiArDQo+ID4NCj4g
PiAxLiBBcmUgd2UgY29uZmlkZW50IHRoYXQgdGhlc2Ugd2lsbCBhbHdheXMgYmUgcHJlc2VudD8g
SSBhbSBhc2tpbmcgYmVjYXVzZQ0KPiA+ICAgIG9mIHRoZSBpZ3RfYXNzZXJ0KCkgdGhhdCB3aWxs
IGFib3J0IHdoZW4gYW4gZW50cnkgaXMgbm90IGZvdW5kLg0KPiA+DQo+IEZyb20ga2VybmVsIGNv
ZGUgcG9pbnQgb2YgdmlldyB0aGVzZSBkZWJ1Z2ZzIG5lZWQgdG8gYmUgY3JlYXRlZCBvbiBkZXZp
Y2UNCj4gYm9vdCB1cA0KPiANCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0IGRl
YnVnZnNfbGlzdFtdID0gew0KPiAgICAgICAgIHsiaHdfZW5naW5lcyIsIC5zaG93ID0geGVfZ3Rf
ZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPQ0KPiBod19lbmdpbmVzfSwNCj4gICAgICAgICB7
ImZvcmNlX3Jlc2V0IiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9
DQo+IGZvcmNlX3Jlc2V0fSwNCj4gICAgICAgICB7ImZvcmNlX3Jlc2V0X3N5bmMiLCAuc2hvdyA9
IHhlX2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0NCj4gZm9yY2VfcmVzZXRfc3luY30s
DQo+ICAgICAgICAgeyJzYV9pbmZvIiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93
LCAuZGF0YSA9IHNhX2luZm99LA0KPiAgICAgICAgIHsidG9wb2xvZ3kiLCAuc2hvdyA9IHhlX2d0
X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0gdG9wb2xvZ3l9LA0KPiAgICAgICAgIHsic3Rl
ZXJpbmciLCAuc2hvdyA9IHhlX2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0gc3RlZXJp
bmd9LA0KPiAgICAgICAgIHsiZ2d0dCIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hv
dywgLmRhdGEgPSBnZ3R0fSwNCj4gICAgICAgICB7InBvd2VyZ2F0ZV9pbmZvIiwgLnNob3cgPSB4
ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9DQo+IHBvd2VyZ2F0ZV9pbmZvfSwNCj4g
ICAgICAgICB7InJlZ2lzdGVyLXNhdmUtcmVzdG9yZSIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19z
aW1wbGVfc2hvdywgLmRhdGEgPQ0KPiByZWdpc3Rlcl9zYXZlX3Jlc3RvcmV9LA0KPiAgICAgICAg
IHsid29ya2Fyb3VuZHMiLCAuc2hvdyA9IHhlX2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRh
ID0NCj4gd29ya2Fyb3VuZHN9LA0KPiAgICAgICAgIHsicGF0IiwgLnNob3cgPSB4ZV9ndF9kZWJ1
Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IHBhdH0sDQo+ICAgICAgICAgeyJtb2NzIiwgLnNob3cg
PSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IG1vY3N9LA0KPiAgICAgICAgIHsi
ZGVmYXVsdF9scmNfcmNzIiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0
YSA9DQo+IHJjc19kZWZhdWx0X2xyY30sDQo+ICAgICAgICAgeyJkZWZhdWx0X2xyY19jY3MiLCAu
c2hvdyA9IHhlX2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0NCj4gY2NzX2RlZmF1bHRf
bHJjfSwNCj4gICAgICAgICB7ImRlZmF1bHRfbHJjX2JjcyIsIC5zaG93ID0geGVfZ3RfZGVidWdm
c19zaW1wbGVfc2hvdywgLmRhdGEgPQ0KPiBiY3NfZGVmYXVsdF9scmN9LA0KPiAgICAgICAgIHsi
ZGVmYXVsdF9scmNfdmNzIiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0
YSA9DQo+IHZjc19kZWZhdWx0X2xyY30sDQo+ICAgICAgICAgeyJkZWZhdWx0X2xyY192ZWNzIiwg
LnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9DQo+IHZlY3NfZGVmYXVs
dF9scmN9LA0KPiAgICAgICAgIHsic3RhdHMiLCAuc2hvdyA9IHhlX2d0X2RlYnVnZnNfc2ltcGxl
X3Nob3csIC5kYXRhID0NCj4geGVfZ3Rfc3RhdHNfcHJpbnRfaW5mb30sDQo+ICAgICAgICAgeyJo
d2NvbmZpZyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPSBod2Nv
bmZpZ30sIH07DQo+ID4gMi4gV2h5IGRvbid0IHdlIHNpbXBseSBzY2FuIGZvciBhdmFpbGFibGUg
ZmlsZXMgaW5zdGVhZCBvZiBoYXJkIGNvZGluZw0KPiA+ICAgIGV4cGVjdGVkIGZpbGVzPw0KPiA+
DQo+ID4gVGhhbmtzDQo+IFRoZSB0ZXN0IHNjb3BlIGl0c2VsZiBpcyBsaWtlIHdlIG5lZWQgdG8g
Y2hlY2sgd2hldGhlciBoYXJkLWNvZGVkIGVudHJpZXMNCj4gdGhhdCBhcmUgY3JlYXRlZCBhcmUg
cHJlc2VudCBvciBub3QgaWYgbm90IGFzc2VydC4NCj4gYW5kIHRoZXNlIGNoYW5nZXMgYXJlIHRv
IGltcHJvdmUgdGhlIGNvZGUgY292ZXJhZ2UNCj4gRllJOiBodHRwczovL2ppcmEuZGV2dG9vbHMu
aW50ZWwuY29tL2Jyb3dzZS9WTEstNjc0ODI/ZmlsdGVyPS0xDQo+IA0KPiAtLSBQcmF2bGlrYQ0K
QEJyb3N0LCBNYXR0aGV3IGNvdWxkIHlvdSBwbGVhc2UgY29tbWVudCBvbiBxdWVzdGlvbiBhc2tl
ZCBieSBwZXRlcg0KDQo=
