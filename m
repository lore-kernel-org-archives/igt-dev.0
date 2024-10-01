Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31A1CE837A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 06:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694D410E0C9;
	Tue,  1 Oct 2024 06:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/+j6fQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF6810E0C9
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 06:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727763662; x=1759299662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=apcVP3IQBHlXK2Ax/mmUlJ9wobq9yxoWHi5gwsHr5As=;
 b=R/+j6fQNn/+MBIjGolYUUQH7ybE7tLeZ605xgJJghd7sFwzP0+6dBZQk
 VGpW20XtNmVaCPCCltjUr2Djx7c/suLPlEahjbI6N0VXbn0z+nBJ3h2NH
 j+OBQNWVMl2CD1FtVuaghNuh0RmHZ4VDKHWUdr03+X2mG2TdpuFgK1SzP
 rUwBCciuoDMMt6ny63x6iCL2uC0lPUYwwHJSZrO7CjGuC293UlTjHhCHC
 FlQXThHw6VJNFvE2F3MaP+adiRAblwLkpfzB2OVtdZdXOwxhxnlImitx4
 tK+jm9Nhf4TRaQIA4fOyM7CK1naJ+g4XItXdCLZ0jPepPaOicZUm98+0f Q==;
X-CSE-ConnectionGUID: AIMqPsmrTQ2IPtER9t7Efw==
X-CSE-MsgGUID: qxcxwj+sSl+yve5HSae5MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38269668"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="38269668"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 23:21:02 -0700
X-CSE-ConnectionGUID: fO+pTkOtRtKKxaRu0bsSMw==
X-CSE-MsgGUID: /7FZuzohTby+lFRP6jfzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="104330637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 23:21:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 23:21:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 23:21:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 23:20:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXd4cc4tR11IUgaO43kBKvwnhLslpdvgop4X3I12sw+9MWmJariN32Aa48Ulho4Z0/+OkXXnqGn5/HsSbCxSOMbjJ59sxj8IrA+RZxYyMvvZXCV70bj61QBa/9Zwh7+tPY4FeAi50SU+fxeVKzPsm1+/K6nDsb/PBT8ZFz8xeFKp/0R+Xo4pPpimjV2N5JOZzqVSEJ7rdK9WZGin+SEyuruHgPQ+54OeGyDBLoYTAOMuyvDJ01AuHwTY6NYubwfCJUT+4BCGyjHEvlMbnCg2ppBLE7E/LF+cbNZthq75iqmhVcsrPSeYREMP3xx3MgarnAKoszhH1bhGoV1ZHeUWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apcVP3IQBHlXK2Ax/mmUlJ9wobq9yxoWHi5gwsHr5As=;
 b=mH40YX/twJTyqnKUAXvVKqX74kZIqr0xOCwPGfP0V0xkwAzqBDlQHoFM3ygh3Q/d5dE58ewzTJYFZ1bDmmPyQ+N1fqZMZwgAiAp0aVfVItGDiThLLcnHx8XcJHxFXZwkmyJsgdz5+uaL+0wlFcIZkSDGVEzZBC3mCJd1thglix0uSMIbCobH8cpQTRRwWjnqomyrK25tVlIz7p5rXfe8dLUFO0LwcNTY4Qj0FWZ07jYGq65+KT9nv1dy7nJGQxqHSq6Lh6G0iCiZYVOg4dVqX8QxjgalYgt9JHt2Tv+m/0kCEBfYuih8HDViVxk3A8Daaqn5Oj2s/oVerfefSWvcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.26; Tue, 1 Oct 2024 06:20:55 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 06:20:55 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 2/2] lib/igt_psr: Assert on sink/source state
 mismatch
Thread-Topic: [PATCH i-g-t 2/2] lib/igt_psr: Assert on sink/source state
 mismatch
Thread-Index: AQHbD+KETzbtynb0PEuekAjPpdGOBrJxdDow
Date: Tue, 1 Oct 2024 06:20:55 +0000
Message-ID: <DM4PR11MB63124F8355DDE4CBE3BA612D90772@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240926070517.1326936-1-jouni.hogander@intel.com>
 <20240926070517.1326936-2-jouni.hogander@intel.com>
In-Reply-To: <20240926070517.1326936-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6332:EE_
x-ms-office365-filtering-correlation-id: 70f6c613-ab72-4b70-a966-08dce1e134df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K0I1Sk5CRTYxdTJQM3FqRm9obGtxUVZaMGR3WUx2U0dLMXViMFpLbWdXNUpR?=
 =?utf-8?B?WDJoQlRaWnQyUmowTktxNEl4QkpQejI5cGZVUk55WkNGS0dPdlRIQjFkZE1M?=
 =?utf-8?B?MGVaZjh3ZUZBUGZxM1BwRGlJTlZ2cC9JeStadUtXUzh4V2d3YS9wamliaVJM?=
 =?utf-8?B?Y0U5N0FKU1d5MlZQODJJZ3lJaFpHbXdnbUVzUUtuNjFpSGErRDNoSFJoQUVJ?=
 =?utf-8?B?aWhvT2s2OXlleFAvbHcyVDlqSi9HRFlzb0dEZkhSdjQ1SUwvT3JldHVTTXUx?=
 =?utf-8?B?SnJ6c3l6ZTNlT1AyUnFMZGFsK2Jxa3ZhQnVTZmJjYjFaOU5qUnVXU0V2OVNE?=
 =?utf-8?B?aE0vSVZScDZzOVVOeDlTbXYwVEcvUGlXZ1U4bFNtMEd4cU1ZYnFSUG0vdEtD?=
 =?utf-8?B?cjY0cG1Ma3JqaVlEa2x1dHFSa0VHN3U3MEE2R2dvUUtQbm5ES2Z3WnRTYkJM?=
 =?utf-8?B?M0c4SllWRTJoZ21xeG9xbE1LVFZFWUtxYlNhM0gzenpBODU4ZW1LUDZBK2VS?=
 =?utf-8?B?aVJNWm5KTkJlbldYK3ZnZ1ZDMXFJSGxoK0dwS1JhcXpKRk5IcDdBUEtHTXdh?=
 =?utf-8?B?VkdqUDF5eng4eG5LVVNsakZtRnJ2OThNVVhRcHIxTlkrRUw1aVJlOGp2NTFj?=
 =?utf-8?B?Wkd2UnJLaSszejN6MkVhQVVSSkM0OE05ekp5SGtlcDFKY1dEam9HamxzeENs?=
 =?utf-8?B?YTlxcFR1anlaejFob1YrNGFFSU1URUxoeHVkdDZ3TWlzTi9vaWJsazdldTlP?=
 =?utf-8?B?aExVeUd6cEZiWVdlSUEzcnVtZE00V0VWSUs5a3o5cVRXbExXWFAzTk4wY1FT?=
 =?utf-8?B?UEVaTVVLS21ha0ZWOFFHa08zemVNNnZPRXcwcy84WXRXaEF0WUl5RkJOa2pw?=
 =?utf-8?B?UUttOEhsVWh5ZHozR2RjVnZYRFpGSHkvYk13NlI5KzlodCtBUjNsb3ZiTUd6?=
 =?utf-8?B?eUJnT05KWlV6aXBheE9qcS9kcjZUdnM2Wno5TkM3SUc2Qys5RUcvWkc0aVlt?=
 =?utf-8?B?cjgweTZsZzRyN3hZa3NLKzJkbDNsYU5rZTh6WGxnclJrZXBHVmJpWjYzcUYw?=
 =?utf-8?B?OCtCTVdJVUo5OWZRV21jaFVqSjgyY2JnREV2cVFEZ3FKU0xMZy9teEpkNzZW?=
 =?utf-8?B?ZHVQWkpGb0tuNUs4NHQ5S0czRHZkZlNtV3RvUlRwNG4rTUcvLzhqNHFNZXkv?=
 =?utf-8?B?ZTdMVXJ2NzVXNjBTWitvWW9PWGJ0S1VYcE8xS1ZyWmlpNjhmYURJQnpMZUVV?=
 =?utf-8?B?VnVyT2pLMk5HNm9rZGI0YVhTVk1qZ3k3dk5NdEgwcktsZlMzRmwrcFBMZ1pl?=
 =?utf-8?B?YVBDeVZZUGJDTlNlMnpXTVJXbjRkVWhlYnpaR1pYeDBMTGNPU3hmTEVLVXI4?=
 =?utf-8?B?OThRWTVmTWNTbW8yYnJYeXBHenVBQlJ1Z3R3S0hra2RzTHdleVhZNnZyRU9t?=
 =?utf-8?B?cVZweEhTaEg5cm85dmtVZVozaHU0ekcwR0ZqL1MxcUxPQjRQODJSdnZQbDdy?=
 =?utf-8?B?STBxcjRXSEkrL2lWdGVsSzUvZUJrNlZ6QVBIcXZ2bVNQWlFENUpsRS8zUzdt?=
 =?utf-8?B?RU52OXZyWWV6MXVxRmh5YTBKTEhnUElaNTZrd3BUTVVXS3B5cXc5L3FWUHpE?=
 =?utf-8?B?NW9MZ3U2UmQ2MUx1Q1hNckh3VVhSUXNTK1VTMUN3djZxMTVWN2F1dkNERGZ2?=
 =?utf-8?B?TlZIRVlheW9JOXpZb2lxaWt1WVlxV0N3Z2VDa0FyOGsyVngwcVI2ZnZYTDdH?=
 =?utf-8?B?dWhYZ25LWlZqdGtUd0gzcHk3SFg2cVczWmx5bVl0ckM3SjA0cFlMelNFWE9H?=
 =?utf-8?B?WXZEdlc5UUE3UGJZTDdrdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVNuNEpNWnc2UnpFSEEweUFHUkVhV0F1RXhlN1djUDlhRHRKT3NjY0txcjlO?=
 =?utf-8?B?TnBOU0FXT25uWWsyYlJ6MmV0cjlZQ1hISHBrTFl4eUlNdThFWEdsUytUWWhk?=
 =?utf-8?B?dXJiT2pSYkI3VzBpUEFqUHM4SXg2NklJOTVTUnJvcWd5dXFmWGgyQnBLbml4?=
 =?utf-8?B?Qzg5SSt3OE5iNXhQTEdmOUhxNUZ0OWRSQmIyY3VUN2ZoeTYvdktpOVhqTkpH?=
 =?utf-8?B?L3o1VTloWCt2UTRwR3FFNm1wMUZ2K2pwbFptRS9uSlBoWjlnQ2VCRUp3RGpY?=
 =?utf-8?B?Y0NvYjRJL0FGd3JyNHlHWXd2Y2dmdnJBYnZVdjAyNWU0RlRuRzBROU1acWFp?=
 =?utf-8?B?NE1TSlZuaGVNOE4ya0NZemwxWEtLdjdlQWxHSjVpZGlORGljbU54cGhRRW1v?=
 =?utf-8?B?YnhMbzB0SDVGd2V2cjZTWmlwSHRJaGJleGFDZHQxR2d5bUMzVUR6VHVUZHcz?=
 =?utf-8?B?dFpnZEcvc0dhM0piZmYxUVpPK1VQMzlUZ1hSWVYzdGhQSk5Tb3NEU3loV01z?=
 =?utf-8?B?QkxQNkN3cTBTLzNQdzVoSWxObDEzUGdLQmNqa05kWTRFSFp1REZyQ3loUnI4?=
 =?utf-8?B?cmpCeExlaldtbUc2WkxOWW1yK0Y1UDlhaWgybDhPUVp4S3JRN00vcVZ1MklM?=
 =?utf-8?B?bkdCMzl2SGlhV1JNTlpMRUlsMzE3OVFWdjZMMmVPbjgyT21xclZXVVpISWtE?=
 =?utf-8?B?Q2ZNSmNMTWVBa1YwZldGZlFzZk5iQVlRSlJSajZNZ3k1ZjJtYmJyR1ppZ2Rh?=
 =?utf-8?B?czVuVC8ybnlVUW5FS2JuSVpOOFFEb0ZlaTI1Ylk1eGFPL05xclNoR01GSUhY?=
 =?utf-8?B?Vm45SE1SNk83S3A3aysrSzFSMDBNTnV4dmdrQm9GbzdPa201elgyYzd5eEhT?=
 =?utf-8?B?Z3lQTW43TWE5QUVCWHB0WTJOM3dqTWZ6cENDYXhLV1lHRFpBQ0hMWHVyTUM0?=
 =?utf-8?B?K2hNQzhaclFiWWZtR2ViV2YvSWNJQ3FtUHlhbk5ZQ1lBVGxPUGZ0UUczSEhp?=
 =?utf-8?B?UTRoRjYvcExQcHpJNGZoc3A0OFd4UW9jeEs3RmxLWEFWOVgwcWt5Z09XSTFU?=
 =?utf-8?B?S0psVk8vVTY0dEdkZzdqbUpyM3pPUnB3NEg3MkFwRVdDcTJaZDhCY3F0U3Ir?=
 =?utf-8?B?ZkFzbFl0c20ySFFDS1FtdnJyaWJDTkVNOFdhaTVTYzNKTDBsMVFpZXo4Y2Qv?=
 =?utf-8?B?NVZKeUEyUmtGZFBYQldySWI5ZEJrWTVFOWxwWDFEUmd1enlGZnAxWG5jbGRy?=
 =?utf-8?B?UThTemhXTnhYVWJjREZLdVJtSi9obHpPNUc5bEhubVprdFl6ckc1a0lmSmNv?=
 =?utf-8?B?REx1amoxVEkrN2FwVlpBRkg0RlJBZUNPbjRHeHBha3Z6TFVhd2ZtQWxyUDhZ?=
 =?utf-8?B?RjBXdVVLNmxCT3FMbDZFb25HK3Y4MXUyYUg3VXJlVi9wUW9wcU5jU056eXBa?=
 =?utf-8?B?dlE2V2FONHBScnlJeXFWNDhHQmxZYnkwZnRYYjJ2ZDVyYXJHUmwyRUwra08r?=
 =?utf-8?B?OE0rYmM1cnhtc1pRQllOQkR0bXFJSUp2QUMyZ2ZxOGdKUW9NSGpoZ0h4MmtB?=
 =?utf-8?B?K2l2S3drN2F5ZndyUW8vSk9SZGpXeUxKVGhKZVVmV0Ftb2dubnA2SmtnQllx?=
 =?utf-8?B?UTdvZENUemxhcHhUVDkvN2pDQ29VQUduMGZlK0N5a3UzcDVOUk4vVDBIYnFT?=
 =?utf-8?B?dndRNTgvZUZQVit1dVV0dkxyWU1vOU0xL01zZUQrTURaaWkwSlZCb0JmKy9z?=
 =?utf-8?B?SWtVTEVMTGtBYURDUlBvNE1tOFZpcjRJc01TUnVCeCtqQjV6SFBOK09WRW9B?=
 =?utf-8?B?SWNFYlc5Mm5Kc3RiOUZDTDNWSmlGNU16TnYzZ05hb0gzaXVENFAxaTRBVDEx?=
 =?utf-8?B?ZlNPUDYxSVdZVXJUUFFwNk14cmFRZDR3NU80NlZpV1gxZ0lMdW9FNDBTZm1F?=
 =?utf-8?B?MkkzVTNiNTJHcWpZajViYThUZ2NEVnV3WEMySTBNckQ5eFRJc3RZdGoySDVI?=
 =?utf-8?B?MU44V2NsSEVRS2pGRURnMnBoTDJ6bUhiSmJ0NmtSbUJyTmpSM3ptUWJzZUhw?=
 =?utf-8?B?SDFGV2MrZFV5Qk1uWUc3M1lIczF2OTJqa1BaWXdiMFY5Q2NNZGhtc3gwZEJK?=
 =?utf-8?Q?tKjk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f6c613-ab72-4b70-a966-08dce1e134df
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 06:20:55.0699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vC3JnuhTIOk8NR2Xv/HBDIwUnI0t5j0wNM9lr6vITqQ/M/mlcQG5HIllbVjD6DZ3iiNIYA1KQ0aFH80LcIZX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
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

TEdUTSANCg0KUmV2aWV3ZWQtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pDQo+IEjDtmdhbmRl
cg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI2LCAyMDI0IDEyOjM1IFBNDQo+IFRvOiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmFsYWRhbGEsIFJhbWFuYWlkdSA8
cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaQ0KPiA8am91bmku
aG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMi8yXSBsaWIvaWd0
X3BzcjogQXNzZXJ0IG9uIHNpbmsvc291cmNlIHN0YXRlIG1pc21hdGNoDQo+IA0KPiBBc3NlcnQg
aWYgc2luayBzdGF0ZSBpcyBub3QgUFNSIGFjdGl2ZSB3aGlsZSBzb3VyY2Ugc3RhdGUgaXMgUFNS
IGFjdGl2ZS4gVGhpcyBtYWtlcyBpdA0KPiBlYXNpZXIgdG8gaWRlbnRpZnkgZmFpbHVyZSBkdWUg
dG8gc2luay9zb3VyY2UgbWlzbWF0Y2guDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7Zn
YW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X3Bzci5j
IHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMgaW5k
ZXggOTYzMzg1OTY3Li4wZWIwMDI2MzMgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4g
KysrIGIvbGliL2lndF9wc3IuYw0KPiBAQCAtMTE3LDggKzExNywxMCBAQCBzdGF0aWMgYm9vbCBw
c3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtDQo+IHBzcl9tb2RlIG1vZGUsIGln
dF9vdXRwdXRfdCAqbw0KPiAgCWFjdGl2ZSA9IHN0cnN0cihidWYsIHN0YXRlKTsNCj4gDQo+ICAJ
ZW52ID0gZ2V0ZW52KCJJR1RfUEFORUxfUkVQTEFZX0lHTk9SRV9TSU5LX1NUQVRVUyIpOw0KPiAt
CWlmIChhY3RpdmUgJiYgb3V0cHV0ICYmICghZW52IHx8ICFhdG9pKGVudikpKQ0KPiArCWlmIChh
Y3RpdmUgJiYgb3V0cHV0ICYmICghZW52IHx8ICFhdG9pKGVudikpKSB7DQo+ICAJCWFjdGl2ZSA9
IHBzcl9hY3RpdmVfc2lua19jaGVjayhkZWJ1Z2ZzX2ZkLCBvdXRwdXQpOw0KPiArCQlpZ3RfYXNz
ZXJ0X2YoYWN0aXZlLCAiUFNSIHNpbmsvc291cmNlIHN0YXRlIG1pc21hdGNoXG4iKTsNCj4gKwl9
DQo+IA0KPiAgCXJldHVybiBhY3RpdmU7DQo+ICB9DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
