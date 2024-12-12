Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE742E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 19:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6106F10E146;
	Thu, 12 Dec 2024 19:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqHc0C0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D81F10E146
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734033302; x=1765569302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cDGL8mFTg5RDYJ5P9QiRWtp+/Ua19eT4iuY8Gvjt4MA=;
 b=OqHc0C0ft0dQx1ypt1zSwhlGpRloOgPN6l+V9606KHwK2yRenI1pdTGn
 OKPbV6WIIrc4NkQHNobaOxA+zieCjOdghUDW/G4pKwQzOHrI7sQy5kpAI
 /+bsaqKMFOnsI054AaabfJArprKYLUfcJK7nITadQrg1tHbz5Kwd+7c8y
 RtpD6bLh68RpD+j99ZrAnTedODhWJO3e4nWrp7D3Q++ABSPt5qJwWOScl
 UHq84a3JFggxByEFVcY+NMATgPSh9imsLGxh3q5OeHGAKD2u344Agl8Yh
 sQw5dKnhX3UQ25CHiSYyr5ZrlOMe75n6w2pzjE7rOgl+u/QtRFAPsA2E2 Q==;
X-CSE-ConnectionGUID: 4JqA3ufORcGyGpwVq0dMoQ==
X-CSE-MsgGUID: n7H4lrd4Q++MWhnkVvl97Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33799073"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="33799073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:55:02 -0800
X-CSE-ConnectionGUID: 21PJndeMTlCMDtAsF7BJig==
X-CSE-MsgGUID: lm9pCy5mT/+wadrTD4AJCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="101422454"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 11:55:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 11:55:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 11:55:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 11:55:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9PJXH/Id/jsfzrsW76IDMSeKNRD54oVU/4wU3pdpWym57EtsaJ+j+xpdiLc/1Rwtr3JBiduKmc4OZBxYAxqUzGJongZvIox1m+g57+2U6RqEPsHWLlE74nsqeNNCSEjrVa0C0ny1ZXkWn0JYgcIm9lXmSw7/2LRTHu5ZnTMYAQ/mEf84UwS72W6aMT+JlvTw5blwO9t5fjP49F1kRwTQyvmabTUlZFSY7mjvSoMKOMa+URXxK78CFdajYbJcn2fEGCKVOfI+gWUxuHiyHtsIHE/Z3hhpnmj4hP4sON4UliJVB0YAK6OmHJfcSlOAiIrkdxmu/bSYD7eXMRSI5znUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDGL8mFTg5RDYJ5P9QiRWtp+/Ua19eT4iuY8Gvjt4MA=;
 b=YWP8tuVPaWPJR3JGGP7DMNdfeeRlwnzc7Kr9Ow9vgTUe7FGFxkfAccnDHWIvqKstJt0gnJ82IV+uk3Ki+N2vRpe0E263TWw3xhxgoME+I+H76dRoTBNh3SxWm3yxIRpQPHZXMxXjCk0b9oOyCUUPKd38LIMBK+rWXc0DkNLD1o95TmeBe8A1OnpWQvfU6sfaZe0B+a5vzzQBsfaPXk0gAlQ/Op03bWSh5iajbQXF4taj8TCOyFI5fZvhya6L2qTLcDg1ee8FhyhTskGV7VJIiZBfZ6a/q176a6M7mdzmQJosy1ona7IS5RtBV65TXypNO/EOa0lz3HHbqByWQGAwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Thu, 12 Dec 2024 19:54:58 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 19:54:58 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
Thread-Topic: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
Thread-Index: AQHbSDJ/rULFXyfQPE6WCBrh40ledLLhog0AgAFs/QA=
Date: Thu, 12 Dec 2024 19:54:58 +0000
Message-ID: <f48def4f702c6353e4cfd7012a7e606aaaea4762.camel@intel.com>
References: <20241206225911.465603-1-zhanjun.dong@intel.com>
 <c4b8b102d50c8cb81524c8d2b5335201c4bc4bb8.camel@intel.com>
In-Reply-To: <c4b8b102d50c8cb81524c8d2b5335201c4bc4bb8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB6684:EE_
x-ms-office365-filtering-correlation-id: c3a53682-21c0-462c-ff49-08dd1ae6dba0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bzVTL3pmUXNlWGpKTTQzZUhpMlRvWVhjZXBnVEJDZzdML1lPem5od0t6cGJK?=
 =?utf-8?B?aXRycTVHajRkVnJrZUpxUkZzMkZLTXJUQjNFY2NxWkhqWGFWY0VrSVVwVG5t?=
 =?utf-8?B?Rmw0YlVwWXdKejg5Q1oxZzJBY0hpeStJbCt0aTRuSjJQRE5mb09KRjFGQk1M?=
 =?utf-8?B?U3JjWUlja0ZTWHJsZGNlWWFDYkY4TW54UXNCcjZYRnJJWUdvc1NuVE1kYVlN?=
 =?utf-8?B?aDRmSWgva3lsUUpBOHZyR3NjMW44OHJSenRVWHc0dHZLeUhLK1pqaHVLckpW?=
 =?utf-8?B?NVBwcVdsQVhnMTRaRURjNi8vMVpIeHltTTgzdDRyUmRPOHhhQmpzZTR1RmYz?=
 =?utf-8?B?OFhzazFDQlpHbnl3R3h0NXlNU2FXN3BOVytCUi83c2xpOS9qdkEreGExajV0?=
 =?utf-8?B?QnV2eUtlbmgxdHYvaEhjcm1uSHNPMnFjeWlPSG1sRjNDWElFL3RIazYyQVdE?=
 =?utf-8?B?Zng4WUJOSUw4U3dIVnV1SEpOWGJsbVBuYTZrNEZrUnRnQWpUVlIzWWphbE9G?=
 =?utf-8?B?MmRnV2VudjhuaHp3ZkZNRytLZjh4azFaQVBwZXIxLzJWMjVUbVJoampLZEpJ?=
 =?utf-8?B?di9oR3JubXhCd05xN2taa1M4M2hWQUtCT2FFRjlaU0dDaWNvM3lqTGE3N3RV?=
 =?utf-8?B?KzVyekVVbkRKVE1UV3lSek02ZjBZcXU4RnhyRGRLcmJqQnpkRVlhTTJSRTZC?=
 =?utf-8?B?Qm9HWHZhWjdoRzIrYjFSekhEcStYWUpsbnJqazRhVE44YkVVZmlwd0ZMRHV2?=
 =?utf-8?B?bktEUE4yZUJuT2JlYWJ3L29ZTW5jRWE4UVB1RE42RVVnTi9RTFNhTWtZa1hR?=
 =?utf-8?B?cUtLZit0eXVzZVFUem9iakhkWVl3aEJRUU1uSWxXZVFJdjlJamt5SEpaSlM3?=
 =?utf-8?B?QXhrTWJ4ZzZ4ZW95WXdXNzFoY2tyaTA0MU9kNnRTOEgyK2thRlArUFczN083?=
 =?utf-8?B?TUtTMTUrQkFIeHNSREFBLzRUZlBKVUx1WnQ0dkdnOERvdldCeWVBUGpKMWsz?=
 =?utf-8?B?WDhJT2tnVlQzazhjNGZCTmVmWW90Z21pa1l1TmRkMUE1dGdjQ2kzSTd5Z2RO?=
 =?utf-8?B?MGRuOHZ1SUp0TGx5WXJURjFrdnBCY05vRmRBeE80aUhPakNLZzFHejU3VjlK?=
 =?utf-8?B?Qm9SVWxIRDFpdU1xN2Uxc0k0U2hkZFp6UkxVeThNYm9lYVR2bTQ5WHRxdm5j?=
 =?utf-8?B?TVJpdzA4N1gxcnVFVEI1bFhPMTU1czZZUVN2UHhYSnBTVy9UT3MzQnl2WlRR?=
 =?utf-8?B?UkRMQktLcUVnOVRyMzFNck1yV0NzbGNqRnZtcHFxaW5tZEpWL3FheFMxZnps?=
 =?utf-8?B?MUFMTXdLZ2dVYmZkYnkrSzR1TzBWSFgyRWFCb1VwdnpWeHVTTGpmTEw3UFcx?=
 =?utf-8?B?V2dNN2RpczZSNFAxNXI4ZmtESW5VR0tYWncxWmhJbTc4MzY5d2h3dGtHQmpJ?=
 =?utf-8?B?aFRQeXJjVTU2QmZ4MUI4aUQzUkJlUE53dDhYQ2RIbituZEVCTG8rU2VWNGdJ?=
 =?utf-8?B?U3QvVFRNYXpLK1RpQVFxWVFlenZ5MkkvOER6YXppaDJGM1h6c28zckRxeHFs?=
 =?utf-8?B?QWs1UmNJamxGVVpndllKRDZ1cnVaZEhvUWZTUm9sZGRPRHBXOGtSUGk2T2Nv?=
 =?utf-8?B?Tll6UFBpUFZUeHpkdWtlUzhySVFVRlJFVUFhazBQN29iQ1RoWWp3UU5yVW42?=
 =?utf-8?B?bEVzQnJBODNLSWQ0OXpKY0JPMnJQTWQxcVBWZU5VMUx1R0RMM2NXSmRsYUlP?=
 =?utf-8?B?WGMyZ2dILzZKZkF6eFNMcEJOczRKUDBNWDhZaU1yTnRFaVJwM2ttWTBFUmRv?=
 =?utf-8?B?TXBrVklrckJiaFdnQnd6dno5L1dHWHRKV0ZMSE9sQnVQSGZRRlpPNkxPbmRv?=
 =?utf-8?B?dWkzSnJHb29iQXdidVlGeDlkUkp2Rm56S1NlVU5iY2FXakE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkNGMVdYTDVIMGFOdzFYZFMyWEpOY2JndWx2N2pOaVU5d3NjYkpWWFdDMlN1?=
 =?utf-8?B?WHg5Y3dHSFAycUhPWTR1VjZaWjJTWkl5c25IVFdSRFhOcE0rSHpmUzUzVHRD?=
 =?utf-8?B?cVRNNmZjL2RBeW5MeVdMV1ZwL3ZhNmo0L0xONE9XcjRMcFU1ajdlRFExUzA0?=
 =?utf-8?B?TU5pQjhtZ1dqanJPckpFZ3pjUlNjc3hlVTZCdDBOeXdHNHptVkM4THl6RERY?=
 =?utf-8?B?QUtrN0EwWlZZOXNycWhzRUdnMEU3djMzTmpsT3M0N1FVMkFDanJ1UUlWVHpl?=
 =?utf-8?B?WU9WYjNoekhBc2xyc0JOY2hUcEtiNXlwUmQ0U2N2emJQZ0J3S0hJcDMzWkZO?=
 =?utf-8?B?L245emxMSSsvOUY5cG5zd1hDbFY2L2huYXVsN2VjNE5DMTJicGlBQU52cUda?=
 =?utf-8?B?TGJaY29HdDEwVWZlR2lBbmNWLzY1ekUvWjl2WTRNQ29DVDJKOUw0ZTZ6WCtK?=
 =?utf-8?B?eFNpak1tNDlTb1drazAxbjZjMSt5bEcvWWdtU21GTGVyc3k0ZC9WK1FkNVV2?=
 =?utf-8?B?OGtpWkorZzM5cjJFU291Ym4vU0VXZ2dqVzEzdDRESkpJSG9oRzB1blgyd08v?=
 =?utf-8?B?TWhjZ3gzZk1tRDMyNVJ3K1lnVkIvc0laT3owbzFBbGxVOHVjVzhBcTlOdWMw?=
 =?utf-8?B?ajFKa2orc1BxTjNNWExnbEFaZldRMCtYeU83dTVOZHRzTk03MXNmMDA2cCtU?=
 =?utf-8?B?cmFkU095TDRzNTQ2Uzk2bkJWbktOcCtJWXJMdFRmbFJDU2E3UjRrbzdnRmwv?=
 =?utf-8?B?VVg5aWY3dkZoVG5DUVk5ZDRrSVBXRFdqNnpLZkVkRytqRVdZRGdwVVd1dGtN?=
 =?utf-8?B?dzc0QWpmS1YxUks5YXkva0dpL3VKRURhUjBDN0JvM2RvWklNSFJGUkZXNlA3?=
 =?utf-8?B?NlhyYkYxbkFMTmdveUIzR3RyT0xWVVoxSzlUbG1SeHN2Y3lXSXhUcHVLWmNV?=
 =?utf-8?B?bkUwUTRLRXhMQnJtZTk4MFhJT3Z4NzBoV1J1UzdieEVVTU5obkMzK29NVlEy?=
 =?utf-8?B?dDdmQ0pQNFY5ZGdKSmlCY01TMWM4RUJINUMyK2hYSlBIZitFQk03a0Y5ZnQ1?=
 =?utf-8?B?c3dmRkhGcDUwd0xyeGtDeW5WQWdVN3BpN0RhbUg2eDZ6T2phNmsxZHdQV0tQ?=
 =?utf-8?B?Vkh4eklLOXZoa0NDM3NQK2tTd0N2TVpnSndoZ1RWRTAwbGhsR0JKNkZ4ZS9D?=
 =?utf-8?B?NXAvZllSNUd4Q0tGa01yNHZLL3F6d1NNLzd4cDF4UG5peStvc1BCVUVpSzVO?=
 =?utf-8?B?QUZJTUpBMUx1d0d1WTdHTmlOTzZ3TDVZU1NpWGpTOW9XdzFQcHZTakJmWXow?=
 =?utf-8?B?UXNYZHg1OXovQmQydnpjSHduMTU0TjJzcCtpZU8zUTBpU0NWVkIzZXF4UHNE?=
 =?utf-8?B?MWhoS2Z0M3BNYXQ5aWNvZzV2OHFNMjNMbXI1K25ncjloN2RqNldYZzRybzlJ?=
 =?utf-8?B?MEs1TFlJdXJtZ3ErQ1VScHV0OGZKQkREVFNFSS9vNklzaGZ3djJveFgzTUJx?=
 =?utf-8?B?MzNwc3RSV0REN29oZUEwb0twcFNWbUpsSnhhdExTY1NxdHlpR0dqSEdvcVZq?=
 =?utf-8?B?RTJ1ck00Tk1mcmkraUpseFp6TDZnUVlrUUx3WVNHTVl0OTV3TWo2RVdTQlBU?=
 =?utf-8?B?QWRvOHV6ZGZOUnpIY2pvK3pOZHdZL2E2WlpmajJ2MFQrTktSZ0JVUDVTb3Ju?=
 =?utf-8?B?a2ZxTUdwa0pDM0c3aU9EcUtkRHVvczFVY3ZBOTdvdHZGSkZOVlV4dkRsM3lO?=
 =?utf-8?B?K0lEbU14bzNURVVHUUJwWmFta0VUK0ozM2JXZzJXL2xDYzY5bVl6VVFORE5w?=
 =?utf-8?B?UVRJZ3F1cUtIV3hSYjZJdGtOdVp1Ujd1OW9hSUZVWG5sRmdyKzdZNThmbUxv?=
 =?utf-8?B?d1ZjTzhPSnRWZUtZbXB3a20rRGNOWkJwTUY3WnNkZG9INDI0aVJFU0JrcFcx?=
 =?utf-8?B?S0lid0FQVVNTS2dHNFgrMmpJdzdGejV0R2djRy9hSWNCR2RJZyt1bDVxOS9J?=
 =?utf-8?B?VzVBc2VsYXlSTU1ORFYwZkxDOVA2R2UxWGVudjdMTmpSR08xSGFrSTlGVkIz?=
 =?utf-8?B?TjB4QUx4a3U3NnhyMzloeXFNUE1wQ21TRE5xRGJEcjdLczhXTkt4c0VLaDQw?=
 =?utf-8?B?NHYxTlFhbWJaT0lxTll6TmxiSUs1VlJ3b0wwWlJhSHpXWld3TmNvd1pqUEZ5?=
 =?utf-8?Q?vBrhLZNjWMKf4jz9Wex9x70=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C35A39D63E04F42A531D59AB4F3E543@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a53682-21c0-462c-ff49-08dd1ae6dba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 19:54:58.5729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQdeD1yExbWFNDfxSWGBWTGQMe4yNJ9hluNXeqBMTGG48WNmbOMngJWVNCO4q2srAHc4O7oFMWHF6R5hzVFm/3GLXNK8vcg63uzD4OZ0B91Qak3+u9RZ38iEjbSX9I4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6684
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

ClpoYW5qdW4sIHBlciBvZmZsaW5lIGNoYXRzIHdpdGggS2FtaWwgbG9va3MgbGlrZSB3ZSBuZWVk
IHRvIGV4cGFuZCB0aGUKaWd0X2ZpeHR1cmUgc2VjdGlvbnMgYmVmb3JlIGFuZCBhZnRlciB0aGUg
aWd0X3N1YnRlc3Qgc2VjdGlvbiBhbmQKc2F2ZSB0aGUgcGVyLWVuZ2luZS10aW1lb3V0cyBpbiB0
aGUgaW5pdGlhbCBmaXh0dXJlIGFuZCByZXN0b3JlCnRoZSBwZXItZW5naW5lLXRpbWVvdXRzIGlu
IHRoZSBsYXRlciBmaXh0dXJlIGJlY2F1c2UgdGhlIGZpeHR1cmUKc2VjdGlvbiBpcyBub3QgYnlw
YXNzZWQgZHVyaW5nIGFuIGFzc2VydC4gVGhhdCdzIHdoYXQgaSB1bmRlcnN0b29kLgpUaGF0IHNh
aWQsIHdlIHdpbGwgbmVlZCBhbm90aGVyIHJldiBvZiB0aGlzLiAKCk9uIFdlZCwgMjAyNC0xMi0x
MSBhdCAxNDowOCAtMDgwMCwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToKPiBKdXN0
IHJlLVJCLWluZyBhZnRlciB0aGUgcmVjZW50IGFkZGl0aW9uIGZvciB0aGUgY2hhbmdlIHRvIHNl
dCBlbmdpbmUgZXhlY3V0aW9uIHRpbWUgbWFudWFsbHkgYmVmb3JlIHJ1bm5pbmcgdGhlIHRlc3Rz
Cj4gb24gZWFjaCBlbmdpbmUgaW4gb3JkZXIgdG8gbGltaXQgdGhlIGV4ZWN1dGlvbiB0aW1lIG9m
IHRoaXMgdGVzdDoKPiAKPiBSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRl
cmVzLmFsZXhpc0BpbnRlbC5jb20+Cj4gCj4gCj4gT24gRnJpLCAyMDI0LTEyLTA2IGF0IDE0OjU5
IC0wODAwLCBEb25nLCBaaGFuanVuIHdyb3RlOgo+ID4gU3VibWl0IGNtZHMgdG8gdGhlIEdQVSB0
aGF0IHJlc3VsdCBpbiBhIEd1QyBlbmdpbmUgcmVzZXQgYW5kIGNoZWNrIHRoYXQKPiA+IGRldmNv
cmVkdW1wIHJlZ2lzdGVyIGR1bXAgaXMgZ2VuZXJhdGVkLCBieSB0aGUgR3VDLCBhbmQgaW5jbHVk
ZXMgdGhlCj4gPiBmdWxsIHJlZ2lzdGVyIHJhbmdlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBa
aGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+Cj4gPiBDYzogQWxhbiBQcmV2aW4g
PGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+Cj4gPiBDYzogS2FtaWwgS29uaWVj
em55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2Vz
IGZyb20gcHJpb3IgcmV2czoKPiA+IMKgdjk6LcKgIFJlZHVjZWQgam9iIHRpbWVvdXQgdG8gMiBz
ZWNvbmRzIHRvIHNwZWVkdXAgdGVzdAo+ID4gwqDCoMKgwqDCoMKgIEFkZCBpbmZvIHByaW50IHRv
IHNob3cgdGVzdCBpcyBydW5uaW5nIG9uIHNpbmdsZS9tdWx0aXBsZSBHUFUKPiA+IMKgdjg6LcKg
IE1vdmUgY2hhbmdlIGxpc3QgYmVsb3cgLS0tCj4gCj4gCj4gYWxhbjogSSBqdXN0IHJldmlld2Vk
IHRoZSBkaWZmZXJlbmNlIG9mIHRoZSBsYXN0IHR3byByZXZzIChkaWZmIG9mIGRpZmYKPiBmYXJ0
aGVyIGJlbG93KToKPiB3aXRoIHRoYXQgY2hhbmdlLCB3ZSBob3BlIGl0IHdpbGwgYWRkcmVzcyBL
YW1pbCdzIGNvbmNlcm4gYnkgcmVkdWNpbmcgdGhlIGV4ZWN1dGlvbgo+IHRpbWUgZHJhbWF0aWNh
bGx5LiBJSVJDIFpoYW5qdW4gY291bGRuJ3QgZGVzaWduYXRlIGFueSBzdWJ0ZXN0IHRvIGRlY2xh
cmUgcGFzcwo+IG9yIGZhaWwgd2l0aG91dCBlbnN1cmluZyBtdWx0aXBsZSBlbmdpbmVzIGFyZSBl
eGVjdXRlZC1vbiBiYWNrIHRvIGJhY2sgc2luY2UgdGhlCj4gdGVzdCBuZWVkcyB0byBlbnN1cmUg
dGhhdCBYRS1LTUQgaXMgY2F0Y2hpbmcgdGhlIGNvcnJlY3QgZ3VjLWVycm9yLWR1bXAgZm9yIHRo
ZQo+IGV4YWN0IGJhdGNoIG9uIHRoZSBleGFjdCBlbmdpbmUgd2UgZXhwZWN0IGl0IHRvIGNhcHR1
cmUgYW1pZHN0IG11bHRpcGxlIGJhY2sgdG8gYmFjawo+IHJ1bnMgb2YgZGlmZmVyZW50LWJhdGNo
ZXMtc2FtZS1lbmdpbmUgdnMgZGlmZmVyZW50LWVuZ2luZXMuICh0aGUgdGVzdCB1c2VzIHRoZSBy
aW5nCj4gYnVmZmVyIGJhdGNoIGJ1ZmZlciBhZGRyZXNzIGFzIGEgd2F5IHRvIGRpZmZlcmVudGlh
dGUgYW5kIGRldGVybWluZSBwcmVjaXNlbHkpLgo+IAo+IAo+IDI4YTI5Cj4gPiArI2luY2x1ZGUg
ImlndF9zeXNmcy5oIgo+IDM3YTM5LDQwCj4gPiArI2RlZmluZSBDQVBUVVJFX0pPQl9USU1FT1VU
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMjAwMAo+ID4gKyNkZWZpbmUgSk9CX1RJTU9VVF9FTlRS
WcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJqb2JfdGltZW91dF9tcyIKPiA4M2E4Nywx
MDkKPiA+ICtzdGF0aWMgdTY0Cj4gPiAreGVfc3lzZnNfZ2V0X2pvYl90aW1lb3V0X21zKGludCBm
ZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSkKPiA+ICt7Cj4gPiAr
wqDCoMKgwqDCoMKgwqBpbnQgZW5naW5lX2ZkID0gLTE7Cj4gPiArwqDCoMKgwqDCoMKgwqB1NjQg
cmV0Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgZW5naW5lX2ZkID0geGVfc3lzZnNfZW5naW5l
X29wZW4oZmQsIGVjaS0+Z3RfaWQsIGVjaS0+ZW5naW5lX2NsYXNzKTsKPiA+ICvCoMKgwqDCoMKg
wqDCoHJldCA9IGlndF9zeXNmc19nZXRfdTY0KGVuZ2luZV9mZCwgSk9CX1RJTU9VVF9FTlRSWSk7
Cj4gPiArwqDCoMKgwqDCoMKgwqBjbG9zZShlbmdpbmVfZmQpOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuIHJldDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgeGVfc3lzZnNf
c2V0X2pvYl90aW1lb3V0X21zKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmVjaSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgdGltZW91dCkKPiA+ICt7
Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgZW5naW5lX2ZkID0gLTE7Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqBlbmdpbmVfZmQgPSB4ZV9zeXNmc19lbmdpbmVfb3BlbihmZCwgZWNpLT5ndF9pZCwg
ZWNpLT5lbmdpbmVfY2xhc3MpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X3N5c2ZzX3NldF91NjQo
ZW5naW5lX2ZkLCBKT0JfVElNT1VUX0VOVFJZLCBDQVBUVVJFX0pPQl9USU1FT1VUKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoGNsb3NlKGVuZ2luZV9mZCk7Cj4gPiArfQo+ID4gKwo+IAo+IC4uLgo+IAo+
ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIFRvIHRlc3QgZGV2Y29yZWR1bXAgcmVnaXN0ZXIgZGF0YSwgdGhlIHRlc3Qg
YmF0Y2ggYWRkcmVzcyBpcwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB1
c2VkIHRvIGNvbXBhcmUgd2l0aCB0aGUgZHVtcCwgYWRkcmVzcyBiaXQgNDAgdG8gNDYgYWN0IGFz
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGNvbnRleHQgaWQsIHdoaWNo
IHN0YXJ0IHdpdGggYW4gcmFuZG9tIG51bWJlciwgaW5jcmVhc2VkIDEKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcGVyIGVuZ2luZS4gQnkgdGhpcyB3YXksIHRoZSBhZGRy
ZXNzIGlzIHVuaXF1ZSBmb3IgZWFjaAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBlbmdpbmUsIGFuZCBzdGFydCB3aXRoIGFuIHJhbmRvbSBudW1iZXIgb24gZWFjaCBydW4u
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjb25zdCB1NjQgYWRkciA9IEJBU0VfQUREUkVTUyB8ICgodTY0
KShlbmdpbmVfY2lkKysgJSBDSURfQUREUkVTU19NQVNLKSA8PAo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFERFJFU1NfU0hJRlQpOwo+IDQxM2E0NDAKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgam9iX3RpbWVvdXQgPSB4ZV9zeXNmc19n
ZXRfam9iX3RpbWVvdXRfbXMoZmQsIGh3ZSk7Cj4gNDE3YTQ0NSw0NDcKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBSZWR1Y2UgdGltZW91dCB2YWx1ZSB0byBzcGVlZHVwIHRl
c3QgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zeXNmc19zZXRfam9i
X3RpbWVvdXRfbXMoZmQsIGh3ZSwgQ0FQVFVSRV9KT0JfVElNRU9VVCk7Cj4gPiArCj4gNDE5YTQ1
MCw0NTIKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBSZXN0b3JlIHRpbWVv
dXQgdmFsdWUgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zeXNmc19z
ZXRfam9iX3RpbWVvdXRfbXMoZmQsIGh3ZSwgam9iX3RpbWVvdXQpOwo+ID4gKwo+IDQ2MGE0OTQs
NDk1Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGln
dF9pbmZvKCJSdW5uaW5nIHRlc3Qgb24gbXVsdGlwbGUgR1BVXG4iKTsKPiA+ICsKPiA0NzNhNTA5
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9p
bmZvKCJSdW5uaW5nIHRlc3Qgb24gc2luZ2xlIEdQVVxuIik7Cj4gCgo=
